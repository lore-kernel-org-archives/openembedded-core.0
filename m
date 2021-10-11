Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FD7C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9636.1633945274567164998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pQL3M5uc;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id m22so54260670wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i6PQgNoCC+SpZ6ChshmVSV6Hijtzjx/+djw2jxEh8WU=;
        b=pQL3M5ucOZrfqkVnM9ncbcQuUlKuk6jhMt1eJUKpW1fOOmiyFqTkZiW0XjZJLswvsi
         rWf4oX0E/cGst3K5vpk6Bu/otCB596/JrHteyc9fkKIDl/Regv+HpgCERK62P8h2GJHy
         bb/bJhAwqpQNiOGV8xT65kVkOP8eTLqIrS7jbem0XPQeWVlDP2WrrMWZ3oseSzfG+vjJ
         P/pJ166Y1plTuVLTmcf2e3/QdBbdoaTYAGIQulhRKYDbgqLekd1IW3HDqSvZBryz9W4g
         XiZD0zjJboqLz2YYU967fjuZ/UHJXixUKEjciYvhCNjJlrIXA6d+SoEYE6fRmpfSylB1
         psSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i6PQgNoCC+SpZ6ChshmVSV6Hijtzjx/+djw2jxEh8WU=;
        b=GkSq+44sQE+MOx4nKt1UBehxAspvWG1OLqc5Up32g67oAHuU8EkfPHcKoOJ43yAh9Q
         cBxpDTWvZvVIWvaWdb3KoBAJATqrwNgJ5ogRoXXsrRABA6wQ3XNKDZ9YGxhPry7Lmwt/
         NTAx+McGeq+FqiGsrnb+JWhOEfg8U68f8iv2Om3RFNenUvtTCIeb6J66vHkRwso3LH6Z
         eECWRO+eSR4LI83kgVTyWsst+Us5JHfMpfCR6BTcjxr/wNzSMDyCqe8z3g/HPyipoJF4
         EfTfYetE60v9icZugERG8gulUB3XesObb8LW8GF7KUIS466WT7Ig0PCu4clSNVIAmfrv
         rXdA==
X-Gm-Message-State: AOAM532B5GstaEyZ6s3C/jYmsJ0NRbLyPteoH2WFU2bKbkqIPpLeWGat
	0FGLFiEiX6cdiEMYhBsTmoDlf4sgKNY=
X-Google-Smtp-Source: 
 ABdhPJyyYAp6wqcH+EpNpw4ehQEqtQT4V72/qVMsantcnlfqy/Ox5HS+rTpwS23KgClGb8LAmBHwiw==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr22932002wrd.24.1633945271621;
        Mon, 11 Oct 2021 02:41:11 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 13/25] bison: update 3.7.6 -> 3.8.1
Date: Mon, 11 Oct 2021 11:40:47 +0200
Message-Id: <20211011094059.4184654-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156828

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Use-mapped-file-name-for-symbols.patch | 62 -------------------
 .../bison/{bison_3.7.6.bb => bison_3.8.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch
 rename meta/recipes-devtools/bison/{bison_3.7.6.bb => bison_3.8.1.bb} (93%)

diff --git a/meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch b/meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch
deleted file mode 100644
index 568ee4df193..00000000000
--- a/meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 2a3db4e3b8d33bad5577c2fcfe124ee7a202ef4f Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Mon, 15 Feb 2021 20:39:57 -0600
-Subject: [PATCH] Use mapped file name for symbols
-
-Applies the file name mapping before exporting it as a symbol. This
-allows the symbols to correctly respect the --file-prefix-map command
-line option.
-
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bison-patches/2021-02/msg00014.html]
----
- src/muscle-tab.c | 4 +++-
- src/output.c     | 8 ++++++--
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/muscle-tab.c b/src/muscle-tab.c
-index b610d0b8..3e7657ca 100644
---- a/src/muscle-tab.c
-+++ b/src/muscle-tab.c
-@@ -204,8 +204,10 @@ static void
- muscle_syncline_grow (char const *key, location loc)
- {
-   obstack_printf (&muscle_obstack, "]b4_syncline(%d, ", loc.start.line);
-+  char *f = map_file_name (loc.start.file);
-   obstack_quote (&muscle_obstack,
--                 quotearg_style (c_quoting_style, loc.start.file));
-+                 quotearg_style (c_quoting_style, f));
-+  free (f);
-   obstack_sgrow (&muscle_obstack, ")dnl\n[");
-   char const *extension = obstack_finish0 (&muscle_obstack);
-   muscle_grow (key, extension, "", "");
-diff --git a/src/output.c b/src/output.c
-index 391d8e65..34dbc671 100644
---- a/src/output.c
-+++ b/src/output.c
-@@ -531,7 +531,9 @@ user_actions_output (FILE *out)
-           {
-             fprintf (out, "b4_syncline(%d, ",
-                      rules[r].action_loc.start.line);
--            string_output (out, rules[r].action_loc.start.file);
-+            char *f = map_file_name (rules[r].action_loc.start.file);
-+            string_output (out, f);
-+            free(f);
-             fprintf (out, ")dnl\n");
-           }
-         fprintf (out, "[%*s%s]],\n[[",
-@@ -629,8 +631,10 @@ prepare_symbol_definitions (void)
- 
-           if (p->code)
-             {
-+              char *f = map_file_name (p->location.start.file);
-               SET_KEY2 (pname, "file");
--              MUSCLE_INSERT_C_STRING (key, p->location.start.file);
-+              MUSCLE_INSERT_C_STRING (key, f);
-+              free (f);
- 
-               SET_KEY2 (pname, "line");
-               MUSCLE_INSERT_INT (key, p->location.start.line);
--- 
-2.30.0
-
diff --git a/meta/recipes-devtools/bison/bison_3.7.6.bb b/meta/recipes-devtools/bison/bison_3.8.1.bb
similarity index 93%
rename from meta/recipes-devtools/bison/bison_3.7.6.bb
rename to meta/recipes-devtools/bison/bison_3.8.1.bb
index c85ae049766..a6159b007ab 100644
--- a/meta/recipes-devtools/bison/bison_3.7.6.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.1.bb
@@ -11,9 +11,8 @@ DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
-           file://0001-Use-mapped-file-name-for-symbols.patch \
            "
-SRC_URI[sha256sum] = "67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf"
+SRC_URI[sha256sum] = "31fc602488aad6bdecf0ccc556e0fc72fc57cdc595cf92398f020e0cf4980f15"
 
 inherit autotools gettext texinfo
 
-- 
2.20.1



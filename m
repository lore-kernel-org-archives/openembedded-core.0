Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F589C36000
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.2946.1742323142068188859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lf50qsid;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so6681886a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323141; x=1742927941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=lf50qsidNEFpeHumNsdtXRzsvhVROWL5W9AMS19qtumPyFwjL/pkcu5LG6sPa8+28L
         cseWTsyGeRMebW6eQWVUBUg8hLdBo7x4AtZcXnkIyosZ5QDHGlbVJw3bJ+9yU/p8A6bw
         hJKnd0Va5V8dN1s7VE0JRwiqY9ZyJaCXDKl78Lsx7TAGydaHXeLt5g5g9XBb97Lokfn9
         LLr9THpAvhHaQet0LNIxz3dNKYNUOfJnlz2dTQNIitCzZIT3+4XmaNsMyynIWbLMjVdx
         M3MTEm2H9MjLT/4m5VMJV7KKw4TyP1XMR69lG1UWCz2tMpxkmX162toh5WunKRCX3ae4
         ii4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323141; x=1742927941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax+aVWiUr1vKokyCy6KsuxLt8SS/aV0dFC7ojI1gB0M=;
        b=iu6kXzmo6BpO8dqH1rf5ywxzxyFd+X/XNFD2Bao9i4IxK1YZw6O/NpMk9jmBUZuIbG
         4mJiXuTwFh+HTd3EIe3tD7hOTePMX6422tsKoLNl85ubeVSy8VgMeFrbqIrYne6Ke9G/
         MoUoZ+o6+G4/POvBDPpTqgYpWUOoFDcgoyEDF1MyJHNX0Xx0xJabB4TDZZAdO5c8r3wn
         nzYMlYS/YjeC5kZcqlslp6Fs8IVmGhR1jArsdoVwGOSecrH3mGn7ZVaCpPb28tWYFbGb
         4Gllt7QWx46BUTGQ3XDahotzKbknLqw0VBEuPPEc0ar1PKJ6QFGetRlIPal5VLCsFHiU
         G9nQ==
X-Gm-Message-State: AOJu0Yx5KgJsyAjHaxYVBAKihHhPs+Lt80ttLWiTplEujgJwP8FsGgk9
	6bOQxKkT9BtxzAdB/Q2eQo+z9m5wSgNj/VYgdjam6/XLxJr839yKYdInPA75
X-Gm-Gg: ASbGncucs55vuL3iVEImE4mOMu+pdLNZClhlCnPCnxuRWLtkGILZcOSwF34TvqO38iB
	bg+tq7uYFig7XO8/9r9Wy+VsH1F8fbj6Uinh3Dp3U1sCSDqKFbujlJg+MVWOs3S7EkF5/4rGgRL
	5mTuKZKCbADlcKC+OS8QUP4o2RBK4GK4gloemWEf7DB4HzDObJdrq9r//mKGcUQDJetb2NwXc+M
	qDvXTu5J34Gb+7V/jW2GDFJax35siOcY+12b6wJIhp0LjadGPNnJN1tgs7qly/DMoWFFgC5va5j
	MgS3719Arsh8zg1GSJEq8bQaGGPBO0U60m1B
X-Google-Smtp-Source: AGHT+IGWl9EyyPsi8ClvOwtocgw6viTENnSC7Tauc+bIqu2bGOo/ROumONbm1lz7+SPTH8ij7az74Q==
X-Received: by 2002:a17:90b:4c86:b0:2f4:49d8:e6f6 with SMTP id 98e67ed59e1d1-301a5afed94mr4429363a91.3.1742323141261;
        Tue, 18 Mar 2025 11:39:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:39:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 20/25] cronie: Resolve build failure with GCC15
Date: Tue, 18 Mar 2025 11:38:35 -0700
Message-ID: <20250318183842.2256284-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213246

Fix function prototypes for C23 to work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../make_error_func_prototype_complete.patch  | 41 +++++++++++++++++++
 meta/recipes-extended/cronie/cronie_1.7.2.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch

diff --git a/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch b/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch
new file mode 100644
index 00000000000..71f0153ec6f
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie/make_error_func_prototype_complete.patch
@@ -0,0 +1,41 @@
+From 09c630c654b2aeff06a90a412cce0a60ab4955a4 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tmraz@fedoraproject.org>
+Date: Mon, 18 Nov 2024 21:02:30 +0100
+Subject: [PATCH] load_entry(): Make error_func prototype complete
+
+Fixes #193
+
+Upstream-Status: Backport [https://github.com/cronie-crond/cronie/commit/09c630c654b2aeff06a90a412cce0a60ab4955a4]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/entry.c | 2 +-
+ src/funcs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/entry.c b/src/entry.c
+index 586eb9d..a2077e8 100644
+--- a/src/entry.c
++++ b/src/entry.c
+@@ -90,7 +90,7 @@ void free_entry(entry * e) {
+ /* return NULL if eof or syntax error occurs;
+  * otherwise return a pointer to a new entry.
+  */
+-entry *load_entry(FILE * file, void (*error_func) (), struct passwd *pw,
++entry *load_entry(FILE * file, void (*error_func) (const char *), struct passwd *pw,
+ 	char **envp) {
+ 	/* this function reads one crontab entry -- the next -- from a file.
+ 	 * it skips any leading blank lines, ignores comments, and returns
+diff --git a/src/funcs.h b/src/funcs.h
+index 427e027..f28d634 100644
+--- a/src/funcs.h
++++ b/src/funcs.h
+@@ -89,7 +89,7 @@ char		*env_get(const char *, char **),
+ user		*load_user(int, struct passwd *, const char *, const char *, const char *),
+ 		*find_user(cron_db *, const char *, const char *);
+ 
+-entry		*load_entry(FILE *, void (*)(), struct passwd *, char **);
++entry		*load_entry(FILE *, void (*)(const char *), struct passwd *, char **);
+ 
+ FILE		*cron_popen(char *, const char *, struct passwd *, char **);
+ 
diff --git a/meta/recipes-extended/cronie/cronie_1.7.2.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
index 496ca39fd71..b250717ab81 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -17,6 +17,7 @@ SECTION = "utils"
 GITHUB_BASE_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
+           file://make_error_func_prototype_complete.patch \
            file://crond.init \
            file://crontab \
            file://crond.service \


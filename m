Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FC3C36011
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.43708.1742834029554702371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jU2Y8eKv;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227aaa82fafso33994735ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834029; x=1743438829; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nj02LD1ogxvmlcRq1IouGCmf+6Qp/eQVg92ww/2Rnh0=;
        b=jU2Y8eKv2ijDX+ReR2bcbljaEoZZ1EVoWeCnjG5jO8BMoqH9eOK6idNLZUHXWconsj
         gEelzuoxNaohVjuzRSF2psVF8VQh11bU0SWq/IyrWlzPd4s8FLj2CYh3suM69gXcSaYm
         5EARamw5Wv2qd1jGJ03ikf0qjoCUs1+4isxwOu+7i69sKdUdbYYq28RhPquEPbN+H5AD
         8cWSYafHKnsxF1ng/K/FckpmyYQodAtTrvRGOGB6LZum+/SSK2Ul5JT/zVl4U3QGhTmB
         mjvOZiut6LM5iUKAdsoloPUFuySvE5FRSZEugju2OVb24dQ/5RY93VtXa65sMIx1dOTI
         bAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834029; x=1743438829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nj02LD1ogxvmlcRq1IouGCmf+6Qp/eQVg92ww/2Rnh0=;
        b=ZvJhP8A/8TtitjvaXCj+RHoEj2jGYnXiyHmE1j7+is/r5Nx5DmlTN56loQMlKVfe91
         TNTjf9ddL89vB3E2NOpOtdDLRlKJmxic3nlcQ07y9bxm8joBcSjYqQItkzwUSUthbp7l
         qwe8Ng638oliM+Xzy6ZsIHw4I+r1JZTwLFNkSvx3Bx3jF+hv+Plec4oVKdh3BK0gOktt
         F4TTm/zlP9GfKZTzKIRuNGFBDsEeRCAJUdU9HkQDg80q3WZ4HQR/a5Us/mKo9x0bL0bZ
         XbZsgZ7RYpTrQc9CJEuo8FofQRNbkv+VVCuq6dZJFr9tMbZFpwGTZst2xOnoEQxexqjg
         Xweg==
X-Gm-Message-State: AOJu0Ywe8AjT6sHHABiIcxrIXBRRYmBWhZ/zhCq0bayl+MqVMN4LhafW
	yU8qtlMP4mdwnagYoHDzeDQMQ5lj5BZWxtXlXzxesFrqHg0aVWgNlJK4MiLL
X-Gm-Gg: ASbGncvMI5KJRF/sewcY0xPLNWruX7kkClsAmFmnepIoAOVcfYXN0ePjoMxw3pyuVTa
	62loUHm7GLLF8YucXavHU3URMPiNsCRNPJlilx8NjxL7fXb0Sj+hSqygcUqpLdj4gYhwH7XJbVr
	ucBX8QuXYYrOYT5QepSN0zC4cWIkkgwV//fTOiq6utpPGOZQbYPPK3J7DMlGfdQKWxLGESvyIQC
	rbpr4LD6RLZYA/+UtYt4ZYwmmUOl+MfY5FiZWejvjqezofPPFEJy5gbbUoEfFnrvwxwoYqhVpgS
	83P4GMDfT1MSIw2LFsEH12GgIh+seoZK40gx
X-Google-Smtp-Source: AGHT+IEjHbzObU0p0fXSlFkNtDhYA8mgRA3svGumeITrvF1oRTuGcTRv4G/Z2K8l/tHl925Yqyuspg==
X-Received: by 2002:a05:6a20:9143:b0:1f5:9016:3594 with SMTP id adf61e73a8af0-1fe42f2d3bamr24779314637.18.1742834028799;
        Mon, 24 Mar 2025 09:33:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:28 -0700
Subject: [PATCH 07/21] which: Fix build with gcc-15 on musl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-7-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213539

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-getopt-Fix-signature-of-getenv-function.patch | 39 ++++++++++++++++++++++
 meta/recipes-extended/which/which_2.21.bb          |  1 +
 2 files changed, 40 insertions(+)

diff --git a/meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch b/meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch
new file mode 100644
index 0000000000000000000000000000000000000000..e006d797d3c4eb412ba0c9f87c73027bf9431afe
--- /dev/null
+++ b/meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch
@@ -0,0 +1,39 @@
+From 16a1647fc26953fab659de5f55d4c0defdfb894f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 17:56:19 -0700
+Subject: [PATCH] getopt: Fix signature of getenv function
+
+This happens on musl systems using GCC 15
+
+../which-2.21/getopt.h:106:12: error: conflicting types for 'getopt'; have 'int(void)'
+  106 | extern int getopt ();
+      |            ^~~~~~
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/which-bugs/2025-03/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ getopt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/getopt.c
++++ b/getopt.c
+@@ -209,7 +209,7 @@ static char *posixly_correct;
+ /* Avoid depending on library functions or files
+    whose names are inconsistent.  */
+ 
+-char *getenv ();
++char *getenv (const char*);
+ 
+ static char *
+ my_index (str, chr)
+--- a/getopt.h
++++ b/getopt.h
+@@ -103,7 +103,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int, char * const [], const char *);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index 77861370e5bf3358365081033d2027e01e999249..c6142759e55565ce5715e378c13b91371bcdd605 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -18,6 +18,7 @@ EXTRA_OECONF = "--disable-iberty"
 
 SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
            file://automake.patch \
+           file://0001-getopt-Fix-signature-of-getenv-function.patch \
            "
 
 SRC_URI[md5sum] = "097ff1a324ae02e0a3b0369f07a7544a"

-- 
2.49.0



Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id AFE937BD64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:55 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k15-v6so5627215ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kfW/zf9VHcYb+BBXmFbTXsz39B2h7rhPlVs+LroqwJM=;
	b=a5VisleHq+z+809Hq6qOJpk6HRTdeGP7PkZtBR7FSahfbACysfVo3yC6SJU1FwqGcV
	i2B3P+8NjtEj5qzh7WrtzTy48H+y9OP4/5Kpc5NSEtMIDqmld1pfjqV/jZ3ErHd7/+Qc
	Zh/xkcY8EG+eyEKimuq2GRt5G5FvyWJaOXDn25VzrJSIRoP+m7+MS3JxvBJ6s6AncD7Q
	h1QMYaQzVh34JICigcxFoWcMu2m54QnSAqb4Hovl+TPs3EYI/9LJiRS8cAjwul+1rKaX
	ica7UizhK+NDr0kLL/aBpgTzDehAH9LyeqCTOSjPMV+cFdqSXF3q+Xoctn3RJkCIqMrk
	rztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kfW/zf9VHcYb+BBXmFbTXsz39B2h7rhPlVs+LroqwJM=;
	b=Cb1UtnGxn0njntobPb44DZQGMfmz35CZCux5Wb8qnWuz/QK7na9Mj3QIa8D9Amlz8f
	zqLgDF8wFisBfb+YCHE1ouPIW6Tw1k4LeqRPJohPOjWPl+9ghFvQEqG67n7LWiBG2D9f
	j20707X9d4IxrNQd86sFb3UZGG3hibhc83V51YcpjbIQZGFqPvq0MKarRSH+IjnoshFE
	zNg+HyVSwE2wsfA5reO/PA+Xm6tTII1btBCOEbucdFpZrqcHgRVfX/C7vaRcY4RIKs76
	iB/GEZUAPUhl51i+BdkwbJvKCJi9RhB+aVkKAVumXXBrd82jYJH0d/bPJlbzMU5BXG/A
	WK2w==
X-Gm-Message-State: AA+aEWZQoQ3Hn2GaAiqTs0nhIAQ1pgsyrzIAiZ8FY4BUo3BPdQeFPWnm
	HZVHnVZ2jcMW5UJIK7aOj+RUzI6v
X-Google-Smtp-Source: AFSGD/V8oE1cHT+dfBWoXssvyB0XeVsq/A6++/jiYOy/4OVSRjm2A/agbKTSsfjuSAQGMdY4NxrMGw==
X-Received: by 2002:a2e:3218:: with SMTP id
	y24-v6mr2604773ljy.157.1544810156033; 
	Fri, 14 Dec 2018 09:55:56 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:55 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:42 +0200
Message-Id: <1544810082-22164-14-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 13/13] gcc-7.3, gcc-8.2: Use variable SYSTEMLIBS_DIR instead of hardcoding it for ppc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 17:55:56 -0000

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc              |  1 +
 ...werpc-powerpc64-Add-support-for-musl-ldso.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-8.2.inc              |  1 +
 ...werpc-powerpc64-Add-support-for-musl-ldso.patch | 31 ++++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0050-powerpc-powerpc64-Add-support-for-musl-ldso.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index c7c88f1..e16d03f 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
            file://0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch \
+           file://0050-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
            file://no-sse-fix-test-case-failures.patch \
            ${BACKPORTS} \
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0050-powerpc-powerpc64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-7.3/0050-powerpc-powerpc64-Add-support-for-musl-ldso.patch
new file mode 100644
index 0000000..b0c735b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0050-powerpc-powerpc64-Add-support-for-musl-ldso.patch
@@ -0,0 +1,31 @@
+From 3f5f5da776be86b408a15f38c9782f2185f97073 Mon Sep 17 00:00:00 2001
+From: Serhey Popovych <serhe.popovych@gmail.com>
+Date: Tue, 11 Dec 2018 02:30:50 -0500
+Subject: [PATCH] powerpc/powerpc64: Add support for musl ldso
+
+Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
+---
+Upstream-Status: Inappropriate [OE-Specific]
+
+ gcc/config/rs6000/linux64.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 619e113..ee8b44f 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -421,9 +421,9 @@ extern int dot_symbols;
+ #endif
+ 
+ #define MUSL_DYNAMIC_LINKER32 \
+-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ #define MUSL_DYNAMIC_LINKER64 \
+-  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ 
+ #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 866a775..206e157 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
            file://0039-Fix-for-testsuite-failure.patch \
            file://0040-Re-introduce-spe-commandline-options.patch \
            file://0041-ARC-fix-spec-gen.patch \
+           file://0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch
new file mode 100644
index 0000000..b0c735b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch
@@ -0,0 +1,31 @@
+From 3f5f5da776be86b408a15f38c9782f2185f97073 Mon Sep 17 00:00:00 2001
+From: Serhey Popovych <serhe.popovych@gmail.com>
+Date: Tue, 11 Dec 2018 02:30:50 -0500
+Subject: [PATCH] powerpc/powerpc64: Add support for musl ldso
+
+Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
+---
+Upstream-Status: Inappropriate [OE-Specific]
+
+ gcc/config/rs6000/linux64.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 619e113..ee8b44f 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -421,9 +421,9 @@ extern int dot_symbols;
+ #endif
+ 
+ #define MUSL_DYNAMIC_LINKER32 \
+-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ #define MUSL_DYNAMIC_LINKER64 \
+-  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ 
+ #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
+-- 
+2.7.4
+
-- 
2.7.4



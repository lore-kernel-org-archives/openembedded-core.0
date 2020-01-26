Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6D67FF24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:54 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id g6so2952859plp.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JtLDERozDFZDOdU/hksMuMai6FZLvVFbd18OSc1MZtE=;
	b=rDRKffTXItnouJsHQip1W14M+iEqfj2lpNo4D8GtaoFSlobX8Bmp3ZxDid1XQ4kJdy
	mUhqkMDMWOlqAOSxsRHyiWrJdVQZDWNxLpE/3ZJcu4t6ip6E9oTsyWJbk+28qsEUipcF
	2dVjWs1F90zzvdVe4Mh9V2ymP3HBm/NvGjglx3AxkNQ6+o9YiWRdEOI3DFDjcjv5g693
	LLjSwmSM26u1fC4M1hA+YMOIvWXmP6lH0qTJvibEcWQLL+M0a1lGflMkREL3dJB30/vO
	hr+26uo6uCH/oQHuztJyW9eoCRi3GJaLm3nnFSuehLnnRzF55b4ZATyaFwzApfj1QtW/
	SIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JtLDERozDFZDOdU/hksMuMai6FZLvVFbd18OSc1MZtE=;
	b=iQeIdD1p2Ietn4zm+ONxEk4+d/DVDfnx35NCjVFkb1cw5Q2H+vlsYcvKkjyevI1Fja
	ILUjQdj2OsiCBRLdNiVW2LSqhQqG2qd8cz49R+XfPfHcXlzRRJ3I8Qrf82FmrN4UPZ1g
	AMqS107aDU+FnMdDilKZhf1jyq+TwQmcBdKZWWjZnorU3ixao/jEgu6cDe8gjkK+wvLA
	H3w5bWDyLgPtWCw46FZh8J9WF//eJXCZvPEoqQMJyJO9zVmSzPRaGFQKb6OB0BjSLiGn
	vxmYFv/oqwdeU8QRxvIis1rawgT4H03fRyQhsPQa/jklpa7eHZVLO44yvBi3MWS7+AMu
	4c6A==
X-Gm-Message-State: APjAAAWnJRjdxf4U1BCJFu6Uax5i0UH5yWTdEBUqUAULS8JSzl6Teed6
	QzAgRfXZM/SHjLug2eYG2z+8/KSlJh0=
X-Google-Smtp-Source: APXvYqyNzmASiBqhdKLWsJmn67ZVAyY9eGzNt7dLf/Qr9JTQW03OZTkMg6j6n4GAGoJuNHpWtZ9Vow==
X-Received: by 2002:a17:902:9a85:: with SMTP id
	w5mr14103881plp.290.1580066874206; 
	Sun, 26 Jan 2020 11:27:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:43 -0800
Message-Id: <d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] glibc: Update to final 2.31 release
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:54 -0000
Content-Transfer-Encoding: 8bit

Drop ppc 8xx clear cache optimization, which we have been carrying
through eglibc days, it has been redone in glibc now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.31.bb      |   9 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...dd-hardlink-resolver-from-util-linux.patch |   2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |   2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |   2 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |   2 +-
 ...Raise-the-size-of-arrays-containing-.patch |   2 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   2 +-
 ...Make-relocatable-install-for-locales.patch |   2 +-
 ...5500-e6500-603e-fsqrt-implementation.patch |   2 +-
 ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   2 +-
 ...undefined-reference-to-__sqrt_finite.patch |   2 +-
 ...-are-now-inline-functions-and-call-o.patch |   2 +-
 ...443-which-explains-what-the-patch-do.patch |   2 +-
 ...m-err-tab.pl-with-specific-dirs-in-S.patch |   2 +-
 ...-are-now-inline-functions-and-call-o.patch |   2 +-
 ...igure.ac-handle-correctly-libc_cv_ro.patch |   2 +-
 .../glibc/0016-Add-unused-attribute.patch     |   2 +-
 ...the-path-sets-wrong-config-variables.patch |   2 +-
 ...zone-re-written-tzselect-as-posix-sh.patch |   2 +-
 ...bash-dependency-for-nscd-init-script.patch |   2 +-
 ...ss-building-and-testing-instructions.patch |   2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |   2 +-
 ...2-eglibc-Clear-cache-lines-on-ppc8xx.patch |  80 ---
 ...glibc-Resolve-__fpscr_values-on-SH4.patch} |   2 +-
 ...ort-cross-locale-generation-support.patch} |   2 +-
 ...efine-DUMMY_LOCALE_T-if-not-defined.patch} |   2 +-
 ...archive-uses-a-hard-coded-locale-pa.patch} |   2 +-
 ...e-_dl_build_local_scope-breadth-fir.patch} |   2 +-
 ...t-no-lines-in-bison-generated-files.patch} |   2 +-
 ...028-inject-file-assembly-directives.patch} |   2 +-
 ...ybe-uninitialized-errors-with-Os-BZ.patch} |   2 +-
 ...h => 0030-Refactor-FORTIFY-in-glibc.patch} | 648 +++++++++---------
 meta/recipes-core/glibc/glibc_2.31.bb         |  19 +-
 34 files changed, 367 insertions(+), 449 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch
 rename meta/recipes-core/glibc/glibc/{0023-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0022-eglibc-Resolve-__fpscr_values-on-SH4.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0024-eglibc-Forward-port-cross-locale-generation-support.patch => 0023-eglibc-Forward-port-cross-locale-generation-support.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0025-Define-DUMMY_LOCALE_T-if-not-defined.patch => 0024-Define-DUMMY_LOCALE_T-if-not-defined.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0026-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch => 0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (97%)
 rename meta/recipes-core/glibc/glibc/{0027-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (95%)
 rename meta/recipes-core/glibc/glibc/{0028-intl-Emit-no-lines-in-bison-generated-files.patch => 0027-intl-Emit-no-lines-in-bison-generated-files.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0029-inject-file-assembly-directives.patch => 0028-inject-file-assembly-directives.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch => 0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0031-Refactor-FORTIFY-in-glibc.patch => 0030-Refactor-FORTIFY-in-glibc.patch} (93%)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.31.bb b/meta/recipes-core/glibc/cross-localedef-native_2.31.bb
index a267a591d4..24de55d929 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.31.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.31.bb
@@ -31,11 +31,10 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0019-Remove-bash-dependency-for-nscd-init-script.patch \
            file://0020-eglibc-Cross-building-and-testing-instructions.patch \
            file://0021-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0022-eglibc-Clear-cache-lines-on-ppc8xx.patch \
-           file://0023-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0026-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0023-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0024-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index dca1916e80..c2cfb7e2f1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "master"
 PV = "2.30.9000"
-SRCREV_glibc ?= "def9c08c94da60bfb746644d56cffbe7a9de3477"
+SRCREV_glibc ?= "352bb99754ae7c83ff1b974f9c52244e974c9410"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index 9b75f2a62f..d0786be8b8 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From 169720859cf8f9133882a13f588b15f44b7b8ae6 Mon Sep 17 00:00:00 2001
+From 3dcf144e998aed17b3fb957a255b1e923ba07d71 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 029292fe36..5222e37d1a 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From 9b966b758d0c96ef6654251689318614ef10becc Mon Sep 17 00:00:00 2001
+From b52dba15527380cc18635e3696e0ef87efee9a84 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index e1c3512e4e..4cdc8354b6 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From 14ddf13b7fc2e39a1ae657ceb3963e35731e95d0 Mon Sep 17 00:00:00 2001
+From 6987ad183770cb56680ccc4f6ea065a04f31ccb6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 523b6da897..62e12897f5 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From 3ac58bf1028841cc0a8fa7f258cbf21466740360 Mon Sep 17 00:00:00 2001
+From 7806340c2accc2c51e7e861b618c29fb5609a007 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 4d88d9b413..294c2b975e 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 702d68cbdf405e086f72e2a062127cbea43045ec Mon Sep 17 00:00:00 2001
+From 1b97befbe693eb93a77b6098f6ae1394a53462f4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 0d070a93b9..db8b6c0f1c 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From f9993e652bd4a0f03402d0c527cf24b83d0ff7ea Mon Sep 17 00:00:00 2001
+From a752857cc342ee5136c9a593037b6ee6ff8af8ee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 66abcce3ce..d9985c2fdc 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From ee9d5e423e4a709ae5a62abfb476863b3b57378f Mon Sep 17 00:00:00 2001
+From 3df91d1d8b9c7a01b3ef8133c4f9b9764227d583 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
diff --git a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index 4f3ed38065..3dac325380 100644
--- a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,4 +1,4 @@
-From 2cc7b79157ce17144791dda1a2e3a6dc4902c736 Mon Sep 17 00:00:00 2001
+From 61b6c9737897c5828ef4b40699ee0a74c570034a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
 Subject: [PATCH] fsl e500/e5500/e6500/603e fsqrt implementation
diff --git a/meta/recipes-core/glibc/glibc/0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 6e4259f4ff..456f91fb8e 100644
--- a/meta/recipes-core/glibc/glibc/0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,4 +1,4 @@
-From e6ff3960d9e4ed6a9a4be70732313127f0e6d0e0 Mon Sep 17 00:00:00 2001
+From 13beb1f428ec06778590bf526d6e641f73d5cf62 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
 Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
diff --git a/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index 91da344089..01446abc43 100644
--- a/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,4 +1,4 @@
-From ad055d58bd99b80e41face63bf20db3f04afa4e3 Mon Sep 17 00:00:00 2001
+From 4483a83074a340a921e319b88d72166f18e0df0b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
 Subject: [PATCH] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
diff --git a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 6a5a44af9d..451f372650 100644
--- a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,4 +1,4 @@
-From ac4450bc74dc0754a3724f1bebb2290c4dc29d72 Mon Sep 17 00:00:00 2001
+From 347b2e31d010b04c42e78157a028aa1d58fe0f5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
 Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
diff --git a/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index e8eaa4d90b..a0b46c0479 100644
--- a/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,4 +1,4 @@
-From 0c73e17d5ea7c88247c1bfbb03511b0ccb6ba6b4 Mon Sep 17 00:00:00 2001
+From 8ca8e5cd78cbd37a713e1181f8f6641b57352aa8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
 Subject: [PATCH] Quote from bug 1443 which explains what the patch does :
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 3b3611f448..736de8cf04 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,4 +1,4 @@
-From 6a1ebbab0643fb2169314bcf1a0850b0f06dd27e Mon Sep 17 00:00:00 2001
+From 21509735678990760d5ebf9d0c65efa4b52b838d Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
 Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
diff --git a/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index b35de40eea..e73b640c16 100644
--- a/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,4 +1,4 @@
-From 106aee1de5c95fc9e02f10c05537dcc39f8478f4 Mon Sep 17 00:00:00 2001
+From e33deb119734ef443ef44c42a00a569f90e1e149 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
 Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
diff --git a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 5669341916..0cdd0567df 100644
--- a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,4 +1,4 @@
-From 6c07d094556606ce7c1dc08f4dd3bc6af483364f Mon Sep 17 00:00:00 2001
+From c50cae36e90c41849301a9a668adf31e81e43a07 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
diff --git a/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
index 3e5bba5a59..574e7c3503 100644
--- a/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
@@ -1,4 +1,4 @@
-From 8a8c81ba4e652dddb730d3dad2fecab1ee65fd9c Mon Sep 17 00:00:00 2001
+From c323125744020a29f79e50dc4d024b55c482eafc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
 Subject: [PATCH] Add unused attribute
diff --git a/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
index 0b626bdfac..49089af41e 100644
--- a/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From 601b2d11b6ddd974f0e1685f70e0d368e706d976 Mon Sep 17 00:00:00 2001
+From c421cd7e885497a99179b982dc4a27e8405f8857 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
diff --git a/meta/recipes-core/glibc/glibc/0018-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0018-timezone-re-written-tzselect-as-posix-sh.patch
index f18c7a1107..20b0ee98ea 100644
--- a/meta/recipes-core/glibc/glibc/0018-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0018-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,4 +1,4 @@
-From 8678c584bca244fe9a3f8926eabb6b6c7e9784f1 Mon Sep 17 00:00:00 2001
+From 2023d88c355b8af6458c8e39ce38b75c1ca4ea2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
 Subject: [PATCH] timezone: re-written tzselect as posix sh
diff --git a/meta/recipes-core/glibc/glibc/0019-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0019-Remove-bash-dependency-for-nscd-init-script.patch
index 82026694de..1c15a51308 100644
--- a/meta/recipes-core/glibc/glibc/0019-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0019-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From a78f21f2f9b9246cd12b310833313328e8f646ed Mon Sep 17 00:00:00 2001
+From 06da20d9f89907e5f2777537244e6589ca3c9703 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Remove bash dependency for nscd init script
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testing-instructions.patch
index f8f3efe582..eda5565371 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From 7c48f61b0c5ef6274df4b03609991d383adc5df0 Mon Sep 17 00:00:00 2001
+From 5641452a24f76c5dafa3749a542fcac93f77390f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Help-bootstrap-cross-toolchain.patch
index 02e5def339..6374ea4086 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 86a6e94e86664976b305c24e5a52093fe962240a Mon Sep 17 00:00:00 2001
+From 6a32d5bf40deee5d12d24c06f3ea9b5479c16802 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch
deleted file mode 100644
index 913aea9563..0000000000
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From b397d653670dd02d8310e1d6f0f19a8da90ebafa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH] eglibc: Clear cache lines on ppc8xx
-
-2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
-            Mark Shinwell  <shinwell@codesourcery.com>
-
-        * sysdeps/unix/sysv/linux/powerpc/libc-start.c
-        (__libc_start_main): Detect 8xx parts and clear
-        __cache_line_size if detected.
-        * sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-        (DL_PLATFORM_AUXV): Likewise.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c  | 14 +++++++++++++-
- sysdeps/unix/sysv/linux/powerpc/libc-start.c | 16 +++++++++++++++-
- 2 files changed, 28 insertions(+), 2 deletions(-)
-
-diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-index 5d65bc6303..c786f9aa7e 100644
---- a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-+++ b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-@@ -24,9 +24,21 @@ int __cache_line_size attribute_hidden;
- /* Scan the Aux Vector for the "Data Cache Block Size" entry.  If found
-    verify that the static extern __cache_line_size is defined by checking
-    for not NULL.  If it is defined then assign the cache block size
--   value to __cache_line_size.  */
-+   value to __cache_line_size.  This is used by memset to
-+   optimize setting to zero.  We have to detect 8xx processors, which
-+   have buggy dcbz implementations that cannot report page faults
-+   correctly.  That requires reading SPR, which is a privileged
-+   operation.  Fortunately 2.2.18 and later emulates PowerPC mfspr
-+   reads from the PVR register.   */
- #define DL_PLATFORM_AUXV						      \
-       case AT_DCACHEBSIZE:						      \
-+	if (__LINUX_KERNEL_VERSION >= 0x020218)				      \
-+	  {								      \
-+	    unsigned pvr = 0;						      \
-+	    asm ("mfspr %0, 287" : "=r" (pvr));				      \
-+	    if ((pvr & 0xffff0000) == 0x00500000)			      \
-+	      break;							      \
-+	  }								      \
- 	__cache_line_size = av->a_un.a_val;				      \
- 	break;
- 
-diff --git a/sysdeps/unix/sysv/linux/powerpc/libc-start.c b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
-index 93f8659fa6..9bb07b36be 100644
---- a/sysdeps/unix/sysv/linux/powerpc/libc-start.c
-+++ b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
-@@ -73,11 +73,25 @@ __libc_start_main (int argc, char **argv,
- 
-   /* Initialize the __cache_line_size variable from the aux vector.  For the
-      static case, we also need _dl_hwcap, _dl_hwcap2 and _dl_platform, so we
--     can call __tcb_parse_hwcap_and_convert_at_platform ().  */
-+     can call __tcb_parse_hwcap_and_convert_at_platform ().
-+
-+     This is used by memset to optimize setting to zero.  We have to
-+     detect 8xx processors, which have buggy dcbz implementations that
-+     cannot report page faults correctly.  That requires reading SPR,
-+     which is a privileged operation.  Fortunately 2.2.18 and later
-+     emulates PowerPC mfspr reads from the PVR register.  */
-   for (ElfW (auxv_t) * av = auxvec; av->a_type != AT_NULL; ++av)
-     switch (av->a_type)
-       {
-       case AT_DCACHEBSIZE:
-+	if (__LINUX_KERNEL_VERSION >= 0x020218)
-+	  {
-+	    unsigned pvr = 0;
-+
-+	    asm ("mfspr %0, 287" : "=r" (pvr) :);
-+	    if ((pvr & 0xffff0000) == 0x00500000)
-+	      break;
-+	  }
- 	__cache_line_size = av->a_un.a_val;
- 	break;
- #ifndef SHARED
diff --git a/meta/recipes-core/glibc/glibc/0023-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0023-eglibc-Resolve-__fpscr_values-on-SH4.patch
rename to meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
index cc8ddeea6f..2a503c811e 100644
--- a/meta/recipes-core/glibc/glibc/0023-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From 02b69fc14ae1d6309e4e17081842b1f89bd40338 Mon Sep 17 00:00:00 2001
+From 25c21857a3fc0eb26831616ba88a696dd31ecba1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
diff --git a/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0023-eglibc-Forward-port-cross-locale-generation-support.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
rename to meta/recipes-core/glibc/glibc/0023-eglibc-Forward-port-cross-locale-generation-support.patch
index 72278a6822..1a90f22db6 100644
--- a/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0023-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From 42fc64ee872491667749499db50e3c51d6a4bfb3 Mon Sep 17 00:00:00 2001
+From 30008327aadf0c775e644bb387d7c25952ed05b5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
diff --git a/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0024-Define-DUMMY_LOCALE_T-if-not-defined.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
rename to meta/recipes-core/glibc/glibc/0024-Define-DUMMY_LOCALE_T-if-not-defined.patch
index d359518751..15e460eb08 100644
--- a/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0024-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,4 +1,4 @@
-From 5e565710aa061ffffd34d8400910c35a8d50a4ec Mon Sep 17 00:00:00 2001
+From 067f71a381ce6626ef1179be3dd90c4ed2aa52fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
 Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
diff --git a/meta/recipes-core/glibc/glibc/0026-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0026-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
rename to meta/recipes-core/glibc/glibc/0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 8df09d82ee..543f65d6ea 100644
--- a/meta/recipes-core/glibc/glibc/0026-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From c5b63c8eafc00e01556edd2acff4c541448924cf Mon Sep 17 00:00:00 2001
+From 8f4b0bac85d14b184e08848b02de3f30775f05b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
diff --git a/meta/recipes-core/glibc/glibc/0027-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
similarity index 95%
rename from meta/recipes-core/glibc/glibc/0027-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
rename to meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 55250d8d8e..5f6ee40f22 100644
--- a/meta/recipes-core/glibc/glibc/0027-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,4 +1,4 @@
-From d3349ae8d9b17fecf6ef560b845d04d682db291c Mon Sep 17 00:00:00 2001
+From 1dad746ce93928a57b2fe618c74722f710751826 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
 Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
diff --git a/meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0027-intl-Emit-no-lines-in-bison-generated-files.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch
rename to meta/recipes-core/glibc/glibc/0027-intl-Emit-no-lines-in-bison-generated-files.patch
index 06d23c988d..2c317d58aa 100644
--- a/meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch
+++ b/meta/recipes-core/glibc/glibc/0027-intl-Emit-no-lines-in-bison-generated-files.patch
@@ -1,4 +1,4 @@
-From 3650ad7f01509138aa72f235e680c9d4f6c09a7d Mon Sep 17 00:00:00 2001
+From 3c8d9eae83ab4f1677afc9b379f97114e8503363 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:44:00 -0700
 Subject: [PATCH] intl: Emit no lines in bison generated files
diff --git a/meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0028-inject-file-assembly-directives.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch
rename to meta/recipes-core/glibc/glibc/0028-inject-file-assembly-directives.patch
index 62e615786d..e1a030d10c 100644
--- a/meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch
+++ b/meta/recipes-core/glibc/glibc/0028-inject-file-assembly-directives.patch
@@ -1,4 +1,4 @@
-From a9be0c7c67e67d870e2c5e0ece4f6ac76e5c0fe2 Mon Sep 17 00:00:00 2001
+From 420454f7098b5445730caa855c37b8143bfccc1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 17:29:35 -0800
 Subject: [PATCH] inject file assembly directives
diff --git a/meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
rename to meta/recipes-core/glibc/glibc/0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
index 195b1b0081..c8c359f2b8 100644
--- a/meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ b/meta/recipes-core/glibc/glibc/0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -1,4 +1,4 @@
-From eaa1e89df6d760c3719e7060662c60b41ab6e87b Mon Sep 17 00:00:00 2001
+From 66963ad83bdd3b075006ddca9dfe357aed181d6a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Mon, 17 Dec 2018 21:36:18 +0000
 Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
diff --git a/meta/recipes-core/glibc/glibc/0031-Refactor-FORTIFY-in-glibc.patch b/meta/recipes-core/glibc/glibc/0030-Refactor-FORTIFY-in-glibc.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0031-Refactor-FORTIFY-in-glibc.patch
rename to meta/recipes-core/glibc/glibc/0030-Refactor-FORTIFY-in-glibc.patch
index fe10218c31..7fe71ad92f 100644
--- a/meta/recipes-core/glibc/glibc/0031-Refactor-FORTIFY-in-glibc.patch
+++ b/meta/recipes-core/glibc/glibc/0030-Refactor-FORTIFY-in-glibc.patch
@@ -1,4 +1,4 @@
-From 4a6f67ae2438c5e7f9cd627d5cf4a7148b9ad18d Mon Sep 17 00:00:00 2001
+From fecfc4050ce075e543fb1cf19d6d1da481260b95 Mon Sep 17 00:00:00 2001
 From: George Burgess IV <gbiv@google.com>
 Date: Sat, 11 Jan 2020 10:33:19 -0800
 Subject: [PATCH] Refactor FORTIFY in glibc
@@ -24,9 +24,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  wcsmbs/bits/wchar2.h            | 487 ++++++++++++++------------------
  14 files changed, 1093 insertions(+), 837 deletions(-)
 
+diff --git a/io/bits/fcntl2.h b/io/bits/fcntl2.h
+index 85b922dab8..04cc377040 100644
 --- a/io/bits/fcntl2.h
 +++ b/io/bits/fcntl2.h
-@@ -32,10 +32,28 @@ extern int __REDIRECT (__open_2, (const
+@@ -32,10 +32,28 @@ extern int __REDIRECT (__open_2, (const char *__path, int __oflag),
  extern int __REDIRECT (__open_alias, (const char *__path, int __oflag, ...),
  		       open64) __nonnull ((1));
  #endif
@@ -59,7 +61,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  __fortify_function int
  open (const char *__path, int __oflag, ...)
-@@ -58,16 +76,37 @@ open (const char *__path, int __oflag, .
+@@ -58,16 +76,37 @@ open (const char *__path, int __oflag, ...)
  
    return __open_alias (__path, __oflag, __va_arg_pack ());
  }
@@ -101,7 +103,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  __fortify_function int
  open64 (const char *__path, int __oflag, ...)
-@@ -90,6 +129,9 @@ open64 (const char *__path, int __oflag,
+@@ -90,6 +129,9 @@ open64 (const char *__path, int __oflag, ...)
  
    return __open64_alias (__path, __oflag, __va_arg_pack ());
  }
@@ -111,7 +113,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  
-@@ -108,10 +150,32 @@ extern int __REDIRECT (__openat_alias, (
+@@ -108,10 +150,32 @@ extern int __REDIRECT (__openat_alias, (int __fd, const char *__path,
  					int __oflag, ...), openat64)
       __nonnull ((2));
  # endif
@@ -148,7 +150,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  __fortify_function int
  openat (int __fd, const char *__path, int __oflag, ...)
-@@ -134,6 +198,9 @@ openat (int __fd, const char *__path, in
+@@ -134,6 +198,9 @@ openat (int __fd, const char *__path, int __oflag, ...)
  
    return __openat_alias (__fd, __path, __oflag, __va_arg_pack ());
  }
@@ -158,7 +160,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  # ifdef __USE_LARGEFILE64
-@@ -142,11 +209,34 @@ extern int __openat64_2 (int __fd, const
+@@ -142,11 +209,34 @@ extern int __openat64_2 (int __fd, const char *__path, int __oflag)
  extern int __REDIRECT (__openat64_alias, (int __fd, const char *__path,
  					  int __oflag, ...), openat64)
       __nonnull ((2));
@@ -197,7 +199,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  __fortify_function int
  openat64 (int __fd, const char *__path, int __oflag, ...)
  {
-@@ -168,5 +258,8 @@ openat64 (int __fd, const char *__path,
+@@ -168,5 +258,8 @@ openat64 (int __fd, const char *__path, int __oflag, ...)
  
    return __openat64_alias (__fd, __path, __oflag, __va_arg_pack ());
  }
@@ -206,9 +208,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#  undef __warn_openat64_missing_mode
  # endif
  #endif
+diff --git a/io/bits/poll2.h b/io/bits/poll2.h
+index dca49717db..cc149711af 100644
 --- a/io/bits/poll2.h
 +++ b/io/bits/poll2.h
-@@ -27,25 +27,20 @@ extern int __REDIRECT (__poll_alias, (st
+@@ -27,25 +27,20 @@ extern int __REDIRECT (__poll_alias, (struct pollfd *__fds, nfds_t __nfds,
  				      int __timeout), poll);
  extern int __poll_chk (struct pollfd *__fds, nfds_t __nfds, int __timeout,
  		       __SIZE_TYPE__ __fdslen);
@@ -244,7 +248,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #ifdef __USE_GNU
  extern int __REDIRECT (__ppoll_alias, (struct pollfd *__fds, nfds_t __nfds,
-@@ -54,28 +49,21 @@ extern int __REDIRECT (__ppoll_alias, (s
+@@ -54,28 +49,21 @@ extern int __REDIRECT (__ppoll_alias, (struct pollfd *__fds, nfds_t __nfds,
  extern int __ppoll_chk (struct pollfd *__fds, nfds_t __nfds,
  			const struct timespec *__timeout,
  			const __sigset_t *__ss, __SIZE_TYPE__ __fdslen);
@@ -284,9 +288,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  __END_DECLS
+diff --git a/io/fcntl.h b/io/fcntl.h
+index 21b60c264d..83f2c8e117 100644
 --- a/io/fcntl.h
 +++ b/io/fcntl.h
-@@ -325,7 +325,7 @@ extern int posix_fallocate64 (int __fd,
+@@ -325,7 +325,7 @@ extern int posix_fallocate64 (int __fd, off64_t __offset, off64_t __len);
  
  /* Define some inlines helping to catch common problems.  */
  #if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function \
@@ -295,18 +301,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # include <bits/fcntl2.h>
  #endif
  
+diff --git a/libio/bits/stdio2.h b/libio/bits/stdio2.h
+index 60bc81735e..1338f418ba 100644
 --- a/libio/bits/stdio2.h
 +++ b/libio/bits/stdio2.h
-@@ -29,12 +29,23 @@ extern int __vsprintf_chk (char *__restr
+@@ -29,12 +29,23 @@ extern int __vsprintf_chk (char *__restrict __s, int __flag, size_t __slen,
  			   const char *__restrict __format,
  			   __gnuc_va_list __ap) __THROW;
  
 -#ifdef __va_arg_pack
 -__fortify_function int
 -__NTH (sprintf (char *__restrict __s, const char *__restrict __fmt, ...))
--{
--  return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
--				  __bos (__s), __fmt, __va_arg_pack ());
 +#define __mul_may_overflow(size, n) \
 +  ((size | n) >= (((size_t)1) << (8 * sizeof (size_t) / 2)))
 +
@@ -316,7 +321,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +__fortify_potential_overload int
 +__NTH (sprintf (char *__restrict const __clang_pass_object_size __s,
 +		const char *__restrict __fmt, ...))
-+{
+ {
+-  return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
+-				  __bos (__s), __fmt, __va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __result = __FORTIFY_CALL_VA_BUILTIN (sprintf, __s,
 +					    __USE_FORTIFY_LEVEL - 1,
@@ -327,7 +334,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
  #elif !defined __cplusplus
  # define sprintf(str, ...) \
-@@ -42,9 +53,9 @@ __NTH (sprintf (char *__restrict __s, co
+@@ -42,9 +53,9 @@ __NTH (sprintf (char *__restrict __s, const char *__restrict __fmt, ...))
  			   __VA_ARGS__)
  #endif
  
@@ -340,7 +347,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    return __builtin___vsprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
  				   __bos (__s), __fmt, __ap);
-@@ -59,13 +70,21 @@ extern int __vsnprintf_chk (char *__rest
+@@ -59,13 +70,21 @@ extern int __vsnprintf_chk (char *__restrict __s, size_t __n, int __flag,
  			    size_t __slen, const char *__restrict __format,
  			    __gnuc_va_list __ap) __THROW;
  
@@ -348,9 +355,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -__fortify_function int
 -__NTH (snprintf (char *__restrict __s, size_t __n,
 -		 const char *__restrict __fmt, ...))
--{
--  return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
--				   __bos (__s), __fmt, __va_arg_pack ());
 +# ifdef __FORTIFY_ARG_PACK_OK
 +__fortify_potential_overload __attribute__ ((__format__ (__printf__, 3, 4))) int
 +__NTH (snprintf (char *__restrict const __clang_pass_object_size __s,
@@ -358,7 +362,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +     /* GCC's builtin will catch this, so we just need to cover clang here.  */
 +     __clang_warning_if (__bos_static_lt (__n, __s),
 +			 "call to snprintf may overflow the destination buffer")
-+{
+ {
+-  return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
+-				   __bos (__s), __fmt, __va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __result = __FORTIFY_CALL_VA_BUILTIN (snprintf, __s, __n,
 +					    __USE_FORTIFY_LEVEL - 1,
@@ -369,7 +375,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
  # elif !defined __cplusplus
  #  define snprintf(str, len, ...) \
-@@ -73,9 +92,12 @@ __NTH (snprintf (char *__restrict __s, s
+@@ -73,9 +92,12 @@ __NTH (snprintf (char *__restrict __s, size_t __n,
  			    __VA_ARGS__)
  # endif
  
@@ -385,38 +391,34 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    return __builtin___vsnprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
  				    __bos (__s), __fmt, __ap);
-@@ -93,18 +115,27 @@ extern int __vfprintf_chk (FILE *__restr
+@@ -93,18 +115,27 @@ extern int __vfprintf_chk (FILE *__restrict __stream, int __flag,
  extern int __vprintf_chk (int __flag, const char *__restrict __format,
  			  __gnuc_va_list __ap);
  
 -# ifdef __va_arg_pack
 -__fortify_function int
 -fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
--{
--  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
--			__va_arg_pack ());
--}
--
--__fortify_function int
--printf (const char *__restrict __fmt, ...)
--{
--  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
 +# ifdef __FORTIFY_ARG_PACK_OK
 +__fortify_potential_overload __attribute__ ((__format__ (__printf__, 2, 3))) int
 +fprintf (FILE *__restrict const __clang_pass_object_size __stream,
 +	 const char *__restrict __fmt, ...)
-+{
+ {
+-  return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
+-			__va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __result = __FORTIFY_CALL_VA_CHK (fprintf, __stream,
 +					__USE_FORTIFY_LEVEL - 1, __fmt,
 +					__FORTIFY_ARG_PACK);
 +  __FORTIFY_FREE_ARG_PACK();
 +  return __result;
-+}
-+
+ }
+ 
+-__fortify_function int
+-printf (const char *__restrict __fmt, ...)
 +__fortify_potential_overload __attribute__ ((__format__ (__printf__, 1, 2))) int
 +printf (const char *__restrict const __clang_pass_object_size __fmt, ...)
-+{
+ {
+-  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __result = __FORTIFY_CALL_VA_CHK (printf, __USE_FORTIFY_LEVEL - 1, __fmt,
 +					__FORTIFY_ARG_PACK);
@@ -425,7 +427,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
  # elif !defined __cplusplus
  #  define printf(...) \
-@@ -113,8 +144,9 @@ printf (const char *__restrict __fmt, ..
+@@ -113,8 +144,9 @@ printf (const char *__restrict __fmt, ...)
    __fprintf_chk (stream, __USE_FORTIFY_LEVEL - 1, __VA_ARGS__)
  # endif
  
@@ -437,7 +439,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
  #ifdef __USE_EXTERN_INLINES
    return __vfprintf_chk (stdout, __USE_FORTIFY_LEVEL - 1, __fmt, __ap);
-@@ -122,9 +154,8 @@ vprintf (const char *__restrict __fmt, _
+@@ -122,9 +154,8 @@ vprintf (const char *__restrict __fmt, __gnuc_va_list __ap)
    return __vprintf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __ap);
  #endif
  }
@@ -449,21 +451,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  const char *__restrict __fmt, __gnuc_va_list __ap)
  {
    return __vfprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt, __ap);
-@@ -137,20 +168,26 @@ extern int __vdprintf_chk (int __fd, int
+@@ -137,20 +168,26 @@ extern int __vdprintf_chk (int __fd, int __flag,
  			   const char *__restrict __fmt, __gnuc_va_list __arg)
       __attribute__ ((__format__ (__printf__, 3, 0)));
  
 -#  ifdef __va_arg_pack
 -__fortify_function int
 -dprintf (int __fd, const char *__restrict __fmt, ...)
--{
--  return __dprintf_chk (__fd, __USE_FORTIFY_LEVEL - 1, __fmt,
--			__va_arg_pack ());
 +#  ifdef __FORTIFY_ARG_PACK_OK
 +__fortify_potential_overload __attribute__ ((__format__ (__printf__, 2, 3))) int
 +dprintf (int __fd, const char *__restrict const __clang_pass_object_size __fmt,
 +	...)
-+{
+ {
+-  return __dprintf_chk (__fd, __USE_FORTIFY_LEVEL - 1, __fmt,
+-			__va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __result = __FORTIFY_CALL_VA_CHK (dprintf, __fd, __USE_FORTIFY_LEVEL - 1,
 +					__fmt, __FORTIFY_ARG_PACK);
@@ -484,21 +485,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    return __vdprintf_chk (__fd, __USE_FORTIFY_LEVEL - 1, __fmt, __ap);
  }
-@@ -174,28 +211,49 @@ extern int __obstack_vprintf_chk (struct
+@@ -174,28 +211,49 @@ extern int __obstack_vprintf_chk (struct obstack *__restrict __obstack,
  				  __gnuc_va_list __args)
       __THROW __attribute__ ((__format__ (__printf__, 3, 0)));
  
 -#  ifdef __va_arg_pack
 -__fortify_function int
 -__NTH (asprintf (char **__restrict __ptr, const char *__restrict __fmt, ...))
--{
--  return __asprintf_chk (__ptr, __USE_FORTIFY_LEVEL - 1, __fmt,
--			 __va_arg_pack ());
--}
--
--__fortify_function int
--__NTH (__asprintf (char **__restrict __ptr, const char *__restrict __fmt,
--		   ...))
 +#  ifdef __FORTIFY_ARG_PACK_OK
 +__fortify_potential_overload __attribute__ ((__format__ (__printf__, 2, 3)))
 +__wur int
@@ -507,31 +500,34 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
 -  return __asprintf_chk (__ptr, __USE_FORTIFY_LEVEL - 1, __fmt,
 -			 __va_arg_pack ());
--}
--
--__fortify_function int
--__NTH (obstack_printf (struct obstack *__restrict __obstack,
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __result = __FORTIFY_CALL_VA_CHK (asprintf, __ptr,
 +					__USE_FORTIFY_LEVEL - 1, __fmt,
 +					__FORTIFY_ARG_PACK);
 +  __FORTIFY_FREE_ARG_PACK();
 +  return __result;
-+}
-+
+ }
+ 
+-__fortify_function int
+-__NTH (__asprintf (char **__restrict __ptr, const char *__restrict __fmt,
+-		   ...))
 +__fortify_potential_overload __attribute__ ((__format__ (__printf__, 2, 3)))
 +__wur int
 +__NTH (__asprintf (char **__restrict const __clang_pass_object_size __ptr,
 +		   const char *__restrict __fmt, ...))
-+{
+ {
+-  return __asprintf_chk (__ptr, __USE_FORTIFY_LEVEL - 1, __fmt,
+-			 __va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __result = __FORTIFY_CALL_VA_CHK (asprintf, __ptr,
 +					__USE_FORTIFY_LEVEL - 1, __fmt,
 +					__FORTIFY_ARG_PACK);
 +  __FORTIFY_FREE_ARG_PACK();
 +  return __result;
-+}
-+
+ }
+ 
+-__fortify_function int
+-__NTH (obstack_printf (struct obstack *__restrict __obstack,
 +__fortify_potential_overload __attribute__ ((__format__ (__printf__, 2, 3))) int
 +__NTH (obstack_printf (struct obstack *
 +			 __restrict const __clang_pass_object_size __obstack,
@@ -553,7 +549,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
  #  elif !defined __cplusplus
  #   define asprintf(ptr, ...) \
-@@ -206,15 +264,17 @@ __NTH (obstack_printf (struct obstack *_
+@@ -206,15 +264,17 @@ __NTH (obstack_printf (struct obstack *__restrict __obstack,
    __obstack_printf_chk (obstack, __USE_FORTIFY_LEVEL - 1, __VA_ARGS__)
  #  endif
  
@@ -576,17 +572,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			const char *__restrict __fmt, __gnuc_va_list __ap))
  {
    return __obstack_vprintf_chk (__obstack, __USE_FORTIFY_LEVEL - 1, __fmt,
-@@ -227,17 +287,20 @@ __NTH (obstack_vprintf (struct obstack *
+@@ -227,17 +287,20 @@ __NTH (obstack_vprintf (struct obstack *__restrict __obstack,
  
  #if __GLIBC_USE (DEPRECATED_GETS)
  extern char *__gets_chk (char *__str, size_t) __wur;
 -extern char *__REDIRECT (__gets_warn, (char *__str), gets)
 -     __wur __warnattr ("please use fgets or getline instead, gets can't "
 -		       "specify buffer size");
-+extern char *__REDIRECT_NTH (__gets_alias, (char *__buf), gets) __wur;
- 
+-
 -__fortify_function __wur char *
 -gets (char *__str)
++extern char *__REDIRECT_NTH (__gets_alias, (char *__buf), gets) __wur;
++
 +__fortify_potential_overload __wur char *
 +gets (char *const __clang_pass_object_size __str)
 +__FORTIFY_PRECONDITIONS
@@ -603,7 +600,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  extern char *__fgets_chk (char *__restrict __s, size_t __size, int __n,
-@@ -245,25 +308,20 @@ extern char *__fgets_chk (char *__restri
+@@ -245,25 +308,20 @@ extern char *__fgets_chk (char *__restrict __s, size_t __size, int __n,
  extern char *__REDIRECT (__fgets_alias,
  			 (char *__restrict __s, int __n,
  			  FILE *__restrict __stream), fgets) __wur;
@@ -612,9 +609,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			  FILE *__restrict __stream), __fgets_chk)
 -     __wur __warnattr ("fgets called with bigger size than length "
 -		       "of destination buffer");
- 
+-
 -__fortify_function __wur char *
 -fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
++
 +__fortify_potential_overload __wur char *
 +fgets (char *__restrict const __clang_pass_object_size __s, int __n,
 +       FILE *__restrict __stream)
@@ -679,7 +677,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #ifdef __USE_GNU
  extern char *__fgets_unlocked_chk (char *__restrict __s, size_t __size,
-@@ -303,25 +352,21 @@ extern char *__fgets_unlocked_chk (char
+@@ -303,25 +352,21 @@ extern char *__fgets_unlocked_chk (char *__restrict __s, size_t __size,
  extern char *__REDIRECT (__fgets_unlocked_alias,
  			 (char *__restrict __s, int __n,
  			  FILE *__restrict __stream), fgets_unlocked) __wur;
@@ -688,9 +686,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			  FILE *__restrict __stream), __fgets_unlocked_chk)
 -     __wur __warnattr ("fgets_unlocked called with bigger size than length "
 -		       "of destination buffer");
- 
+-
 -__fortify_function __wur char *
 -fgets_unlocked (char *__restrict __s, int __n, FILE *__restrict __stream)
++
 +__fortify_potential_overload __wur char *
 +fgets_unlocked (char *__restrict const __clang_pass_object_size __s, int __n,
 +		FILE *__restrict __stream)
@@ -715,7 +714,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  #ifdef __USE_MISC
-@@ -333,30 +378,19 @@ extern size_t __REDIRECT (__fread_unlock
+@@ -333,30 +378,19 @@ extern size_t __REDIRECT (__fread_unlocked_alias,
  			  (void *__restrict __ptr, size_t __size,
  			   size_t __n, FILE *__restrict __stream),
  			  fread_unlocked) __wur;
@@ -756,7 +755,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # ifdef __USE_EXTERN_INLINES
    if (__builtin_constant_p (__size)
-@@ -381,6 +415,7 @@ fread_unlocked (void *__restrict __ptr,
+@@ -381,6 +415,7 @@ fread_unlocked (void *__restrict __ptr, size_t __size, size_t __n,
  # endif
    return __fread_unlocked_alias (__ptr, __size, __n, __stream);
  }
@@ -765,6 +764,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -
 +#undef __mul_may_overflow
  #endif /* bits/stdio2.h.  */
+diff --git a/misc/bits/syslog.h b/misc/bits/syslog.h
+index 322192df21..68b90a5cb8 100644
 --- a/misc/bits/syslog.h
 +++ b/misc/bits/syslog.h
 @@ -20,11 +20,34 @@
@@ -803,7 +804,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  __fortify_function void
  syslog (int __pri, const char *__fmt, ...)
  {
-@@ -34,16 +57,3 @@ syslog (int __pri, const char *__fmt, ..
+@@ -34,16 +57,3 @@ syslog (int __pri, const char *__fmt, ...)
  # define syslog(pri, ...) \
    __syslog_chk (pri, __USE_FORTIFY_LEVEL - 1, __VA_ARGS__)
  #endif
@@ -820,6 +821,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -  __vsyslog_chk (__pri,  __USE_FORTIFY_LEVEL - 1, __fmt, __ap);
 -}
 -#endif
+diff --git a/misc/sys/cdefs.h b/misc/sys/cdefs.h
+index ff7144f3f3..a42ffd5d36 100644
 --- a/misc/sys/cdefs.h
 +++ b/misc/sys/cdefs.h
 @@ -118,11 +118,150 @@
@@ -1004,9 +1007,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* It is possible to compile containing GCC extensions even if GCC is
     run in pedantic mode if the uses are carefully marked using the
     `__extension__' keyword.  But this is not generally available before
+diff --git a/posix/bits/unistd.h b/posix/bits/unistd.h
+index b8a8211d83..895d87832e 100644
 --- a/posix/bits/unistd.h
 +++ b/posix/bits/unistd.h
-@@ -24,25 +24,19 @@ extern ssize_t __read_chk (int __fd, voi
+@@ -24,25 +24,19 @@ extern ssize_t __read_chk (int __fd, void *__buf, size_t __nbytes,
  			   size_t __buflen) __wur;
  extern ssize_t __REDIRECT (__read_alias, (int __fd, void *__buf,
  					  size_t __nbytes), read) __wur;
@@ -1015,10 +1020,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			    size_t __buflen), __read_chk)
 -     __wur __warnattr ("read called with bigger length than size of "
 -		       "the destination buffer");
--
+ 
 -__fortify_function __wur ssize_t
 -read (int __fd, void *__buf, size_t __nbytes)
--{
++__fortify_potential_overload __wur ssize_t
++read (int __fd, void *const __clang_pass_object_size0 __buf, size_t __nbytes)
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS0_LT (__read_warn, __nbytes, __buf,
++					"read called with bigger length than "
++					"size of the destination buffer")
+ {
 -  if (__bos0 (__buf) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__nbytes))
@@ -1027,14 +1038,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -      if (__nbytes > __bos0 (__buf))
 -	return __read_chk_warn (__fd, __buf, __nbytes, __bos0 (__buf));
 -    }
-+
-+__fortify_potential_overload __wur ssize_t
-+read (int __fd, void *const __clang_pass_object_size0 __buf, size_t __nbytes)
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS0_LT (__read_warn, __nbytes, __buf,
-+					"read called with bigger length than "
-+					"size of the destination buffer")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos0 (__buf) != (size_t) -1)
 +    return __read_chk (__fd, __buf, __nbytes, __bos0 (__buf));
    return __read_alias (__fd, __buf, __nbytes);
@@ -1043,7 +1046,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #ifdef __USE_UNIX98
  extern ssize_t __pread_chk (int __fd, void *__buf, size_t __nbytes,
-@@ -55,67 +49,49 @@ extern ssize_t __REDIRECT (__pread_alias
+@@ -55,67 +49,49 @@ extern ssize_t __REDIRECT (__pread_alias,
  extern ssize_t __REDIRECT (__pread64_alias,
  			   (int __fd, void *__buf, size_t __nbytes,
  			    __off64_t __offset), pread64) __wur;
@@ -1098,6 +1101,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#  define __fo_off_t __off64_t
  # endif
  
+-# ifdef __USE_LARGEFILE64
+-__fortify_function __wur ssize_t
+-pread64 (int __fd, void *__buf, size_t __nbytes, __off64_t __offset)
 +__fortify_potential_overload __wur ssize_t
 +pread (int __fd, void *const __clang_pass_object_size0 __buf, size_t __nbytes,
 +       __fo_off_t __offset)
@@ -1105,20 +1111,26 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +     __FORTIFY_WARNING_ONLY_IF_BOS0_LT (__pread_chk_warn, __nbytes, __buf,
 +					"pread called with bigger length than "
 +					"size of the destination buffer")
-+{
+ {
+-  if (__bos0 (__buf) != (size_t) -1)
+-    {
+-      if (!__builtin_constant_p (__nbytes))
+-	return __pread64_chk (__fd, __buf, __nbytes, __offset, __bos0 (__buf));
 +  if (__FORTIFY_CALL_CHK && __bos0 (__buf) != (size_t) -1)
 +    return __fo_pread_chk (__fd, __buf, __nbytes, __offset, __bos0 (__buf));
 +  return __fo_pread_alias (__fd, __buf, __nbytes, __offset);
 +}
 +__FORTIFY_FUNCTION_END
-+
+ 
+-      if ( __nbytes > __bos0 (__buf))
+-	return __pread64_chk_warn (__fd, __buf, __nbytes, __offset,
+-				   __bos0 (__buf));
+-    }
 +#undef __fo_pread_chk
 +#undef __fo_pread_alias
 +#undef __fo_off_t
-+
- # ifdef __USE_LARGEFILE64
--__fortify_function __wur ssize_t
--pread64 (int __fd, void *__buf, size_t __nbytes, __off64_t __offset)
+ 
++# ifdef __USE_LARGEFILE64
 +__fortify_potential_overload __wur ssize_t
 +pread64 (int __fd, void *const __clang_pass_object_size0 __buf,
 +	  size_t __nbytes, __off64_t __offset)
@@ -1126,17 +1138,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +     __FORTIFY_WARNING_ONLY_IF_BOS0_LT (__pread64_warn, __nbytes, __buf,
 +					"pread64 called with bigger length "
 +					"than size of the destination buffer")
- {
--  if (__bos0 (__buf) != (size_t) -1)
--    {
--      if (!__builtin_constant_p (__nbytes))
--	return __pread64_chk (__fd, __buf, __nbytes, __offset, __bos0 (__buf));
--
--      if ( __nbytes > __bos0 (__buf))
--	return __pread64_chk_warn (__fd, __buf, __nbytes, __offset,
--				   __bos0 (__buf));
--    }
--
++{
 +  if (__FORTIFY_CALL_CHK && __bos0 (__buf) != (size_t) -1)
 +    return __pread64_chk (__fd, __buf, __nbytes, __offset, __bos0 (__buf));
    return __pread64_alias (__fd, __buf, __nbytes, __offset);
@@ -1145,7 +1147,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # endif
  #endif
  
-@@ -128,27 +104,21 @@ extern ssize_t __REDIRECT_NTH (__readlin
+@@ -128,27 +104,21 @@ extern ssize_t __REDIRECT_NTH (__readlink_alias,
  			       (const char *__restrict __path,
  				char *__restrict __buf, size_t __len), readlink)
       __nonnull ((1, 2)) __wur;
@@ -1183,7 +1185,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  #ifdef __USE_ATFILE
-@@ -161,119 +131,104 @@ extern ssize_t __REDIRECT_NTH (__readlin
+@@ -161,119 +131,104 @@ extern ssize_t __REDIRECT_NTH (__readlinkat_alias,
  				char *__restrict __buf, size_t __len),
  			       readlinkat)
       __nonnull ((2, 3)) __wur;
@@ -1234,24 +1236,25 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			     __getcwd_chk)
 -     __wur __warnattr ("getcwd caller with bigger length than size of "
 -		       "destination buffer");
- 
+-
 -__fortify_function __wur char *
 -__NTH (getcwd (char *__buf, size_t __size))
-+__fortify_potential_overload __wur char *
-+__NTH (getcwd (char *const __clang_pass_object_size __buf, size_t __size))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__getcwd_warn, __size, __buf,
-+				       "getcwd called with bigger length than "
-+				       "size of destination buffer")
- {
+-{
 -  if (__bos (__buf) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__size))
 -	return __getcwd_chk (__buf, __size, __bos (__buf));
--
+ 
 -      if (__size > __bos (__buf))
 -	return __getcwd_chk_warn (__buf, __size, __bos (__buf));
 -    }
++__fortify_potential_overload __wur char *
++__NTH (getcwd (char *const __clang_pass_object_size __buf, size_t __size))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__getcwd_warn, __size, __buf,
++				       "getcwd called with bigger length than "
++				       "size of destination buffer")
++{
 +  if (__FORTIFY_CALL_CHK && __bos (__buf) != (size_t) -1)
 +    return __getcwd_chk (__buf, __size, __bos (__buf));
    return __getcwd_alias (__buf, __size);
@@ -1268,11 +1271,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -     __nonnull ((1)) __wur __warnattr ("please use getcwd instead, as getwd "
 -				       "doesn't specify buffer size");
 +     __nonnull ((1)) __wur __warnattr (__warn_getwd_use_something_else);
-+
-+extern char *__REDIRECT (__getwd_alias, (char *__str), getwd) __wur;
  
 -__fortify_function __nonnull ((1)) __attribute_deprecated__ __wur char *
 -__NTH (getwd (char *__buf))
++extern char *__REDIRECT (__getwd_alias, (char *__str), getwd) __wur;
++
 +__fortify_potential_overload __nonnull ((1)) __attribute_deprecated__ __wur
 +char *
 +__NTH (getwd (char *const __clang_pass_object_size __buf))
@@ -1295,25 +1298,26 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			       size_t __buflen), __confstr_chk)
 -     __warnattr ("confstr called with bigger length than size of destination "
 -		 "buffer");
- 
+-
 -__fortify_function size_t
 -__NTH (confstr (int __name, char *__buf, size_t __len))
-+__fortify_potential_overload size_t
-+__NTH (confstr (int __name, char *const __clang_pass_object_size __buf,
-+		size_t __len))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__confstr_warn, __len, __buf,
-+				       "confstr called with bigger length than "
-+				       "size of destination buffer")
- {
+-{
 -  if (__bos (__buf) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__len))
 -	return __confstr_chk (__name, __buf, __len, __bos (__buf));
--
+ 
 -      if (__bos (__buf) < __len)
 -	return __confstr_chk_warn (__name, __buf, __len, __bos (__buf));
 -    }
++__fortify_potential_overload size_t
++__NTH (confstr (int __name, char *const __clang_pass_object_size __buf,
++		size_t __len))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__confstr_warn, __len, __buf,
++				       "confstr called with bigger length than "
++				       "size of destination buffer")
++{
 +  if (__FORTIFY_CALL_CHK && __bos (__buf) != (size_t) -1)
 +    return __confstr_chk (__name, __buf, __len, __bos (__buf));
    return __confstr_alias (__name, __buf, __len);
@@ -1333,15 +1337,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -
 -__fortify_function int
 -__NTH (getgroups (int __size, __gid_t __list[]))
--{
--  if (__bos (__list) != (size_t) -1)
--    {
--      if (!__builtin_constant_p (__size) || __size < 0)
--	return __getgroups_chk (__size, __list, __bos (__list));
--
--      if (__size * sizeof (__gid_t) > __bos (__list))
--	return __getgroups_chk_warn (__size, __list, __bos (__list));
--    }
 +
 +__fortify_potential_overload int
 +__NTH (getgroups (int __size, __gid_t *const __clang_pass_object_size __list))
@@ -1351,7 +1346,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +				       "getgroups called with bigger group "
 +				       "count than what can fit into "
 +				       "destination buffer")
-+{
+ {
+-  if (__bos (__list) != (size_t) -1)
+-    {
+-      if (!__builtin_constant_p (__size) || __size < 0)
+-	return __getgroups_chk (__size, __list, __bos (__list));
+-
+-      if (__size * sizeof (__gid_t) > __bos (__list))
+-	return __getgroups_chk_warn (__size, __list, __bos (__list));
+-    }
 +  if (__FORTIFY_CALL_CHK && __bos (__list) != (size_t) -1)
 +    return __getgroups_chk (__size, __list, __bos (__list));
    return __getgroups_alias (__size, __list);
@@ -1360,13 +1363,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  extern int __ttyname_r_chk (int __fd, char *__buf, size_t __buflen,
-@@ -287,19 +242,19 @@ extern int __REDIRECT_NTH (__ttyname_r_c
+@@ -287,19 +242,19 @@ extern int __REDIRECT_NTH (__ttyname_r_chk_warn,
       __nonnull ((2)) __warnattr ("ttyname_r called with bigger buflen than "
  				 "size of destination buffer");
  
 -__fortify_function int
 -__NTH (ttyname_r (int __fd, char *__buf, size_t __buflen))
--{
++__fortify_potential_overload int
++__NTH (ttyname_r (int __fd, char *const __clang_pass_object_size __buf,
++		  size_t __buflen))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__ttyname_r_warn, __buflen, __buf,
++				       "ttyname_r called with bigger buflen "
++				       "than size of destination buffer")
+ {
 -  if (__bos (__buf) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__buflen))
@@ -1377,14 +1387,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    }
 -  return __ttyname_r_alias (__fd, __buf, __buflen);
 -}
-+__fortify_potential_overload int
-+__NTH (ttyname_r (int __fd, char *const __clang_pass_object_size __buf,
-+		  size_t __buflen))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__ttyname_r_warn, __buflen, __buf,
-+				       "ttyname_r called with bigger buflen "
-+				       "than size of destination buffer")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos (__buf) != (size_t) -1)
 +    return __ttyname_r_chk (__fd, __buf, __buflen, __bos (__buf));
 +   return __ttyname_r_alias (__fd, __buf, __buflen);
@@ -1393,7 +1395,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  #ifdef __USE_POSIX199506
-@@ -307,25 +262,19 @@ extern int __getlogin_r_chk (char *__buf
+@@ -307,25 +262,19 @@ extern int __getlogin_r_chk (char *__buf, size_t __buflen, size_t __nreal)
       __nonnull ((1));
  extern int __REDIRECT (__getlogin_r_alias, (char *__buf, size_t __buflen),
  		       getlogin_r) __nonnull ((1));
@@ -1428,7 +1430,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  
-@@ -334,25 +283,20 @@ extern int __gethostname_chk (char *__bu
+@@ -334,25 +283,20 @@ extern int __gethostname_chk (char *__buf, size_t __buflen, size_t __nreal)
       __THROW __nonnull ((1));
  extern int __REDIRECT_NTH (__gethostname_alias, (char *__buf, size_t __buflen),
  			   gethostname) __nonnull ((1));
@@ -1464,7 +1466,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  
-@@ -362,24 +306,18 @@ extern int __getdomainname_chk (char *__
+@@ -362,24 +306,18 @@ extern int __getdomainname_chk (char *__buf, size_t __buflen, size_t __nreal)
  extern int __REDIRECT_NTH (__getdomainname_alias, (char *__buf,
  						   size_t __buflen),
  			   getdomainname) __nonnull ((1)) __wur;
@@ -1474,34 +1476,37 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -     __nonnull ((1)) __wur __warnattr ("getdomainname called with bigger "
 -				       "buflen than size of destination "
 -				       "buffer");
- 
+-
 -__fortify_function int
 -__NTH (getdomainname (char *__buf, size_t __buflen))
-+__fortify_potential_overload int
-+__NTH (getdomainname (char *const __clang_pass_object_size __buf,
-+		      size_t __buflen))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__getdomainname_warn, __buflen, __buf,
-+				       "getdomainname called with bigger "
-+				       "buflen than size of destination buffer")
- {
+-{
 -  if (__bos (__buf) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__buflen))
 -	return __getdomainname_chk (__buf, __buflen, __bos (__buf));
--
+ 
 -      if (__buflen > __bos (__buf))
 -	return __getdomainname_chk_warn (__buf, __buflen, __bos (__buf));
 -    }
++__fortify_potential_overload int
++__NTH (getdomainname (char *const __clang_pass_object_size __buf,
++		      size_t __buflen))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__getdomainname_warn, __buflen, __buf,
++				       "getdomainname called with bigger "
++				       "buflen than size of destination buffer")
++{
 +  if (__FORTIFY_CALL_CHK && __bos (__buf) != (size_t) -1)
 +    return __getdomainname_chk (__buf, __buflen, __bos (__buf));
    return __getdomainname_alias (__buf, __buflen);
  }
 +__FORTIFY_FUNCTION_END
  #endif
+diff --git a/rt/bits/mqueue2.h b/rt/bits/mqueue2.h
+index 354f0d53bf..388b63a4f8 100644
 --- a/rt/bits/mqueue2.h
 +++ b/rt/bits/mqueue2.h
-@@ -29,10 +29,47 @@ extern mqd_t __mq_open_2 (const char *__
+@@ -29,10 +29,47 @@ extern mqd_t __mq_open_2 (const char *__name, int __oflag)
  extern mqd_t __REDIRECT_NTH (__mq_open_alias, (const char *__name,
  					       int __oflag, ...), mq_open)
       __nonnull ((1));
@@ -1551,16 +1556,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  __fortify_function mqd_t
  __NTH (mq_open (const char *__name, int __oflag, ...))
-@@ -55,3 +92,6 @@ __NTH (mq_open (const char *__name, int
+@@ -55,3 +92,6 @@ __NTH (mq_open (const char *__name, int __oflag, ...))
  
    return __mq_open_alias (__name, __oflag, __va_arg_pack ());
  }
 +#endif
 +#undef __warn_mq_open_wrong_number_of_args
 +#undef __warn_mq_open_missing_mode_and_attr
+diff --git a/rt/mqueue.h b/rt/mqueue.h
+index a2a2aa1771..5a2976d1be 100644
 --- a/rt/mqueue.h
 +++ b/rt/mqueue.h
-@@ -89,7 +89,7 @@ extern int mq_timedsend (mqd_t __mqdes,
+@@ -89,7 +89,7 @@ extern int mq_timedsend (mqd_t __mqdes, const char *__msg_ptr,
  
  /* Define some inlines helping to catch common problems.  */
  #if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function \
@@ -1569,9 +1576,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # include <bits/mqueue2.h>
  #endif
  
+diff --git a/socket/bits/socket2.h b/socket/bits/socket2.h
+index c0421ce244..12d2e75f57 100644
 --- a/socket/bits/socket2.h
 +++ b/socket/bits/socket2.h
-@@ -24,25 +24,20 @@ extern ssize_t __recv_chk (int __fd, voi
+@@ -24,25 +24,20 @@ extern ssize_t __recv_chk (int __fd, void *__buf, size_t __n, size_t __buflen,
  			   int __flags);
  extern ssize_t __REDIRECT (__recv_alias, (int __fd, void *__buf, size_t __n,
  					  int __flags), recv);
@@ -1607,7 +1616,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  extern ssize_t __recvfrom_chk (int __fd, void *__restrict __buf, size_t __n,
  			       size_t __buflen, int __flags,
-@@ -52,26 +47,19 @@ extern ssize_t __REDIRECT (__recvfrom_al
+@@ -52,26 +47,19 @@ extern ssize_t __REDIRECT (__recvfrom_alias,
  			   (int __fd, void *__restrict __buf, size_t __n,
  			    int __flags, __SOCKADDR_ARG __addr,
  			    socklen_t *__restrict __addr_len), recvfrom);
@@ -1646,9 +1655,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    return __recvfrom_alias (__fd, __buf, __n, __flags, __addr, __addr_len);
  }
 +__FORTIFY_FUNCTION_END
+diff --git a/stdlib/bits/stdlib.h b/stdlib/bits/stdlib.h
+index bfdee75073..a15f965b12 100644
 --- a/stdlib/bits/stdlib.h
 +++ b/stdlib/bits/stdlib.h
-@@ -26,27 +26,27 @@ extern char *__realpath_chk (const char
+@@ -26,27 +26,27 @@ extern char *__realpath_chk (const char *__restrict __name,
  extern char *__REDIRECT_NTH (__realpath_alias,
  			     (const char *__restrict __name,
  			      char *__restrict __resolved), realpath) __wur;
@@ -1691,7 +1702,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  extern int __ptsname_r_chk (int __fd, char *__buf, size_t __buflen,
-@@ -54,33 +54,28 @@ extern int __ptsname_r_chk (int __fd, ch
+@@ -54,33 +54,28 @@ extern int __ptsname_r_chk (int __fd, char *__buf, size_t __buflen,
  extern int __REDIRECT_NTH (__ptsname_r_alias, (int __fd, char *__buf,
  					       size_t __buflen), ptsname_r)
       __nonnull ((2));
@@ -1700,9 +1711,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			    size_t __nreal), __ptsname_r_chk)
 -     __nonnull ((2)) __warnattr ("ptsname_r called with buflen bigger than "
 -				 "size of buf");
- 
+-
 -__fortify_function int
 -__NTH (ptsname_r (int __fd, char *__buf, size_t __buflen))
++
 +__fortify_potential_overload int
 +__NTH (ptsname_r (int __fd, char *const __clang_pass_object_size __buf,
 +		  size_t __buflen))
@@ -1737,7 +1749,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    /* We would have to include <limits.h> to get a definition of MB_LEN_MAX.
       But this would only disturb the namespace.  So we define our own
-@@ -102,29 +97,22 @@ extern size_t __REDIRECT_NTH (__mbstowcs
+@@ -102,29 +97,22 @@ extern size_t __REDIRECT_NTH (__mbstowcs_alias,
  			      (wchar_t *__restrict __dst,
  			       const char *__restrict __src,
  			       size_t __len), mbstowcs);
@@ -1747,11 +1759,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			       size_t __len, size_t __dstlen), __mbstowcs_chk)
 -     __warnattr ("mbstowcs called with dst buffer smaller than len "
 -		 "* sizeof (wchar_t)");
--
+ 
 -__fortify_function size_t
 -__NTH (mbstowcs (wchar_t *__restrict __dst, const char *__restrict __src,
 -		 size_t __len))
-+
 +__fortify_potential_overload size_t
 +__NTH (mbstowcs (wchar_t *__restrict const __clang_pass_object_size __dst,
 +		 const char *__restrict __src, size_t __len))
@@ -1780,7 +1791,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  extern size_t __wcstombs_chk (char *__restrict __dst,
-@@ -134,22 +122,17 @@ extern size_t __REDIRECT_NTH (__wcstombs
+@@ -134,22 +122,17 @@ extern size_t __REDIRECT_NTH (__wcstombs_alias,
  			      (char *__restrict __dst,
  			       const wchar_t *__restrict __src,
  			       size_t __len), wcstombs);
@@ -1813,6 +1824,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    return __wcstombs_alias (__dst, __src, __len);
  }
 +__FORTIFY_FUNCTION_END
+diff --git a/string/bits/string_fortified.h b/string/bits/string_fortified.h
+index e4d07cb50c..f73528ba7e 100644
 --- a/string/bits/string_fortified.h
 +++ b/string/bits/string_fortified.h
 @@ -22,45 +22,82 @@
@@ -1827,14 +1840,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -__fortify_function void *
 -__NTH (memcpy (void *__restrict __dest, const void *__restrict __src,
 -	       size_t __len))
--{
--  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
--}
--
--__fortify_function void *
--__NTH (memmove (void *__dest, const void *__src, size_t __len))
--{
--  return __builtin___memmove_chk (__dest, __src, __len, __bos0 (__dest));
 +#define __warn_len_too_large \
 +  "function called with bigger length than the destination buffer"
 +/* Repeat bodies here to reduce 'note's if we detect a problem.  */
@@ -1857,19 +1862,23 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +__NTH (memcpy (void *__restrict const __clang_pass_object_size0 __dest,
 +	       const void *__restrict __src, size_t __len))
 +     __warn_if_dest_too_small0 (__dest, __len)
-+{
+ {
+-  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
 +  size_t __bos_dst = __bos0 (__dest);
 +  if (__bos_dst == (size_t) -1 || (__builtin_constant_p (__len)
 +				   && __bos_dst >= __len))
 +    return __builtin_memcpy (__dest, __src, __len);
 +  return __builtin___memcpy_chk (__dest, __src, __len, __bos_dst);
-+}
-+
+ }
+ 
+-__fortify_function void *
+-__NTH (memmove (void *__dest, const void *__src, size_t __len))
 +__fortify_potential_overload void *
 +__NTH (memmove (void *const __clang_pass_object_size0 __dest,
 +		const void *__src, size_t __len))
 +     __warn_if_dest_too_small0 (__dest, __len)
-+{
+ {
+-  return __builtin___memmove_chk (__dest, __src, __len, __bos0 (__dest));
 +  size_t __bos_dst = __bos0 (__dest);
 +  if (__bos_dst == (size_t) -1 || (__builtin_constant_p (__len)
 +				   && __bos_dst >= __len))
@@ -1881,13 +1890,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -__fortify_function void *
 -__NTH (mempcpy (void *__restrict __dest, const void *__restrict __src,
 -		size_t __len))
--{
--  return __builtin___mempcpy_chk (__dest, __src, __len, __bos0 (__dest));
 +__fortify_potential_overload void *
 +__NTH (mempcpy (void *__restrict const __clang_pass_object_size0 __dest,
 +		const void *__restrict __src, size_t __len))
 +     __warn_if_dest_too_small0 (__dest, __len)
-+{
+ {
+-  return __builtin___mempcpy_chk (__dest, __src, __len, __bos0 (__dest));
 +  size_t __bos_dst = __bos0 (__dest);
 +  if (__bos_dst == (size_t) -1 || (__builtin_constant_p (__len)
 +				   && __bos_dst >= __len))
@@ -1923,7 +1931,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    if (__builtin_constant_p (__len) && __len == 0
        && (!__builtin_constant_p (__ch) || __ch != 0))
      {
-@@ -68,8 +105,13 @@ __NTH (memset (void *__dest, int __ch, s
+@@ -68,8 +105,13 @@ __NTH (memset (void *__dest, int __ch, size_t __len))
        return __dest;
      }
  #endif
@@ -1938,7 +1946,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #ifdef __USE_MISC
  # include <bits/strings_fortified.h>
-@@ -84,24 +126,30 @@ __NTH (explicit_bzero (void *__dest, siz
+@@ -84,24 +126,30 @@ __NTH (explicit_bzero (void *__dest, size_t __len))
  }
  #endif
  
@@ -1977,7 +1985,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
  }
-@@ -112,28 +160,36 @@ extern char *__stpncpy_chk (char *__dest
+@@ -112,28 +160,36 @@ extern char *__stpncpy_chk (char *__dest, const char *__src, size_t __n,
  extern char *__REDIRECT_NTH (__stpncpy_alias, (char *__dest, const char *__src,
  					       size_t __n), stpncpy);
  
@@ -2025,6 +2033,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#undef __warn_input_str_too_large
 +#undef __warn_if_src_too_large
  #endif /* bits/string_fortified.h */
+diff --git a/string/bits/strings_fortified.h b/string/bits/strings_fortified.h
+index d4091f4f69..4d0cd02612 100644
 --- a/string/bits/strings_fortified.h
 +++ b/string/bits/strings_fortified.h
 @@ -19,16 +19,40 @@
@@ -2074,6 +2084,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#undef __strings_size_too_small
 +#undef __strings_warn_len_too_large
  #endif
+diff --git a/wcsmbs/bits/wchar2.h b/wcsmbs/bits/wchar2.h
+index 86e8e23e76..1b0718119a 100644
 --- a/wcsmbs/bits/wchar2.h
 +++ b/wcsmbs/bits/wchar2.h
 @@ -20,7 +20,6 @@
@@ -2084,7 +2096,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  extern wchar_t *__wmemcpy_chk (wchar_t *__restrict __s1,
  			       const wchar_t *__restrict __s2, size_t __n,
  			       size_t __ns1) __THROW;
-@@ -28,57 +27,42 @@ extern wchar_t *__REDIRECT_NTH (__wmemcp
+@@ -28,57 +27,42 @@ extern wchar_t *__REDIRECT_NTH (__wmemcpy_alias,
  				(wchar_t *__restrict __s1,
  				 const wchar_t *__restrict __s2, size_t __n),
  				wmemcpy);
@@ -2098,7 +2110,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -__fortify_function wchar_t *
 -__NTH (wmemcpy (wchar_t *__restrict __s1, const wchar_t *__restrict __s2,
 -		size_t __n))
--{
++__fortify_potential_overload wchar_t *
++__NTH (wmemcpy (wchar_t *__restrict const __clang_pass_object_size0 __s1,
++	      const wchar_t *__restrict __s2, size_t __n))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS0_LT2 (__wmemcpy_warn, __n, __s1,
++					 sizeof (wchar_t),
++					 "wmemcpy called with length bigger "
++					 "than size of destination buffer")
+ {
 -  if (__bos0 (__s1) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__n))
@@ -2110,15 +2130,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -				   __bos0 (__s1) / sizeof (wchar_t));
 -    }
 -  return __wmemcpy_alias (__s1, __s2, __n);
-+__fortify_potential_overload wchar_t *
-+__NTH (wmemcpy (wchar_t *__restrict const __clang_pass_object_size0 __s1,
-+	      const wchar_t *__restrict __s2, size_t __n))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS0_LT2 (__wmemcpy_warn, __n, __s1,
-+					 sizeof (wchar_t),
-+					 "wmemcpy called with length bigger "
-+					 "than size of destination buffer")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos0 (__s1) != (size_t)-1)
 +    return __wmemcpy_chk(__s1, __s2, __n, __bos0(__s1) / sizeof (wchar_t));
 +  return __wmemcpy_alias(__s1, __s2, __n);
@@ -2139,7 +2150,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -
 -__fortify_function wchar_t *
 -__NTH (wmemmove (wchar_t *__s1, const wchar_t *__s2, size_t __n))
--{
++
++__fortify_potential_overload wchar_t *
++__NTH (wmemmove (wchar_t *const __clang_pass_object_size0 __s1,
++		 const wchar_t *__s2, size_t __n))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS0_LT2 (__wmemmove_warn, __n, __s1,
++					 sizeof (wchar_t),
++					 "wmemmove called with length bigger "
++					 "than size of destination buffer")
+ {
 -  if (__bos0 (__s1) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__n))
@@ -2150,16 +2170,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -	return __wmemmove_chk_warn (__s1, __s2, __n,
 -				    __bos0 (__s1) / sizeof (wchar_t));
 -    }
-+
-+__fortify_potential_overload wchar_t *
-+__NTH (wmemmove (wchar_t *const __clang_pass_object_size0 __s1,
-+		 const wchar_t *__s2, size_t __n))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS0_LT2 (__wmemmove_warn, __n, __s1,
-+					 sizeof (wchar_t),
-+					 "wmemmove called with length bigger "
-+					 "than size of destination buffer")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos0 (__s1) != (size_t) -1)
 +    return __wmemmove_chk (__s1, __s2, __n, __bos0 (__s1) / sizeof (wchar_t));
    return __wmemmove_alias (__s1, __s2, __n);
@@ -2168,7 +2178,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  #ifdef __USE_GNU
-@@ -89,29 +73,21 @@ extern wchar_t *__REDIRECT_NTH (__wmempc
+@@ -89,29 +73,21 @@ extern wchar_t *__REDIRECT_NTH (__wmempcpy_alias,
  				(wchar_t *__restrict __s1,
  				 const wchar_t *__restrict __s2,
  				 size_t __n), wmempcpy);
@@ -2182,7 +2192,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -__fortify_function wchar_t *
 -__NTH (wmempcpy (wchar_t *__restrict __s1, const wchar_t *__restrict __s2,
 -		 size_t __n))
--{
++
++__fortify_potential_overload wchar_t *
++__NTH(wmempcpy(wchar_t *__restrict const __clang_pass_object_size0 __s1,
++               const wchar_t *__restrict __s2, size_t __n))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS0_LT2 (__wmempcpy_warn, __n, __s1,
++					 sizeof (wchar_t),
++					 "wmempcpy called with length bigger "
++					 "than size of destination buffer")
+ {
 -  if (__bos0 (__s1) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__n))
@@ -2194,16 +2213,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -				    __bos0 (__s1) / sizeof (wchar_t));
 -    }
 -  return __wmempcpy_alias (__s1, __s2, __n);
-+
-+__fortify_potential_overload wchar_t *
-+__NTH(wmempcpy(wchar_t *__restrict const __clang_pass_object_size0 __s1,
-+               const wchar_t *__restrict __s2, size_t __n))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS0_LT2 (__wmempcpy_warn, __n, __s1,
-+					 sizeof (wchar_t),
-+					 "wmempcpy called with length bigger "
-+					 "than size of destination buffer")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos0 (__s1) != (size_t)-1)
 +    return __wmempcpy_chk(__s1, __s2, __n, __bos0(__s1) / sizeof (wchar_t));
 +  return __wmempcpy_alias(__s1, __s2, __n);
@@ -2212,7 +2221,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  
-@@ -119,26 +95,21 @@ extern wchar_t *__wmemset_chk (wchar_t *
+@@ -119,26 +95,21 @@ extern wchar_t *__wmemset_chk (wchar_t *__s, wchar_t __c, size_t __n,
  			       size_t __ns) __THROW;
  extern wchar_t *__REDIRECT_NTH (__wmemset_alias, (wchar_t *__s, wchar_t __c,
  						  size_t __n), wmemset);
@@ -2224,16 +2233,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -
 -__fortify_function wchar_t *
 -__NTH (wmemset (wchar_t *__s, wchar_t __c, size_t __n))
--{
--  if (__bos0 (__s) != (size_t) -1)
--    {
--      if (!__builtin_constant_p (__n))
--	return __wmemset_chk (__s, __c, __n, __bos0 (__s) / sizeof (wchar_t));
--
--      if (__n > __bos0 (__s) / sizeof (wchar_t))
--	return __wmemset_chk_warn (__s, __c, __n,
--				   __bos0 (__s) / sizeof (wchar_t));
--    }
 +
 +__fortify_potential_overload wchar_t *
 +__NTH (wmemset (wchar_t *const __clang_pass_object_size0 __s, wchar_t __c,
@@ -2243,7 +2242,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +					 sizeof (wchar_t),
 +					 "wmemset called with length bigger "
 +					 "than size of destination buffer")
-+{
+ {
+-  if (__bos0 (__s) != (size_t) -1)
+-    {
+-      if (!__builtin_constant_p (__n))
+-	return __wmemset_chk (__s, __c, __n, __bos0 (__s) / sizeof (wchar_t));
+-
+-      if (__n > __bos0 (__s) / sizeof (wchar_t))
+-	return __wmemset_chk_warn (__s, __c, __n,
+-				   __bos0 (__s) / sizeof (wchar_t));
+-    }
 +  if (__FORTIFY_CALL_CHK && __bos0 (__s) != (size_t) -1)
 +    return __wmemset_chk (__s, __c, __n, __bos0 (__s) / sizeof (wchar_t));
    return __wmemset_alias (__s, __c, __n);
@@ -2252,7 +2260,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  extern wchar_t *__wcscpy_chk (wchar_t *__restrict __dest,
-@@ -148,8 +119,9 @@ extern wchar_t *__REDIRECT_NTH (__wcscpy
+@@ -148,8 +119,9 @@ extern wchar_t *__REDIRECT_NTH (__wcscpy_alias,
  				(wchar_t *__restrict __dest,
  				 const wchar_t *__restrict __src), wcscpy);
  
@@ -2264,7 +2272,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    if (__bos (__dest) != (size_t) -1)
      return __wcscpy_chk (__dest, __src, __bos (__dest) / sizeof (wchar_t));
-@@ -164,8 +136,9 @@ extern wchar_t *__REDIRECT_NTH (__wcpcpy
+@@ -164,8 +136,9 @@ extern wchar_t *__REDIRECT_NTH (__wcpcpy_alias,
  				(wchar_t *__restrict __dest,
  				 const wchar_t *__restrict __src), wcpcpy);
  
@@ -2276,7 +2284,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    if (__bos (__dest) != (size_t) -1)
      return __wcpcpy_chk (__dest, __src, __bos (__dest) / sizeof (wchar_t));
-@@ -180,28 +153,22 @@ extern wchar_t *__REDIRECT_NTH (__wcsncp
+@@ -180,28 +153,22 @@ extern wchar_t *__REDIRECT_NTH (__wcsncpy_alias,
  				(wchar_t *__restrict __dest,
  				 const wchar_t *__restrict __src,
  				 size_t __n), wcsncpy);
@@ -2317,7 +2325,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  extern wchar_t *__wcpncpy_chk (wchar_t *__restrict __dest,
-@@ -211,29 +178,22 @@ extern wchar_t *__REDIRECT_NTH (__wcpncp
+@@ -211,29 +178,22 @@ extern wchar_t *__REDIRECT_NTH (__wcpncpy_alias,
  				(wchar_t *__restrict __dest,
  				 const wchar_t *__restrict __src,
  				 size_t __n), wcpncpy);
@@ -2359,7 +2367,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  extern wchar_t *__wcscat_chk (wchar_t *__restrict __dest,
  			      const wchar_t *__restrict __src,
-@@ -242,8 +202,9 @@ extern wchar_t *__REDIRECT_NTH (__wcscat
+@@ -242,8 +202,9 @@ extern wchar_t *__REDIRECT_NTH (__wcscat_alias,
  				(wchar_t *__restrict __dest,
  				 const wchar_t *__restrict __src), wcscat);
  
@@ -2371,7 +2379,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    if (__bos (__dest) != (size_t) -1)
      return __wcscat_chk (__dest, __src, __bos (__dest) / sizeof (wchar_t));
-@@ -259,9 +220,9 @@ extern wchar_t *__REDIRECT_NTH (__wcsnca
+@@ -259,9 +220,9 @@ extern wchar_t *__REDIRECT_NTH (__wcsncat_alias,
  				 const wchar_t *__restrict __src,
  				 size_t __n), wcsncat);
  
@@ -2384,7 +2392,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    if (__bos (__dest) != (size_t) -1)
      return __wcsncat_chk (__dest, __src, __n,
-@@ -280,16 +241,34 @@ extern int __REDIRECT_NTH_LDBL (__swprin
+@@ -280,16 +241,34 @@ extern int __REDIRECT_NTH_LDBL (__swprintf_alias,
  				 const wchar_t *__restrict __fmt, ...),
  				swprintf);
  
@@ -2427,7 +2435,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
  #elif !defined __cplusplus
  /* XXX We might want to have support in gcc for swprintf.  */
-@@ -300,20 +279,10 @@ __NTH (swprintf (wchar_t *__restrict __s
+@@ -300,20 +279,10 @@ __NTH (swprintf (wchar_t *__restrict __s, size_t __n,
     : swprintf (s, n, __VA_ARGS__))
  #endif
  
@@ -2452,37 +2460,34 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    if (__bos (__s) != (size_t) -1 || __USE_FORTIFY_LEVEL > 1)
      return __vswprintf_chk (__s, __n,  __USE_FORTIFY_LEVEL - 1,
-@@ -334,18 +303,27 @@ extern int __vfwprintf_chk (__FILE *__re
+@@ -334,18 +303,27 @@ extern int __vfwprintf_chk (__FILE *__restrict __stream, int __flag,
  extern int __vwprintf_chk (int __flag, const wchar_t *__restrict __format,
  			   __gnuc_va_list __ap);
  
 -# ifdef __va_arg_pack
 -__fortify_function int
 -wprintf (const wchar_t *__restrict __fmt, ...)
--{
--  return __wprintf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
--}
- 
--__fortify_function int
--fwprintf (__FILE *__restrict __stream, const wchar_t *__restrict __fmt, ...)
--{
--  return __fwprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
--			 __va_arg_pack ());
++
 +#ifdef __FORTIFY_ARG_PACK_OK
 +__fortify_potential_overload int
 +wprintf (const wchar_t *__restrict const __clang_pass_object_size __fmt, ...)
-+{
+ {
+-  return __wprintf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __r = __FORTIFY_CALL_VA_CHK (wprintf, __USE_FORTIFY_LEVEL - 1, __fmt,
 +				   __FORTIFY_ARG_PACK);
 +  __FORTIFY_FREE_ARG_PACK();
 +  return __r;
-+}
-+
+ }
+ 
+-__fortify_function int
+-fwprintf (__FILE *__restrict __stream, const wchar_t *__restrict __fmt, ...)
 +__fortify_potential_overload int
 +fwprintf (__FILE *__restrict const __clang_pass_object_size __stream,
 +	  const wchar_t *__restrict __fmt, ...)
-+{
+ {
+-  return __fwprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
+-			 __va_arg_pack ());
 +  __FORTIFY_INIT_ARG_PACK(__fmt);
 +  int __r = __FORTIFY_CALL_VA_CHK (fwprintf, __stream, __USE_FORTIFY_LEVEL - 1,
 +				   __fmt, __FORTIFY_ARG_PACK);
@@ -2491,7 +2496,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
  # elif !defined __cplusplus
  #  define wprintf(...) \
-@@ -354,14 +332,15 @@ fwprintf (__FILE *__restrict __stream, c
+@@ -354,14 +332,15 @@ fwprintf (__FILE *__restrict __stream, const wchar_t *__restrict __fmt, ...)
    __fwprintf_chk (stream, __USE_FORTIFY_LEVEL - 1, __VA_ARGS__)
  # endif
  
@@ -2511,7 +2516,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	   const wchar_t *__restrict __fmt, __gnuc_va_list __ap)
  {
    return __vfwprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt, __ap);
-@@ -374,27 +353,21 @@ extern wchar_t *__fgetws_chk (wchar_t *_
+@@ -374,27 +353,21 @@ extern wchar_t *__fgetws_chk (wchar_t *__restrict __s, size_t __size, int __n,
  extern wchar_t *__REDIRECT (__fgetws_alias,
  			    (wchar_t *__restrict __s, int __n,
  			     __FILE *__restrict __stream), fgetws) __wur;
@@ -2520,28 +2525,29 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			     __FILE *__restrict __stream), __fgetws_chk)
 -     __wur __warnattr ("fgetws called with bigger size than length "
 -		       "of destination buffer");
- 
+-
 -__fortify_function __wur wchar_t *
 -fgetws (wchar_t *__restrict __s, int __n, __FILE *__restrict __stream)
-+__fortify_potential_overload __wur wchar_t *
-+fgetws (wchar_t *__restrict const __clang_pass_object_size __s, int __n,
-+	__FILE *__restrict __stream)
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT2 (__fgetws_warn, __n, __s,
-+					sizeof (wchar_t),
-+					"fgetws called with length bigger "
-+					"than size of destination buffer")
- {
+-{
 -  if (__bos (__s) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__n) || __n <= 0)
 -	return __fgetws_chk (__s, __bos (__s) / sizeof (wchar_t),
 -			     __n, __stream);
--
+ 
 -      if ((size_t) __n > __bos (__s) / sizeof (wchar_t))
 -	return __fgetws_chk_warn (__s, __bos (__s) / sizeof (wchar_t),
 -				  __n, __stream);
 -    }
++__fortify_potential_overload __wur wchar_t *
++fgetws (wchar_t *__restrict const __clang_pass_object_size __s, int __n,
++	__FILE *__restrict __stream)
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT2 (__fgetws_warn, __n, __s,
++					sizeof (wchar_t),
++					"fgetws called with length bigger "
++					"than size of destination buffer")
++{
 +  if (__FORTIFY_CALL_CHK && __bos (__s) != (size_t) -1)
 +    return __fgetws_chk (__s, __bos (__s) / sizeof (wchar_t), __n, __stream);
    return __fgetws_alias (__s, __n, __stream);
@@ -2550,7 +2556,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #ifdef __USE_GNU
  extern wchar_t *__fgetws_unlocked_chk (wchar_t *__restrict __s, size_t __size,
-@@ -404,28 +377,23 @@ extern wchar_t *__REDIRECT (__fgetws_unl
+@@ -404,28 +377,23 @@ extern wchar_t *__REDIRECT (__fgetws_unlocked_alias,
  			    (wchar_t *__restrict __s, int __n,
  			     __FILE *__restrict __stream), fgetws_unlocked)
    __wur;
@@ -2560,9 +2566,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			    __fgetws_unlocked_chk)
 -     __wur __warnattr ("fgetws_unlocked called with bigger size than length "
 -		       "of destination buffer");
- 
+-
 -__fortify_function __wur wchar_t *
 -fgetws_unlocked (wchar_t *__restrict __s, int __n, __FILE *__restrict __stream)
++
 +__fortify_potential_overload __wur wchar_t *
 +fgetws_unlocked (wchar_t *__restrict const __clang_pass_object_size __s,
 +		 int __n, __FILE *__restrict __stream)
@@ -2591,7 +2598,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  
-@@ -436,9 +404,9 @@ extern size_t __REDIRECT_NTH (__wcrtomb_
+@@ -436,9 +404,9 @@ extern size_t __REDIRECT_NTH (__wcrtomb_alias,
  			      (char *__restrict __s, wchar_t __wchar,
  			       mbstate_t *__restrict __ps), wcrtomb) __wur;
  
@@ -2604,7 +2611,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
    /* We would have to include <limits.h> to get a definition of MB_LEN_MAX.
       But this would only disturb the namespace.  So we define our own
-@@ -462,30 +430,23 @@ extern size_t __REDIRECT_NTH (__mbsrtowc
+@@ -462,30 +430,23 @@ extern size_t __REDIRECT_NTH (__mbsrtowcs_alias,
  			       const char **__restrict __src,
  			       size_t __len, mbstate_t *__restrict __ps),
  			      mbsrtowcs);
@@ -2615,11 +2622,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			       size_t __dstlen), __mbsrtowcs_chk)
 -     __warnattr ("mbsrtowcs called with dst buffer smaller than len "
 -		 "* sizeof (wchar_t)");
--
+ 
 -__fortify_function size_t
 -__NTH (mbsrtowcs (wchar_t *__restrict __dst, const char **__restrict __src,
 -		  size_t __len, mbstate_t *__restrict __ps))
--{
++__fortify_potential_overload size_t
++__NTH (mbsrtowcs (wchar_t *__restrict const __clang_pass_object_size __dst,
++		  const char **__restrict __src, size_t __len,
++		  mbstate_t *__restrict __ps))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT2 (__mbsrtowcs_warn, __len, __dst,
++					sizeof (wchar_t),
++					"mbsrtowcs called with dst buffer "
++					"smaller than len * sizeof (wchar_t)")
+ {
 -  if (__bos (__dst) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__len))
@@ -2630,17 +2646,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -	return __mbsrtowcs_chk_warn (__dst, __src, __len, __ps,
 -				     __bos (__dst) / sizeof (wchar_t));
 -    }
-+
-+__fortify_potential_overload size_t
-+__NTH (mbsrtowcs (wchar_t *__restrict const __clang_pass_object_size __dst,
-+		  const char **__restrict __src, size_t __len,
-+		  mbstate_t *__restrict __ps))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT2 (__mbsrtowcs_warn, __len, __dst,
-+					sizeof (wchar_t),
-+					"mbsrtowcs called with dst buffer "
-+					"smaller than len * sizeof (wchar_t)")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos (__dst) != (size_t) -1)
 +    return __mbsrtowcs_chk (__dst, __src, __len, __ps,
 +			    __bos (__dst) / sizeof (wchar_t));
@@ -2650,7 +2655,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  extern size_t __wcsrtombs_chk (char *__restrict __dst,
-@@ -497,27 +458,21 @@ extern size_t __REDIRECT_NTH (__wcsrtomb
+@@ -497,27 +458,21 @@ extern size_t __REDIRECT_NTH (__wcsrtombs_alias,
  			       const wchar_t **__restrict __src,
  			       size_t __len, mbstate_t *__restrict __ps),
  			      wcsrtombs);
@@ -2664,15 +2669,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -__fortify_function size_t
 -__NTH (wcsrtombs (char *__restrict __dst, const wchar_t **__restrict __src,
 -		  size_t __len, mbstate_t *__restrict __ps))
--{
--  if (__bos (__dst) != (size_t) -1)
--    {
--      if (!__builtin_constant_p (__len))
--	return __wcsrtombs_chk (__dst, __src, __len, __ps, __bos (__dst));
--
--      if (__len > __bos (__dst))
--	return __wcsrtombs_chk_warn (__dst, __src, __len, __ps, __bos (__dst));
--    }
 +__fortify_potential_overload size_t
 +__NTH (wcsrtombs (char *__restrict const __clang_pass_object_size __dst,
 +		  const wchar_t **__restrict __src, size_t __len,
@@ -2681,7 +2677,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__wcsrtombs_warn, __len, __dst,
 +				       "wcsrtombs called with dst buffer "
 +				       "smaller than len")
-+{
+ {
+-  if (__bos (__dst) != (size_t) -1)
+-    {
+-      if (!__builtin_constant_p (__len))
+-	return __wcsrtombs_chk (__dst, __src, __len, __ps, __bos (__dst));
+-
+-      if (__len > __bos (__dst))
+-	return __wcsrtombs_chk_warn (__dst, __src, __len, __ps, __bos (__dst));
+-    }
 +  if (__FORTIFY_CALL_CHK && __bos (__dst) != (size_t) -1)
 +    return __wcsrtombs_chk (__dst, __src, __len, __ps, __bos (__dst));
    return __wcsrtombs_alias (__dst, __src, __len, __ps);
@@ -2690,7 +2694,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  #ifdef __USE_GNU
-@@ -530,30 +485,23 @@ extern size_t __REDIRECT_NTH (__mbsnrtow
+@@ -530,30 +485,23 @@ extern size_t __REDIRECT_NTH (__mbsnrtowcs_alias,
  			       const char **__restrict __src, size_t __nmc,
  			       size_t __len, mbstate_t *__restrict __ps),
  			      mbsnrtowcs);
@@ -2701,11 +2705,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			       size_t __dstlen), __mbsnrtowcs_chk)
 -     __warnattr ("mbsnrtowcs called with dst buffer smaller than len "
 -		 "* sizeof (wchar_t)");
--
+ 
 -__fortify_function size_t
 -__NTH (mbsnrtowcs (wchar_t *__restrict __dst, const char **__restrict __src,
 -		   size_t __nmc, size_t __len, mbstate_t *__restrict __ps))
--{
++__fortify_potential_overload size_t
++__NTH (mbsnrtowcs (wchar_t *__restrict const __clang_pass_object_size __dst,
++		   const char **__restrict __src, size_t __nmc, size_t __len,
++		   mbstate_t *__restrict __ps))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__mbsnrtowcs_warn,
++				       sizeof (wchar_t) * __len, __dst,
++				       "mbsnrtowcs called with dst buffer "
++				       "smaller than len * sizeof (wchar_t)")
+ {
 -  if (__bos (__dst) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__len))
@@ -2716,17 +2729,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -	return __mbsnrtowcs_chk_warn (__dst, __src, __nmc, __len, __ps,
 -				      __bos (__dst) / sizeof (wchar_t));
 -    }
-+
-+__fortify_potential_overload size_t
-+__NTH (mbsnrtowcs (wchar_t *__restrict const __clang_pass_object_size __dst,
-+		   const char **__restrict __src, size_t __nmc, size_t __len,
-+		   mbstate_t *__restrict __ps))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__mbsnrtowcs_warn,
-+				       sizeof (wchar_t) * __len, __dst,
-+				       "mbsnrtowcs called with dst buffer "
-+				       "smaller than len * sizeof (wchar_t)")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos (__dst) != (size_t) -1)
 +    return __mbsnrtowcs_chk (__dst, __src, __nmc, __len, __ps,
 +			     __bos (__dst) / sizeof (wchar_t));
@@ -2736,7 +2738,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  extern size_t __wcsnrtombs_chk (char *__restrict __dst,
-@@ -566,28 +514,19 @@ extern size_t __REDIRECT_NTH (__wcsnrtom
+@@ -566,28 +514,19 @@ extern size_t __REDIRECT_NTH (__wcsnrtombs_alias,
  			       const wchar_t **__restrict __src,
  			       size_t __nwc, size_t __len,
  			       mbstate_t *__restrict __ps), wcsnrtombs);
@@ -2747,11 +2749,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -			       mbstate_t *__restrict __ps,
 -			       size_t __dstlen), __wcsnrtombs_chk)
 -     __warnattr ("wcsnrtombs called with dst buffer smaller than len");
--
+ 
 -__fortify_function size_t
 -__NTH (wcsnrtombs (char *__restrict __dst, const wchar_t **__restrict __src,
 -		   size_t __nwc, size_t __len, mbstate_t *__restrict __ps))
--{
++__fortify_potential_overload size_t
++__NTH (wcsnrtombs (char *__restrict const __clang_pass_object_size __dst,
++		   const wchar_t **__restrict __src, size_t __nwc, size_t __len,
++		   mbstate_t *__restrict __ps))
++__FORTIFY_PRECONDITIONS
++     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__wcsnrtombs_warn, __len, __dst,
++				       "wcsnrtombs called with dst buffer "
++				       "smaller than len")
+ {
 -  if (__bos (__dst) != (size_t) -1)
 -    {
 -      if (!__builtin_constant_p (__len))
@@ -2762,16 +2772,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -	return __wcsnrtombs_chk_warn (__dst, __src, __nwc, __len, __ps,
 -				      __bos (__dst));
 -    }
-+
-+__fortify_potential_overload size_t
-+__NTH (wcsnrtombs (char *__restrict const __clang_pass_object_size __dst,
-+		   const wchar_t **__restrict __src, size_t __nwc, size_t __len,
-+		   mbstate_t *__restrict __ps))
-+__FORTIFY_PRECONDITIONS
-+     __FORTIFY_WARNING_ONLY_IF_BOS_LT (__wcsnrtombs_warn, __len, __dst,
-+				       "wcsnrtombs called with dst buffer "
-+				       "smaller than len")
-+{
 +  if (__FORTIFY_CALL_CHK && __bos (__dst) != (size_t) -1)
 +    return __wcsnrtombs_chk (__dst, __src, __nwc, __len, __ps, __bos (__dst));
    return __wcsnrtombs_alias (__dst, __src, __nwc, __len, __ps);
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index b8c570db52..3dec43e537 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -32,16 +32,15 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0019-Remove-bash-dependency-for-nscd-init-script.patch \
            file://0020-eglibc-Cross-building-and-testing-instructions.patch \
            file://0021-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0022-eglibc-Clear-cache-lines-on-ppc8xx.patch \
-           file://0023-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0026-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0027-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
-           file://0028-intl-Emit-no-lines-in-bison-generated-files.patch \
-           file://0029-inject-file-assembly-directives.patch \
-           file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://0031-Refactor-FORTIFY-in-glibc.patch \
+           file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0023-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0024-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
+           file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
+           file://0028-inject-file-assembly-directives.patch \
+           file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0030-Refactor-FORTIFY-in-glibc.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.0



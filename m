Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ED1CA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 22:42:19 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.60988.1754952132677765950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 15:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/JTAZiT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-240418cbb8bso31189405ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754952132; x=1755556932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJU+iuK1dEeZhwNGVDI5KeVVHzwS6pkZN2+0dyRDJ40=;
        b=B/JTAZiTO/W2GY2g6ZNN8lQLJhR3WWNiX7P6syIzavRLVQIODAiNOQGh6uHGEDmW4X
         S6T0xAJhhyt7pEzvVZWp81uzTkcyH9cfp24AJdeyWsv0xekttYmUZudKKw+uySCVoqPV
         +jtRQ4oWPl0dD6I0YPOy6oocby2K0PraQcIyntCYtnfG8D766Q2NwNeD+5KV7C/WOiAQ
         uCkbh7MKGD2HSxsVguJFUVrWEMajuXv+9qATXHroCMprxAu0WjPnLb1R0i82xTatJnHJ
         rc2eLeblyKVVWj2Ecd8eHN6nqtqCwBSft6ixf4TRfIXB0YYdf3fNSzAJGicAT6C2wbxq
         xzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754952132; x=1755556932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJU+iuK1dEeZhwNGVDI5KeVVHzwS6pkZN2+0dyRDJ40=;
        b=MXGUvn2FFGeM+WnoqJ70irSosxZPCEyvaORhzzxUCjuHD0BXsFRN1AewuD57ecf7sS
         hNttomxaYizVcMRhJ+5caILFlNf3hzjiE2R8EQcQMvX/G/S2DKmtnbWKEw4Z5pZFYz/4
         JfJ4NwFRERUYPgAtI5Op4MlFm1sIBXhIE17cS09NBfiWgJHfS0rkwyjSQSqJUGDjQcYP
         KvlrbdRtI/nyUZzuc3XVtnaX3Llz8TY+cNbToKnURTh3aKJ0ScOgPvUSqYZ7t+MXTRSJ
         L7aWTosBW+YuP3Cq+nmmp6ELJ+1xI5ZYh+WOetEkt/cM/MI0KNesVoHadWZxCr/Heu6L
         7A9g==
X-Gm-Message-State: AOJu0YxjpQtdeywI1M42h0ehpznrbPFLiMRVILUwDGa+UR8vPa2FD9GW
	gSa06gfqia8AXvQvmyVeGxU4R/m9N3Zkl+r6/xp4Z8a0TiI8ygbeF4SFymwI/zTxtq4=
X-Gm-Gg: ASbGncvYfqhcNoK5KB7mxUS+eRBYAEDv1Jz8ojYCobYia826ifSHoGSZnCd5gOO6iy/
	nVtacVOo61+DD33UL3C2BvKjIBt84WTnsmz2pxxnN/znNzCemI8vFKhx04G8pVSiYnW4F1ELIjK
	h9bEddSIcD2oSE/F7z6X4VqtWhhjWMIE0xkrnkUbai6vXu/CmIfIgWWRUUjWqYCDCwW/NV7K6DX
	Z/PjCHBMdLUJoYmfXugkxaO2Hju/opqodmGkOhdDGFUf8sT6XB3KA+T1vh8rihvJ/wK7n9+LURC
	/R1YGE6qPd46LBoX7vi5LgIcdeLFMS/MD0a1af+7M8tLDFTORC6Nn5Y9fuolCY47ciBcBCL/bAY
	aOB3tEVnfdSc5sb48Om/E+Q==
X-Google-Smtp-Source: AGHT+IG/2KooeG8DcT0SxGeId0xLtgrGHO9x97BT5xTKDAdUjGnQvFzDxeHdjLLjhG7iCmVXoSjWdw==
X-Received: by 2002:a17:903:41d0:b0:23f:df06:ce7e with SMTP id d9443c01a7336-242fc3717a9mr16159135ad.53.1754952131303;
        Mon, 11 Aug 2025 15:42:11 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ee1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e945sm282318535ad.56.2025.08.11.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:42:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Upgrade to 15.2.0 release
Date: Mon, 11 Aug 2025 15:42:05 -0700
Message-ID: <20250811224207.798895-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 22:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221751

This is a point release in GCC-15 release series with
number of bugfixes ( 123 to be exact ) as detailed here [1]

Drop backports available in this release

[1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=485623&resolution=FIXED&target_milestone=15.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-15.1.inc => gcc-15.2.inc}        |  10 +-
 ...ian_15.1.bb => gcc-cross-canadian_15.2.bb} |   0
 .../{gcc-cross_15.1.bb => gcc-cross_15.2.bb}  |   0
 ...-crosssdk_15.1.bb => gcc-crosssdk_15.2.bb} |   0
 ...cc-runtime_15.1.bb => gcc-runtime_15.2.bb} |   0
 ...itizers_15.1.bb => gcc-sanitizers_15.2.bb} |   0
 ...{gcc-source_15.1.bb => gcc-source_15.2.bb} |   0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   2 +-
 .../0002-gcc-poison-system-directories.patch  |   4 +-
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   |   2 +-
 ...R_BUILD-in-a-couple-of-places-to-avo.patch |   2 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |   2 +-
 .../gcc/gcc/0006-cpp-honor-sysroot.patch      |   2 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   2 +-
 .../gcc/gcc/0008-libtool.patch                |   2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   2 +-
 ...-config-files-from-B-instead-of-usin.patch |   2 +-
 ...1-aarch64-Fix-include-paths-when-S-B.patch |   2 +-
 ...ir-from-.la-which-usually-points-to-.patch |   2 +-
 ...e-target-gcc-headers-can-be-included.patch |   2 +-
 ...t-directory-during-relink-if-inst_pr.patch |   2 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |   2 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |   6 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   2 +-
 ...d-to-link-commandline-for-musl-targe.patch |   2 +-
 ...Re-introduce-spe-commandline-options.patch |   2 +-
 ...as-for-__cpu_indicator_init-instead-.patch |   2 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   2 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   2 +-
 .../0023-Fix-install-path-of-linux64.h.patch  |   2 +-
 ...ardcoded-build-paths-into-ppc-libgcc.patch |   2 +-
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch |  24 +-
 ...-validate-mem_noofs_operand-PR120351.patch |  95 ----
 ...-incorrect-preprocessor-line-numbers.patch | 475 ------------------
 ...-steering-when-rename-fails-PR120119.patch |  69 ---
 ...bsanitizer-Fix-build-with-glibc-2.42.patch |  77 ---
 .../gcc/{gcc_15.1.bb => gcc_15.2.bb}          |   0
 ...initial_15.1.bb => libgcc-initial_15.2.bb} |   0
 .../gcc/{libgcc_15.1.bb => libgcc_15.2.bb}    |   0
 ...ibgfortran_15.1.bb => libgfortran_15.2.bb} |   0
 41 files changed, 43 insertions(+), 763 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.1.inc => gcc-15.2.inc} (91%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.1.bb => gcc-cross-canadian_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.1.bb => gcc-cross_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.1.bb => gcc-crosssdk_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.1.bb => gcc-runtime_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.1.bb => gcc-sanitizers_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.1.bb => gcc-source_15.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-preprocessor-line-numbers.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch
 rename meta/recipes-devtools/gcc/{gcc_15.1.bb => gcc_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.1.bb => libgcc-initial_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.1.bb => libgcc_15.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.1.bb => libgfortran_15.2.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6d7796433c4..e2ef5fd88f0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -201,7 +201,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-15.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.2.inc
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-15.1.inc
rename to meta/recipes-devtools/gcc/gcc-15.2.inc
index 3a5ba023ad6..7aef99f9eb5 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "15.1.0"
+PV = "15.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "15.1.0"
+BINV = "15.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -43,7 +43,7 @@ LIC_FILES_CHKSUM = "\
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "e2b09ec21660f01fecffb715e0120265216943f038d0e48a9868713e54f06cea"
+SRC_URI[sha256sum] = "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -70,10 +70,6 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patch \
-           file://0026-fix-incorrect-preprocessor-line-numbers.patch \
-           file://0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch \
-           file://0028-libsanitizer-Fix-build-with-glibc-2.42.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.1.bb b/meta/recipes-devtools/gcc/gcc-cross_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_15.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.1.bb b/meta/recipes-devtools/gcc/gcc-source_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_15.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index e36b7f7b17a..5287b6e401b 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 7e8c2b6bd87d221158f43bc1d770e04ddeed4176 Mon Sep 17 00:00:00 2001
+From c5f21e8444dba266ca2519c5da34d6b1ff316592 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 53d2dc63da7..a58cd590679 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From f7c26bbbf0496d179f5e71107fe6cf1320b25901 Mon Sep 17 00:00:00 2001
+From bc3769af87e98d59a27daf0c46c79aadd7b968c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 Jan 2025 17:12:51 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -133,7 +133,7 @@ index 9f67e62950a..b0e3615e5aa 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index c2e1bf8031b..d33e2042f38 100644
+index 64a3131c190..d068b390d18 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -405,6 +405,7 @@ Objective-C and Objective-C++ Dialects}.
diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index 0c9edf189e2..db7e049bab3 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From a4f799209882107726f547a4637659068ae07476 Mon Sep 17 00:00:00 2001
+From e955c4092332555b325e32c54ad2cb7e32f20f90 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack
diff --git a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
index 03139326c91..3b156cd9875 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
@@ -1,4 +1,4 @@
-From bcc97c2c8558cd5d3879a907a216eb0e2008c976 Mon Sep 17 00:00:00 2001
+From f59aa22697ddfa42b812c7b8e232abcde6122d9a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
 Subject: [PATCH] Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these
diff --git a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index e8e829d9f59..48adb5cefe2 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From fd6aa3c3ff5361a738b31d6127cb05910cd6b8c0 Mon Sep 17 00:00:00 2001
+From f1acffaa783ee6e5e567e594df16a1f0286b1295 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
diff --git a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
index 26476de33f2..af7d895496f 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From b931ab5282cc11627b6f68a6477b79f41ae80b3a Mon Sep 17 00:00:00 2001
+From e5f2c9886934ad9a05f66e0e09e92ee7dd5c9e94 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 2b727b09aff..621f8bc41f2 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From d9513f8c3fa3f228358fd4d0716941e84bda413e Mon Sep 17 00:00:00 2001
+From cbfcad913793498d1a5b24622662a777f4a412b0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index 00645f0c6a0..6e1dd5baac7 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -1,4 +1,4 @@
-From 7108016f82a3ce9d275b5d0f37dbde422de6ab15 Mon Sep 17 00:00:00 2001
+From 92dc1dc8df20381bff9775d761f1227657b97718 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 215a599cb8e..d8c96ed86e0 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 135523bfabbd37cc6326da1a7ec3cd8bc7387439 Mon Sep 17 00:00:00 2001
+From 281b765ef6f615c273c5d83748aaf30318321c73 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
diff --git a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index c3c42121156..b73c3349d50 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 2ede6edb029ef3d98f3ead90f7be54b71cb42ae2 Mon Sep 17 00:00:00 2001
+From 6ea4fff5598b90f746f374e815f2336b60dbf42d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
diff --git a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
index 9e05277515a..7b0f332ac7c 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
@@ -1,4 +1,4 @@
-From a60798dd091f46dbb5f2fa9cf7655b41e9431a73 Mon Sep 17 00:00:00 2001
+From 2aa5b781be6756d63508e7cbe3bf64203ec64f7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Jan 2023 22:03:38 -0800
 Subject: [PATCH] aarch64: Fix include paths when S != B
diff --git a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 8d0c39f9cee..8c5520ed503 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 3745be5dece41bc2c633e1702980965e28888f62 Mon Sep 17 00:00:00 2001
+From 3378cccd27613208ed5b4845117e7f01d422c445 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
index 906ef3f74b1..a7963e4feba 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 860aae0d1f5dce7a879690d53a6ab54c6a32107e Mon Sep 17 00:00:00 2001
+From b04c28e5a2d6ea62775e10496d661cc02cefe491 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
diff --git a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index c7bf8d1c8e2..940c0f97cbf 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From f28f581fbafa76a48cc7e88ab9c6eb63db6342c4 Mon Sep 17 00:00:00 2001
+From a6cf695c7027edb8ca5c3a5ba3b093e20655ce01 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 9abf72b8e80..2cbcc1c4963 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From b54d51c58012f9eac31cf83a8e02c7069bf80a74 Mon Sep 17 00:00:00 2001
+From 1623de28fa4621bca357bf7d67977041ce234650 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
index 682317fee89..0929a1a28f7 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From ccfe6d014e8cc04b0d3420f82dca8920fb659a07 Mon Sep 17 00:00:00 2001
+From b714381cfb29fe84de5a17801a1d953ffb312de3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -46,10 +46,10 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  8 files changed, 95 insertions(+), 73 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.cc b/gcc/c-family/c-opts.cc
-index d43b3aef102..b157ad37483 100644
+index 108eaabd5d4..6ce14c6fe52 100644
 --- a/gcc/c-family/c-opts.cc
 +++ b/gcc/c-family/c-opts.cc
-@@ -1610,8 +1610,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+@@ -1612,8 +1612,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
    size_t prefix_len, suffix_len;
  
    suffix_len = strlen (suffix);
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index b3ab4996c3c..a087ba17d93 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From 1756ca43dc85ee9d367350d68b908e6681ddd986 Mon Sep 17 00:00:00 2001
+From 045184e0ef0bbaa25b8cfc881e6a84b74a008640 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
diff --git a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 1b2da32a422..09fa5181127 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 777963807e14a091c263d603cebfd7bb02f63b24 Mon Sep 17 00:00:00 2001
+From 248ef30a93ff6f962651ebf592f4511b31adf7fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
index f23876b10a1..27bf1103f9f 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From f2649410d2eb1c3983054020c9238887bd31273f Mon Sep 17 00:00:00 2001
+From 5a8604544b9a1fc4ae512f648165de22ce125d66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
diff --git a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index cd22dba878e..a1e7ac60c92 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From be81ee850cdf720f87733046cfa8f3fa43704a7d Mon Sep 17 00:00:00 2001
+From 1f7cdcf88cc24b315857fcc0844df2f902a50612 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
diff --git a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index 5b67c194dfc..2d02f24bb2a 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 734760138d07236289c5e548efc6083ddcfda650 Mon Sep 17 00:00:00 2001
+From a638dc53cb297e45dd4c867d1e33ac01fbd6eed0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
index 92927670378..0f2a9d8c1fb 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 95ee2cf97c5c2a4bd66c54d078b960a1d541d35e Mon Sep 17 00:00:00 2001
+From b43eb0e2ea068199ea112f71a3ede3d1f32347c5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
diff --git a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
index da91d85eb94..5f38d4516e7 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From cd7353f45bc2af9a9ea9694544d40ea03a1310d1 Mon Sep 17 00:00:00 2001
+From b2e19ceaf528591cc3a76cd2d2543b3cb0008df3 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
diff --git a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
index b7edeef6eb1..bbb0a9f2861 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
@@ -1,4 +1,4 @@
-From 159545123cfe05136037e302409cf82ec5c0263c Mon Sep 17 00:00:00 2001
+From 352f9f23d1b10b96f6b6a7bc1fd72aaf449cc3d1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 20 Aug 2022 09:04:14 -0700
 Subject: [PATCH] Avoid hardcoded build paths into ppc libgcc
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index 0a61862332f..fcdd79a8401 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -1,4 +1,4 @@
-From 62e25edd60d45eaec331a3273880f6ff3248ef62 Mon Sep 17 00:00:00 2001
+From e67441867de1b636e0983e0f893bcb2bba43d9eb Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 17 Aug 2023 09:01:40 -0700
 Subject: [PATCH] gcc testsuite tweaks for mips/OE
@@ -92,7 +92,7 @@ index 6dd8fa3fce9..95672008219 100644
  	"preprocess" {
  	    set compile_type "preprocess"
 diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index a62f459ad7e..6886cfeee49 100644
+index c0376b04551..5d053dfe726 100644
 --- a/gcc/testsuite/lib/target-supports.exp
 +++ b/gcc/testsuite/lib/target-supports.exp
 @@ -2949,14 +2949,7 @@ proc check_mips_loongson_mmi_hw_available { } {
@@ -142,7 +142,7 @@ index a62f459ad7e..6886cfeee49 100644
      }
    }]
  }
-@@ -10354,6 +10325,7 @@ proc is-effective-target-keyword { arg } {
+@@ -10371,6 +10342,7 @@ proc is-effective-target-keyword { arg } {
  
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
@@ -150,7 +150,7 @@ index a62f459ad7e..6886cfeee49 100644
      global EFFECTIVE_TARGETS
      global et_index
  
-@@ -10361,6 +10333,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -10378,6 +10350,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
@@ -158,7 +158,7 @@ index a62f459ad7e..6886cfeee49 100644
  	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] != [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -10368,8 +10341,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -10385,8 +10358,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	    if { [info procs check_effective_target_${target}_runtime]
  		 != [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
@@ -169,7 +169,7 @@ index a62f459ad7e..6886cfeee49 100644
  	}
      } else {
  	set et_index 0
-@@ -12155,6 +12130,7 @@ proc check_effective_target_sigsetjmp {} {
+@@ -12172,6 +12147,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -177,7 +177,7 @@ index a62f459ad7e..6886cfeee49 100644
      global EFFECTIVE_TARGETS
  
      if [istarget powerpc*-*-*] {
-@@ -12186,6 +12162,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12203,6 +12179,7 @@ proc check_vect_support_and_set_flags { } {
  		set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0 "-mcpu=970"]
  	    }
  	    set dg-do-what-default compile
@@ -185,7 +185,7 @@ index a62f459ad7e..6886cfeee49 100644
  	}
      } elseif { [check_effective_target_x86] } {
  	lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -12193,6 +12170,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12210,6 +12187,7 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
@@ -193,7 +193,7 @@ index a62f459ad7e..6886cfeee49 100644
  	}
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -12212,6 +12190,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12229,6 +12207,7 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
@@ -201,7 +201,7 @@ index a62f459ad7e..6886cfeee49 100644
  	}
      } elseif [istarget alpha*-*-*] {
  	# Alpha's vectorization capabilities are extremely limited.
-@@ -12225,6 +12204,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12242,6 +12221,7 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
@@ -209,7 +209,7 @@ index a62f459ad7e..6886cfeee49 100644
  	}
      } elseif [istarget ia64-*-*] {
  	set dg-do-what-default run
-@@ -12238,6 +12218,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12255,6 +12235,7 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
@@ -217,7 +217,7 @@ index a62f459ad7e..6886cfeee49 100644
  	}
      } elseif [istarget aarch64*-*-*] {
  	set dg-do-what-default run
-@@ -12262,6 +12243,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12279,6 +12260,7 @@ proc check_vect_support_and_set_flags { } {
  	} else {
  	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
  	    set dg-do-what-default compile
diff --git a/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch
deleted file mode 100644
index 3f324fdc223..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_operand-PR120351.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From bb7adc5dab8bcee2ef1c0d2af370ea77c49bb5c5 Mon Sep 17 00:00:00 2001
-From: Richard Earnshaw <rearnsha@arm.com>
-Date: Mon, 19 May 2025 16:19:39 +0100
-Subject: [PATCH] arm: fully validate mem_noofs_operand [PR120351]
-
-It's not enough to just check that a memory operand is of the form
-mem(reg); after RA we also need to validate the register being used.
-The safest way to do this is to call memory_operand.
-
-	PR target/120351
-
-gcc/ChangeLog:
-
-	* config/arm/predicates.md (mem_noofs_operand): Also check the op
-	is a valid memory_operand.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/arm/pr120351.c: New test.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=e5bb7a328eb71daa02d15b48d3a6c6b8cd24abc5]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/arm/predicates.md            |  3 +-
- gcc/testsuite/gcc.target/arm/pr120351.c | 47 +++++++++++++++++++++++++
- 2 files changed, 49 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/arm/pr120351.c
-
-diff --git a/gcc/config/arm/predicates.md b/gcc/config/arm/predicates.md
-index 75c06d9be25..655f60312de 100644
---- a/gcc/config/arm/predicates.md
-+++ b/gcc/config/arm/predicates.md
-@@ -907,7 +907,8 @@
- 
- (define_predicate "mem_noofs_operand"
-   (and (match_code "mem")
--       (match_code "reg" "0")))
-+       (match_code "reg" "0")
-+       (match_operand 0 "memory_operand")))
- 
- (define_predicate "call_insn_operand"
-   (ior (and (match_code "symbol_ref")
-diff --git a/gcc/testsuite/gcc.target/arm/pr120351.c b/gcc/testsuite/gcc.target/arm/pr120351.c
-new file mode 100644
-index 00000000000..d8e9d73275c
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/arm/pr120351.c
-@@ -0,0 +1,47 @@
-+/* { dg-do assemble } */
-+/* { dg-require-effective-target arm_neon_ok } */
-+/* { dg-add-options arm_neon } */
-+/* { dg-additional-options "-O2" } */
-+
-+
-+typedef struct A
-+{
-+  int f1;
-+} A;
-+
-+__inline void ref (A* x)
-+{
-+  __atomic_fetch_add(&x->f1, 1, 0);
-+}
-+
-+typedef struct B
-+{
-+  A *d;
-+  int *ptr;
-+} B;
-+
-+void insertOne (B*, B*);
-+
-+void init (B *);
-+__inline void copy (B *p, B *q)
-+{
-+  p->d  = q->d;
-+  p->ptr = q->ptr;
-+  ref (p->d);
-+}
-+
-+__inline void emplace(B* x)
-+{
-+  B dummy;
-+  B _tmp;
-+  init (&dummy);
-+  copy (&_tmp, &dummy);
-+  insertOne(x, &_tmp);
-+}
-+
-+void testing ()
-+{
-+  B test;
-+  init (&test);
-+  emplace(&test);
-+}
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-preprocessor-line-numbers.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-preprocessor-line-numbers.patch
deleted file mode 100644
index f7990856626..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-fix-incorrect-preprocessor-line-numbers.patch
+++ /dev/null
@@ -1,475 +0,0 @@
-From edf745dc519ddbfef127e2789bf11bfbacd300b7 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Wed, 7 May 2025 17:25:42 +0200
-Subject: libcpp: Further fixes for incorrect line numbers in large files
- [PR120061]
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The backport of the PR108900 fix to 14 branch broke building chromium
-because static_assert (__LINE__ == expected_line_number, ""); now triggers
-as the __LINE__ values are off by one.
-This isn't the case on the trunk and 15 branch because we've switched
-to 64-bit location_t and so one actually needs far longer header files
-to trigger it.
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120061#c11
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120061#c12
-contain (large) testcases in patch form which show on the 14 branch
-that the first one used to fail before the PR108900 backport and now
-works correctly, while the second one attempts to match the chromium
-behavior and it used to pass before the PR108900 backport and now it
-FAILs.
-The two testcases show rare problematic cases, because
-do_include_common -> parse_include -> check_eol -> check_eol_1 ->
-cpp_get_token_1 -> _cpp_lex_token -> _cpp_lex_direct -> linemap_line_start
-triggers there
-      /* Allocate the new line_map.  However, if the current map only has a
-         single line we can sometimes just increase its column_bits instead. */
-      if (line_delta < 0
-          || last_line != ORDINARY_MAP_STARTING_LINE_NUMBER (map)
-          || SOURCE_COLUMN (map, highest) >= (1U << (column_bits - range_bits))
-          || ( /* We can't reuse the map if the line offset is sufficiently
-                  large to cause overflow when computing location_t values.  */
-              (to_line - ORDINARY_MAP_STARTING_LINE_NUMBER (map))
-              >= (((uint64_t) 1)
-                  << (CHAR_BIT * sizeof (linenum_type) - column_bits)))
-          || range_bits < map->m_range_bits)
-        map = linemap_check_ordinary
-                (const_cast <line_map *>
-                  (linemap_add (set, LC_RENAME,
-                                ORDINARY_MAP_IN_SYSTEM_HEADER_P (map),
-                                ORDINARY_MAP_FILE_NAME (map),
-                                to_line)));
-and so creates a new ordinary map on the line right after the
-(problematic) #include line.
-Now, in the spot that r14-11679-g8a884140c2bcb7 patched,
-pfile->line_table->highest_location in all 3 tests (also
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120061#c13
-) is before the decrement the start of the line after the #include line and so
-the decrement is really desirable in that case to put highest_location
-somewhere on the line where the #include actually is.
-But at the same time it is also undesirable, because if we do decrement it,
-then linemap_add LC_ENTER called from _cpp_do_file_change will then
-  /* Generate a start_location above the current highest_location.
-     If possible, make the low range bits be zero.  */
-  location_t start_location = set->highest_location + 1;
-  unsigned range_bits = 0;
-  if (start_location < LINE_MAP_MAX_LOCATION_WITH_COLS)
-    range_bits = set->default_range_bits;
-  start_location += (1 << range_bits) - 1;
-  start_location &=  ~((1 << range_bits) - 1);
-
-  linemap_assert (!LINEMAPS_ORDINARY_USED (set)
-                  || (start_location
-                      >= MAP_START_LOCATION (LINEMAPS_LAST_ORDINARY_MAP (set))));
-and we can end up with the new LC_ENTER ordinary map having the same
-start_location as the preceding LC_RENAME one.
-Next thing that happens is computation of included_from:
-  if (reason == LC_ENTER)
-    {
-      if (set->depth == 0)
-        map->included_from = 0;
-      else
-        /* The location of the end of the just-closed map.  */
-        map->included_from
-          = (((map[0].start_location - 1 - map[-1].start_location)
-              & ~((1 << map[-1].m_column_and_range_bits) - 1))
-             + map[-1].start_location);
-The normal case (e.g. with the testcase included at the start of this comment) is
-that map[-1] starts somewhere earlier and so map->included_from computation above
-nicely computes location_t which expands to the start of the #include line.
-With r14-11679 reverted, for #c11 as well as #c12
-map[0].start_location == map[-1].start_location above, and so it is
-((location_t) -1 & ~((1 << map[-1].m_column_and_range_bits) - 1)))
-+ map[-1].start_location,
-which happens to be start of the #include line.
-For #c11 map[0].start_location is 0x500003a0 and map[-1] has
-m_column_and_range_bits 7 and map[-2] has m_column_and_range_bits 12 and
-map[0].included_from is set to 0x50000320.
-For #c12 map[0].start_location is 0x606c0402 and map[-2].start_location is
-0x606c0400 and m_column_and_range_bits is 0 for all 3 maps.
-map[0].included_from is set to 0x606c0401.
-The last important part is again in linemap_add when doing LC_LEAVE:
-      /* (MAP - 1) points to the map we are leaving. The
-         map from which (MAP - 1) got included should be the map
-         that comes right before MAP in the same file.  */
-      from = linemap_included_from_linemap (set, map - 1);
-
-      /* A TO_FILE of NULL is special - we use the natural values.  */
-      if (to_file == NULL)
-        {
-          to_file = ORDINARY_MAP_FILE_NAME (from);
-          to_line = SOURCE_LINE (from, from[1].start_location);
-          sysp = ORDINARY_MAP_IN_SYSTEM_HEADER_P (from);
-        }
-Here it wants to compute the right to_line which ought to be the line after
-the #include directive.
-On the #c11 testcase that doesn't work correctly though, because
-map[-1].included_from is 0x50000320, from[0] for that is LC_ENTER with
-start_location 0x4080 and m_column_and_range_bits 12 but note that we've
-earlier computed map[-1].start_location + (-1 & 0xffffff80) and so only
-decreased by 7 bits, so to_line is still on the line with #include and not
-after it.  In the #c12 that doesn't happen, all the ordinary maps involved
-there had 0 m_column_and_range_bits and so this computes correct line.
-
-Below is a fix for the trunk including testcases using the
-location_overflow_plugin hack to simulate the bugs without needing huge
-files (in the 14 case it is just 330KB and almost 10MB, but in the 15
-case it would need to be far bigger).
-The pre- r15-9018 trunk has
-FAIL: gcc.dg/plugin/location-overflow-test-pr116047.c -fplugin=./location_overflow_plugin.so  scan-file static_assert[^\n\r]*6[^\n\r]*== 6
-and current trunk
-FAIL: gcc.dg/plugin/location-overflow-test-pr116047.c -fplugin=./location_overflow_plugin.so  scan-file static_assert[^\n\r]*6[^\n\r]*== 6
-FAIL: gcc.dg/plugin/location-overflow-test-pr120061.c -fplugin=./location_overflow_plugin.so  scan-file static_assert[^\n\r]*5[^\n\r]*== 5
-and with the patch everything PASSes.
-I'll post afterwards a 14 version of the patch.
-
-The patch reverts the r15-9018 change, because it is incorrect,
-we really need to decrement it even when crossing ordinary map
-boundaries, so that the location is not on the line after the #include
-line but somewhere on the #include line.  It also patches two spots
-in linemap_add mentioned above to make sure we get correct locations
-both in the included_from location_t when doing LC_ENTER (second
-line-map.cc hunk) and when doing LC_LEAVE to compute the right to_line
-(first line-map.cc hunk), both in presence of an added LC_RENAME
-with the same start_location as the following LC_ENTER (i.e. the
-problematic cases).
-The LC_ENTER hunk is mostly to ensure included_form location_t is
-at the start of the #include line (column 0), without it we can
-decrease include_from not enough and end up at some random column
-in the middle of the line, because it is masking away
-map[-1].m_column_and_range_bits bits even when in the end the resulting
-include_from location_t will be found in map[-2] map with perhaps
-different m_column_and_range_bits.  That alone doesn't fix the bug
-though.
-The more important is the LC_LEAVE hunk and the problem there is
-caused by linemap_line_start not actually doing
-    r = set->highest_line + (line_delta << map->m_column_and_range_bits);
-when adding a new map (the LC_RENAME one because we need to switch to
-different number of directly encoded ranges, or columns, etc.).
-So, in the original PR108900 case that
-  to_line = SOURCE_LINE (from, from[1].start_location);
-doesn't do the right thing, from there is the last < 0x50000000 map
-with m_column_and_range_bits 12, from[1] is the first one above it
-and map[-1].included_from is the correct location of column 0 on
-the #include line, but as the new LC_RENAME map has been created without
-actually increasing highest_location to be on the new line (we've just
-set to_line of the new LC_RENAME map to the correct line),
-  to_line = SOURCE_LINE (from, from[1].start_location);
-stays on the same source line.  I've tried to just replace that with
-  to_line = SOURCE_LINE (from, linemap_included_from (map - 1)) + 1;
-i.e. just find out the #include line from map[-1].included_from and
-add 1 to it, unfortunately that breaks the
-c-c++-common/cpp/line-4.c
-test where we expect to stay on the same 0 line for LC_LEAVE from
-<command line> and gcc.dg/cpp/trad/Wunused.c, gcc.dg/cpp/trad/builtins.c
-and c-c++-common/analyzer/named-constants-via-macros-traditional.c tests
-all with -traditional-cpp preprocessing where to_line is also off-by-one
-from the expected one.
-So, this patch instead conditionalizes it, uses the
-  to_line = SOURCE_LINE (from, linemap_included_from (map - 1)) + 1;
-way only if from[1] is a LC_RENAME map (rather than the usual
-LC_ENTER one), that should limit it to the problematic cases of when
-parse_include peeked after EOL and had to create LC_RENAME map with
-the same start_location as the LC_ENTER after it.
-
-Some further justification for the LC_ENTER hunk, using the
-https://gcc.gnu.org/pipermail/gcc-patches/2025-May/682774.html testcase
-(old is 14 before r14-11679, vanilla current 14 and new with the 14 patch)
-I get
-$ /usr/src/gcc-14/obj/gcc/cc1.old -quiet -std=c23 pr116047.c -nostdinc
-In file included from pr116047-1.h:327677:21,
-                 from pr116047.c:4:
-pr116047-2.h:1:1: error: unknown type name ‘a’
-    1 | a b c;
-      | ^
-pr116047-2.h:1:5: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘c’
-    1 | a b c;
-      |     ^
-pr116047-1.h:327677:1: error: static assertion failed: ""
-327677 | #include "pr116047-2.h"
-       | ^~~~~~~~~~~~~
-$ /usr/src/gcc-14/obj/gcc/cc1.vanilla -quiet -std=c23 pr116047.c -nostdinc
-In file included from pr116047-1.h:327678,
-                 from pr116047.c:4:
-pr116047-2.h:1:1: error: unknown type name ‘a’
-    1 | a b c;
-      | ^
-pr116047-2.h:1:5: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘c’
-    1 | a b c;
-      |     ^
-$ /usr/src/gcc-14/obj/gcc/cc1.new -quiet -std=c23 pr116047.c -nostdinc
-In file included from pr116047-1.h:327677,
-                 from pr116047.c:4:
-pr116047-2.h:1:1: error: unknown type name ‘a’
-    1 | a b c;
-      | ^
-pr116047-2.h:1:5: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘c’
-    1 | a b c;
-      |     ^
-
-pr116047-1.h has on lines 327677+327678:
- #include "pr116047-2.h"
- static_assert (__LINE__ == 327678, "");
-so the static_assert failure is something that was dealt mainly in the
-LC_LEAVE hunk and files.cc reversion, but please have a look at the
-In file included from lines.
-14.2 emits correct line (#include "pr116047-2.h" is indeed on line
-327677) but some random column in there (which is not normally printed
-for smaller headers; 21 is the . before extension in the filename).
-Current trunk emits incorrect line (327678 instead of 327677, clearly
-it didn't decrement).
-And the patched compiler emits the right line with no column, as would
-be printed if I remove e.g. 300000 newlines from the file.
-
-2025-05-07  Jakub Jelinek  <jakub@redhat.com>
-
-	PR preprocessor/108900
-	PR preprocessor/116047
-	PR preprocessor/120061
-	* files.cc (_cpp_stack_file): Revert 2025-03-28 change.
-	* line-map.cc (linemap_add): Use
-	SOURCE_LINE (from, linemap_included_from (map - 1)) + 1; instead of
-	SOURCE_LINE (from, from[1].start_location); to compute to_line
-	for LC_LEAVE.  For LC_ENTER included_from computation, look at
-	map[-2] or even lower if map[-1] has the same start_location as
-	map[0].
-
-	* gcc.dg/plugin/plugin.exp: Add location-overflow-test-pr116047.c
-	and location-overflow-test-pr120061.c.
-	* gcc.dg/plugin/location_overflow_plugin.cc (plugin_init): Don't error
-	on unknown values, instead just break.  Handle 0x4fHHHHHH arguments
-	differently.
-	* gcc.dg/plugin/location-overflow-test-pr116047.c: New test.
-	* gcc.dg/plugin/location-overflow-test-pr116047-1.h: New test.
-	* gcc.dg/plugin/location-overflow-test-pr116047-2.h: New test.
-	* gcc.dg/plugin/location-overflow-test-pr120061.c: New test.
-	* gcc.dg/plugin/location-overflow-test-pr120061-1.h: New test.
-	* gcc.dg/plugin/location-overflow-test-pr120061-2.h: New test.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=edf745dc519ddbfef127e2789bf11bfbacd300b7]
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
----
- .../plugin/location-overflow-test-pr116047-1.h     |  6 +++
- .../plugin/location-overflow-test-pr116047-2.h     |  1 +
- .../plugin/location-overflow-test-pr116047.c       |  5 +++
- .../plugin/location-overflow-test-pr120061-1.h     |  6 +++
- .../plugin/location-overflow-test-pr120061-2.h     |  1 +
- .../plugin/location-overflow-test-pr120061.c       |  6 +++
- .../gcc.dg/plugin/location_overflow_plugin.cc      | 15 +++++--
- gcc/testsuite/gcc.dg/plugin/plugin.exp             |  4 +-
- libcpp/files.cc                                    |  8 ----
- libcpp/line-map.cc                                 | 48 ++++++++++++++++++----
- 10 files changed, 80 insertions(+), 20 deletions(-)
- create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h
- create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h
- create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
- create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h
- create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h
- create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c
-
-diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h
-new file mode 100644
-index 000000000000..3dd6434a938b
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h
-@@ -0,0 +1,6 @@
-+
-+
-+
-+
-+#include "location-overflow-test-pr116047-2.h"
-+static_assert (__LINE__ == 6, "");
-diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h
-new file mode 100644
-index 000000000000..048f715b4656
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h
-@@ -0,0 +1 @@
-+int i;
-diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
-new file mode 100644
-index 000000000000..75161fa5f055
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
-@@ -0,0 +1,5 @@
-+/* PR preprocessor/116047 */
-+/* { dg-do preprocess } */
-+/* { dg-options "-nostdinc -std=c23 -fplugin-arg-location_overflow_plugin-value=0x4ffe0180" } */
-+#include "location-overflow-test-pr116047-1.h"
-+/* { dg-final { scan-file location-overflow-test-pr116047.i "static_assert\[^\n\r]\*6\[^\n\r]\*== 6" } } */
-diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h
-new file mode 100644
-index 000000000000..ebf7704f568e
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h
-@@ -0,0 +1,6 @@
-+
-+
-+
-+
-+#include "location-overflow-test-pr120061-2.h"
-+
-diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h
-new file mode 100644
-index 000000000000..048f715b4656
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h
-@@ -0,0 +1 @@
-+int i;
-diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c
-new file mode 100644
-index 000000000000..e8e803898da3
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c
-@@ -0,0 +1,6 @@
-+/* PR preprocessor/120061 */
-+/* { dg-do preprocess } */
-+/* { dg-options "-nostdinc -std=c23 -fplugin-arg-location_overflow_plugin-value=0x61000000" } */
-+#include "location-overflow-test-pr120061-1.h"
-+static_assert (__LINE__ == 5, "");
-+/* { dg-final { scan-file location-overflow-test-pr120061.i "static_assert\[^\n\r]\*5\[^\n\r]\*== 5" } } */
-diff --git a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc b/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc
-index f731b1421b0f..f770d35ea518 100644
---- a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc
-+++ b/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.cc
-@@ -85,9 +85,18 @@ plugin_init (struct plugin_name_args *plugin_info,
-     error_at (UNKNOWN_LOCATION, "missing plugin argument");
- 
-   /* With 64-bit locations, the thresholds are larger, so shift the base
--     location argument accordingly.  */
-+     location argument accordingly, basically remap the GCC 14 32-bit
-+     location_t argument values to 64-bit location_t counterparts.  There
-+     is one exception for values slightly before the 32-bit location_t
-+     LINE_MAP_MAX_LOCATION_WITH_PACKED_RANGES (0x50000000).  In that case
-+     remap them to the same amount before the 64-bit location_t
-+     LINE_MAP_MAX_LOCATION_WITH_PACKED_RANGES -
-+     ((location_t) 0x50000000) << 31.  */
-   gcc_assert (sizeof (location_t) == sizeof (uint64_t));
--  base_location = 1 + ((base_location - 1) << 31);
-+  if (base_location >= 0x4f000000 && base_location <= 0x4fffffff)
-+    base_location += (((location_t) 0x50000000) << 31) - 0x50000000;
-+  else
-+    base_location = 1 + ((base_location - 1) << 31);
- 
-   register_callback (plugin_info->base_name,
- 		     PLUGIN_PRAGMAS,
-@@ -107,7 +116,7 @@ plugin_init (struct plugin_name_args *plugin_info,
-       break;
- 
-     default:
--      error_at (UNKNOWN_LOCATION, "unrecognized value for plugin argument");
-+      break;
-     }
- 
-   return 0;
-diff --git a/gcc/testsuite/gcc.dg/plugin/plugin.exp b/gcc/testsuite/gcc.dg/plugin/plugin.exp
-index 90c91621d0aa..96e76d2e0c36 100644
---- a/gcc/testsuite/gcc.dg/plugin/plugin.exp
-+++ b/gcc/testsuite/gcc.dg/plugin/plugin.exp
-@@ -138,7 +138,9 @@ set plugin_test_list [list \
-     { location_overflow_plugin.cc \
- 	  location-overflow-test-1.c \
- 	  location-overflow-test-2.c \
--	  location-overflow-test-pr83173.c } \
-+	  location-overflow-test-pr83173.c \
-+	  location-overflow-test-pr116047.c \
-+	  location-overflow-test-pr120061.c } \
-     { must_tail_call_plugin.cc \
- 	  must-tail-call-1.c \
- 	  must-tail-call-2.c } \
-diff --git a/libcpp/files.cc b/libcpp/files.cc
-index c1abde6639fe..d80c4bfd9077 100644
---- a/libcpp/files.cc
-+++ b/libcpp/files.cc
-@@ -1047,14 +1047,6 @@ _cpp_stack_file (cpp_reader *pfile, _cpp_file *file, include_type type,
- 		    && (pfile->line_table->highest_location
- 			!= LINE_MAP_MAX_LOCATION - 1));
- 
--  if (decrement && LINEMAPS_ORDINARY_USED (pfile->line_table))
--    {
--      const line_map_ordinary *map
--	= LINEMAPS_LAST_ORDINARY_MAP (pfile->line_table);
--      if (map && map->start_location == pfile->line_table->highest_location)
--	decrement = false;
--    }
--
-   if (decrement)
-     pfile->line_table->highest_location--;
- 
-diff --git a/libcpp/line-map.cc b/libcpp/line-map.cc
-index 17e7f12551c0..cf6557117c81 100644
---- a/libcpp/line-map.cc
-+++ b/libcpp/line-map.cc
-@@ -621,8 +621,8 @@ linemap_add (line_maps *set, enum lc_reason reason,
- 	 #include "included", inside the same "includer" file.  */
- 
-       linemap_assert (!MAIN_FILE_P (map - 1));
--      /* (MAP - 1) points to the map we are leaving. The
--	 map from which (MAP - 1) got included should be the map
-+      /* (MAP - 1) points to the map we are leaving.  The
-+	 map from which (MAP - 1) got included should be usually the map
- 	 that comes right before MAP in the same file.  */
-       from = linemap_included_from_linemap (set, map - 1);
- 
-@@ -630,7 +630,24 @@ linemap_add (line_maps *set, enum lc_reason reason,
-       if (to_file == NULL)
- 	{
- 	  to_file = ORDINARY_MAP_FILE_NAME (from);
--	  to_line = SOURCE_LINE (from, from[1].start_location);
-+	  /* Compute the line on which the map resumes, for #include this
-+	     should be the line after the #include line.  Usually FROM is
-+	     the map right before LC_ENTER map - the first map of the included
-+	     file, and in that case SOURCE_LINE (from, from[1].start_location);
-+	     computes the right line (and does handle even some special cases
-+	     (e.g. where for returning from <command line> we still want to
-+	     be at line 0 or some -traditional-cpp cases).  In rare cases
-+	     FROM can be followed by LC_RENAME created by linemap_line_start
-+	     for line right after #include line.  If that happens,
-+	     start_location of the FROM[1] map will be the same as
-+	     start_location of FROM[2] LC_ENTER, but FROM[1] start_location
-+	     might not have advance enough for moving to a full next line.
-+	     In that case compute the line of #include line and add 1 to it
-+	     to advance to the next line.  See PR120061.  */
-+	  if (from[1].reason == LC_RENAME)
-+	    to_line = SOURCE_LINE (from, linemap_included_from (map - 1)) + 1;
-+	  else
-+	    to_line = SOURCE_LINE (from, from[1].start_location);
- 	  sysp = ORDINARY_MAP_IN_SYSTEM_HEADER_P (from);
- 	}
-       else
-@@ -660,11 +677,26 @@ linemap_add (line_maps *set, enum lc_reason reason,
-       if (set->depth == 0)
- 	map->included_from = 0;
-       else
--	/* The location of the end of the just-closed map.  */
--	map->included_from
--	  = (((map[0].start_location - 1 - map[-1].start_location)
--	      & ~((loc_one << map[-1].m_column_and_range_bits) - 1))
--	     + map[-1].start_location);
-+	{
-+	  /* Compute location from whence this line map was included.
-+	     For #include this should be preferrably column 0 of the
-+	     line on which #include directive appears.
-+	     map[-1] is the just closed map and usually included_from
-+	     falls within that map.  In rare cases linemap_line_start
-+	     can insert a new LC_RENAME map for the line immediately
-+	     after #include line, in that case map[-1] will have the
-+	     same start_location as the new one and so included_from
-+	     would not be from map[-1] but likely map[-2].  If that
-+	     happens, mask off map[-2] m_column_and_range_bits bits
-+	     instead of map[-1].  See PR120061.  */
-+	  int i = -1;
-+	  while (map[i].start_location == map[0].start_location)
-+	    --i;
-+	  map->included_from
-+	    = (((map[0].start_location - 1 - map[i].start_location)
-+		& ~((loc_one << map[i].m_column_and_range_bits) - 1))
-+	       + map[i].start_location);
-+	}
-       set->depth++;
-       if (set->trace_includes)
- 	trace_include (set, map);
--- 
-
diff --git a/meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch b/meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch
deleted file mode 100644
index a59cb455240..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From b28d5f51e1ec75f6878593ef084e9cfb836b9db4 Mon Sep 17 00:00:00 2001
-From: Andrew Pinski <quic_apinski@quicinc.com>
-Date: Tue, 22 Jul 2025 10:32:42 -0700
-Subject: [PATCH] aarch64: Fix fma steering when rename fails [PR120119]
-
-Regrename can fail in some case and `insn_rr[INSN_UID (insn)].op_info`
-will be null. The FMA steering code was not expecting the failure to happen.
-This started to happen after early RA was added but it has been a latent bug
-before that.
-
-Build and tested for aarch64-linux-gnu.
-
-	PR target/120119
-
-gcc/ChangeLog:
-
-	* config/aarch64/cortex-a57-fma-steering.cc (func_fma_steering::analyze):
-	Skip if renaming fails.
-
-gcc/testsuite/ChangeLog:
-
-	* g++.dg/torture/pr120119-1.C: New test.
-
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2025-July/690239.html]
-Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/aarch64/cortex-a57-fma-steering.cc |  5 +++++
- gcc/testsuite/g++.dg/torture/pr120119-1.C     | 15 +++++++++++++++
- 2 files changed, 20 insertions(+)
- create mode 100644 gcc/testsuite/g++.dg/torture/pr120119-1.C
-
-diff --git a/gcc/config/aarch64/cortex-a57-fma-steering.cc b/gcc/config/aarch64/cortex-a57-fma-steering.cc
-index fd6da66d855..f7675bed13d 100644
---- a/gcc/config/aarch64/cortex-a57-fma-steering.cc
-+++ b/gcc/config/aarch64/cortex-a57-fma-steering.cc
-@@ -948,6 +948,11 @@ func_fma_steering::analyze ()
- 
- 	  /* Search the chain where this instruction is (one of) the root.  */
- 	  dest_op_info = insn_rr[INSN_UID (insn)].op_info;
-+
-+	  /* Register rename could fail. */
-+	  if (!dest_op_info)
-+	    continue;
-+
- 	  dest_regno = REGNO (SET_DEST (PATTERN (insn)));
- 	  for (i = 0; i < dest_op_info->n_chains; i++)
- 	    {
-diff --git a/gcc/testsuite/g++.dg/torture/pr120119-1.C b/gcc/testsuite/g++.dg/torture/pr120119-1.C
-new file mode 100644
-index 00000000000..1206feb310b
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/torture/pr120119-1.C
-@@ -0,0 +1,15 @@
-+// { dg-do compile }
-+// { dg-additional-options "-mcpu=cortex-a57" { target aarch64*-*-* } }
-+
-+// PR target/120119
-+
-+struct a {
-+  float operator()(int b, int c) { return d[c * 4 + b]; }
-+  float *d;
-+};
-+float e(float *);
-+auto f(a b) {
-+  float g[]{b(1, 1), b(2, 1), b(3, 1), b(1, 2), b(2, 2), b(3, 2), b(1, 3),
-+            b(2, 3), b(3, 3), b(3, 2), b(1, 3), b(2, 3), b(3, 3)};
-+  return b.d[0] * e(g);
-+}
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch b/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch
deleted file mode 100644
index 58b186ee372..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 2 May 2025 17:41:43 +0200
-Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
-
-The termio structure will be removed from glibc 2.42.  It has
-been deprecated since the late 80s/early 90s.
-
-Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
-("[sanitizer_common] Remove interceptors for deprecated struct termio
-(#137403)").
-
-Co-Authored-By: Tom Stellard <tstellar@redhat.com>
-
-libsanitizer/
-
-	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
-	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
-	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
-	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d32ece49d32b00448d967e7dbc6900fb25cbc775]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
- .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
- .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
- 3 files changed, 12 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-index 49ec4097c90..dda11daa77f 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
-   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
-   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
-   _(TCFLSH, NONE, 0);
--#if SANITIZER_GLIBC
--  _(TCGETA, WRITE, struct_termio_sz);
--#endif
-   _(TCGETS, WRITE, struct_termios_sz);
-   _(TCSBRK, NONE, 0);
-   _(TCSBRKP, NONE, 0);
--#if SANITIZER_GLIBC
--  _(TCSETA, READ, struct_termio_sz);
--  _(TCSETAF, READ, struct_termio_sz);
--  _(TCSETAW, READ, struct_termio_sz);
--#endif
-   _(TCSETS, READ, struct_termios_sz);
-   _(TCSETSF, READ, struct_termios_sz);
-   _(TCSETSW, READ, struct_termios_sz);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index c87d5ef42c9..7bbc6f2edac 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
-   unsigned struct_input_id_sz = sizeof(struct input_id);
-   unsigned struct_mtpos_sz = sizeof(struct mtpos);
-   unsigned struct_rtentry_sz = sizeof(struct rtentry);
--#if SANITIZER_GLIBC || SANITIZER_ANDROID
--  unsigned struct_termio_sz = sizeof(struct termio);
--#endif
-   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
-   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
-   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index c07f7cd0b0d..a80df656826 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
- extern unsigned struct_input_absinfo_sz;
- extern unsigned struct_input_id_sz;
- extern unsigned struct_mtpos_sz;
--extern unsigned struct_termio_sz;
- extern unsigned struct_vt_consize_sz;
- extern unsigned struct_vt_sizes_sz;
- extern unsigned struct_vt_stat_sz;
diff --git a/meta/recipes-devtools/gcc/gcc_15.1.bb b/meta/recipes-devtools/gcc/gcc_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.1.bb
rename to meta/recipes-devtools/gcc/gcc_15.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.1.bb b/meta/recipes-devtools/gcc/libgcc_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.1.bb
rename to meta/recipes-devtools/gcc/libgcc_15.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.1.bb b/meta/recipes-devtools/gcc/libgfortran_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_15.2.bb


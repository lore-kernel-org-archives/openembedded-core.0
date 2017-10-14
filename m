Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55E9965CB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 15:49:15 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b192so3498899pga.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qywDwBEfgEBs+/YCTDX2lNtleVo1xMnWJZFttnL69Rw=;
	b=jwTN1UsSBCz+loPWe6NQ/D0vUGZ6TTK8YrmkckD5E7U5KrguiVD0PVLMELb1JKHMxz
	p5kQa2GsArP6VxwYwd922lJJ+a+2T7+Y2sYBso7e6PIhNUuvJI9rui3DlJtgK37fdwG5
	97pPWlaj3BUbklW0oLFQEx6Q5BvVJ9nJbU34KKqYWq30zx2kbNs28H7SEiSrquwCygzk
	nTzcw42drl+J3+Q57N7pwD1Wnr/XRRZzj/W0VMuaXsm8V0vyu8FDdSw1WMU5GhDO4vvf
	b9kf5yN4n+oIlaICij+faqhNW88Jz14Rv+RhpKKv8Oddr1BIZxjiUtkG5PvEeewXmPCy
	bXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qywDwBEfgEBs+/YCTDX2lNtleVo1xMnWJZFttnL69Rw=;
	b=OEX6drliy56XAHLwMmciFWfRhtx96xK20DjaNclzIhUxeG8p5qD2fMUinunRewjI4O
	Bj/eOOkJvYrWACrkNU0V5VTg41jCQgD3Igrr+j5F6ynlLVvt1/OgEshG4WWLe1jEo6Y4
	sydp8wsFA0JXf1T1u++8rASE+YhVBqlqxObWRhEH3jLWqIfum95MWl940M+6UV3uTzbg
	p/o1IzEVJJp4pcfbBNHyAxcLHFL2Yuvg8EKoe27a4JMYsY3hZiXthrzDlyyZIx6ISSgS
	/qtqDZZLhJLmWYgpAUOd/ZGyedZ/wu9I5dhgkIMdIQJQ5UIAlV6Azhs7XKxZWHqLrXFD
	YLug==
X-Gm-Message-State: AMCzsaWbDHfE51lCKoL6hyq9fnnjteBaJMQhxgfzRnlF4gtXPLc9Rd5g
	uYIZBQpRiZrBvWdt6S96BvlrDA==
X-Google-Smtp-Source: AOwi7QBVOCl0RX1izTRY8Uc73WL0zGEvysh2RzVWICr3hyHTxTCH2/8ocOgZQ5ycoesoKu70fBlP1A==
X-Received: by 10.98.245.152 with SMTP id b24mr4382674pfm.56.1507996156092;
	Sat, 14 Oct 2017 08:49:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id r9sm8384819pfd.6.2017.10.14.08.49.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 08:49:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Oct 2017 08:48:57 -0700
Message-Id: <20171014154858.35123-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171014154858.35123-1-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] gcc6: Upgrade to 6.4
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
X-List-Received-Date: Sat, 14 Oct 2017 15:49:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-6.3/ubsan-fix-check-empty-string.patch | 28 ----------
 .../gcc/{gcc-6.3.inc => gcc-6.4.inc}               | 13 +++--
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  0
 .../0008-missing-execinfo_h.patch                  |  0
 .../{gcc-6.3 => gcc-6.4}/0009-c99-snprintf.patch   |  0
 .../0010-gcc-poison-system-directories.patch       |  0
 .../0011-gcc-poison-dir-extend.patch               |  0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  0
 .../0013-64-bit-multilib-hack.patch                |  0
 .../0014-optional-libstdc.patch                    |  0
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  0
 .../0016-COLLECT_GCC_OPTIONS.patch                 |  0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  0
 .../0018-fortran-cross-compile-hack.patch          |  0
 .../0019-cpp-honor-sysroot.patch                   |  0
 .../0020-MIPS64-Default-to-N64-ABI.patch           |  0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  0
 ...0022-gcc-Fix-argument-list-too-long-error.patch |  0
 .../{gcc-6.3 => gcc-6.4}/0023-Disable-sdt.patch    |  0
 .../gcc/{gcc-6.3 => gcc-6.4}/0024-libtool.patch    |  0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  0
 ...tilib-config-files-from-B-instead-of-usin.patch |  0
 ...-libdir-from-.la-which-usually-points-to-.patch |  0
 .../gcc/{gcc-6.3 => gcc-6.4}/0028-export-CPP.patch |  0
 ...AltiVec-generation-on-powepc-linux-target.patch |  0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  0
 ...Ensure-target-gcc-headers-can-be-included.patch |  0
 ...-t-build-with-disable-dependency-tracking.patch |  0
 ...h-host-directory-during-relink-if-inst_pr.patch |  0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |  0
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |  0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |  0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |  0
 ...-various-_FOR_BUILD-and-related-variables.patch |  0
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  0
 .../{gcc-6.3 => gcc-6.4}/0041-ssp_nonshared.patch  |  0
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |  0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  0
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |  0
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  0
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  0
 ...e-alias-for-__cpu_indicator_init-instead-.patch |  0
 .../0048-sync-gcc-stddef.h-with-musl.patch         |  0
 .../0054_all_nopie-all-flags.patch                 |  0
 .../0055-unwind_h-glibc26.patch                    |  0
 ...-relax-the-restriction-on-subreg-reload-f.patch |  0
 .../backport}/CVE-2016-6131.patch                  | 62 ++++++----------------
 ...s-canadian_6.3.bb => gcc-cross-canadian_6.4.bb} |  0
 ...oss-initial_6.3.bb => gcc-cross-initial_6.4.bb} |  0
 .../gcc/{gcc-cross_6.3.bb => gcc-cross_6.4.bb}     |  0
 ...-initial_6.3.bb => gcc-crosssdk-initial_6.4.bb} |  0
 .../{gcc-crosssdk_6.3.bb => gcc-crosssdk_6.4.bb}   |  0
 .../gcc/{gcc-runtime_6.3.bb => gcc-runtime_6.4.bb} |  0
 ...gcc-sanitizers_6.3.bb => gcc-sanitizers_6.4.bb} |  0
 .../gcc/{gcc-source_6.3.bb => gcc-source_6.4.bb}   |  0
 .../gcc/{gcc_6.3.bb => gcc_6.4.bb}                 |  0
 ...libgcc-initial_6.3.bb => libgcc-initial_6.4.bb} |  0
 .../gcc/{libgcc_6.3.bb => libgcc_6.4.bb}           |  0
 .../gcc/{libgfortran_6.3.bb => libgfortran_6.4.bb} |  0
 60 files changed, 23 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
 rename meta/recipes-devtools/gcc/{gcc-6.3.inc => gcc-6.4.inc} (93%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0019-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0023-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0024-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0028-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0041-ssp_nonshared.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0048-sync-gcc-stddef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0054_all_nopie-all-flags.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0055-unwind_h-glibc26.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4}/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.3 => gcc-6.4/backport}/CVE-2016-6131.patch (73%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.3.bb => gcc-cross-canadian_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.3.bb => gcc-cross-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_6.3.bb => gcc-cross_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.3.bb => gcc-crosssdk-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.3.bb => gcc-crosssdk_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_6.3.bb => gcc-runtime_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.3.bb => gcc-sanitizers_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_6.3.bb => gcc-source_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_6.3.bb => gcc_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_6.3.bb => libgcc-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_6.3.bb => libgcc_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_6.3.bb => libgfortran_6.4.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch b/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
deleted file mode 100644
index c0127198e0..0000000000
--- a/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
-From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 3 Sep 2016 10:57:05 +0000
-Subject: [PATCH] gcc/ 	* ubsan.c (ubsan_use_new_style_p): Fix check for empty
- string.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239971 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
-
----
- gcc/ubsan.c   | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-Index: gcc-6.3.0/gcc/ubsan.c
-===================================================================
---- gcc-6.3.0.orig/gcc/ubsan.c
-+++ gcc-6.3.0/gcc/ubsan.c
-@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
- 
-   expanded_location xloc = expand_location (loc);
-   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
--      || xloc.file == '\0' || xloc.file[0] == '\xff'
-+      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
-       || xloc.file[1] == '\xff')
-     return false;
- 
diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-6.3.inc
rename to meta/recipes-devtools/gcc/gcc-6.4.inc
index e569e0220b..a42b7d83ca 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "6.3.0"
+PV = "6.4.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "6.3.0"
+BINV = "6.4.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.3:${FILE_DIRNAME}/gcc-6.3/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.4:${FILE_DIRNAME}/gcc-6.4/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 #SRCREV = "bd9a826d5448db11d29d2ec5884e7e679066f140"
 #BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
 #BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
@@ -80,10 +80,9 @@ SRC_URI = "\
 "
 BACKPORTS = "\
            file://CVE-2016-6131.patch \
-           file://ubsan-fix-check-empty-string.patch \
 "
-SRC_URI[md5sum] = "677a7623c7ef6ab99881bc4e048debb6"
-SRC_URI[sha256sum] = "f06ae7f3f790fbf0f018f6d40e844451e6bc3b7bc96e128e63b09825c1f8b29f"
+SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
+SRC_URI[sha256sum] = "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69855334d2c914d4"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch b/meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch b/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch b/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch b/meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.3/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
similarity index 73%
rename from meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
index e873cc6e85..3cdbb2d171 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
+++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
@@ -37,35 +37,10 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
  libiberty/testsuite/demangle-expected | 18 ++++++++
  3 files changed, 108 insertions(+), 5 deletions(-)
 
-diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
-index 240138f..adf1d72 100644
---- a/libiberty/ChangeLog
-+++ b/libiberty/ChangeLog
-@@ -1,3 +1,20 @@
-+2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>
-+
-+	PR c++/71696
-+	* cplus-dem.c: Prevent infinite recursion when there is a cycle
-+	in the referencing of remembered mangled types.
-+	(work_stuff): New stack to keep track of the remembered mangled
-+	types that are currently being processed.
-+	(push_processed_type): New method to push currently processed
-+	remembered type onto the stack.
-+	(pop_processed_type): New method to pop currently processed
-+	remembered type from the stack.
-+	(work_stuff_copy_to_from): Copy values of new variables.
-+	(delete_non_B_K_work_stuff): Free stack memory.
-+	(demangle_args): Push/Pop currently processed remembered type.
-+	(do_type): Do not demangle a cyclic reference and push/pop
-+	referenced remembered type.
-+
- 2016-12-21  Release Manager
- 
- 	* GCC 6.3.0 released.
-diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
-index 7514e57..f21e630 100644
---- a/libiberty/cplus-dem.c
-+++ b/libiberty/cplus-dem.c
+Index: gcc-6.4.0/libiberty/cplus-dem.c
+===================================================================
+--- gcc-6.4.0.orig/libiberty/cplus-dem.c
++++ gcc-6.4.0/libiberty/cplus-dem.c
 @@ -144,6 +144,9 @@ struct work_stuff
    string* previous_argument; /* The last function argument demangled.  */
    int nrepeats;         /* The number of times to repeat the previous
@@ -76,7 +51,7 @@ index 7514e57..f21e630 100644
  };
  
  #define PRINT_ANSI_QUALIFIERS (work -> options & DMGL_ANSI)
-@@ -435,6 +438,10 @@ iterate_demangle_function (struct work_stuff *,
+@@ -435,6 +438,10 @@ iterate_demangle_function (struct work_s
  
  static void remember_type (struct work_stuff *, const char *, int);
  
@@ -87,7 +62,7 @@ index 7514e57..f21e630 100644
  static void remember_Btype (struct work_stuff *, const char *, int, int);
  
  static int register_Btype (struct work_stuff *);
-@@ -1301,6 +1308,10 @@ work_stuff_copy_to_from (struct work_stuff *to, struct work_stuff *from)
+@@ -1301,6 +1308,10 @@ work_stuff_copy_to_from (struct work_stu
        memcpy (to->btypevec[i], from->btypevec[i], len);
      }
  
@@ -98,7 +73,7 @@ index 7514e57..f21e630 100644
    if (from->ntmpl_args)
      to->tmpl_argvec = XNEWVEC (char *, from->ntmpl_args);
  
-@@ -1329,11 +1340,17 @@ delete_non_B_K_work_stuff (struct work_stuff *work)
+@@ -1329,11 +1340,17 @@ delete_non_B_K_work_stuff (struct work_s
    /* Discard the remembered types, if any.  */
  
    forget_types (work);
@@ -129,7 +104,7 @@ index 7514e57..f21e630 100644
    int done;
    int success;
    string decl;
-@@ -3564,6 +3583,7 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+@@ -3564,6 +3583,7 @@ do_type (struct work_stuff *work, const
  
    done = 0;
    success = 1;
@@ -137,7 +112,7 @@ index 7514e57..f21e630 100644
    while (success && !done)
      {
        int member;
-@@ -3616,8 +3636,15 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+@@ -3616,8 +3636,15 @@ do_type (struct work_stuff *work, const
  	      success = 0;
  	    }
  	  else
@@ -154,7 +129,7 @@ index 7514e57..f21e630 100644
  	      mangled = &remembered_type;
  	    }
  	  break;
-@@ -3840,6 +3867,9 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+@@ -3840,6 +3867,9 @@ do_type (struct work_stuff *work, const
      string_delete (result);
    string_delete (&decl);
  
@@ -164,7 +139,7 @@ index 7514e57..f21e630 100644
    if (success)
      /* Assume an integral type, if we're not sure.  */
      return (int) ((tk == tk_none) ? tk_integral : tk);
-@@ -4252,6 +4282,41 @@ do_arg (struct work_stuff *work, const char **mangled, string *result)
+@@ -4252,6 +4282,41 @@ do_arg (struct work_stuff *work, const c
  }
  
  static void
@@ -206,7 +181,7 @@ index 7514e57..f21e630 100644
  remember_type (struct work_stuff *work, const char *start, int len)
  {
    char *tem;
-@@ -4515,10 +4580,13 @@ demangle_args (struct work_stuff *work, const char **mangled,
+@@ -4515,10 +4580,13 @@ demangle_args (struct work_stuff *work,
  		{
  		  string_append (declp, ", ");
  		}
@@ -220,11 +195,11 @@ index 7514e57..f21e630 100644
  	      if (PRINT_ARG_TYPES)
  		{
  		  string_appends (declp, &arg);
-diff --git a/libiberty/testsuite/demangle-expected b/libiberty/testsuite/demangle-expected
-index 157d2ee..8793a0b 100644
---- a/libiberty/testsuite/demangle-expected
-+++ b/libiberty/testsuite/demangle-expected
-@@ -4491,3 +4491,21 @@ void eat<int*, Foo()::{lambda(auto:1*, auto:2*)#6}>(int*&, Foo()::{lambda(auto:1
+Index: gcc-6.4.0/libiberty/testsuite/demangle-expected
+===================================================================
+--- gcc-6.4.0.orig/libiberty/testsuite/demangle-expected
++++ gcc-6.4.0/libiberty/testsuite/demangle-expected
+@@ -4491,3 +4491,21 @@ void eat<int*, Foo()::{lambda(auto:1*, a
  
  _Z3eatIPiZ3BarIsEvvEUlPsPT_PT0_E0_EvRS3_RS5_
  void eat<int*, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}>(int*&, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}&)
@@ -246,6 +221,3 @@ index 157d2ee..8793a0b 100644
 +
 +__10%0__S4_0T0T0
 +%0<>::%0(%0<>)
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_6.3.bb b/meta/recipes-devtools/gcc/gcc-cross_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_6.3.bb b/meta/recipes-devtools/gcc/gcc-source_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_6.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_6.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc_6.3.bb b/meta/recipes-devtools/gcc/gcc_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_6.3.bb
rename to meta/recipes-devtools/gcc/gcc_6.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_6.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_6.3.bb b/meta/recipes-devtools/gcc/libgcc_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_6.3.bb
rename to meta/recipes-devtools/gcc/libgcc_6.4.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_6.3.bb b/meta/recipes-devtools/gcc/libgfortran_6.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_6.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_6.4.bb
-- 
2.14.2



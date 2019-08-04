Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBBE71CBD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2019 15:14:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 19so38314096pfa.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2019 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aYfmN2Mln++oBV60jismITeZbnopB78mkz8oli/QrVs=;
	b=Sb7x1oIjIC4EV0O+tU+yV1YQuUz5zy3Pj3aZqXrR+Tu2LRnJ3W7oPKUiNTUSwNhqmq
	wVaiityRrxfdeZQq/ooqzp2NRiQGjz2ZtdDwz+obnRsr7EcHXUJq6HapCwgEOaw4y/a1
	6/EWqTCO6aekGJjk6VkYB8+vcKKdWtXEbUYwE5gyhru6ZEB5i3UTK9IiWKw9xoUl16aa
	zAj5jWz+wotXROWXybgqycmxAemb5+01txsl+KgfJDHDjRTFGyJ/rkDGa5vaMAsbs2jw
	5/t1oAlfA66PI6+bdw/tLdhRB7kOjFn5mVldy/vaw/eHa1X2dj+ivaE2Ne4Mpjl9T0xw
	Zlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aYfmN2Mln++oBV60jismITeZbnopB78mkz8oli/QrVs=;
	b=J5OEoYIhaDZcnJaDcbk0fAGJaRF9ua3nEcL/HJY4Zm7s1tVpGbt8MrwFDJNiWxm2gb
	9botCI70klgUc2aXwKE0GL8zqEz/DQGFoeu8JIJk/TKHzfTXvN/UqqSw/L598ytZUggi
	CI/Rz9FtZp01aMePmihHHFVvWRXVuORkP3yJOxNQR8tl2UC2psOtq9tZt2oCDoyZb4Lr
	jXz0P9e0ynkYeBP1N3Kp3VUwI4J0bunhWF6eeKm6XZi5+FpmMzcM+rbFJKHBOJd3N5zc
	9DESCK2C63Ca/Ov5fuRMRTgzEoTAAfTPItlsE+mtlkxZlDo7js9EA/JctwJuBldkCRke
	cEaQ==
X-Gm-Message-State: APjAAAXY1SmmJDzSViv2ZDTniViJmQhI+c3+h4tMuHnuwE2bOlc00KfG
	lWn+F12rHvFrrUYup4F+M4O3OMtH0DM=
X-Google-Smtp-Source: APXvYqzrt57iui0eHAxlj4lHjLpRJzjoQN5qcjTz3eDTynu+8CMgghkPTGi98GxwcYE73mkZZVsDZg==
X-Received: by 2002:aa7:8502:: with SMTP id v2mr67345265pfn.98.1564931697116; 
	Sun, 04 Aug 2019 08:14:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	s5sm64310791pfm.97.2019.08.04.08.14.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 04 Aug 2019 08:14:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2019 08:14:46 -0700
Message-Id: <20190804151446.39088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] glibc: Update to glibc 2.30
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
X-List-Received-Date: Sun, 04 Aug 2019 15:14:57 -0000
Content-Transfer-Encoding: 8bit

- Drop backported patches
- Move common pieces between cross-localedef and glibc into a common file
- Move latest checksums to glibc-common.inc and remove duplicates from glibc recipe
- Detailed release notes [1]

[1] https://sourceware.org/ml/libc-alpha/2019-08/msg00029.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.29.bb => cross-localedef-native_2.30.bb} |  11 +-
 meta/recipes-core/glibc/glibc-common.inc      |   9 +-
 ...bc-locale_2.29.bb => glibc-locale_2.30.bb} |   0
 ...bc-mtrace_2.29.bb => glibc-mtrace_2.30.bb} |   0
 ...-scripts_2.29.bb => glibc-scripts_2.30.bb} |   0
 meta/recipes-core/glibc/glibc-version.inc     |   8 +
 ...Look-for-host-system-ld.so.cache-as-.patch |  12 +-
 ...e-unsigned-Jcc-instructions-on-size-.patch | 204 ------------------
 ...Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
 ...Raise-the-size-of-arrays-containing-.patch |  21 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   6 +-
 ...Make-relocatable-install-for-locales.patch |   6 +-
 ...5500-e6500-603e-fsqrt-implementation.patch |   6 +-
 ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   6 +-
 ...undefined-reference-to-__sqrt_finite.patch |   6 +-
 ...-are-now-inline-functions-and-call-o.patch |   6 +-
 ...443-which-explains-what-the-patch-do.patch |   6 +-
 ...m-err-tab.pl-with-specific-dirs-in-S.patch |   6 +-
 ...-are-now-inline-functions-and-call-o.patch |   6 +-
 ...igure.ac-handle-correctly-libc_cv_ro.patch |   6 +-
 .../glibc/0014-Add-unused-attribute.patch     |   6 +-
 ...the-path-sets-wrong-config-variables.patch |   6 +-
 ...zone-re-written-tzselect-as-posix-sh.patch |   6 +-
 ...bash-dependency-for-nscd-init-script.patch |   6 +-
 ...ss-building-and-testing-instructions.patch |   6 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  12 +-
 ...0-eglibc-Clear-cache-lines-on-ppc8xx.patch |   6 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |   6 +-
 ...port-cross-locale-generation-support.patch |  24 +--
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   6 +-
 ...-archive-uses-a-hard-coded-locale-pa.patch |   6 +-
 ...ke-_dl_build_local_scope-breadth-fir.patch |   6 +-
 ...t-no-lines-in-bison-generated-files.patch} |   6 +-
 ...027-inject-file-assembly-directives.patch} |   6 +-
 ...ybe-uninitialized-errors-with-Os-BZ.patch} |   6 +-
 .../glibc/glibc/CVE-2019-9169.patch           |  37 ----
 .../glibc/{glibc_2.29.bb => glibc_2.30.bb}    |  28 +--
 38 files changed, 131 insertions(+), 385 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.29.bb => cross-localedef-native_2.30.bb} (85%)
 rename meta/recipes-core/glibc/{glibc-locale_2.29.bb => glibc-locale_2.30.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.29.bb => glibc-mtrace_2.30.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.29.bb => glibc-scripts_2.30.bb} (100%)
 create mode 100644 meta/recipes-core/glibc/glibc-version.inc
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
 rename meta/recipes-core/glibc/glibc/{0028-intl-Emit-no-lines-in-bison-generated-files.patch => 0026-intl-Emit-no-lines-in-bison-generated-files.patch} (87%)
 rename meta/recipes-core/glibc/glibc/{0029-inject-file-assembly-directives.patch => 0027-inject-file-assembly-directives.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch => 0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch} (93%)
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
 rename meta/recipes-core/glibc/{glibc_2.29.bb => glibc_2.30.bb} (83%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0d412e8b41..1966dbd521 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ GCCVERSION ?= "9.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.32%"
 GDBVERSION ?= "8.3%"
-GLIBCVERSION ?= "2.29%"
+GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.0%"
 QEMUVERSION ?= "4.0%"
 GOVERSION ?= "1.12%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.29.bb b/meta/recipes-core/glibc/cross-localedef-native_2.30.bb
similarity index 85%
rename from meta/recipes-core/glibc/cross-localedef-native_2.29.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.30.bb
index 8bc7cd649b..e4923c73d5 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.29.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.30.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
+require glibc-version.inc
+
 # Tell autotools that we're working in the localedef directory
 #
 AUTOTOOLS_SCRIPT_PATH = "${S}/localedef"
@@ -17,15 +19,6 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-SRCBRANCH ?= "release/${PV}/master"
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-
-PV = "2.29"
-
-SRCREV_glibc ?= "86013ef5cea322b8f4b9c22f230c22cce369e947"
-SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
-
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
            file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index cded384592..fa46fd89f1 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -3,10 +3,11 @@ DESCRIPTION = "The GNU C Library is used as the system C library in most systems
 HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
-      file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+
+LIC_FILES_CHKSUM ?= "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
+      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT = "glibc"
 
@@ -21,4 +22,4 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 #
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
-PV = "2.29"
+PV = "2.30"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.29.bb b/meta/recipes-core/glibc/glibc-locale_2.30.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.29.bb
rename to meta/recipes-core/glibc/glibc-locale_2.30.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.29.bb b/meta/recipes-core/glibc/glibc-mtrace_2.30.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.29.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.30.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.29.bb b/meta/recipes-core/glibc/glibc-scripts_2.30.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.29.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.30.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
new file mode 100644
index 0000000000..c18c583399
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -0,0 +1,8 @@
+SRCBRANCH ?= "release/2.30/master"
+PV = "2.30"
+SRCREV_glibc ?= "be9a328c93834648e0bec106a1f86357d1a8c7e1"
+SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
+
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 86ad9eaf1c..d86d1d8dc7 100644
--- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,7 +1,7 @@
-From 0cac7493366586e8f87e8459359c15f702ef8c81 Mon Sep 17 00:00:00 2001
+From f6984c923b41155979764bfa3f44609572be5414 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH 01/30] nativesdk-glibc: Look for host system ld.so.cache as
+Subject: [PATCH 01/28] nativesdk-glibc: Look for host system ld.so.cache as
  well
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -31,10 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index f972524421..e53c3a1b7b 100644
+index 5abeb867f1..981bd5b4af 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2085,6 +2085,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2080,6 +2080,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -49,7 +49,7 @@ index f972524421..e53c3a1b7b 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2143,14 +2151,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2138,14 +2146,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
@@ -65,5 +65,5 @@ index f972524421..e53c3a1b7b 100644
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch b/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
deleted file mode 100644
index 1a343149c0..0000000000
--- a/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From 3f635fb43389b54f682fc9ed2acc0b2aaf4a923d Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Mon, 4 Feb 2019 06:31:01 -0800
-Subject: [PATCH] x86-64 memcmp: Use unsigned Jcc instructions on size [BZ
- #24155]
-
-Since the size argument is unsigned. we should use unsigned Jcc
-instructions, instead of signed, to check size.
-
-Tested on x86-64 and x32, with and without --disable-multi-arch.
-
-	[BZ #24155]
-	CVE-2019-7309
-	* NEWS: Updated for CVE-2019-7309.
-	* sysdeps/x86_64/memcmp.S: Use RDX_LP for size.  Clear the
-	upper 32 bits of RDX register for x32.  Use unsigned Jcc
-	instructions, instead of signed.
-	* sysdeps/x86_64/x32/Makefile (tests): Add tst-size_t-memcmp-2.
-	* sysdeps/x86_64/x32/tst-size_t-memcmp-2.c: New test.
-
-CVE: CVE-2019-7309
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- sysdeps/x86_64/memcmp.S                  | 20 +++---
- sysdeps/x86_64/x32/Makefile              |  3 +-
- sysdeps/x86_64/x32/tst-size_t-memcmp-2.c | 79 ++++++++++++++++++++++++
- 5 files changed, 111 insertions(+), 10 deletions(-)
- create mode 100644 sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
-
-diff --git a/sysdeps/x86_64/memcmp.S b/sysdeps/x86_64/memcmp.S
-index 1fc487caa5..1322bb3b92 100644
---- a/sysdeps/x86_64/memcmp.S
-+++ b/sysdeps/x86_64/memcmp.S
-@@ -21,14 +21,18 @@
- 
- 	.text
- ENTRY (memcmp)
--	test	%rdx, %rdx
-+#ifdef __ILP32__
-+	/* Clear the upper 32 bits.  */
-+	movl	%edx, %edx
-+#endif
-+	test	%RDX_LP, %RDX_LP
- 	jz	L(finz)
- 	cmpq	$1, %rdx
--	jle	L(finr1b)
-+	jbe	L(finr1b)
- 	subq	%rdi, %rsi
- 	movq	%rdx, %r10
- 	cmpq	$32, %r10
--	jge	L(gt32)
-+	jae	L(gt32)
- 	/* Handle small chunks and last block of less than 32 bytes.  */
- L(small):
- 	testq	$1, %r10
-@@ -156,7 +160,7 @@ L(A32):
- 	movq	%r11, %r10
- 	andq	$-32, %r10
- 	cmpq	%r10, %rdi
--        jge	L(mt16)
-+        jae	L(mt16)
- 	/* Pre-unroll to be ready for unrolled 64B loop.  */
- 	testq	$32, %rdi
- 	jz	L(A64)
-@@ -178,7 +182,7 @@ L(A64):
- 	movq	%r11, %r10
- 	andq	$-64, %r10
- 	cmpq	%r10, %rdi
--        jge	L(mt32)
-+        jae	L(mt32)
- 
- L(A64main):
- 	movdqu    (%rdi,%rsi), %xmm0
-@@ -216,7 +220,7 @@ L(mt32):
- 	movq	%r11, %r10
- 	andq	$-32, %r10
- 	cmpq	%r10, %rdi
--        jge	L(mt16)
-+        jae	L(mt16)
- 
- L(A32main):
- 	movdqu    (%rdi,%rsi), %xmm0
-@@ -254,7 +258,7 @@ L(ATR):
- 	movq	%r11, %r10
- 	andq	$-32, %r10
- 	cmpq	%r10, %rdi
--        jge	L(mt16)
-+        jae	L(mt16)
- 	testq	$16, %rdi
- 	jz	L(ATR32)
- 
-@@ -325,7 +329,7 @@ L(ATR64main):
- 	movq	%r11, %r10
- 	andq	$-32, %r10
- 	cmpq	%r10, %rdi
--        jge	L(mt16)
-+        jae	L(mt16)
- 
- L(ATR32res):
- 	movdqa    (%rdi,%rsi), %xmm0
-diff --git a/sysdeps/x86_64/x32/Makefile b/sysdeps/x86_64/x32/Makefile
-index 1557724b0c..8748956563 100644
---- a/sysdeps/x86_64/x32/Makefile
-+++ b/sysdeps/x86_64/x32/Makefile
-@@ -8,7 +8,8 @@ endif
- ifeq ($(subdir),string)
- tests += tst-size_t-memchr tst-size_t-memcmp tst-size_t-memcpy \
- 	 tst-size_t-memrchr tst-size_t-memset tst-size_t-strncasecmp \
--	 tst-size_t-strncmp tst-size_t-strncpy tst-size_t-strnlen
-+	 tst-size_t-strncmp tst-size_t-strncpy tst-size_t-strnlen \
-+	 tst-size_t-memcmp-2
- endif
- 
- ifeq ($(subdir),wcsmbs)
-diff --git a/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c b/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
-new file mode 100644
-index 0000000000..d8ae1a0813
---- /dev/null
-+++ b/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
-@@ -0,0 +1,79 @@
-+/* Test memcmp with size_t in the lower 32 bits of 64-bit register.
-+   Copyright (C) 2019 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#define TEST_MAIN
-+#ifdef WIDE
-+# define TEST_NAME "wmemcmp"
-+#else
-+# define TEST_NAME "memcmp"
-+#endif
-+
-+#include "test-size_t.h"
-+
-+#ifdef WIDE
-+# include <inttypes.h>
-+# include <wchar.h>
-+
-+# define MEMCMP wmemcmp
-+# define CHAR wchar_t
-+#else
-+# define MEMCMP memcmp
-+# define CHAR char
-+#endif
-+
-+IMPL (MEMCMP, 1)
-+
-+typedef int (*proto_t) (const CHAR *, const CHAR *, size_t);
-+
-+static int
-+__attribute__ ((noinline, noclone))
-+do_memcmp (parameter_t a, parameter_t b)
-+{
-+  return CALL (&b, a.p, b.p, a.len);
-+}
-+
-+static int
-+test_main (void)
-+{
-+  test_init ();
-+
-+  parameter_t dest = { { page_size / sizeof (CHAR) }, buf1 };
-+  parameter_t src = { { 0 }, buf2 };
-+
-+  memcpy (buf1, buf2, page_size);
-+
-+  CHAR *p = (CHAR *) buf1;
-+  p[page_size / sizeof (CHAR) - 1] = (CHAR) 1;
-+
-+  int ret = 0;
-+  FOR_EACH_IMPL (impl, 0)
-+    {
-+      src.fn = impl->fn;
-+      int res = do_memcmp (dest, src);
-+      if (res >= 0)
-+	{
-+	  error (0, 0, "Wrong result in function %s: %i >= 0",
-+		 impl->name, res);
-+	  ret = 1;
-+	}
-+    }
-+
-+  return ret ? EXIT_FAILURE : EXIT_SUCCESS;
-+}
-+
-+#include <support/test-driver.c>
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index f663e18edd..63531082a4 100644
--- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,7 +1,7 @@
-From f275c04e263fc2ebf2eaad6ac1ab3c838647bb14 Mon Sep 17 00:00:00 2001
+From b91c323d809039bf9b8c445418579a8b5fe61aea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH 02/30] nativesdk-glibc: Fix buffer overrun with a relocated
+Subject: [PATCH 02/28] nativesdk-glibc: Fix buffer overrun with a relocated
  SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
@@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index e53c3a1b7b..2bd9bc27f2 100644
+index 981bd5b4af..c7a0fa58cb 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1785,7 +1785,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1780,7 +1780,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
@@ -46,5 +46,5 @@ index e53c3a1b7b..2bd9bc27f2 100644
      {
        struct r_search_path_elem *this_dir = *dirs;
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index fd909f644a..48f5a78716 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,7 +1,7 @@
-From 92df5673de18779b612609afa4f687e33e5ecb6e Mon Sep 17 00:00:00 2001
+From 3aceb84e2bc0f796204fe059beede91179b1bc6e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH 03/30] nativesdk-glibc: Raise the size of arrays containing dl
+Subject: [PATCH 03/28] nativesdk-glibc: Raise the size of arrays containing dl
  paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
@@ -41,7 +41,7 @@ index d8d1e2344e..d2247bfc4f 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 2bd9bc27f2..4170cc1a09 100644
+index c7a0fa58cb..4b87505d45 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -110,8 +110,8 @@ static size_t max_capstrlen attribute_relro;
@@ -67,7 +67,7 @@ index 243829f5f7..0e74241703 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 206cd51df6..2fd4fb54ae 100644
+index 3bc9e61891..6a23096435 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
 @@ -168,6 +168,9 @@ static struct argp argp =
@@ -81,10 +81,10 @@ index 206cd51df6..2fd4fb54ae 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 5d97f41b7b..26c5fef929 100644
+index c9490ff694..3962373ebb 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -130,6 +130,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -173,6 +173,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
@@ -92,7 +92,7 @@ index 5d97f41b7b..26c5fef929 100644
  
  /* LD_AUDIT variable contents.  Must be processed before the
     audit_list below.  */
-@@ -1001,12 +1002,12 @@ of this helper program; chances are you did not intend to run this program.\n\
+@@ -1220,13 +1221,13 @@ of this helper program; chances are you did not intend to run this program.\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
  			object we can handle\n\
@@ -102,8 +102,9 @@ index 5d97f41b7b..26c5fef929 100644
  			variable LD_LIBRARY_PATH\n\
    --inhibit-rpath LIST  ignore RUNPATH and RPATH information in object names\n\
  			in LIST\n\
--  --audit LIST          use objects named in LIST as auditors\n");
-+  --audit LIST          use objects named in LIST as auditors\n", LD_SO_CACHE);
+   --audit LIST          use objects named in LIST as auditors\n\
+-  --preload LIST        preload objects named in LIST\n");
++  --preload LIST        preload objects named in LIST\n", LD_SO_CACHE);
  
        ++_dl_skip_args;
        --_dl_argc;
@@ -136,5 +137,5 @@ index bc8b40331d..b0fdd2144b 100644
  # define add_system_dir(dir) add_dir (dir)
  #endif
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index d6c9aac69d..a43f294345 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From ff0f4756f1a98202726c65745aca38354864e033 Mon Sep 17 00:00:00 2001
+From e41e042149eac349e09fa629fcac4c64e574322c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH 04/30] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH 04/28] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -38,5 +38,5 @@ index aa60ca4cd6..3e42e00183 100644
  # define SEG_REG			"gs"
  # define BR_CONSTRAINT			"r"
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 9f9f503a1e..3aad603ada 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,7 +1,7 @@
-From b2ec111dc3a42d9dce71c903524724ae82ff22d8 Mon Sep 17 00:00:00 2001
+From 50ab0b0c116f4ae3d975ec1b15ed4595fd9147f6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
-Subject: [PATCH 05/30] nativesdk-glibc: Make relocatable install for locales
+Subject: [PATCH 05/28] nativesdk-glibc: Make relocatable install for locales
 
 The glibc locale path is hard-coded to the install prefix, but in SDKs we need
 to be able to relocate the binaries.  Expand the strings to 4K and put them in a
@@ -66,5 +66,5 @@ index 7c1cc3eecb..53cb8bfc59 100644
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index a6dddebbc0..5e1c591432 100644
--- a/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,7 +1,7 @@
-From 4dc4b4f63dd79734078fa54446edb7fe2d9c74fa Mon Sep 17 00:00:00 2001
+From 7cccf5cec09f2a42cc3fe5d82ce21b7309330b33 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH 06/30] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH 06/28] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
@@ -1580,5 +1580,5 @@ index 0000000000..04ff8cc181
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 17ffc6fd48..ae6fb268a5 100644
--- a/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,7 +1,7 @@
-From 5506296ef55a6e4916febab63805ddf2d5a5293c Mon Sep 17 00:00:00 2001
+From dc715f6c70d01e9c3b31c1825fa5bc447967c847 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH 07/30] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
+Subject: [PATCH 07/28] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
  names
 
 This bolts in a hook for OE to pass its own version of interpreter
@@ -29,5 +29,5 @@ index c9743e6692..6307f918fc 100644
  
  static struct known_names known_libs[] =
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index aacc9f2e3c..8bed20306e 100644
--- a/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From ea969d7767428d73823c91ad9955829bd66b9e58 Mon Sep 17 00:00:00 2001
+From 42a01c55786a9472934e12e0bf0c40983579b607 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH 08/30] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH 08/28] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -204,5 +204,5 @@ index 26fa067abf..9d175122a8 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index b1d4413036..8a5d6d8b7f 100644
--- a/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From a9e6ca45cdaf13ee595089a5a580d00a95a06bf1 Mon Sep 17 00:00:00 2001
+From a0fcb9135bc8c2b9d8a161d166b6f9d56d7af245 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH 09/30] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 09/28] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -383,5 +383,5 @@ index 9d175122a8..10de1f0cc3 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index 46d205808e..a140a15479 100644
--- a/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,7 +1,7 @@
-From 50ad00401eb16bb88c57d95bc927deeec4033e01 Mon Sep 17 00:00:00 2001
+From 9c1f2229c48c37b38628c485ef16e01f6780160c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH 10/30] Quote from bug 1443 which explains what the patch does
+Subject: [PATCH 10/28] Quote from bug 1443 which explains what the patch does
  :
 
   We build some random program and link it with -lust.  When we run it,
@@ -58,5 +58,5 @@ index 7a2f9d9b78..36a1dd1888 100644
  
  	case R_ARM_TLS_TPOFF32:
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 293b72e79e..cb99092eef 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From a29a718890a3f32e7135f6b64b1a80c74f2d1454 Mon Sep 17 00:00:00 2001
+From 171d2afb930917b0cfbe9df770774da1c92dd185 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH 11/30] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH 11/28] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -32,5 +32,5 @@ index 4f76ee85d2..04b8c8c320 100644
  	touch $@
  
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 6e175b64d1..e233fbe542 100644
--- a/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From 777da88a819738683e4389580cfbfded2a83e87e Mon Sep 17 00:00:00 2001
+From 376be7b96152ef501c8cf95ed6dc52c0318bd26a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH 12/30] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 12/28] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -57,5 +57,5 @@ index 812653558f..10de1f0cc3 100644
  #endif
  {
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index b5adecba06..9ba52e6e10 100644
--- a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From f98b1b9e6b569abd3594b4923ace0c966c9daece Mon Sep 17 00:00:00 2001
+From 1ba4e9577437632856d719cbd5d63b5a76cbb4c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH 13/30] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH 13/28] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -38,5 +38,5 @@ index 634fe4de2a..3db1697f4f 100644
    ;;
  esac
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
index 1cd91475db..0a602bb38c 100644
--- a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
@@ -1,7 +1,7 @@
-From b9cd992052550d4b2bba954099e221677a6652e7 Mon Sep 17 00:00:00 2001
+From b84999dcf642b07e6c14e6ff507be14743349949 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH 14/30] Add unused attribute
+Subject: [PATCH 14/28] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
@@ -30,5 +30,5 @@ index 91e0ad3141..2e9549fe49 100644
  {
    int slash_count = 0;
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index f2e1802392..dd6562a631 100644
--- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From e8a88fb3bb6ffcc43871a7caf7ad9c59bd183e50 Mon Sep 17 00:00:00 2001
+From 7c57f84bef4aaffe4204a7a354411ab3ea7e5273 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH 15/30] 'yes' within the path sets wrong config variables
+Subject: [PATCH 15/28] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -259,5 +259,5 @@ index f9cba6e15d..b21f72f1e4 100644
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index 8a9fa4916c..4d1cf31973 100644
--- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From 10f470476dc947d7b950d6a66f7c06f500c96c60 Mon Sep 17 00:00:00 2001
+From a74f31ea9edf105f1a6dc26497aa2a12ae736660 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH 16/30] timezone: re-written tzselect as posix sh
+Subject: [PATCH 16/28] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -41,5 +41,5 @@ index 18fce27e24..70745f9d36 100755
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index a27759a39a..e4f8a135d3 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From 809392d20fa9a9f8159242451f9969e65a658835 Mon Sep 17 00:00:00 2001
+From 95882b9864ff20e476d15c6825c83728eb99597f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH 17/30] Remove bash dependency for nscd init script
+Subject: [PATCH 17/28] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -71,5 +71,5 @@ index a882da7d8b..b02986ec15 100644
  	;;
  esac
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index f80a3ee1d2..b5efc43042 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From 016d6987600d49d3f45874096e943b97d1667539 Mon Sep 17 00:00:00 2001
+From 6b603d25cc5723ba631dfc60b544774db1147d81 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH 18/30] eglibc: Cross building and testing instructions
+Subject: [PATCH 18/28] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -615,5 +615,5 @@ index 0000000000..b67b468466
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index 603bf21888..0333db2814 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From 7e4423528d362cf6268b1902a8e30d710431f333 Mon Sep 17 00:00:00 2001
+From 2864aaae984d945445f3f79869c703e0b791df88 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH 19/30] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH 19/28] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 4a014d6eff..3a1f419bc3 100644
+index 9fbf705200..64bfd455bc 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -70,9 +70,18 @@ subdir-dirs = include
@@ -52,7 +52,7 @@ index 4a014d6eff..3a1f419bc3 100644
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -195,6 +204,16 @@ others: $(common-objpfx)testrun.sh
+@@ -196,6 +205,16 @@ others: $(common-objpfx)testrun.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -69,7 +69,7 @@ index 4a014d6eff..3a1f419bc3 100644
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -221,6 +240,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
+@@ -222,6 +241,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
@@ -96,5 +96,5 @@ index 0000000000..1d2b669aff
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
index 985b17b583..965ad6578e 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,7 +1,7 @@
-From 8c4d7d70a84a69fe5e8d69539368aa11f8fe20aa Mon Sep 17 00:00:00 2001
+From e2667086bf984de4d3f1226b9467761cd5a4c39f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH 20/30] eglibc: Clear cache lines on ppc8xx
+Subject: [PATCH 20/28] eglibc: Clear cache lines on ppc8xx
 
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
@@ -79,5 +79,5 @@ index 4fd5f70700..1a21e4675c 100644
  	break;
  #ifndef SHARED
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
index fb1b43b18c..76551cf559 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From 19f041215673d4499ee9b23805d5c224c4063689 Mon Sep 17 00:00:00 2001
+From b7290e54a1bda7a0212131655bc27926fc22de22 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH 21/30] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH 21/28] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -52,5 +52,5 @@ index 6ce36d6dd5..425811cc77 100644
 +weak_alias (___fpscr_values, __fpscr_values)
 +
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
index a2d35d43ed..c46021a478 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From 1ae15f60a84f16187e06a05906f44a6658bae487 Mon Sep 17 00:00:00 2001
+From be382b4e0c6de52573f7e037f2d4ff9b1b5bbb6b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH 22/30] eglibc: Forward port cross locale generation support
+Subject: [PATCH 22/28] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index 764e751c36..866957fefa 100644
+index d78cf9b83a..e166f5252e 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -26,7 +26,8 @@ headers		= langinfo.h locale.h bits/locale.h \
@@ -150,7 +150,7 @@ index 94c122df68..80e53e12c8 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index bb4e2c539d..9d08d422c4 100644
+index 6baab6cfb0..b12a2fceab 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -349,7 +349,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -199,7 +199,7 @@ index bb4e2c539d..9d08d422c4 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index 36fd08ba80..08155a27d6 100644
+index cfc9c43fd5..6572cc199c 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -915,7 +915,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -211,7 +211,7 @@ index 36fd08ba80..08155a27d6 100644
  			 : 0);
  
    init_locale_data (&file, nelems);
-@@ -1926,7 +1926,7 @@ read_translit_entry (struct linereader *ldfile, struct locale_ctype_t *ctype,
+@@ -1927,7 +1927,7 @@ read_translit_entry (struct linereader *ldfile, struct locale_ctype_t *ctype,
  	    ignore = 1;
  	  else
  	    /* This value is usable.  */
@@ -220,7 +220,7 @@ index 36fd08ba80..08155a27d6 100644
  
  	  first = 0;
  	}
-@@ -2460,8 +2460,8 @@ with character code range values one must use the absolute ellipsis `...'"));
+@@ -2461,8 +2461,8 @@ with character code range values one must use the absolute ellipsis `...'"));
  	    }
  
  	handle_tok_digit:
@@ -231,7 +231,7 @@ index 36fd08ba80..08155a27d6 100644
  	  handle_digits = 1;
  	  goto read_charclass;
  
-@@ -3901,8 +3901,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3904,8 +3904,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  
  	  while (idx < number)
  	    {
@@ -241,7 +241,7 @@ index 36fd08ba80..08155a27d6 100644
  	      if (res == 0)
  		{
  		  replace = 1;
-@@ -3939,11 +3938,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3942,11 +3941,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
        for (size_t cnt = 0; cnt < number; ++cnt)
  	{
  	  struct translit_to_t *srunp;
@@ -255,7 +255,7 @@ index 36fd08ba80..08155a27d6 100644
  	      srunp = srunp->next;
  	    }
  	  /* Plus one for the extra NUL character marking the end of
-@@ -3967,18 +3966,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3970,18 +3969,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  	  ctype->translit_from_idx[cnt] = from_len;
  	  ctype->translit_to_idx[cnt] = to_len;
  
@@ -521,7 +521,7 @@ index c063fc097d..4e7465e55a 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index 9427a5ad28..8f4140d684 100644
+index 9bd35454b9..2a67dc6589 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -64,36 +64,6 @@ static char *const _nl_current_used[] =
@@ -562,5 +562,5 @@ index 9427a5ad28..8f4140d684 100644
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
index 0f7c5fdf72..17667da99f 100644
--- a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 809c79b7d554a4ec83921df9d8773c99a03dc81c Mon Sep 17 00:00:00 2001
+From afa8d6faeddeb80aca318b33edf49d9f8ce65761 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH 23/30] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH 23/28] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -28,5 +28,5 @@ index a1e6e0ec3c..7f75528eae 100644
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index c289e544ee..f68e4f4fa6 100644
--- a/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,7 +1,7 @@
-From b2d1c9b4159bfd661a4996588d06d922491dfecb Mon Sep 17 00:00:00 2001
+From c13e18adb634a6fd59129150ab7f9468f64dc931 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
-Subject: [PATCH 24/30] localedef --add-to-archive uses a hard-coded locale
+Subject: [PATCH 24/28] localedef --add-to-archive uses a hard-coded locale
  path
 
 it doesn't exist in normal use, and there's no way to pass an
@@ -80,5 +80,5 @@ index e6310b18be..f54a76eade 100644
  	      if (readonly)
  		{
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 0ddd2e58b2..76a9eb2563 100644
--- a/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From 804b05a034bfaf4e3427243e6baf736086822cd0 Mon Sep 17 00:00:00 2001
+From 7c9ebe966bb97dd14de5719905b61311211ae3c8 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH 25/30] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH 25/28] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -52,5 +52,5 @@ index e12c353158..9234daac05 100644
  }
  
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
similarity index 87%
rename from meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch
rename to meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
index 0eb006ffb7..7589e11d57 100644
--- a/meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch
+++ b/meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch
@@ -1,7 +1,7 @@
-From 39f910a4b8195d0538425aad7f0ebdc232b7a582 Mon Sep 17 00:00:00 2001
+From aa5c758fbb7dbb026df33fc6bdc05548547bdb17 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:44:00 -0700
-Subject: [PATCH 28/30] intl: Emit no lines in bison generated files
+Subject: [PATCH 26/28] intl: Emit no lines in bison generated files
 
 Improve reproducibility:
 Do not put any #line preprocessor commands in bison generated files.
@@ -30,5 +30,5 @@ index 9eea8d57e3..627dce4cf1 100644
  $(inst_localedir)/locale.alias: locale.alias $(+force)
  	$(do-install)
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0027-inject-file-assembly-directives.patch
similarity index 98%
rename from meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch
rename to meta/recipes-core/glibc/glibc/0027-inject-file-assembly-directives.patch
index 2874fb5815..dc205a833f 100644
--- a/meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch
+++ b/meta/recipes-core/glibc/glibc/0027-inject-file-assembly-directives.patch
@@ -1,7 +1,7 @@
-From 649bfb399265eb48a9fe8db1c2b5a31633c55152 Mon Sep 17 00:00:00 2001
+From fecd98040a2ae1bc5943a40a1623d76a696e0785 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 17:29:35 -0800
-Subject: [PATCH 29/30] inject file assembly directives
+Subject: [PATCH 27/28] inject file assembly directives
 
 Currently, non-IA builds are not reproducibile since build paths are
 being injected into the debug symbols. These are coming from the use of
@@ -300,5 +300,5 @@ index eeb96544e3..da182b28f8 100644
 +
  #include <brk.S>
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
rename to meta/recipes-core/glibc/glibc/0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
index adc2424002..6c49066fd1 100644
--- a/meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ b/meta/recipes-core/glibc/glibc/0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -1,7 +1,7 @@
-From 6ddab9c8692e6a777c2e2e7a6ca26a65df7d2c5d Mon Sep 17 00:00:00 2001
+From d934788e3221c28c9a1892235cbe4cfd1b28ced0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Mon, 17 Dec 2018 21:36:18 +0000
-Subject: [PATCH 30/30] locale: prevent maybe-uninitialized errors with -Os [BZ
+Subject: [PATCH 28/28] locale: prevent maybe-uninitialized errors with -Os [BZ
  #19444]
 
 Fixes following error when building for aarch64 with -Os:
@@ -52,5 +52,5 @@ index 7ca81498b2..d608ca70bb 100644
    const unsigned char *usrc;
  
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
deleted file mode 100644
index cf3744b24a..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-CVE: CVE-2019-9169
-CVE: CVE-2018-20796
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 583dd860d5b833037175247230a328f0050dbfe9 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 21 Jan 2019 11:08:13 -0800
-Subject: [PATCH] regex: fix read overrun [BZ #24114]
-
-Problem found by AddressSanitizer, reported by Hongxu Chen in:
-https://debbugs.gnu.org/34140
-* posix/regexec.c (proceed_next_node):
-Do not read past end of input buffer.
----
- posix/regexec.c |  6 ++++--
- 2 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/posix/regexec.c b/posix/regexec.c
-index 91d5a79..084b122 100644
---- a/posix/regexec.c
-+++ b/posix/regexec.c
-@@ -1293,8 +1293,10 @@ proceed_next_node (const re_match_context_t *mctx, Idx nregs, regmatch_t *regs,
- 	      else if (naccepted)
- 		{
- 		  char *buf = (char *) re_string_get_buffer (&mctx->input);
--		  if (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
--			      naccepted) != 0)
-+		  if (mctx->input.valid_len - *pidx < naccepted
-+		      || (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
-+				  naccepted)
-+			  != 0))
- 		    return -1;
- 		}
- 	    }
--- 
-2.9.3
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.30.bb
similarity index 83%
rename from meta/recipes-core/glibc/glibc_2.29.bb
rename to meta/recipes-core/glibc/glibc_2.30.bb
index c6b2caad42..03add3363c 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.30.bb
@@ -1,21 +1,8 @@
 require glibc.inc
-
-LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
-      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+require glibc-version.inc
 
 DEPENDS += "gperf-native bison-native make-native"
 
-PV = "2.29"
-
-SRCREV ?= "86013ef5cea322b8f4b9c22f230c22cce369e947"
-
-SRCBRANCH ?= "release/${PV}/master"
-
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-
 NATIVESDKFIXES ?= ""
 NATIVESDKFIXES_class-nativesdk = "\
            file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
@@ -25,7 +12,7 @@ NATIVESDKFIXES_class-nativesdk = "\
            file://0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch \
 "
 
-SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
+SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://makedbs.sh \
@@ -51,13 +38,10 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
-           file://0028-intl-Emit-no-lines-in-bison-generated-files.patch \
-           file://0029-inject-file-assembly-directives.patch \
-           file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch \
-           file://CVE-2019-9169.patch \
-"
-
+           file://0026-intl-Emit-no-lines-in-bison-generated-files.patch \
+           file://0027-inject-file-assembly-directives.patch \
+           file://0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.22.0



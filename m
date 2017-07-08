Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C454780CE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u62so7289446pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LQfsAh8uJQT88IcnObTbykRMsza3ZbdMpknDoNkCpr8=;
	b=FbT8ATT3zIl4ApVC7JAmVHgTZyc45hSNI+sOsNVXC/uwiJYHi861bi0SUDi5j30ICP
	GT3Y6J6qXliKLLlb6VNGMCPnCrusE+z/HKvaDvMwRtWKeSTlqmePKz6UPYDOFuLE+NOW
	obb6J0e9a22V6orn5zR8Xb2mCOrQYUOqqAoZyXgbHV6ZU3EWy33rJkFir4cE/R1M5It8
	NtPXk7edLF5UVSH9hjggwlBg+GrpScJe00a0up0GBPRxm1YwejMmFJ8Tn+9IgfWUK6s+
	4sI+Yfwzc4hPrh9JUx4S2iiZzOzsFZ45sM7h+pm+GWunk3UEOVnBNX75MT5UGSFosgi+
	Jljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LQfsAh8uJQT88IcnObTbykRMsza3ZbdMpknDoNkCpr8=;
	b=KeDGPL1ndztg26+YuNS0gurBEKfa/Zr4KfXsFa0SbQfifINn+ek27OgB2pUTDnZnn+
	4dfekDGs7IU9tmkyWWwfSZvkeRSdWSNiCTXTNjv91nB4FfZ6wYwNLhIpSbodLgziEFMv
	MxGkNX7m+OendYqE6ZtWV/VRea0RvJtQc3RjTXN/MsaNPUcqTnS+BtS6pXv4t6q9zrFo
	K8UivoYwUx3KmTReEmYr+tjFRN3ubVeBKKHDeti8UhhqYtwcerhrAYnlqY0De83Qi/8c
	M0WiR70JhkULOVPch9tcnj0lPE1LKkqRE1dQzvbGa8dAtJ4nuEfTn+JSvWSwuBSVvwrd
	k0GQ==
X-Gm-Message-State: AIVw110JHyhCtIut+PhIS7J3sIVW1Mp/I/e6ZErFmObCJcB2H768dVoX
	9K6WAzRxsXLjcWAB
X-Received: by 10.98.97.66 with SMTP id v63mr15820566pfb.230.1499520892155;
	Sat, 08 Jul 2017 06:34:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:29 -0700
Message-Id: <0a80863f9967ac4bfb4b5e8656edcc761429a593.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 10/10] mpeg2dec: Fix textrels QA errors on arm
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:51 -0000

Fixes
WARNING: mpeg2dec-0.5.1-r0 do_package_qa: QA Issue: ELF binary '/mnt/a/oe/build/tmp/work/armv5te-bec-linux-musleabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0' has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-check-for-available-arm-optimizations.patch | 55 +++++++++++++++++++
 ...ity-of-global-symbols-used-in-ARM-specifi.patch | 63 ++++++++++++++++++++++
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb |  5 +-
 3 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm-optimizations.patch
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch

diff --git a/meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm-optimizations.patch b/meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm-optimizations.patch
new file mode 100644
index 0000000000..5bf68b39ee
--- /dev/null
+++ b/meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm-optimizations.patch
@@ -0,0 +1,55 @@
+From cbcff58ed670c8edc0be1004384cbe0fd07d8d26 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jul 2017 18:49:21 -0700
+Subject: [PATCH 1/2] check for available arm optimizations
+
+Taken From
+http://sources.debian.net/src/mpeg2dec/0.5.1-7/debian/patches/65_arm-test-with-compiler.patch/
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index acdcb1e..2c0a721 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -59,7 +59,7 @@ elif test x"$GCC" = x"yes"; then
+     AC_TRY_CFLAGS([$TRY_CFLAGS $CFLAGS],[OPT_CFLAGS="$TRY_CFLAGS"])
+ 
+     dnl arch-specific flags
+-    arm_conditional=false
++    build_arm_opt=false
+     case "$host" in
+     i?86-* | k?-* | x86_64-* | amd64-*)
+ 	AC_DEFINE([ARCH_X86],,[x86 architecture])
+@@ -102,8 +102,12 @@ elif test x"$GCC" = x"yes"; then
+     alpha*)
+ 	AC_DEFINE([ARCH_ALPHA],,[alpha architecture]);;
+     arm*)
+-	arm_conditional=:
+-	AC_DEFINE([ARCH_ARM],,[ARM architecture]);;
++	AC_LANG(C)
++	AC_COMPILE_IFELSE(
++		[AC_LANG_SOURCE([[
++			void foo(void) { __asm__ volatile("pld [r1]"); }]])],
++		build_arm_opt=true; AC_DEFINE([ARCH_ARM],,[ARM architecture]),
++		build_arm_opt=false);;
+     esac
+ elif test x"$CC" = x"tendracc"; then
+     dnl TenDRA portability checking compiler
+@@ -123,7 +127,7 @@ else
+     esac
+ fi
+ 
+-AM_CONDITIONAL(ARCH_ARM, ${arm_conditional})
++AM_CONDITIONAL(ARCH_ARM, test x$build_arm_opt = xtrue)
+ 
+ dnl Checks for libtool - this must be done after we set cflags
+ AC_LIBTOOL_WIN32_DLL
+-- 
+2.13.2
+
diff --git a/meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch b/meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch
new file mode 100644
index 0000000000..8301692368
--- /dev/null
+++ b/meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch
@@ -0,0 +1,63 @@
+From f9d9dc92d75f8910e3cd5fdcbea72e505cdf3493 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jul 2017 19:03:36 -0700
+Subject: [PATCH 2/2] Set visibility of global symbols used in ARM specific
+ assembly file to internal
+
+Taken from
+http://sources.debian.net/src/mpeg2dec/0.5.1-7/debian/patches/60_arm-private-symbols.patch/
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libmpeg2/motion_comp_arm_s.S | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/libmpeg2/motion_comp_arm_s.S b/libmpeg2/motion_comp_arm_s.S
+index f6c3d7d..c921f7c 100644
+--- a/libmpeg2/motion_comp_arm_s.S
++++ b/libmpeg2/motion_comp_arm_s.S
+@@ -23,7 +23,8 @@
+ 
+ @ ----------------------------------------------------------------
+ 	.align
+-	.global MC_put_o_16_arm
++	.global   MC_put_o_16_arm
++	.internal MC_put_o_16_arm
+ MC_put_o_16_arm:
+ 	@@ void func(uint8_t * dest, const uint8_t * ref, int stride, int height)
+ 	pld [r1]
+@@ -83,7 +84,8 @@ MC_put_o_16_arm_align_jt:
+ 
+ @ ----------------------------------------------------------------
+ 	.align
+-	.global MC_put_o_8_arm
++	.global   MC_put_o_8_arm
++	.internal MC_put_o_8_arm
+ MC_put_o_8_arm:
+ 	@@ void func(uint8_t * dest, const uint8_t * ref, int stride, int height)
+ 	pld [r1]
+@@ -152,7 +154,8 @@ MC_put_o_8_arm_align_jt:
+ .endm
+ 
+ 	.align
+-	.global MC_put_x_16_arm
++	.global   MC_put_x_16_arm
++	.internal MC_put_x_16_arm
+ MC_put_x_16_arm:
+ 	@@ void func(uint8_t * dest, const uint8_t * ref, int stride, int height)
+ 	pld [r1]
+@@ -244,7 +247,8 @@ MC_put_x_16_arm_align_jt:
+ 
+ @ ----------------------------------------------------------------
+ 	.align
+-	.global MC_put_x_8_arm
++	.global   MC_put_x_8_arm
++	.internal MC_put_x_8_arm
+ MC_put_x_8_arm:
+ 	@@ void func(uint8_t * dest, const uint8_t * ref, int stride, int height)
+ 	pld [r1]
+-- 
+2.13.2
+
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
index 8e995daa7c..7711c2dc10 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://include/mpeg2.h;beginline=1;endline=22;md5=7766f4fcb58f0f8413c49a746f2ab89b"
 
 SRC_URI = "http://libmpeg2.sourceforge.net/files/libmpeg2-${PV}.tar.gz \
-           file://altivec_h_needed.patch"
+           file://altivec_h_needed.patch \
+           file://0001-check-for-available-arm-optimizations.patch \
+           file://0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch \
+           "
 
 S = "${WORKDIR}/libmpeg2-${PV}"
 
-- 
2.13.2



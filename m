Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id DFE157FD71
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 07:20:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0EB832218B;
	Tue,  7 Jan 2020 02:20:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Tue, 07 Jan 2020 02:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zYG8IPGv4dZ8K7fcN
	YHcMtxUtn1UVKoTqvZA6lPEcgY=; b=o0PX+Cu/QMyoBxFFhPotDyFu8psRQwpZS
	1NbgkVyU6XbWfyeZp6Qp76aWvCevYveI+awRdHtN7+6vGnQYr+ESsBy/EQhYcc+h
	Zj/csRZ/Sh1c5sftrJNfjiAIyW9WydbUz0tge6wMlAlKt9jBKlTLF+d3E9OQIBOJ
	hINerXocrLr2aCLgIhwnGI048fFPghvJOX1CFf748MNSUX9k2tda0jNmTTvoS/jv
	+/5W83zvV65DxatBtPdUEI+qwQEAoVli6VPaoR+81s3SSjtLwlq6Y2MLy1G9HmSl
	T9HpLPT8hmTKlbEl6mTLJSvLkfUxybQangk7rjXW1Sd/bUnsWMT6A==
X-ME-Sender: <xms:MjEUXgHhuvPLx_pFmAEyF7MEMYYBPiYGva4-Z30Y6qM0QXGQOwQ4tA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddtjecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdr
	fhhiqeenucffohhmrghinhepgihiphhhrdhorhhgpdhgmhgrnhgvrdhorhhgnecukfhppe
	duleeirddvgeegrdduledurdejgeenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhu
	khesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MjEUXu4SWKtYiK0IKEuz98Sf51HSr4v26Im0TEs934AT_uu5XWiu3w>
	<xmx:MjEUXjtrOwHaqXqfgVSTqpfH-m-ZrgX2TC6HfZ7oDNiPZibjyHzZXA>
	<xmx:MjEUXi_ojcz-ThsKq8PEVjbWxG0ZTn7Wlt1x5XXWuDIhHSMn5QrNww>
	<xmx:MzEUXtF1HHMS0yJB-VfdF0l7HrQ2Natc_oF9y1jf3Je5deSuMtzzHw>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id B97E180062;
	Tue,  7 Jan 2020 02:20:17 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 09:20:14 +0200
Message-Id: <20200107072014.5221-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Subject: [PATCH] speexdsp: 1.2rc3 -> 1.2.0
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
X-List-Received-Date: Tue, 07 Jan 2020 07:20:20 -0000
Content-Transfer-Encoding: 8bit

Removed backported patch
0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch

Enabling NEON on aarch64 doesn't break the build any more.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...n-HAVE_STDINT_H-et-al.-being-defined.patch | 63 -------------------
 .../{speexdsp_1.2rc3.bb => speexdsp_1.2.0.bb} | 20 +-----
 2 files changed, 3 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
 rename meta/recipes-multimedia/speex/{speexdsp_1.2rc3.bb => speexdsp_1.2.0.bb} (51%)

diff --git a/meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch b/meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
deleted file mode 100644
index c7067daaa0..0000000000
--- a/meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From c73370ceafd138becee8ca3c688ba75756830bfe Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
-Date: Sun, 5 Jul 2015 17:48:16 +0300
-Subject: [PATCH] Don't rely on HAVE_STDINT_H et al. being defined
-
-Not everyone who includes speexdsp_config_types.h will have a test
-which defines those, and if we've chosen to use the stdint types at
-configure time then we know exactly which header(s) are available, so
-just choose the best one then and generate the header to use it.
-
-This patch, including the above text, is copied from a commit in the
-speex repository[1]. The original commit for speex was made by Ron
-<ron@debian.org>.
-
-[1] https://git.xiph.org/?p=speex.git;a=commitdiff;h=774c87d6cb7dd8dabdd17677fc6da753ecf4aa87
-
-Upstream-Status: Backport
-
-Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
----
- configure.ac                             | 6 ++++++
- include/speex/speexdsp_config_types.h.in | 8 +-------
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2cd2d1e..1de0c23 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -334,6 +334,12 @@ AC_SUBST([USIZE16])
- AC_SUBST([SIZE32])
- AC_SUBST([USIZE32])
- 
-+AS_IF([test "$ac_cv_header_stdint_h" = "yes"],    [INCLUDE_STDINT="#include <stdint.h>"],
-+      [test "$ac_cv_header_inttypes_h" = "yes"],  [INCLUDE_STDINT="#include <inttypes.h>"],
-+      [test "$ac_cv_header_sys_types_h" = "yes"], [INCLUDE_STDINT="#include <sys/types.h>"])
-+
-+AC_SUBST([INCLUDE_STDINT])
-+
- AC_CONFIG_FILES([
-            Makefile libspeexdsp/Makefile doc/Makefile SpeexDSP.spec
-            include/Makefile include/speex/Makefile speexdsp.pc
-diff --git a/include/speex/speexdsp_config_types.h.in b/include/speex/speexdsp_config_types.h.in
-index 02b82fd..5ea7b55 100644
---- a/include/speex/speexdsp_config_types.h.in
-+++ b/include/speex/speexdsp_config_types.h.in
-@@ -1,13 +1,7 @@
- #ifndef __SPEEX_TYPES_H__
- #define __SPEEX_TYPES_H__
- 
--#if defined HAVE_STDINT_H
--#  include <stdint.h>
--#elif defined HAVE_INTTYPES_H
--#  include <inttypes.h>
--#elif defined HAVE_SYS_TYPES_H
--#  include <sys/types.h>
--#endif
-+@INCLUDE_STDINT@
- 
- typedef @SIZE16@ spx_int16_t;
- typedef @USIZE16@ spx_uint16_t;
--- 
-1.9.3
-
diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb b/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
similarity index 51%
rename from meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb
rename to meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
index 03c949be22..2f934ebe3a 100644
--- a/meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb
+++ b/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
@@ -5,11 +5,10 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz \
-           file://0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch"
+SRC_URI = "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "70d9d31184f7eb761192fd1ef0b73333"
-SRC_URI[sha256sum] = "4ae688600039f5d224bdf2e222d2fbde65608447e4c2f681585e4dca6df692f1"
+SRC_URI[md5sum] = "b722df341576dc185d897131321008fc"
+SRC_URI[sha256sum] = "682042fc6f9bee6294ec453f470dadc26c6ff29b9c9e9ad2ffc1f4312fd64771"
 
 inherit autotools pkgconfig
 
@@ -18,19 +17,6 @@ EXTRA_OECONF = "\
         ${@bb.utils.contains('TARGET_FPU', 'soft', '--enable-fixed-point --disable-float-api', '', d)} \
 "
 
-# Workaround for a build failure when building with MACHINE=qemuarm64. I think
-# aarch64 is supposed to support NEON just fine, but building for qemuarm64
-# fails in NEON code:
-#
-# .../speexdsp-1.2rc3/libspeexdsp/resample_neon.h:148:5: error: impossible constraint in 'asm'
-#      asm volatile ("  cmp %[len], #0\n"
-#      ^
-#
-# I sent an email about the issue to speex-dev. At the time of writing there
-# are no responses yet:
-# http://thread.gmane.org/gmane.comp.audio.compression.speex.devel/7360
-EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '--disable-neon', '', d)}"
-
 # speexdsp was split off from speex in 1.2rc2. Older versions of speex can't
 # be installed together with speexdsp, since they contain overlapping files.
 RCONFLICTS_${PN} = "speex (< 1.2rc2)"
-- 
2.20.1



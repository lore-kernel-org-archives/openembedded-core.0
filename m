Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9F23F78F6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 18:17:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 05DBA21D23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 14:17:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 27 Aug 2018 14:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+FPDzdorwQ45IBYfY
	7s3h5KLKJUQVpfgHIgkRhq8GTs=; b=aaKHcbxrnfoFvaA65ufp3lszYwlbrCmvQ
	L+D0IyPOMZiittBl9YVvxe4Co5FhXUgUTHTPWCS4pPj6qay/BzEa5wkRYE2S9mgc
	eawcBA1NAtoYKOXaJx2DL4lRdNdCRKcvfigjBsrkJqRjUHd32LV3qZk6pxgmQBzD
	eGXyHUzre/j5+mLgpFORgXa0CEvwWp58lJxiSKqvjB4c//MFT3wpmffTr8hx7Jcs
	oViKRQvitJUdaDloQU+GzcO7l4B3m/sqr7vTDWCK9MqDR4xikO7Uk8jMxYrKWlMP
	UxMwlglRxhbvwdEK6GG6qmFl6+Sk0cEMKOQ1nhzwhMwTKN8/Yofxw==
X-ME-Proxy: <xmx:G0CEWxR4bJBBaj-r8Bvc-pBbQ4v8zxHVAt3Uzr57MzoEZZpMo2LBZg>
	<xmx:G0CEW68OyjC_Fktfvgi7fF7Q5grM3jlkDhDmGK92c8Rb5vQvSUMqjA>
	<xmx:G0CEW4rDZ8IFykM5ZXK6lq0TjpexxEUh1N7qQ6VUywkuPm8-QJvZGg>
	<xmx:G0CEW3m72thAWuudlqUD6Md36vWFxDF2b2BnG5lgHoj5vobvPe6OMg>
	<xmx:G0CEW_JztDhNi8lEWTP8L95mCGKeel0woyj54DEm6CxGGBYuDYbPfA>
	<xmx:G0CEW7t4eXkpA3WEbDkUu1_6heAmgQ7uVLEjAXL4LcdHMf8svbRaPg>
X-ME-Sender: <xms:G0CEWz-NKLdB6NGEjNjP7r_WzuK3hB4y8mg0ZJDXcxevk31XnaUTKA>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 173AFE44F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 14:16:58 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2018 21:16:39 +0300
Message-Id: <20180827181639.9404-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] pulseaudio: 11.1 -> 12.2
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
X-List-Received-Date: Mon, 27 Aug 2018 18:17:00 -0000

Release notes for 12.0:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/12.0/

12.1 contains a few regression fixes:
https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-July/030259.html

12.2 is just a fixup for the configure script brokenness in the 12.1 tarball.

qpaeq changed license from AGPL to LGPL, so now there's no AGPL licensed
code any more. This removes the excuse to not enable fftw support (i.e.
module-equalizer-sink and qpaeq). I'll enable fftw in a separate patch.

There's a new gsettings module that should be enabled, but I'll do
that in a separate patch. It's not particularly important, because the
module is only used by the paprefs GUI application that doesn't seem to
be packaged for OE at the moment.

Removed upstreamed patches:
0001-padsp-Make-it-compile-on-musl.patch
0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch

License-Update: qpaeq changed license from AGPL to LGPL:
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/commit/61217528a1cb5043ca3fa1051a73ad3268cfb3d8

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---

According to the Yocto project status emails, YP 2.6 M3 Build Target is
today. If I recall correctly, that's the cutoff point for version
upgrades, so this patch may be late. If so, I apologize for dropping the
ball as a recipe maintainer. I can resend after 2.6 is out.

 .../pulseaudio/pulseaudio.inc                 | 15 ++--
 ...nly-define-memfd_create-if-not-alrea.patch | 66 -----------------
 .../0001-padsp-Make-it-compile-on-musl.patch  | 70 -------------------
 ...{pulseaudio_11.1.bb => pulseaudio_12.2.bb} |  6 +-
 4 files changed, 7 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_11.1.bb => pulseaudio_12.2.bb} (53%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 8189a569e1..f526690390 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -16,9 +16,6 @@ SECTION = "libs/multimedia"
 # The src/pulsecore/filter/ directory contains code under the 3-clause BSD
 # license.
 #
-# src/utils/qpaeq is licensed under AGPL. qpaeq is not installed by this
-# recipe, however, which is why AGPL is not mentioned in LICENSE.
-#
 # People who distribute PulseAudio binaries need to also consider that there
 # are some dependencies to GPL libraries. LGPL code that depends on GPL
 # libraries probably becomes effectively GPL-licensed (at compile-time? or at
@@ -47,16 +44,14 @@ SECTION = "libs/multimedia"
 # section 3, and therefore libdbus's GPL license doesn't affect PulseAudio.
 LICENSE = "LGPLv2.1+ & MIT & BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a848e8d03f04976778eab2348b59ed2b \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
                     file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://AGPL;md5=73f1eb20517c55bf9493b7dd6e480788 \
                     file://src/modules/echo-cancel/adrian-license.txt;md5=abbab006a561fbffccedf1c3531f34ab \
                     file://src/pulsecore/filter/LICENSE.WEBKIT;md5=49defbaffddf8c51faf606ff7fc3b1f7 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84 \
                     file://src/modules/reserve.h;beginline=6;endline=28;md5=0e23094760367d51b6609750e9b31fbb \
                     file://src/pulsecore/rtkit.h;beginline=6;endline=29;md5=3f00ff966716ae0817c31576d1473528 \
-                    file://src/utils/qpaeq;beginline=2;endline=16;md5=7f62515a4762f0c3fc3d4201858bb964 \
                     file://src/modules/echo-cancel/adrian-aec.h;beginline=3;endline=12;md5=d3ed4fad1c073f8b06f37495dc5d1026 \
                     file://src/pulsecore/filter/biquad.h;beginline=1;endline=4;md5=6d46d1365206528a20137355924233c1 \
 "
@@ -93,10 +88,6 @@ EXTRA_OECONF += "--without-soxr"
 # ddbd713293 without explaining why it was not made a PACKAGECONFIG item
 # instead. Oh well, let's keep it disabled until someone expresses some
 # interest in having it enabled.
-#
-# One nice thing about disabling this is that it also prevents qpaeq from
-# being installed, so we avoid adding AGPL to the list of licenses (nothing
-# else in PulseAudio is licensed under AGPL).
 EXTRA_OECONF += "--without-fftw"
 
 # The "adrian" echo canceller implementation has a non-standard license
@@ -106,6 +97,10 @@ EXTRA_OECONF += "--without-fftw"
 # very good anyway, better alternatives exist (such as the webrtc canceller).
 EXTRA_OECONF += "--disable-adrian-aec"
 
+# FIXME: The gsettings module is temporarily disabled, because adding support
+# for it is a bit complicated.
+EXTRA_OECONF += "--disable-gsettings"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
deleted file mode 100644
index 0391f3785b..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 0cb66c0c5aafd48b63a755860746e70afb332c8d Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Wed, 24 Jan 2018 03:51:49 +0200
-Subject: [PATCH] memfd-wrappers: only define memfd_create() if not already
- defined
-
-glibc 2.27 is to be released soon, and it will provide memfd_create().
-If glibc provides the function, we must not define it ourselves,
-otherwise building fails due to conflict between the two implementations
-of the same function.
-
-BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=104733
----
-Upstream-Status: Submitted [https://bugs.freedesktop.org/attachment.cgi?id=136927]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- configure.ac                   | 3 +++
- src/pulsecore/memfd-wrappers.h | 7 ++++---
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 77b5ff5..3a71fd8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -607,6 +607,9 @@ AS_IF([test "x$enable_memfd" = "xyes" && test "x$HAVE_MEMFD" = "x0"],
-     [AC_MSG_ERROR([*** Your Linux kernel does not support memfd shared memory.
-                   *** Use linux v3.17 or higher for such a feature.])])
- 
-+AS_IF([test "x$HAVE_MEMFD" = "x1"],
-+    AC_CHECK_FUNCS([memfd_create]))
-+
- AC_SUBST(HAVE_MEMFD)
- AM_CONDITIONAL([HAVE_MEMFD], [test "x$HAVE_MEMFD" = x1])
- AS_IF([test "x$HAVE_MEMFD" = "x1"], AC_DEFINE([HAVE_MEMFD], 1, [Have memfd shared memory.]))
-diff --git a/src/pulsecore/memfd-wrappers.h b/src/pulsecore/memfd-wrappers.h
-index 3bed9b2..c7aadfd 100644
---- a/src/pulsecore/memfd-wrappers.h
-+++ b/src/pulsecore/memfd-wrappers.h
-@@ -20,13 +20,14 @@
-   License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
- ***/
- 
--#ifdef HAVE_MEMFD
-+#if defined(HAVE_MEMFD) && !defined(HAVE_MEMFD_CREATE)
- 
- #include <sys/syscall.h>
- #include <fcntl.h>
- 
- /*
-- * No glibc wrappers exist for memfd_create(2), so provide our own.
-+ * Before glibc version 2.27 there was no wrapper for memfd_create(2),
-+ * so we have to provide our own.
-  *
-  * Also define memfd fcntl sealing macros. While they are already
-  * defined in the kernel header file <linux/fcntl.h>, that file as
-@@ -63,6 +64,6 @@ static inline int memfd_create(const char *name, unsigned int flags) {
- #define F_SEAL_WRITE    0x0008  /* prevent writes */
- #endif
- 
--#endif /* HAVE_MEMFD */
-+#endif /* HAVE_MEMFD && !HAVE_MEMFD_CREATE */
- 
- #endif
--- 
-2.16.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
deleted file mode 100644
index 85559950e8..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From f6ab3c3aa7a1841c8add04828029356d2a8c88e7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Apr 2015 21:56:31 -0700
-Subject: [PATCH] padsp: Make it compile on musl
-
-break assumptions on glibc and there is no stat64 on non
-glibc C libraries
-
-See pulseaudio bug
-
-https://bugs.freedesktop.org/show_bug.cgi?id=85319
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/utils/padsp.c | 15 +++++++++------
- 1 file changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/src/utils/padsp.c b/src/utils/padsp.c
-index e61373c..684721a 100644
---- a/src/utils/padsp.c
-+++ b/src/utils/padsp.c
-@@ -2368,7 +2368,7 @@ fail:
-     return ret;
- }
- 
--#ifdef sun
-+#ifndef __GLIBC__
- int ioctl(int fd, int request, ...) {
- #else
- int ioctl(int fd, unsigned long request, ...) {
-@@ -2508,10 +2508,13 @@ int stat(const char *pathname, struct stat *buf) {
- 
-     return 0;
- }
--
- #ifdef HAVE_OPEN64
--
-+#undef stat64
-+#ifdef __GLIBC__
- int stat64(const char *pathname, struct stat64 *buf) {
-+#else
-+int stat64(const char *pathname, struct stat *buf) {
-+#endif
-     struct stat oldbuf;
-     int ret;
- 
-@@ -2544,7 +2547,7 @@ int stat64(const char *pathname, struct stat64 *buf) {
- 
-     return 0;
- }
--
-+#undef open64
- int open64(const char *filename, int flags, ...) {
-     va_list args;
-     mode_t mode = 0;
-@@ -2670,8 +2673,8 @@ FILE* fopen(const char *filename, const char *mode) {
- }
- 
- #ifdef HAVE_OPEN64
--
--FILE *fopen64(const char *filename, const char *mode) {
-+#undef fopen64
-+FILE *fopen64(const char *__restrict filename, const char *__restrict mode) {
- 
-     debug(DEBUG_LEVEL_VERBOSE, __FILE__": fopen64(%s)\n", filename?filename:"NULL");
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
similarity index 53%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
index 245302d2bc..36d92bcae9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
@@ -1,13 +1,11 @@
 require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
-           file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://volatiles.04_pulse \
-           file://0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch \
            "
-SRC_URI[md5sum] = "390de38231d5cdd6b43ada8939eb74f1"
-SRC_URI[sha256sum] = "f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e"
+SRC_URI[md5sum] = "c42f1f1465e8df9859d023dc184734bf"
+SRC_URI[sha256sum] = "809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055"
 
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
-- 
2.18.0



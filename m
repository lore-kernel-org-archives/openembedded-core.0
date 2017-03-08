Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id BEE8373111
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 15:52:42 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id g10so26303632wrg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=nVgWJ9XFchwBe/67skXipgTh7AwTPiKeBoAGrbicQA8=;
	b=q57x6gRiZvg7mcn5mSwyvm19+xgt2QmDPiQ7nlp50CWU7nnqgeirEb3SZtaIr4RNvx
	CgFk+Zz89ZQzYPh+6ddfUe3eBgedO9FmiIhr7BE/ViMM+/foymIo564yVlao62y4Nb+g
	AwtHEgxm4lw2XL82qA8E7MHBCN9Y3oufpI11b4znf+HHfK9+jnEKjhXGWMMuTimW041n
	SDSSyhGRnvlNuF8/CFQY48MpxHyh4a4n3OeafCf+4pQp0XiJrSOD4FRiBgJUoce0X/MS
	crjKG+iDlemWvPNXgzkGWPdpuD9ACk7xBjCQdg3zhf65IeWepV8JskpqFiqyOBGAzx3i
	nhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nVgWJ9XFchwBe/67skXipgTh7AwTPiKeBoAGrbicQA8=;
	b=KtxE2DY6rtzUPSvQGGXUf/HndC4Asei6jF4Jb2GslDdGzKGtmHUP4mwb8fVgyIOwLg
	ENKpqlilsODjIn7l/jZ5Vc/bvWOV8xp1Xe931Vry6rXVzVVqTaAkBualkGY0eTvlTZ5k
	ZGpTCbrdzaD7miF/NBsVZIpqHbFFmgS+WA6Vv1eGli8vd9iw4F6LEK8ZH5r3AHOn7xRn
	Tk36I4MJlT/F7tmikpkSaHYs9Ft5rmT0QCBNelsoe5gtR4RCWtoumOX7OzGzrdJQ5ejC
	T5+MhPmnq+8scXmT83KPhvfs8vlm8L8X9YqtmC3r/t7DhhEkGNECoM6EgKTknSrRn9Q7
	z7jg==
X-Gm-Message-State: AMke39k7Ylf4mBt91oyqZuwk0srFiXt6aQzm8S308NSJH15PBIcjl7KzLcSL2UGunqAJ6yIu
X-Received: by 10.223.160.115 with SMTP id l48mr6621889wrl.24.1488988362863;
	Wed, 08 Mar 2017 07:52:42 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o15sm23717340wmd.10.2017.03.08.07.52.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 07:52:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 15:52:38 +0000
Message-Id: <1488988358-2712-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gstreamer: remove git recipes
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
X-List-Received-Date: Wed, 08 Mar 2017 15:52:43 -0000

Yet again these were checking out 1.8.2 tags and then trying to apply 1.10.4
patches on top.

Clearly nobody is actually using them, so delete them so they can't go stale
again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gstreamer1.0-libav_git.bb            | 38 ------------------
 .../gstreamer/gstreamer1.0-omx_git.bb              | 25 ------------
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 46 ----------------------
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     | 32 ---------------
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     | 30 --------------
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     | 38 ------------------
 .../gstreamer/gstreamer1.0_git.bb                  | 25 ------------
 7 files changed, 234 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
deleted file mode 100644
index b6c0d7d..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require gstreamer1.0-libav.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE.md;md5=acda96fe91ccaabc9cd9d541806a0d37 \
-                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-# To build using the system libav/ffmpeg, append "libav" to PACKAGECONFIG
-# and remove the ffmpeg sources from SRC_URI below. However, first note the
-# warnings in gstreamer1.0-libav.inc
-SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-libav;branch=1.8;name=base \
-    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-    git://source.ffmpeg.org/ffmpeg;destsuffix=git/gst-libs/ext/libav;name=ffmpeg;branch=release/3.0 \
-    file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-    file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
-"
-
-PV = "1.8.2+git${SRCPV}"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV_base = "f285cf0fd799cc3b46b5cecaaa439d5a2a38a9b7"
-SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
-SRCREV_ffmpeg = "c66f4d1ae64dffaf456d05cbdade02054446f499"
-SRCREV_FORMAT = "base"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	${S}/autogen.sh --noconfigure
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
deleted file mode 100644
index 49593b6..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require gstreamer1.0-omx.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
-
-SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master;name=gst-omx \
-    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;branch=master;name=common \
-    file://0001-omx-fixed-type-error-in-printf-call.patch \
-"
-
-SRCREV_gst-omx = "a2db76b048db278ef0aa798e106b7594264e06c0"
-SRCREV_common = "5edcd857b2107cd8b78c16232dd10877513ec157"
-
-SRCREV_FORMAT = "gst-omx"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
deleted file mode 100644
index 79ebcac..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require gstreamer1.0-plugins-bad.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
-
-SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-bad;branch=1.8;name=base \
-    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-    file://configure-allow-to-disable-libssh2.patch \
-    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
-    file://avoid-including-sys-poll.h-directly.patch \
-    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
-    file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-"
-
-PV = "1.8.2+git${SRCPV}"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV_base = "5e73b5a4843d9675246f4efec158624475ed9586"
-SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
-SRCREV_FORMAT = "base"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	${S}/autogen.sh --noconfigure
-}
-
-# In 1.6.2, the "--enable-hls" configure option generated an installable package
-# called "gstreamer1.0-plugins-bad-fragmented". In 1.7.1 that HLS plugin package
-# has become "gstreamer1.0-plugins-bad-hls". See:
-# http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08
-
-PACKAGESPLITFUNCS_append = " handle_hls_rename "
-
-python handle_hls_rename () {
-    d.setVar('RPROVIDES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
-    d.setVar('RREPLACES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
-    d.setVar('RCONFLICTS_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
deleted file mode 100644
index 4d63827..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require gstreamer1.0-plugins-base.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
-
-SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-base;branch=1.8;name=base \
-    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-    file://get-caps-from-src-pad-when-query-caps.patch \
-    file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
-    file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
-    file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
-    file://make-gio_unix_2_0-dependency-configurable.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-"
-
-PV = "1.8.2+git${SRCPV}"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV_base = "70f3750773bf5dba4098f6d72d63aa6c84f1f539"
-SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
-SRCREV_FORMAT = "base"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	${S}/autogen.sh --noconfigure
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
deleted file mode 100644
index 04a313d..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require gstreamer1.0-plugins-good.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
-                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
-
-SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-good;branch=1.8;name=base \
-    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-    file://avoid-including-sys-poll.h-directly.patch \
-    file://ensure-valid-sentinel-for-gst_structure_get.patch \
-    file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-"
-
-PV = "1.8.2+git${SRCPV}"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV_base = "9f73b5818f98cd045e7049bb313da1c943635109"
-SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
-SRCREV_FORMAT = "base"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	${S}/autogen.sh --noconfigure
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
deleted file mode 100644
index 5b79234..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require gstreamer1.0-plugins-ugly.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
-
-SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly;branch=1.8;name=base \
-    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-"
-
-PV = "1.8.2+git${SRCPV}"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV_base = "79fe43c00925455a37fab6fc428e7f08655a9bbd"
-SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
-SRCREV_FORMAT = "base"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	${S}/autogen.sh --noconfigure
-}
-
-# In 1.7.2, the mpg123 plugin was moved from -bad to -ugly
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=08d8aefcdaaf89ecb6dd53ec1e4f95cd42d01664
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/commit/?id=43bd45ba991ef3247957ca37cdcb52f4b8c0acb1
-
-PACKAGESPLITFUNCS_append = " handle_mpg123_rename "
-
-python handle_mpg123_rename () {
-    d.setVar('RPROVIDES_gstreamer1.0-plugins-ugly-mpg123', 'gstreamer1.0-plugins-bad-mpg123')
-    d.setVar('RREPLACES_gstreamer1.0-plugins-ugly-mpg123', 'gstreamer1.0-plugins-bad-mpg123')
-    d.setVar('RCONFLICTS_gstreamer1.0-plugins-ugly-mpg123', 'gstreamer1.0-plugins-bad-mpg123')
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
deleted file mode 100644
index 39f38a1..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require gstreamer1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
-
-SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gstreamer;branch=1.8;name=base \
-    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-"
-
-PV = "1.8.2+git${SRCPV}"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV_base = "3de8a4f728a7194a12b784ec4085f6a8e7d9b5bd"
-SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
-SRCREV_FORMAT = "base"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	${S}/autogen.sh --noconfigure
-}
-- 
2.8.1



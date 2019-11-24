Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2537FCC8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:08 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id o8so1244334pls.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=I/YF10EMHUj8TcZjRdf/iudwHhoCZBhRMb2zVDUCwDo=;
	b=etQqzf96wfauTOZm1zXq0a4PmJw444HlCp+5raTXSl/o086kza4Dop9bP8vsNijnCF
	e6vapAzPgmvQXFnWHBpi9FM+AT8KrQjgLP76TjGln69F2Qn17ZZ5X4Uh7dqPWwWq8X8q
	9FS5iq1/X3OmObN2qk4AEWxK+DYHc8FhUJ36q+C0j7PQihz4ZdPD6iL2VDkPP5P4KCMp
	jTRDJ+s8/d9egkW8z9sPDiIyKNWI8LBfhe4z9AvKiDnFTBLDoRS9pJlRANxuU+SOInUq
	7fb25revwctfrzO86JuvybZwYzEDlMJhY5VNqhdMlXXZNBhZ7XEUChietskQcOOsRaX4
	XRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=I/YF10EMHUj8TcZjRdf/iudwHhoCZBhRMb2zVDUCwDo=;
	b=t/bSA12a6MueMFkvGXus6dZqtApS7mNpH1vW0JABCe4lSRz+ojPAqr9/6biJlJ1fc4
	Lbp/Zi/dD77G4U107NB0u88ZMK3mLdkISKun3X+Zf2D0fQTM8BRPXOOLG91xXsZuoJ6i
	O5rwrNeAG4echvK8rgKadm7WKenMPMVX6tiwrNibEU3gR2b3UqGIi2XbQ5PtPH2lhVDp
	VE8K+NrBR97h485hauQptoEStNEqo/Xwowp2rvS1xAgPDnetUxm5W4FHUTXqXcKld/kF
	l+KpFJHAIVzOjAgnsz8Pj/vYQCcp9rJ0pYU5KhyEEtXdDJObCBrZD6wFKR/qZ/iha59F
	XhTQ==
X-Gm-Message-State: APjAAAVMbobhUbaq/T4KTOECmrKsAfs+3EpGF9xWINrSeBF6uJV4cYvB
	pZfrnvFN0zGzGifGag7mKyToZkgo
X-Google-Smtp-Source: APXvYqwfG+j3pdEO+GcOksYmpmnWZOwratpyg2nLr7Zfat7iBM5cIHQ/M9dRUDhcK2rxDULK9t+wsA==
X-Received: by 2002:a17:90b:3007:: with SMTP id
	hg7mr36083481pjb.73.1574639469254; 
	Sun, 24 Nov 2019 15:51:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:32 -0800
Message-Id: <ddae232af4ca5911fa4e23da8522f0de374e4c51.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 27/35] gstreamer: Change SRC_URI to use HTTPS access instead of HTTP
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:08 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Some GStreamer recipes like gstreamer1.0-vaapi already use HTTPS instead
of http. Also, access to http:// is simply redirected by the freedesktop
server to https://, and using HTTPS is anyway generally recommended over
plain HTTP for security reasons. So, normalize the URLs to use HTTPS only.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb        | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb          | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb       | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb              | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
index d3918cf..10955ff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
            file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
            file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
            file://mips64_cpu_detection.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index 4c6c839..cb2f704 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -7,7 +7,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "89772e7a277fd0abfc250eaf8e4e9ce9"
 SRC_URI[sha256sum] = "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42ab24bb2"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index 4330c79..1731be8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins.inc
 
 SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+    https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
     file://configure-allow-to-disable-libssh2.patch \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
index 9df67e7..cb99fba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
 SRC_URI = " \
-            http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
+            https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://make-gio_unix_2_0-dependency-configurable.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
index 21d2b2b..0fa7b86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins.inc
 
 SRC_URI = " \
-            http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
+            https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
index de677c0..ecab318 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
-            http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
+            https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index 52ed150..5a950f1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
 SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
index ca360bc..45302ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
            file://gtk-doc-tweaks.patch \
            "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index d77c8aa..ff92f63 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 S = "${WORKDIR}/gstreamer-${PV}"
 
 SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+    https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
-- 
2.7.4



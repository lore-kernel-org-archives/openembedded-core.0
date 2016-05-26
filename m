Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 727A6731F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 19:13:31 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id z87so111050371wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=U2mjxuyNcdrD938YyvK3zH4Sxt2s9zASzRTPM5andh8=;
	b=iix2RTycJLDwa6qPbONyYQVTRyThnkcnvao/rfQoOSZPuOrtX2eUnRIA4kOwhPHElf
	mc5MwQ0xcH3iZ/VQ69bO+EBBh9sMJ+vQprakJfY4qvZPvFyG12qPfDEEtSy2RwZRS9oo
	7LWYk+3mKQMA55qGeHfoNfSS8r3T4/dudWtJ0Z53wulsG31vJgYkeQtkaQSy0G1+gj5Q
	+qmfS4xBpIj6CwecXP3p7SD7m++GRzeoIEVUqbFk+zY2H6s868abP5U47oRUr2gHcaSu
	MSqsXINGSGZqEB5U9yodepKty8XbQ59aVIjFzOwfMX3Pf7pPNiP96OtYPfm2XruoHgpf
	VuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=U2mjxuyNcdrD938YyvK3zH4Sxt2s9zASzRTPM5andh8=;
	b=Cpk9BIWaPK+2ORAbQWoDIAZzUzGT9+B6fIi6cfrAK1iA9oOtkWtF7seNdyRCwMQHir
	FcTn1bAqlegDIc7QZpqy4CFzepN31+/rRBIRQk08Br1yMO6tWEUxmk2EX+g6ifBH1Hls
	zLjfdbwyQfpMq97Dw1JMRzqtRxuUGlb/gXKIpl3foLTD1K9qawr+xfgY5sONgU5F0pQj
	fvFqehT3In2Irg0t2HlbUPemZyWLFara0VU7jXQ+W++lXLptfK0F8pvjc3gqPnQFChO6
	r2iXLChXh76+m8393RrCYejSTh67QNuE2ThWTGVW+8JIVwjpVsOCR6kV3/sjpS9a71km
	iVuA==
X-Gm-Message-State: ALyK8tJXlR+VrHXScszScB0AQv8EAtObqHzbwMHYVdbyYqOdLQ9+GJOAj4++o+8EaokQOuMn
X-Received: by 10.194.174.71 with SMTP id bq7mr12253618wjc.64.1464290011285;
	Thu, 26 May 2016 12:13:31 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i1sm15727790wjm.12.2016.05.26.12.13.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 May 2016 12:13:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 20:13:25 +0100
Message-Id: <1464290005-6724-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1464290005-6724-1-git-send-email-ross.burton@intel.com>
References: <1464290005-6724-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] xcb-proto: remove stale git recipe and now redundant .inc
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
X-List-Received-Date: Thu, 26 May 2016 19:13:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto.inc     | 26 ----------------------
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 25 +++++++++++++++++++--
 meta/recipes-graphics/xorg-proto/xcb-proto_git.bb  |  9 --------
 3 files changed, 23 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto.inc
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto_git.bb

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto.inc b/meta/recipes-graphics/xorg-proto/xcb-proto.inc
deleted file mode 100644
index 8703d63..0000000
--- a/meta/recipes-graphics/xorg-proto/xcb-proto.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "XCB: The X protocol C binding headers"
-DESCRIPTION = "Function prototypes for the X protocol C-language Binding \
-(XCB).  XCB is a replacement for Xlib featuring a small footprint, \
-latency hiding, direct access to the protocol, improved threading \
-support, and extensibility."
-HOMEPAGE = "http://xcb.freedesktop.org"
-BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
-
-SECTION = "x11/libs"
-LICENSE = "MIT-X"
-
-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
-           file://no-python-native.patch"
-
-inherit autotools pkgconfig
-
-PACKAGES += "python-xcbgen"
-
-FILES_${PN} = ""
-FILES_${PN}-dev += "${datadir}/xcb/*.xml ${datadir}/xcb/*.xsd"
-FILES_python-xcbgen = "${libdir}/xcb-proto"
-
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index 23166a9..8bdca32 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -1,9 +1,30 @@
-include xcb-proto.inc
+SUMMARY = "XCB: The X protocol C binding headers"
+DESCRIPTION = "Function prototypes for the X protocol C-language Binding \
+(XCB).  XCB is a replacement for Xlib featuring a small footprint, \
+latency hiding, direct access to the protocol, improved threading \
+support, and extensibility."
+HOMEPAGE = "http://xcb.freedesktop.org"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 
+SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-
+SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
+           file://no-python-native.patch"
 SRC_URI[md5sum] = "14e60919f859560f28426a685a555962"
 SRC_URI[sha256sum] = "5922aba4c664ab7899a29d92ea91a87aa4c1fc7eb5ee550325c3216c480a4906"
+
+inherit autotools pkgconfig
+
+PACKAGES += "python-xcbgen"
+
+FILES_${PN} = ""
+FILES_${PN}-dev += "${datadir}/xcb/*.xml ${datadir}/xcb/*.xsd"
+FILES_python-xcbgen = "${libdir}/xcb-proto"
+
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_git.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_git.bb
deleted file mode 100644
index 2ea4d04..0000000
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_git.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-include xcb-proto.inc
-SRCREV = "d81ca233e98be8fa59e8c90d262c0516944c5a66"
-PV = "1.2+gitr${SRCPV}"
-PR = "r4"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xcb/proto"
-S = "${WORKDIR}/git"
-- 
2.8.0.rc3



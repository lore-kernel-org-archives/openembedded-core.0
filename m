Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 15 Dec 2019 12:54:32 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	by mail.openembedded.org (Postfix) with ESMTP id A869A7F7C8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:54:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47bPP31bZ5zKmfB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1576414165; bh=k7M+7yBfSjz/8Bf
	iSZ65pI4njJbOwfrUxBFvEZvi4a4=; b=Z2PraXJvi4Y25FX4izfMMCWA3nBc1Cs
	vRgpWJfSATTWJgIaGdRWsDUGmxrCxwb1gKyJK1EiC7B9xw7odH6Cb+ew/wyVHcCL
	NMgsb1thYX+GmRXZLC3ZWc5fq/BJZCQMqIFRoyDY0DX2Ylq4G0qO1Zk5fhhRhI3k
	wx3BZrMElV3cMpEi4khg0UPS6RMYvSbtU1peQgUZtBYww0CXCAynq5ETOH76HZlO
	ligTeDHpdhKAPdQWUDoRwMcy8CLRJdXJJeOXlj4eLNByZJyBo9XucBhxN+BaJyIK
	EYFbfXvtU2zq6NEV2xe7LNyUtcxHAoXEsuxfgCRs7vf0cQs/PqVlcTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576414167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=RClakvN07f8wLfVbqkZQWxtSB+WQhXic5ABMmGlqieM=;
	b=jq7OTh6q03jkgYvXWYDXLkxKkZRZDx68zq9nFIyB4KFazQ4S8+FOowcL6BKx1grUoQsGbg
	dpTKYAZ5F6BHIcYYXSvo1Xfcb7cscq+h2sBWeEiz+taPtxiouhzIS2T25XmOVi/N4ejDpW
	GQEyUQoeVbyxLxXRE77VJ9MeuE8xSGTtpvbrgCGVgOEE4vmXoQxd2AlWayBzhBz5VB3SIn
	UACykL1IMsXrRJX05eE0ENWLaO9B027j3siP9VOQvKDVTTe69O76wKq3jrsKd+E4cEL9Zo
	KUuhCBUJhZRVgCjc2iMlykBLpcn9rv9oSCsiWIR16DL6xu33IsTYU32xfcyT0w==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id 3KB1bca3G82h
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:25 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 13:49:04 +0100
Message-Id: <20191215124910.24946-6-crg7475@mailbox.org>
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
References: <20191215124910.24946-1-crg7475@mailbox.org>
Subject: [WIP][PATCH 06/12] gstreamer1.0-plugins-ugly: Transition to meson based builds
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
X-List-Received-Date: Sun, 15 Dec 2019 12:54:33 -0000

* Removed autotools/M4 related patch
  0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch.

* gettext handling now part of gstreamer1.0-plugins-common.inc.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer1.0-plugins-ugly_1.16.1.bb       | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
index ecab318899..30961d0e02 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
@@ -1,4 +1,4 @@
-require gstreamer1.0-plugins.inc
+require gstreamer1.0-plugins-common.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
@@ -8,7 +8,6 @@ LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
-            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
 SRC_URI[sha256sum] = "4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc850c5fa425968a1d"
@@ -17,23 +16,23 @@ S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gettext
+GST_PLUGIN_SET_HAS_EXAMPLES = "0"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     a52dec mpeg2dec \
 "
 
-PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
-PACKAGECONFIG[amrnb]    = "--enable-amrnb,--disable-amrnb,opencore-amr"
-PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
-PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
-PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
-PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
-PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
+PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
+PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
+PACKAGECONFIG[amrwb]    = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
+PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
+PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
+PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
+PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
-EXTRA_OECONF += " \
-    --disable-sidplay \
+EXTRA_OEMESON += " \
+    -Dsidplay=disabled \
 "
 
 FILES_${PN}-amrnb += "${datadir}/gstreamer-1.0/presets/GstAmrnbEnc.prs"
-- 
2.17.1



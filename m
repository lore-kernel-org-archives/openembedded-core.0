Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 30F477FCAE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e17so6124200pgd.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3DLKwCIa7vgxFVVzRqmVfoggzB+OtUtBqH12sUxb5J4=;
	b=OxndGgftMljXuEni3nlEITBjMtUtnDD1Bu8MAmiO9Dat1bTsp4nu9U6gs19WPb1phA
	8cLmH+2OEiDl0Qq5ClLooZqGs3bHaExPTDFgv2u5C6h6/cEkp/STMnBkBBZcF/U0nYGh
	V+oeyPweNulRxE/fEg8PKE5Kl0698MhRcL08wSqjaLmg9uuTVlNUSZjPf08BEUfs3Snb
	RYglBVZOvro5gvdYQKfraIQjClMmuYMzinPjPJhDBkVYBOU5wEBjgVhhifXj19MrBDrp
	3fCPFYaLQMIzO6/A8bWAyms2miAMxG17gcZLXsiPddWR1GEqNR6iZvm77WU6piniqIjN
	pxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3DLKwCIa7vgxFVVzRqmVfoggzB+OtUtBqH12sUxb5J4=;
	b=gn5e80o8DGmLRIpJsecpKbGYbesv4IISa988hKITZSI0Sa3oXJjmez9ztvO41CaQvh
	fmink7MaYOI8K2pPiNpIQOni+gQ8zIaPeoTvW0eKW3md72xSV/3C4pUtQct/DYSXrZxa
	L9RTPQDMHFhFp/MJpeD+b+LkGUUFSlnEH2NGMTGKs4St2vpGQuJ7VzvQDhaanX2ZA+9W
	AJC+tyVsEAfNTCT/MtD8bKHdRWnbEKKYkspqIqsSg42w1fFBgnx0hDfBhxdkX2DSgKGx
	/9wauQa/sisAAsgg5fyhRNseDXY8/JgtPKdlg/UZFHznOLCWyM73k4G9sToqa+zMpfnb
	+oAw==
X-Gm-Message-State: APjAAAUiKrvSx66FQQEaBxILRBfx7DbBwbd9GEWmrQk/rPd0EWksZPrm
	4t0jGHsw7HN+m4kAP8OK9GgQFgQk
X-Google-Smtp-Source: APXvYqx/4mDcMNSyB1fPrXEz04Yw0mx0b/lirbJ4zvV/tSY5Wvc2XIfCWpADrCzPkksCCkKU4ijaPQ==
X-Received: by 2002:a63:5920:: with SMTP id n32mr12514562pgb.359.1574639464131;
	Sun, 24 Nov 2019 15:51:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:26 -0800
Message-Id: <2a2f55e5a31e6d877283d41f80c0b08eeee82763.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 21/35] gstreamer1.0-libav: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:03 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Removed gtkdoc-no-tree.patch since its changes are now included in 1.16.1

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gstreamer1.0-libav/gtkdoc-no-tree.patch        | 35 ----------------------
 ...ibav_1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.0.bb => gstreamer1.0-libav_1.16.1.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
deleted file mode 100644
index a36fdc9..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 6f720cebe632d7dc187c6907857d67ce1f7313d6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 9 Sep 2019 22:48:49 +0100
-Subject: [PATCH] docs: don't include the type hierarchy
-
-gtk-doc can't generate a type hierarchy when scanning gst-libav, and gtk-doc
-1.30 onwards doesn't write a file if there is no type hierarchy (unlike previous
-releases, which wrote an empty file).  This results in the build failing with
-gtk-doc 1.30 onwards, so remove the type hierarchy section from the
-documentation as it doesn't serve any purpose.
-
-Fixes https://gitlab.freedesktop.org/gstreamer/gst-libav/issues/57
----
- docs/plugins/gst-libav-plugins-docs.sgml | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/docs/plugins/gst-libav-plugins-docs.sgml b/docs/plugins/gst-libav-plugins-docs.sgml
-index 75c68f4..f68d554 100644
---- a/docs/plugins/gst-libav-plugins-docs.sgml
-+++ b/docs/plugins/gst-libav-plugins-docs.sgml
-@@ -32,9 +32,4 @@
-     <title>gst-libav Plugins</title>
-     <xi:include href="xml/plugin-libav.xml" />
-   </chapter>
--
--  <chapter>
--    <title>Object Hierarchy</title>
--    <xi:include href="xml/tree_index.sgml" />
--  </chapter>
- </book>
--- 
-2.22.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
index d2629b5..d3918cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
@@ -18,10 +18,9 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
-           file://gtkdoc-no-tree.patch \
            "
-SRC_URI[md5sum] = "e3a201a45985ddc1327cd496046ca818"
-SRC_URI[sha256sum] = "dfac119043a9cfdcacd7acde77f674ab172cf2537b5812be52f49e9cddc53d9a"
+SRC_URI[md5sum] = "58023f4c71bbd711061e350fcd76c09d"
+SRC_URI[sha256sum] = "e8a5748ae9a4a7be9696512182ea9ffa6efe0be9b7976916548e9d4381ca61c4"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.7.4



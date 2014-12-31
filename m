Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id E6DB3601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 11:33:49 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id u56so2263710wes.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 03:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VVZaT01CF+JeTces+v5zmu4QfTqi9E52/L9++1mw9t4=;
	b=LF0qzctOfNnoWw7JhmlqPvPbV48pD+UMYoZfJfb6cVSXwbWzhud38y5SNpAi6RXKvS
	h0Aqozx0LwJc7i8SbMiO7l2xjald+29EknkMLoAoW7ZyZddBonR2HCWOPW5z8tWnPxnV
	u4KNDVgR23ffvoBnXuj9N02AOu4ppoAHzN6bA8/Bc44FsiqWhzjHJtvzlyLsEGS2Q4g7
	RdYlLq1IbHc6FvXFsea1x7sMpOOtUYviZHrw+GT1cbCyZ+M9lAxdQo2iKuAogRCdXMEZ
	NwYdc4u9c9eqVYvn5yC4zftR3Z1EFMXjJz6cOx9QtxnN2kgj74Y/XDx7kFKB0E+jiID0
	6xsQ==
X-Gm-Message-State: ALoCoQmfSffgty/IuPbuXsrryg2NjppEHYNZghxjHraellMv1TEXFT9fMo2dHzSg7O0bskI7hFJR
X-Received: by 10.180.87.36 with SMTP id u4mr112449299wiz.20.1420025629549;
	Wed, 31 Dec 2014 03:33:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	fo12sm46768360wic.19.2014.12.31.03.33.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Dec 2014 03:33:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Dec 2014 11:32:44 +0000
Message-Id: <1420025564-30061-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gst-fluendo-mp3: upgrade to 0.10.31
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
X-List-Received-Date: Wed, 31 Dec 2014 11:33:54 -0000

This version supports both GStreamer 0.10 and 1.0, but for now only build 0.10
for consistency with previous recipies.

Add a missing build dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{gst-fluendo-mp3_0.10.19.bb => gst-fluendo-mp3_0.10.31.bb}   |    6 +++---
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc                |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.19.bb => gst-fluendo-mp3_0.10.31.bb} (57%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb
similarity index 57%
rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb
index 9e68288..1e2cd2a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=259a43dd1c9854b71fc396f74699f4d2"
 LICENSE_FLAGS = "commercial"
 
 GSTREAMER_DEBUG ?= "--disable-debug"
-EXTRA_OECONF += "${GSTREAMER_DEBUG}"
+EXTRA_OECONF += "${GSTREAMER_DEBUG} --with-gstreamer-api=0.10"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-SRC_URI[md5sum] = "5d95a9a216dd15bc5c00c9414061115c"
-SRC_URI[sha256sum] = "30c79d24d8926f75dd4ef0f572942ce155ad541734b36a95591b9c0524dcc0f3"
+SRC_URI[md5sum] = "adf0390f3416bb72f91c358528be0c38"
+SRC_URI[sha256sum] = "dae0d0559a4e159c0dd92b7e18de059a5783f8d038904c7de4ca6393f7d55c7d"
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
index feaf1c7..3cbb465 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Fluendo closed-format GStreamer plug-in"
 SECTION = "multimedia"
 HOMEPAGE = "http://www.fluendo.com/resources/source-plugins.php"
-DEPENDS = "gstreamer zlib"
+DEPENDS = "gstreamer gst-plugins-base zlib"
 
 inherit autotools pkgconfig
 
-- 
1.7.10.4



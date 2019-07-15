Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 590A17D718
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 11:04:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l2so14736653wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3+q4JEa0VEAnKdAA68NJs6k8wOKtmqP6L7BnQfch3Ak=;
	b=MfTRwhEnGvi4gR3nBi0Qf6OaMpyAwfpPFHqGg3V/JeZvwM57GoCRFAm1oGwY2GaGOY
	EFwcRcPKgxKIyea2DLc42NwO7ukfEZJ/pywzfcJWxG2S6pT3d+e/Wd3Q9bMvG4gwn5oy
	hWhfPedUX8D53CKn9KKJvbwxQ9rRWN6yo6SPgkrOf95q5zhUol/5lVGP3nHr4UYaec1x
	YAoLRMqaDl9C7CQUjGh0VkzsChxP3yK6nemeSR3fP7ZfN3kMOn8zDfOgoTch/OgiPmdT
	vhLeegqjJf+iyJIpeLQq+xHf/M/08x54bZi5ehI7nyJlCN2zJfU5IujseqKJloL92KXD
	acyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3+q4JEa0VEAnKdAA68NJs6k8wOKtmqP6L7BnQfch3Ak=;
	b=B+ZvXqKLfdNC2qLEtvfBVFh72F4Iee7WE+0lMAYIrjUy1enOz2rJ/uttPB5oZejPqx
	J/Ucv3Q+vIhDPbnb1mpzNleiIBzuk8mmSkYptEfJrLCdE8QpCtjRC0CYJOjHldRdEbY4
	rh9D7BSuVslcwmTiWRwsCwsvME5l7Nbu/pkh7sh1nicydOju18h8IDCLX+BEMteO2oUI
	Giszz3WHngH29RPEscogmIHD92cZrDCJ6tl0KAMkf0dNxBDCTTqO1Apg0i3pONYTfWrp
	Z8vk+8BGsBQY1OocFOl382cIZn98fOcJuc75+aXAafmOILzEsQET3XFcLC5E1XnGWnMl
	wQ2Q==
X-Gm-Message-State: APjAAAVdB5ADsMDWih6IlSIXdGXdzAuaZoGuwcGujwuyjjd318EKpTHF
	uD+BqoVd8+6CguSMYfhNP9LIDneOzoQ=
X-Google-Smtp-Source: APXvYqwYHeeOhJqkpQewjfqCRkh8lEiddB4YI/lr05Fb7Ek7zZ1hT/LO83kBlE2MLif5VRjwHnD/Ow==
X-Received: by 2002:a1c:7e90:: with SMTP id
	z138mr23443713wmc.128.1563188659784; 
	Mon, 15 Jul 2019 04:04:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm13495486wrx.39.2019.07.15.04.04.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Jul 2019 04:04:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 12:04:11 +0100
Message-Id: <20190715110413.30525-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] tiff: remove redundant patch
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
X-List-Received-Date: Mon, 15 Jul 2019 11:04:19 -0000
Content-Transfer-Encoding: 8bit

The patching to make the new libtool work (from 2008) is no longer needed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libtiff/files/libtool2.patch              | 24 -------------------
 .../recipes-multimedia/libtiff/tiff_4.0.10.bb |  5 +---
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/libtool2.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtool2.patch b/meta/recipes-multimedia/libtiff/files/libtool2.patch
deleted file mode 100644
index 96233b46c94..00000000000
--- a/meta/recipes-multimedia/libtiff/files/libtool2.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 5b893206e0a0d529ba2d0caf58cfffc03bccb598 Mon Sep 17 00:00:00 2001
-From: Marcin Juszkiewicz <hrw@openedhand.com>
-Date: Sat, 14 Jun 2008 13:42:22 +0000
-Subject: [PATCH] tiff: make it work after libtool upgrade
-
-Upstream-Status: Inappropriate [configuration]
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c7b02e2..ae1c964 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,7 +27,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_PREREQ(2.64)
- AC_INIT([LibTIFF Software],[4.0.10],[tiff@lists.maptools.org],[tiff])
- AC_CONFIG_AUX_DIR(config)
--AC_CONFIG_MACRO_DIR(m4)
-+dnl AC_CONFIG_MACRO_DIR(m4)
- AC_LANG(C)
- 
- dnl Compute the canonical host (run-time) system type variable
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 152fa819a5b..7a30690ec17 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -4,10 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://libtool2.patch \
-           "
-
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
-- 
2.20.1



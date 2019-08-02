Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF187D25F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x4so25261462wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5P8h/mXX7ooqN5jlfbnt7JM5t7QF1Pw67m4BbIlOJj8=;
	b=phAp5dImtfo10eJOfa9zSnEVHH0LC2VxK/ELIWdCfsxqzKYBVp9aYG9H9SYWGd5II+
	SIW1Pq72Zewxq3mvWOY5wVOoKUpuWsvj3QlRLQNalULxxxAxJ5a3T26IBBgRjVbK/ACH
	qjE082AcVHv5mqevH8RcGn0Hg9mrTKgkCjFiHaMvxB1W8eDWCsIlL2oGhW1VZXjZSztb
	HCKkFFnN0UEvrSFLdDylPV+Q+RuzndHNtQ02lgUqrMTz+cuPztX0RtabjgiclNDLy4/8
	qbbzJbZxxl6QaT0dvDYTymEvfGnhbws4ipfC0AORKM4K4tqMrRmMjSrdr0vzvBBpZG+m
	IW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5P8h/mXX7ooqN5jlfbnt7JM5t7QF1Pw67m4BbIlOJj8=;
	b=Bo4quewb2UVx/QoJqjtejY4ajKm91QdVW4HIpwxZf3y8wdqkUMxiU4JAatPtTOcLFd
	n+Tg9KaPXgoSH86Y8ndBmKKxqqJdZ9/m977mdbZPGEo4yVSyMtYI98DkKGgD30bzr0mG
	pS4Jmfnsc/D2FFLsqJ7WW0CcPuogTGN7Cy275mGQVDBMATLhstp6pocAQo6eubK30vW+
	USvZCPtPylTNMNATDw1FcG4Axmn3/hGogHw0Q3YUYPDaly6PBd6cyohGb3KcCtSViyu3
	O5zNORfkjqioIDQSVAexsiRHPNkUj/JqvIZW4Fc0AJBYQNMHUrYuo+69E+KVh0b1XzhP
	xbjA==
X-Gm-Message-State: APjAAAUIMPVYR1OfPDn7SOkUFKU+0BLIpfs2g5sYLt77AojL3Pphmx7y
	1fe7yshxmzJkcZY8XanCSYaazB3BDH0=
X-Google-Smtp-Source: APXvYqxcVe1PmnZETECJS+vxGldmdsf7P3y3iu6+3IPvQ0BN7AsX365yJbPYsLH7/DkCtIvcVhdXWg==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr100021614wrm.230.1564778243514;
	Fri, 02 Aug 2019 13:37:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:11 +0100
Message-Id: <20190802203719.20437-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/9] libxx86misc: remove this now redundant library
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:24 -0000
Content-Transfer-Encoding: 8bit

The extension this client library is for was removed from the X server over a
decade ago:

commit 22e64108ec63ba77779891f8df237913ef9ca731
Author: Daniel Stone <daniel@fooishbar.org>
Date:   Wed Jul 16 06:25:26 2008 +0300

    XFree86: Remove XFree86-Misc extension

    Its last remaining purpose in life has been destroyed by input
    properties.  Au revoir: it's been fun, by which I mean awful.

Remove the obsolete dependencies from xset and xdpyinfo, and delete libxx86misc
entirely.

Signed-off-by: Ross Burton <ross.burton@intel.com>
enter the commit message for your changes. Lines starting
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../xorg-app/xdpyinfo_1.3.2.bb                |  2 +-
 meta/recipes-graphics/xorg-app/xset_1.2.4.bb  |  2 +-
 .../xorg-lib/libxxf86misc_1.0.4.bb            | 19 -------------------
 5 files changed, 2 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.4.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index b0656953eb3..ab6ebdb899a 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -195,7 +195,6 @@ DISTRO_PN_ALIAS_pn-libxft = "Mandriva=libxft Debian=libxft2 Ubuntu=libxft2"
 DISTRO_PN_ALIAS_pn-libxi = "Ubuntu=libxi Fedora=libXi"
 DISTRO_PN_ALIAS_pn-libxkbcommon = "Fedora=libxkbcommon Debian=libxkbcommon"
 DISTRO_PN_ALIAS_pn-libxscrnsaver = "Fedora=libXScrnSaver Ubuntu=libxss1 Mandriva=libxscrnsaver"
-DISTRO_PN_ALIAS_pn-libxxf86misc = "Mandriva=libxxf86misc Fedora=libXxf86misc"
 DISTRO_PN_ALIAS_pn-linux-dummy = "Intel"
 DISTRO_PN_ALIAS_pn-linux-firmware = "Fedora=linux-firmware Ubuntu=linux-firmware"
 DISTRO_PN_ALIAS_pn-linux-libc-headers = "Debian=linux-kernel-headers Ubuntu=linux-kernel-headers"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 77af8b6dad8..0bb4a57248f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -443,7 +443,6 @@ RECIPE_MAINTAINER_pn-libxtst = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxv = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxvmc = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxxf86dga = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libxxf86misc = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxxf86vm = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libyaml = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-lighttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
index af04bb6e3ab..a09e220f9d0 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
@@ -9,7 +9,7 @@ clients and the server, and the different types of screens and visuals \
 that are available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
-DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxau libxcomposite"
+DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxi libxrender libxinerama libdmx libxau libxcomposite"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.4.bb b/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
index 5748837fd5b..e21120e7886 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
@@ -7,7 +7,7 @@ preference options of the display."
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bea81cc9827cdf1af0e12c2b8228cf8d"
-DEPENDS += "libxext libxxf86misc libxmu libxau"
+DEPENDS += "libxext libxmu libxau"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.4.bb b/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.4.bb
deleted file mode 100644
index 45b0673e732..00000000000
--- a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.4.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "XFree86-Misc: XFree86 miscellaneous extension library"
-
-DESCRIPTION = "The XFree86-Misc extension, provides a means to access \
-input device configuration settings specific to the XFree86/Xorg DDX."
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27c91ecc435bd3d2bfad868914c94b45"
-
-DEPENDS += "libxext"
-PROVIDES = "xxf86misc"
-
-PE = "1"
-
-XORG_PN = "libXxf86misc"
-
-SRC_URI[md5sum] = "37ad70f8b53b94b550f9290be97fbe2d"
-SRC_URI[sha256sum] = "a89c03e2b0f16239d67a2031b9003f31b5a686106bbdb3c797fb88ae472af380"
-- 
2.20.1



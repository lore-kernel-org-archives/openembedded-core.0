Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 35FCD72CD5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 06:52:36 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y13so17060349pdi.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 22:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nZQ1W72aK1EnInTYWNB44ffrn23xuswb3s5VUfA/SIo=;
	b=CX/XzC6ZW+miXT+txEu2nnz9rbXu8ghGwB6FLWYC7KhUDeqigAsogLBiyK6bpktmDU
	Wbo1uAiYM4mJwazM/l0IcUml12GBrLCNcZag/Pyi3Qqw14nGvLxhdnoBYj+sltVkx2Bn
	waiBeJgRBm2rcWBucWNb6BNxkqBfAVoFR7XOBQJiihYPOzFl/wuv0EgOtTsv3QaVGIbZ
	vknlijneNRO8ZCVY8gducK+HHUsBTv9jjlcHyyUYMjBC2LrOCx/CG054DZdo2YxD3dYN
	WSBggjb59eJf67NKkgwTySRT8foiBmEdOTvtZDABFIllWu1KtJIHIIeIvsdpcvctETQy
	Msmw==
X-Received: by 10.66.62.138 with SMTP id y10mr33046316par.51.1422341557711;
	Mon, 26 Jan 2015 22:52:37 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id mz7sm533112pdb.3.2015.01.26.22.52.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jan 2015 22:52:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2015 22:56:13 -0800
Message-Id: <1422341773-12634-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
References: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/5] libpng: Upgrade to 1.6.16
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
X-List-Received-Date: Tue, 27 Jan 2015 06:52:40 -0000

License checksum changed because of date change like below

-libpng versions 1.2.6, August 15, 2004, through 1.6.13, August 21, 2014, are
+libpng versions 1.2.6, August 15, 2004, through 1.6.16, December 22, 2014, are

Change-Id: I7a2a950ef06c0bd8950a65b273bde5c214e6d3c7
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libpng/{libpng_1.6.13.bb => libpng_1.6.16.bb}              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.13.bb => libpng_1.6.16.bb} (62%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.16.bb
similarity index 62%
rename from meta/recipes-multimedia/libpng/libpng_1.6.13.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.16.bb
index 2c6260a..a8677e8 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.16.bb
@@ -2,17 +2,17 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=46401ee4b225b9ec066cb96cf1025c0f \
-                    file://png.h;endline=15;md5=8167a17735fc618d1df109f8b0f839a6 \
-                    file://png.h;beginline=229;endline=343;md5=5cdf8564a14e2f00339e4437a83b4913"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76dbddb73e547d9b3fa16909a98049c0 \
+                    file://png.h;endline=15;md5=fd8f7ae7b090a168a9e023d0a5d68a3e \
+                    file://png.h;beginline=229;endline=343;md5=44075eedf4763ada355d8f60ac3296c9"
 DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "9822c25466f060142359f80ed142c9e5"
-SRC_URI[sha256sum] = "d9c8ce54a5fc8052ed794ca65b553384a74c0608b09ae163cbbb07176018e625"
+SRC_URI[md5sum] = "23b7286b5d4a86de950fd2ffc5cac742"
+SRC_URI[sha256sum] = "42f754df633e4e700544e5913cbe2fd4928bbfccdc07708a5cf84e59827fbe60"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.1.1



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14B6F6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9UELC028456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:30:07 -0700
Message-ID: <97c7705a5eff42a673b1f6c991732d4e253328f0.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/15] tiff: remove extra dev and dbg from PACKAGES
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:13 -0000
Content-Type: text/plain

There should be only one dev and dbg package

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index b7d1129..62e6256 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -43,12 +43,8 @@ PACKAGECONFIG[check-ycbcr-subsampling] = "--enable-check-ycbcr-subsampling,--dis
 # in chunks when using TIFFReadScanline. Experimental 4.0+ feature
 PACKAGECONFIG[chunky-strip-read] = "--enable-chunky-strip-read,--disable-chunky-strip-read,,"
 
-PACKAGES =+ "tiffxx tiffxx-dbg tiffxx-dev tiffxx-staticdev tiff-utils tiff-utils-dbg"
+PACKAGES =+ "tiffxx tiff-utils"
 FILES_tiffxx = "${libdir}/libtiffxx.so.*"
-FILES_tiffxx-dev = "${libdir}/libtiffxx.so ${libdir}/libtiffxx.la"
-FILES_tiffxx-staticdev = "${libdir}/libtiffxx.a"
-FILES_tiffxx-dbg += "${libdir}/.debug/libtiffxx.so*"
 FILES_tiff-utils = "${bindir}/*"
-FILES_tiff-utils-dbg += "${bindir}/.debug/"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A490773199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:05:35 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u6DL5Zwh001804 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 16:05:35 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016071316053569-821037 ;
	Wed, 13 Jul 2016 16:05:35 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 16:05:34 -0500
Message-Id: <1468443934-22202-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/13/2016 04:05:35 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/13/2016 04:05:35 PM,
	Serialize complete at 07/13/2016 04:05:35 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-07-13_11:, , signatures=0
Subject: [PATCH] opkg: upgrade to v0.3.3
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
X-List-Received-Date: Wed, 13 Jul 2016 21:05:35 -0000

Bug fix release to address two regressions:

*  Fix build breakage when using configure option --enable-sha256
*  Do not remove packages if removal operation is not valid due to
   installed dependents

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-devtools/opkg/{opkg_0.3.2.bb => opkg_0.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.3.2.bb => opkg_0.3.3.bb} (94%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.3.2.bb b/meta/recipes-devtools/opkg/opkg_0.3.3.bb
similarity index 94%
rename from meta/recipes-devtools/opkg/opkg_0.3.2.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.3.bb
index 0251b7d..bce72fc 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.3.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
 "
 
-SRC_URI[md5sum] = "b2cc1baa89d0b3d49e63ab002fd2e0a6"
-SRC_URI[sha256sum] = "c9fa948a779a4e493b9669c239de317d43c43accbccbb0cf84056f9b269ba7b0"
+SRC_URI[md5sum] = "a4613038c8afc7d8d482f5c53f137bdf"
+SRC_URI[sha256sum] = "19db9e73121a5e4c91fa228b0a6a4c55cc3591056130cfb3c66c30aa32f8d00e"
 
 inherit autotools pkgconfig systemd
 
-- 
1.9.1



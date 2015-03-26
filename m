Return-Path: <SRS0=dgMrF2=EI=mashlibs.com=yocto@eigbox.net>
X-Greylist: delayed 1827 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Mar 2015 06:51:49 UTC
Received: from bosmailout05.eigbox.net (bosmailout05.eigbox.net [66.96.189.5])
	by mail.openembedded.org (Postfix) with ESMTP id 10E486013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 06:51:49 +0000 (UTC)
Received: from bosmailscan06.eigbox.net ([10.20.15.6])
	by bosmailout05.eigbox.net with esmtp (Exim) id 1Yb1AR-0002UF-U8
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Mar 2015 02:21:23 -0400
Received: from [10.115.3.32] (helo=bosimpout12)
	by bosmailscan06.eigbox.net with esmtp (Exim) id 1Yb1AR-0004Mf-OS
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Mar 2015 02:21:23 -0400
Received: from bosauthsmtp15.yourhostingaccount.com ([10.20.18.15])
	by bosimpout12 with 
	id 86ML1q00H0KWaAJ016MPQJ; Thu, 26 Mar 2015 02:21:23 -0400
X-Authority-Analysis: v=2.1 cv=KfdcsGoD c=1 sm=1 tr=0
	a=6thTdk0GfRoQwv0zj4iWMg==:117 a=iGEazlki0I0E4vS82n+c7A==:17
	a=pq4jwCggAAAA:8
	a=QPcu4mC3AAAA:8 a=1dA1B7r8yJwA:10 a=CjxXgO3LAAAA:8 a=bI6D7KplAAAA:8
	a=C_IRinGWAAAA:8 a=emO1SXQWCLwA:10 a=lrwbqTnF7UjaU9VzMPoA:9
Received: from c-73-193-21-136.hsd1.wa.comcast.net ([73.193.21.136]:58160
	helo=localhost.localdomain)
	by bosauthsmtp15.eigbox.net with esmtpa (Exim)
	id 1Yb1AO-0005Dd-9J; Thu, 26 Mar 2015 02:21:20 -0400
From: Stephen Holstein <yocto@mashlibs.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Mar 2015 02:21:12 -0400
Message-Id: <1427350872-13209-1-git-send-email-yocto@mashlibs.com>
X-Mailer: git-send-email 1.9.1
X-EN-UserInfo: 350fe572bdac3a64b9abeddc90fe9317:931c98230c6409dcc37fa7e93b490c27
X-EN-AuthUser: yocto@mashlibs.com
Sender: Stephen Holstein <yocto@mashlibs.com>
X-EN-OrigIP: 73.193.21.136
X-EN-OrigHost: c-73-193-21-136.hsd1.wa.comcast.net
Cc: redengin <sholstei@yahoo.com>
Subject: [PATCH] Signed-off-by: redengin <sholstei@yahoo.com>
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
X-List-Received-Date: Thu, 26 Mar 2015 06:51:53 -0000

From: redengin <sholstei@yahoo.com>

fix for fortran to remove libquadmath dependency
---
 meta/recipes-devtools/gcc/gcc-4.9.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index c88a496..cec1862 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -99,6 +99,7 @@ EXTRA_OECONF_BASE = "\
     --with-cloog=no \
     --enable-checking=release \
     --enable-cheaders=c_global \
+    --disable-libquadmath-support \
 "
 
 EXTRA_OECONF_INITIAL = "\
-- 
1.9.1



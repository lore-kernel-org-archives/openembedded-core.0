Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id E922177144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:07:37 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0RE7cEV026925 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:07:38 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012708073852-343729 ;
	Wed, 27 Jan 2016 08:07:38 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 16:07:26 +0200
Message-Id: <1453903646-1919-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/27/2016 08:07:38 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/27/2016 08:07:38 AM,
	Serialize complete at 01/27/2016 08:07:38 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-27_03:, , signatures=0
Subject: [PATCH 1/1] opkg: Add 'opkg-collateral' to PROVIDES variable
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
X-List-Received-Date: Wed, 27 Jan 2016 14:07:38 -0000

opkg-collateral contained confs which were merged into opkg

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-devtools/opkg/opkg_0.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/opkg/opkg_0.3.1.bb b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
index 577f495..8507267 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
@@ -64,6 +64,7 @@ RDEPENDS_${PN}_class-nativesdk = ""
 RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
 RCONFLICTS_${PN} = "opkg-collateral"
 RPROVIDES_${PN} = "opkg-collateral"
+PROVIDES += "opkg-collateral"
 
 PACKAGES =+ "libopkg"
 
-- 
2.7.0



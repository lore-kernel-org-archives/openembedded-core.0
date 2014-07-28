Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 64CF96B7BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 18:26:57 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SIQwM2005932 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 13:26:58 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072813265853-326838 ;
	Mon, 28 Jul 2014 13:26:58 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jul 2014 13:26:30 -0500
Message-Id: <1406571990-4821-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 01:26:58 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 01:26:58 PM,
	Serialize complete at 07/28/2014 01:26:58 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: [PATCH] packagegroup-core-standalone-sdk-target: include static libs
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
X-List-Received-Date: Mon, 28 Jul 2014 18:27:03 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

meta-toolchain ought to include static libs.  This fixes an issue we saw
where a compile against libsupc++.a failed due to the missing library.

Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Acked-by: Brad Mouring <brad.mouring@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 5d1ce97..da57b36 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -9,6 +9,7 @@ RDEPENDS_${PN} = "\
     libgcc-dev \
     libstdc++ \
     libstdc++-dev \
+    libstdc++-staticdev \
     ${LIBC_DEPENDENCIES} \
     qemuwrapper-cross \
     "
-- 
2.0.3



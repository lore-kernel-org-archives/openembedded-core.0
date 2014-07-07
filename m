Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 20BE270373
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 02:24:05 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s672O5J7020891; Sun, 6 Jul 2014 21:24:05 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014070621240566-8245 ; Sun, 6 Jul 2014 21:24:05 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Sun, 6 Jul 2014 21:23:30 -0500
Message-Id: <1404699810-23745-4-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1404699810-23745-1-git-send-email-rich.tollerton@ni.com>
References: <1404699810-23745-1-git-send-email-rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/06/2014 09:24:05 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/06/2014 09:24:05 PM,
	Serialize complete at 07/06/2014 09:24:05 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-06_03:2014-07-04, 2014-07-06,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH][meta-mingw 3/3] packagegroup-cross-canadian: reenable gdb on mingw32
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
X-List-Received-Date: Mon, 07 Jul 2014 02:24:06 -0000

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 recipes-core/packagegroups/packagegroup-cross-canadian.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-core/packagegroups/packagegroup-cross-canadian.bbappend

diff --git a/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend b/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
deleted file mode 100644
index 20ad28b..0000000
--- a/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-RDEPENDS_${PN}_sdkmingw32 = "\
-    binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-    meta-environment-${MACHINE} \
-    "
-- 
2.0.1



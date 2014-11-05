Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 210047200A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 21:26:39 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sA5LQeAd013819 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 15:26:40 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014110515264015-711017 ;
	Wed, 5 Nov 2014 15:26:40 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 5 Nov 2014 15:26:17 -0600
Message-Id: <1415222777-6782-3-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1415222777-6782-1-git-send-email-ben.shelton@ni.com>
References: <1415222777-6782-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:26:40 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:26:40 PM,
	Serialize complete at 11/05/2014 03:26:40 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-11-05_08:2014-11-05, 2014-11-05,
	1970-01-01 signatures=0
Subject: [PATCH 3/3] lsb: update RDEPENDS for broken-out util-linux-getopt
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
X-List-Received-Date: Wed, 05 Nov 2014 21:26:40 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

lsb currently depends on util-linux solely for getopt, but that has now
been broken out into util-linux-getopt. Update RDEPENDS accordingly.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
Acked-by: Ben Shelton <ben.shelton@ni.com
Acked-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index d265731..d583399 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 PR = "r2"
 
 # lsb_release needs getopt
-RDEPENDS_${PN} += "util-linux"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt}"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
-- 
2.1.3



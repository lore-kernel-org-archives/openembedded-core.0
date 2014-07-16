Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AA17F70259
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:35:33 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6GKxPMn015737 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:59:25 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071615592563-455730 ;
	Wed, 16 Jul 2014 15:59:25 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 15:59:18 -0500
Message-Id: <9f7a99e560f820b7e5671afd850f74fec7e942d1.1405542432.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <cover.1405542432.git.ben.shelton@ni.com>
References: <cover.1405542432.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:25 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:25 PM,
	Serialize complete at 07/16/2014 03:59:25 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-16_07:2014-07-16, 2014-07-16,
	1970-01-01 signatures=0
Subject: [PATCH 5/5] initscripts: make hostname.sh coreutils-compatible
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
X-List-Received-Date: Wed, 16 Jul 2014 21:35:34 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

inetutils and busybox hostname utils support `hostname -F`; coreutils
hostname doesn't. So just use `cat` instead.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/hostname.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
index 78fb91c..95287cc 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
@@ -16,7 +16,7 @@ fi
 
 # Busybox hostname doesn't support -b so we need implement it on our own
 if [ -f /etc/hostname ];then
-	hostname -F /etc/hostname
+	hostname `cat /etc/hostname`
 elif [ -z "$HOSTNAME" -o "$HOSTNAME" = "(none)" -o ! -z "`echo $HOSTNAME | sed -n '/^[0-9]*\.[0-9].*/p'`" ] ; then
 	hostname localhost
 fi
-- 
2.0.1



Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 7096470637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 21:57:18 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6HLvJwN023301 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:57:19 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071716571970-513277 ;
	Thu, 17 Jul 2014 16:57:19 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 16:56:56 -0500
Message-Id: <e42e7279d246813dc21a9498524b7e61412a0349.1405633546.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <cover.1405633546.git.ben.shelton@ni.com>
References: <cover.1405633546.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize complete at 07/17/2014 04:57:19 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-17_06:2014-07-17, 2014-07-17,
	1970-01-01 signatures=0
Subject: [PATCH v2 5/6] initscripts: make hostname.sh coreutils-compatible
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
X-List-Received-Date: Thu, 17 Jul 2014 21:57:21 -0000

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
2.0.2



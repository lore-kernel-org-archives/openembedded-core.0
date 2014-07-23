Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5219C65C93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:41:46 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6NMflLA024804 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:41:47 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072317414762-160562 ;
	Wed, 23 Jul 2014 17:41:47 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 17:41:30 -0500
Message-Id: <1406155290-25903-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:41:47 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:41:47 PM,
	Serialize complete at 07/23/2014 05:41:47 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-23_07:2014-07-23, 2014-07-23,
	1970-01-01 signatures=0
Cc: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH] eglibc: Make ld.so.conf more flexible
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
X-List-Received-Date: Wed, 23 Jul 2014 22:41:49 -0000

From: Brad Mouring <brad.mouring@ni.com>

Most modern distros will include conf files in /etc/ld.so.conf.d/
when generating the ld.so cache. This change will bring that flexibility.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
Acked-by: Rich Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/eglibc/eglibc-2.19/etc/ld.so.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/etc/ld.so.conf b/meta/recipes-core/eglibc/eglibc-2.19/etc/ld.so.conf
index e69de29..83327c0 100644
--- a/meta/recipes-core/eglibc/eglibc-2.19/etc/ld.so.conf
+++ b/meta/recipes-core/eglibc/eglibc-2.19/etc/ld.so.conf
@@ -0,0 +1 @@
+include /etc/ld.so.conf.d/*.conf
-- 
2.0.2



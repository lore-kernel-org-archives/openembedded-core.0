Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB5D70233
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:54:04 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LGs58J002747 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 11:54:06 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072111540577-36075 ;
	Mon, 21 Jul 2014 11:54:05 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 11:53:48 -0500
Message-Id: <1405961628-25284-4-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405961628-25284-1-git-send-email-ben.shelton@ni.com>
References: <1405961628-25284-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 11:54:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 11:54:06 AM,
	Serialize complete at 07/21/2014 11:54:06 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [PATCH 4/4] busybox: Allow busybox-mdev to RPROVIDES hotplug
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
X-List-Received-Date: Mon, 21 Jul 2014 16:54:09 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

This is for symmetry with udev which also RPROVIDES hotplug.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bd66e4f..b4b9684 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -42,6 +42,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
+RPROVIDES_${PN}-mdev = "hotplug"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
-- 
2.0.2



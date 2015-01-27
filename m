Return-Path: <junzhu@freescale.com>
X-Greylist: delayed 9249 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Jan 2015 05:57:59 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0138.outbound.protection.outlook.com [157.56.110.138])
	by mail.openembedded.org (Postfix) with ESMTP id 42491718E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:57:59 +0000 (UTC)
Received: from BY2PR03CA057.namprd03.prod.outlook.com (10.141.249.30) by
	BY1PR0301MB0901.namprd03.prod.outlook.com (25.160.195.140) with
	Microsoft
	SMTP Server (TLS) id 15.1.65.19; Tue, 27 Jan 2015 03:23:49 +0000
Received: from BY2FFO11FD045.protection.gbl (2a01:111:f400:7c0c::103) by
	BY2PR03CA057.outlook.office365.com (2a01:111:e400:2c5d::30) with
	Microsoft
	SMTP Server (TLS) id 15.1.65.19 via Frontend Transport; Tue, 27 Jan 2015
	03:23:49 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD045.mail.protection.outlook.com (10.1.15.177) with Microsoft
	SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Tue, 27 Jan 2015 03:23:49 +0000
Received: from r01007-02.ap.freescale.net (r01007-02.ap.freescale.net
	[10.192.241.30])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0R3NkPl014110;
	Mon, 26 Jan 2015 20:23:47 -0700
From: Jun Zhu <R01007@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 11:12:16 +0800
Message-ID: <1422328336-7418-1-git-send-email-R01007@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=R01007@freescale.com; freescale.mail.onmicrosoft.com;
	dkim=none
	(message not signed) header.d=none;freescale.mail.onmicrosoft.com;
	dmarc=permerror action=none header.from=freescale.com;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(19580395003)(19580405001)(50466002)(50226001)(87936001)(6806004)(85426001)(575784001)(62966003)(77156002)(450100001)(92566002)(47776003)(77096005)(15975445007)(229853001)(2351001)(36756003)(105606002)(106466001)(104016003)(48376002)(46102003)(110136001)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB0901;
	H:az84smr01.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BY1PR0301MB0901;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY1PR0301MB0901; 
X-Forefront-PRVS: 046985391D
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB0901; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2015 03:23:49.1917 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB0901
Cc: Jun Zhu <R01007@freescale.com>
Subject: [PATCH] xserver-xorg: Add the patch to fix subwindow in Xi emulated events
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
X-List-Received-Date: Tue, 27 Jan 2015 05:58:02 -0000
Content-Type: text/plain

Signed-off-by: Jun Zhu <R01007@freescale.com>
---
 .../Fix-subwindow-in-Xi-emulated-events.patch      |   41 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.16.2.bb            |    1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch
new file mode 100644
index 0000000..604d23a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/Fix-subwindow-in-Xi-emulated-events.patch
@@ -0,0 +1,41 @@
+From db424318d0bb29cbcdf3a07fcc2e023586f1219f Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <fourdan@xfce.org>
+Date: Fri, 2 Jan 2015 18:50:17 +0100
+Subject: [PATCH] Fix subwindow in Xi emulated events
+
+Bug: 70790
+Upstream status: Submitted 
+                 https://bugs.freedesktop.org/show_bug.cgi?id=70790
+
+Signed-off-by: Olivier Fourdan <fourdan@xfce.org>
+---
+ Xi/exevents.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Xi/exevents.c b/Xi/exevents.c
+index b0bc47e..0857bce 100644
+--- a/Xi/exevents.c
++++ b/Xi/exevents.c
+@@ -1403,7 +1403,7 @@ DeliverTouchEmulatedEvent(DeviceIntPtr dev, TouchPointInfoPtr ti,
+ 
+             if (grab->ownerEvents) {
+                 WindowPtr focus = NullWindow;
+-                WindowPtr sprite_win = dev->spriteInfo->sprite->win;
++                WindowPtr sprite_win = DeepestSpriteWin(dev->spriteInfo->sprite);
+ 
+                 deliveries = DeliverDeviceEvents(sprite_win, ptrev, grab, focus, dev);
+             }
+@@ -1429,8 +1429,9 @@ DeliverTouchEmulatedEvent(DeviceIntPtr dev, TouchPointInfoPtr ti,
+     }
+     else {
+         GrabPtr devgrab = dev->deviceGrab.grab;
++        WindowPtr sprite_win = DeepestSpriteWin(dev->spriteInfo->sprite);
+ 
+-        DeliverDeviceEvents(win, ptrev, grab, win, dev);
++        DeliverDeviceEvents(sprite_win, ptrev, grab, win, dev);
+         /* FIXME: bad hack
+          * Implicit passive grab activated in response to this event. Store
+          * the event.
+-- 
+2.1.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
index 1519271..7d7d83e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
@@ -4,6 +4,7 @@ require xserver-xorg.inc
 SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xorg-CVE-2013-6424.patch \
             file://xshmfence-option.patch \
+            file://Fix-subwindow-in-Xi-emulated-events.patch \
            "
 
 SRC_URI[md5sum] = "89620960b13515db8d0a8dbb92a1378a"
-- 
1.7.9.5



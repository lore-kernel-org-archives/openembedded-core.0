Return-Path: <wills.wang@live.com>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Dec 2015 05:57:28 UTC
Received: from BLU004-OMC3S6.hotmail.com (blu004-omc3s6.hotmail.com
	[65.55.116.81])
	by mail.openembedded.org (Postfix) with ESMTP id 9C71B6B6F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 05:57:28 +0000 (UTC)
Received: from BLU436-SMTP183 ([65.55.116.73]) by BLU004-OMC3S6.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Wed, 2 Dec 2015 21:52:25 -0800
X-TMN: [0Gzcj81/gkVXv2papVZFLDiKonRZY0MV]
X-Originating-Email: [wills.wang@live.com]
Message-ID: <BLU436-SMTP18353F56745D211A3DB2769FF0D0@phx.gbl>
From: Wills Wang <wills.wang@live.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 3 Dec 2015 13:52:12 +0800
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 03 Dec 2015 05:52:24.0073 (UTC)
	FILETIME=[C85EFF90:01D12D8E]
MIME-Version: 1.0
Subject: [PATCH] initramfs-framework: create directory /var/run
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
X-List-Received-Date: Thu, 03 Dec 2015 05:57:28 -0000
Content-Type: text/plain

The following error occurs when udevd startup:
udevd[146]: bind failed: No such file or directory
error binding udev control socket
udevd[146]: error binding udev control socket

Signed-off-by: Wills Wang <wills.wang@live.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/udev | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index bb462dc..79c8867 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -38,6 +38,7 @@ udev_run() {
 	add_module_pre_hook "udev_shutdown_hook_handler"
 
 	mkdir -p /run
+	mkdir -p /var/run
 
 	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
-- 
1.9.1



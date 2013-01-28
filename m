Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B16394@freescale.com>) id 1Tzq9k-0006gP-42
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 15:57:57 +0100
Received: from mail42-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Mon, 28 Jan 2013 14:27:11 +0000
Received: from mail42-ch1 (localhost [127.0.0.1])	by mail42-ch1-R.bigfish.com
	(Postfix) with ESMTP id B664C602FD	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 14:27:11 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1155h)
Received: from mail42-ch1 (localhost.localdomain [127.0.0.1]) by mail42-ch1
	(MessageSwitch) id 1359383229376863_732; Mon, 28 Jan 2013 14:27:09 +0000
	(UTC)
Received: from CH1EHSMHS023.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.231])	by mail42-ch1.bigfish.com (Postfix) with ESMTP id
	4E6344E0061 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 14:27:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS023.bigfish.com
	(10.43.70.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 28 Jan 2013 14:27:08 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Mon, 28 Jan 2013 14:27:07 +0000
Received: from b16394-desktop.ap.freescale.net
	(b16394-desktop.ap.freescale.net [10.232.132.33])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r0SEQsxF001871;
	Mon, 28 Jan 2013 07:26:56 -0700
From: Vakul Garg <vakul@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2013 19:54:17 +0530
Message-ID: <1359383057-2560-1-git-send-email-vakul@freescale.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Vakul Garg <vakul@freescale.com>
Subject: [PATCH] linux-dtb: Add extra padding to the blob.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 14:57:57 -0000
Content-Type: text/plain

U-boot patches portal devices for adding new properties in portal nodes.
T4 devices such as T4240 have large number of portals. This requires extra
space in device tree blob. The large number of portals need more padding
space to be added.

Signed-off-by: Vakul Garg <vakul@freescale.com>
---

 meta/recipes-kernel/linux/linux-dtb.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 8aa1458..87fa646 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,6 +1,6 @@
 # Support for device tree generation
 FILES_kernel-devicetree = "/boot/devicetree*"
-KERNEL_DEVICETREE_FLAGS = "-R 8 -p 0x3000"
+KERNEL_DEVICETREE_FLAGS = "-R 8 -p 0x4000"
 
 python __anonymous () {
     import bb
-- 
1.7.7.6





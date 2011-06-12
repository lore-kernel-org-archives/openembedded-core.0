Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QVnYS-0001vK-5a
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 18:30:28 +0200
Received: by wye20 with SMTP id 20so3152094wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2011 09:27:05 -0700 (PDT)
Received: by 10.227.5.205 with SMTP id 13mr4162017wbw.31.1307896025095;
	Sun, 12 Jun 2011 09:27:05 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm14sm3588591wbb.24.2011.06.12.09.27.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Jun 2011 09:27:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 18:26:57 +0200
Message-Id: <1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1307895912.git.koen@dominion.thruhere.net>
References: <cover.1307895912.git.koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Jun 2011 16:30:28 -0000

The ext3 format is pretty much mandatory for qemu usage, so always create it.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 9ef242f..e908f69 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
 
 MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
 
-IMAGE_FSTYPES ?= "tar.bz2 ext3"
+IMAGE_FSTYPES += "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
 
-- 
1.6.6.1




Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QOTp0-0007iV-N9
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 14:01:19 +0200
Received: by wye20 with SMTP id 20so4552703wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 04:58:18 -0700 (PDT)
Received: by 10.227.29.27 with SMTP id o27mr2200010wbc.16.1306151898466;
	Mon, 23 May 2011 04:58:18 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm4043278wbd.4.2011.05.23.04.58.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 04:58:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 13:58:14 +0200
Message-Id: <1306151894-27522-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] qemu machines: drop MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "qemu-config"
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
X-List-Received-Date: Mon, 23 May 2011 12:01:19 -0000

Things like 'distcc' and 'bash' are not essential to booting a qemu machine.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/include/qemu.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 40723eb..4122a88 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -17,4 +17,3 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 #PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
 
 EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "qemu-config"
-- 
1.6.6.1




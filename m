Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMlPS-000794-TF
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 20:24:25 +0200
Received: by wye20 with SMTP id 20so1542655wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 11:20:50 -0700 (PDT)
Received: by 10.216.52.193 with SMTP id e43mr2065066wec.40.1305742849997;
	Wed, 18 May 2011 11:20:49 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s40sm905024weq.4.2011.05.18.11.20.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 11:20:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 20:20:43 +0200
Message-Id: <1305742843-7207-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] default-distrovars: do not force usage of task-core-boot
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
X-List-Received-Date: Wed, 18 May 2011 18:24:25 -0000

DISTROs are free to opt for task-base without task-core-boot at image time.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/distro/include/default-distrovars.inc |    1 -
 meta/recipes-core/tasks/task-base.bb            |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9b1d0ee..1b23a33 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -14,7 +14,6 @@ LOCALE_UTF8_ONLY ?= "0"
 
 DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
-DISTRO_EXTRA_RDEPENDS += "task-core-boot"
 DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
 
 IMAGE_FEATURES ?= ""
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index a2a8925..1b098aa 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r70"
+PR = "r71"
 
 inherit task
 
-- 
1.6.6.1




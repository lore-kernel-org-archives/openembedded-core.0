Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 338 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 May 2015 16:09:22 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5526E7404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:09:22 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 18:03:42 +0200
Message-Id: <1431705822-24238-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base-files: Remove /proc/bus/usb from fstab.
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
X-List-Received-Date: Fri, 15 May 2015 16:09:25 -0000

The usb filesystem was removed in Linux 3.5.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/base-files/base-files/fstab | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index 739b844..d79a016 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -3,7 +3,6 @@
 /dev/root            /                    auto       defaults              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
-usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults              0  0
 
-- 
1.9.1



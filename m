Return-Path: <pabigot@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id D98516AB7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:49:33 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id aq17so6092930iec.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=PIQ0TR/kNHhUgtCvcKAtmGBrYA0Ye4RulsIs+WPUQXU=;
	b=DxNzZToJzaMlENJ50zJPjhE7HeP8cGKIVSQlTkb9NpiEwlKvZo+dK9xHE537CfW3UW
	eSj9Q49HU+myxii53Orox0qXWR4B+zNrKadaZWO2YgqH2acdFSd8USiWaDYze0x0oqon
	SkROSAkF8sGQfFCMnpqlQtDeLhm2EqwFvjTMvGjNFLw8146qeIPd6+XnTj+W+dHV8kCF
	YmeDS4W7Xmr0aBU2dq39KStUoco0vHnKCkPX1if0jULJiI5u0YecFgfZR7wNiVbGpQq1
	w91bVufNHa5I3fCSbB2Fk3tPsJD5mdvO1LHIqJpsXGDVR7Ff9CKbBId+DxC0OFhQ+s6N
	2sPA==
X-Received: by 10.50.3.42 with SMTP id 10mr7999598igz.39.1377553774824;
	Mon, 26 Aug 2013 14:49:34 -0700 (PDT)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPSA id p5sm20263354igj.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 14:49:34 -0700 (PDT)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2013 16:49:28 -0500
Message-Id: <1377553769-21608-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] linux-firmware: correct name of Marvell license file
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
X-List-Received-Date: Mon, 26 Aug 2013 21:49:34 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

Follow upstream in changing the name of the license file for Marvell
firmware:

  commit 2e79e60b7e4771427327ed508fa27b90d841afcb
  Author: Bing Zhao <bzhao@marvell.com>
  Date:   Fri Jan 7 16:06:56 2011 -0800

    linux-firmware: use single license file for Marvell firmwares

    Libertas and mwl8k firmware images are under the same license.

    Signed-off-by: Bing Zhao <bzhao@marvell.com>
    Signed-off-by: Brian Cavagnolo <brian@cozybit.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

  :000000 100644 0000000... 3224e1b... A  LICENCE.Marvell
  :100644 000000 1fd8766... 0000000... D  LICENCE.libertas
  :100644 000000 3224e1b... 0000000... D  LICENCE.mwl8k
  :100644 100644 d0740ce... 35b82c8... M  WHENCE

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../linux-firmware/linux-firmware_git.bb           |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ee33f50..42f6ce0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -21,6 +21,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
                     file://LICENCE.ti-connectivity;md5=186e7a43cf6c274283ad81272ca218ea \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
+                    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
                    "
 
 SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
@@ -95,11 +96,11 @@ FILES_${PN}-ralink = " \
   /lib/firmware/LICENCE.ralink-firmware.txt \
 "
 
-LICENSE_${PN}-sd8686 = "Firmware-libertas"
+LICENSE_${PN}-sd8686 = "Firmware-Marvell"
 FILES_${PN}-sd8686 = " \
   /lib/firmware/libertas/sd8686_v9* \
   /lib/firmware/sd8686* \
-  /lib/firmware/LICENCE.libertas \
+  /lib/firmware/LICENCE.Marvell \
 "
 
 FILES_${PN}-rtl-license = " \
-- 
1.7.9.5



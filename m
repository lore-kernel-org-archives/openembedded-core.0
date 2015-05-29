Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4545575745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:32:20 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so20247089igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=q9FB2qbq4MswOE6mv47KY/hAzUA+mcXPUNa/KBsdc20=;
	b=lb0IfcpJneWzfLkC5TSSRltSfqOdpGq6vd4ZmxZ1KjFYe01PhQlEnlYYSPJ+Caamtn
	gp7BwXHmTTlWBkOOVFFWsu88X1DRMX71cGfeo5tm+pA9XivAbqKP66K+QJcMLQVkdSuA
	RS/hk5muQCztAvbOPCKydlVVaBH81cZ20y/eS3mkZXv21xHKQ7uEXKwyoQxK/s/mY29r
	XWypomA1wnZ4jsHgmF84Al1rK9eYiExNPCiogD1EEWJkAx3lD5qYinGoTGCACEPngCp5
	deWraQyA3FA+fXft8JhIcvMihcoYLVAnthImUTFJRmsDQlGuUPTFuH5VM92UKOC0MrDP
	ATSA==
X-Received: by 10.50.114.70 with SMTP id je6mr5419497igb.43.1432920742076;
	Fri, 29 May 2015 10:32:22 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id n14sm4628876ion.5.2015.05.29.10.32.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 May 2015 10:32:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2015 10:32:12 -0700
Message-Id: <3f974765b746c7099d882c8700579760743e9426.1432920208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
References: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1432920208.git.raj.khem@gmail.com>
References: <cover.1432920208.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Fri, 29 May 2015 17:32:21 -0000

When booting weston-core-image with latest wayland/weston/libinput
mouse/touchpad would not work on qemux86, this fixes the issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index bc2a355..5282572 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -119,7 +119,7 @@ ORIG_STTY=$(stty -g)
 if [ "$SLIRP_ENABLED" = "yes" ]; then
     KERNEL_NETWORK_CMD="ip=dhcp"
     QEMU_TAP_CMD=""
-    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
+    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
     if [ "$KVM_ACTIVE" = "yes" ]; then
         QEMU_NETWORK_CMD=""
         DROOT="/dev/vda"
@@ -274,7 +274,7 @@ else
         fi
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
-        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
+        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
         if [ $MACHINE = 'qemuarm64' ]; then
             QEMU_UI_OPTIONS="-nographic"
         fi
-- 
2.1.4



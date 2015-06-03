Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE557582D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 16:42:09 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so19068708igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=q9FB2qbq4MswOE6mv47KY/hAzUA+mcXPUNa/KBsdc20=;
	b=0NQXJYpv4z8nWHvkIQrJJzIgkHLYECgc82TG5VIe+lAQ5ap63fn8RkoMft+RNVTriQ
	QLRTV/XCE4Le2G8+K/ixaCP7NE+N0F2BRo45L0OQGGMQsnQxJBP2WYtbuQ1colJvDOfP
	56K+514H6X/BzMgtDxZcWV/DL5PwzxlAMMk4nKWrFnOS9MfKGvjNdhSuj0DKikm3CeH/
	gQJLLAfH7UQjhweL5bEho10/cxOAQsB0F32NKnZvJD+ObZlbaYdBowIG4H7A8UCTnW9O
	ctf0nmoAZYNkomVOq/YliFqKgSCV7/0V62JwmOiHzE0jnt9T71Bo50eAEtmyjBLULaY0
	H6XQ==
X-Received: by 10.50.33.19 with SMTP id n19mr28109490igi.8.1433349730245;
	Wed, 03 Jun 2015 09:42:10 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id d4sm15059595iod.17.2015.06.03.09.42.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 09:42:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 09:42:00 -0700
Message-Id: <b945778bab5ef3c85d9e42efcf2cc904f0a137cf.1433349512.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
References: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
In-Reply-To: <cover.1433349512.git.raj.khem@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Wed, 03 Jun 2015 16:42:10 -0000

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



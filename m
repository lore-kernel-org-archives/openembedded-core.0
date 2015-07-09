Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 59AFD75D1B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 17:52:47 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so181630807iec.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3gaE2XJQ8m+K8SMIEAXtN9lALBkfRIKDpR4R07G6kX4=;
	b=N+e/0+IEgenFdNuq9m/aQCciR1oj/aTd0xciREuig8Hxer0pjbMyEZYx4ZfwwY3tw6
	Vv4S2tcxoI/jsWPfSlwlcZmHI7wmdsqnHqn2pZccnMi44YaoGAk5eBByiX5XRg0lXb9j
	1VAFcXbhQgDyOxEE6gjgJlZ1nu3rBY8+G32eLjplw4TELqqwggWBa2Ykm0h6GtZ0+ilH
	NzAnzvIjnAQEKZZgGZof8YcntcOJQAGNG5wTTNtpZ0cEU2xSFPL4JnuW/viJ5MXAF/ew
	71m35iPllBZI8S4Fo33em8nNHwBx0oWxsPLr6ocK/ioM6m02AZffytlvcPRnXltJT/Ra
	B9fQ==
X-Received: by 10.107.134.83 with SMTP id i80mr855183iod.123.1436464368253;
	Thu, 09 Jul 2015 10:52:48 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	c12sm4637051ioj.39.2015.07.09.10.52.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jul 2015 10:52:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:40 -0700
Message-Id: <946bdac08d39152d5d25795d01bdf15b227378e2.1436464186.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
References: <ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
In-Reply-To: <cover.1436464186.git.raj.khem@gmail.com>
References: <cover.1436464186.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Thu, 09 Jul 2015 17:52:50 -0000

When booting weston-core-image with latest wayland/weston/libinput
mouse/touchpad would not work on qemux86, this fixes the issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 6878251..67aef8d 100755
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
 
         NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
         export NFS_INSTANCE
-- 
2.1.4



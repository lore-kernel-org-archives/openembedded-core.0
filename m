Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id A514D65C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:25:04 +0000 (UTC)
Received: by igcur8 with SMTP id ur8so98755383igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oVDnswowTef+FpTTws2UiKT2vcztTMw0cLLPiFojpSg=;
	b=g2mJLHNFqN5GjYvN5yurCRUWwMaMSsRfF2dF08QLuaikxJ73dEqZPrtv6y2qQ/qrjH
	D3E1hg7z6xwcp2d/Kfg44sGvNNCzeo1vSdKYALgQN/7MepKj699VF2Ig/wC2A4fP0qGC
	RAqMZTZiAygjOxa7fX6Bknyz6V+1rj6OgNgTWIVF+6HrO4Wd/kcPgp1YUyGB7kalUG7J
	NtEg6NEop6VY28xQDL/B2LmCHR8tMKWLy5bLh92saVi0GUorbYBR76sFFquoJcuvhNN7
	IlDq8pKKKPuev9RbeHflDRA6Z5qWg5quDVTMGnkh097BKhYtlAg4C8N2/bW87DZkn4j8
	2h9g==
X-Received: by 10.50.30.105 with SMTP id r9mr35426643igh.11.1435775105253;
	Wed, 01 Jul 2015 11:25:05 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id p4sm2229179igg.20.2015.07.01.11.25.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 11:25:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 11:24:55 -0700
Message-Id: <e310cabc57132cbf875aa3841dcaf7efbf4d5025.1435774899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
References: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
In-Reply-To: <cover.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Wed, 01 Jul 2015 18:25:07 -0000

When booting weston-core-image with latest wayland/weston/libinput
mouse/touchpad would not work on qemux86, this fixes the issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 694815f..8f3d792 100755
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



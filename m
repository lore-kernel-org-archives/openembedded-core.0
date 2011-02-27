Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcy0-0007DK-K2
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:04 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:43 -0800 (PST)
Received: by 10.216.245.11 with SMTP id n11mr1073208wer.108.1298798983351;
	Sun, 27 Feb 2011 01:29:43 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c54sm1286509wer.6.2011.02.27.01.29.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:17 +0100
Message-Id: <c2aa8c964e78098f4b82718d3dfcb6a9d5e677fe.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 12/50] poky-qemu: Update -sdk image name due to recent change to sato-sdk
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:04 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/poky-qemu |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/poky-qemu b/scripts/poky-qemu
index cb08f27..1086c3d 100755
--- a/scripts/poky-qemu
+++ b/scripts/poky-qemu
@@ -228,23 +228,23 @@ machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
 # Defaults used when these vars need to be inferred
 QEMUX86_DEFAULT_KERNEL=bzImage-qemux86.bin
 QEMUX86_DEFAULT_FSTYPE=ext3
-QEMUX86_DEFAULT_ROOTFS="poky-image-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
+QEMUX86_DEFAULT_ROOTFS="poky-image-sato-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
 
 QEMUX86_64_DEFAULT_KERNEL=bzImage-qemux86-64.bin
 QEMUX86_64_DEFAULT_FSTYPE=ext3
-QEMUX86_64_DEFAULT_ROOTFS="poky-image-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
+QEMUX86_64_DEFAULT_ROOTFS="poky-image-sato-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
 
 QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
 QEMUARM_DEFAULT_FSTYPE=ext3
-QEMUARM_DEFAULT_ROOTFS="poky-image-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
+QEMUARM_DEFAULT_ROOTFS="poky-image-sato-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
 
 QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
 QEMUMIPS_DEFAULT_FSTYPE=ext3
-QEMUMIPS_DEFAULT_ROOTFS="poky-image-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
+QEMUMIPS_DEFAULT_ROOTFS="poky-image-sato-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
 
 QEMUPPC_DEFAULT_KERNEL=zImage-qemuppc.bin
 QEMUPPC_DEFAULT_FSTYPE=ext3
-QEMUPPC_DEFAULT_ROOTFS="poky-image-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
+QEMUPPC_DEFAULT_ROOTFS="poky-image-sato-sdk poky-image-sato poky-image-lsb poky-image-basic poky-image-minimal"
 
 AKITA_DEFAULT_KERNEL=zImage-akita.bin
 AKITA_DEFAULT_FSTYPE=jffs2
-- 
1.6.6.1




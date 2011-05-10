Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QJnX9-0005r9-Nw
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:03:32 +0200
Received: by rex (Postfix, from userid 1000)
	id C4FC820CE5; Tue, 10 May 2011 15:00:40 +0100 (BST)
Message-Id: <1964c661f9beafb8f3ef6970774552a1d1fe8e07.1305035617.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Old-Date: Tue, 10 May 2011 14:33:58 +0100
Date: Tue, 10 May 2011 15:00:40 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/6] machine/qemu: Add qemu-config as an essential machine speicfic dependency and drop specific distro config
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
X-List-Received-Date: Tue, 10 May 2011 14:03:32 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/poky.conf         |    7 -------
 meta/conf/machine/include/qemu.inc |    1 +
 meta/conf/machine/qemux86-64.conf  |    2 +-
 meta/conf/machine/qemux86.conf     |    2 +-
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index f13a67f..3a66a76 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -32,13 +32,6 @@ LOCALE_UTF8_ONLY = "0"
 DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
 POKY_EXTRA_RDEPENDS = "task-core-boot"
-POKY_EXTRA_RDEPENDS_qemuarm = "qemu-config"
-POKY_EXTRA_RDEPENDS_qemuarmv6 = "qemu-config"
-POKY_EXTRA_RDEPENDS_qemuarmv7 = "qemu-config"
-POKY_EXTRA_RDEPENDS_qemumips = "qemu-config"
-POKY_EXTRA_RDEPENDS_qemuppc = "qemu-config"
-POKY_EXTRA_RDEPENDS_qemux86 = "qemu-config"
-POKY_EXTRA_RDEPENDS_qemux86-64 = "qemu-config"
 
 DISTRO_EXTRA_RDEPENDS += "${POKY_EXTRA_RDEPENDS}"
 DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 61281bf..bd40983 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -19,3 +19,4 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 #PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
 
 EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "qemu-config"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 182759a..ca91388 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -30,6 +30,6 @@ XSERVER ?= "xserver-xf86-dri-lite \
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "v86d"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 TARGET_CC_ARCH = "-m64"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index f1a0939..8b14731 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -29,6 +29,6 @@ XSERVER ?= "xserver-xf86-dri-lite \
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "v86d"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 TARGET_CC_ARCH = "-march=i586"
-- 
1.7.4.1




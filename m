Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyT-0007FI-DY
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:33 +0100
Received: by wyb38 with SMTP id 38so2800700wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:09 -0800 (PST)
Received: by 10.227.71.129 with SMTP id h1mr3878737wbj.25.1298799009773;
	Sun, 27 Feb 2011 01:30:09 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u9sm2267363wbg.0.2011.02.27.01.30.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:43 +0100
Message-Id: <3b2f3b93304bce96aec487b576c6ae6a7618d8b6.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 33/50] conf/machine: Use linux-libc-headers instead of linux-libc-headers-yocto
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:33 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/beagleboard.conf      |    2 +-
 meta/conf/machine/include/qemu.inc      |    2 +-
 meta/conf/machine/mpc8315e-rdb.conf     |    2 +-
 meta/conf/machine/routerstationpro.conf |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/beagleboard.conf b/meta/conf/machine/beagleboard.conf
index 41351e7..b1f7350 100644
--- a/meta/conf/machine/beagleboard.conf
+++ b/meta/conf/machine/beagleboard.conf
@@ -25,7 +25,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp "
 SERIAL_CONSOLE = "115200 ttyO2"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
+#PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 225906b..61281bf 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -16,6 +16,6 @@ RDEPENDS_kernel-base = ""
 
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
+#PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
 
 EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
diff --git a/meta/conf/machine/mpc8315e-rdb.conf b/meta/conf/machine/mpc8315e-rdb.conf
index 578751c..34b75bb 100644
--- a/meta/conf/machine/mpc8315e-rdb.conf
+++ b/meta/conf/machine/mpc8315e-rdb.conf
@@ -13,7 +13,7 @@ SERIAL_CONSOLE = "115200 ttyS0"
 MACHINE_FEATURES = "kernel26 keyboard pci ext2 ext3 serial"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
+#PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
 
 UBOOT_ENTRYPOINT = "0x00000000"
 
diff --git a/meta/conf/machine/routerstationpro.conf b/meta/conf/machine/routerstationpro.conf
index 9e5036d..d464842 100644
--- a/meta/conf/machine/routerstationpro.conf
+++ b/meta/conf/machine/routerstationpro.conf
@@ -13,7 +13,7 @@ KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
+#PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-- 
1.6.6.1




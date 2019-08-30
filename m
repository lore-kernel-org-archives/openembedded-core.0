Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 40F566C1C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:08:20 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z4so5925953qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 18:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G8TOC6dhmcWL6oyGDDpCfQY5UKjT/3tF7m5KCj0zumw=;
	b=tVC4BWa0aaPkHmDVbXfh/F49JwAZW3kwASRI0c3wxHd2fEZ2JvsVRrzHYfTPk6mTYV
	A3aHvlxvxvsCnd0hRpCYj+4CWP18FSCweIv91J2vDzbcg55laX5wdydDK6c1gkDLfjrH
	uvmOzHwGv/GAhF6/C6gs4H9K/pe38KhxgislfvFz6vTK75rojwtJRKSdVZ5sxU9HBPFq
	KZ6SZGz9pcnDKYQVns/zyq1YlICU0Rr3gKkqSKFjKmMlmkWRIqZiYORFn6YLZI70fFMv
	+sD+/ZHCx3KhF+sGv3URdSX2AoYrHLGvW5Ne1D0gN0Ch4ASKN/FFXbckjj1oziB/kU46
	lfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G8TOC6dhmcWL6oyGDDpCfQY5UKjT/3tF7m5KCj0zumw=;
	b=OV9vp5ehZYzr3D3sBCpKZLcIRwOYeylvpq9CZ4nCrZSUCWBsj9Y8Z/ID4wO6nvaZpc
	9QnFTDDSaOA+CWbf+dzTkawVIQ65J1r9xD55zokFR9FgK6tsfAbCcAXxND1lu+uOWZvh
	geUPOGxGX7Oi5nLCFKCsNJD8qRO0dAToRejDp483Umwxl27ZOtOLIBxZD4X7WlUrCF11
	L6LWQDQykg8zJ36Vq5KDijJq2UQF3vaQs3Pybyr0+05g9OqzjusK0LgRxN08yMvRzL8L
	/bjE7NPL4VU0pNEX8KFAO4Qo+9znADrP+X/PQgjRBZf7bkgsSjSYLki9IpAbwL7k04RX
	dBAQ==
X-Gm-Message-State: APjAAAXdiGPtka5rCPU3Fqrn5eXMrGhOiMr+yl8P5EEEmoJv3XAohyzj
	7/nrCPevmEFzNcVaQygd5kPBWs3WLgU=
X-Google-Smtp-Source: APXvYqzh0XQOzPzitYh1wBkBm3FWAsK3BP8FdOc5mKd4pwwKvDQPIN7zTqITP0xgMIv2UGf4XC31dQ==
X-Received: by 2002:ac8:31cc:: with SMTP id i12mr13148574qte.170.1567127300398;
	Thu, 29 Aug 2019 18:08:20 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	y204sm2562654qka.54.2019.08.29.18.08.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 18:08:19 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2019 21:08:01 -0400
Message-Id: <20190830010801.2496-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meta: add missing descriptions and homepage in bsp
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
X-List-Received-Date: Fri, 30 Aug 2019 01:08:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-bsp/acpid/acpid.inc              | 5 +++++
 meta/recipes-bsp/formfactor/formfactor_0.0.bb | 3 +++
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb   | 5 +++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     | 4 ++++
 meta/recipes-bsp/usbinit/usbinit.bb           | 4 ++++
 5 files changed, 21 insertions(+)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 766ed4f89e..ee9f2c0ece 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -1,4 +1,9 @@
 SUMMARY = "A daemon for delivering ACPI events"
+DESCRIPTION = "In recent linux kernels, the /proc/acpi/event interface has \
+been deprecated. The same information (and more) is available via netlink \
+(a way for the kernel to communicate with userspace that is usually used \
+for networking) and the input layer (mouse, keyboard, power button, etc...). \
+This version of acpid supports netlink and the input layer."
 HOMEPAGE = "http://sourceforge.net/projects/acpid2"
 BUGTRACKER = "http://sourceforge.net/p/acpid2/tickets/?source=navbar"
 SECTION = "base"
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 53cf1cf774..919fb1fbba 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Device formfactor information"
+DESCRIPTION = "A formfactor configuration file provides information about the /
+target hardware for which the image is being built and information that the /
+build system cannot obtain from other sources such as the kernel."
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 750f8c808a..57e0eddb67 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -1,6 +1,11 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SUMMARY = "Basic grub.cfg for use in EFI systems"
+DESCRIPTION = "The grub.cfg file contains Bash-like code and a list of installed \
+kernels in an array ordered by sequence of installation. For example, if you \
+have four installed kernels, the most recent kernel will be at index 0, the \
+previous kernel will be at index 1, and the oldest kernel will be index 3."
+HOMEPAGE = "https://www.gnu.org/software/grub/manual/grub/grub.html#Configuration"
 
 RPROVIDES_${PN} += "virtual/grub-bootconf"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ad043dbcde..a056eae8ce 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -1,4 +1,8 @@
 HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
 SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index aba44b4068..c93f5faee5 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Initscript for enabling USB gadget Ethernet"
+DESCRIPTION = "This module allows ethernet emulation over USB, allowing for /
+all sorts of nifty things like SSH and NFS in one go plus charging over the /
+same wire, at higher speeds than most Wifi connections."
+HOMEPAGE = "http://linux-sunxi.org/USB_Gadget/Ethernet"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.20.1



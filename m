Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 88A9F7ED3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 05:13:02 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id h126so19241432qke.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=57m/Vyk7RimObrN0wim4sCdLlDQAm8XlMgDdwr0oo0k=;
	b=emHSt23H4bSD3H8ChAsG+DXHXBtHxPVOWw2y0XiAb2zZ0i4RDrY00y7xLlhIImGCN3
	Y7Letay8vEuNryT+iYSye9/LxudSVpdbiUNV2E37faXY/WCS8ihn7dwwBfkUuORYz69P
	C5j61W2VTFrSi/Tx9DRPaDq047ZWACumXtqajFSs7cm2GMOy/UvhPyIk+Kpl997n5Bit
	fy0YCqC+OrBFuXrdTaYl/ipH/a+v7Y8kqTGfHL/v9i95fssOHSjnPdun4/hfaRT890pW
	jXywiQvgKwgjj/p8WKoX7+2cZBqYNS3BJV9Wr5J3omVJIrDi8dwmcBXQFoJ0gDB7Sr5G
	5qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=57m/Vyk7RimObrN0wim4sCdLlDQAm8XlMgDdwr0oo0k=;
	b=TDQrRPL1UyBj1RwUiNmhewdjhB3LfdGKspbNsKP2nNLoZobKlD/iktSOi+mqjlAh3l
	Z5JSc13rvxOLZbUun7a9UuCu6fhZjsYYswDp8/bLr+y4kyDQqEjXjctJw+VWa3N7Yhpi
	PUHs0bOL89YH4mpWC7mu9mSQzSpqiA7TUTazQ4Iq/pGvKvF0yf13+N/t/aDmTAi3pD6E
	HzIZj+zLH+rx3GQc6MUlzLqja2JFz5e/Rj0gTYgVwed6PXLPJtSi3RDsXRTabwVi4lRw
	2TvC5/AvrZyNFbpox7liRqoNtJWgfczbOuX84eCw8dTY78WqRVjxz567hYdmi75Motch
	YVEg==
X-Gm-Message-State: APjAAAV++K+rr4Jo+CTyZonqzsh3HCiFyKVVCpQ/jLyDVjjrwLnZPegf
	Z0ZHYQz8iVqgq0dzRjeVekJfC3v+3Ys=
X-Google-Smtp-Source: APXvYqyJzw2CJIz9ME3IWtAwq4SdZvOY5L9t6GoL1P+hHy2BqNyEsuJiA0Wbuc2WfWj1eq4ylqDSnA==
X-Received: by 2002:a37:c204:: with SMTP id i4mr13147135qkm.282.1568351583079; 
	Thu, 12 Sep 2019 22:13:03 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	l48sm9441759qtb.50.2019.09.12.22.13.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 22:13:02 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 01:12:39 -0400
Message-Id: <20190913051239.30949-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v3] meta: add missing descriptions and homepage in bsp
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
X-List-Received-Date: Fri, 13 Sep 2019 05:13:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
Changes in v3:
	- Change some forward slashes to backslashes

Changes in v2:
	- Rewrite acpid description to be more meaningful
	- Change grub-bootconf description

meta/recipes-bsp/acpid/acpid.inc              | 6 ++++++
 meta/recipes-bsp/formfactor/formfactor_0.0.bb | 3 +++
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb   | 3 +++
 meta/recipes-bsp/u-boot/u-boot-common.inc     | 4 ++++
 meta/recipes-bsp/usbinit/usbinit.bb           | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 766ed4f89e..1e43e7a9db 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -1,4 +1,10 @@
 SUMMARY = "A daemon for delivering ACPI events"
+DESCRIPTION = "ACPID is a completely flexible, totally extensible daemon for \
+delivering ACPI events. It listens on netlink interface (or on the \
+deprecated file /proc/acpi/event), and when an event occurs, executes programs \
+to handle the event. The programs it executes are configured through a set of \
+configuration files, which can be dropped into place by packages or by the \
+admin."
 HOMEPAGE = "http://sourceforge.net/projects/acpid2"
 BUGTRACKER = "http://sourceforge.net/p/acpid2/tickets/?source=navbar"
 SECTION = "base"
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 53cf1cf774..ea1fa4c754 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Device formfactor information"
+DESCRIPTION = "A formfactor configuration file provides information about the \
+target hardware for which the image is being built and information that the \
+build system cannot obtain from other sources such as the kernel."
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 750f8c808a..9d5dab9aa8 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -1,6 +1,9 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SUMMARY = "Basic grub.cfg for use in EFI systems"
+DESCRIPTION = "Grub might require different configuration file for \
+different machines."
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
index aba44b4068..ef98f0bf62 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Initscript for enabling USB gadget Ethernet"
+DESCRIPTION = "This module allows ethernet emulation over USB, allowing for \
+all sorts of nifty things like SSH and NFS in one go plus charging over the \
+same wire, at higher speeds than most Wifi connections."
+HOMEPAGE = "http://linux-sunxi.org/USB_Gadget/Ethernet"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.20.1



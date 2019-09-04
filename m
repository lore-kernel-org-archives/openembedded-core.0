Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 979157F2E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 01:57:09 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z67so5269246qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 18:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R9t7hMDi3aofnJvQFYgyS43MVMlMA4jERqPaXD1vxsI=;
	b=XL3kBtuBWXOS30fnYy0PTNG+bxmv9C0kQmVUvi8xlt8Yb458WQFXwZcDWGRfs/+GF9
	xp4z7mcWGtgMvTk1ViFrwHpwyRxfk3n41nM47Hkpo4tzEYpKBu/4x4VYZb/ReHSkhpBL
	jnqzN6SgZRNlIPKfnEh5sv+6DgKTixjGxiMLG+iQEOvNU5v0qkt04bDzN/dnfMR+heoa
	PBIxQQ8TC0A0psbuUimB2dFm7EBCQx8qnFOB8fiPLw8xnO/FZqe8hj8Vx1b+JXRGbgst
	B4HskWTYppW1LnylrGtigYxQ9h/KBrUANjpV8/QX1d0HinS+waFolyOrMPYfydbyIeuQ
	K6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R9t7hMDi3aofnJvQFYgyS43MVMlMA4jERqPaXD1vxsI=;
	b=liC4lqoKZi3WuG0lcZpjvh5SGjPD3tQoUpO2jBOFO+8vdXN+8A48erhO2r8EIutAkY
	QHVV1Z7jJ7gZcFcITN39Hh3i4Q7GcPpuOw9Ag/giyV30Xr4SRgjJLaj7N9+Rp7ZEYYWy
	SlARvLEgWs/6m5b8nxLS6x6fGJCSEaG0zjLELLXbcM4bxi1pV/tkNaXvzv/Z6ukRO4wo
	gYie9N4OKgJiJ/iLj/dx4GWFtnEMa+hbO33b7R2Fx+fclPPboyFnn9Iex9f/wLZJJ1eU
	NivwLQuwHuO1ZQQwsrGDYKwDqv/ldh3px3Z+qoEOMzVFsmshMR4DLSLlUm7DPZcAiUoX
	gtqA==
X-Gm-Message-State: APjAAAU9Y9wTDSRjEIbOSsHDImUUrLk5z6qPmGCc49L+qy+HJrEuMGUb
	5/h5Nsm27AsV5xbt4SG2eLMkAJEF4dc=
X-Google-Smtp-Source: APXvYqywyTkZ0dOJcyPBe/g7ogmXolqsSsY33d2vVD17spATq/r4UtjRNiA9W7NnPJ5cLGHj52/+QQ==
X-Received: by 2002:a37:b383:: with SMTP id c125mr43008qkf.268.1567562230171; 
	Tue, 03 Sep 2019 18:57:10 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id o9sm9171625qtr.71.2019.09.03.18.57.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 18:57:09 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 21:56:57 -0400
Message-Id: <20190904015657.20094-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] meta: add missing descriptions and homepage in bsp
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
X-List-Received-Date: Wed, 04 Sep 2019 01:57:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
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



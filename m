Return-Path: <jdmason@kudzu.us>
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
	[209.85.161.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7850F7C705
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 22:32:51 +0000 (UTC)
Received: by mail-yw1-f54.google.com with SMTP id r188so8301842ywb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 14:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=N3LGFUw7Fj5SL7+AIIGNwHEswl8GueYMNh1EPL9qABU=;
	b=2NFd3ydrHV5G/eXqAaBLrNRCqakeK8F+/vpzwxOLrpacDw5mAB7I3DoLtx+4XVko9o
	kUgautdo+tSoM10e1L+jV4p90EnULoZVr85anHC2uFs7gOn9EY1nP/IQSCEMndDgWtpJ
	nTucqq3bvPNvix48p4SY5AROTydLAUp5bRHARspbFkkaVZeOVlHWjcWaQgGqRKNQyBfD
	O4tn19f5xvUH+KCZCcQHdmAoW//mVmQPpySdxi3l13r/F5ewBnlIkgLVQImiGxT5i7SN
	E9XXE4kxPqadbWxWVuvE/Q+RSB+ShbKJnnBZaPw0eOls3AjyGVOA1EZVhAbxzBKWjtkm
	cozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=N3LGFUw7Fj5SL7+AIIGNwHEswl8GueYMNh1EPL9qABU=;
	b=eCkxQj65aoNGEEFN9hK6colRC+hgAMsVYLdfxPf1YFLYxFGCahq6nYKfBywfTDMmyt
	YTWeIfgU2jnystQGA1iDBSqmpPKTVZqQQKGi5B8e1f6uDnr1xglUs8SgHuvAwaKUHtKw
	S0MfiI7i0HxKkBAU+Cg4w9fQoxeuYjhkXBGBg2wjs/A+UEiVDxNCPX6WalUfHwdgs1hu
	YvTGmtpG5rZ5miiYNCUTrFQzpOKNjvccALKpH0n+YGuq3ZugoJBwgVn9hEqgaXNf6PSP
	8H+Ncqea/sQLzZSCmF4NpHaBlfBTP+BQnrf4Wf/y23yqAO3XRVQjLwv1nC3lq8Lt9fRg
	FIdA==
X-Gm-Message-State: APjAAAXZXtVldBMynqtMNYX5jw55C/PKYsU6VRY4oDkUUsJlNv2sqCeC
	DuAPVRvVewlitL0NQAi0swhPU+H5xri/iw==
X-Google-Smtp-Source: APXvYqx8ildRQxdMvmdDR+qtYjoHuMnbwsGA1IPI9Q7xCD0zvhZyKPE8iEfIFnv3pw8p7osFmxjU6A==
X-Received: by 2002:a81:24c9:: with SMTP id k192mr2887004ywk.19.1551825172223; 
	Tue, 05 Mar 2019 14:32:52 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	o132sm4403783ywd.4.2019.03.05.14.32.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Mar 2019 14:32:51 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Tue, 05 Mar 2019 17:32:50 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 17:32:19 -0500
Message-Id: <20190305223219.30812-4-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190305223219.30812-1-jdmason@kudzu.us>
References: <20190305223219.30812-1-jdmason@kudzu.us>
Subject: [PATCH v2 3/3] qemuarma15: ARM A15 Support
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
X-List-Received-Date: Tue, 05 Mar 2019 22:32:51 -0000

Add new QEMU BSP for a Arm Cortex-A15 system.  This uses the QEMU virt
machine type, which should be faster to emulate.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarma15.conf             | 33 +++++++++++++++++++
 .../linux/linux-yocto-rt_4.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
 4 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/conf/machine/qemuarma15.conf

diff --git a/meta/conf/machine/qemuarma15.conf b/meta/conf/machine/qemuarma15.conf
new file mode 100644
index 0000000000..f8ab9d5538
--- /dev/null
+++ b/meta/conf/machine/qemuarma15.conf
@@ -0,0 +1,33 @@
+#@TYPE: Machine
+#@NAME: generic Arm Cortex-A15 machine
+#@DESCRIPTION: Machine configuration for running a generic armv7
+
+require conf/machine/include/tune-cortexa15.inc
+require conf/machine/include/qemu.inc
+
+KERNEL_IMAGETYPE = "zImage"
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-arm"
+QB_MEM = "-m 512"
+QB_MACHINE = "-machine virt"
+QB_CPU = "-cpu cortex-a15"
+# Standard Serial console
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
+QB_OPT_APPEND = "-show-cursor -device VGA"
+QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
+# Add the virtio RNG
+QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+# Virtio Networking support
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+# Virtio block device
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+# Virtio serial console
+QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+
+PREFERRED_VERSION_linux-yocto ?= "4.19%"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 07dc5b77a1..36761b9943 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index c6d1594a82..52dbabd7a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarma15"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 8a4355ee83..3ef26a12ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -37,7 +37,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.17.2



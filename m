Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7EFC56D74B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 22:17:40 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id t16so4930267ybk.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 14:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=njFlcShzsAMdRa0n2GgddbKFTQyUM2tnn6ANhds8NuM=;
	b=O/X9yH6iJquTzmIf0LGr5TvVdF/XqHWtXl27WsoCamsQ4AzkeUDPYhAHrULGv0CmK8
	JIhICbzQw48NxHoFvtyNqMvA2p+NuJq1UvB5seoADWIG+1rvb0i3IYGpq9qD8XjO/Wap
	kvas2fA04a6j/a7aN7juQ9sB0IGa9yJ5aXS6HD8CjLsNLF6KNAD1Uz6QGal4ug4HUysR
	GNICJYl16i0ugpCm0sCiZN42B9ek0Ki1GY0wf+7D6bEZOVtsaQ7IbIdidMsodARp87vc
	jVFS4yC45iWQpL9k/qVq9mg9RsEdVLnStXr/jqJVZDmj3h/BLKp0vVYsSkR8gO+FBnXR
	mIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=njFlcShzsAMdRa0n2GgddbKFTQyUM2tnn6ANhds8NuM=;
	b=nHDM7F8dJN6skzfwkUorutlIqDurW4Xx2GC6F/I49n63YG8WpMbrupsqxX6pgpUx6q
	Tz7s0KkSc9WUzjd4fNWtmrEJnUgUVmHEiXGqJGmFBOnn3BEf7DqzSUZIyi+eV8AIhQjk
	80slyDGRPU7WDtOpVjCz79xSFord1zqBpVw/bfRq+U3WP3IUcp7CTzVcIJ/Ofpz20CYd
	K9vRVwrEnthjwsPNeL1kd+fg8YdWbocQAzsCIIterTAWZUTPMMsheir7ps0VKmX2zlgl
	NscT6rDgxRvosNBXVZceEbFYLA0EBe5dVy+05fpnvP2SCNNKR3JyF9E0dTmu1NrWv9Tr
	aHyA==
X-Gm-Message-State: AJcUukf4W0MkKFMyVzXuU2wjMqEIHSYSKaJpA2r/X2XJqW7Neaco+4sj
	dPQR//wiAKvC1CC2e8Apo88Us1Z4edTb3Q==
X-Google-Smtp-Source: ALg8bN6yjf2/oNzV9UFmvHavRGzbqyizH1JZwbq+eT3sO3peUb5RZWxZU91nboo6f61MADNxhdLmyw==
X-Received: by 2002:a25:6606:: with SMTP id a6mr8161171ybc.112.1547849861361; 
	Fri, 18 Jan 2019 14:17:41 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	z186sm2094547ywd.107.2019.01.18.14.17.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Jan 2019 14:17:40 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Fri, 18 Jan 2019 17:17:39 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 17:17:35 -0500
Message-Id: <20190118221737.14443-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190118221737.14443-1-jdmason@kudzu.us>
References: <20190118221737.14443-1-jdmason@kudzu.us>
Subject: [PATCH 1/3] qemuarma15: ARM A15 Support
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
X-List-Received-Date: Fri, 18 Jan 2019 22:17:41 -0000

Add new QEMU BSP for a Arm Cortex-A15 system.  This uses the QEMU virt
machine type, which should be faster to emulate.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarma15.conf             | 26 +++++++++++++++++++
 .../linux/linux-yocto-rt_4.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
 4 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta/conf/machine/qemuarma15.conf

diff --git a/meta/conf/machine/qemuarma15.conf b/meta/conf/machine/qemuarma15.conf
new file mode 100644
index 0000000000..f1c2246ebf
--- /dev/null
+++ b/meta/conf/machine/qemuarma15.conf
@@ -0,0 +1,26 @@
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
+QB_CPU = "-cpu cortex-a15 -smp 8"
+# We need both ttyAMA0 and hvc0 to allow for this to work in the stdio mode or the normal mode
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=hvc0,115200"
+QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+QB_SERIAL_OPT = "-device virtio-serial-device -chardev vc,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+
+PREFERRED_VERSION_linux-yocto ?= "4.19%"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 4a987d52c0..89b6c8db86 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 8506f7c880..e1ab7017cf 100644
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
index bd9b6a3543..81fceee98f 100644
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



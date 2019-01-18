Return-Path: <jdmason@kudzu.us>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id F3DD16D74B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 22:17:42 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id t13so5815502ywe.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 14:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WyrtRgk4BPiPWXt12aWWApuBOvSQghZQjb5BByBIlDY=;
	b=sQBGAhDnELZ1I35xe66WwPaIrv4DR5K0l7TYBMIzbon3dSm4DYMxQeAgGsC/Pa7q6U
	QT/5Zcdi4J/kGEvXNwgsTy+ddOVzqd+Kh7gNI7usupTxDdKB5LW+roOXXBsZuDpSjRRj
	Ld7PgNP4Io8AQvDMFJltrdbl1Qnn1OUQe9oTllFY9JTVFScOF8PDDjBS1XmyCuo3oAOr
	5vYeDAT5u+pyeaSU4R3qmKdA1YR3SQYSozMGHgsO6JWCMbxIocdjnYa3/z6kZsJ+zSHe
	PDBgGL1A0QZbKpIKRolJFIDqA3hqzTyj7YZg4tLCqJribF/knEEVIFlvGrPeTB3oQfSX
	7W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WyrtRgk4BPiPWXt12aWWApuBOvSQghZQjb5BByBIlDY=;
	b=c2HfNfhKSQpmW17S4+MQQ77FTnlAM6Ibz4rYvOQ06dKG84uJg7ttk2At81R1ybDXgP
	0KXuZ+fyrDotdhqFSdkBqW4tSDvTVCO3xWHEGs7QXOMqjAKPSW05mcUigywCDev58lyd
	mU2x3wqBuQtyLBp+agsp0jBcJYUVMUyrNkMVl6VurBmNhQ4xT1fG0nFYcBa3VU4K+P/L
	zG6Rx7tg3mh4p6pgdPKOsERRmZntMnnCNywA25nQiFaTXwRd4o6S8NmWE03X+r0QHKdV
	4/FXPzEL52MP7hzyNHllZ8QBFvoJRMV6RGY3y+eRJ+3zpKN/yletSc+ICnYk40QXsMUC
	gPFA==
X-Gm-Message-State: AJcUukc9o3EvMmu4Lrn3OGVaFhdQjyUCbfynJBf4o6Lt43OsAUN/XFwN
	a3e5lInXZN86bCX2ezPJ+IcY0UVvuGUAJg==
X-Google-Smtp-Source: ALg8bN4tjggq58CGc6rOEObReRZy9zTkQ0bOHVQXdhZ23XBYOo5wrfq6sMFLc/f2NxEGzHaneWxxgQ==
X-Received: by 2002:a81:35d2:: with SMTP id
	c201mr20159264ywa.276.1547849863595; 
	Fri, 18 Jan 2019 14:17:43 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	e194sm3447989ywa.85.2019.01.18.14.17.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Jan 2019 14:17:43 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Fri, 18 Jan 2019 17:17:41 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 17:17:36 -0500
Message-Id: <20190118221737.14443-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190118221737.14443-1-jdmason@kudzu.us>
References: <20190118221737.14443-1-jdmason@kudzu.us>
Subject: [PATCH 2/3] qemuarm: rename to qemuarmv5
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
X-List-Received-Date: Fri, 18 Jan 2019 22:17:43 -0000

Rename qemuarm to qemuarmv5.  This will allow for qemuarma15 to be
renamed to qemuarm, while maintaining the ability to use the existing
setup for backward compatibility and testing.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/{qemuarm.conf => qemuarmv5.conf} | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 8 ++++----
 7 files changed, 21 insertions(+), 21 deletions(-)
 rename meta/conf/machine/{qemuarm.conf => qemuarmv5.conf} (95%)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarmv5.conf
similarity index 95%
rename from meta/conf/machine/qemuarm.conf
rename to meta/conf/machine/qemuarmv5.conf
index a544312627..9b72d0d90b 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -17,5 +17,5 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "4.18%"
+PREFERRED_VERSION_linux-yocto ?= "4.19%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index e862e8d654..2905041f96 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -31,9 +31,9 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarmv5|qemuarm64|qemuppc|qemumips)"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 89b6c8db86..d518677f42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -31,9 +31,9 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarmv5|qemuarma15|qemuarm64|qemuppc|qemumips)"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 41765b5251..71319d395f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -1,5 +1,5 @@
 KBRANCH ?= "v4.18/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
+KBRANCH_qemuarmv5  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
 
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
@@ -15,7 +15,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c2892e0099ce0b5f6effa3f925ff1a9c83e57997"
+SRCREV_machine_qemuarmv5 ?= "c2892e0099ce0b5f6effa3f925ff1a9c83e57997"
 SRCREV_machine ?= "db2d813869a0501782469ecdb17e277a501c9f57"
 SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
@@ -24,9 +24,9 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarmv5"
 
 # Functionality flags
 KERNEL_FEATURES = ""
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index e1ab7017cf..a51270f731 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -1,5 +1,5 @@
 KBRANCH ?= "v4.19/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
+KBRANCH_qemuarmv5  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
 
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
@@ -15,7 +15,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d11db6c6617f689e6b9e2afaa3d3b2036c6d3d30"
+SRCREV_machine_qemuarmv5 ?= "d11db6c6617f689e6b9e2afaa3d3b2036c6d3d30"
 SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
 SRCREV_meta ?= "d9a3d567a7b5617f757d132090ca1646e139301f"
 
@@ -24,9 +24,9 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarma15"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarmv5|qemuarma15"
 
 # Functionality flags
 KERNEL_FEATURES = ""
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index e8ecc8f55a..a1edb84e98 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "v4.18/standard/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # board specific branches
-KBRANCH_qemuarm  ?= "v4.18/standard/arm-versatile-926ejs"
+KBRANCH_qemuarmv5  ?= "v4.18/standard/arm-versatile-926ejs"
 KBRANCH_qemuarm64 ?= "v4.18/standard/qemuarm64"
 KBRANCH_qemumips ?= "v4.18/standard/mti-malta32"
 KBRANCH_qemuppc  ?= "v4.18/standard/qemuppc"
@@ -11,7 +11,7 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5a58952eb0d5ff7553e3eb53c65ef70b91b01c64"
+SRCREV_machine_qemuarmv5 ?= "5a58952eb0d5ff7553e3eb53c65ef70b91b01c64"
 SRCREV_machine_qemuarm64 ?= "db2d813869a0501782469ecdb17e277a501c9f57"
 SRCREV_machine_qemumips ?= "fe54f591b6f365c8af386981b57714ccef0a9381"
 SRCREV_machine_qemuppc ?= "db2d813869a0501782469ecdb17e277a501c9f57"
@@ -35,9 +35,9 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 81fceee98f..69ae644417 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "v4.19/standard/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # board specific branches
-KBRANCH_qemuarm  ?= "v4.19/standard/arm-versatile-926ejs"
+KBRANCH_qemuarmv5  ?= "v4.19/standard/arm-versatile-926ejs"
 KBRANCH_qemuarm64 ?= "v4.19/standard/qemuarm64"
 KBRANCH_qemumips ?= "v4.19/standard/mti-malta32"
 KBRANCH_qemuppc  ?= "v4.19/standard/qemuppc"
@@ -11,7 +11,7 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b960e1b087a8b0f192e5a9a3441dd47aecfa7d48"
+SRCREV_machine_qemuarmv5 ?= "b960e1b087a8b0f192e5a9a3441dd47aecfa7d48"
 SRCREV_machine_qemuarm64 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
 SRCREV_machine_qemumips ?= "99a57b9439d36397ce975cc45ab23264c02b96d4"
 SRCREV_machine_qemuppc ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
@@ -35,9 +35,9 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarmv5|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.17.2



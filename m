Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E002A782A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:54:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x63so34552063wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 04:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FyXrGO1VpF3zHXWDEXSAa2cz/PXAYWGhlEJPDnbBRck=;
	b=gOt4gyhqcbhRNedzSB8Vs/GKzT8Cwf3heHIg+AN4igJsTwYP2r1+3O8qckIb45Dup1
	gFALgWXrh4ddgcrnL5fs+Gn+MnexSKvZa/FwBaDY32rzNLNan+r5/i7Bl19peJbxPeuv
	kPvoors7v1qcgHwNfC3Vcn0mjY8s1lIGR+DbdBERnWuYqIsu0FsWawljkaLdVLKbPd7A
	Npxg7RbkqdS8Ns/VgZzmQ80CyYgXYzapovTnTt4TVNznqTdLOdGSizbFBE3KuXSsHuYL
	VPgAoKBGfkA1eJ4RhPwLieiq5vHUwg45QyxgEzDsLp9tUMSGvI3mHf4VWbJYM6Ktc5f8
	Fswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FyXrGO1VpF3zHXWDEXSAa2cz/PXAYWGhlEJPDnbBRck=;
	b=FhhjXsbcbfVo+R4IF0F3WMJo7zAzrV0s6r6HZwJxmqZIHKj/M1IbYzTUOwyj6nAwAD
	ETffGxsxS5I7OC5wnuuzWpCakPYtn0lIKTT4xvKbyg2wfrQl9bfJJoOilE9Gfh1Y62lt
	XqoPPRTA+ZfJ9/WLSMwIpVdB6EbU0iH+No94lzHAx0gz5smu/rr2Vm7mxdti16pYlMYV
	OzU9f29mtcdeASgrHN/6rxW5XX0Acu3ntDpN7hJUU2RKUnU2ob/YrRBwhHMk05KDnO7g
	Zv/OKekvDIbNGEze7tH1ce/1Pwcruu8kEaVWCoRqTr0Ec85RyZW5MmXQWecXzLdqXh9q
	X2yA==
X-Gm-Message-State: AJaThX7l4f3Peeyp4eIseU28dMWurZLhlW2G0Mske2slWjcB96abvWNl
	LdlA4NACs6gYhOFEXu//06y6dw==
X-Google-Smtp-Source: AGs4zMYf5mTx3fY+ij5EooMbXsNPRnZZvB2UthTmYw9/FnbHDMa7eNqTIf9uJRybtqEkL3tBYK0SMw==
X-Received: by 10.80.208.195 with SMTP id g3mr52180690edf.246.1511787269844;
	Mon, 27 Nov 2017 04:54:29 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id 4sm18348760edf.81.2017.11.27.04.54.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 04:54:28 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 13:54:20 +0100
Message-Id: <1511787260-2490-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] linux-yocto: drop KCONF_BSP_AUDIT_LEVEL
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
X-List-Received-Date: Mon, 27 Nov 2017 12:54:30 -0000

From: Ming Liu <liu.ming50@gmail.com>

The warning that this flag was trying to control, it had been dropped
by commit 0f698dfd:
[ kernel-yocto: streamline patch, configuration and audit phases ]

so this flag is useless since that commit merged, drop it as well.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-yocto.bbclass                  | 1 -
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 1 -
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 1 -
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 1 -
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 1 -
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 1 -
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 1 -
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 1 -
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 1 -
 meta/recipes-kernel/linux/linux-yocto.inc          | 1 -
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 1 -
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 1 -
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 1 -
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 1 -
 14 files changed, 14 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1d44795..1c3b778 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -322,7 +322,6 @@ python do_kernel_configcheck() {
     ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
-    bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
 
     # if config check visibility is non-zero, report dropped configuration values
     mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index f93d953..0c388d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.10.17"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 983c1cc..e7172a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.12.14"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index c1cbf35..9c23a3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.4.93"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index b6c98a5..0ef43cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.9.57"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index edaf853..39b58cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_VERSION ?= "4.10.17"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
 SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 658ecc0..ed61756 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_VERSION ?= "4.12.14"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
 SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index dd38095..7491ed2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_VERSION ?= "4.4.93"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
 SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 79b8bfd..34ffdb4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_VERSION ?= "4.9.57"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
 SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 9c1f61b..07b9af7 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -46,7 +46,6 @@ SRCREV_FORMAT ?= "meta_machine"
 #   1: report options that are specified, but not in the final config
 #   2: report options that are not hardware related, but set by a BSP
 KCONF_AUDIT_LEVEL ?= "1"
-KCONF_BSP_AUDIT_LEVEL ?= "0"
 KMETA_AUDIT ?= "yes"
 
 LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 7fcc753..f5b777e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.10.17"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index a7dd763..493eb99 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.12.14"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 4d8d3da..dbe9665 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.4.93"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 2486792..479064a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.9.57"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
-- 
2.7.4



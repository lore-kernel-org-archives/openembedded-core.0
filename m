Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD1EA784F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:47:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w16GlOZE019965
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Feb 2018 08:47:24 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:47:20 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:47:23 -0500
Message-ID: <1517935643-20265-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-bsp: delete bbappends for removed kernels
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
X-List-Received-Date: Tue, 06 Feb 2018 16:47:23 -0000
Content-Type: text/plain

4.4/4.9/4.10 are gone from oe-core master, so we can drop our
bbappends.

4.12 will be removed in the future and 4.14/4.15 added, but all
default versions should be 4.12+ now.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../recipes-kernel/linux/linux-yocto_4.10.bbappend | 27 ----------------------
 .../recipes-kernel/linux/linux-yocto_4.4.bbappend  | 27 ----------------------
 .../recipes-kernel/linux/linux-yocto_4.9.bbappend  | 27 ----------------------
 3 files changed, 81 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.10.bbappend
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.9.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.10.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.10.bbappend
deleted file mode 100644
index 346a1c79354b..000000000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.10.bbappend
+++ /dev/null
@@ -1,27 +0,0 @@
-KBRANCH_genericx86  = "standard/base"
-KBRANCH_genericx86-64  = "standard/base"
-
-KMACHINE_genericx86 ?= "common-pc"
-KMACHINE_genericx86-64 ?= "common-pc-64"
-KBRANCH_edgerouter = "standard/edgerouter"
-KBRANCH_beaglebone-yocto = "standard/beaglebone"
-KMACHINE_beaglebone-yocto = "beaglebone"
-KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
-
-SRCREV_machine_genericx86    ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
-SRCREV_machine_genericx86-64 ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
-SRCREV_machine_edgerouter ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
-SRCREV_machine_beaglebone-yocto ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
-SRCREV_machine_mpc8315e-rdb ?= "c388fdfc9a1e06b22ca3533a023f4d67a6fc1e9b"
-
-COMPATIBLE_MACHINE_genericx86 = "genericx86"
-COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
-COMPATIBLE_MACHINE_edgerouter = "edgerouter"
-COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
-COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
-
-LINUX_VERSION_genericx86 = "4.10.17"
-LINUX_VERSION_genericx86-64 = "4.10.17"
-LINUX_VERSION_edgerouter = "4.10.17"
-LINUX_VERSION_beaglebone-yocto = "4.10.17"
-LINUX_VERSION_mpc8315e-rdb = "4.10.17"
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
deleted file mode 100644
index fa271e3e6d89..000000000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ /dev/null
@@ -1,27 +0,0 @@
-KBRANCH_genericx86  = "standard/base"
-KBRANCH_genericx86-64  = "standard/base"
-
-KMACHINE_genericx86 ?= "common-pc"
-KMACHINE_genericx86-64 ?= "common-pc-64"
-KBRANCH_edgerouter = "standard/edgerouter"
-KBRANCH_beaglebone-yocto = "standard/beaglebone"
-KMACHINE_beaglebone-yocto = "beaglebone"
-KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
-
-SRCREV_machine_genericx86    ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_genericx86-64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_edgerouter ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_machine_beaglebone-yocto ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
-SRCREV_machine_mpc8315e-rdb ?= "df06daf8e6de559934d16e88129bbba0237d0292"
-
-COMPATIBLE_MACHINE_genericx86 = "genericx86"
-COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
-COMPATIBLE_MACHINE_edgerouter = "edgerouter"
-COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
-COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
-
-LINUX_VERSION_genericx86 = "4.4.113"
-LINUX_VERSION_genericx86-64 = "4.4.113"
-LINUX_VERSION_edgerouter = "4.4.93"
-LINUX_VERSION_beaglebone-yocto = "4.4.93"
-LINUX_VERSION_mpc8315e-rdb = "4.4.93"
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.9.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.9.bbappend
deleted file mode 100644
index c0f8a4d1f7dd..000000000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.9.bbappend
+++ /dev/null
@@ -1,27 +0,0 @@
-KBRANCH_genericx86  = "standard/base"
-KBRANCH_genericx86-64  = "standard/base"
-
-KMACHINE_genericx86 ?= "common-pc"
-KMACHINE_genericx86-64 ?= "common-pc-64"
-KBRANCH_edgerouter = "standard/edgerouter"
-KBRANCH_beaglebone-yocto = "standard/beaglebone"
-KMACHINE_beaglebone-yocto = "beaglebone"
-KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
-
-SRCREV_machine_genericx86    ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_genericx86-64 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_edgerouter ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_machine_beaglebone-yocto ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_machine_mpc8315e-rdb ?= "98afa8ec2086fb2262d43040094e6c786d3847ba"
-
-COMPATIBLE_MACHINE_genericx86 = "genericx86"
-COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
-COMPATIBLE_MACHINE_edgerouter = "edgerouter"
-COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
-COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
-
-LINUX_VERSION_genericx86 = "4.9.78"
-LINUX_VERSION_genericx86-64 = "4.9.78"
-LINUX_VERSION_edgerouter = "4.9.65"
-LINUX_VERSION_beaglebone-yocto = "4.9.65"
-LINUX_VERSION_mpc8315e-rdb = "4.9.65"
-- 
2.5.0



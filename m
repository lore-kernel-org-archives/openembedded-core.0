Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 661D17199D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDsZps018737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:35 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:34 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:19 -0500
Message-ID: <f69a9ac178802c31d1f91030f14364394a690df2.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] kernel-yocto: tiny features aka Link Time Optimization
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:35 -0000
Content-Type: text/plain

Integrating the following patches for the 4.4/4.8 and 4.9
kernel to enable LTO for linux-yocto-tiny configurations
(i.e. poky-tiny).

b9735c0b4235 intel-quark: Remove support for serial-all
ce02da2e7833 features/usb/serial: Add new usb serial feature
f5b00d3a7e68 soc/x1000: Remove 'default policy' features
ca2dc186ff32 soc/x1000: Remove unnecessary features
90061752cbb5 soc/x1000: Remove bsp/common-pc/*
00b26ed213c4 meta/intel-common: Have intel-quark-tiny use common-drivers-32-essential
7ce24a2c497b meta/intel-common: Add intel-common-drivers-32-essential feature
ef711e0ab70e meta: Add lto-debug feature
1ca570817bf3 meta: Add lto-disable feature
45e5c2e9118e meta: Add lto (Link-Time Optimization) enablement feature

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 4487c06bf396..20ea0dc9b2ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "61d7bf47fe27b7dfd9a73b0a6de2d78a29af8b74"
-SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
+SRCREV_meta ?= "7da5624a915368bb93814379e7e1c3bbefae4cae"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 6079225cbc04..ce83410d0a1d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bafd55e39da7fd7c5d483fdee5b72450df3caf0"
-SRCREV_meta ?= "926c93ae07de2173b4f764d1da6996597a6d2b73"
+SRCREV_meta ?= "9ca50a7edc6bba11f0f9ce1eec3e6004f3043820"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index d505f924bdc7..e41c87487076 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1eb33152d655c73193cec17c4de04499e52b2faa"
-SRCREV_meta ?= "7ca94971d258304e3e3068f7b7ebe425fe5a77d1"
+SRCREV_meta ?= "68e8915786f48996e699272ba33626a44978a14e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index dfd947cf75ce..4fc499c9d892 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
+SRCREV_meta ?= "7da5624a915368bb93814379e7e1c3bbefae4cae"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 15b03579d4a3..721e5c4c2094 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e274a507b23c23bf0dd6502d0c38fae731c11511"
-SRCREV_meta ?= "926c93ae07de2173b4f764d1da6996597a6d2b73"
+SRCREV_meta ?= "9ca50a7edc6bba11f0f9ce1eec3e6004f3043820"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index bf23d3efe29f..613db1164156 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "7ca94971d258304e3e3068f7b7ebe425fe5a77d1"
+SRCREV_meta ?= "68e8915786f48996e699272ba33626a44978a14e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 7d734ac423dc..77b1b8091219 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
 SRCREV_machine_qemux86-64 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
 SRCREV_machine_qemumips64 ?= "5d05923ecc402c127b92543ee44b890de5c53a7e"
 SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
+SRCREV_meta ?= "7da5624a915368bb93814379e7e1c3bbefae4cae"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index aedfe1b1556e..fbe0ba8ca31b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
 SRCREV_machine_qemux86-64 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
 SRCREV_machine_qemumips64 ?= "1b20066b88c3abdde1f6c449b6562a516b4cce6d"
 SRCREV_machine ?= "021b4aef55b44597587a1ce5879be642b3dca155"
-SRCREV_meta ?= "926c93ae07de2173b4f764d1da6996597a6d2b73"
+SRCREV_meta ?= "9ca50a7edc6bba11f0f9ce1eec3e6004f3043820"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index ded3c6c00e64..b623c8b3fcd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
 SRCREV_machine_qemux86-64 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
 SRCREV_machine_qemumips64 ?= "3183d61d4d00d8b7faf10d11b3da8cf3db432e6f"
 SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "7ca94971d258304e3e3068f7b7ebe425fe5a77d1"
+SRCREV_meta ?= "68e8915786f48996e699272ba33626a44978a14e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0



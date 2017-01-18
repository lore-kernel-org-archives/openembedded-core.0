Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4A56003C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDsa6M026304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:36 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:35 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:20 -0500
Message-ID: <18097aafbd97581e91a4adf9b51faffa7defdf7d.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/14] linux-yocto/4.4/4.8/4.9: netfilter: iptables: enable NAT tables
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:36 -0000
Content-Type: text/plain

This changes adds 'nat' table in iptables. The netfilter side
is already configured for NAT but iptables config was missing.

Further, CONFIG_IP_NF_TARGET* configured below depend on
CONFIG_IP_NF_NAT but remain disabled unless CONFIG_IP_NF_NAT
is explicitly enabled.

CONFIG_IP_NF_TARGET_MASQUERADE is needed by Connman to
support tethering.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
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
index 20ea0dc9b2ca..53a9b5736dda 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "61d7bf47fe27b7dfd9a73b0a6de2d78a29af8b74"
-SRCREV_meta ?= "7da5624a915368bb93814379e7e1c3bbefae4cae"
+SRCREV_meta ?= "4c31a115453dad875dda85786c4c34572d6c64a2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index ce83410d0a1d..5991f2b165b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bafd55e39da7fd7c5d483fdee5b72450df3caf0"
-SRCREV_meta ?= "9ca50a7edc6bba11f0f9ce1eec3e6004f3043820"
+SRCREV_meta ?= "0da38d7c70b06ba69dcc6fa305ecf4edc2669598"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index e41c87487076..1dd3b38362ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1eb33152d655c73193cec17c4de04499e52b2faa"
-SRCREV_meta ?= "68e8915786f48996e699272ba33626a44978a14e"
+SRCREV_meta ?= "0cf14593694d33518aabd4846d50adeeb7f559ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 4fc499c9d892..36e88e34787b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_meta ?= "7da5624a915368bb93814379e7e1c3bbefae4cae"
+SRCREV_meta ?= "4c31a115453dad875dda85786c4c34572d6c64a2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 721e5c4c2094..d2f6c7e71ac7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e274a507b23c23bf0dd6502d0c38fae731c11511"
-SRCREV_meta ?= "9ca50a7edc6bba11f0f9ce1eec3e6004f3043820"
+SRCREV_meta ?= "0da38d7c70b06ba69dcc6fa305ecf4edc2669598"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 613db1164156..f4b03a72cb3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "68e8915786f48996e699272ba33626a44978a14e"
+SRCREV_meta ?= "0cf14593694d33518aabd4846d50adeeb7f559ed"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 77b1b8091219..8142a361f498 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
 SRCREV_machine_qemux86-64 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
 SRCREV_machine_qemumips64 ?= "5d05923ecc402c127b92543ee44b890de5c53a7e"
 SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_meta ?= "7da5624a915368bb93814379e7e1c3bbefae4cae"
+SRCREV_meta ?= "4c31a115453dad875dda85786c4c34572d6c64a2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index fbe0ba8ca31b..c5feac6b2dc6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
 SRCREV_machine_qemux86-64 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
 SRCREV_machine_qemumips64 ?= "1b20066b88c3abdde1f6c449b6562a516b4cce6d"
 SRCREV_machine ?= "021b4aef55b44597587a1ce5879be642b3dca155"
-SRCREV_meta ?= "9ca50a7edc6bba11f0f9ce1eec3e6004f3043820"
+SRCREV_meta ?= "0da38d7c70b06ba69dcc6fa305ecf4edc2669598"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index b623c8b3fcd0..256d3dbea0f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
 SRCREV_machine_qemux86-64 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
 SRCREV_machine_qemumips64 ?= "3183d61d4d00d8b7faf10d11b3da8cf3db432e6f"
 SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "68e8915786f48996e699272ba33626a44978a14e"
+SRCREV_meta ?= "0cf14593694d33518aabd4846d50adeeb7f559ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0



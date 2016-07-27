Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D324C731D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:57:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6RGvAgF008699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Jul 2016 09:57:11 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 09:57:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jul 2016 12:57:04 -0400
Message-ID: <46768c82bdee90ea8c450dfd40c9ef8be68a9d4c.1469638333.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1469638333.git.bruce.ashfield@windriver.com>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/4.4: bump to v4.4.15
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
X-List-Received-Date: Wed, 27 Jul 2016 16:57:15 -0000
Content-Type: text/plain

Updating the 4.4 kernel to take the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index ba3612ca41cd..64b81496d2d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,12 +12,12 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "4800a400d5ace1d4332ee18b01ac1c680e454457"
+SRCREV_meta ?= "8c6158ec5e43a4cae59058af49f70e0406d18091"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.14"
+LINUX_VERSION ?= "4.4.15"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 1592ef6cff96..b32721ba5bbe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.14"
+LINUX_VERSION ?= "4.4.15"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_meta ?= "4800a400d5ace1d4332ee18b01ac1c680e454457"
+SRCREV_machine ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
+SRCREV_meta ?= "8c6158ec5e43a4cae59058af49f70e0406d18091"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 23fdc2f8cbe2..f68fdfa0f738 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d1fcd96376a6ef0e8003914ea5df043ede813f92"
-SRCREV_machine_qemuarm64 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_machine_qemumips ?= "55be46bf1e4c5452a01a3e1f72a6408f38a57fc0"
-SRCREV_machine_qemuppc ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_machine_qemux86 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_machine_qemux86-64 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_machine_qemumips64 ?= "f9bf508ee3fdccebe3554b968b43675cafe0a5a1"
-SRCREV_machine ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
-SRCREV_meta ?= "4800a400d5ace1d4332ee18b01ac1c680e454457"
+SRCREV_machine_qemuarm ?= "75b02cc20216b6a068e1757a997f4e0d405d6ded"
+SRCREV_machine_qemuarm64 ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
+SRCREV_machine_qemumips ?= "e656b69259deb08cfe6d606fb126b4c0810abf64"
+SRCREV_machine_qemuppc ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
+SRCREV_machine_qemux86 ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
+SRCREV_machine_qemux86-64 ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
+SRCREV_machine_qemumips64 ?= "8c40a1bc5e4ece3f72d4ade764087bd0fcc01c38"
+SRCREV_machine ?= "1238684aa5173dc6f431ad1b3c85a37830244824"
+SRCREV_meta ?= "8c6158ec5e43a4cae59058af49f70e0406d18091"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.14"
+LINUX_VERSION ?= "4.4.15"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0



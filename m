Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90EFC6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:39:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u67IdB4W021352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jul 2016 11:39:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Jul 2016 11:39:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 Jul 2016 14:39:04 -0400
Message-ID: <2b247ad683d323669a7789d3eb1daa269c03fd7e.1467916601.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1467916601.git.bruce.ashfield@windriver.com>
References: <cover.1467916601.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/4.1/4.4: x86, power and usb-c mainline backports
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
X-List-Received-Date: Thu, 07 Jul 2016 18:39:13 -0000
Content-Type: text/plain

Updating the 4.1 and 4.4 kernels with mainlin backports for platform/feature
support.

Also updating the kernel meta data to configure and use those new features.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 2fe221182b72..15494b63356b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "68484fa68d060d947fc46b2e85c0c6f2381d3e55"
-SRCREV_meta ?= "e978d15367ec69788c4a10d1e2a65bfa626c5d8c"
+SRCREV_machine ?= "1ab0fb3f54886c143066754df67eb6abe4c5d7f9"
+SRCREV_meta ?= "886dacbd6290bbd5bb0632883f661fb57b232d94"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 86bf8a7ba776..106dc3450804 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "44a610517357619a9ba827a597eef6d7f6e079f3"
+SRCREV_meta ?= "6f6ffd05b919b870b6b97c0200ff1fff4e614563"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 432565f71497..7503dd1b8359 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_meta ?= "e978d15367ec69788c4a10d1e2a65bfa626c5d8c"
+SRCREV_machine ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
+SRCREV_meta ?= "886dacbd6290bbd5bb0632883f661fb57b232d94"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 638b3db9e4bd..1df17848afc6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_meta ?= "44a610517357619a9ba827a597eef6d7f6e079f3"
+SRCREV_machine ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_meta ?= "6f6ffd05b919b870b6b97c0200ff1fff4e614563"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b2cbc6067723..f673609b7fdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "df8f2bd306f5e22590991faee46e28f671fa19b3"
-SRCREV_machine_qemuarm64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_machine_qemumips ?= "1bb60e693b913dacad698bec1cc08b350785e3d1"
-SRCREV_machine_qemuppc ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_machine_qemux86 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_machine_qemux86-64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_machine_qemumips64 ?= "b0e7bb69566a922a661c4902e496dce98cefeab9"
-SRCREV_machine ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
-SRCREV_meta ?= "e978d15367ec69788c4a10d1e2a65bfa626c5d8c"
+SRCREV_machine_qemuarm ?= "ce593534958d0bc6a3d1bc3036f425b9d7d9f5f6"
+SRCREV_machine_qemuarm64 ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
+SRCREV_machine_qemumips ?= "f1566b7d9fafd16b5dd98a313ffae1cab493a1c3"
+SRCREV_machine_qemuppc ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
+SRCREV_machine_qemux86 ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
+SRCREV_machine_qemux86-64 ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
+SRCREV_machine_qemumips64 ?= "8bac527ccf5cef97eac0dec7d94fb8cb668d7e13"
+SRCREV_machine ?= "6ea8af4a9bc8797d71e14d9e641d9e28b1dee917"
+SRCREV_meta ?= "886dacbd6290bbd5bb0632883f661fb57b232d94"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 49ffd8deeca8..a91b9cedc70d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6f2317f8a00a3eb6a2b28ca51f336f61eb6fe160"
-SRCREV_machine_qemuarm64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_machine_qemumips ?= "9fc8fc49e5065f1ee76e964a4c0257291ab3e62a"
-SRCREV_machine_qemuppc ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_machine_qemux86 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_machine_qemux86-64 ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_machine_qemumips64 ?= "d1c1f36412d196b560ed9f19392e291b5492b94c"
-SRCREV_machine ?= "13852755ecbf491848afbe40e66fc152bc70915b"
-SRCREV_meta ?= "44a610517357619a9ba827a597eef6d7f6e079f3"
+SRCREV_machine_qemuarm ?= "e26115bb79a4ea6a26c6052766f1e65553841d51"
+SRCREV_machine_qemuarm64 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_machine_qemumips ?= "1b5479c3dd579143c03cfa97c25346104aff3f30"
+SRCREV_machine_qemuppc ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_machine_qemux86 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_machine_qemux86-64 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_machine_qemumips64 ?= "565650ff074c7438081bd2ff0db4d7208d666ddf"
+SRCREV_machine ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_meta ?= "6f6ffd05b919b870b6b97c0200ff1fff4e614563"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0



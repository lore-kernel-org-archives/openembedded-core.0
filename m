Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF0E6D030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 04:23:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H4NVj6001487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2013 21:23:31 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 16 Oct 2013 21:23:31 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 17 Oct 2013 00:23:29 -0400
Message-ID: <994b6ea678464739ee854a84ad7e706927fb3af9.1381983654.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381983654.git.bruce.ashfield@windriver.com>
References: <cover.1381983654.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.10: MinnowBoard support
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
X-List-Received-Date: Thu, 17 Oct 2013 04:23:33 -0000
Content-Type: text/plain

Updating the 3.10 SRCREVs to update minnowboard support via the following changes:

   3F6C824 pch_gbe: Add MinnowBoard support
   9f52743 pch_gbe: Use PCH_GBE_PHY_REGS_LEN instead of 32
   ec7b5e6 pch_gbe: use managed functions pcim_* and devm_*
   fd8bf50 pch_gbe: convert pr_* to netdev_*
   9b278e9 serial: pch_uart: fix compilation warning
   8982d79 serial: pch_uart: Fix signed-ness and casting of uartclk related fields
   cdbf456 serial: pch_uart: Remove __initdata annotation from dmi_table
   9e7c25e pch_uart: Use DMI interface for board detection

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 1a85995..603edde 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "f1e003e9441f0366d7b9a2209ef3108438745ea3"
-SRCREV_machine_qemuppc ?= "12be459359d5b20dbf856aa3649304c6f618d420"
+SRCREV_machine ?= "cea2d99f298cd3e356f273631a647c93a178881f"
+SRCREV_machine_qemuppc ?= "a93e52c77f25a018be54c82e3ccfa0a50555117b"
 SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 1405e411..e0b17dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.11"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
+SRCREV_machine ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
 SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
 
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index fa37e8a..9b280cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "aa1fa3cec7bd6e47f29acc5b5fbffddc16569883"
-SRCREV_machine_qemumips  ?= "5b908fd12f60de1e51e932c5df477a49b0ab2b40"
-SRCREV_machine_qemuppc ?= "e80029ac30022c554e916ed438435ecc03cc2cea"
-SRCREV_machine_qemux86 ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_machine_qemux86-64 ?= "e1aa804148370cda6f85640281af156ffa007d52"
-SRCREV_machine_qemumips64 ?= "6973844d304411893420a7e57545edc4dc854bd7"
-SRCREV_machine ?= "e1aa804148370cda6f85640281af156ffa007d52"
+SRCREV_machine_qemuarm ?= "07224529d7ceb1e16eb815b8dd4c03ad9d58653d"
+SRCREV_machine_qemumips  ?= "7747c5a158a99b8a668fd526f1f7f1f7f7e03d3e"
+SRCREV_machine_qemuppc ?= "d63375e4b0a2de3ba110b83f78d6be6e01ec5c9e"
+SRCREV_machine_qemux86 ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
+SRCREV_machine_qemux86-64 ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
+SRCREV_machine_qemumips64 ?= "9a4f9f4d44fdcd25fe365216b366bc346efb23d0"
+SRCREV_machine ?= "3f6c8243ed67011f70b27952d42657cf3a2c3115"
 SRCREV_meta ?= "452f0679ea93a6cb4433bebd7177629228a5cf68"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2



Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD76A6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 16:13:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3OGDudj015437
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Apr 2015 09:13:57 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 24 Apr 2015 09:13:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Apr 2015 12:13:54 -0400
Message-ID: <a1aabfe0e4df042fc6a0d3d05f076f25e5ac180c.1429891826.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429891826.git.bruce.ashfield@windriver.com>
References: <cover.1429891826.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/3.19: configuration updates and stable integration
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
X-List-Received-Date: Fri, 24 Apr 2015 16:13:56 -0000
Content-Type: text/plain

Bumping the linux-yocto 3.19 SRCREVs to integrate the 3.19.5 korg
stable updates, as well as the following meta data changes:

  205aca0c1241 meta: intel-common: Enable USB-based Bluetooth hardware
  b6a810e8e808 meta: features/bluetooth: add support for USB Bluetooth hardware
  767f3fa34680 common-pc-drivers: Add CONFIG_EEPROM_AT24
  e308b2c52519 intel-core*: Add Braswell soc support
  8c1c74d5052b braswell: Add features/soc/braswell

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 0631c5e55156..15fc536e0a41 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "3.19.2"
+LINUX_VERSION ?= "3.19.5"
 
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
-SRCREV_meta ?= "9e70b482d3773abf92c9c5850e134cbca1d5651f"
+SRCREV_machine ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
+SRCREV_meta ?= "1b28e65444c0da26c347eba6272984547ab4983b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 9b19eb299b16..e47e22b39695 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,19 +11,19 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "473e2f3788730c51e82714a9785325b6308f6762"
-SRCREV_machine_qemuarm64 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
-SRCREV_machine_qemumips ?= "d43f1cbf282d020f7aa31d68a54b2876d2c0e81b"
-SRCREV_machine_qemuppc ?= "35de413056b86191963ffe686913da31b978a9b3"
-SRCREV_machine_qemux86 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
-SRCREV_machine_qemux86-64 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
-SRCREV_machine_qemumips64 ?= "d35649ef8cbb0a0404be5c721377b138866181ad"
-SRCREV_machine ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
-SRCREV_meta ?= "9e70b482d3773abf92c9c5850e134cbca1d5651f"
+SRCREV_machine_qemuarm ?= "4f9b327ff33521c08ed279891e2a2099b5504d0e"
+SRCREV_machine_qemuarm64 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
+SRCREV_machine_qemumips ?= "03b975caa49e6e1693d6fe5fec8f316e0481ead5"
+SRCREV_machine_qemuppc ?= "9a3edc9c341e6f57423f2b4b218b83a84fc2726d"
+SRCREV_machine_qemux86 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
+SRCREV_machine_qemux86-64 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
+SRCREV_machine_qemumips64 ?= "f631de1c3df29a85a4b882acf19682fe05eec0f3"
+SRCREV_machine ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
+SRCREV_meta ?= "1b28e65444c0da26c347eba6272984547ab4983b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.19.2"
+LINUX_VERSION ?= "3.19.5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0



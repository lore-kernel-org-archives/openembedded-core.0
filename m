Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 249B46E667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 01:19:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6D1JkZJ014096
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 12 Jul 2016 18:19:46 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jul 2016 18:19:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Jul 2016 21:19:35 -0400
Message-ID: <fcb12708f28ce176ffdc2b3ab9c84b274c9bbbb0.1468372600.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1468372600.git.bruce.ashfield@windriver.com>
References: <cover.1468372600.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/4.1: pinctrl backports
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
X-List-Received-Date: Wed, 13 Jul 2016 01:19:47 -0000
Content-Type: text/plain

Integrating the following mainline commits:

  pinctrl: make pinctrl_register() return proper error code
  pinctrl: Remove .owner field
  pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt8127
  pinctrl: mediatek: Add Pinctrl/GPIO driver for mt6397.
  pinctrl: add imx7d support
  pinctrl: sirf: add sirf atlas7 pinctrl and gpio support
  pinctrl: Add Pistachio SoC pin control driver
  pinctrl: lpc18xx: add the missing group function map
  pinctrl: lpc18xx: create pin cap lookup helper
  pinctrl: add lpc18xx pinctrl driver

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 0cba9871f9ce..b9b6773a4e8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dc71da8bddd86d34896d97291e0d84c29fe4806d"
+SRCREV_machine ?= "04614e9e02701c6a4254d7cc040d72d24bad3d8c"
 SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 8852f08c5e00..9a95c159622b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.27"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_machine ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
 SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 50e10489e943..1931943b8e5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f217a40e5b17deb87ed3859b29b1c355e3bb4abc"
-SRCREV_machine_qemuarm64 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
-SRCREV_machine_qemumips ?= "7f1ea2fe2cf42f117c37cd174236e07eba576382"
-SRCREV_machine_qemuppc ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
-SRCREV_machine_qemux86 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
-SRCREV_machine_qemux86-64 ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
-SRCREV_machine_qemumips64 ?= "7d7a10a3c4465eca0e0879b3596da9b013ed3bb8"
-SRCREV_machine ?= "15cf090ded5157e67302313bff9da0fa056e8ea9"
+SRCREV_machine_qemuarm ?= "c29bbcccfcecbf840e60ddf8c16eb5f34d991eb1"
+SRCREV_machine_qemuarm64 ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
+SRCREV_machine_qemumips ?= "aba568f531b31b2f802d1c08f4821177a0354da7"
+SRCREV_machine_qemuppc ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
+SRCREV_machine_qemux86 ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
+SRCREV_machine_qemux86-64 ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
+SRCREV_machine_qemumips64 ?= "a65235597cef00d9a77def57622ac2dc31bb850e"
+SRCREV_machine ?= "73bd4dd4a46970e4a599d3d02d60e40ab37b4498"
 SRCREV_meta ?= "cab4fec4b7ab0efae0f44c1ec1836c035a9b78fe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0



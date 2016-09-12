Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6B92731D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 18:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8CIGZKY026853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Sep 2016 11:16:35 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 12 Sep 2016 11:16:35 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 12 Sep 2016 14:16:31 -0400
Message-ID: <924accb9f4101282ad0fb3417fdb48e1439679d8.1473704020.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1473704020.git.bruce.ashfield@windriver.com>
References: <cover.1473704020.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.1: update to 4.1.32
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
X-List-Received-Date: Mon, 12 Sep 2016 18:16:37 -0000
Content-Type: text/plain

Integrating the korg stable update

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index f0d6a81a9c54..4308a07a9765 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b88e2b5805213daeb0136fdd8c840dc0254a3d21"
-SRCREV_meta ?= "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
+SRCREV_machine ?= "ee83bffe0f76032fe0a0b7fde436f0f596101df2"
+SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.30"
+LINUX_VERSION ?= "4.1.32"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 092a224451e1..2294a3db87da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.30"
+LINUX_VERSION ?= "4.1.32"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
-SRCREV_meta ?= "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
+SRCREV_machine ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
+SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index e23d7da58881..f4006b74d096 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9c5e96205316d167379d101d808a6cda93adc335"
-SRCREV_machine_qemuarm64 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
-SRCREV_machine_qemumips ?= "9e531cb59dd7dfa2026637cc456a7bdcbdb50275"
-SRCREV_machine_qemuppc ?= "32968ddd9357f72dfd427f5b3eda62c4a49833c7"
-SRCREV_machine_qemux86 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
-SRCREV_machine_qemux86-64 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
-SRCREV_machine_qemumips64 ?= "106ed721d21c595dfb993a8990c3a29830dfc166"
-SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
-SRCREV_meta ?= "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
+SRCREV_machine_qemuarm ?= "4db58705727e27bea8ccf805bd5c7d04d2d029ed"
+SRCREV_machine_qemuarm64 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
+SRCREV_machine_qemumips ?= "d6237b3b244b894d4b3479ecf37acef041416dfa"
+SRCREV_machine_qemuppc ?= "8520e65497ae10e14c38c76920a3457dc64349bf"
+SRCREV_machine_qemux86 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
+SRCREV_machine_qemux86-64 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
+SRCREV_machine_qemumips64 ?= "d0524e144cd15a3c0edf768f68400968a4477cbe"
+SRCREV_machine ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
+SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.30"
+LINUX_VERSION ?= "4.1.32"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0



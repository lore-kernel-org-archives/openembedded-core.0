Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFAB7883F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QDxUcm003796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 05:59:30 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:16 -0500
Message-ID: <84e4472d62a69c67bd2a053a334c45a405fa3ddf.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] linux-yocto/4.12: coffeeLake-s graphics and audio support
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:29 -0000
Content-Type: text/plain

Integrating the following backports to enable graphics and audito for
the coffeelake-s board:

   e0256c639caf ALSA: hda/realtek - Fix ALC700 family no sound issue
   a3bd263fa5f3 ALSA: hda - Add model string for Intel reference board quirk
   c12ee7fbc382 ALSA: hda/realtek - Enable jack detection function for Intel ALC700
   ff8d2c896572 ALSA: hda: Add Cannonlake PCI ID
   88ee594b72e6 ALSA: hda - Fix unbalance of i915 module refcount
   c7d38955ce7f ALSA: hda - Fix doubly initialization of i915 component
   5ca2b95b131f ALSA: hda - Bind with i915 component before codec binding
   648c24f8d385 ALSA: hda - Add AZX_DRIVER_SKL for simplification
   f406fd3d0c63 drm/i915/cnl: Implement CNL display init/unit sequence
   1e07bbf553c0 drm/i915/cnl: Implement .set_cdclk() for CNL
   901336fddca0 drm/i915/cnl: Implement .get_display_clock_speed() for CNL
   be7a1f129e42 drm/i915/cfl: Coffee Lake reuses Kabylake DMC.
   ee6ac7be14c3 drm/i915/huc: Load HuC on Coffee Lake
   35a913347462 drm/i915/guc: Load GuC on Coffee Lake
   443e68bbbe46 drm/i915/cfl: Add Coffee Lake PCI IDs for U Sku.
   0ef98275c834 drm/i915/cfl: Add Coffee Lake PCI IDs for H Sku.
   594a1d673403 drm/i915/cfl: Add Coffee Lake PCI IDs for S Skus.
   8732a393ce1e drm/i915/cfl: Introduce Display workarounds for Coffee Lake.
   676a4c1b92ab drm/i915/cfl: Coffee Lake uses CNP PCH.
   f5eb462f524f drm/i915/cfl: Introduce Coffee Lake platform definition.
   8a3a080c7028 drm/i915/cnl: Also need power well sanitize.
   b5620b75db38 drm/i915/cnl: Add power wells for CNL
   b747f1806205 drm/i915/cnl: Cannonlake has same MOCS table than Skylake.
   fc8aee64eaeb drm/i915/cnl: Configure EU slice power gating.
   a9b5e8f00440 drm/i915/cnl: Cannonlake has 4 planes (3 sprites) per pipe
   03a55f9a6082 drm/i915/cnl: add IS_CNL_REVID macro
   7236995c6b04 drm/i915/cnl: Add Cannonlake PCI IDs for Y-skus.
   b2f7e93bcb56 drm/i915/cnl: Add Cannonlake PCI IDs for U-skus.
   30c5a76e52a6 drm/i915/cnl: Cannonlake uses CNP PCH.
   27bb6860ebf1 drm/i915/cnl: Introduce Cannonlake platform defition.
   b4d4cf3529e0 drm/i915/cnp: Panel Power sequence changes for CNP PCH.
   ee2e2af1cf34 drm/i915/cnp: add CNP gmbus support
   35964d298c7d drm/i915/cnp: Backlight support for CNP.
   ccfab7d5ae88 drm/i915/cnp: Get/set proper Raw clock frequency on CNP.
   abdbbc6157d7 drm/i915/cnp: Add PCI ID for Cannonpoint LP PCH
   87482dfba004 drm/i915/cnp: Introduce Cannonpoint PCH.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 4c6921db516e..d20e6c614b64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b02d6a3f5b38dd38b5e0befb5961bd316a2daa97"
+SRCREV_machine ?= "1b4229c4ef99843401ec2f522b63c9a64ed219a4"
 SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 5658e49d676e..97b90daa1d54 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_machine ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
 SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 7ffe0d50ff32..c27801a080e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "48ae2ebeea13e8d4c405a9a6930814ddfb2faf56"
-SRCREV_machine_qemuarm64 ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
-SRCREV_machine_qemumips ?= "d8ffb4a5bf10ce1deeeb1a3b33a010e86bc4ec8b"
-SRCREV_machine_qemuppc ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
-SRCREV_machine_qemux86 ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
-SRCREV_machine_qemux86-64 ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
-SRCREV_machine_qemumips64 ?= "96e53c9bac505c8783fa89edb5e047e99ab7784c"
-SRCREV_machine ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_machine_qemuarm ?= "e984c8a333b87570a3d28384f0473884134e9535"
+SRCREV_machine_qemuarm64 ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
+SRCREV_machine_qemumips ?= "a81c25e8409d8a1dfdb353a03553a57c25e50755"
+SRCREV_machine_qemuppc ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
+SRCREV_machine_qemux86 ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
+SRCREV_machine_qemux86-64 ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
+SRCREV_machine_qemumips64 ?= "a39650a75fbd15424c51963d893e7806d9fdbe8b"
+SRCREV_machine ?= "e0256c639caf7fb1b977cf34c5e15c86dd643c85"
 SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0



Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB4F7017D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2UCPGCV026650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:16 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:25:05 -0400
Message-ID: <589e9f9f17aa2431079c69c8bd695c9cdc09b517.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] linux-yocto/4.4: drm/i915/skl: Fix DMC load on Skylake J0 and K0
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:16 -0000
Content-Type: text/plain

[
    NUC6 (Skylake) graphics firmware fails to load without this patch.

    From: Mat Martineau <mathew.j.martineau@linux.intel.com>

    commit a41c8882592fb80458959b10e37632ce030b68ca upstream.

    The driver does not load firmware for unknown steppings, so these new
    steppings must be added to the list.

    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Mat Martineau <mathew.j.martineau@linux.intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Link: http://patchwork.freedesktop.org/patch/msgid/1454023163-25469-1-git-send-email-mathew.j.martineau@linux.intel.com
]

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index dffe96656a2f..ca8a3bc70094 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "dfa88200087a7ef73741383c05c14ff2f3978947"
-SRCREV_meta ?= "194a6c1c4b783cff90e925ec26fd77ff0e67fdd5"
+SRCREV_machine ?= "8d68782597a31dd55c018c0be7d6799f89aadbf7"
+SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 07c33649aaac..8276dd2805ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_meta ?= "194a6c1c4b783cff90e925ec26fd77ff0e67fdd5"
+SRCREV_machine ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 4b57766585ee..050d2ebeb8a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "861adc8d32fbb0c1f14fb9b7b67222ab711473a1"
-SRCREV_machine_qemuarm64 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_machine_qemumips ?= "0b21ee5897cc49c94f42fca9cea4665f76ae7e0e"
-SRCREV_machine_qemuppc ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_machine_qemux86 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_machine_qemux86-64 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_machine_qemumips64 ?= "8b25338045fdb88a9cdff808003102643f03083e"
-SRCREV_machine ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_meta ?= "194a6c1c4b783cff90e925ec26fd77ff0e67fdd5"
+SRCREV_machine_qemuarm ?= "435a6d77355ee83be321d9ee69d448eb530fb8e1"
+SRCREV_machine_qemuarm64 ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_machine_qemumips ?= "fb72c22307829d134fc6584fe4735377110a2fc2"
+SRCREV_machine_qemuppc ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_machine_qemux86 ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_machine_qemux86-64 ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_machine_qemumips64 ?= "2fd1a928c13bd7eac5e1086859355314e210b909"
+SRCREV_machine ?= "10527a38c88d3e2c314c9e49d1eecb9da56c2d85"
+SRCREV_meta ?= "28bff6d39803ad83f83e353f158fc1aa14d5492d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0



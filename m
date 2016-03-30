Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A66E260017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:26:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U7Q6RO002161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:26:07 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:26:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:25:44 -0700
Message-ID: <3ea4adf79751bb2c9a140cec6900490b52c5a6b6.1459322726.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459322726.git.liezhi.yang@windriver.com>
References: <cover.1459322726.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] linux-yocto 4.4: enable overlayfs
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
X-List-Received-Date: Wed, 30 Mar 2016 07:26:06 -0000
Content-Type: text/plain

So that iso can work well, otherwise the iso is readonly and there would
be errors. The other way is aufs, but overlayfs is more pupolar and had
been merged by kernel mainline.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 5ab4da6..1d5b435 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
 SRCREV_machine_qemux86-64 ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
 SRCREV_machine_qemumips64 ?= "8b25338045fdb88a9cdff808003102643f03083e"
 SRCREV_machine ?= "3d2455f9da30f923c6bd69014fad4cc4ea738be6"
-SRCREV_meta ?= "32e84686fc87413612e108cc4ab0e7a0d21cb4fd"
+SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
@@ -34,7 +34,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/overlayfs/overlayfs.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-- 
2.7.4



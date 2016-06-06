Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF9F6E668
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 08:15:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u568FcI9028707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Jun 2016 01:15:39 -0700 (PDT)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.21.120) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 6 Jun 2016 01:15:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 Jun 2016 04:15:29 -0400
Message-ID: <2499d2c85c7bc874e899c3b27d2de3962fcabc02.1465200824.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465200824.git.bruce.ashfield@windriver.com>
References: <cover.1465200824.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.4: mmc backports
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
X-List-Received-Date: Mon, 06 Jun 2016 08:15:44 -0000
Content-Type: text/plain

Backporting the following mcc commits to the 4.4 repo. These fix issues
being seen on broxton based boads:

  1f3e98df094c mmc: core: Add a facility to "pause" re-tuning
  b27fcd162327 mmc: block: Pause re-tuning while switched to the RPMB partition
  9aa07b4e274e mmc: block: Always switch back to main area after RPMB access

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 95df10184463..0186856b8595 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.12"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_machine ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
 SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index cf3df6e6feda..48f997353c17 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "45b01a52f2a1593f7858cff130811c587d9623a9"
-SRCREV_machine_qemuarm64 ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
-SRCREV_machine_qemumips ?= "46a71bdb936b8a5db5e85dfcc82fa6121d9aa2e5"
-SRCREV_machine_qemuppc ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
-SRCREV_machine_qemux86 ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
-SRCREV_machine_qemux86-64 ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
-SRCREV_machine_qemumips64 ?= "9ee2a571138d4ca993ce03ce753c1cb776fdd441"
-SRCREV_machine ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_machine_qemuarm ?= "ae04be16985c86803d8016b06aa57c02fe63cab3"
+SRCREV_machine_qemuarm64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemumips ?= "1d16db0bce02f4f46a925e5425194de8d25a926e"
+SRCREV_machine_qemuppc ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemux86 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemux86-64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
+SRCREV_machine_qemumips64 ?= "6fe42d5321cd24411c2a4b7f2aac8a01dfa82b8f"
+SRCREV_machine ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
 SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0



Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9E97826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:58:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L2wYRF017253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 19:58:34 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 19:58:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 20 Aug 2017 22:58:22 -0400
Message-ID: <847d9000180cafedb23c60a6673adcec62ca67a1.1503283308.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1503283308.git.bruce.ashfield@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/4.10: CVE & misc fixes
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
X-List-Received-Date: Mon, 21 Aug 2017 02:58:33 -0000
Content-Type: text/plain

Updating the 4.10 SRCREVs to import the following changes:

  65370fa249e2 drm/vmwgfx: limit the number of mip levels in vmw_gb_surface_define_ioctl()
  530ec12a0cb0 ACPICA: Namespace: fix operand cache leak
  b1098b5bbded char: lp: fix possible integer overflow in lp_setup()
  56ee0c7811e5 dccp/tcp: do not inherit mc_list from parent
  9f6cbd022bba nfsd: encoders mustn't use unitialized values in error cases
  084036ebc243 nfsd: fix undefined behavior in nfsd4_layout_verify
  973f780eeaa6 xen-blkback: don't leak stack data via response ring
  20c4b5015fea brcmfmac: fix possible buffer overflow in brcmf_cfg80211_mgmt_tx()
  1dff0f28b490 ipx: call ipxitf_put() in ioctl error path
  d666a8e60a45 mm: fix new crash in unmapped_area_topdown()
  73d059ba1a17 mm: larger stack guard gap, between vmas

Which address the following CVEs:

  CVE-2017-8890
  CVE-2017-1000363
  CVE-2017-11472
  CVE-2017-7346
  CVE-2017-1000380
  CVE-2017-7541
  CVE-2017-10911

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 9cb2f1bea46f..cc6e522b4b8e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "d6ece632214e3bee843e485487e5f0d6939630a8"
+SRCREV_machine ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
+SRCREV_meta ?= "6ac2680ca4316fe111cddec37def7757843bbe86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index bbbff1b9e9c8..b136bf095034 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.10.17"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "d6ece632214e3bee843e485487e5f0d6939630a8"
+SRCREV_machine ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
+SRCREV_meta ?= "6ac2680ca4316fe111cddec37def7757843bbe86"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index e52db7be5f7e..4107891f6e8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3926e386306fe0ae92feae45bc47e4c013daa1fc"
-SRCREV_machine_qemuarm64 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_machine_qemumips ?= "a038a5932f3be820f42d78f4e47850987ad72ce3"
-SRCREV_machine_qemuppc ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_machine_qemux86 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_machine_qemux86-64 ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_machine_qemumips64 ?= "b442c964432938cbe10c4cc578260353045af980"
-SRCREV_machine ?= "6648a34e00c55a0634b39e661dd6ba14dd106473"
-SRCREV_meta ?= "d6ece632214e3bee843e485487e5f0d6939630a8"
+SRCREV_machine_qemuarm ?= "4c652d50c67050422da4621cc6421ecb86b31c31"
+SRCREV_machine_qemuarm64 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
+SRCREV_machine_qemumips ?= "0a632fa7f9615ad1b2488a300846a7e925e6591a"
+SRCREV_machine_qemuppc ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
+SRCREV_machine_qemux86 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
+SRCREV_machine_qemux86-64 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
+SRCREV_machine_qemumips64 ?= "75c22c1be83bf7894af78a36b3e3c5af08ce4d7b"
+SRCREV_machine ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
+SRCREV_meta ?= "6ac2680ca4316fe111cddec37def7757843bbe86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
-- 
2.5.0



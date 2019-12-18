Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 528A57FF35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:07:41 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t3so1995717qtr.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+BpBOYeGinChVbGEuOh8ljXUy+Md94b/xvqr2Ipa83E=;
	b=iBeTpOmn4s8PQhBYnlvjCEDjWvYutPJRmU5wo2HW7Rdo/Zokn8CROjeQ0X5ZbN9iq4
	bcoGPXllJEb4us0odfX7scUOw/aKRj6paWCaVUkulFrC/N/xMegJqUTGO8DSml3vumki
	UU+sW7sFa/H5z748DozeQssUXxSpPQsWOeYLkysTnXQ1ZBRJZZiHhNxi4AZCk5UQVdRR
	wis19StqAkcu6daZxH5AKq5n3BMdC8dKMB+7lUgYBzQxdgqPE8fM9rdxNYq1xVOA8qlI
	TACX5exKev1cZ1ceCSKeeKN1bajp9kV8vYp8ypiEi+Li6Mro2ueiClBAkCaiiUZIN646
	HRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+BpBOYeGinChVbGEuOh8ljXUy+Md94b/xvqr2Ipa83E=;
	b=q993fQIC55vJ+q7GmMBKRLkHvyeCj9ZeeoasJVCKguNYTM4dKbURlnkZaht6VkF2Cz
	6a4CKu87Ukk8fSD2LQw9ypTc98kXwVfg8HtuvrJwpxfma5rlPMDkNl5JPFVh+70FyZpb
	Jt46BqBkRibPmPajcMKj01h4vJ47Iki1oIbVSviV+1UBSVpFyaKe8ATeXXvjGiY4xHv4
	HozgB81OdWNbAGKpqbAwyt5Uz+JJ+QqaWu7D6+A52zkunq5xrRUUDcff2qh19G1dBAoO
	3AoG0LdqVdyhApyQN/zMXHzenMFlg2V5IC7sYMZ+1KptQ01jVDhufs/A57x7daCHBB4i
	grJA==
X-Gm-Message-State: APjAAAVMZg1wfKXbkHPFB1+u5O5DOuhPcNLPVdJ5nNN4EFc9geaLBetM
	kGRkyl50x/dOhz+8T3ycxtc=
X-Google-Smtp-Source: APXvYqx15s3DOi2/y868O++oW4y8+PG6FTr/RisLJBk1pCFq3aIv24YkgncGDsAHXnVhqOzRGFZWkg==
X-Received: by 2002:ac8:4244:: with SMTP id r4mr2206757qtm.169.1576678061997; 
	Wed, 18 Dec 2019 06:07:41 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id k14sm668918qki.66.2019.12.18.06.07.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:07:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Dec 2019 09:07:29 -0500
Message-Id: <84cdc8ac96d72eaae89e06b3513647097c6a7ef1.1576677592.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1576677592.git.bruce.ashfield@gmail.com>
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/5.2: update to v5.2.23
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
X-List-Received-Date: Wed, 18 Dec 2019 14:07:41 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    6e5893ab1fe2 Linux 5.2.23
    86ac741509b1 kvm: x86: mmu: Recovery of shattered NX large pages
    c553a0a399c9 kvm: Add helper function for creating VM worker threads
    f2bf2c447af6 kvm: mmu: ITLB_MULTIHIT mitigation
    f06ad290c8f0 KVM: x86: make FNAME(fetch) and __direct_map more similar
    18b180d7a0f1 kvm: x86, powerpc: do not allow clearing largepages debugfs entry
    ff893d92a664 Documentation: Add ITLB_MULTIHIT documentation
    f9adaf5c4457 cpu/speculation: Uninline and export CPU mitigations helpers
    0b2c4ab2b97c x86/cpu: Add Tremont to the cpu vulnerability whitelist
    eaa0b155027e x86/bugs: Add ITLB_MULTIHIT bug infrastructure
    dccf9a56da2e x86/speculation/taa: Fix printing of TAA_MSG_SMT on IBRS_ALL CPUs
    32bd35cc9e6c x86/tsx: Add config options to set tsx=on|off|auto
    c4ed63015b6a x86/speculation/taa: Add documentation for TSX Async Abort
    43e4f038964c x86/tsx: Add "auto" option to the tsx= cmdline parameter
    995c701aa712 kvm/x86: Export MDS_NO=0 to guests when TSX is enabled
    085db27a9d8a x86/speculation/taa: Add sysfs reporting for TSX Async Abort
    0d7366963e51 x86/speculation/taa: Add mitigation for TSX Async Abort
    10d64704b2e6 x86/cpu: Add a "tsx=" cmdline option with TSX disabled by default
    e97aa6c96e2e x86/cpu: Add a helper function x86_read_arch_cap_msr()
    817956f7cd90 x86/msr: Add the IA32_TSX_CTRL MSR
    4ad18dc35ed7 x86/cpu: Move arch_smt_update() to a neutral place

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.2.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index b2214241dd..60a98c518f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "64ea323b90275e7f14d89377c792bbfbb18c44a8"
+SRCREV_machine ?= "b26332b386cedfa5084fb373f78fb129523288fa"
 SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.22"
+LINUX_VERSION ?= "5.2.23"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 35c7b0dec7..24d08860dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.22"
+LINUX_VERSION ?= "5.2.23"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8e35cd4c39258d1164e06351da55a21913664cae"
-SRCREV_machine ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_machine_qemuarm ?= "d919a90f1f3a8234d8eb60b0a03b07a90d7d3234"
+SRCREV_machine ?= "4642ca5f2e968a24227eec72c363117397358c28"
 SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index f2c56c904f..b7146fa23d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "93335e3d0acb7454c83bce7953ee9d03a35efc9a"
-SRCREV_machine_qemuarm64 ?= "d17d6745a19dddda645a6e934652eef06151806b"
-SRCREV_machine_qemumips ?= "e232ed9ae26f63b388ae0f3fb9d543a4d369db35"
-SRCREV_machine_qemuppc ?= "d17d6745a19dddda645a6e934652eef06151806b"
-SRCREV_machine_qemuriscv64 ?= "d17d6745a19dddda645a6e934652eef06151806b"
-SRCREV_machine_qemux86 ?= "d17d6745a19dddda645a6e934652eef06151806b"
-SRCREV_machine_qemux86-64 ?= "d17d6745a19dddda645a6e934652eef06151806b"
-SRCREV_machine_qemumips64 ?= "5bc76928dd614b75cfa6c1606362c03f69293f7e"
-SRCREV_machine ?= "d17d6745a19dddda645a6e934652eef06151806b"
+SRCREV_machine_qemuarm ?= "c823471bf471b472ff36b3c2ca1fed70ca972eda"
+SRCREV_machine_qemuarm64 ?= "4642ca5f2e968a24227eec72c363117397358c28"
+SRCREV_machine_qemumips ?= "e3f9bf8ec923e973dc2c49512cbaf45f8f88e8b5"
+SRCREV_machine_qemuppc ?= "4642ca5f2e968a24227eec72c363117397358c28"
+SRCREV_machine_qemuriscv64 ?= "4642ca5f2e968a24227eec72c363117397358c28"
+SRCREV_machine_qemux86 ?= "4642ca5f2e968a24227eec72c363117397358c28"
+SRCREV_machine_qemux86-64 ?= "4642ca5f2e968a24227eec72c363117397358c28"
+SRCREV_machine_qemumips64 ?= "6b57735a83936356279cf553329e72688b4f17f9"
+SRCREV_machine ?= "4642ca5f2e968a24227eec72c363117397358c28"
 SRCREV_meta ?= "6eac47a0d7934f9431020b1ea75b943e7327983d"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.22"
+LINUX_VERSION ?= "5.2.23"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1



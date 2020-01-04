Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 042657F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so24906333pfs.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=X5rG2Cv0I2CarEsBQwd+uTRHuKTV5l8p9OLev2p/Nfw=;
	b=GzPtxOqFV2gKMNZKOuA+3xF+livuQ7p0xrDbgs/ftFqJOUAJgSmTC+9MpZqOBtkh2/
	9/1VWESTk0s51FU1wxlqzjQsYLe19WCRfJhUW+OSySoBKVSYpbJY3BZgHvfMFFWc568d
	fryfiYuOjhtnuEVp33PJmvyyR6l9ru/JVoAIPUqQt/X/6H+8TuzGrTGnlENrUNS6z9DA
	DFcBwWyjGpgTWLEjYLuDWn1717gS2hM1lIJ7p4KXZ7bHUfp2niF1LCFzGdeWJUfRIHLH
	xYC6beobnEh+JPifZmrNEj8f6tP3Y7Nfbu5Lc0cXsitaaQiDhkiA+1ykZRFDDPgrok2w
	gA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X5rG2Cv0I2CarEsBQwd+uTRHuKTV5l8p9OLev2p/Nfw=;
	b=Zs/vZ958XiMSDTctGzWlVvwEHImGWK/M0hV+3kyspXyZ3T82l0b+dPZE4L2ihqd6Pv
	853EdkjU0PgPpEI0UC7wY6fyxnLn63kUfmagmsRS/eNTL8IJ3II2I9EZW+YKWxmiIfBR
	wt/5BGSyuatnaGy+36Ke1Ga9oy9BeM45/3e8XUE/o8Dkh7N50Ek1Z/DO8RWJNB00s7/J
	vFYmjQIcDoX7QHGFl5EyMqPS8apm9nhadBIPNh4T+NhyyTG2DY++dCsRR64N6fTjNoUM
	8l1fA3AAdEnb3ISK8hL33lM84qhFuSWoA05NACsyQrSRxL9FJUEf975oTkcX3KxHSiqn
	AOHg==
X-Gm-Message-State: APjAAAU8+zr/ufr0PG5SCiu6ujjzpAfw7rLEnJcHYRZENcCh0XGzDRNL
	e3I4UYI8mei4oQHZXI0LVw+qSjzUQUo=
X-Google-Smtp-Source: APXvYqy1RiOav3Z4k2dMolLv9IiR5VvvON2WWL7xZyAoAoPV6vGfFq/EmMXSoOb1d28EllWY8EPG1A==
X-Received: by 2002:a63:7d6:: with SMTP id 205mr104841141pgh.131.1578155181672;
	Sat, 04 Jan 2020 08:26:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:50 -0800
Message-Id: <d078872236c56f164562e2466920cbc3b2cdd8df.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 09/29] linux-yocto/5.2: update to v5.2.23
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:21 -0000

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
(cherry picked from commit 441e9dc823fdf4fd9da2332ec63afcf6098773af)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1



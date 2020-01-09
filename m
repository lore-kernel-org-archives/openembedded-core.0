Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id E26457FE64
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:59 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id ay11so2013641plb.0
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=X5rG2Cv0I2CarEsBQwd+uTRHuKTV5l8p9OLev2p/Nfw=;
	b=OSgeCyUL4FMPGA7XvsYlnwbWcSgeP1xGc6GunWQdFXbjgIfiVmrm+GmoKU/yMjZSQ4
	kYFgt4M51g5EXHG3uJpPiLUa00g8xqM9APlaB9aRZPPYvdd3ax5OGwYEhpdmra4wDPk7
	3K/KDcAjLWuPAqKV1VnGBzHKTkocXFiXPe29joN9wXYUg7ICc1AG9cRBX9Yid4E4Wh7P
	dbbqfei94IPu3wpVFbJD69sz8WKl2zl3IogE0S2bGdv4EtaQkkBIP1DjnJz1AYzch9rG
	tFOsv4W7eulQsfDIsRXicdixsn7U/c84lN7rMRVPPynlhvjCyO4LZMQUHzRBvBbPUpKP
	CJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X5rG2Cv0I2CarEsBQwd+uTRHuKTV5l8p9OLev2p/Nfw=;
	b=WPckqavUqql3bqV9Q6lKkt7xfhG8vn5hhro8jMoaSGuPtrE41aR8zXNoin7x8FEXDH
	iZvgxhFqv4E2Yw+dry2TZuuQYBqhLMt+N8ycqYHH+mOyYyqDqCWDkZqYjrAZDBd8PfE5
	ud3iUeWqusFBOTflKJkbmOAdbPzGRp771WSv38EE07ce9uw85XeDwe+Y5nNTRVol3gSh
	TIDwrvLDvEFD0EOZKj3ostI1/rJR3zCmdOqiqJ9bGxLdXJ6EZWBcLfTn15weI8sznQTM
	s5khrEbWe9g3j09fBmOtp9f000BhC5+T/oryL8cKgd4HB9Dz2K1eqB8cZmDx5skqlph2
	zeZQ==
X-Gm-Message-State: APjAAAXHNr/8iEw0CJTUoNmVvyos8pfUkk/S5tv108PEsrbdrv93FWxO
	HNExNMgh1rZaqY7zNfPkmXu+20YF
X-Google-Smtp-Source: APXvYqzVJg9c0XHJMeQ2qALn2CfKxMimcuvayCw9nO0XDQW5u4NjOuOhOko+AtOQ1zoSltKg1AWDDw==
X-Received: by 2002:a17:902:442:: with SMTP id 60mr9796409ple.0.1578545400799; 
	Wed, 08 Jan 2020 20:50:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.59
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:28 -0800
Message-Id: <9049ff4d12ac0f356edd4c755498a016c85dd7ca.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 09/28] linux-yocto/5.2: update to v5.2.23
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:00 -0000

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



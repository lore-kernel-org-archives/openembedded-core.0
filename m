Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCB2C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 08:59:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.73880.1705309188340455434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 00:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="133801077"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="133801077"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 17:59:45 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FC2BD7AC6
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:59:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C41B6D946E
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:59:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67609202D20C9
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:59:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10A5E1A0070;
	Mon, 15 Jan 2024 16:59:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kexec-tools: upgrade 2.0.27 -> 2.0.28
Date: Mon, 15 Jan 2024 16:59:23 +0800
Message-Id: <1705309163-23922-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--2.638500-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yTo39wOA02LhTfK5j0EZbyvozDhGeQC9EgLt
	Av8b4f0onJ0c0AWmZwERwg2+wK6oJx2P280ZiGmRuce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitKpT
	dEP51ULiGN/nQcKVf4OaffHI8kAmizCsOCBxDp3VYKMMlFh4BnRNwWv2dBrmkmwRbQLBKXlc9vH
	Qc8DvXUPt+JllrHSnAybKVm4so6Pp9Y/vlKk76Uy0x8J2DopENlKvhkP88iXSF7G1bHV1SIWNJM
	GUcSEAmZQwbr3tqv2LbGT78UIDnmK1i/8UCZ5uOngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w7akHoG/3jjk/dPdRTAcgTp2rSZjGvRWrgz32Pvv/ZPLOMByHCaO3yvUtS2GR1iRvro5Xh
	+NoKyFmbnRq/d2t/eTx4ZbKzuYWyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193642

From: Wang Mingyu <wangmy@fujitsu.com>

0002-purgatory-Pass-r-directly-to-linker.patch
0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
0005-Disable-PIE-during-link.patch
refreshed for 2.0.28

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0002-purgatory-Pass-r-directly-to-linker.patch    |  7 ++++---
 ...xec-ARM-Fix-add_buffer_phys_virt-align-issue.patch | 11 ++++++-----
 .../kexec-tools/0005-Disable-PIE-during-link.patch    |  7 ++++---
 .../{kexec-tools_2.0.27.bb => kexec-tools_2.0.28.bb}  |  2 +-
 4 files changed, 15 insertions(+), 12 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.27.bb => kexec-tools_2.0.28.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
index 363d5da4ae..a537ac2f0b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
@@ -1,4 +1,4 @@
-From a04bcf8f683c1a5a7d015920124457ad56fb7cf0 Mon Sep 17 00:00:00 2001
+From e5bc9fbd6029057a4e3815a5326af5bd83a450e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Sep 2015 07:59:45 +0000
 Subject: [PATCH] purgatory: Pass -r directly to linker
@@ -10,15 +10,16 @@ unfiltered
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
+
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 2dd6c47..416e6b9 100644
+index 4d2d071..6673423 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -60,7 +60,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -61,7 +61,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
  			-Wl,--no-undefined -nostartfiles -nostdlib \
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
index 832fe67716..e874a8b4f1 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
@@ -1,4 +1,4 @@
-From 55e583d20651e829afbbc8dba0f8ec3017cda2d5 Mon Sep 17 00:00:00 2001
+From b62c1da8f8e641397add10367ee9c4cfdedb1cc0 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Mon, 9 Jan 2017 15:26:29 +0800
 Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue
@@ -12,15 +12,16 @@ Upstream-Status: Pending
 
 Suggested-By:fredrik.markstrom@gmail.com
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+
 ---
  kexec/arch/arm/crashdump-arm.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index daa4788..3f72b38 100644
+index 1ec1826..cc20f63 100644
 --- a/kexec/arch/arm/crashdump-arm.c
 +++ b/kexec/arch/arm/crashdump-arm.c
-@@ -240,6 +240,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+@@ -242,6 +242,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
  	void *buf;
  	int err;
  	int last_ranges;
@@ -28,7 +29,7 @@ index daa4788..3f72b38 100644
  
  	/*
  	 * First fetch all the memory (RAM) ranges that we are going to pass to
-@@ -281,6 +282,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+@@ -283,6 +284,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
  
  		/* for support LPAE enabled kernel*/
  		elf_info.class = ELFCLASS64;
@@ -36,7 +37,7 @@ index daa4788..3f72b38 100644
  
  		err = crash_create_elf64_headers(info, &elf_info,
  					 usablemem_rgns.ranges,
-@@ -302,8 +304,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+@@ -304,8 +306,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
  	 * 1MB) so that available memory passed in kernel command line will be
  	 * aligned to 1MB. This is because kernel create_mapping() wants memory
  	 * regions to be aligned to SECTION_SIZE.
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
index 7a4b8548ca..6a21744ac1 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
@@ -1,4 +1,4 @@
-From c54488ad5fd657e0f154d76d7456d9080be24836 Mon Sep 17 00:00:00 2001
+From 494888bcc3bbf070dfce1b2686ee34c8619aa33d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 11:18:49 -0700
 Subject: [PATCH] Disable PIE during link
@@ -9,15 +9,16 @@ just need to match it with linker flags
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 416e6b9..f00edb4 100644
+index 6673423..a7405ea 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -60,7 +60,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-Iinclude \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index 9b9864da9a..c2141e6716 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-SRC_URI[sha256sum] = "410f89057d1f4cd2b0477b6c2035ec2c52e21c185e90742bbae8b4f78a7077a5"
+SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
 
 inherit autotools update-rc.d systemd
 
-- 
2.34.1



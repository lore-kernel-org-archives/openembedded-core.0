Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B14CC5B542
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.75751.1722536828607117782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=acq8WrH2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=e8XJ81JA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f3235fc-26891249-3eaf-41f2-92cc-320fd28a6a53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X7QlnXodfhkAvi80OXYaE6btLaCyOxCC90/ZspF3ok8=;
	b=acq8WrH2vmnZzVtRcxkI+ikX3FffqtQpjSZi+pVr1RVb3bCESRIh6wXybCYMmJCC
	v/96Ry1Vb8mPTLt5JdCre456mlxXGcmQoiwQGGPav/qTh9MpqmpAECXZUS3MFMqsf5u
	lK/uC5bX72vAa8nan7kXO4AA6JfsmTIMhM3dy1AE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X7QlnXodfhkAvi80OXYaE6btLaCyOxCC90/ZspF3ok8=;
	b=e8XJ81JADRh9fu7xcQEdB97YAbaPhTSE90POze6ZNMONphatHY2tHZp+RT/I4q7B
	XLnKXyLvPm0q4SBWMtYUAEZO4gBnkzfmMpFOLQ88Ofu2HocKGLIa1rB/LNBRoDf9gbE
	O/eryIj1uKqfdPkZpVJNHC4kRvpkbOyC+psBHmAI=
Content-Type: multipart/mixed; boundary="===============6813386569912349728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kexec-tools: upgrading to 2.0.29 SUCCEEDED
Message-ID: <010101910f3235fc-26891249-3eaf-41f2-92cc-320fd28a6a53-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202859

--===============6813386569912349728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kexec-tools* to *2.0.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kexec-tools-upgrade-2.0.28-2.0.29.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 0d998a9d89fdaeed629e50edd1fe29cedf3a8687 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:57:49 +0000
Subject: [PATCH] kexec-tools: upgrade 2.0.28 -> 2.0.29

---
 ...bled-check-if-kaslr-seed-dtb-propert.patch |   7 +-
 ...powerpc-change-the-memory-size-limit.patch |   2 +-
 ...linux-setup.c-Use-POSIX-basename-API.patch |  54 -------
 ...-purgatory-Pass-r-directly-to-linker.patch |   3 +-
 ...Fix-add_buffer_phys_virt-align-issue.patch |  50 ------
 .../0005-Disable-PIE-during-link.patch        |   3 +-
 ...uilding-on-x86_64-with-binutils-2.41.patch |  95 -----------
 ...-tools_2.0.28.bb => kexec-tools_2.0.29.bb} | 150 +++++++++++++++++-
 8 files changed, 149 insertions(+), 215 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.28.bb => kexec-tools_2.0.29.bb} (31%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
index ddc1519126..023ef2ab4b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -1,4 +1,4 @@
-From d48ec5e1a5fb7907520dee71b1d94045486a0c29 Mon Sep 17 00:00:00 2001
+From e01eed76362c2dc0a36042ac04114f7aa4d99784 Mon Sep 17 00:00:00 2001
 From: Alexander Kamensky <alexander.kamensky42@gmail.com>
 Date: Thu, 12 Nov 2020 12:56:46 -0800
 Subject: [PATCH] arm64: kexec: disabled check if kaslr-seed dtb property was
@@ -34,7 +34,7 @@ Upstream-Status: Submitted [http://lists.infradead.org/pipermail/kexec/2020-Nove
  1 file changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index ec6df4b..10238d9 100644
+index 55e822b..ca71c09 100644
 --- a/kexec/arch/arm64/kexec-arm64.c
 +++ b/kexec/arch/arm64/kexec-arm64.c
 @@ -503,7 +503,7 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
@@ -65,6 +65,3 @@ index ec6df4b..10238d9 100644
  		/*
  		 * Invoke the getrandom system call with
  		 * GRND_NONBLOCK, to make sure we
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
index 029650f35c..472e664b56 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
@@ -1,4 +1,4 @@
-From 211cae4b6a02a4d9d37bfcd76f3702696e095fc3 Mon Sep 17 00:00:00 2001
+From 0dab260f988c512eac48a9a7289953493b7e2c0a Mon Sep 17 00:00:00 2001
 From: Quanyang Wang <quanyang.wang@windriver.com>
 Date: Tue, 16 Jun 2015 12:59:57 +0800
 Subject: [PATCH] powerpc: change the memory size limit
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
deleted file mode 100644
index e223f45998..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 32c8ffa7ace6f1b7e63f9ddffab00b00c36a7b57 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 May 2024 21:18:08 -0700
-Subject: [PATCH] x86-linux-setup.c: Use POSIX basename API
-
-Musl C library only supports POSIX basename function. while glibc has
-both GNU extention as well as POSIX basename implemented. Switch to
-using posix version, so it can work across musl and glibc
-
-basename prototype has been removed from string.h from latest musl [1]
-compilers e.g. clang-18/GCC-14 flags the absense of prototype as error.
-therefore include libgen.h for providing it.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2024-May/030034.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kexec/arch/i386/x86-linux-setup.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
-index 9a281dc..73251b9 100644
---- a/kexec/arch/i386/x86-linux-setup.c
-+++ b/kexec/arch/i386/x86-linux-setup.c
-@@ -14,6 +14,7 @@
-  *
-  */
- #define _GNU_SOURCE
-+#include <libgen.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <string.h>
-@@ -329,12 +330,14 @@ static int add_edd_entry(struct x86_linux_param_header *real_mode,
- 	memset(edd_info, 0, sizeof(struct edd_info));
- 
- 	/* extract the device number */
--	if (sscanf(basename(sysfs_name), "int13_dev%hhx", &devnum) != 1) {
-+	char* sysfs_name_copy = strdup(sysfs_name);
-+	if (sscanf(basename(sysfs_name_copy), "int13_dev%hhx", &devnum) != 1) {
- 		fprintf(stderr, "Invalid format of int13_dev dir "
--				"entry: %s\n", basename(sysfs_name));
-+				"entry: %s\n", basename(sysfs_name_copy));
-+		free(sysfs_name_copy);
- 		return -1;
- 	}
--
-+	free(sysfs_name_copy);
- 	/* if there's a MBR signature, then add it */
- 	if (file_scanf(sysfs_name, "mbr_signature", "0x%x", &mbr_sig) == 1) {
- 		real_mode->edd_mbr_sig_buffer[*current_mbr] = mbr_sig;
--- 
-2.45.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
index a537ac2f0b..0ea76180fa 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
@@ -1,4 +1,4 @@
-From e5bc9fbd6029057a4e3815a5326af5bd83a450e6 Mon Sep 17 00:00:00 2001
+From 2762b56d5e3e8c614318853b979a39437379c79b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Sep 2015 07:59:45 +0000
 Subject: [PATCH] purgatory: Pass -r directly to linker
@@ -10,7 +10,6 @@ unfiltered
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
deleted file mode 100644
index 489b109285..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From b62c1da8f8e641397add10367ee9c4cfdedb1cc0 Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Mon, 9 Jan 2017 15:26:29 +0800
-Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue
-
-When "CONFIG_ARM_LPAE" is enabled,3 level page table
-is used by MMU, the "SECTION_SIZE" is defined with
-(1 << 21), but 'add_buffer_phys_virt()' hardcode this
-to (1 << 20).
-
-Upstream-Status: Submitted [via email to horms@kernel.org,http://lists.infradead.org/pipermail/kexec/2024-April/029903.html]
-
-Suggested-By:fredrik.markstrom@gmail.com
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-
----
- kexec/arch/arm/crashdump-arm.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index 1ec1826..cc20f63 100644
---- a/kexec/arch/arm/crashdump-arm.c
-+++ b/kexec/arch/arm/crashdump-arm.c
-@@ -242,6 +242,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 	void *buf;
- 	int err;
- 	int last_ranges;
-+	unsigned short align_bit_shift = 20;
- 
- 	/*
- 	 * First fetch all the memory (RAM) ranges that we are going to pass to
-@@ -283,6 +284,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 
- 		/* for support LPAE enabled kernel*/
- 		elf_info.class = ELFCLASS64;
-+		align_bit_shift = 21;
- 
- 		err = crash_create_elf64_headers(info, &elf_info,
- 					 usablemem_rgns.ranges,
-@@ -304,8 +306,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 	 * 1MB) so that available memory passed in kernel command line will be
- 	 * aligned to 1MB. This is because kernel create_mapping() wants memory
- 	 * regions to be aligned to SECTION_SIZE.
-+	 * The SECTION_SIZE of LPAE kernel is '1UL << 21' defined in pgtable-3level.h
- 	 */
--	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << 20,
-+	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << align_bit_shift,
- 					  crash_kernel_mem.start,
- 					  crash_kernel_mem.end, -1, 0);
- 
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
index 6a21744ac1..78a5fcdd27 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
@@ -1,4 +1,4 @@
-From 494888bcc3bbf070dfce1b2686ee34c8619aa33d Mon Sep 17 00:00:00 2001
+From f04338b348c9246c20aa65049b189db3189550a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 11:18:49 -0700
 Subject: [PATCH] Disable PIE during link
@@ -9,7 +9,6 @@ just need to match it with linker flags
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch b/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
deleted file mode 100644
index 4894f044fc..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michel Lind <salimma@fedoraproject.org>
-Date: Tue, 30 Jan 2024 04:14:31 -0600
-Subject: [PATCH] Fix building on x86_64 with binutils 2.41
-
-Newer versions of the GNU assembler (observed with binutils 2.41) will
-complain about the ".arch i386" in files assembled with "as --64",
-with the message "Error: 64bit mode not supported on 'i386'".
-
-Fix by moving ".arch i386" below the relevant ".code32" directive, so
-that the assembler is no longer expecting 64-bit instructions to be used
-by the time that the ".arch i386" directive is encountered.
-
-Based on similar iPXE fix:
-https://github.com/ipxe/ipxe/commit/6ca597eee
-
-Signed-off-by: Michel Lind <michel@michel-slm.name>
-Signed-off-by: Simon Horman <horms@kernel.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?h=main&id=328de8e00e298f00d7ba6b25dc3950147e9642e6]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- purgatory/arch/i386/entry32-16-debug.S | 2 +-
- purgatory/arch/i386/entry32-16.S       | 2 +-
- purgatory/arch/i386/entry32.S          | 2 +-
- purgatory/arch/i386/setup-x86.S        | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
-index 5167944..12e1164 100644
---- a/purgatory/arch/i386/entry32-16-debug.S
-+++ b/purgatory/arch/i386/entry32-16-debug.S
-@@ -25,10 +25,10 @@
- 	.globl entry16_debug_pre32
- 	.globl entry16_debug_first32
- 	.globl entry16_debug_old_first32
--	.arch i386
- 	.balign 16
- entry16_debug:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
-index c051aab..eace095 100644
---- a/purgatory/arch/i386/entry32-16.S
-+++ b/purgatory/arch/i386/entry32-16.S
-@@ -20,10 +20,10 @@
- #undef i386	
- 	.text
- 	.globl entry16, entry16_regs
--	.arch i386
- 	.balign 16
- entry16:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
-index f7a494f..8ce9e31 100644
---- a/purgatory/arch/i386/entry32.S
-+++ b/purgatory/arch/i386/entry32.S
-@@ -20,10 +20,10 @@
- #undef i386
- 
- 	.text
--	.arch	i386
- 	.globl entry32, entry32_regs
- entry32:
- 	.code32
-+	.arch	i386
- 
- 	/* Setup a gdt that should that is generally usefully */
- 	lgdt	%cs:gdt
-diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
-index 201bb2c..a212eed 100644
---- a/purgatory/arch/i386/setup-x86.S
-+++ b/purgatory/arch/i386/setup-x86.S
-@@ -21,10 +21,10 @@
- #undef i386
- 
- 	.text
--	.arch	i386
- 	.globl purgatory_start
- purgatory_start:
- 	.code32
-+	.arch	i386
- 
- 	/* Load a gdt so I know what the segment registers are */
- 	lgdt	%cs:gdt
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
similarity index 31%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
index b60c51df4a..0d667e55d7 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
@@ -1,11 +1,152 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,13 +1,12 @@
+# -
+# -		    GNU GENERAL PUBLIC LICENSE
+# -		       Version 2, June 1991
+# -
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# -                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# +                    GNU GENERAL PUBLIC LICENSE
+# +                       Version 2, June 1991
+# +
+# + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# + 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# -			    Preamble
+# +                            Preamble
+#  
+#    The licenses for most software are designed to take away your
+#  freedom to share and change it.  By contrast, the GNU General Public
+# @@ -16,7 +15,7 @@
+#  General Public License applies to most of the Free Software
+#  Foundation's software and to any other program whose authors commit to
+#  using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Library General Public License instead.)  You can apply it to
+# +the GNU Lesser General Public License instead.)  You can apply it to
+#  your programs, too.
+#  
+#    When we speak of free software, we are referring to freedom, not
+# @@ -56,8 +55,8 @@
+#  
+#    The precise terms and conditions for copying, distribution and
+#  modification follow.
+# -
+# -		    GNU GENERAL PUBLIC LICENSE
+# +
+# +                    GNU GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+#    0. This License applies to any program or other work which contains
+# @@ -111,7 +110,7 @@
+#      License.  (Exception: if the Program itself is interactive but
+#      does not normally print such an announcement, your work based on
+#      the Program is not required to print an announcement.)
+# -
+# +
+#  These requirements apply to the modified work as a whole.  If
+#  identifiable sections of that work are not derived from the Program,
+#  and can be reasonably considered independent and separate works in
+# @@ -169,7 +168,7 @@
+#  access to copy the source code from the same place counts as
+#  distribution of the source code, even though third parties are not
+#  compelled to copy the source along with the object code.
+# -
+# +
+#    4. You may not copy, modify, sublicense, or distribute the Program
+#  except as expressly provided under this License.  Any attempt
+#  otherwise to copy, modify, sublicense or distribute the Program is
+# @@ -226,7 +225,7 @@
+#  
+#  This section is intended to make thoroughly clear what is believed to
+#  be a consequence of the rest of this License.
+# -
+# +
+#    8. If the distribution and/or use of the Program is restricted in
+#  certain countries either by patents or by copyrighted interfaces, the
+#  original copyright holder who places the Program under this License
+# @@ -256,7 +255,7 @@
+#  of preserving the free status of all derivatives of our free software and
+#  of promoting the sharing and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+#  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# @@ -278,9 +277,9 @@
+#  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+#  POSSIBILITY OF SUCH DAMAGES.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# -
+# -	    How to Apply These Terms to Your New Programs
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +            How to Apply These Terms to Your New Programs
+#  
+#    If you develop a new program, and you want it to be of the greatest
+#  possible use to the public, the best way to achieve this is to make it
+# @@ -292,7 +291,7 @@
+#  the "copyright" line and a pointer to where the full notice is found.
+#  
+#      <one line to give the program's name and a brief idea of what it does.>
+# -    Copyright (C) 19yy  <name of author>
+# +    Copyright (C) <year>  <name of author>
+#  
+#      This program is free software; you can redistribute it and/or modify
+#      it under the terms of the GNU General Public License as published by
+# @@ -304,17 +303,16 @@
+#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#      GNU General Public License for more details.
+#  
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# -
+# +    You should have received a copy of the GNU General Public License along
+# +    with this program; if not, write to the Free Software Foundation, Inc.,
+# +    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+#  If the program is interactive, make it output a short notice like this
+#  when it starts in an interactive mode:
+#  
+# -    Gnomovision version 69, Copyright (C) 19yy name of author
+# +    Gnomovision version 69, Copyright (C) year name of author
+#      Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+#      This is free software, and you are welcome to redistribute it
+#      under certain conditions; type `show c' for details.
+# @@ -337,5 +335,5 @@
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+#  consider it more useful to permit linking proprietary applications with the
+# -library.  If this is what you want to do, use the GNU Library General
+# +library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.
+# 
+#
+
 
 SUMMARY = "Kexec fast reboot tools"
 DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linux kernel"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
-                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09 \
+                    "
 DEPENDS = "zlib xz"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
@@ -14,14 +155,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://kdump.service \
            file://0001-powerpc-change-the-memory-size-limit.patch \
            file://0002-purgatory-Pass-r-directly-to-linker.patch \
-           file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
-           file://Fix-building-on-x86_64-with-binutils-2.41.patch \
-           file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
            "
 
-SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
+SRC_URI[sha256sum] = "0756dd54dab2f2a437e5d4df64b9760c3e6cf6a7d29fb296bdeeeb749f6ea28e"
 
 inherit autotools update-rc.d systemd
 
-- 
2.44.0


--===============6813386569912349728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.28-2.0.29.patch"

RnJvbSAwZDk5OGE5ZDg5ZmRhZWVkNjI5ZTUwZWRkMWZlMjljZWRmM2E4Njg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDo1Nzo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
eGVjLXRvb2xzOiB1cGdyYWRlIDIuMC4yOCAtPiAyLjAuMjkKCi0tLQogLi4uYmxlZC1jaGVjay1p
Zi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIHwgICA3ICstCiAuLi5wb3dlcnBjLWNoYW5n
ZS10aGUtbWVtb3J5LXNpemUtbGltaXQucGF0Y2ggfCAgIDIgKy0KIC4uLmxpbnV4LXNldHVwLmMt
VXNlLVBPU0lYLWJhc2VuYW1lLUFQSS5wYXRjaCB8ICA1NCAtLS0tLS0tCiAuLi4tcHVyZ2F0b3J5
LVBhc3Mtci1kaXJlY3RseS10by1saW5rZXIucGF0Y2ggfCAgIDMgKy0KIC4uLkZpeC1hZGRfYnVm
ZmVyX3BoeXNfdmlydC1hbGlnbi1pc3N1ZS5wYXRjaCB8ICA1MCAtLS0tLS0KIC4uLi8wMDA1LURp
c2FibGUtUElFLWR1cmluZy1saW5rLnBhdGNoICAgICAgICB8ICAgMyArLQogLi4udWlsZGluZy1v
bi14ODZfNjQtd2l0aC1iaW51dGlscy0yLjQxLnBhdGNoIHwgIDk1IC0tLS0tLS0tLS0tCiAuLi4t
dG9vbHNfMi4wLjI4LmJiID0+IGtleGVjLXRvb2xzXzIuMC4yOS5iYn0gfCAxNTAgKysrKysrKysr
KysrKysrKystCiA4IGZpbGVzIGNoYW5nZWQsIDE0OSBpbnNlcnRpb25zKCspLCAyMTUgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhl
Yy10b29scy8wMDAxLXg4Ni1saW51eC1zZXR1cC5jLVVzZS1QT1NJWC1iYXNlbmFtZS1BUEkucGF0
Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRv
b2xzLzAwMDMta2V4ZWMtQVJNLUZpeC1hZGRfYnVmZmVyX3BoeXNfdmlydC1hbGlnbi1pc3N1ZS5w
YXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMt
dG9vbHMvRml4LWJ1aWxkaW5nLW9uLXg4Nl82NC13aXRoLWJpbnV0aWxzLTIuNDEucGF0Y2gKIHJl
bmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL3trZXhlYy10b29sc18yLjAuMjguYmIgPT4g
a2V4ZWMtdG9vbHNfMi4wLjI5LmJifSAoMzElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1p
Zi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhl
Yy9rZXhlYy10b29scy8wMDAxLWFybTY0LWtleGVjLWRpc2FibGVkLWNoZWNrLWlmLWthc2xyLXNl
ZWQtZHRiLXByb3BlcnQucGF0Y2gKaW5kZXggZGRjMTUxOTEyNi4uMDIzZWYyYWI0YiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWFybTY0LWtl
eGVjLWRpc2FibGVkLWNoZWNrLWlmLWthc2xyLXNlZWQtZHRiLXByb3BlcnQucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWFybTY0LWtleGVjLWRp
c2FibGVkLWNoZWNrLWlmLWthc2xyLXNlZWQtZHRiLXByb3BlcnQucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGQ0OGVjNWUxYTVmYjc5MDc1MjBkZWU3MWIxZDk0MDQ1NDg2YTBjMjkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUwMWVlZDc2MzYyYzJkYzBhMzYwNDJhYzA0MTE0Zjdh
YTRkOTk3ODQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FtZW5z
a3kgPGFsZXhhbmRlci5rYW1lbnNreTQyQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTIgTm92IDIw
MjAgMTI6NTY6NDYgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXJtNjQ6IGtleGVjOiBkaXNhYmxl
ZCBjaGVjayBpZiBrYXNsci1zZWVkIGR0YiBwcm9wZXJ0eSB3YXMKQEAgLTM0LDcgKzM0LDcgQEAg
VXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3Bp
cGVybWFpbC9rZXhlYy8yMDIwLU5vdmUKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEva2V4ZWMvYXJjaC9hcm02NC9rZXhlYy1h
cm02NC5jIGIva2V4ZWMvYXJjaC9hcm02NC9rZXhlYy1hcm02NC5jCi1pbmRleCBlYzZkZjRiLi4x
MDIzOGQ5IDEwMDY0NAoraW5kZXggNTVlODIyYi4uY2E3MWMwOSAxMDA2NDQKIC0tLSBhL2tleGVj
L2FyY2gvYXJtNjQva2V4ZWMtYXJtNjQuYwogKysrIGIva2V4ZWMvYXJjaC9hcm02NC9rZXhlYy1h
cm02NC5jCiBAQCAtNTAzLDcgKzUwMyw3IEBAIHN0YXRpYyBpbnQgc2V0dXBfMm5kX2R0YihzdHJ1
Y3QgZHRiICpkdGIsIGNoYXIgKmNvbW1hbmRfbGluZSwgaW50IG9uX2NyYXNoKQpAQCAtNjUsNiAr
NjUsMyBAQCBpbmRleCBlYzZkZjRiLi4xMDIzOGQ5IDEwMDY0NAogIAkJLyoKICAJCSAqIEludm9r
ZSB0aGUgZ2V0cmFuZG9tIHN5c3RlbSBjYWxsIHdpdGgKICAJCSAqIEdSTkRfTk9OQkxPQ0ssIHRv
IG1ha2Ugc3VyZSB3ZQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtl
cm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLXBvd2VycGMtY2hhbmdlLXRoZS1tZW1vcnktc2l6
ZS1saW1pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAw
MS1wb3dlcnBjLWNoYW5nZS10aGUtbWVtb3J5LXNpemUtbGltaXQucGF0Y2gKaW5kZXggMDI5NjUw
ZjM1Yy4uNDcyZTY2NGI1NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9r
ZXhlYy10b29scy8wMDAxLXBvd2VycGMtY2hhbmdlLXRoZS1tZW1vcnktc2l6ZS1saW1pdC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEtcG93ZXJw
Yy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAyMTFjYWU0YjZhMDJhNGQ5ZDM3YmZjZDc2ZjM3MDI2OTZlMDk1ZmMzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAwZGFiMjYwZjk4OGM1MTJlYWM0OGE5YTcyODk5NTM0OTNiN2UyYzBh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUXVhbnlhbmcgV2FuZyA8cXVhbnlhbmcu
d2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNiBKdW4gMjAxNSAxMjo1OTo1NyArMDgw
MAogU3ViamVjdDogW1BBVENIXSBwb3dlcnBjOiBjaGFuZ2UgdGhlIG1lbW9yeSBzaXplIGxpbWl0
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEt
eDg2LWxpbnV4LXNldHVwLmMtVXNlLVBPU0lYLWJhc2VuYW1lLUFQSS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS14ODYtbGludXgtc2V0dXAuYy1Vc2Ut
UE9TSVgtYmFzZW5hbWUtQVBJLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBl
MjIzZjQ1OTk4Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4
ZWMtdG9vbHMvMDAwMS14ODYtbGludXgtc2V0dXAuYy1Vc2UtUE9TSVgtYmFzZW5hbWUtQVBJLnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTQgKzAsMCBAQAotRnJvbSAzMmM4ZmZhN2FjZTZmMWI3
ZTYzZjlkZGZmYWIwMGIwMGMzNmE3YjU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMjE6
MTg6MDggLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0geDg2LWxpbnV4LXNldHVwLmM6IFVzZSBQT1NJ
WCBiYXNlbmFtZSBBUEkKLQotTXVzbCBDIGxpYnJhcnkgb25seSBzdXBwb3J0cyBQT1NJWCBiYXNl
bmFtZSBmdW5jdGlvbi4gd2hpbGUgZ2xpYmMgaGFzCi1ib3RoIEdOVSBleHRlbnRpb24gYXMgd2Vs
bCBhcyBQT1NJWCBiYXNlbmFtZSBpbXBsZW1lbnRlZC4gU3dpdGNoIHRvCi11c2luZyBwb3NpeCB2
ZXJzaW9uLCBzbyBpdCBjYW4gd29yayBhY3Jvc3MgbXVzbCBhbmQgZ2xpYmMKLQotYmFzZW5hbWUg
cHJvdG90eXBlIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBzdHJpbmcuaCBmcm9tIGxhdGVzdCBtdXNs
IFsxXQotY29tcGlsZXJzIGUuZy4gY2xhbmctMTgvR0NDLTE0IGZsYWdzIHRoZSBhYnNlbnNlIG9m
IHByb3RvdHlwZSBhcyBlcnJvci4KLXRoZXJlZm9yZSBpbmNsdWRlIGxpYmdlbi5oIGZvciBwcm92
aWRpbmcgaXQuCi0KLVsxXSBodHRwczovL2dpdC5tdXNsLWxpYmMub3JnL2NnaXQvbXVzbC9jb21t
aXQvP2lkPTcyNWUxN2VkNmRmZjRkMGNkMjI0ODdiYjY0NDcwODgxZTg2YTkyZTcKLQotVXBzdHJl
YW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1h
aWwva2V4ZWMvMjAyNC1NYXkvMDMwMDM0Lmh0bWxdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0ga2V4ZWMvYXJjaC9pMzg2L3g4Ni1saW51eC1zZXR1
cC5jIHwgOSArKysrKystLS0KLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEva2V4ZWMvYXJjaC9pMzg2L3g4Ni1saW51eC1zZXR1
cC5jIGIva2V4ZWMvYXJjaC9pMzg2L3g4Ni1saW51eC1zZXR1cC5jCi1pbmRleCA5YTI4MWRjLi43
MzI1MWI5IDEwMDY0NAotLS0tIGEva2V4ZWMvYXJjaC9pMzg2L3g4Ni1saW51eC1zZXR1cC5jCi0r
KysgYi9rZXhlYy9hcmNoL2kzODYveDg2LWxpbnV4LXNldHVwLmMKLUBAIC0xNCw2ICsxNCw3IEBA
Ci0gICoKLSAgKi8KLSAjZGVmaW5lIF9HTlVfU09VUkNFCi0rI2luY2x1ZGUgPGxpYmdlbi5oPgot
ICNpbmNsdWRlIDxzdGRpbnQuaD4KLSAjaW5jbHVkZSA8c3RkaW8uaD4KLSAjaW5jbHVkZSA8c3Ry
aW5nLmg+Ci1AQCAtMzI5LDEyICszMzAsMTQgQEAgc3RhdGljIGludCBhZGRfZWRkX2VudHJ5KHN0
cnVjdCB4ODZfbGludXhfcGFyYW1faGVhZGVyICpyZWFsX21vZGUsCi0gCW1lbXNldChlZGRfaW5m
bywgMCwgc2l6ZW9mKHN0cnVjdCBlZGRfaW5mbykpOwotIAotIAkvKiBleHRyYWN0IHRoZSBkZXZp
Y2UgbnVtYmVyICovCi0tCWlmIChzc2NhbmYoYmFzZW5hbWUoc3lzZnNfbmFtZSksICJpbnQxM19k
ZXYlaGh4IiwgJmRldm51bSkgIT0gMSkgewotKwljaGFyKiBzeXNmc19uYW1lX2NvcHkgPSBzdHJk
dXAoc3lzZnNfbmFtZSk7Ci0rCWlmIChzc2NhbmYoYmFzZW5hbWUoc3lzZnNfbmFtZV9jb3B5KSwg
ImludDEzX2RldiVoaHgiLCAmZGV2bnVtKSAhPSAxKSB7Ci0gCQlmcHJpbnRmKHN0ZGVyciwgIklu
dmFsaWQgZm9ybWF0IG9mIGludDEzX2RldiBkaXIgIgotLQkJCQkiZW50cnk6ICVzXG4iLCBiYXNl
bmFtZShzeXNmc19uYW1lKSk7Ci0rCQkJCSJlbnRyeTogJXNcbiIsIGJhc2VuYW1lKHN5c2ZzX25h
bWVfY29weSkpOwotKwkJZnJlZShzeXNmc19uYW1lX2NvcHkpOwotIAkJcmV0dXJuIC0xOwotIAl9
Ci0tCi0rCWZyZWUoc3lzZnNfbmFtZV9jb3B5KTsKLSAJLyogaWYgdGhlcmUncyBhIE1CUiBzaWdu
YXR1cmUsIHRoZW4gYWRkIGl0ICovCi0gCWlmIChmaWxlX3NjYW5mKHN5c2ZzX25hbWUsICJtYnJf
c2lnbmF0dXJlIiwgIjB4JXgiLCAmbWJyX3NpZykgPT0gMSkgewotIAkJcmVhbF9tb2RlLT5lZGRf
bWJyX3NpZ19idWZmZXJbKmN1cnJlbnRfbWJyXSA9IG1icl9zaWc7Ci0tLSAKLTIuNDUuMQotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDItcHVy
Z2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1saW5rZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDItcHVyZ2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1s
aW5rZXIucGF0Y2gKaW5kZXggYTUzN2FjMmYwYi4uMGVhNzYxODBmYSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAyLXB1cmdhdG9yeS1QYXNzLXIt
ZGlyZWN0bHktdG8tbGlua2VyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMv
a2V4ZWMtdG9vbHMvMDAwMi1wdXJnYXRvcnktUGFzcy1yLWRpcmVjdGx5LXRvLWxpbmtlci5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTViYzlmYmQ2MDI5MDU3YTRlMzgxNWE1MzI2YWY1YmQ4
M2E0NTBlNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjc2MmI1NmQ1ZTNlOGM2MTQz
MTg4NTNiOTc5YTM5NDM3Mzc5Yzc5YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDcgU2VwIDIwMTUgMDc6NTk6
NDUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcHVyZ2F0b3J5OiBQYXNzIC1yIGRpcmVjdGx5IHRv
IGxpbmtlcgpAQCAtMTAsNyArMTAsNiBAQCB1bmZpbHRlcmVkCiBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLQog
LS0tCiAgcHVyZ2F0b3J5L01ha2VmaWxlIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9r
ZXhlYy9rZXhlYy10b29scy8wMDAzLWtleGVjLUFSTS1GaXgtYWRkX2J1ZmZlcl9waHlzX3ZpcnQt
YWxpZ24taXNzdWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xz
LzAwMDMta2V4ZWMtQVJNLUZpeC1hZGRfYnVmZmVyX3BoeXNfdmlydC1hbGlnbi1pc3N1ZS5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNDg5YjEwOTI4NS4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDMta2V4ZWMtQVJN
LUZpeC1hZGRfYnVmZmVyX3BoeXNfdmlydC1hbGlnbi1pc3N1ZS5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDUwICswLDAgQEAKLUZyb20gYjYyYzFkYThmOGU2NDEzOTdhZGQxMDM2N2VlOWM0Y2Zk
ZWRiMWNjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEhhaXFpbmcgQmFpIDxIYWlx
aW5nLkJhaUB3aW5kcml2ZXIuY29tPgotRGF0ZTogTW9uLCA5IEphbiAyMDE3IDE1OjI2OjI5ICsw
ODAwCi1TdWJqZWN0OiBbUEFUQ0hdIGtleGVjOiBBUk06IEZpeCBhZGRfYnVmZmVyX3BoeXNfdmly
dCgpIGFsaWduIGlzc3VlCi0KLVdoZW4gIkNPTkZJR19BUk1fTFBBRSIgaXMgZW5hYmxlZCwzIGxl
dmVsIHBhZ2UgdGFibGUKLWlzIHVzZWQgYnkgTU1VLCB0aGUgIlNFQ1RJT05fU0laRSIgaXMgZGVm
aW5lZCB3aXRoCi0oMSA8PCAyMSksIGJ1dCAnYWRkX2J1ZmZlcl9waHlzX3ZpcnQoKScgaGFyZGNv
ZGUgdGhpcwotdG8gKDEgPDwgMjApLgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbdmlh
IGVtYWlsIHRvIGhvcm1zQGtlcm5lbC5vcmcsaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlw
ZXJtYWlsL2tleGVjLzIwMjQtQXByaWwvMDI5OTAzLmh0bWxdCi0KLVN1Z2dlc3RlZC1CeTpmcmVk
cmlrLm1hcmtzdHJvbUBnbWFpbC5jb20KLVNpZ25lZC1vZmYtYnk6IEhhaXFpbmcgQmFpIDxIYWlx
aW5nLkJhaUB3aW5kcml2ZXIuY29tPgotCi0tLS0KLSBrZXhlYy9hcmNoL2FybS9jcmFzaGR1bXAt
YXJtLmMgfCA1ICsrKystCi0gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQotCi1kaWZmIC0tZ2l0IGEva2V4ZWMvYXJjaC9hcm0vY3Jhc2hkdW1wLWFybS5jIGIv
a2V4ZWMvYXJjaC9hcm0vY3Jhc2hkdW1wLWFybS5jCi1pbmRleCAxZWMxODI2Li5jYzIwZjYzIDEw
MDY0NAotLS0tIGEva2V4ZWMvYXJjaC9hcm0vY3Jhc2hkdW1wLWFybS5jCi0rKysgYi9rZXhlYy9h
cmNoL2FybS9jcmFzaGR1bXAtYXJtLmMKLUBAIC0yNDIsNiArMjQyLDcgQEAgaW50IGxvYWRfY3Jh
c2hkdW1wX3NlZ21lbnRzKHN0cnVjdCBrZXhlY19pbmZvICppbmZvLCBjaGFyICptb2RfY21kbGlu
ZSkKLSAJdm9pZCAqYnVmOwotIAlpbnQgZXJyOwotIAlpbnQgbGFzdF9yYW5nZXM7Ci0rCXVuc2ln
bmVkIHNob3J0IGFsaWduX2JpdF9zaGlmdCA9IDIwOwotIAotIAkvKgotIAkgKiBGaXJzdCBmZXRj
aCBhbGwgdGhlIG1lbW9yeSAoUkFNKSByYW5nZXMgdGhhdCB3ZSBhcmUgZ29pbmcgdG8gcGFzcyB0
bwotQEAgLTI4Myw2ICsyODQsNyBAQCBpbnQgbG9hZF9jcmFzaGR1bXBfc2VnbWVudHMoc3RydWN0
IGtleGVjX2luZm8gKmluZm8sIGNoYXIgKm1vZF9jbWRsaW5lKQotIAotIAkJLyogZm9yIHN1cHBv
cnQgTFBBRSBlbmFibGVkIGtlcm5lbCovCi0gCQllbGZfaW5mby5jbGFzcyA9IEVMRkNMQVNTNjQ7
Ci0rCQlhbGlnbl9iaXRfc2hpZnQgPSAyMTsKLSAKLSAJCWVyciA9IGNyYXNoX2NyZWF0ZV9lbGY2
NF9oZWFkZXJzKGluZm8sICZlbGZfaW5mbywKLSAJCQkJCSB1c2FibGVtZW1fcmducy5yYW5nZXMs
Ci1AQCAtMzA0LDggKzMwNiw5IEBAIGludCBsb2FkX2NyYXNoZHVtcF9zZWdtZW50cyhzdHJ1Y3Qg
a2V4ZWNfaW5mbyAqaW5mbywgY2hhciAqbW9kX2NtZGxpbmUpCi0gCSAqIDFNQikgc28gdGhhdCBh
dmFpbGFibGUgbWVtb3J5IHBhc3NlZCBpbiBrZXJuZWwgY29tbWFuZCBsaW5lIHdpbGwgYmUKLSAJ
ICogYWxpZ25lZCB0byAxTUIuIFRoaXMgaXMgYmVjYXVzZSBrZXJuZWwgY3JlYXRlX21hcHBpbmco
KSB3YW50cyBtZW1vcnkKLSAJICogcmVnaW9ucyB0byBiZSBhbGlnbmVkIHRvIFNFQ1RJT05fU0la
RS4KLSsJICogVGhlIFNFQ1RJT05fU0laRSBvZiBMUEFFIGtlcm5lbCBpcyAnMVVMIDw8IDIxJyBk
ZWZpbmVkIGluIHBndGFibGUtM2xldmVsLmgKLSAJICovCi0tCWVsZmNvcmVoZHIgPSBhZGRfYnVm
ZmVyX3BoeXNfdmlydChpbmZvLCBidWYsIGJ1ZnN6LCBidWZzeiwgMSA8PCAyMCwKLSsJZWxmY29y
ZWhkciA9IGFkZF9idWZmZXJfcGh5c192aXJ0KGluZm8sIGJ1ZiwgYnVmc3osIGJ1ZnN6LCAxIDw8
IGFsaWduX2JpdF9zaGlmdCwKLSAJCQkJCSAgY3Jhc2hfa2VybmVsX21lbS5zdGFydCwKLSAJCQkJ
CSAgY3Jhc2hfa2VybmVsX21lbS5lbmQsIC0xLCAwKTsKLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwNS1EaXNhYmxlLVBJRS1kdXJpbmctbGlu
ay5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwNS1EaXNh
YmxlLVBJRS1kdXJpbmctbGluay5wYXRjaAppbmRleCA2YTIxNzQ0YWMxLi43OGE1ZmNkZDI3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDUtRGlz
YWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhl
Yy9rZXhlYy10b29scy8wMDA1LURpc2FibGUtUElFLWR1cmluZy1saW5rLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0OTQ4ODhiY2MzYmJmMDcwZGZjZTFiMjY4NmVlMzRjODYxOWFhMzNkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMDQzMzhiMzQ4YzkyNDZjMjBhYTY1MDQ5YjE4
OWRiMzE4OTU1MGE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTAgSnVuIDIwMTcgMTE6MTg6NDkgLTA3MDAK
IFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZSBQSUUgZHVyaW5nIGxpbmsKQEAgLTksNyArOSw2IEBA
IGp1c3QgbmVlZCB0byBtYXRjaCBpdCB3aXRoIGxpbmtlciBmbGFncwogVXBzdHJlYW0tU3RhdHVz
OiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
Ci0KIC0tLQogIHB1cmdhdG9yeS9NYWtlZmlsZSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwva2V4ZWMva2V4ZWMtdG9vbHMvRml4LWJ1aWxkaW5nLW9uLXg4Nl82NC13aXRoLWJpbnV0aWxz
LTIuNDEucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzL0ZpeC1i
dWlsZGluZy1vbi14ODZfNjQtd2l0aC1iaW51dGlscy0yLjQxLnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCA0ODk0ZjA0NGZjLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvRml4LWJ1aWxkaW5nLW9uLXg4Nl82NC13aXRoLWJp
bnV0aWxzLTIuNDEucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw5NSArMCwwIEBACi1Gcm9tIDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCi1Gcm9tOiBNaWNoZWwgTGluZCA8c2FsaW1tYUBmZWRvcmFwcm9qZWN0Lm9yZz4KLURh
dGU6IFR1ZSwgMzAgSmFuIDIwMjQgMDQ6MTQ6MzEgLTA2MDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4
IGJ1aWxkaW5nIG9uIHg4Nl82NCB3aXRoIGJpbnV0aWxzIDIuNDEKLQotTmV3ZXIgdmVyc2lvbnMg
b2YgdGhlIEdOVSBhc3NlbWJsZXIgKG9ic2VydmVkIHdpdGggYmludXRpbHMgMi40MSkgd2lsbAot
Y29tcGxhaW4gYWJvdXQgdGhlICIuYXJjaCBpMzg2IiBpbiBmaWxlcyBhc3NlbWJsZWQgd2l0aCAi
YXMgLS02NCIsCi13aXRoIHRoZSBtZXNzYWdlICJFcnJvcjogNjRiaXQgbW9kZSBub3Qgc3VwcG9y
dGVkIG9uICdpMzg2JyIuCi0KLUZpeCBieSBtb3ZpbmcgIi5hcmNoIGkzODYiIGJlbG93IHRoZSBy
ZWxldmFudCAiLmNvZGUzMiIgZGlyZWN0aXZlLCBzbwotdGhhdCB0aGUgYXNzZW1ibGVyIGlzIG5v
IGxvbmdlciBleHBlY3RpbmcgNjQtYml0IGluc3RydWN0aW9ucyB0byBiZSB1c2VkCi1ieSB0aGUg
dGltZSB0aGF0IHRoZSAiLmFyY2ggaTM4NiIgZGlyZWN0aXZlIGlzIGVuY291bnRlcmVkLgotCi1C
YXNlZCBvbiBzaW1pbGFyIGlQWEUgZml4OgotaHR0cHM6Ly9naXRodWIuY29tL2lweGUvaXB4ZS9j
b21taXQvNmNhNTk3ZWVlCi0KLVNpZ25lZC1vZmYtYnk6IE1pY2hlbCBMaW5kIDxtaWNoZWxAbWlj
aGVsLXNsbS5uYW1lPgotU2lnbmVkLW9mZi1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwu
b3JnPgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vdXRpbHMva2VybmVsL2tleGVjL2tleGVjLXRvb2xzLmdpdC9jb21taXQvP2g9bWFp
biZpZD0zMjhkZThlMDBlMjk4ZjAwZDdiYTZiMjVkYzM5NTAxNDdlOTY0MmU2XQotU2lnbmVkLW9m
Zi1ieTogWW9hbm4gQ29uZ2FsIDx5b2Fubi5jb25nYWxAc21pbGUuZnI+Ci0tLS0KLSBwdXJnYXRv
cnkvYXJjaC9pMzg2L2VudHJ5MzItMTYtZGVidWcuUyB8IDIgKy0KLSBwdXJnYXRvcnkvYXJjaC9p
Mzg2L2VudHJ5MzItMTYuUyAgICAgICB8IDIgKy0KLSBwdXJnYXRvcnkvYXJjaC9pMzg2L2VudHJ5
MzIuUyAgICAgICAgICB8IDIgKy0KLSBwdXJnYXRvcnkvYXJjaC9pMzg2L3NldHVwLXg4Ni5TICAg
ICAgICB8IDIgKy0KLSA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKLQotZGlmZiAtLWdpdCBhL3B1cmdhdG9yeS9hcmNoL2kzODYvZW50cnkzMi0xNi1kZWJ1
Zy5TIGIvcHVyZ2F0b3J5L2FyY2gvaTM4Ni9lbnRyeTMyLTE2LWRlYnVnLlMKLWluZGV4IDUxNjc5
NDQuLjEyZTExNjQgMTAwNjQ0Ci0tLS0gYS9wdXJnYXRvcnkvYXJjaC9pMzg2L2VudHJ5MzItMTYt
ZGVidWcuUwotKysrIGIvcHVyZ2F0b3J5L2FyY2gvaTM4Ni9lbnRyeTMyLTE2LWRlYnVnLlMKLUBA
IC0yNSwxMCArMjUsMTAgQEAKLSAJLmdsb2JsIGVudHJ5MTZfZGVidWdfcHJlMzIKLSAJLmdsb2Js
IGVudHJ5MTZfZGVidWdfZmlyc3QzMgotIAkuZ2xvYmwgZW50cnkxNl9kZWJ1Z19vbGRfZmlyc3Qz
MgotLQkuYXJjaCBpMzg2Ci0gCS5iYWxpZ24gMTYKLSBlbnRyeTE2X2RlYnVnOgotIAkuY29kZTMy
Ci0rCS5hcmNoIGkzODYKLSAJLyogQ29tcHV0ZSB3aGVyZSBJIGFtIHJ1bm5pbmcgYXQgKGFzc3Vt
ZXMgZXNwIHZhbGlkKSAqLwotIAljYWxsCTFmCi0gMToJcG9wbAklZWJ4Ci1kaWZmIC0tZ2l0IGEv
cHVyZ2F0b3J5L2FyY2gvaTM4Ni9lbnRyeTMyLTE2LlMgYi9wdXJnYXRvcnkvYXJjaC9pMzg2L2Vu
dHJ5MzItMTYuUwotaW5kZXggYzA1MWFhYi4uZWFjZTA5NSAxMDA2NDQKLS0tLSBhL3B1cmdhdG9y
eS9hcmNoL2kzODYvZW50cnkzMi0xNi5TCi0rKysgYi9wdXJnYXRvcnkvYXJjaC9pMzg2L2VudHJ5
MzItMTYuUwotQEAgLTIwLDEwICsyMCwxMCBAQAotICN1bmRlZiBpMzg2CQotIAkudGV4dAotIAku
Z2xvYmwgZW50cnkxNiwgZW50cnkxNl9yZWdzCi0tCS5hcmNoIGkzODYKLSAJLmJhbGlnbiAxNgot
IGVudHJ5MTY6Ci0gCS5jb2RlMzIKLSsJLmFyY2ggaTM4NgotIAkvKiBDb21wdXRlIHdoZXJlIEkg
YW0gcnVubmluZyBhdCAoYXNzdW1lcyBlc3AgdmFsaWQpICovCi0gCWNhbGwJMWYKLSAxOglwb3Bs
CSVlYngKLWRpZmYgLS1naXQgYS9wdXJnYXRvcnkvYXJjaC9pMzg2L2VudHJ5MzIuUyBiL3B1cmdh
dG9yeS9hcmNoL2kzODYvZW50cnkzMi5TCi1pbmRleCBmN2E0OTRmLi44Y2U5ZTMxIDEwMDY0NAot
LS0tIGEvcHVyZ2F0b3J5L2FyY2gvaTM4Ni9lbnRyeTMyLlMKLSsrKyBiL3B1cmdhdG9yeS9hcmNo
L2kzODYvZW50cnkzMi5TCi1AQCAtMjAsMTAgKzIwLDEwIEBACi0gI3VuZGVmIGkzODYKLSAKLSAJ
LnRleHQKLS0JLmFyY2gJaTM4NgotIAkuZ2xvYmwgZW50cnkzMiwgZW50cnkzMl9yZWdzCi0gZW50
cnkzMjoKLSAJLmNvZGUzMgotKwkuYXJjaAlpMzg2Ci0gCi0gCS8qIFNldHVwIGEgZ2R0IHRoYXQg
c2hvdWxkIHRoYXQgaXMgZ2VuZXJhbGx5IHVzZWZ1bGx5ICovCi0gCWxnZHQJJWNzOmdkdAotZGlm
ZiAtLWdpdCBhL3B1cmdhdG9yeS9hcmNoL2kzODYvc2V0dXAteDg2LlMgYi9wdXJnYXRvcnkvYXJj
aC9pMzg2L3NldHVwLXg4Ni5TCi1pbmRleCAyMDFiYjJjLi5hMjEyZWVkIDEwMDY0NAotLS0tIGEv
cHVyZ2F0b3J5L2FyY2gvaTM4Ni9zZXR1cC14ODYuUwotKysrIGIvcHVyZ2F0b3J5L2FyY2gvaTM4
Ni9zZXR1cC14ODYuUwotQEAgLTIxLDEwICsyMSwxMCBAQAotICN1bmRlZiBpMzg2Ci0gCi0gCS50
ZXh0Ci0tCS5hcmNoCWkzODYKLSAJLmdsb2JsIHB1cmdhdG9yeV9zdGFydAotIHB1cmdhdG9yeV9z
dGFydDoKLSAJLmNvZGUzMgotKwkuYXJjaAlpMzg2Ci0gCi0gCS8qIExvYWQgYSBnZHQgc28gSSBr
bm93IHdoYXQgdGhlIHNlZ21lbnQgcmVnaXN0ZXJzIGFyZSAqLwotIAlsZ2R0CSVjczpnZHQKLS0t
IAotMi4zOS4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMt
dG9vbHNfMi4wLjI4LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29sc18y
LjAuMjkuYmIKc2ltaWxhcml0eSBpbmRleCAzMSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtl
cm5lbC9rZXhlYy9rZXhlYy10b29sc18yLjAuMjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1r
ZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNfMi4wLjI5LmJiCmluZGV4IGI2MGM1MWRmNGEuLjBkNjY3
ZTU1ZDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNf
Mi4wLjI4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNfMi4w
LjI5LmJiCkBAIC0xLDExICsxLDE1MiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0g
dmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9s
bG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNl
bnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBh
bmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xp
Y2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmln
aHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcK
KyMgKysrIENPUFlJTkcKKyMgQEAgLTEsMTMgKzEsMTIgQEAKKyMgLQorIyAtCQkgICAgR05VIEdF
TkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgLQkJICAgICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisj
IC0KKyMgLSBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
LCBJbmMuCisjIC0gICAgICAgICAgICAgICAgICAgICAgIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUg
MzMwLCBCb3N0b24sIE1BICAwMjExMS0xMzA3ICBVU0EKKyMgKyAgICAgICAgICAgICAgICAgICAg
R05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgVmVy
c2lvbiAyLCBKdW5lIDE5OTEKKyMgKworIyArIENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjICsgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0
aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQorIyAgIEV2ZXJ5b25lIGlzIHBlcm1p
dHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMg
bGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisj
IC0JCQkgICAgUHJlYW1ibGUKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBQcmVhbWJs
ZQorIyAgCisjICAgIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhcmUgZGVzaWduZWQg
dG8gdGFrZSBhd2F5IHlvdXIKKyMgIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSBpdC4gIEJ5
IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljCisjIEBAIC0xNiw3ICsxNSw3IEBACisj
ICBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gbW9zdCBvZiB0aGUgRnJlZSBTb2Z0
d2FyZQorIyAgRm91bmRhdGlvbidzIHNvZnR3YXJlIGFuZCB0byBhbnkgb3RoZXIgcHJvZ3JhbSB3
aG9zZSBhdXRob3JzIGNvbW1pdCB0bworIyAgdXNpbmcgaXQuICAoU29tZSBvdGhlciBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24gc29mdHdhcmUgaXMgY292ZXJlZCBieQorIyAtdGhlIEdOVSBMaWJy
YXJ5IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaW5zdGVhZC4pICBZb3UgY2FuIGFwcGx5IGl0IHRv
CisjICt0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQuKSAgWW91
IGNhbiBhcHBseSBpdCB0bworIyAgeW91ciBwcm9ncmFtcywgdG9vLgorIyAgCisjICAgIFdoZW4g
d2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0byBmcmVlZG9tLCBu
b3QKKyMgQEAgLTU2LDggKzU1LDggQEAKKyMgIAorIyAgICBUaGUgcHJlY2lzZSB0ZXJtcyBhbmQg
Y29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAgbW9kaWZpY2F0aW9u
IGZvbGxvdy4KKyMgLQwKKyMgLQkJICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICsK
KyMgKyAgICAgICAgICAgICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgICAg
IFRFUk1TIEFORCBDT05ESVRJT05TIEZPUiBDT1BZSU5HLCBESVNUUklCVVRJT04gQU5EIE1PRElG
SUNBVElPTgorIyAgCisjICAgIDAuIFRoaXMgTGljZW5zZSBhcHBsaWVzIHRvIGFueSBwcm9ncmFt
IG9yIG90aGVyIHdvcmsgd2hpY2ggY29udGFpbnMKKyMgQEAgLTExMSw3ICsxMTAsNyBAQAorIyAg
ICAgIExpY2Vuc2UuICAoRXhjZXB0aW9uOiBpZiB0aGUgUHJvZ3JhbSBpdHNlbGYgaXMgaW50ZXJh
Y3RpdmUgYnV0CisjICAgICAgZG9lcyBub3Qgbm9ybWFsbHkgcHJpbnQgc3VjaCBhbiBhbm5vdW5j
ZW1lbnQsIHlvdXIgd29yayBiYXNlZCBvbgorIyAgICAgIHRoZSBQcm9ncmFtIGlzIG5vdCByZXF1
aXJlZCB0byBwcmludCBhbiBhbm5vdW5jZW1lbnQuKQorIyAtDAorIyArCisjICBUaGVzZSByZXF1
aXJlbWVudHMgYXBwbHkgdG8gdGhlIG1vZGlmaWVkIHdvcmsgYXMgYSB3aG9sZS4gIElmCisjICBp
ZGVudGlmaWFibGUgc2VjdGlvbnMgb2YgdGhhdCB3b3JrIGFyZSBub3QgZGVyaXZlZCBmcm9tIHRo
ZSBQcm9ncmFtLAorIyAgYW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVyZWQgaW5kZXBlbmRl
bnQgYW5kIHNlcGFyYXRlIHdvcmtzIGluCisjIEBAIC0xNjksNyArMTY4LDcgQEAKKyMgIGFjY2Vz
cyB0byBjb3B5IHRoZSBzb3VyY2UgY29kZSBmcm9tIHRoZSBzYW1lIHBsYWNlIGNvdW50cyBhcwor
IyAgZGlzdHJpYnV0aW9uIG9mIHRoZSBzb3VyY2UgY29kZSwgZXZlbiB0aG91Z2ggdGhpcmQgcGFy
dGllcyBhcmUgbm90CisjICBjb21wZWxsZWQgdG8gY29weSB0aGUgc291cmNlIGFsb25nIHdpdGgg
dGhlIG9iamVjdCBjb2RlLgorIyAtDAorIyArCisjICAgIDQuIFlvdSBtYXkgbm90IGNvcHksIG1v
ZGlmeSwgc3VibGljZW5zZSwgb3IgZGlzdHJpYnV0ZSB0aGUgUHJvZ3JhbQorIyAgZXhjZXB0IGFz
IGV4cHJlc3NseSBwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBBbnkgYXR0ZW1wdAorIyAg
b3RoZXJ3aXNlIHRvIGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSBvciBkaXN0cmlidXRlIHRoZSBQ
cm9ncmFtIGlzCisjIEBAIC0yMjYsNyArMjI1LDcgQEAKKyMgIAorIyAgVGhpcyBzZWN0aW9uIGlz
IGludGVuZGVkIHRvIG1ha2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlzIGJlbGlldmVkIHRvCisj
ICBiZSBhIGNvbnNlcXVlbmNlIG9mIHRoZSByZXN0IG9mIHRoaXMgTGljZW5zZS4KKyMgLQwKKyMg
KworIyAgICA4LiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2YgdGhlIFByb2dyYW0g
aXMgcmVzdHJpY3RlZCBpbgorIyAgY2VydGFpbiBjb3VudHJpZXMgZWl0aGVyIGJ5IHBhdGVudHMg
b3IgYnkgY29weXJpZ2h0ZWQgaW50ZXJmYWNlcywgdGhlCisjICBvcmlnaW5hbCBjb3B5cmlnaHQg
aG9sZGVyIHdobyBwbGFjZXMgdGhlIFByb2dyYW0gdW5kZXIgdGhpcyBMaWNlbnNlCisjIEBAIC0y
NTYsNyArMjU1LDcgQEAKKyMgIG9mIHByZXNlcnZpbmcgdGhlIGZyZWUgc3RhdHVzIG9mIGFsbCBk
ZXJpdmF0aXZlcyBvZiBvdXIgZnJlZSBzb2Z0d2FyZSBhbmQKKyMgIG9mIHByb21vdGluZyB0aGUg
c2hhcmluZyBhbmQgcmV1c2Ugb2Ygc29mdHdhcmUgZ2VuZXJhbGx5LgorIyAgCisjIC0JCQkgICAg
Tk8gV0FSUkFOVFkKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBOTyBXQVJSQU5UWQor
IyAgCisjICAgIDExLiBCRUNBVVNFIFRIRSBQUk9HUkFNIElTIExJQ0VOU0VEIEZSRUUgT0YgQ0hB
UkdFLCBUSEVSRSBJUyBOTyBXQVJSQU5UWQorIyAgRk9SIFRIRSBQUk9HUkFNLCBUTyBUSEUgRVhU
RU5UIFBFUk1JVFRFRCBCWSBBUFBMSUNBQkxFIExBVy4gIEVYQ0VQVCBXSEVOCisjIEBAIC0yNzgs
OSArMjc3LDkgQEAKKyMgIFBST0dSQU1TKSwgRVZFTiBJRiBTVUNIIEhPTERFUiBPUiBPVEhFUiBQ
QVJUWSBIQVMgQkVFTiBBRFZJU0VEIE9GIFRIRQorIyAgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1B
R0VTLgorIyAgCisjIC0JCSAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCisjIC0MCisj
IC0JICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5ldyBQcm9ncmFtcworIyAr
ICAgICAgICAgICAgICAgICAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCisjICsKKyMg
KyAgICAgICAgICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5ldyBQcm9ncmFt
cworIyAgCisjICAgIElmIHlvdSBkZXZlbG9wIGEgbmV3IHByb2dyYW0sIGFuZCB5b3Ugd2FudCBp
dCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgIHBvc3NpYmxlIHVzZSB0byB0aGUgcHVibGljLCB0
aGUgYmVzdCB3YXkgdG8gYWNoaWV2ZSB0aGlzIGlzIHRvIG1ha2UgaXQKKyMgQEAgLTI5Miw3ICsy
OTEsNyBAQAorIyAgdGhlICJjb3B5cmlnaHQiIGxpbmUgYW5kIGEgcG9pbnRlciB0byB3aGVyZSB0
aGUgZnVsbCBub3RpY2UgaXMgZm91bmQuCisjICAKKyMgICAgICA8b25lIGxpbmUgdG8gZ2l2ZSB0
aGUgcHJvZ3JhbSdzIG5hbWUgYW5kIGEgYnJpZWYgaWRlYSBvZiB3aGF0IGl0IGRvZXMuPgorIyAt
ICAgIENvcHlyaWdodCAoQykgMTl5eSAgPG5hbWUgb2YgYXV0aG9yPgorIyArICAgIENvcHlyaWdo
dCAoQykgPHllYXI+ICA8bmFtZSBvZiBhdXRob3I+CisjICAKKyMgICAgICBUaGlzIHByb2dyYW0g
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQor
IyAgICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgYXMgcHVibGlzaGVkIGJ5CisjIEBAIC0zMDQsMTcgKzMwMywxNiBAQAorIyAgICAgIE1FUkNI
QU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUK
KyMgICAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAg
CisjIC0gICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UKKyMgLSAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90
LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAtICAgIEZvdW5kYXRpb24sIEluYy4sIDU5
IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BICAwMjExMS0xMzA3ICBVU0EKKyMg
LQorIyArICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCisjICsgICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5v
dCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgKyAgICA1
MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNB
LgorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkg
ZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyAgSWYgdGhlIHByb2dyYW0gaXMgaW50
ZXJhY3RpdmUsIG1ha2UgaXQgb3V0cHV0IGEgc2hvcnQgbm90aWNlIGxpa2UgdGhpcworIyAgd2hl
biBpdCBzdGFydHMgaW4gYW4gaW50ZXJhY3RpdmUgbW9kZToKKyMgIAorIyAtICAgIEdub21vdmlz
aW9uIHZlcnNpb24gNjksIENvcHlyaWdodCAoQykgMTl5eSBuYW1lIG9mIGF1dGhvcgorIyArICAg
IEdub21vdmlzaW9uIHZlcnNpb24gNjksIENvcHlyaWdodCAoQykgeWVhciBuYW1lIG9mIGF1dGhv
cgorIyAgICAgIEdub21vdmlzaW9uIGNvbWVzIHdpdGggQUJTT0xVVEVMWSBOTyBXQVJSQU5UWTsg
Zm9yIGRldGFpbHMgdHlwZSBgc2hvdyB3Jy4KKyMgICAgICBUaGlzIGlzIGZyZWUgc29mdHdhcmUs
IGFuZCB5b3UgYXJlIHdlbGNvbWUgdG8gcmVkaXN0cmlidXRlIGl0CisjICAgICAgdW5kZXIgY2Vy
dGFpbiBjb25kaXRpb25zOyB0eXBlIGBzaG93IGMnIGZvciBkZXRhaWxzLgorIyBAQCAtMzM3LDUg
KzMzNSw1IEBACisjICBUaGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0
IGluY29ycG9yYXRpbmcgeW91ciBwcm9ncmFtIGludG8KKyMgIHByb3ByaWV0YXJ5IHByb2dyYW1z
LiAgSWYgeW91ciBwcm9ncmFtIGlzIGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3UgbWF5CisjICBj
b25zaWRlciBpdCBtb3JlIHVzZWZ1bCB0byBwZXJtaXQgbGlua2luZyBwcm9wcmlldGFyeSBhcHBs
aWNhdGlvbnMgd2l0aCB0aGUKKyMgLWxpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQg
dG8gZG8sIHVzZSB0aGUgR05VIExpYnJhcnkgR2VuZXJhbAorIyArbGlicmFyeS4gIElmIHRoaXMg
aXMgd2hhdCB5b3Ugd2FudCB0byBkbywgdXNlIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwKKyMgIFB1
YmxpYyBMaWNlbnNlIGluc3RlYWQgb2YgdGhpcyBMaWNlbnNlLgorIyAKKyMKKwogCiBTVU1NQVJZ
ID0gIktleGVjIGZhc3QgcmVib290IHRvb2xzIgogREVTQ1JJUFRJT04gPSAiS2V4ZWMgaXMgYSBm
YXN0IHJlYm9vdCBmZWF0dXJlIHRoYXQgbGV0cyB5b3UgcmVib290IHRvIGEgbmV3IExpbnV4IGtl
cm5lbCIKIEhPTUVQQUdFID0gImh0dHA6Ly9rZXJuZWwub3JnL3B1Yi9saW51eC91dGlscy9rZXJu
ZWwva2V4ZWMvIgogU0VDVElPTiA9ICJrZXJuZWwvdXNlcmxhbmQiCiBMSUNFTlNFID0gIkdQTC0y
LjAtb25seSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWVhNWJlZDJm
NjBkMzU3NjE4Y2ExNjFhZDUzOWY3YzBhIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2tl
eGVjL2tleGVjLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0yMDttZDU9YWYxMGY2YWU0YTg3MTU5NjVl
NjQ4YWE2ODdhZDNlMDkiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1i
MjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCisgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9rZXhlYy9rZXhlYy5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MjA7bWQ1PWFmMTBmNmFlNGE4
NzE1OTY1ZTY0OGFhNjg3YWQzZTA5IFwKKyAgICAgICAgICAgICAgICAgICAgIgogREVQRU5EUyA9
ICJ6bGliIHh6IgogCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMv
a2VybmVsL2tleGVjL2tleGVjLXRvb2xzLSR7UFZ9LnRhci5neiBcCkBAIC0xNCwxNCArMTU1LDEx
IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9rZXJuZWwva2V4
ZWMva2V4ZWMtdG9vbHMtJHtQVn0udGFyLmd6CiAgICAgICAgICAgIGZpbGU6Ly9rZHVtcC5zZXJ2
aWNlIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcG93ZXJwYy1jaGFuZ2UtdGhlLW1lbW9yeS1z
aXplLWxpbWl0LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItcHVyZ2F0b3J5LVBhc3Mt
ci1kaXJlY3RseS10by1saW5rZXIucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMy1rZXhl
Yy1BUk0tRml4LWFkZF9idWZmZXJfcGh5c192aXJ0LWFsaWduLWlzc3VlLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDUtRGlzYWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1rYXNsci1zZWVk
LWR0Yi1wcm9wZXJ0LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL0ZpeC1idWlsZGluZy1vbi14
ODZfNjQtd2l0aC1iaW51dGlscy0yLjQxLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEt
eDg2LWxpbnV4LXNldHVwLmMtVXNlLVBPU0lYLWJhc2VuYW1lLUFQSS5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYzM2QyNjYwYjNlMzhkMjVhMTI3ZTg3MDk3
OTc4ZTBmN2E5YTczYWI1MTUxYTI5ZWI4MDk3NGQxNjlmZjZhMjkiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMDc1NmRkNTRkYWIyZjJhNDM3ZTVkNGRmNjRiOTc2MGMzZTZjZjZhN2QyOWZiMjk2YmRl
ZWViNzQ5ZjZlYTI4ZSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLXJjLmQgc3lzdGVtZAog
Ci0tIAoyLjQ0LjAKCg==

--===============6813386569912349728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kdump: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 542384 to 543144 (+0%)
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PKGSIZE changed from 10890 to 10926 (+0%)
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PKGSIZE changed from 765625 to 767238 (+0%)
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/kexec: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.28.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch file://Fix-building-on-x86_64-with-binutils-2.41.patch file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.29.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch"
packages/core2-64-poky-linux/kexec-tools: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools: PV changed from "2.0.28" to "2.0.29"
packages/core2-64-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.28 [default] to 2.0.29 [default]
packages/core2-64-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.28" to "2.0.29"

--===============6813386569912349728==--


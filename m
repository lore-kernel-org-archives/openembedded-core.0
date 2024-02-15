Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DBEC54EF3
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.20323.1708018344292847941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fQq5FojA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PCamCEvY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd39dc2-7bd35ade-d76d-4913-b94c-9b92a1f73b85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=syHVOsyMAn7ILw6Yc6EDYqFuai5t8VSSQ+Z5abbfUTU=;
	b=fQq5FojA7hddHzubWZLg38x2/RM4XodW+tzeasu/0/koa+sIFslTqNVvsQQnYpXW
	B+ro8rCXINdYP9dWPN7wShXw6m21tDs/GP4p3snUyo9QahJb+giMpOku0qWrHc+JqK3
	pbg2wb54qvxwkVtgTR2ztUVMXcl+8+npy0fnZR/I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=syHVOsyMAn7ILw6Yc6EDYqFuai5t8VSSQ+Z5abbfUTU=;
	b=PCamCEvYMR5mXHj9Bd+z8R5VO+B+RZvHaFwaeQVUFzlsrqdU63RQlDSWkj7Fokjy
	NmEJGhQbBuc5aESCohHDFP5wFoi4dXZGhxDXTT2j1MsbqEkFENx+o29D+DD79E9wb+Z
	doRz3ehXTJ0R7VEtAGHcNLlxEdX4AcYApnVq1xsY=
Content-Type: multipart/mixed; boundary="===============5779449725200873520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202311 FAILED
Message-ID: <0101018dadd39dc2-7bd35ade-d76d-4913-b94c-9b92a1f73b85-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195567

--===============5779449725200873520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202311* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202308-edk2-stable202311.patch
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
From 7955af7c496836e1f077ab349e6a96a06ec7b103 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:20:16 +0000
Subject: [PATCH] ovmf: upgrade edk2-stable202308 -> edk2-stable202311

---
 ...ovmf-update-path-to-native-BaseTools.patch | 10 ++-
 ...ile-adjust-to-build-in-under-bitbake.patch |  6 +-
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 24 ++++---
 .../ovmf/ovmf/0004-reproducible.patch         | 18 +++---
 ...005-Committing-changes-from-do_patch.patch | 64 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  5 +-
 6 files changed, 92 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
index 490d9e8046..ffae28b271 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -1,7 +1,7 @@
-From d8df6b6433351763e1db791dd84d432983d2b249 Mon Sep 17 00:00:00 2001
+From e99b283d0ef0f05319a6b63d935b882111c6fe8f Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/4] ovmf: update path to native BaseTools
+Subject: [PATCH] ovmf: update path to native BaseTools
 
 BaseTools is a set of utilities to build EDK-based firmware. These utilities
 are used during the build process. Thus, they need to be built natively.
@@ -11,12 +11,13 @@ with the appropriate location before building.
 
 Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Upstream-Status: Inappropriate [oe-core cross compile specific]
+
 ---
  OvmfPkg/build.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
-index b0334fb76e..094f86f096 100755
+index 279f0d099a..285f061bf4 100755
 --- a/OvmfPkg/build.sh
 +++ b/OvmfPkg/build.sh
 @@ -24,7 +24,7 @@ then
@@ -28,6 +29,3 @@ index b0334fb76e..094f86f096 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
--- 
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index eeedc9e20f..f4852369c4 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -1,4 +1,4 @@
-From ac9df4fb92965f1f95a5bdbde5f2f86d0c569711 Mon Sep 17 00:00:00 2001
+From 3812bc4c45e826f313c93e24039b2795875564f3 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
 Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
@@ -13,6 +13,7 @@ to fight against how upstream wants to configure the build.
 
 Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
 Upstream-Status: Inappropriate [needs to be converted to in-recipe fixups]
+
 ---
  BaseTools/Source/C/Makefiles/header.makefile | 15 +++++++--------
  1 file changed, 7 insertions(+), 8 deletions(-)
@@ -64,6 +65,3 @@ index d369908a09..22c670f316 100644
  ifeq ($(HOST_ARCH), IA32)
  #
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386, but gcc defaults
--- 
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index c0c763c1cf..86361c5b7d 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 03e536b20d0b72cf078052f6748de8df3836625c Mon Sep 17 00:00:00 2001
+From 9f1d683e53a9e4c7745d525cddf5cbf462e09ef8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH 3/4] debug prefix map
+Subject: [PATCH] debug prefix map
 
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -17,12 +17,13 @@ the case if the size of the debug symbols varies.
 Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/2202]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  BaseTools/Conf/tools_def.template | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
-index 503a6687c1..10ac38ef9e 100755
+index c34ecfd557..c17c87d683 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
 @@ -739,7 +739,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     = --add-gnu-debuglink="$(DEBUG_DIR)/$(MODULE_
@@ -34,7 +35,7 @@ index 503a6687c1..10ac38ef9e 100755
  DEFINE GCC_ARM_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS) -mlittle-endian -mabi=aapcs -fno-short-enums -funsigned-char -ffunction-sections -fdata-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie
  DEFINE GCC_LOONGARCH64_CC_FLAGS    = DEF(GCC_ALL_CC_FLAGS) -mabi=lp64d -fno-asynchronous-unwind-tables -fno-plt -Wno-address -fno-short-enums -fsigned-char -ffunction-sections -fdata-sections
  DEFINE GCC_ARM_CC_XIPFLAGS         = -mno-unaligned-access
-@@ -759,8 +759,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      = DEF(GCC_ARM_DLINK_FLAGS) -Wl,--entry,Refere
+@@ -760,8 +760,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      = DEF(GCC_ARM_DLINK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  = DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDLINK_FLAGS)
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS = DEF(GCC_LOONGARCH64_DLINK_FLAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)
  DEFINE GCC_IA32_X64_DLINK_FLAGS    = DEF(GCC_IA32_X64_DLINK_COMMON) --entry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map
@@ -45,7 +46,7 @@ index 503a6687c1..10ac38ef9e 100755
  DEFINE GCC_VFRPP_FLAGS             = -x c -E -P -DVFRCOMPILE --include $(MODULE_NAME)StrDefs.h
  DEFINE GCC_ASLPP_FLAGS             = -x c -E -include AutoGen.h
  DEFINE GCC_ASLCC_FLAGS             = -x c
-@@ -913,7 +913,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           = -mabi=lp64d -march=loongarch64 DEF(
+@@ -914,7 +914,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           = -mabi=lp64d -march=loongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         = DEF(GCC48_IA32_DLINK2_FLAGS)
  *_GCC48_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
  *_GCC48_IA32_OBJCOPY_FLAGS        =
@@ -54,7 +55,7 @@ index 503a6687c1..10ac38ef9e 100755
  
    DEBUG_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS)
  RELEASE_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set-variable
-@@ -941,7 +941,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set
+@@ -942,7 +942,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         = DEF(GCC48_X64_DLINK2_FLAGS)
  *_GCC48_X64_RC_FLAGS             = DEF(GCC_X64_RC_FLAGS)
  *_GCC48_X64_OBJCOPY_FLAGS        =
@@ -63,7 +64,7 @@ index 503a6687c1..10ac38ef9e 100755
  
    DEBUG_GCC48_X64_CC_FLAGS       = DEF(GCC48_X64_CC_FLAGS)
  RELEASE_GCC48_X64_CC_FLAGS       = DEF(GCC48_X64_CC_FLAGS) -Wno-unused-but-set-variable
-@@ -1050,7 +1050,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   = DEF(GCC48_AARCH64_CC_FLAGS) -Wno-unused-but-s
+@@ -1051,7 +1051,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   = DEF(GCC48_AARCH64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         = DEF(GCC49_IA32_DLINK2_FLAGS)
  *_GCC49_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
  *_GCC49_IA32_OBJCOPY_FLAGS        =
@@ -72,7 +73,7 @@ index 503a6687c1..10ac38ef9e 100755
  
    DEBUG_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS)
  RELEASE_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set-variable -Wno-unused-const-variable
-@@ -1078,7 +1078,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set
+@@ -1079,7 +1079,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         = DEF(GCC49_X64_DLINK2_FLAGS)
  *_GCC49_X64_RC_FLAGS             = DEF(GCC_X64_RC_FLAGS)
  *_GCC49_X64_OBJCOPY_FLAGS        =
@@ -81,7 +82,7 @@ index 503a6687c1..10ac38ef9e 100755
  
    DEBUG_GCC49_X64_CC_FLAGS       = DEF(GCC49_X64_CC_FLAGS)
  RELEASE_GCC49_X64_CC_FLAGS       = DEF(GCC49_X64_CC_FLAGS) -Wno-unused-but-set-variable -Wno-unused-const-variable
-@@ -1337,7 +1337,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS = -z common-page-size=0x20
+@@ -1338,7 +1338,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS = -z common-page-size=0x20
  *_GCC5_IA32_DLINK2_FLAGS         = DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie
  *_GCC5_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
  *_GCC5_IA32_OBJCOPY_FLAGS        =
@@ -90,7 +91,7 @@ index 503a6687c1..10ac38ef9e 100755
  
    DEBUG_GCC5_IA32_CC_FLAGS       = DEF(GCC5_IA32_CC_FLAGS) -flto
    DEBUG_GCC5_IA32_DLINK_FLAGS    = DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,-m,elf_i386,--oformat=elf32-i386
-@@ -1369,7 +1369,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    = DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1370,7 +1370,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    = DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          = DEF(GCC5_X64_DLINK2_FLAGS)
  *_GCC5_X64_RC_FLAGS              = DEF(GCC_X64_RC_FLAGS)
  *_GCC5_X64_OBJCOPY_FLAGS         =
@@ -99,6 +100,3 @@ index 503a6687c1..10ac38ef9e 100755
  
    DEBUG_GCC5_X64_CC_FLAGS        = DEF(GCC5_X64_CC_FLAGS) -flto -DUSING_LTO
    DEBUG_GCC5_X64_DLINK_FLAGS     = DEF(GCC5_X64_DLINK_FLAGS) -flto -Os
--- 
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
index c3fdc3d863..6e221a8971 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From c59850367a190d70dec43e0a66f399a4d8a5ffed Mon Sep 17 00:00:00 2001
+From a47499700412d86a533c7a4ee28ae2392f37762f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH 4/4] reproducible
+Subject: [PATCH] reproducible
 
 This patch fixes various things which make the build more reproducible. Some changes
 here only change intermediate artefacts but that means when you have two build trees
@@ -27,6 +27,7 @@ The patch specifically:
 Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/2176]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  BaseTools/Source/C/GenFw/Elf64Convert.c       |  8 ++++---
  .../Source/Python/AutoGen/BuildEngine.py      |  3 +++
@@ -35,10 +36,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 24 insertions(+), 16 deletions(-)
 
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/GenFw/Elf64Convert.c
-index 9c17c90b16..fcc7864141 100644
+index 9911db65af..bd87909066 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
-@@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+@@ -13,6 +13,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
  #ifndef __GNUC__
  #include <windows.h>
  #include <io.h>
@@ -47,7 +48,7 @@ index 9c17c90b16..fcc7864141 100644
  #endif
  #include <assert.h>
  #include <stdio.h>
-@@ -990,7 +992,7 @@ ScanSections64 (
+@@ -988,7 +990,7 @@ ScanSections64 (
    }
    mCoffOffset = mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) +
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +
@@ -56,7 +57,7 @@ index 9c17c90b16..fcc7864141 100644
  
    //
    // Add more space in the .debug data region for the DllCharacteristicsEx
-@@ -2261,7 +2263,7 @@ WriteDebug64 (
+@@ -2279,7 +2281,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;
  
@@ -65,7 +66,7 @@ index 9c17c90b16..fcc7864141 100644
  
    NtHdr = (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset);
    DataDir = &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIRECTORY_ENTRY_DEBUG];
-@@ -2294,7 +2296,7 @@ WriteDebug64 (
+@@ -2312,7 +2314,7 @@ WriteDebug64 (
  
    Nb10 = (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);
    Nb10->Signature = CODEVIEW_SIGNATURE_NB10;
@@ -175,6 +176,3 @@ index d05410b329..99b3f64aba 100755
  
          # Ignore generating makefile when it is a binary module
          if self.IsBinaryModule:
--- 
-2.30.2
-
diff --git a/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch b/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch
new file mode 100644
index 0000000000..70464e1339
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch
@@ -0,0 +1,64 @@
+From d2443d4a55465db44791e5f2435163b62e6fd604 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Thu, 15 Feb 2024 06:19:01 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ BaseTools/Source/C/Makefiles/app.makefile |  6 ++++++
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 10 ++++++++++
+ OvmfPkg/build.sh                          |  2 +-
+ 3 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
+index 506343a6e0..3f9d38f3a9 100644
+--- a/BaseTools/Source/C/Makefiles/app.makefile
++++ b/BaseTools/Source/C/Makefiles/app.makefile
+@@ -10,6 +10,12 @@ MAKEROOT ?= ../..
+ include $(MAKEROOT)/Makefiles/header.makefile
+ 
+ APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot  
++LINKER = $(CC)
+ 
+ .PHONY:all
+ all: $(MAKEROOT)/bin $(APPLICATION)
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
+index 7d5976649d..a14ddb58ed 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -19,8 +19,18 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
+ CLANG:=$(shell $(CC) --version | grep clang)
+ ifneq ($(CLANG),)
+ VFR_CPPFLAGS = -Wno-deprecated-register -std=c++14 -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot  
+ else
+ VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot  
+ endif
+ # keep BUILD_OPTFLAGS last
+ VFR_CXXFLAGS = $(BUILD_OPTFLAGS)
+diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
+index 285f061bf4..689070958e 100755
+--- a/OvmfPkg/build.sh
++++ b/OvmfPkg/build.sh
+@@ -24,7 +24,7 @@ then
+ # this assumes svn pulls have the same root dir
+ #  export EDK_TOOLS_PATH=`pwd`/../BaseTools
+ # This version is for the tools source in edk2
+-  export EDK_TOOLS_PATH=BBAKE_EDK_TOOLS_PATH/BaseTools
++  export EDK_TOOLS_PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-8o5zaxoy/workdir/recipe-sysroot-native/usr/bin/edk2_basetools/BaseTools
+   echo $EDK_TOOLS_PATH
+   source edksetup.sh BaseTools
+ else
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3dc031d3b6..dcb29c3b14 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -24,10 +24,11 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://0005-Committing-changes-from-do_patch.patch \
            "
 
-PV = "edk2-stable202308"
-SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
+PV = "edk2-stable202311"
+SRCREV = "8736b8fdca85e02933cdb0a13309de14c9799ece"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.42.0


--===============5779449725200873520==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202308-edk2-stable202311.patch"

RnJvbSA3OTU1YWY3YzQ5NjgzNmUxZjA3N2FiMzQ5ZTZhOTZhMDZlYzdiMTAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6MjA6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
dm1mOiB1cGdyYWRlIGVkazItc3RhYmxlMjAyMzA4IC0+IGVkazItc3RhYmxlMjAyMzExCgotLS0K
IC4uLm92bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZlLUJhc2VUb29scy5wYXRjaCB8IDEwICsrLQog
Li4uaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNoIHwgIDYgKy0KIC4u
Li9vdm1mL292bWYvMDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoICAgICB8IDI0ICsrKystLS0K
IC4uLi9vdm1mL292bWYvMDAwNC1yZXByb2R1Y2libGUucGF0Y2ggICAgICAgICB8IDE4ICsrKy0t
LQogLi4uMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIHwgNjQgKysr
KysrKysrKysrKysrKysrKwogbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYiAgICAg
ICAgICAgIHwgIDUgKy0KIDYgZmlsZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKSwgMzUgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1m
LzAwMDUtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMS1vdm1mLXVwZGF0ZS1wYXRoLXRvLW5h
dGl2ZS1CYXNlVG9vbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMS1v
dm1mLXVwZGF0ZS1wYXRoLXRvLW5hdGl2ZS1CYXNlVG9vbHMucGF0Y2gKaW5kZXggNDkwZDllODA0
Ni4uZmZhZTI4YjI3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAw
MDEtb3ZtZi11cGRhdGUtcGF0aC10by1uYXRpdmUtQmFzZVRvb2xzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAxLW92bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZlLUJh
c2VUb29scy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZDhkZjZiNjQzMzM1MTc2M2UxZGI3
OTFkZDg0ZDQzMjk4M2QyYjI0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTk5YjI4
M2QwZWYwZjA1MzE5YTZiNjNkOTM1Yjg4MjExMWM2ZmU4ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2FyZG8gTmVyaSA8cmljYXJkby5uZXJpLWNhbGRlcm9uQGxpbnV4LmludGVs
LmNvbT4KIERhdGU6IFRodSwgOSBKdW4gMjAxNiAwMjoyMzowMSAtMDcwMAotU3ViamVjdDogW1BB
VENIIDEvNF0gb3ZtZjogdXBkYXRlIHBhdGggdG8gbmF0aXZlIEJhc2VUb29scworU3ViamVjdDog
W1BBVENIXSBvdm1mOiB1cGRhdGUgcGF0aCB0byBuYXRpdmUgQmFzZVRvb2xzCiAKIEJhc2VUb29s
cyBpcyBhIHNldCBvZiB1dGlsaXRpZXMgdG8gYnVpbGQgRURLLWJhc2VkIGZpcm13YXJlLiBUaGVz
ZSB1dGlsaXRpZXMKIGFyZSB1c2VkIGR1cmluZyB0aGUgYnVpbGQgcHJvY2Vzcy4gVGh1cywgdGhl
eSBuZWVkIHRvIGJlIGJ1aWx0IG5hdGl2ZWx5LgpAQCAtMTEsMTIgKzExLDEzIEBAIHdpdGggdGhl
IGFwcHJvcHJpYXRlIGxvY2F0aW9uIGJlZm9yZSBidWlsZGluZy4KIAogU2lnbmVkLW9mZi1ieTog
UmljYXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29tPgogVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIGNyb3NzIGNvbXBpbGUgc3BlY2lm
aWNdCisKIC0tLQogIE92bWZQa2cvYnVpbGQuc2ggfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9Pdm1mUGtnL2J1aWxk
LnNoIGIvT3ZtZlBrZy9idWlsZC5zaAotaW5kZXggYjAzMzRmYjc2ZS4uMDk0Zjg2ZjA5NiAxMDA3
NTUKK2luZGV4IDI3OWYwZDA5OWEuLjI4NWYwNjFiZjQgMTAwNzU1CiAtLS0gYS9Pdm1mUGtnL2J1
aWxkLnNoCiArKysgYi9Pdm1mUGtnL2J1aWxkLnNoCiBAQCAtMjQsNyArMjQsNyBAQCB0aGVuCkBA
IC0yOCw2ICsyOSwzIEBAIGluZGV4IGIwMzM0ZmI3NmUuLjA5NGY4NmYwOTYgMTAwNzU1CiAgICBl
Y2hvICRFREtfVE9PTFNfUEFUSAogICAgc291cmNlIGVka3NldHVwLnNoIEJhc2VUb29scwogIGVs
c2UKLS0tIAotMi4zMC4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3Zt
Zi8wMDAyLUJhc2VUb29scy1tYWtlZmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFr
ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAyLUJhc2VUb29scy1tYWtl
ZmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaAppbmRleCBlZWVkYzll
MjBmLi5mNDg1MjM2OWM0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYv
MDAwMi1CYXNlVG9vbHMtbWFrZWZpbGUtYWRqdXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2Uu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDItQmFzZVRvb2xzLW1h
a2VmaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBhYzlkZjRmYjkyOTY1ZjFmOTVhNWJkYmRlNWYyZjg2ZDBjNTY5NzExIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzODEyYmM0YzQ1ZTgyNmYzMTNjOTNlMjQwMzliMjc5
NTg3NTU2NGYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljYXJkbyBOZXJpIDxy
aWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29tPgogRGF0ZTogRnJpLCAyNiBKdWwg
MjAxOSAxNzozNDoyNiAtMDQwMAogU3ViamVjdDogW1BBVENIXSBCYXNlVG9vbHM6IG1ha2VmaWxl
OiBhZGp1c3QgdG8gYnVpbGQgaW4gdW5kZXIgYml0YmFrZQpAQCAtMTMsNiArMTMsNyBAQCB0byBm
aWdodCBhZ2FpbnN0IGhvdyB1cHN0cmVhbSB3YW50cyB0byBjb25maWd1cmUgdGhlIGJ1aWxkLgog
CiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIE5lcmkgPHJpY2FyZG8ubmVyaUBsaW51eC5pbnRlbC5j
b20+CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW25lZWRzIHRvIGJlIGNvbnZlcnRl
ZCB0byBpbi1yZWNpcGUgZml4dXBzXQorCiAtLS0KICBCYXNlVG9vbHMvU291cmNlL0MvTWFrZWZp
bGVzL2hlYWRlci5tYWtlZmlsZSB8IDE1ICsrKysrKystLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCkBAIC02NCw2ICs2NSwzIEBAIGluZGV4
IGQzNjk5MDhhMDkuLjIyYzY3MGYzMTYgMTAwNjQ0CiAgaWZlcSAoJChIT1NUX0FSQ0gpLCBJQTMy
KQ0KICAjDQogICMgU25vdyBMZW9wYXJkICBpcyBhIDMyLWJpdCBhbmQgNjQtYml0IGVudmlyb25t
ZW50LiB1bmFtZSAtbSByZXR1cm5zIGkzODYsIGJ1dCBnY2MgZGVmYXVsdHMNCi0tLSAKLTIuMzAu
MgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMy1kZWJ1Zy1w
cmVmaXgtbWFwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDMtZGVidWct
cHJlZml4LW1hcC5wYXRjaAppbmRleCBjMGM3NjNjMWNmLi44NjM2MWM1YjdkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAzLWRlYnVnLXByZWZpeC1tYXAu
cGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDAzZTUzNmIyMGQwYjcyY2YwNzgwNTJmNjc0OGRl
OGRmMzgzNjYyNWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlmMWQ2ODNlNTNhOWU0
Yzc3NDVkNTI1Y2RkZjVjYmY0NjJlMDllZjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwg
MTQgSnVuIDIwMjEgMTk6NTY6MjggKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAzLzRdIGRlYnVnIHBy
ZWZpeCBtYXAKK1N1YmplY3Q6IFtQQVRDSF0gZGVidWcgcHJlZml4IG1hcAogCiBXZSB3YW50IHRv
IHBhc3MgJHtERUJVR19QUkVGSVhfTUFQfSB0byBnY2MgY29tbWFuZHMgYW5kIGFsc28gcGFzcyBp
bgogIC0tZGVidWctcHJlZml4LW1hcCB0byBuYXNtICh3ZSBjYXJyeSBhIHBhdGNoIHRvIG5hc20g
Zm9yIHRoaXMpLiBUaGUKQEAgLTE3LDEyICsxNywxMyBAQCB0aGUgY2FzZSBpZiB0aGUgc2l6ZSBv
ZiB0aGUgZGVidWcgc3ltYm9scyB2YXJpZXMuCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBb
aHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3B1bGwvMjIwMl0KIFNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgog
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CisKIC0tLQogIEJhc2VUb29scy9Db25mL3Rvb2xzX2RlZi50ZW1wbGF0ZSB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9CYXNlVG9vbHMvQ29uZi90b29sc19kZWYudGVtcGxhdGUgYi9C
YXNlVG9vbHMvQ29uZi90b29sc19kZWYudGVtcGxhdGUKLWluZGV4IDUwM2E2Njg3YzEuLjEwYWMz
OGVmOWUgMTAwNzU1CitpbmRleCBjMzRlY2ZkNTU3Li5jMTdjODdkNjgzIDEwMDc1NQogLS0tIGEv
QmFzZVRvb2xzL0NvbmYvdG9vbHNfZGVmLnRlbXBsYXRlCiArKysgYi9CYXNlVG9vbHMvQ29uZi90
b29sc19kZWYudGVtcGxhdGUKIEBAIC03MzksNyArNzM5LDcgQEAgTk9PUFRfKl8qX09CSkNPUFlf
QUREREVCVUdGTEFHICAgICA9IC0tYWRkLWdudS1kZWJ1Z2xpbms9IiQoREVCVUdfRElSKS8kKE1P
RFVMRV8KQEAgLTM0LDcgKzM1LDcgQEAgaW5kZXggNTAzYTY2ODdjMS4uMTBhYzM4ZWY5ZSAxMDA3
NTUKICBERUZJTkUgR0NDX0FSTV9DQ19GTEFHUyAgICAgICAgICAgID0gREVGKEdDQ19BTExfQ0Nf
RkxBR1MpIC1tbGl0dGxlLWVuZGlhbiAtbWFiaT1hYXBjcyAtZm5vLXNob3J0LWVudW1zIC1mdW5z
aWduZWQtY2hhciAtZmZ1bmN0aW9uLXNlY3Rpb25zIC1mZGF0YS1zZWN0aW9ucyAtZm9taXQtZnJh
bWUtcG9pbnRlciAtV25vLWFkZHJlc3MgLW10aHVtYiAtZm5vLXBpYyAtZm5vLXBpZQ0KICBERUZJ
TkUgR0NDX0xPT05HQVJDSDY0X0NDX0ZMQUdTICAgID0gREVGKEdDQ19BTExfQ0NfRkxBR1MpIC1t
YWJpPWxwNjRkIC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLWZuby1wbHQgLVduby1h
ZGRyZXNzIC1mbm8tc2hvcnQtZW51bXMgLWZzaWduZWQtY2hhciAtZmZ1bmN0aW9uLXNlY3Rpb25z
IC1mZGF0YS1zZWN0aW9ucw0KICBERUZJTkUgR0NDX0FSTV9DQ19YSVBGTEFHUyAgICAgICAgID0g
LW1uby11bmFsaWduZWQtYWNjZXNzDQotQEAgLTc1OSw4ICs3NTksOCBAQCBERUZJTkUgR0NDX0FS
TV9BU0xETElOS19GTEFHUyAgICAgID0gREVGKEdDQ19BUk1fRExJTktfRkxBR1MpIC1XbCwtLWVu
dHJ5LFJlZmVyZQorQEAgLTc2MCw4ICs3NjAsOCBAQCBERUZJTkUgR0NDX0FSTV9BU0xETElOS19G
TEFHUyAgICAgID0gREVGKEdDQ19BUk1fRExJTktfRkxBR1MpIC1XbCwtLWVudHJ5LFJlZmVyZQog
IERFRklORSBHQ0NfQUFSQ0g2NF9BU0xETElOS19GTEFHUyAgPSBERUYoR0NDX0FBUkNINjRfRExJ
TktfRkxBR1MpIC1XbCwtLWVudHJ5LFJlZmVyZW5jZUFjcGlUYWJsZSAtdSAkKElNQUdFX0VOVFJZ
X1BPSU5UKSBERUYoR0NDX0FSTV9BQVJDSDY0X0FTTERMSU5LX0ZMQUdTKQ0KICBERUZJTkUgR0ND
X0xPT05HQVJDSDY0X0FTTERMSU5LX0ZMQUdTID0gREVGKEdDQ19MT09OR0FSQ0g2NF9ETElOS19G
TEFHUykgLVdsLC0tZW50cnksUmVmZXJlbmNlQWNwaVRhYmxlIC11ICQoSU1BR0VfRU5UUllfUE9J
TlQpDQogIERFRklORSBHQ0NfSUEzMl9YNjRfRExJTktfRkxBR1MgICAgPSBERUYoR0NDX0lBMzJf
WDY0X0RMSU5LX0NPTU1PTikgLS1lbnRyeSBfJChJTUFHRV9FTlRSWV9QT0lOVCkgLS1maWxlLWFs
aWdubWVudCAweDIwIC0tc2VjdGlvbi1hbGlnbm1lbnQgMHgyMCAtTWFwICQoREVTVF9ESVJfREVC
VUcpLyQoQkFTRV9OQU1FKS5tYXANCkBAIC00NSw3ICs0Niw3IEBAIGluZGV4IDUwM2E2Njg3YzEu
LjEwYWMzOGVmOWUgMTAwNzU1CiAgREVGSU5FIEdDQ19WRlJQUF9GTEFHUyAgICAgICAgICAgICA9
IC14IGMgLUUgLVAgLURWRlJDT01QSUxFIC0taW5jbHVkZSAkKE1PRFVMRV9OQU1FKVN0ckRlZnMu
aA0KICBERUZJTkUgR0NDX0FTTFBQX0ZMQUdTICAgICAgICAgICAgID0gLXggYyAtRSAtaW5jbHVk
ZSBBdXRvR2VuLmgNCiAgREVGSU5FIEdDQ19BU0xDQ19GTEFHUyAgICAgICAgICAgICA9IC14IGMN
Ci1AQCAtOTEzLDcgKzkxMyw3IEBAIERFRklORSBHQ0M1X0xPT05HQVJDSDY0X1BQX0ZMQUdTICAg
ICAgICAgICA9IC1tYWJpPWxwNjRkIC1tYXJjaD1sb29uZ2FyY2g2NCBERUYoCitAQCAtOTE0LDcg
KzkxNCw3IEBAIERFRklORSBHQ0M1X0xPT05HQVJDSDY0X1BQX0ZMQUdTICAgICAgICAgICA9IC1t
YWJpPWxwNjRkIC1tYXJjaD1sb29uZ2FyY2g2NCBERUYoCiAgKl9HQ0M0OF9JQTMyX0RMSU5LMl9G
TEFHUyAgICAgICAgID0gREVGKEdDQzQ4X0lBMzJfRExJTksyX0ZMQUdTKQ0KICAqX0dDQzQ4X0lB
MzJfUkNfRkxBR1MgICAgICAgICAgICAgPSBERUYoR0NDX0lBMzJfUkNfRkxBR1MpDQogICpfR0ND
NDhfSUEzMl9PQkpDT1BZX0ZMQUdTICAgICAgICA9DQpAQCAtNTQsNyArNTUsNyBAQCBpbmRleCA1
MDNhNjY4N2MxLi4xMGFjMzhlZjllIDEwMDc1NQogIA0KICAgIERFQlVHX0dDQzQ4X0lBMzJfQ0Nf
RkxBR1MgICAgICAgPSBERUYoR0NDNDhfSUEzMl9DQ19GTEFHUykNCiAgUkVMRUFTRV9HQ0M0OF9J
QTMyX0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ4X0lBMzJfQ0NfRkxBR1MpIC1Xbm8tdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUNCi1AQCAtOTQxLDcgKzk0MSw3IEBAIFJFTEVBU0VfR0NDNDhfSUEz
Ml9DQ19GTEFHUyAgICAgICA9IERFRihHQ0M0OF9JQTMyX0NDX0ZMQUdTKSAtV25vLXVudXNlZC1i
dXQtc2V0CitAQCAtOTQyLDcgKzk0Miw3IEBAIFJFTEVBU0VfR0NDNDhfSUEzMl9DQ19GTEFHUyAg
ICAgICA9IERFRihHQ0M0OF9JQTMyX0NDX0ZMQUdTKSAtV25vLXVudXNlZC1idXQtc2V0CiAgKl9H
Q0M0OF9YNjRfRExJTksyX0ZMQUdTICAgICAgICAgPSBERUYoR0NDNDhfWDY0X0RMSU5LMl9GTEFH
UykNCiAgKl9HQ0M0OF9YNjRfUkNfRkxBR1MgICAgICAgICAgICAgPSBERUYoR0NDX1g2NF9SQ19G
TEFHUykNCiAgKl9HQ0M0OF9YNjRfT0JKQ09QWV9GTEFHUyAgICAgICAgPQ0KQEAgLTYzLDcgKzY0
LDcgQEAgaW5kZXggNTAzYTY2ODdjMS4uMTBhYzM4ZWY5ZSAxMDA3NTUKICANCiAgICBERUJVR19H
Q0M0OF9YNjRfQ0NfRkxBR1MgICAgICAgPSBERUYoR0NDNDhfWDY0X0NDX0ZMQUdTKQ0KICBSRUxF
QVNFX0dDQzQ4X1g2NF9DQ19GTEFHUyAgICAgICA9IERFRihHQ0M0OF9YNjRfQ0NfRkxBR1MpIC1X
bm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUNCi1AQCAtMTA1MCw3ICsxMDUwLDcgQEAgUkVMRUFT
RV9HQ0M0OF9BQVJDSDY0X0NDX0ZMQUdTICAgPSBERUYoR0NDNDhfQUFSQ0g2NF9DQ19GTEFHUykg
LVduby11bnVzZWQtYnV0LXMKK0BAIC0xMDUxLDcgKzEwNTEsNyBAQCBSRUxFQVNFX0dDQzQ4X0FB
UkNINjRfQ0NfRkxBR1MgICA9IERFRihHQ0M0OF9BQVJDSDY0X0NDX0ZMQUdTKSAtV25vLXVudXNl
ZC1idXQtcwogICpfR0NDNDlfSUEzMl9ETElOSzJfRkxBR1MgICAgICAgICA9IERFRihHQ0M0OV9J
QTMyX0RMSU5LMl9GTEFHUykNCiAgKl9HQ0M0OV9JQTMyX1JDX0ZMQUdTICAgICAgICAgICAgID0g
REVGKEdDQ19JQTMyX1JDX0ZMQUdTKQ0KICAqX0dDQzQ5X0lBMzJfT0JKQ09QWV9GTEFHUyAgICAg
ICAgPQ0KQEAgLTcyLDcgKzczLDcgQEAgaW5kZXggNTAzYTY2ODdjMS4uMTBhYzM4ZWY5ZSAxMDA3
NTUKICANCiAgICBERUJVR19HQ0M0OV9JQTMyX0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ5X0lB
MzJfQ0NfRkxBR1MpDQogIFJFTEVBU0VfR0NDNDlfSUEzMl9DQ19GTEFHUyAgICAgICA9IERFRihH
Q0M0OV9JQTMyX0NDX0ZMQUdTKSAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51
c2VkLWNvbnN0LXZhcmlhYmxlDQotQEAgLTEwNzgsNyArMTA3OCw3IEBAIFJFTEVBU0VfR0NDNDlf
SUEzMl9DQ19GTEFHUyAgICAgICA9IERFRihHQ0M0OV9JQTMyX0NDX0ZMQUdTKSAtV25vLXVudXNl
ZC1idXQtc2V0CitAQCAtMTA3OSw3ICsxMDc5LDcgQEAgUkVMRUFTRV9HQ0M0OV9JQTMyX0NDX0ZM
QUdTICAgICAgID0gREVGKEdDQzQ5X0lBMzJfQ0NfRkxBR1MpIC1Xbm8tdW51c2VkLWJ1dC1zZXQK
ICAqX0dDQzQ5X1g2NF9ETElOSzJfRkxBR1MgICAgICAgICA9IERFRihHQ0M0OV9YNjRfRExJTksy
X0ZMQUdTKQ0KICAqX0dDQzQ5X1g2NF9SQ19GTEFHUyAgICAgICAgICAgICA9IERFRihHQ0NfWDY0
X1JDX0ZMQUdTKQ0KICAqX0dDQzQ5X1g2NF9PQkpDT1BZX0ZMQUdTICAgICAgICA9DQpAQCAtODEs
NyArODIsNyBAQCBpbmRleCA1MDNhNjY4N2MxLi4xMGFjMzhlZjllIDEwMDc1NQogIA0KICAgIERF
QlVHX0dDQzQ5X1g2NF9DQ19GTEFHUyAgICAgICA9IERFRihHQ0M0OV9YNjRfQ0NfRkxBR1MpDQog
IFJFTEVBU0VfR0NDNDlfWDY0X0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ5X1g2NF9DQ19GTEFH
UykgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXVudXNlZC1jb25zdC12YXJpYWJs
ZQ0KLUBAIC0xMzM3LDcgKzEzMzcsNyBAQCBSRUxFQVNFX0dDQ05PTFRPX0FBUkNINjRfRExJTktf
WElQRkxBR1MgPSAteiBjb21tb24tcGFnZS1zaXplPTB4MjAKK0BAIC0xMzM4LDcgKzEzMzgsNyBA
QCBSRUxFQVNFX0dDQ05PTFRPX0FBUkNINjRfRExJTktfWElQRkxBR1MgPSAteiBjb21tb24tcGFn
ZS1zaXplPTB4MjAKICAqX0dDQzVfSUEzMl9ETElOSzJfRkxBR1MgICAgICAgICA9IERFRihHQ0M1
X0lBMzJfRExJTksyX0ZMQUdTKSAtbm8tcGllDQogICpfR0NDNV9JQTMyX1JDX0ZMQUdTICAgICAg
ICAgICAgID0gREVGKEdDQ19JQTMyX1JDX0ZMQUdTKQ0KICAqX0dDQzVfSUEzMl9PQkpDT1BZX0ZM
QUdTICAgICAgICA9DQpAQCAtOTAsNyArOTEsNyBAQCBpbmRleCA1MDNhNjY4N2MxLi4xMGFjMzhl
ZjllIDEwMDc1NQogIA0KICAgIERFQlVHX0dDQzVfSUEzMl9DQ19GTEFHUyAgICAgICA9IERFRihH
Q0M1X0lBMzJfQ0NfRkxBR1MpIC1mbHRvDQogICAgREVCVUdfR0NDNV9JQTMyX0RMSU5LX0ZMQUdT
ICAgID0gREVGKEdDQzVfSUEzMl9YNjRfRExJTktfRkxBR1MpIC1mbHRvIC1PcyAtV2wsLW0sZWxm
X2kzODYsLS1vZm9ybWF0PWVsZjMyLWkzODYNCi1AQCAtMTM2OSw3ICsxMzY5LDcgQEAgUkVMRUFT
RV9HQ0M1X0lBMzJfRExJTktfRkxBR1MgICAgPSBERUYoR0NDNV9JQTMyX1g2NF9ETElOS19GTEFH
UykgLWZsdG8gLU9zIC1XbCwKK0BAIC0xMzcwLDcgKzEzNzAsNyBAQCBSRUxFQVNFX0dDQzVfSUEz
Ml9ETElOS19GTEFHUyAgICA9IERFRihHQ0M1X0lBMzJfWDY0X0RMSU5LX0ZMQUdTKSAtZmx0byAt
T3MgLVdsLAogICpfR0NDNV9YNjRfRExJTksyX0ZMQUdTICAgICAgICAgID0gREVGKEdDQzVfWDY0
X0RMSU5LMl9GTEFHUykNCiAgKl9HQ0M1X1g2NF9SQ19GTEFHUyAgICAgICAgICAgICAgPSBERUYo
R0NDX1g2NF9SQ19GTEFHUykNCiAgKl9HQ0M1X1g2NF9PQkpDT1BZX0ZMQUdTICAgICAgICAgPQ0K
QEAgLTk5LDYgKzEwMCwzIEBAIGluZGV4IDUwM2E2Njg3YzEuLjEwYWMzOGVmOWUgMTAwNzU1CiAg
DQogICAgREVCVUdfR0NDNV9YNjRfQ0NfRkxBR1MgICAgICAgID0gREVGKEdDQzVfWDY0X0NDX0ZM
QUdTKSAtZmx0byAtRFVTSU5HX0xUTw0KICAgIERFQlVHX0dDQzVfWDY0X0RMSU5LX0ZMQUdTICAg
ICA9IERFRihHQ0M1X1g2NF9ETElOS19GTEFHUykgLWZsdG8gLU9zDQotLS0gCi0yLjMwLjIKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDQtcmVwcm9kdWNpYmxl
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDQtcmVwcm9kdWNpYmxlLnBh
dGNoCmluZGV4IGMzZmRjM2Q4NjMuLjZlMjIxYTg5NzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL292bWYvb3ZtZi8wMDA0LXJlcHJvZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9vdm1mL292bWYvMDAwNC1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNyArMSw3IEBA
Ci1Gcm9tIGM1OTg1MDM2N2ExOTBkNzBkZWM0M2UwYTY2ZjM5OWE0ZDhhNWZmZWQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGE0NzQ5OTcwMDQxMmQ4NmE1MzNjN2E0ZWUyOGFlMjM5MmYz
Nzc2MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTQgSnVuIDIwMjEgMTk6NTc6MzAg
KzAyMDAKLVN1YmplY3Q6IFtQQVRDSCA0LzRdIHJlcHJvZHVjaWJsZQorU3ViamVjdDogW1BBVENI
XSByZXByb2R1Y2libGUKIAogVGhpcyBwYXRjaCBmaXhlcyB2YXJpb3VzIHRoaW5ncyB3aGljaCBt
YWtlIHRoZSBidWlsZCBtb3JlIHJlcHJvZHVjaWJsZS4gU29tZSBjaGFuZ2VzCiBoZXJlIG9ubHkg
Y2hhbmdlIGludGVybWVkaWF0ZSBhcnRlZmFjdHMgYnV0IHRoYXQgbWVhbnMgd2hlbiB5b3UgaGF2
ZSB0d28gYnVpbGQgdHJlZXMKQEAgLTI3LDYgKzI3LDcgQEAgVGhlIHBhdGNoIHNwZWNpZmljYWxs
eToKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdGlhbm9j
b3JlL2VkazIvcHVsbC8yMTc2XQogU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KKwogLS0tCiAgQmFzZVRvb2xzL1NvdXJj
ZS9DL0dlbkZ3L0VsZjY0Q29udmVydC5jICAgICAgIHwgIDggKysrKy0tLQogIC4uLi9Tb3VyY2Uv
UHl0aG9uL0F1dG9HZW4vQnVpbGRFbmdpbmUucHkgICAgICB8ICAzICsrKwpAQCAtMzUsMTAgKzM2
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9CYXNlVG9vbHMvU291cmNlL0MvR2VuRncvRWxmNjRDb252ZXJ0
LmMgYi9CYXNlVG9vbHMvU291cmNlL0MvR2VuRncvRWxmNjRDb252ZXJ0LmMKLWluZGV4IDljMTdj
OTBiMTYuLmZjYzc4NjQxNDEgMTAwNjQ0CitpbmRleCA5OTExZGI2NWFmLi5iZDg3OTA5MDY2IDEw
MDY0NAogLS0tIGEvQmFzZVRvb2xzL1NvdXJjZS9DL0dlbkZ3L0VsZjY0Q29udmVydC5jCiArKysg
Yi9CYXNlVG9vbHMvU291cmNlL0MvR2VuRncvRWxmNjRDb252ZXJ0LmMKLUBAIC0xNSw2ICsxNSw4
IEBAIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UtUGF0ZW50CitAQCAtMTMs
NiArMTMsOCBAQCBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlLVBhdGVudAog
ICNpZm5kZWYgX19HTlVDX18NCiAgI2luY2x1ZGUgPHdpbmRvd3MuaD4NCiAgI2luY2x1ZGUgPGlv
Lmg+DQpAQCAtNDcsNyArNDgsNyBAQCBpbmRleCA5YzE3YzkwYjE2Li5mY2M3ODY0MTQxIDEwMDY0
NAogICNlbmRpZg0KICAjaW5jbHVkZSA8YXNzZXJ0Lmg+DQogICNpbmNsdWRlIDxzdGRpby5oPg0K
LUBAIC05OTAsNyArOTkyLDcgQEAgU2NhblNlY3Rpb25zNjQgKAorQEAgLTk4OCw3ICs5OTAsNyBA
QCBTY2FuU2VjdGlvbnM2NCAoCiAgICB9DQogICAgbUNvZmZPZmZzZXQgPSBtRGVidWdPZmZzZXQg
KyBzaXplb2YoRUZJX0lNQUdFX0RFQlVHX0RJUkVDVE9SWV9FTlRSWSkgKw0KICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKEVGSV9JTUFHRV9ERUJVR19DT0RFVklFV19OQjEwX0VOVFJZKSArDQpAQCAt
NTYsNyArNTcsNyBAQCBpbmRleCA5YzE3YzkwYjE2Li5mY2M3ODY0MTQxIDEwMDY0NAogIA0KICAg
IC8vDQogICAgLy8gQWRkIG1vcmUgc3BhY2UgaW4gdGhlIC5kZWJ1ZyBkYXRhIHJlZ2lvbiBmb3Ig
dGhlIERsbENoYXJhY3RlcmlzdGljc0V4DQotQEAgLTIyNjEsNyArMjI2Myw3IEBAIFdyaXRlRGVi
dWc2NCAoCitAQCAtMjI3OSw3ICsyMjgxLDcgQEAgV3JpdGVEZWJ1ZzY0ICgKICAgIEVGSV9JTUFH
RV9ERUJVR19DT0RFVklFV19OQjEwX0VOVFJZICAgICAgICAgKk5iMTA7DQogICAgRUZJX0lNQUdF
X0RFQlVHX0VYX0RMTENIQVJBQ1RFUklTVElDU19FTlRSWSAqRGxsRW50cnk7DQogIA0KQEAgLTY1
LDcgKzY2LDcgQEAgaW5kZXggOWMxN2M5MGIxNi4uZmNjNzg2NDE0MSAxMDA2NDQKICANCiAgICBO
dEhkciA9IChFRklfSU1BR0VfT1BUSU9OQUxfSEVBREVSX1VOSU9OICopKG1Db2ZmRmlsZSArIG1O
dEhkck9mZnNldCk7DQogICAgRGF0YURpciA9ICZOdEhkci0+UGUzMlBsdXMuT3B0aW9uYWxIZWFk
ZXIuRGF0YURpcmVjdG9yeVtFRklfSU1BR0VfRElSRUNUT1JZX0VOVFJZX0RFQlVHXTsNCi1AQCAt
MjI5NCw3ICsyMjk2LDcgQEAgV3JpdGVEZWJ1ZzY0ICgKK0BAIC0yMzEyLDcgKzIzMTQsNyBAQCBX
cml0ZURlYnVnNjQgKAogIA0KICAgIE5iMTAgPSAoRUZJX0lNQUdFX0RFQlVHX0NPREVWSUVXX05C
MTBfRU5UUlkqKShEaXIgKyAxKTsNCiAgICBOYjEwLT5TaWduYXR1cmUgPSBDT0RFVklFV19TSUdO
QVRVUkVfTkIxMDsNCkBAIC0xNzUsNiArMTc2LDMgQEAgaW5kZXggZDA1NDEwYjMyOS4uOTliM2Y2
NGFiYSAxMDA3NTUKICANCiAgICAgICAgICAjIElnbm9yZSBnZW5lcmF0aW5nIG1ha2VmaWxlIHdo
ZW4gaXQgaXMgYSBiaW5hcnkgbW9kdWxlDQogICAgICAgICAgaWYgc2VsZi5Jc0JpbmFyeU1vZHVs
ZToNCi0tLSAKLTIuMzAuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292
bWYvMDAwNS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL292bWYvb3ZtZi8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNo
LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjcwNDY0ZTEzMzkK
LS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwNS1Db21t
aXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaApAQCAtMCwwICsxLDY0IEBACitGcm9t
IGQyNDQzZDRhNTU0NjVkYjQ0NzkxZTVmMjQzNTE2M2I2MmU2ZmQ2MDQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBPcGVuRW1iZWRkZWQgPG9lLnBhdGNoQG9lPgorRGF0ZTogVGh1LCAx
NSBGZWIgMjAyNCAwNjoxOTowMSArMDAwMAorU3ViamVjdDogW1BBVENIXSBDb21taXR0aW5nIGNo
YW5nZXMgZnJvbSBkb19wYXRjaAorCistLS0KKyBCYXNlVG9vbHMvU291cmNlL0MvTWFrZWZpbGVz
L2FwcC5tYWtlZmlsZSB8ICA2ICsrKysrKworIEJhc2VUb29scy9Tb3VyY2UvQy9WZnJDb21waWxl
L0dOVW1ha2VmaWxlIHwgMTAgKysrKysrKysrKworIE92bWZQa2cvYnVpbGQuc2ggICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KKyAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL0Jhc2VUb29scy9Tb3VyY2UvQy9NYWtl
ZmlsZXMvYXBwLm1ha2VmaWxlIGIvQmFzZVRvb2xzL1NvdXJjZS9DL01ha2VmaWxlcy9hcHAubWFr
ZWZpbGUKK2luZGV4IDUwNjM0M2E2ZTAuLjNmOWQzOGYzYTkgMTAwNjQ0CistLS0gYS9CYXNlVG9v
bHMvU291cmNlL0MvTWFrZWZpbGVzL2FwcC5tYWtlZmlsZQorKysrIGIvQmFzZVRvb2xzL1NvdXJj
ZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUKK0BAIC0xMCw2ICsxMCwxMiBAQCBNQUtFUk9PVCA/
PSAuLi8uLgorIGluY2x1ZGUgJChNQUtFUk9PVCkvTWFrZWZpbGVzL2hlYWRlci5tYWtlZmlsZQ0K
KyANCisgQVBQTElDQVRJT04gPSAkKE1BS0VST09UKS9iaW4vJChBUFBOQU1FKQ0KKytDQyA9IHg4
Nl82NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3Nl
MyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9T
T1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0
eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQv
dG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRv
b2x0bXAtOG81emF4b3kvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0NYWCA9IHg4Nl82NC1wb2t5
LWxpbnV4LWcrKyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAtbWZwbWF0
aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAt
V2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5c3Jv
b3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvdG1wL3dvcmsv
Y29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRvb2x0bXAtOG81
emF4b3kvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0FTID0geDg2XzY0LXBva3ktbGludXgtYXMg
IAorK0FSID0geDg2XzY0LXBva3ktbGludXgtZ2NjLWFyCisrTEQgPSB4ODZfNjQtcG9reS1saW51
eC1sZCAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVp
bGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2Rl
dnRvb2x0bXAtOG81emF4b3kvd29ya2Rpci9yZWNpcGUtc3lzcm9vdCAgCisrTElOS0VSID0gJChD
QykKKyANCisgLlBIT05ZOmFsbA0KKyBhbGw6ICQoTUFLRVJPT1QpL2JpbiAkKEFQUExJQ0FUSU9O
KQ0KK2RpZmYgLS1naXQgYS9CYXNlVG9vbHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtlZmls
ZSBiL0Jhc2VUb29scy9Tb3VyY2UvQy9WZnJDb21waWxlL0dOVW1ha2VmaWxlCitpbmRleCA3ZDU5
NzY2NDlkLi5hMTRkZGI1OGVkIDEwMDY0NAorLS0tIGEvQmFzZVRvb2xzL1NvdXJjZS9DL1ZmckNv
bXBpbGUvR05VbWFrZWZpbGUKKysrKyBiL0Jhc2VUb29scy9Tb3VyY2UvQy9WZnJDb21waWxlL0dO
VW1ha2VmaWxlCitAQCAtMTksOCArMTksMTggQEAgT0JKRUNUUyA9IEFQYXJzZXIubyBETGV4ZXJC
YXNlLm8gQVRva2VuQnVmZmVyLm8gRWZpVmZyUGFyc2VyLm8gVmZyTGV4ZXIubyBWZnJTeW4KKyBD
TEFORzo9JChzaGVsbCAkKENDKSAtLXZlcnNpb24gfCBncmVwIGNsYW5nKQ0KKyBpZm5lcSAoJChD
TEFORyksKQ0KKyBWRlJfQ1BQRkxBR1MgPSAtV25vLWRlcHJlY2F0ZWQtcmVnaXN0ZXIgLXN0ZD1j
KysxNCAtRFBDQ1RTX1VTRV9OQU1FU1BBQ0VfU1REICQoQ1BQRkxBR1MpDQorK0NDID0geDg2XzY0
LXBva3ktbGludXgtZ2NjICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2UzIC1t
ZnBtYXRoPXNzZSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJD
RT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC0t
c3lzcm9vdD0vaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIzMDgvZGV2dG9vbHRt
cC04bzV6YXhveS93b3JrZGlyL3JlY2lwZS1zeXNyb290CisrQ1hYID0geDg2XzY0LXBva3ktbGlu
dXgtZysrICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2UzIC1tZnBtYXRoPXNz
ZSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9y
bWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC0tc3lzcm9vdD0v
aG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIzMDgvZGV2dG9vbHRtcC04bzV6YXhv
eS93b3JrZGlyL3JlY2lwZS1zeXNyb290CisrQVMgPSB4ODZfNjQtcG9reS1saW51eC1hcyAgCisr
QVIgPSB4ODZfNjQtcG9reS1saW51eC1nY2MtYXIKKytMRCA9IHg4Nl82NC1wb2t5LWxpbnV4LWxk
IC0tc3lzcm9vdD0vaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIzMDgvZGV2dG9v
bHRtcC04bzV6YXhveS93b3JrZGlyL3JlY2lwZS1zeXNyb290ICAKKyBlbHNlDQorIFZGUl9DUFBG
TEFHUyA9IC1EUENDVFNfVVNFX05BTUVTUEFDRV9TVEQgJChDUFBGTEFHUykNCisrQ0MgPSB4ODZf
NjQtcG9reS1saW51eC1nY2MgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMg
LW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09V
UkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkg
LS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3Rt
cC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjMwOC9kZXZ0b29s
dG1wLThvNXpheG95L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QKKytDWFggPSB4ODZfNjQtcG9reS1s
aW51eC1nKysgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9
c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdm
b3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290
PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjMwOC9kZXZ0b29sdG1wLThvNXph
eG95L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QKKytBUyA9IHg4Nl82NC1wb2t5LWxpbnV4LWFzICAK
KytBUiA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYy1hcgorK0xEID0geDg2XzY0LXBva3ktbGludXgt
bGQgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxk
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjMwOC9kZXZ0
b29sdG1wLThvNXpheG95L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QgIAorIGVuZGlmDQorICMga2Vl
cCBCVUlMRF9PUFRGTEFHUyBsYXN0DQorIFZGUl9DWFhGTEFHUyA9ICQoQlVJTERfT1BURkxBR1Mp
DQorZGlmZiAtLWdpdCBhL092bWZQa2cvYnVpbGQuc2ggYi9Pdm1mUGtnL2J1aWxkLnNoCitpbmRl
eCAyODVmMDYxYmY0Li42ODkwNzA5NThlIDEwMDc1NQorLS0tIGEvT3ZtZlBrZy9idWlsZC5zaAor
KysrIGIvT3ZtZlBrZy9idWlsZC5zaAorQEAgLTI0LDcgKzI0LDcgQEAgdGhlbgorICMgdGhpcyBh
c3N1bWVzIHN2biBwdWxscyBoYXZlIHRoZSBzYW1lIHJvb3QgZGlyCisgIyAgZXhwb3J0IEVES19U
T09MU19QQVRIPWBwd2RgLy4uL0Jhc2VUb29scworICMgVGhpcyB2ZXJzaW9uIGlzIGZvciB0aGUg
dG9vbHMgc291cmNlIGluIGVkazIKKy0gIGV4cG9ydCBFREtfVE9PTFNfUEFUSD1CQkFLRV9FREtf
VE9PTFNfUEFUSC9CYXNlVG9vbHMKKysgIGV4cG9ydCBFREtfVE9PTFNfUEFUSD0vaG9tZS9wb2t5
YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5
LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIzMDgvZGV2dG9vbHRtcC04bzV6YXhveS93b3JrZGly
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2VkazJfYmFzZXRvb2xzL0Jhc2VUb29scwor
ICAgZWNobyAkRURLX1RPT0xTX1BBVEgKKyAgIHNvdXJjZSBlZGtzZXR1cC5zaCBCYXNlVG9vbHMK
KyBlbHNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiIGIv
bWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYgppbmRleCAzZGMwMzFkM2I2Li5kY2Iy
OWMzYjE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIKQEAgLTI0LDEwICsyNCwxMSBA
QCBTUkNfVVJJID0gImdpdHNtOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi5naXQ7YnJhbmNo
PW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLUJhc2VUb29s
cy1tYWtlZmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAzLWRlYnVnLXByZWZpeC1tYXAucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vMDAwNC1yZXByb2R1Y2libGUucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwNS1D
b21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCBcCiAgICAgICAgICAgICIKIAot
UFYgPSAiZWRrMi1zdGFibGUyMDIzMDgiCi1TUkNSRVYgPSAiODE5Y2ZjNmI0MmE2ODc5MGEyMzUw
OWU0ZmNjNThjZWI3MGUxOTY1ZSIKK1BWID0gImVkazItc3RhYmxlMjAyMzExIgorU1JDUkVWID0g
Ijg3MzZiOGZkY2E4NWUwMjkzM2NkYjBhMTMzMDlkZTE0Yzk3OTllY2UiCiBVUFNUUkVBTV9DSEVD
S19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj5lZGsyLXN0YWJsZS4qKSIKIAogaW5oZXJpdCBkZXBs
b3kKLS0gCjIuNDIuMAoK

--===============5779449725200873520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6e4dc8e5387917df46e45bc161cbe192525e3f09"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6e4dc8e5387917df46e45bc161cbe192525e3f09"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 213 Local 197 Mirrors 0 Missed 16 Current 317 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 334 of 530 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 373 of 530 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-edk2-stable202311-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1621 of 1654 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1623 of 1654 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_fetch: Started
NOTE: recipe ovmf-edk2-stable202311-r0: task do_fetch: Succeeded
NOTE: Running task 1624 of 1654 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_fetch: Succeeded
NOTE: Running task 1625 of 1654 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1626 of 1654 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202311-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 1654 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202311-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1627 tasks of which 1621 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215061928.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215061928.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ovmf-edk2-stable202311-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: ovmf-edk2-stable202311-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202311/temp/log.do_patch.2146547
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============5779449725200873520==--


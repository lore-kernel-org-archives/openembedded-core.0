Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB9DC48BF5
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4625.1704114719290561820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QwcAQtkp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qk27tjIH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018cc52706bb-4c33b36f-4849-4478-b6b4-da415f0866fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=nUEL+kNJ8xkwRewSINdNwXKRfXwApmnttPg7uKU6J7o=;
	b=QwcAQtkpuh4V4tptt65XXL9c4RTDE4vVlW46QCJ65LcUzFThS8/zdMdmigqVpIgV
	fhMrCv6JMLSZ2tjhNfHQ9OtP8v4o65tSgdpYbg9q/X5T7jYNVxEniebOkkNknFUnNgA
	B4z5XJCnb7/jwt7O6cvn3HilO1GerQsMqRu/AZII=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=nUEL+kNJ8xkwRewSINdNwXKRfXwApmnttPg7uKU6J7o=;
	b=qk27tjIHddXpovHk6IkmMwu7IxsKA7cK1EvkcRlSTMX5l50VsbNxXCBUJPduRVxi
	YCy87O71dLqDfBsydyMCHYAa4c0Jf4T1oJ1GXo9SkJuQpj4JU2HDcMyW76jROxR2OWS
	LiGmBpzuGVGkjfjtJV1MeBLvdho0Ihwuq4Iyvd4Q=
Content-Type: multipart/mixed; boundary="===============0206464279569078121=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202311 FAILED
Message-ID: <0101018cc52706bb-4c33b36f-4849-4478-b6b4-da415f0866fa-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193109

--===============0206464279569078121==
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
From fc829e349add8aca5d3bb3072f678b7c902d6fb3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 05:37:02 +0000
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
index 490d9e8046..8dbd7c711c 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -1,7 +1,7 @@
-From d8df6b6433351763e1db791dd84d432983d2b249 Mon Sep 17 00:00:00 2001
+From eeb06fecf8cef543b4b33ad8241920f42e0dac9c Mon Sep 17 00:00:00 2001
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
index eeedc9e20f..681b4fb71f 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -1,4 +1,4 @@
-From ac9df4fb92965f1f95a5bdbde5f2f86d0c569711 Mon Sep 17 00:00:00 2001
+From 1e71c5504f73af6a339ffccb726ef91a2f16b46a Mon Sep 17 00:00:00 2001
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
index c0c763c1cf..a6a4ba15ab 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 03e536b20d0b72cf078052f6748de8df3836625c Mon Sep 17 00:00:00 2001
+From 39035d1bad673db2367c4ae4f1682060e8f39614 Mon Sep 17 00:00:00 2001
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
index c3fdc3d863..8eb0ad8f0b 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From c59850367a190d70dec43e0a66f399a4d8a5ffed Mon Sep 17 00:00:00 2001
+From f045e00b8db5a2b1c5ac40c9099482850b431164 Mon Sep 17 00:00:00 2001
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
index 0000000000..d46b7654e1
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch
@@ -0,0 +1,64 @@
+From c56bd83ed8626a8a421224ff4ad779390cd20826 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Mon, 1 Jan 2024 05:35:52 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ BaseTools/Source/C/Makefiles/app.makefile |  6 ++++++
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 10 ++++++++++
+ OvmfPkg/build.sh                          |  2 +-
+ 3 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
+index 506343a6e0..9fb860c5f8 100644
+--- a/BaseTools/Source/C/Makefiles/app.makefile
++++ b/BaseTools/Source/C/Makefiles/app.makefile
+@@ -10,6 +10,12 @@ MAKEROOT ?= ../..
+ include $(MAKEROOT)/Makefiles/header.makefile
+ 
+ APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot  
++LINKER = $(CC)
+ 
+ .PHONY:all
+ all: $(MAKEROOT)/bin $(APPLICATION)
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
+index 7d5976649d..ceebc42d2c 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -19,8 +19,18 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
+ CLANG:=$(shell $(CC) --version | grep clang)
+ ifneq ($(CLANG),)
+ VFR_CPPFLAGS = -Wno-deprecated-register -std=c++14 -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot  
+ else
+ VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
++CC = x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot
++CXX = x86_64-poky-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot
++AS = x86_64-poky-linux-as  
++AR = x86_64-poky-linux-gcc-ar
++LD = x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot  
+ endif
+ # keep BUILD_OPTFLAGS last
+ VFR_CXXFLAGS = $(BUILD_OPTFLAGS)
+diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
+index 285f061bf4..79f2c87446 100755
+--- a/OvmfPkg/build.sh
++++ b/OvmfPkg/build.sh
+@@ -24,7 +24,7 @@ then
+ # this assumes svn pulls have the same root dir
+ #  export EDK_TOOLS_PATH=`pwd`/../BaseTools
+ # This version is for the tools source in edk2
+-  export EDK_TOOLS_PATH=BBAKE_EDK_TOOLS_PATH/BaseTools
++  export EDK_TOOLS_PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202308/devtooltmp-lmniueev/workdir/recipe-sysroot-native/usr/bin/edk2_basetools/BaseTools
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


--===============0206464279569078121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (912 cached, 1 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4444f8d4b855767f2a6ded3bfb5607c339a60a43"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4444f8d4b855767f2a6ded3bfb5607c339a60a43"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 211 Local 193 Mirrors 0 Missed 18 Current 298 (91% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 316 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.01.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20230628.bb:do_create_spdx_setscene)
NOTE: Running task 360 of 1607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa)
NOTE: Running task 361 of 1607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acpica-native-20230628-r0: task do_create_spdx_setscene: Started
NOTE: recipe nasm-native-2.16.01-r0: task do_create_spdx_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe acpica-native-20230628-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nasm-native-2.16.01-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ovmf-edk2-stable202311-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa unihash changed to f4128a1b41f18b477cee05057e7c44fd17a3339068d8e40ca790e807dd58a3b7
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_recipe_qa: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa unihash changed to c691f0c5c0a9a30a31ad7a0b369a1caf0492b30f0966511a7f76bf64b69ceeb0
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 586 of 1607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: Running task 587 of 1607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ovmf-edk2-stable202311-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ovmf-edk2-stable202311-r0: task do_fetch: Succeeded
NOTE: Running task 1577 of 1607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_fetch: Succeeded
NOTE: Running task 1578 of 1607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1579 of 1607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202311-r0: task do_unpack: Succeeded
NOTE: Running task 1580 of 1607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202311-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202311-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202311-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1580 tasks of which 1572 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101053618.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101053618.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ovmf-edk2-stable202311-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf/0005-Committing-changes-from-do_patch.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: ovmf-edk2-stable202311-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202311/temp/log.do_patch.2158889
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============0206464279569078121==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202308-edk2-stable202311.patch"

RnJvbSBmYzgyOWUzNDlhZGQ4YWNhNWQzYmIzMDcyZjY3OGI3YzkwMmQ2ZmIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNTozNzowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG92
bWY6IHVwZ3JhZGUgZWRrMi1zdGFibGUyMDIzMDggLT4gZWRrMi1zdGFibGUyMDIzMTEKCi0tLQog
Li4ub3ZtZi11cGRhdGUtcGF0aC10by1uYXRpdmUtQmFzZVRvb2xzLnBhdGNoIHwgMTAgKystCiAu
Li5pbGUtYWRqdXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2ggfCAgNiArLQogLi4u
L292bWYvb3ZtZi8wMDAzLWRlYnVnLXByZWZpeC1tYXAucGF0Y2ggICAgIHwgMjQgKysrKy0tLQog
Li4uL292bWYvb3ZtZi8wMDA0LXJlcHJvZHVjaWJsZS5wYXRjaCAgICAgICAgIHwgMTggKysrLS0t
CiAuLi4wMDUtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2ggfCA2NCArKysr
KysrKysrKysrKysrKysrCiBtZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiICAgICAg
ICAgICAgfCAgNSArLQogNiBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAzNSBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYv
MDAwNS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaAoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAxLW92bWYtdXBkYXRlLXBhdGgtdG8tbmF0
aXZlLUJhc2VUb29scy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAxLW92
bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZlLUJhc2VUb29scy5wYXRjaAppbmRleCA0OTBkOWU4MDQ2
Li44ZGJkN2M3MTFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAw
MS1vdm1mLXVwZGF0ZS1wYXRoLXRvLW5hdGl2ZS1CYXNlVG9vbHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDEtb3ZtZi11cGRhdGUtcGF0aC10by1uYXRpdmUtQmFz
ZVRvb2xzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBkOGRmNmI2NDMzMzUxNzYzZTFkYjc5
MWRkODRkNDMyOTgzZDJiMjQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlZWIwNmZl
Y2Y4Y2VmNTQzYjRiMzNhZDgyNDE5MjBmNDJlMGRhYzljIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmljYXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwu
Y29tPgogRGF0ZTogVGh1LCA5IEp1biAyMDE2IDAyOjIzOjAxIC0wNzAwCi1TdWJqZWN0OiBbUEFU
Q0ggMS80XSBvdm1mOiB1cGRhdGUgcGF0aCB0byBuYXRpdmUgQmFzZVRvb2xzCitTdWJqZWN0OiBb
UEFUQ0hdIG92bWY6IHVwZGF0ZSBwYXRoIHRvIG5hdGl2ZSBCYXNlVG9vbHMKIAogQmFzZVRvb2xz
IGlzIGEgc2V0IG9mIHV0aWxpdGllcyB0byBidWlsZCBFREstYmFzZWQgZmlybXdhcmUuIFRoZXNl
IHV0aWxpdGllcwogYXJlIHVzZWQgZHVyaW5nIHRoZSBidWlsZCBwcm9jZXNzLiBUaHVzLCB0aGV5
IG5lZWQgdG8gYmUgYnVpbHQgbmF0aXZlbHkuCkBAIC0xMSwxMiArMTEsMTMgQEAgd2l0aCB0aGUg
YXBwcm9wcmlhdGUgbG9jYXRpb24gYmVmb3JlIGJ1aWxkaW5nLgogCiBTaWduZWQtb2ZmLWJ5OiBS
aWNhcmRvIE5lcmkgPHJpY2FyZG8ubmVyaS1jYWxkZXJvbkBsaW51eC5pbnRlbC5jb20+CiBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgY3Jvc3MgY29tcGlsZSBzcGVjaWZp
Y10KKwogLS0tCiAgT3ZtZlBrZy9idWlsZC5zaCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL092bWZQa2cvYnVpbGQu
c2ggYi9Pdm1mUGtnL2J1aWxkLnNoCi1pbmRleCBiMDMzNGZiNzZlLi4wOTRmODZmMDk2IDEwMDc1
NQoraW5kZXggMjc5ZjBkMDk5YS4uMjg1ZjA2MWJmNCAxMDA3NTUKIC0tLSBhL092bWZQa2cvYnVp
bGQuc2gKICsrKyBiL092bWZQa2cvYnVpbGQuc2gKIEBAIC0yNCw3ICsyNCw3IEBAIHRoZW4KQEAg
LTI4LDYgKzI5LDMgQEAgaW5kZXggYjAzMzRmYjc2ZS4uMDk0Zjg2ZjA5NiAxMDA3NTUKICAgIGVj
aG8gJEVES19UT09MU19QQVRICiAgICBzb3VyY2UgZWRrc2V0dXAuc2ggQmFzZVRvb2xzCiAgZWxz
ZQotLS0gCi0yLjMwLjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1m
LzAwMDItQmFzZVRvb2xzLW1ha2VmaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtl
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDItQmFzZVRvb2xzLW1ha2Vm
aWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNoCmluZGV4IGVlZWRjOWUy
MGYuLjY4MWI0ZmI3MWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8w
MDAyLUJhc2VUb29scy1tYWtlZmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMi1CYXNlVG9vbHMtbWFr
ZWZpbGUtYWRqdXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGFjOWRmNGZiOTI5NjVmMWY5NWE1YmRiZGU1ZjJmODZkMGM1Njk3MTEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFlNzFjNTUwNGY3M2FmNmEzMzlmZmNjYjcyNmVmOTFh
MmYxNmI0NmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNhcmRvIE5lcmkgPHJp
Y2FyZG8ubmVyaS1jYWxkZXJvbkBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBGcmksIDI2IEp1bCAy
MDE5IDE3OjM0OjI2IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEJhc2VUb29sczogbWFrZWZpbGU6
IGFkanVzdCB0byBidWlsZCBpbiB1bmRlciBiaXRiYWtlCkBAIC0xMyw2ICsxMyw3IEBAIHRvIGZp
Z2h0IGFnYWluc3QgaG93IHVwc3RyZWFtIHdhbnRzIHRvIGNvbmZpZ3VyZSB0aGUgYnVpbGQuCiAK
IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gTmVyaSA8cmljYXJkby5uZXJpQGxpbnV4LmludGVsLmNv
bT4KIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbbmVlZHMgdG8gYmUgY29udmVydGVk
IHRvIGluLXJlY2lwZSBmaXh1cHNdCisKIC0tLQogIEJhc2VUb29scy9Tb3VyY2UvQy9NYWtlZmls
ZXMvaGVhZGVyLm1ha2VmaWxlIHwgMTUgKysrKysrKy0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKQEAgLTY0LDYgKzY1LDMgQEAgaW5kZXgg
ZDM2OTkwOGEwOS4uMjJjNjcwZjMxNiAxMDA2NDQKICBpZmVxICgkKEhPU1RfQVJDSCksIElBMzIp
DQogICMNCiAgIyBTbm93IExlb3BhcmQgIGlzIGEgMzItYml0IGFuZCA2NC1iaXQgZW52aXJvbm1l
bnQuIHVuYW1lIC1tIHJldHVybnMgaTM4NiwgYnV0IGdjYyBkZWZhdWx0cw0KLS0tIAotMi4zMC4y
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAzLWRlYnVnLXBy
ZWZpeC1tYXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMy1kZWJ1Zy1w
cmVmaXgtbWFwLnBhdGNoCmluZGV4IGMwYzc2M2MxY2YuLmE2YTRiYTE1YWIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAzLWRlYnVnLXByZWZpeC1tYXAucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDMtZGVidWctcHJlZml4LW1hcC5w
YXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMDNlNTM2YjIwZDBiNzJjZjA3ODA1MmY2NzQ4ZGU4
ZGYzODM2NjI1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzkwMzVkMWJhZDY3M2Ri
MjM2N2M0YWU0ZjE2ODIwNjBlOGYzOTYxNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCAx
NCBKdW4gMjAyMSAxOTo1NjoyOCArMDIwMAotU3ViamVjdDogW1BBVENIIDMvNF0gZGVidWcgcHJl
Zml4IG1hcAorU3ViamVjdDogW1BBVENIXSBkZWJ1ZyBwcmVmaXggbWFwCiAKIFdlIHdhbnQgdG8g
cGFzcyAke0RFQlVHX1BSRUZJWF9NQVB9IHRvIGdjYyBjb21tYW5kcyBhbmQgYWxzbyBwYXNzIGlu
CiAgLS1kZWJ1Zy1wcmVmaXgtbWFwIHRvIG5hc20gKHdlIGNhcnJ5IGEgcGF0Y2ggdG8gbmFzbSBm
b3IgdGhpcykuIFRoZQpAQCAtMTcsMTIgKzE3LDEzIEBAIHRoZSBjYXNlIGlmIHRoZSBzaXplIG9m
IHRoZSBkZWJ1ZyBzeW1ib2xzIHZhcmllcy4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFto
dHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvcHVsbC8yMjAyXQogU2lnbmVkLW9mZi1i
eTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
KwogLS0tCiAgQmFzZVRvb2xzL0NvbmYvdG9vbHNfZGVmLnRlbXBsYXRlIHwgMTggKysrKysrKysr
LS0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL0Jhc2VUb29scy9Db25mL3Rvb2xzX2RlZi50ZW1wbGF0ZSBiL0Jh
c2VUb29scy9Db25mL3Rvb2xzX2RlZi50ZW1wbGF0ZQotaW5kZXggNTAzYTY2ODdjMS4uMTBhYzM4
ZWY5ZSAxMDA3NTUKK2luZGV4IGMzNGVjZmQ1NTcuLmMxN2M4N2Q2ODMgMTAwNzU1CiAtLS0gYS9C
YXNlVG9vbHMvQ29uZi90b29sc19kZWYudGVtcGxhdGUKICsrKyBiL0Jhc2VUb29scy9Db25mL3Rv
b2xzX2RlZi50ZW1wbGF0ZQogQEAgLTczOSw3ICs3MzksNyBAQCBOT09QVF8qXypfT0JKQ09QWV9B
RERERUJVR0ZMQUcgICAgID0gLS1hZGQtZ251LWRlYnVnbGluaz0iJChERUJVR19ESVIpLyQoTU9E
VUxFXwpAQCAtMzQsNyArMzUsNyBAQCBpbmRleCA1MDNhNjY4N2MxLi4xMGFjMzhlZjllIDEwMDc1
NQogIERFRklORSBHQ0NfQVJNX0NDX0ZMQUdTICAgICAgICAgICAgPSBERUYoR0NDX0FMTF9DQ19G
TEFHUykgLW1saXR0bGUtZW5kaWFuIC1tYWJpPWFhcGNzIC1mbm8tc2hvcnQtZW51bXMgLWZ1bnNp
Z25lZC1jaGFyIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zIC1mb21pdC1mcmFt
ZS1wb2ludGVyIC1Xbm8tYWRkcmVzcyAtbXRodW1iIC1mbm8tcGljIC1mbm8tcGllDQogIERFRklO
RSBHQ0NfTE9PTkdBUkNINjRfQ0NfRkxBR1MgICAgPSBERUYoR0NDX0FMTF9DQ19GTEFHUykgLW1h
Ymk9bHA2NGQgLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtZm5vLXBsdCAtV25vLWFk
ZHJlc3MgLWZuby1zaG9ydC1lbnVtcyAtZnNpZ25lZC1jaGFyIC1mZnVuY3Rpb24tc2VjdGlvbnMg
LWZkYXRhLXNlY3Rpb25zDQogIERFRklORSBHQ0NfQVJNX0NDX1hJUEZMQUdTICAgICAgICAgPSAt
bW5vLXVuYWxpZ25lZC1hY2Nlc3MNCi1AQCAtNzU5LDggKzc1OSw4IEBAIERFRklORSBHQ0NfQVJN
X0FTTERMSU5LX0ZMQUdTICAgICAgPSBERUYoR0NDX0FSTV9ETElOS19GTEFHUykgLVdsLC0tZW50
cnksUmVmZXJlCitAQCAtNzYwLDggKzc2MCw4IEBAIERFRklORSBHQ0NfQVJNX0FTTERMSU5LX0ZM
QUdTICAgICAgPSBERUYoR0NDX0FSTV9ETElOS19GTEFHUykgLVdsLC0tZW50cnksUmVmZXJlCiAg
REVGSU5FIEdDQ19BQVJDSDY0X0FTTERMSU5LX0ZMQUdTICA9IERFRihHQ0NfQUFSQ0g2NF9ETElO
S19GTEFHUykgLVdsLC0tZW50cnksUmVmZXJlbmNlQWNwaVRhYmxlIC11ICQoSU1BR0VfRU5UUllf
UE9JTlQpIERFRihHQ0NfQVJNX0FBUkNINjRfQVNMRExJTktfRkxBR1MpDQogIERFRklORSBHQ0Nf
TE9PTkdBUkNINjRfQVNMRExJTktfRkxBR1MgPSBERUYoR0NDX0xPT05HQVJDSDY0X0RMSU5LX0ZM
QUdTKSAtV2wsLS1lbnRyeSxSZWZlcmVuY2VBY3BpVGFibGUgLXUgJChJTUFHRV9FTlRSWV9QT0lO
VCkNCiAgREVGSU5FIEdDQ19JQTMyX1g2NF9ETElOS19GTEFHUyAgICA9IERFRihHQ0NfSUEzMl9Y
NjRfRExJTktfQ09NTU9OKSAtLWVudHJ5IF8kKElNQUdFX0VOVFJZX1BPSU5UKSAtLWZpbGUtYWxp
Z25tZW50IDB4MjAgLS1zZWN0aW9uLWFsaWdubWVudCAweDIwIC1NYXAgJChERVNUX0RJUl9ERUJV
RykvJChCQVNFX05BTUUpLm1hcA0KQEAgLTQ1LDcgKzQ2LDcgQEAgaW5kZXggNTAzYTY2ODdjMS4u
MTBhYzM4ZWY5ZSAxMDA3NTUKICBERUZJTkUgR0NDX1ZGUlBQX0ZMQUdTICAgICAgICAgICAgID0g
LXggYyAtRSAtUCAtRFZGUkNPTVBJTEUgLS1pbmNsdWRlICQoTU9EVUxFX05BTUUpU3RyRGVmcy5o
DQogIERFRklORSBHQ0NfQVNMUFBfRkxBR1MgICAgICAgICAgICAgPSAteCBjIC1FIC1pbmNsdWRl
IEF1dG9HZW4uaA0KICBERUZJTkUgR0NDX0FTTENDX0ZMQUdTICAgICAgICAgICAgID0gLXggYw0K
LUBAIC05MTMsNyArOTEzLDcgQEAgREVGSU5FIEdDQzVfTE9PTkdBUkNINjRfUFBfRkxBR1MgICAg
ICAgICAgID0gLW1hYmk9bHA2NGQgLW1hcmNoPWxvb25nYXJjaDY0IERFRigKK0BAIC05MTQsNyAr
OTE0LDcgQEAgREVGSU5FIEdDQzVfTE9PTkdBUkNINjRfUFBfRkxBR1MgICAgICAgICAgID0gLW1h
Ymk9bHA2NGQgLW1hcmNoPWxvb25nYXJjaDY0IERFRigKICAqX0dDQzQ4X0lBMzJfRExJTksyX0ZM
QUdTICAgICAgICAgPSBERUYoR0NDNDhfSUEzMl9ETElOSzJfRkxBR1MpDQogICpfR0NDNDhfSUEz
Ml9SQ19GTEFHUyAgICAgICAgICAgICA9IERFRihHQ0NfSUEzMl9SQ19GTEFHUykNCiAgKl9HQ0M0
OF9JQTMyX09CSkNPUFlfRkxBR1MgICAgICAgID0NCkBAIC01NCw3ICs1NSw3IEBAIGluZGV4IDUw
M2E2Njg3YzEuLjEwYWMzOGVmOWUgMTAwNzU1CiAgDQogICAgREVCVUdfR0NDNDhfSUEzMl9DQ19G
TEFHUyAgICAgICA9IERFRihHQ0M0OF9JQTMyX0NDX0ZMQUdTKQ0KICBSRUxFQVNFX0dDQzQ4X0lB
MzJfQ0NfRkxBR1MgICAgICAgPSBERUYoR0NDNDhfSUEzMl9DQ19GTEFHUykgLVduby11bnVzZWQt
YnV0LXNldC12YXJpYWJsZQ0KLUBAIC05NDEsNyArOTQxLDcgQEAgUkVMRUFTRV9HQ0M0OF9JQTMy
X0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ4X0lBMzJfQ0NfRkxBR1MpIC1Xbm8tdW51c2VkLWJ1
dC1zZXQKK0BAIC05NDIsNyArOTQyLDcgQEAgUkVMRUFTRV9HQ0M0OF9JQTMyX0NDX0ZMQUdTICAg
ICAgID0gREVGKEdDQzQ4X0lBMzJfQ0NfRkxBR1MpIC1Xbm8tdW51c2VkLWJ1dC1zZXQKICAqX0dD
QzQ4X1g2NF9ETElOSzJfRkxBR1MgICAgICAgICA9IERFRihHQ0M0OF9YNjRfRExJTksyX0ZMQUdT
KQ0KICAqX0dDQzQ4X1g2NF9SQ19GTEFHUyAgICAgICAgICAgICA9IERFRihHQ0NfWDY0X1JDX0ZM
QUdTKQ0KICAqX0dDQzQ4X1g2NF9PQkpDT1BZX0ZMQUdTICAgICAgICA9DQpAQCAtNjMsNyArNjQs
NyBAQCBpbmRleCA1MDNhNjY4N2MxLi4xMGFjMzhlZjllIDEwMDc1NQogIA0KICAgIERFQlVHX0dD
QzQ4X1g2NF9DQ19GTEFHUyAgICAgICA9IERFRihHQ0M0OF9YNjRfQ0NfRkxBR1MpDQogIFJFTEVB
U0VfR0NDNDhfWDY0X0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ4X1g2NF9DQ19GTEFHUykgLVdu
by11bnVzZWQtYnV0LXNldC12YXJpYWJsZQ0KLUBAIC0xMDUwLDcgKzEwNTAsNyBAQCBSRUxFQVNF
X0dDQzQ4X0FBUkNINjRfQ0NfRkxBR1MgICA9IERFRihHQ0M0OF9BQVJDSDY0X0NDX0ZMQUdTKSAt
V25vLXVudXNlZC1idXQtcworQEAgLTEwNTEsNyArMTA1MSw3IEBAIFJFTEVBU0VfR0NDNDhfQUFS
Q0g2NF9DQ19GTEFHUyAgID0gREVGKEdDQzQ4X0FBUkNINjRfQ0NfRkxBR1MpIC1Xbm8tdW51c2Vk
LWJ1dC1zCiAgKl9HQ0M0OV9JQTMyX0RMSU5LMl9GTEFHUyAgICAgICAgID0gREVGKEdDQzQ5X0lB
MzJfRExJTksyX0ZMQUdTKQ0KICAqX0dDQzQ5X0lBMzJfUkNfRkxBR1MgICAgICAgICAgICAgPSBE
RUYoR0NDX0lBMzJfUkNfRkxBR1MpDQogICpfR0NDNDlfSUEzMl9PQkpDT1BZX0ZMQUdTICAgICAg
ICA9DQpAQCAtNzIsNyArNzMsNyBAQCBpbmRleCA1MDNhNjY4N2MxLi4xMGFjMzhlZjllIDEwMDc1
NQogIA0KICAgIERFQlVHX0dDQzQ5X0lBMzJfQ0NfRkxBR1MgICAgICAgPSBERUYoR0NDNDlfSUEz
Ml9DQ19GTEFHUykNCiAgUkVMRUFTRV9HQ0M0OV9JQTMyX0NDX0ZMQUdTICAgICAgID0gREVGKEdD
QzQ5X0lBMzJfQ0NfRkxBR1MpIC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11bnVz
ZWQtY29uc3QtdmFyaWFibGUNCi1AQCAtMTA3OCw3ICsxMDc4LDcgQEAgUkVMRUFTRV9HQ0M0OV9J
QTMyX0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ5X0lBMzJfQ0NfRkxBR1MpIC1Xbm8tdW51c2Vk
LWJ1dC1zZXQKK0BAIC0xMDc5LDcgKzEwNzksNyBAQCBSRUxFQVNFX0dDQzQ5X0lBMzJfQ0NfRkxB
R1MgICAgICAgPSBERUYoR0NDNDlfSUEzMl9DQ19GTEFHUykgLVduby11bnVzZWQtYnV0LXNldAog
ICpfR0NDNDlfWDY0X0RMSU5LMl9GTEFHUyAgICAgICAgID0gREVGKEdDQzQ5X1g2NF9ETElOSzJf
RkxBR1MpDQogICpfR0NDNDlfWDY0X1JDX0ZMQUdTICAgICAgICAgICAgID0gREVGKEdDQ19YNjRf
UkNfRkxBR1MpDQogICpfR0NDNDlfWDY0X09CSkNPUFlfRkxBR1MgICAgICAgID0NCkBAIC04MSw3
ICs4Miw3IEBAIGluZGV4IDUwM2E2Njg3YzEuLjEwYWMzOGVmOWUgMTAwNzU1CiAgDQogICAgREVC
VUdfR0NDNDlfWDY0X0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ5X1g2NF9DQ19GTEFHUykNCiAg
UkVMRUFTRV9HQ0M0OV9YNjRfQ0NfRkxBR1MgICAgICAgPSBERUYoR0NDNDlfWDY0X0NDX0ZMQUdT
KSAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51c2VkLWNvbnN0LXZhcmlhYmxl
DQotQEAgLTEzMzcsNyArMTMzNyw3IEBAIFJFTEVBU0VfR0NDTk9MVE9fQUFSQ0g2NF9ETElOS19Y
SVBGTEFHUyA9IC16IGNvbW1vbi1wYWdlLXNpemU9MHgyMAorQEAgLTEzMzgsNyArMTMzOCw3IEBA
IFJFTEVBU0VfR0NDTk9MVE9fQUFSQ0g2NF9ETElOS19YSVBGTEFHUyA9IC16IGNvbW1vbi1wYWdl
LXNpemU9MHgyMAogICpfR0NDNV9JQTMyX0RMSU5LMl9GTEFHUyAgICAgICAgID0gREVGKEdDQzVf
SUEzMl9ETElOSzJfRkxBR1MpIC1uby1waWUNCiAgKl9HQ0M1X0lBMzJfUkNfRkxBR1MgICAgICAg
ICAgICAgPSBERUYoR0NDX0lBMzJfUkNfRkxBR1MpDQogICpfR0NDNV9JQTMyX09CSkNPUFlfRkxB
R1MgICAgICAgID0NCkBAIC05MCw3ICs5MSw3IEBAIGluZGV4IDUwM2E2Njg3YzEuLjEwYWMzOGVm
OWUgMTAwNzU1CiAgDQogICAgREVCVUdfR0NDNV9JQTMyX0NDX0ZMQUdTICAgICAgID0gREVGKEdD
QzVfSUEzMl9DQ19GTEFHUykgLWZsdG8NCiAgICBERUJVR19HQ0M1X0lBMzJfRExJTktfRkxBR1Mg
ICAgPSBERUYoR0NDNV9JQTMyX1g2NF9ETElOS19GTEFHUykgLWZsdG8gLU9zIC1XbCwtbSxlbGZf
aTM4NiwtLW9mb3JtYXQ9ZWxmMzItaTM4Ng0KLUBAIC0xMzY5LDcgKzEzNjksNyBAQCBSRUxFQVNF
X0dDQzVfSUEzMl9ETElOS19GTEFHUyAgICA9IERFRihHQ0M1X0lBMzJfWDY0X0RMSU5LX0ZMQUdT
KSAtZmx0byAtT3MgLVdsLAorQEAgLTEzNzAsNyArMTM3MCw3IEBAIFJFTEVBU0VfR0NDNV9JQTMy
X0RMSU5LX0ZMQUdTICAgID0gREVGKEdDQzVfSUEzMl9YNjRfRExJTktfRkxBR1MpIC1mbHRvIC1P
cyAtV2wsCiAgKl9HQ0M1X1g2NF9ETElOSzJfRkxBR1MgICAgICAgICAgPSBERUYoR0NDNV9YNjRf
RExJTksyX0ZMQUdTKQ0KICAqX0dDQzVfWDY0X1JDX0ZMQUdTICAgICAgICAgICAgICA9IERFRihH
Q0NfWDY0X1JDX0ZMQUdTKQ0KICAqX0dDQzVfWDY0X09CSkNPUFlfRkxBR1MgICAgICAgICA9DQpA
QCAtOTksNiArMTAwLDMgQEAgaW5kZXggNTAzYTY2ODdjMS4uMTBhYzM4ZWY5ZSAxMDA3NTUKICAN
CiAgICBERUJVR19HQ0M1X1g2NF9DQ19GTEFHUyAgICAgICAgPSBERUYoR0NDNV9YNjRfQ0NfRkxB
R1MpIC1mbHRvIC1EVVNJTkdfTFRPDQogICAgREVCVUdfR0NDNV9YNjRfRExJTktfRkxBR1MgICAg
ID0gREVGKEdDQzVfWDY0X0RMSU5LX0ZMQUdTKSAtZmx0byAtT3MNCi0tLSAKLTIuMzAuMgotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwNC1yZXByb2R1Y2libGUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwNC1yZXByb2R1Y2libGUucGF0
Y2gKaW5kZXggYzNmZGMzZDg2My4uOGViMGFkOGYwYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvb3ZtZi9vdm1mLzAwMDQtcmVwcm9kdWNpYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL292bWYvb3ZtZi8wMDA0LXJlcHJvZHVjaWJsZS5wYXRjaApAQCAtMSw3ICsxLDcgQEAK
LUZyb20gYzU5ODUwMzY3YTE5MGQ3MGRlYzQzZTBhNjZmMzk5YTRkOGE1ZmZlZCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjA0NWUwMGI4ZGI1YTJiMWM1YWM0MGM5MDk5NDgyODUwYjQz
MTE2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNCBKdW4gMjAyMSAxOTo1NzozMCAr
MDIwMAotU3ViamVjdDogW1BBVENIIDQvNF0gcmVwcm9kdWNpYmxlCitTdWJqZWN0OiBbUEFUQ0hd
IHJlcHJvZHVjaWJsZQogCiBUaGlzIHBhdGNoIGZpeGVzIHZhcmlvdXMgdGhpbmdzIHdoaWNoIG1h
a2UgdGhlIGJ1aWxkIG1vcmUgcmVwcm9kdWNpYmxlLiBTb21lIGNoYW5nZXMKIGhlcmUgb25seSBj
aGFuZ2UgaW50ZXJtZWRpYXRlIGFydGVmYWN0cyBidXQgdGhhdCBtZWFucyB3aGVuIHlvdSBoYXZl
IHR3byBidWlsZCB0cmVlcwpAQCAtMjcsNiArMjcsNyBAQCBUaGUgcGF0Y2ggc3BlY2lmaWNhbGx5
OgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS90aWFub2Nv
cmUvZWRrMi9wdWxsLzIxNzZdCiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgorCiAtLS0KICBCYXNlVG9vbHMvU291cmNl
L0MvR2VuRncvRWxmNjRDb252ZXJ0LmMgICAgICAgfCAgOCArKysrLS0tCiAgLi4uL1NvdXJjZS9Q
eXRob24vQXV0b0dlbi9CdWlsZEVuZ2luZS5weSAgICAgIHwgIDMgKysrCkBAIC0zNSwxMCArMzYs
MTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiAgNCBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL0Jhc2VUb29scy9Tb3VyY2UvQy9HZW5Gdy9FbGY2NENvbnZlcnQu
YyBiL0Jhc2VUb29scy9Tb3VyY2UvQy9HZW5Gdy9FbGY2NENvbnZlcnQuYwotaW5kZXggOWMxN2M5
MGIxNi4uZmNjNzg2NDE0MSAxMDA2NDQKK2luZGV4IDk5MTFkYjY1YWYuLmJkODc5MDkwNjYgMTAw
NjQ0CiAtLS0gYS9CYXNlVG9vbHMvU291cmNlL0MvR2VuRncvRWxmNjRDb252ZXJ0LmMKICsrKyBi
L0Jhc2VUb29scy9Tb3VyY2UvQy9HZW5Gdy9FbGY2NENvbnZlcnQuYwotQEAgLTE1LDYgKzE1LDgg
QEAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZS1QYXRlbnQKK0BAIC0xMyw2
ICsxMyw4IEBAIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UtUGF0ZW50CiAg
I2lmbmRlZiBfX0dOVUNfXw0KICAjaW5jbHVkZSA8d2luZG93cy5oPg0KICAjaW5jbHVkZSA8aW8u
aD4NCkBAIC00Nyw3ICs0OCw3IEBAIGluZGV4IDljMTdjOTBiMTYuLmZjYzc4NjQxNDEgMTAwNjQ0
CiAgI2VuZGlmDQogICNpbmNsdWRlIDxhc3NlcnQuaD4NCiAgI2luY2x1ZGUgPHN0ZGlvLmg+DQot
QEAgLTk5MCw3ICs5OTIsNyBAQCBTY2FuU2VjdGlvbnM2NCAoCitAQCAtOTg4LDcgKzk5MCw3IEBA
IFNjYW5TZWN0aW9uczY0ICgKICAgIH0NCiAgICBtQ29mZk9mZnNldCA9IG1EZWJ1Z09mZnNldCAr
IHNpemVvZihFRklfSU1BR0VfREVCVUdfRElSRUNUT1JZX0VOVFJZKSArDQogICAgICAgICAgICAg
ICAgICBzaXplb2YoRUZJX0lNQUdFX0RFQlVHX0NPREVWSUVXX05CMTBfRU5UUlkpICsNCkBAIC01
Niw3ICs1Nyw3IEBAIGluZGV4IDljMTdjOTBiMTYuLmZjYzc4NjQxNDEgMTAwNjQ0CiAgDQogICAg
Ly8NCiAgICAvLyBBZGQgbW9yZSBzcGFjZSBpbiB0aGUgLmRlYnVnIGRhdGEgcmVnaW9uIGZvciB0
aGUgRGxsQ2hhcmFjdGVyaXN0aWNzRXgNCi1AQCAtMjI2MSw3ICsyMjYzLDcgQEAgV3JpdGVEZWJ1
ZzY0ICgKK0BAIC0yMjc5LDcgKzIyODEsNyBAQCBXcml0ZURlYnVnNjQgKAogICAgRUZJX0lNQUdF
X0RFQlVHX0NPREVWSUVXX05CMTBfRU5UUlkgICAgICAgICAqTmIxMDsNCiAgICBFRklfSU1BR0Vf
REVCVUdfRVhfRExMQ0hBUkFDVEVSSVNUSUNTX0VOVFJZICpEbGxFbnRyeTsNCiAgDQpAQCAtNjUs
NyArNjYsNyBAQCBpbmRleCA5YzE3YzkwYjE2Li5mY2M3ODY0MTQxIDEwMDY0NAogIA0KICAgIE50
SGRyID0gKEVGSV9JTUFHRV9PUFRJT05BTF9IRUFERVJfVU5JT04gKikobUNvZmZGaWxlICsgbU50
SGRyT2Zmc2V0KTsNCiAgICBEYXRhRGlyID0gJk50SGRyLT5QZTMyUGx1cy5PcHRpb25hbEhlYWRl
ci5EYXRhRGlyZWN0b3J5W0VGSV9JTUFHRV9ESVJFQ1RPUllfRU5UUllfREVCVUddOw0KLUBAIC0y
Mjk0LDcgKzIyOTYsNyBAQCBXcml0ZURlYnVnNjQgKAorQEAgLTIzMTIsNyArMjMxNCw3IEBAIFdy
aXRlRGVidWc2NCAoCiAgDQogICAgTmIxMCA9IChFRklfSU1BR0VfREVCVUdfQ09ERVZJRVdfTkIx
MF9FTlRSWSopKERpciArIDEpOw0KICAgIE5iMTAtPlNpZ25hdHVyZSA9IENPREVWSUVXX1NJR05B
VFVSRV9OQjEwOw0KQEAgLTE3NSw2ICsxNzYsMyBAQCBpbmRleCBkMDU0MTBiMzI5Li45OWIzZjY0
YWJhIDEwMDc1NQogIA0KICAgICAgICAgICMgSWdub3JlIGdlbmVyYXRpbmcgbWFrZWZpbGUgd2hl
biBpdCBpcyBhIGJpbmFyeSBtb2R1bGUNCiAgICAgICAgICBpZiBzZWxmLklzQmluYXJ5TW9kdWxl
Og0KLS0tIAotMi4zMC4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3Zt
Zi8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDUtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gu
cGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDQ2Yjc2NTRlMQot
LS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDA1LUNvbW1p
dHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoCkBAIC0wLDAgKzEsNjQgQEAKK0Zyb20g
YzU2YmQ4M2VkODYyNmE4YTQyMTIyNGZmNGFkNzc5MzkwY2QyMDgyNiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb206IE9wZW5FbWJlZGRlZCA8b2UucGF0Y2hAb2U+CitEYXRlOiBNb24sIDEg
SmFuIDIwMjQgMDU6MzU6NTIgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gQ29tbWl0dGluZyBjaGFu
Z2VzIGZyb20gZG9fcGF0Y2gKKworLS0tCisgQmFzZVRvb2xzL1NvdXJjZS9DL01ha2VmaWxlcy9h
cHAubWFrZWZpbGUgfCAgNiArKysrKysKKyBCYXNlVG9vbHMvU291cmNlL0MvVmZyQ29tcGlsZS9H
TlVtYWtlZmlsZSB8IDEwICsrKysrKysrKysKKyBPdm1mUGtnL2J1aWxkLnNoICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCisgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9CYXNlVG9vbHMvU291cmNlL0MvTWFrZWZp
bGVzL2FwcC5tYWtlZmlsZSBiL0Jhc2VUb29scy9Tb3VyY2UvQy9NYWtlZmlsZXMvYXBwLm1ha2Vm
aWxlCitpbmRleCA1MDYzNDNhNmUwLi45ZmI4NjBjNWY4IDEwMDY0NAorLS0tIGEvQmFzZVRvb2xz
L1NvdXJjZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUKKysrKyBiL0Jhc2VUb29scy9Tb3VyY2Uv
Qy9NYWtlZmlsZXMvYXBwLm1ha2VmaWxlCitAQCAtMTAsNiArMTAsMTIgQEAgTUFLRVJPT1QgPz0g
Li4vLi4KKyBpbmNsdWRlICQoTUFLRVJPT1QpL01ha2VmaWxlcy9oZWFkZXIubWFrZWZpbGUNCisg
DQorIEFQUExJQ0FUSU9OID0gJChNQUtFUk9PVCkvYmluLyQoQVBQTkFNRSkNCisrQ0MgPSB4ODZf
NjQtcG9reS1saW51eC1nY2MgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMg
LW1mcG1hdGg9c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09V
UkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkg
LS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3Rt
cC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjMwOC9kZXZ0b29s
dG1wLWxtbml1ZWV2L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QKKytDWFggPSB4ODZfNjQtcG9reS1s
aW51eC1nKysgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9
c3NlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdm
b3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290
PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjMwOC9kZXZ0b29sdG1wLWxtbml1
ZWV2L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QKKytBUyA9IHg4Nl82NC1wb2t5LWxpbnV4LWFzICAK
KytBUiA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYy1hcgorK0xEID0geDg2XzY0LXBva3ktbGludXgt
bGQgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxk
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjMwOC9kZXZ0
b29sdG1wLWxtbml1ZWV2L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QgIAorK0xJTktFUiA9ICQoQ0Mp
CisgDQorIC5QSE9OWTphbGwNCisgYWxsOiAkKE1BS0VST09UKS9iaW4gJChBUFBMSUNBVElPTikN
CitkaWZmIC0tZ2l0IGEvQmFzZVRvb2xzL1NvdXJjZS9DL1ZmckNvbXBpbGUvR05VbWFrZWZpbGUg
Yi9CYXNlVG9vbHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtlZmlsZQoraW5kZXggN2Q1OTc2
NjQ5ZC4uY2VlYmM0MmQyYyAxMDA2NDQKKy0tLSBhL0Jhc2VUb29scy9Tb3VyY2UvQy9WZnJDb21w
aWxlL0dOVW1ha2VmaWxlCisrKysgYi9CYXNlVG9vbHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVt
YWtlZmlsZQorQEAgLTE5LDggKzE5LDE4IEBAIE9CSkVDVFMgPSBBUGFyc2VyLm8gRExleGVyQmFz
ZS5vIEFUb2tlbkJ1ZmZlci5vIEVmaVZmclBhcnNlci5vIFZmckxleGVyLm8gVmZyU3luCisgQ0xB
Tkc6PSQoc2hlbGwgJChDQykgLS12ZXJzaW9uIHwgZ3JlcCBjbGFuZykNCisgaWZuZXEgKCQoQ0xB
TkcpLCkNCisgVkZSX0NQUEZMQUdTID0gLVduby1kZXByZWNhdGVkLXJlZ2lzdGVyIC1zdGQ9Yysr
MTQgLURQQ0NUU19VU0VfTkFNRVNQQUNFX1NURCAkKENQUEZMQUdTKQ0KKytDQyA9IHg4Nl82NC1w
b2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAtbWZw
bWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9
MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5
c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvdG1wL3dv
cmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRvb2x0bXAt
bG1uaXVlZXYvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0NYWCA9IHg4Nl82NC1wb2t5LWxpbnV4
LWcrKyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2Ug
LWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1h
dCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2hv
bWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRvb2x0bXAtbG1uaXVlZXYv
d29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0FTID0geDg2XzY0LXBva3ktbGludXgtYXMgIAorK0FS
ID0geDg2XzY0LXBva3ktbGludXgtZ2NjLWFyCisrTEQgPSB4ODZfNjQtcG9reS1saW51eC1sZCAt
LXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRvb2x0
bXAtbG1uaXVlZXYvd29ya2Rpci9yZWNpcGUtc3lzcm9vdCAgCisgZWxzZQ0KKyBWRlJfQ1BQRkxB
R1MgPSAtRFBDQ1RTX1VTRV9OQU1FU1BBQ0VfU1REICQoQ1BQRkxBR1MpDQorK0NDID0geDg2XzY0
LXBva3ktbGludXgtZ2NjICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2UzIC1t
ZnBtYXRoPXNzZSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJD
RT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC0t
c3lzcm9vdD0vaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIzMDgvZGV2dG9vbHRt
cC1sbW5pdWVldi93b3JrZGlyL3JlY2lwZS1zeXNyb290CisrQ1hYID0geDg2XzY0LXBva3ktbGlu
dXgtZysrICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2UzIC1tZnBtYXRoPXNz
ZSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9y
bWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC0tc3lzcm9vdD0v
aG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIzMDgvZGV2dG9vbHRtcC1sbW5pdWVl
di93b3JrZGlyL3JlY2lwZS1zeXNyb290CisrQVMgPSB4ODZfNjQtcG9reS1saW51eC1hcyAgCisr
QVIgPSB4ODZfNjQtcG9reS1saW51eC1nY2MtYXIKKytMRCA9IHg4Nl82NC1wb2t5LWxpbnV4LWxk
IC0tc3lzcm9vdD0vaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L292bWYvZWRrMi1zdGFibGUyMDIzMDgvZGV2dG9v
bHRtcC1sbW5pdWVldi93b3JrZGlyL3JlY2lwZS1zeXNyb290ICAKKyBlbmRpZg0KKyAjIGtlZXAg
QlVJTERfT1BURkxBR1MgbGFzdA0KKyBWRlJfQ1hYRkxBR1MgPSAkKEJVSUxEX09QVEZMQUdTKQ0K
K2RpZmYgLS1naXQgYS9Pdm1mUGtnL2J1aWxkLnNoIGIvT3ZtZlBrZy9idWlsZC5zaAoraW5kZXgg
Mjg1ZjA2MWJmNC4uNzlmMmM4NzQ0NiAxMDA3NTUKKy0tLSBhL092bWZQa2cvYnVpbGQuc2gKKysr
KyBiL092bWZQa2cvYnVpbGQuc2gKK0BAIC0yNCw3ICsyNCw3IEBAIHRoZW4KKyAjIHRoaXMgYXNz
dW1lcyBzdm4gcHVsbHMgaGF2ZSB0aGUgc2FtZSByb290IGRpcgorICMgIGV4cG9ydCBFREtfVE9P
TFNfUEFUSD1gcHdkYC8uLi9CYXNlVG9vbHMKKyAjIFRoaXMgdmVyc2lvbiBpcyBmb3IgdGhlIHRv
b2xzIHNvdXJjZSBpbiBlZGsyCistICBleHBvcnQgRURLX1RPT0xTX1BBVEg9QkJBS0VfRURLX1RP
T0xTX1BBVEgvQmFzZVRvb2xzCisrICBleHBvcnQgRURLX1RPT0xTX1BBVEg9L2hvbWUvcG9reWJ1
aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC9vdm1mL2VkazItc3RhYmxlMjAyMzA4L2RldnRvb2x0bXAtbG1uaXVlZXYvd29ya2Rpci9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9lZGsyX2Jhc2V0b29scy9CYXNlVG9vbHMKKyAg
IGVjaG8gJEVES19UT09MU19QQVRICisgICBzb3VyY2UgZWRrc2V0dXAuc2ggQmFzZVRvb2xzCisg
ZWxzZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYiBiL21l
dGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIKaW5kZXggM2RjMDMxZDNiNi4uZGNiMjlj
M2IxNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiCkBAIC0yNCwxMCArMjQsMTEgQEAg
U1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIuZ2l0O2JyYW5jaD1t
YXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1CYXNlVG9vbHMt
bWFrZWZpbGUtYWRqdXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDQtcmVwcm9kdWNpYmxlLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDUtQ29t
bWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVBW
ID0gImVkazItc3RhYmxlMjAyMzA4IgotU1JDUkVWID0gIjgxOWNmYzZiNDJhNjg3OTBhMjM1MDll
NGZjYzU4Y2ViNzBlMTk2NWUiCitQViA9ICJlZGsyLXN0YWJsZTIwMjMxMSIKK1NSQ1JFViA9ICI4
NzM2YjhmZGNhODVlMDI5MzNjZGIwYTEzMzA5ZGUxNGM5Nzk5ZWNlIgogVVBTVFJFQU1fQ0hFQ0tf
R0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+ZWRrMi1zdGFibGUuKikiCiAKIGluaGVyaXQgZGVwbG95
Ci0tIAoyLjQyLjAKCg==

--===============0206464279569078121==--


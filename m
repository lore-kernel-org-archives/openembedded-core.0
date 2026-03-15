Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D9EEFCBCB
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28801.1773582115543762820
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HhAoMfJB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rjDQh3qs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb5ea8-7fd08695-a1c5-484e-a391-993b4ef751d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NX8B2x7OH29R5li6wYWIb67w8KQw7G/S5BNVRfa3zQ8=;
	b=HhAoMfJB0p4HITLQDoe0o7hrQ/r7jmoGf2HQaMdhjqbQWAnuVmrtnNEFUR9w1PPq
	rJx7RGL0TOteFMYKnzerIXm3ipIxBH4F3YOfYGYWHSQYC01bDpuudKA35E3J43IK5Hg
	mtIRNYR8yZvLiZlYoyXFXAqhrA0Mm0v6DwuTPdUg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NX8B2x7OH29R5li6wYWIb67w8KQw7G/S5BNVRfa3zQ8=;
	b=rjDQh3qse4H//rmbLkfXPTL31S8U86bfZfbNkEILaMabKUEQBOECpzE4gcVRNqjx
	IeqEwNfxaQOeVbOjbSvH1HWwNrOQW9skzWJPXQzUhiwsP6pvnSFngopGoVh4iApuRUy
	EhP7rHatEQ9ZUhak4+Z+welQ0CJoAmb/N5tuEfjI=
Content-Type: multipart/mixed; boundary="===============8654667706659070756=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202602 SUCCEEDED
Message-ID: <0101019cf1bb5ea8-7fd08695-a1c5-484e-a391-993b4ef751d0-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233138

--===============8654667706659070756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202602* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202511-edk2-stable202602.patch
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
From d02d05e121450c23071674cab71cca44f73b873d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 07:00:48 +0000
Subject: [PATCH] ovmf: upgrade edk2-stable202511 -> edk2-stable202602

---
 ...ovmf-update-path-to-native-BaseTools.patch |  9 ++--
 ...ile-adjust-to-build-in-under-bitbake.patch |  9 ++--
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 25 +++++-----
 .../ovmf/ovmf/0004-reproducible.patch         | 29 ++++++------
 ...ceptionHandlerLib-fix-push-instructi.patch | 46 -------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |  5 +-
 6 files changed, 32 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
index bc70c1ab91..dcd03c633e 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -1,7 +1,7 @@
-From 89a7bfe82c9dea89fa7d859eb392aa414a365578 Mon Sep 17 00:00:00 2001
+From 1e8929227fcfd24da071b9a93622900e62331a58 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/5] ovmf: update path to native BaseTools
+Subject: [PATCH] ovmf: update path to native BaseTools
 
 BaseTools is a set of utilities to build EDK-based firmware. These utilities
 are used during the build process. Thus, they need to be built natively.
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [oe-core cross compile specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
-index 30f4830173..ce4ffb20ab 100755
+index 164c11f641..18b68ffd1f 100755
 --- a/OvmfPkg/build.sh
 +++ b/OvmfPkg/build.sh
 @@ -24,7 +24,7 @@ then
@@ -28,6 +28,3 @@ index 30f4830173..ce4ffb20ab 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
--- 
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index 27c4324b67..99fd470874 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 8b4941871ccc88ed8b31eb7ffc097e1fe39fe57d Mon Sep 17 00:00:00 2001
+From 222a5b4514e5ebaa3dc1e1e724084aa0e3bbdb7c Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/5] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
 
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -18,7 +18,7 @@ Upstream-Status: Inappropriate [needs to be converted to in-recipe fixups]
  1 file changed, 7 insertions(+), 8 deletions(-)
 
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
-index 53e73abe53..0b3f9bbb2a 100644
+index d63f487724..0403f83f77 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
 @@ -151,35 +151,34 @@ endif
@@ -64,6 +64,3 @@ index 53e73abe53..0b3f9bbb2a 100644
  ifeq ($(HOST_ARCH), IA32)
  #
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386, but gcc defaults
--- 
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 18ea24802a..4839ea60ac 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 640b1e443a1b400d32d9af0c478abbbaebd491f1 Mon Sep 17 00:00:00 2001
+From fa2b761d4c0288cf4f3e007443efea6de16641cb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH 3/5] debug prefix map
+Subject: [PATCH] debug prefix map
 
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,10 +22,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
-index 90a389bdff..1e134b299a 100755
+index 1d65eeb4c7..de4150c693 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -833,7 +833,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     = --add-gnu-debuglink="$(DEBUG_DIR)/$(MODULE_
+@@ -951,7 +951,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     = --add-gnu-debuglink="$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTC_PATH                     = DEF(DTC_BIN)
  
  # All supported GCC archs except LOONGARCH64 support -mstack-protector-guard=global, so set that on everything except LOONGARCH64
@@ -34,7 +34,7 @@ index 90a389bdff..1e134b299a 100755
  DEFINE GCC_IA32_X64_CC_FLAGS       = -mstack-protector-guard=global
  DEFINE GCC_LOONGARCH64_CC_FLAGS    = DEF(GCC_ALL_CC_FLAGS) -mabi=lp64d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-char -ffunction-sections -fdata-sections
  DEFINE GCC_AARCH64_CC_FLAGS        = DEF(GCC_ALL_CC_FLAGS) -mlittle-endian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fdata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-tables -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=global
-@@ -845,8 +845,8 @@ DEFINE GCC_AARCH64_DLINK_FLAGS     = -Wl,--emit-relocs -nostdlib -Wl,--gc-sectio
+@@ -963,8 +963,8 @@ DEFINE GCC_AARCH64_DLINK_FLAGS     = -Wl,--emit-relocs -nostdlib -Wl,--gc-sectio
  DEFINE GCC_LOONGARCH64_DLINK_FLAGS = DEF(GCC_LOONGARCH64_DLINK_COMMON) -z common-page-size=0x20
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  = DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) -Wl,--defsym=PECOFF_HEADER_SIZE=0 DEF(GCC_DLINK2_FLAGS_COMMON) -z common-page-size=0x20
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS = DEF(GCC_LOONGARCH64_DLINK_FLAGS) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)
@@ -45,7 +45,7 @@ index 90a389bdff..1e134b299a 100755
  DEFINE GCC_VFRPP_FLAGS             = -x c -E -DVFRCOMPILE --include $(MODULE_NAME)StrDefs.h
  DEFINE GCC_ASLPP_FLAGS             = -x c -E -include AutoGen.h
  DEFINE GCC_ASLCC_FLAGS             = -x c -include AutoGen.h -fshort-wchar
-@@ -980,7 +980,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           = -mabi=lp64d -march=loongarch64 DEF(
+@@ -1099,7 +1099,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           = -mabi=lp64d -march=loongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         = DEF(GCC48_IA32_DLINK2_FLAGS)
  *_GCC48_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
  *_GCC48_IA32_OBJCOPY_FLAGS        =
@@ -54,7 +54,7 @@ index 90a389bdff..1e134b299a 100755
  
    DEBUG_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS)
  RELEASE_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set-variable
-@@ -1008,7 +1008,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set
+@@ -1127,7 +1127,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       = DEF(GCC48_IA32_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         = DEF(GCC48_X64_DLINK2_FLAGS)
  *_GCC48_X64_RC_FLAGS             = DEF(GCC_X64_RC_FLAGS)
  *_GCC48_X64_OBJCOPY_FLAGS        =
@@ -63,7 +63,7 @@ index 90a389bdff..1e134b299a 100755
  
    DEBUG_GCC48_X64_CC_FLAGS       = DEF(GCC48_X64_CC_FLAGS)
  RELEASE_GCC48_X64_CC_FLAGS       = DEF(GCC48_X64_CC_FLAGS) -Wno-unused-but-set-variable
-@@ -1087,7 +1087,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   = DEF(GCC48_AARCH64_CC_FLAGS) -Wno-unused-but-s
+@@ -1207,7 +1207,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   = DEF(GCC48_AARCH64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         = DEF(GCC49_IA32_DLINK2_FLAGS)
  *_GCC49_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
  *_GCC49_IA32_OBJCOPY_FLAGS        =
@@ -72,7 +72,7 @@ index 90a389bdff..1e134b299a 100755
  
    DEBUG_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS)
  RELEASE_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set-variable -Wno-unused-const-variable
-@@ -1115,7 +1115,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set
+@@ -1235,7 +1235,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       = DEF(GCC49_IA32_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         = DEF(GCC49_X64_DLINK2_FLAGS)
  *_GCC49_X64_RC_FLAGS             = DEF(GCC_X64_RC_FLAGS)
  *_GCC49_X64_OBJCOPY_FLAGS        =
@@ -81,7 +81,7 @@ index 90a389bdff..1e134b299a 100755
  
    DEBUG_GCC49_X64_CC_FLAGS       = DEF(GCC49_X64_CC_FLAGS)
  RELEASE_GCC49_X64_CC_FLAGS       = DEF(GCC49_X64_CC_FLAGS) -Wno-unused-but-set-variable -Wno-unused-const-variable
-@@ -1314,7 +1314,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS = -z common-page-size=0x20
+@@ -1436,7 +1436,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS = -z common-page-size=0x20
  *_GCC5_IA32_DLINK2_FLAGS         = DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie
  *_GCC5_IA32_RC_FLAGS             = DEF(GCC_IA32_RC_FLAGS)
  *_GCC5_IA32_OBJCOPY_FLAGS        =
@@ -90,7 +90,7 @@ index 90a389bdff..1e134b299a 100755
  
    DEBUG_GCC5_IA32_CC_FLAGS       = DEF(GCC5_IA32_CC_FLAGS) -flto
    DEBUG_GCC5_IA32_DLINK_FLAGS    = DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,-m,elf_i386,--oformat=elf32-i386
-@@ -1346,7 +1346,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    = DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1468,7 +1468,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    = DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          = DEF(GCC5_X64_DLINK2_FLAGS)
  *_GCC5_X64_RC_FLAGS              = DEF(GCC_X64_RC_FLAGS)
  *_GCC5_X64_OBJCOPY_FLAGS         =
@@ -99,6 +99,3 @@ index 90a389bdff..1e134b299a 100755
  
    DEBUG_GCC5_X64_CC_FLAGS        = DEF(GCC5_X64_CC_FLAGS) -flto -DUSING_LTO
    DEBUG_GCC5_X64_DLINK_FLAGS     = DEF(GCC5_X64_DLINK_FLAGS) -flto -Os
--- 
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
index b42ecde211..e7ddd9d0e0 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From 8b218dffa0368fbc2bfb5d8051b358476266fcb4 Mon Sep 17 00:00:00 2001
+From 021d3996c60fba5e5919d8a6db098ce8ce3f34a8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH 4/5] reproducible
+Subject: [PATCH] reproducible
 
 This patch fixes various things which make the build more reproducible. Some changes
 here only change intermediate artefacts but that means when you have two build trees
@@ -35,7 +35,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 24 insertions(+), 16 deletions(-)
 
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/GenFw/Elf64Convert.c
-index 83f1b285c2..e2f582f8fb 100644
+index bf4baf05d7..295f3f6efb 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
 @@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
@@ -47,7 +47,7 @@ index 83f1b285c2..e2f582f8fb 100644
  #endif
  #include <assert.h>
  #include <stdio.h>
-@@ -995,7 +997,7 @@ ScanSections64 (
+@@ -996,7 +998,7 @@ ScanSections64 (
    }
    mCoffOffset = mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) +
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +
@@ -56,7 +56,7 @@ index 83f1b285c2..e2f582f8fb 100644
  
    //
    // Add more space in the .debug data region for the DllCharacteristicsEx
-@@ -2329,7 +2331,7 @@ WriteDebug64 (
+@@ -2330,7 +2332,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;
  
@@ -65,7 +65,7 @@ index 83f1b285c2..e2f582f8fb 100644
  
    NtHdr = (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset);
    DataDir = &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIRECTORY_ENTRY_DEBUG];
-@@ -2362,7 +2364,7 @@ WriteDebug64 (
+@@ -2363,7 +2365,7 @@ WriteDebug64 (
  
    Nb10 = (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);
    Nb10->Signature = CODEVIEW_SIGNATURE_NB10;
@@ -89,10 +89,10 @@ index b829a2503c..afe826b78f 100644
          if Input not in self.Inputs:
              self.Inputs.append(Input)
 diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source/Python/AutoGen/GenMake.py
-index e5f282c4ac..27a34ef7c6 100755
+index b729103efd..afc5b14a8a 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
-@@ -571,7 +571,7 @@ cleanlib:
+@@ -579,7 +579,7 @@ cleanlib:
                  os.remove(RespFileList)
  
          # convert source files and binary files to build targets
@@ -101,7 +101,7 @@ index e5f282c4ac..27a34ef7c6 100755
          if len(self.ResultFileList) == 0 and len(MyAgo.SourceFileList) != 0:
              EdkLogger.error("build", AUTOGEN_ERROR, "Nothing to build",
                              ExtraData="[%s]" % str(MyAgo))
-@@ -722,7 +722,7 @@ cleanlib:
+@@ -730,7 +730,7 @@ cleanlib:
          OutputFile = ''
          DepsFileList = []
  
@@ -110,7 +110,7 @@ index e5f282c4ac..27a34ef7c6 100755
              if Cmd[2]:
                  for CopyCmd in Cmd[2]:
                      Src, Dst = CopyCmd
-@@ -755,7 +755,7 @@ cleanlib:
+@@ -763,7 +763,7 @@ cleanlib:
              self.BuildTargetList.append('\t%s' % CmdString)
  
              self.ParseSecCmd(DepsFileList, Cmd[1])
@@ -119,7 +119,7 @@ index e5f282c4ac..27a34ef7c6 100755
                  self.BuildTargetList.append('%s : %s' % (self.ReplaceMacro(SecOutputFile), self.ReplaceMacro(SecDepsFile)))
                  self.BuildTargetList.append('\t%s' % self.ReplaceMacro(SecCmd))
              self.FfsOutputFileList = []
-@@ -794,13 +794,13 @@ cleanlib:
+@@ -802,13 +802,13 @@ cleanlib:
  
      def CommandExceedLimit(self):
          FlagDict = {
@@ -140,7 +140,7 @@ index e5f282c4ac..27a34ef7c6 100755
                     }
  
          RespDict = {}
-@@ -1014,9 +1014,9 @@ cleanlib:
+@@ -1022,9 +1022,9 @@ cleanlib:
                  if not self.ObjTargetDict.get(T.Target.SubDir):
                      self.ObjTargetDict[T.Target.SubDir] = set()
                  self.ObjTargetDict[T.Target.SubDir].add(NewFile)
@@ -153,7 +153,7 @@ index e5f282c4ac..27a34ef7c6 100755
                  if T.GenFileListMacro and T.FileListMacro not in self.FileListMacros:
                      self.FileListMacros[T.FileListMacro] = []
 diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
-index 764c51789b..40aadbcfbc 100755
+index c358d7f0e3..6ed48091fa 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 @@ -1429,6 +1429,9 @@ class ModuleAutoGen(AutoGen):
@@ -175,6 +175,3 @@ index 764c51789b..40aadbcfbc 100755
  
          # Ignore generating makefile when it is a binary module
          if self.IsBinaryModule:
--- 
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch
deleted file mode 100644
index 650e084b5b..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7e6be0f4068a2158af3c97e873edb33fa4d5c6b8 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 3 Nov 2025 09:56:52 +0100
-Subject: [PATCH 5/5] UefiCpuPkg/CpuExceptionHandlerLib: fix push instructions
-
-Nasm 3.0 complains about 'dword' being invalid.  The comment talks about
-a '8-byte value' so 'qword' should be correct here.
-
-With this change the extra comment explaining that the instruction
-actually pushes an 8-byte value despite the 'dword' keyword is not
-needed any more.  Drop it.
-
-Fixes: https://github.com/tianocore/edk2/issues/11635
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/9ccf8751a74f26142e584c7b7c7572a182b67997]
-(cherry picked from commit 9ccf8751a74f26142e584c7b7c7572a182b67997)
-Signed-off-by: Ankur Tyagi <ankur.tyagi@navicogroup.com>
----
- .../CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm       | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm b/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm
-index 3d64ac9080..671ed98f85 100644
---- a/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm
-+++ b/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm
-@@ -57,7 +57,7 @@ ALIGN   8
- AsmIdtVectorBegin:
- %assign Vector 0
- %rep  256
--    push    strict dword %[Vector] ; This instruction pushes sign-extended 8-byte value on stack
-+    push    strict qword %[Vector]
-     push    rax
- %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT
-     mov     rax, strict qword 0    ; mov     rax, ASM_PFX(CommonInterruptEntry)
-@@ -70,7 +70,7 @@ AsmIdtVectorBegin:
- AsmIdtVectorEnd:
- 
- HookAfterStubHeaderBegin:
--    push    strict dword 0      ; 0 will be fixed
-+    push    strict qword 0      ; 0 will be fixed
- VectorNum:
-     push    rax
- %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT
--- 
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ec6c3b516c..2eb197d0b6 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,11 +25,10 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;ta
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
-           file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch \
            "
 
-PV = "edk2-stable202511"
-SRCREV = "46548b1adac82211d8d11da12dd914f41e7aa775"
+PV = "edk2-stable202602"
+SRCREV = "b7a715f7c03c45c6b4575bf88596bfd79658b8ce"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 CVE_PRODUCT = "edk2"
-- 
2.47.1


--===============8654667706659070756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ovmf: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf: SRC_URI changed from "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;tag=edk2-stable202511 file://0001-ovmf-update-path-to-native-BaseTools.patch file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch file://0003-debug-prefix-map.patch file://0004-reproducible.patch file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch" to "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;tag=edk2-stable202602 file://0001-ovmf-update-path-to-native-BaseTools.patch file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch file://0003-debug-prefix-map.patch file://0004-reproducible.patch"
packages/x86-64-v3-poky-linux/ovmf: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf-dbg: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf-dbg: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf-dev: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf-dev: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf-doc: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf-doc: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf-locale: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf-locale: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf-shell-efi: PKGSIZE changed from 925056 to 925312 (+0%)
packages/x86-64-v3-poky-linux/ovmf/ovmf-shell-efi: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf-shell-efi: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf-src: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf-src: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf-staticdev: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf-staticdev: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
packages/x86-64-v3-poky-linux/ovmf/ovmf: PV changed from "edk2-stable202511" to "edk2-stable202602"
packages/x86-64-v3-poky-linux/ovmf/ovmf: PKGV changed from edk2-stable202511 [default] to edk2-stable202602 [default]
Changes to packages/x86_64-linux/ovmf-native (sysroot):
  /usr/bin/edk2_basetools/BaseTools/BinWrappers/PosixLike/GenericShellWrapper was added
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FirmwareStorageFormat/PECOFFHeader.py was added
  /usr/bin/edk2_basetools/BaseTools/Source/Python/AmlToC/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/BPDG/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/build/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Capsule/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Edk2/Capsule/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Edk2/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Uefi/Capsule/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Uefi/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/CParser3/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/CParser4/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/MetaFileWorkspace/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/Xml/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Eot/CParser3/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Eot/CParser4/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Eot/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FirmwareStorageFormat/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FMMT/core/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FMMT/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FMMT/utils/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/GenPatchPcdTable/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/PatchPcdValue/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Pkcs7Sign/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Rsa2048Sha256Sign/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Split/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Table/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/TargetTool/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/tests/Split/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Trim/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Core/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/GenMetaFile/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Library/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Library/Xml/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Logger/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Object/Parser/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Object/POM/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Object/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Parser/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/PomAdapter/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/UnitTest/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Xml/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Workspace/__pycache__ was removed

--===============8654667706659070756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 64 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'ovmf'
ovmf was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============8654667706659070756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/ovmf-native (sysroot):
  /usr/bin/edk2_basetools/BaseTools/BinWrappers/PosixLike/GenericShellWrapper was added
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FirmwareStorageFormat/PECOFFHeader.py was added
  /usr/bin/edk2_basetools/BaseTools/Source/Python/AmlToC/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/BPDG/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/build/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Capsule/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Edk2/Capsule/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Edk2/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Uefi/Capsule/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Common/Uefi/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/CParser3/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/CParser4/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/MetaFileWorkspace/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Ecc/Xml/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Eot/CParser3/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Eot/CParser4/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Eot/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FirmwareStorageFormat/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FMMT/core/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FMMT/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/FMMT/utils/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/GenPatchPcdTable/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/PatchPcdValue/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Pkcs7Sign/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Rsa2048Sha256Sign/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Split/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Table/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/TargetTool/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/tests/Split/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Trim/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Core/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/GenMetaFile/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Library/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Library/Xml/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Logger/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Object/Parser/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Object/POM/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Object/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Parser/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/PomAdapter/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/UnitTest/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/UPT/Xml/__pycache__ was removed
  /usr/bin/edk2_basetools/BaseTools/Source/Python/Workspace/__pycache__ was removed

--===============8654667706659070756==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202511-edk2-stable202602.patch"

RnJvbSBkMDJkMDVlMTIxNDUwYzIzMDcxNjc0Y2FiNzFjY2E0NGY3M2I4NzNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6MDA6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
dm1mOiB1cGdyYWRlIGVkazItc3RhYmxlMjAyNTExIC0+IGVkazItc3RhYmxlMjAyNjAyCgotLS0K
IC4uLm92bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZlLUJhc2VUb29scy5wYXRjaCB8ICA5ICsrLS0K
IC4uLmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaCB8ICA5ICsrLS0K
IC4uLi9vdm1mL292bWYvMDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoICAgICB8IDI1ICsrKysr
LS0tLS0KIC4uLi9vdm1mL292bWYvMDAwNC1yZXByb2R1Y2libGUucGF0Y2ggICAgICAgICB8IDI5
ICsrKysrKy0tLS0tLQogLi4uY2VwdGlvbkhhbmRsZXJMaWItZml4LXB1c2gtaW5zdHJ1Y3RpLnBh
dGNoIHwgNDYgLS0tLS0tLS0tLS0tLS0tLS0tLQogbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1m
X2dpdC5iYiAgICAgICAgICAgIHwgIDUgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9u
cygrKSwgOTEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNv
cmUvb3ZtZi9vdm1mLzAwMDUtVWVmaUNwdVBrZy1DcHVFeGNlcHRpb25IYW5kbGVyTGliLWZpeC1w
dXNoLWluc3RydWN0aS5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYv
b3ZtZi8wMDAxLW92bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZlLUJhc2VUb29scy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAxLW92bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZl
LUJhc2VUb29scy5wYXRjaAppbmRleCBiYzcwYzFhYjkxLi5kY2QwM2M2MzNlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMS1vdm1mLXVwZGF0ZS1wYXRoLXRvLW5h
dGl2ZS1CYXNlVG9vbHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAw
MDEtb3ZtZi11cGRhdGUtcGF0aC10by1uYXRpdmUtQmFzZVRvb2xzLnBhdGNoCkBAIC0xLDcgKzEs
NyBAQAotRnJvbSA4OWE3YmZlODJjOWRlYTg5ZmE3ZDg1OWViMzkyYWE0MTRhMzY1NTc4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxZTg5MjkyMjdmY2ZkMjRkYTA3MWI5YTkzNjIyOTAw
ZTYyMzMxYTU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljYXJkbyBOZXJpIDxy
aWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29tPgogRGF0ZTogVGh1LCA5IEp1biAy
MDE2IDAyOjIzOjAxIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMS81XSBvdm1mOiB1cGRhdGUgcGF0
aCB0byBuYXRpdmUgQmFzZVRvb2xzCitTdWJqZWN0OiBbUEFUQ0hdIG92bWY6IHVwZGF0ZSBwYXRo
IHRvIG5hdGl2ZSBCYXNlVG9vbHMKIAogQmFzZVRvb2xzIGlzIGEgc2V0IG9mIHV0aWxpdGllcyB0
byBidWlsZCBFREstYmFzZWQgZmlybXdhcmUuIFRoZXNlIHV0aWxpdGllcwogYXJlIHVzZWQgZHVy
aW5nIHRoZSBidWlsZCBwcm9jZXNzLiBUaHVzLCB0aGV5IG5lZWQgdG8gYmUgYnVpbHQgbmF0aXZl
bHkuCkBAIC0xNiw3ICsxNiw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ut
Y29yZSBjcm9zcyBjb21waWxlIHNwZWNpZmljXQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9idWlsZC5zaCBiL092
bWZQa2cvYnVpbGQuc2gKLWluZGV4IDMwZjQ4MzAxNzMuLmNlNGZmYjIwYWIgMTAwNzU1CitpbmRl
eCAxNjRjMTFmNjQxLi4xOGI2OGZmZDFmIDEwMDc1NQogLS0tIGEvT3ZtZlBrZy9idWlsZC5zaAog
KysrIGIvT3ZtZlBrZy9idWlsZC5zaAogQEAgLTI0LDcgKzI0LDcgQEAgdGhlbgpAQCAtMjgsNiAr
MjgsMyBAQCBpbmRleCAzMGY0ODMwMTczLi5jZTRmZmIyMGFiIDEwMDc1NQogICAgZWNobyAkRURL
X1RPT0xTX1BBVEgKICAgIHNvdXJjZSBlZGtzZXR1cC5zaCBCYXNlVG9vbHMKICBlbHNlCi0tLSAK
LTIuNDcuMwotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMi1C
YXNlVG9vbHMtbWFrZWZpbGUtYWRqdXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMi1CYXNlVG9vbHMtbWFrZWZpbGUtYWRq
dXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2gKaW5kZXggMjdjNDMyNGI2Ny4uOTlm
ZDQ3MDg3NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDItQmFz
ZVRvb2xzLW1ha2VmaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAyLUJhc2VUb29scy1tYWtlZmlsZS1h
ZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZy
b20gOGI0OTQxODcxY2NjODhlZDhiMzFlYjdmZmMwOTdlMWZlMzlmZTU3ZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMjIyYTViNDUxNGU1ZWJhYTNkYzFlMWU3MjQwODRhYTBlM2JiZGI3
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2FyZG8gTmVyaSA8cmljYXJkby5u
ZXJpLWNhbGRlcm9uQGxpbnV4LmludGVsLmNvbT4KIERhdGU6IEZyaSwgMjYgSnVsIDIwMTkgMTc6
MzQ6MjYgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSCAyLzVdIEJhc2VUb29sczogbWFrZWZpbGU6IGFk
anVzdCB0byBidWlsZCBpbiB1bmRlciBiaXRiYWtlCitTdWJqZWN0OiBbUEFUQ0hdIEJhc2VUb29s
czogbWFrZWZpbGU6IGFkanVzdCB0byBidWlsZCBpbiB1bmRlciBiaXRiYWtlCiAKIFByZXBlbmQg
dGhlIGJ1aWxkIGZsYWdzIHdpdGggdGhvc2Ugb2YgYml0YmFrZS4gVGhpcyBpcyB0byBidWlsZAog
dXNpbmcgdGhlIGJpdGJha2UgbmF0aXZlIHN5c3Jvb3QgaW5jbHVkZSBhbmQgbGlicmFyeSBkaXJl
Y3Rvcmllcy4KQEAgLTE4LDcgKzE4LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
IFtuZWVkcyB0byBiZSBjb252ZXJ0ZWQgdG8gaW4tcmVjaXBlIGZpeHVwc10KICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQmFz
ZVRvb2xzL1NvdXJjZS9DL01ha2VmaWxlcy9oZWFkZXIubWFrZWZpbGUgYi9CYXNlVG9vbHMvU291
cmNlL0MvTWFrZWZpbGVzL2hlYWRlci5tYWtlZmlsZQotaW5kZXggNTNlNzNhYmU1My4uMGIzZjli
YmIyYSAxMDA2NDQKK2luZGV4IGQ2M2Y0ODc3MjQuLjA0MDNmODNmNzcgMTAwNjQ0CiAtLS0gYS9C
YXNlVG9vbHMvU291cmNlL0MvTWFrZWZpbGVzL2hlYWRlci5tYWtlZmlsZQogKysrIGIvQmFzZVRv
b2xzL1NvdXJjZS9DL01ha2VmaWxlcy9oZWFkZXIubWFrZWZpbGUKIEBAIC0xNTEsMzUgKzE1MSwz
NCBAQCBlbmRpZgpAQCAtNjQsNiArNjQsMyBAQCBpbmRleCA1M2U3M2FiZTUzLi4wYjNmOWJiYjJh
IDEwMDY0NAogIGlmZXEgKCQoSE9TVF9BUkNIKSwgSUEzMikNCiAgIw0KICAjIFNub3cgTGVvcGFy
ZCAgaXMgYSAzMi1iaXQgYW5kIDY0LWJpdCBlbnZpcm9ubWVudC4gdW5hbWUgLW0gcmV0dXJucyBp
Mzg2LCBidXQgZ2NjIGRlZmF1bHRzDQotLS0gCi0yLjQ3LjMKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDMtZGVidWctcHJlZml4LW1hcC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAzLWRlYnVnLXByZWZpeC1tYXAucGF0Y2gKaW5kZXgg
MThlYTI0ODAyYS4uNDgzOWVhNjBhYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvb3Zt
Zi9vdm1mLzAwMDMtZGVidWctcHJlZml4LW1hcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9vdm1mL292bWYvMDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAot
RnJvbSA2NDBiMWU0NDNhMWI0MDBkMzJkOWFmMGM0NzhhYmJiYWViZDQ5MWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBmYTJiNzYxZDRjMDI4OGNmNGYzZTAwNzQ0M2VmZWE2ZGUxNjY0
MWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE0IEp1biAyMDIxIDE5OjU2OjI4ICsw
MjAwCi1TdWJqZWN0OiBbUEFUQ0ggMy81XSBkZWJ1ZyBwcmVmaXggbWFwCitTdWJqZWN0OiBbUEFU
Q0hdIGRlYnVnIHByZWZpeCBtYXAKIAogV2Ugd2FudCB0byBwYXNzICR7REVCVUdfUFJFRklYX01B
UH0gdG8gZ2NjIGNvbW1hbmRzIGFuZCBhbHNvIHBhc3MgaW4KICAtLWRlYnVnLXByZWZpeC1tYXAg
dG8gbmFzbSAod2UgY2FycnkgYSBwYXRjaCB0byBuYXNtIGZvciB0aGlzKS4gVGhlCkBAIC0yMiwx
MCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL0Jhc2VUb29scy9Db25mL3Rvb2xzX2RlZi50ZW1wbGF0ZSBi
L0Jhc2VUb29scy9Db25mL3Rvb2xzX2RlZi50ZW1wbGF0ZQotaW5kZXggOTBhMzg5YmRmZi4uMWUx
MzRiMjk5YSAxMDA3NTUKK2luZGV4IDFkNjVlZWI0YzcuLmRlNDE1MGM2OTMgMTAwNzU1CiAtLS0g
YS9CYXNlVG9vbHMvQ29uZi90b29sc19kZWYudGVtcGxhdGUKICsrKyBiL0Jhc2VUb29scy9Db25m
L3Rvb2xzX2RlZi50ZW1wbGF0ZQotQEAgLTgzMyw3ICs4MzMsNyBAQCBOT09QVF8qXypfT0JKQ09Q
WV9BRERERUJVR0ZMQUcgICAgID0gLS1hZGQtZ251LWRlYnVnbGluaz0iJChERUJVR19ESVIpLyQo
TU9EVUxFXworQEAgLTk1MSw3ICs5NTEsNyBAQCBOT09QVF8qXypfT0JKQ09QWV9BRERERUJVR0ZM
QUcgICAgID0gLS1hZGQtZ251LWRlYnVnbGluaz0iJChERUJVR19ESVIpLyQoTU9EVUxFXwogICpf
Kl8qX0RUQ19QQVRIICAgICAgICAgICAgICAgICAgICAgPSBERUYoRFRDX0JJTikNCiAgDQogICMg
QWxsIHN1cHBvcnRlZCBHQ0MgYXJjaHMgZXhjZXB0IExPT05HQVJDSDY0IHN1cHBvcnQgLW1zdGFj
ay1wcm90ZWN0b3ItZ3VhcmQ9Z2xvYmFsLCBzbyBzZXQgdGhhdCBvbiBldmVyeXRoaW5nIGV4Y2Vw
dCBMT09OR0FSQ0g2NA0KQEAgLTM0LDcgKzM0LDcgQEAgaW5kZXggOTBhMzg5YmRmZi4uMWUxMzRi
Mjk5YSAxMDA3NTUKICBERUZJTkUgR0NDX0lBMzJfWDY0X0NDX0ZMQUdTICAgICAgID0gLW1zdGFj
ay1wcm90ZWN0b3ItZ3VhcmQ9Z2xvYmFsDQogIERFRklORSBHQ0NfTE9PTkdBUkNINjRfQ0NfRkxB
R1MgICAgPSBERUYoR0NDX0FMTF9DQ19GTEFHUykgLW1hYmk9bHA2NGQgLWZuby1hc3luY2hyb25v
dXMtdW53aW5kLXRhYmxlcyAtV25vLWFkZHJlc3MgLWZuby1zaG9ydC1lbnVtcyAtZnNpZ25lZC1j
aGFyIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zDQogIERFRklORSBHQ0NfQUFS
Q0g2NF9DQ19GTEFHUyAgICAgICAgPSBERUYoR0NDX0FMTF9DQ19GTEFHUykgLW1saXR0bGUtZW5k
aWFuIC1mbm8tc2hvcnQtZW51bXMgLWZ2ZXJib3NlLWFzbSAtZnVuc2lnbmVkLWNoYXIgIC1mZnVu
Y3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zIC1Xbm8tYWRkcmVzcyAtZm5vLWFzeW5jaHJv
bm91cy11bndpbmQtdGFibGVzIC1mbm8tdW53aW5kLXRhYmxlcyAtZm5vLXBpYyAtZm5vLXBpZSAt
ZmZpeGVkLXgxOCAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD1nbG9iYWwNCi1AQCAtODQ1LDggKzg0
NSw4IEBAIERFRklORSBHQ0NfQUFSQ0g2NF9ETElOS19GTEFHUyAgICAgPSAtV2wsLS1lbWl0LXJl
bG9jcyAtbm9zdGRsaWIgLVdsLC0tZ2Mtc2VjdGlvCitAQCAtOTYzLDggKzk2Myw4IEBAIERFRklO
RSBHQ0NfQUFSQ0g2NF9ETElOS19GTEFHUyAgICAgPSAtV2wsLS1lbWl0LXJlbG9jcyAtbm9zdGRs
aWIgLVdsLC0tZ2Mtc2VjdGlvCiAgREVGSU5FIEdDQ19MT09OR0FSQ0g2NF9ETElOS19GTEFHUyA9
IERFRihHQ0NfTE9PTkdBUkNINjRfRExJTktfQ09NTU9OKSAteiBjb21tb24tcGFnZS1zaXplPTB4
MjANCiAgREVGSU5FIEdDQ19BQVJDSDY0X0FTTERMSU5LX0ZMQUdTICA9IERFRihHQ0NfQUFSQ0g2
NF9ETElOS19GTEFHUykgLVdsLC0tZW50cnksUmVmZXJlbmNlQWNwaVRhYmxlIC11ICQoSU1BR0Vf
RU5UUllfUE9JTlQpIC1XbCwtLWRlZnN5bT1QRUNPRkZfSEVBREVSX1NJWkU9MCBERUYoR0NDX0RM
SU5LMl9GTEFHU19DT01NT04pIC16IGNvbW1vbi1wYWdlLXNpemU9MHgyMA0KICBERUZJTkUgR0ND
X0xPT05HQVJDSDY0X0FTTERMSU5LX0ZMQUdTID0gREVGKEdDQ19MT09OR0FSQ0g2NF9ETElOS19G
TEFHUykgLVdsLC0tZW50cnksUmVmZXJlbmNlQWNwaVRhYmxlIC11ICQoSU1BR0VfRU5UUllfUE9J
TlQpDQpAQCAtNDUsNyArNDUsNyBAQCBpbmRleCA5MGEzODliZGZmLi4xZTEzNGIyOTlhIDEwMDc1
NQogIERFRklORSBHQ0NfVkZSUFBfRkxBR1MgICAgICAgICAgICAgPSAteCBjIC1FIC1EVkZSQ09N
UElMRSAtLWluY2x1ZGUgJChNT0RVTEVfTkFNRSlTdHJEZWZzLmgNCiAgREVGSU5FIEdDQ19BU0xQ
UF9GTEFHUyAgICAgICAgICAgICA9IC14IGMgLUUgLWluY2x1ZGUgQXV0b0dlbi5oDQogIERFRklO
RSBHQ0NfQVNMQ0NfRkxBR1MgICAgICAgICAgICAgPSAteCBjIC1pbmNsdWRlIEF1dG9HZW4uaCAt
ZnNob3J0LXdjaGFyDQotQEAgLTk4MCw3ICs5ODAsNyBAQCBERUZJTkUgR0NDNV9MT09OR0FSQ0g2
NF9QUF9GTEFHUyAgICAgICAgICAgPSAtbWFiaT1scDY0ZCAtbWFyY2g9bG9vbmdhcmNoNjQgREVG
KAorQEAgLTEwOTksNyArMTA5OSw3IEBAIERFRklORSBHQ0M1X0xPT05HQVJDSDY0X1BQX0ZMQUdT
ICAgICAgICAgICA9IC1tYWJpPWxwNjRkIC1tYXJjaD1sb29uZ2FyY2g2NCBERUYoCiAgKl9HQ0M0
OF9JQTMyX0RMSU5LMl9GTEFHUyAgICAgICAgID0gREVGKEdDQzQ4X0lBMzJfRExJTksyX0ZMQUdT
KQ0KICAqX0dDQzQ4X0lBMzJfUkNfRkxBR1MgICAgICAgICAgICAgPSBERUYoR0NDX0lBMzJfUkNf
RkxBR1MpDQogICpfR0NDNDhfSUEzMl9PQkpDT1BZX0ZMQUdTICAgICAgICA9DQpAQCAtNTQsNyAr
NTQsNyBAQCBpbmRleCA5MGEzODliZGZmLi4xZTEzNGIyOTlhIDEwMDc1NQogIA0KICAgIERFQlVH
X0dDQzQ4X0lBMzJfQ0NfRkxBR1MgICAgICAgPSBERUYoR0NDNDhfSUEzMl9DQ19GTEFHUykNCiAg
UkVMRUFTRV9HQ0M0OF9JQTMyX0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ4X0lBMzJfQ0NfRkxB
R1MpIC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUNCi1AQCAtMTAwOCw3ICsxMDA4LDcgQEAg
UkVMRUFTRV9HQ0M0OF9JQTMyX0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ4X0lBMzJfQ0NfRkxB
R1MpIC1Xbm8tdW51c2VkLWJ1dC1zZXQKK0BAIC0xMTI3LDcgKzExMjcsNyBAQCBSRUxFQVNFX0dD
QzQ4X0lBMzJfQ0NfRkxBR1MgICAgICAgPSBERUYoR0NDNDhfSUEzMl9DQ19GTEFHUykgLVduby11
bnVzZWQtYnV0LXNldAogICpfR0NDNDhfWDY0X0RMSU5LMl9GTEFHUyAgICAgICAgID0gREVGKEdD
QzQ4X1g2NF9ETElOSzJfRkxBR1MpDQogICpfR0NDNDhfWDY0X1JDX0ZMQUdTICAgICAgICAgICAg
ID0gREVGKEdDQ19YNjRfUkNfRkxBR1MpDQogICpfR0NDNDhfWDY0X09CSkNPUFlfRkxBR1MgICAg
ICAgID0NCkBAIC02Myw3ICs2Myw3IEBAIGluZGV4IDkwYTM4OWJkZmYuLjFlMTM0YjI5OWEgMTAw
NzU1CiAgDQogICAgREVCVUdfR0NDNDhfWDY0X0NDX0ZMQUdTICAgICAgID0gREVGKEdDQzQ4X1g2
NF9DQ19GTEFHUykNCiAgUkVMRUFTRV9HQ0M0OF9YNjRfQ0NfRkxBR1MgICAgICAgPSBERUYoR0ND
NDhfWDY0X0NDX0ZMQUdTKSAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlDQotQEAgLTEwODcs
NyArMTA4Nyw3IEBAIFJFTEVBU0VfR0NDNDhfQUFSQ0g2NF9DQ19GTEFHUyAgID0gREVGKEdDQzQ4
X0FBUkNINjRfQ0NfRkxBR1MpIC1Xbm8tdW51c2VkLWJ1dC1zCitAQCAtMTIwNyw3ICsxMjA3LDcg
QEAgUkVMRUFTRV9HQ0M0OF9BQVJDSDY0X0NDX0ZMQUdTICAgPSBERUYoR0NDNDhfQUFSQ0g2NF9D
Q19GTEFHUykgLVduby11bnVzZWQtYnV0LXMKICAqX0dDQzQ5X0lBMzJfRExJTksyX0ZMQUdTICAg
ICAgICAgPSBERUYoR0NDNDlfSUEzMl9ETElOSzJfRkxBR1MpDQogICpfR0NDNDlfSUEzMl9SQ19G
TEFHUyAgICAgICAgICAgICA9IERFRihHQ0NfSUEzMl9SQ19GTEFHUykNCiAgKl9HQ0M0OV9JQTMy
X09CSkNPUFlfRkxBR1MgICAgICAgID0NCkBAIC03Miw3ICs3Miw3IEBAIGluZGV4IDkwYTM4OWJk
ZmYuLjFlMTM0YjI5OWEgMTAwNzU1CiAgDQogICAgREVCVUdfR0NDNDlfSUEzMl9DQ19GTEFHUyAg
ICAgICA9IERFRihHQ0M0OV9JQTMyX0NDX0ZMQUdTKQ0KICBSRUxFQVNFX0dDQzQ5X0lBMzJfQ0Nf
RkxBR1MgICAgICAgPSBERUYoR0NDNDlfSUEzMl9DQ19GTEFHUykgLVduby11bnVzZWQtYnV0LXNl
dC12YXJpYWJsZSAtV25vLXVudXNlZC1jb25zdC12YXJpYWJsZQ0KLUBAIC0xMTE1LDcgKzExMTUs
NyBAQCBSRUxFQVNFX0dDQzQ5X0lBMzJfQ0NfRkxBR1MgICAgICAgPSBERUYoR0NDNDlfSUEzMl9D
Q19GTEFHUykgLVduby11bnVzZWQtYnV0LXNldAorQEAgLTEyMzUsNyArMTIzNSw3IEBAIFJFTEVB
U0VfR0NDNDlfSUEzMl9DQ19GTEFHUyAgICAgICA9IERFRihHQ0M0OV9JQTMyX0NDX0ZMQUdTKSAt
V25vLXVudXNlZC1idXQtc2V0CiAgKl9HQ0M0OV9YNjRfRExJTksyX0ZMQUdTICAgICAgICAgPSBE
RUYoR0NDNDlfWDY0X0RMSU5LMl9GTEFHUykNCiAgKl9HQ0M0OV9YNjRfUkNfRkxBR1MgICAgICAg
ICAgICAgPSBERUYoR0NDX1g2NF9SQ19GTEFHUykNCiAgKl9HQ0M0OV9YNjRfT0JKQ09QWV9GTEFH
UyAgICAgICAgPQ0KQEAgLTgxLDcgKzgxLDcgQEAgaW5kZXggOTBhMzg5YmRmZi4uMWUxMzRiMjk5
YSAxMDA3NTUKICANCiAgICBERUJVR19HQ0M0OV9YNjRfQ0NfRkxBR1MgICAgICAgPSBERUYoR0ND
NDlfWDY0X0NDX0ZMQUdTKQ0KICBSRUxFQVNFX0dDQzQ5X1g2NF9DQ19GTEFHUyAgICAgICA9IERF
RihHQ0M0OV9YNjRfQ0NfRkxBR1MpIC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11
bnVzZWQtY29uc3QtdmFyaWFibGUNCi1AQCAtMTMxNCw3ICsxMzE0LDcgQEAgUkVMRUFTRV9HQ0NO
T0xUT19BQVJDSDY0X0RMSU5LX1hJUEZMQUdTID0gLXogY29tbW9uLXBhZ2Utc2l6ZT0weDIwCitA
QCAtMTQzNiw3ICsxNDM2LDcgQEAgUkVMRUFTRV9HQ0NOT0xUT19BQVJDSDY0X0RMSU5LX1hJUEZM
QUdTID0gLXogY29tbW9uLXBhZ2Utc2l6ZT0weDIwCiAgKl9HQ0M1X0lBMzJfRExJTksyX0ZMQUdT
ICAgICAgICAgPSBERUYoR0NDNV9JQTMyX0RMSU5LMl9GTEFHUykgLW5vLXBpZQ0KICAqX0dDQzVf
SUEzMl9SQ19GTEFHUyAgICAgICAgICAgICA9IERFRihHQ0NfSUEzMl9SQ19GTEFHUykNCiAgKl9H
Q0M1X0lBMzJfT0JKQ09QWV9GTEFHUyAgICAgICAgPQ0KQEAgLTkwLDcgKzkwLDcgQEAgaW5kZXgg
OTBhMzg5YmRmZi4uMWUxMzRiMjk5YSAxMDA3NTUKICANCiAgICBERUJVR19HQ0M1X0lBMzJfQ0Nf
RkxBR1MgICAgICAgPSBERUYoR0NDNV9JQTMyX0NDX0ZMQUdTKSAtZmx0bw0KICAgIERFQlVHX0dD
QzVfSUEzMl9ETElOS19GTEFHUyAgICA9IERFRihHQ0M1X0lBMzJfWDY0X0RMSU5LX0ZMQUdTKSAt
Zmx0byAtT3MgLVdsLC1tLGVsZl9pMzg2LC0tb2Zvcm1hdD1lbGYzMi1pMzg2DQotQEAgLTEzNDYs
NyArMTM0Niw3IEBAIFJFTEVBU0VfR0NDNV9JQTMyX0RMSU5LX0ZMQUdTICAgID0gREVGKEdDQzVf
SUEzMl9YNjRfRExJTktfRkxBR1MpIC1mbHRvIC1PcyAtV2wsCitAQCAtMTQ2OCw3ICsxNDY4LDcg
QEAgUkVMRUFTRV9HQ0M1X0lBMzJfRExJTktfRkxBR1MgICAgPSBERUYoR0NDNV9JQTMyX1g2NF9E
TElOS19GTEFHUykgLWZsdG8gLU9zIC1XbCwKICAqX0dDQzVfWDY0X0RMSU5LMl9GTEFHUyAgICAg
ICAgICA9IERFRihHQ0M1X1g2NF9ETElOSzJfRkxBR1MpDQogICpfR0NDNV9YNjRfUkNfRkxBR1Mg
ICAgICAgICAgICAgID0gREVGKEdDQ19YNjRfUkNfRkxBR1MpDQogICpfR0NDNV9YNjRfT0JKQ09Q
WV9GTEFHUyAgICAgICAgID0NCkBAIC05OSw2ICs5OSwzIEBAIGluZGV4IDkwYTM4OWJkZmYuLjFl
MTM0YjI5OWEgMTAwNzU1CiAgDQogICAgREVCVUdfR0NDNV9YNjRfQ0NfRkxBR1MgICAgICAgID0g
REVGKEdDQzVfWDY0X0NDX0ZMQUdTKSAtZmx0byAtRFVTSU5HX0xUTw0KICAgIERFQlVHX0dDQzVf
WDY0X0RMSU5LX0ZMQUdTICAgICA9IERFRihHQ0M1X1g2NF9ETElOS19GTEFHUykgLWZsdG8gLU9z
DQotLS0gCi0yLjQ3LjMKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1m
LzAwMDQtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAw
MDQtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IGI0MmVjZGUyMTEuLmU3ZGRkOWQwZTAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDA0LXJlcHJvZHVjaWJsZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwNC1yZXByb2R1Y2libGUucGF0
Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDhiMjE4ZGZmYTAzNjhmYmMyYmZiNWQ4MDUxYjM1ODQ3
NjI2NmZjYjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDAyMWQzOTk2YzYwZmJhNWU1
OTE5ZDhhNmRiMDk4Y2U4Y2UzZjM0YTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTQg
SnVuIDIwMjEgMTk6NTc6MzAgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCA0LzVdIHJlcHJvZHVjaWJs
ZQorU3ViamVjdDogW1BBVENIXSByZXByb2R1Y2libGUKIAogVGhpcyBwYXRjaCBmaXhlcyB2YXJp
b3VzIHRoaW5ncyB3aGljaCBtYWtlIHRoZSBidWlsZCBtb3JlIHJlcHJvZHVjaWJsZS4gU29tZSBj
aGFuZ2VzCiBoZXJlIG9ubHkgY2hhbmdlIGludGVybWVkaWF0ZSBhcnRlZmFjdHMgYnV0IHRoYXQg
bWVhbnMgd2hlbiB5b3UgaGF2ZSB0d28gYnVpbGQgdHJlZXMKQEAgLTM1LDcgKzM1LDcgQEAgU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAg
NCBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL0Jhc2VUb29scy9Tb3VyY2UvQy9HZW5Gdy9FbGY2NENvbnZlcnQuYyBiL0Jhc2VU
b29scy9Tb3VyY2UvQy9HZW5Gdy9FbGY2NENvbnZlcnQuYwotaW5kZXggODNmMWIyODVjMi4uZTJm
NTgyZjhmYiAxMDA2NDQKK2luZGV4IGJmNGJhZjA1ZDcuLjI5NWYzZjZlZmIgMTAwNjQ0CiAtLS0g
YS9CYXNlVG9vbHMvU291cmNlL0MvR2VuRncvRWxmNjRDb252ZXJ0LmMKICsrKyBiL0Jhc2VUb29s
cy9Tb3VyY2UvQy9HZW5Gdy9FbGY2NENvbnZlcnQuYwogQEAgLTE1LDYgKzE1LDggQEAgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZS1QYXRlbnQKQEAgLTQ3LDcgKzQ3LDcgQEAg
aW5kZXggODNmMWIyODVjMi4uZTJmNTgyZjhmYiAxMDA2NDQKICAjZW5kaWYNCiAgI2luY2x1ZGUg
PGFzc2VydC5oPg0KICAjaW5jbHVkZSA8c3RkaW8uaD4NCi1AQCAtOTk1LDcgKzk5Nyw3IEBAIFNj
YW5TZWN0aW9uczY0ICgKK0BAIC05OTYsNyArOTk4LDcgQEAgU2NhblNlY3Rpb25zNjQgKAogICAg
fQ0KICAgIG1Db2ZmT2Zmc2V0ID0gbURlYnVnT2Zmc2V0ICsgc2l6ZW9mKEVGSV9JTUFHRV9ERUJV
R19ESVJFQ1RPUllfRU5UUlkpICsNCiAgICAgICAgICAgICAgICAgIHNpemVvZihFRklfSU1BR0Vf
REVCVUdfQ09ERVZJRVdfTkIxMF9FTlRSWSkgKw0KQEAgLTU2LDcgKzU2LDcgQEAgaW5kZXggODNm
MWIyODVjMi4uZTJmNTgyZjhmYiAxMDA2NDQKICANCiAgICAvLw0KICAgIC8vIEFkZCBtb3JlIHNw
YWNlIGluIHRoZSAuZGVidWcgZGF0YSByZWdpb24gZm9yIHRoZSBEbGxDaGFyYWN0ZXJpc3RpY3NF
eA0KLUBAIC0yMzI5LDcgKzIzMzEsNyBAQCBXcml0ZURlYnVnNjQgKAorQEAgLTIzMzAsNyArMjMz
Miw3IEBAIFdyaXRlRGVidWc2NCAoCiAgICBFRklfSU1BR0VfREVCVUdfQ09ERVZJRVdfTkIxMF9F
TlRSWSAgICAgICAgICpOYjEwOw0KICAgIEVGSV9JTUFHRV9ERUJVR19FWF9ETExDSEFSQUNURVJJ
U1RJQ1NfRU5UUlkgKkRsbEVudHJ5Ow0KICANCkBAIC02NSw3ICs2NSw3IEBAIGluZGV4IDgzZjFi
Mjg1YzIuLmUyZjU4MmY4ZmIgMTAwNjQ0CiAgDQogICAgTnRIZHIgPSAoRUZJX0lNQUdFX09QVElP
TkFMX0hFQURFUl9VTklPTiAqKShtQ29mZkZpbGUgKyBtTnRIZHJPZmZzZXQpOw0KICAgIERhdGFE
aXIgPSAmTnRIZHItPlBlMzJQbHVzLk9wdGlvbmFsSGVhZGVyLkRhdGFEaXJlY3RvcnlbRUZJX0lN
QUdFX0RJUkVDVE9SWV9FTlRSWV9ERUJVR107DQotQEAgLTIzNjIsNyArMjM2NCw3IEBAIFdyaXRl
RGVidWc2NCAoCitAQCAtMjM2Myw3ICsyMzY1LDcgQEAgV3JpdGVEZWJ1ZzY0ICgKICANCiAgICBO
YjEwID0gKEVGSV9JTUFHRV9ERUJVR19DT0RFVklFV19OQjEwX0VOVFJZKikoRGlyICsgMSk7DQog
ICAgTmIxMC0+U2lnbmF0dXJlID0gQ09ERVZJRVdfU0lHTkFUVVJFX05CMTA7DQpAQCAtODksMTAg
Kzg5LDEwIEBAIGluZGV4IGI4MjlhMjUwM2MuLmFmZTgyNmI3OGYgMTAwNjQ0CiAgICAgICAgICBp
ZiBJbnB1dCBub3QgaW4gc2VsZi5JbnB1dHM6DQogICAgICAgICAgICAgIHNlbGYuSW5wdXRzLmFw
cGVuZChJbnB1dCkNCiBkaWZmIC0tZ2l0IGEvQmFzZVRvb2xzL1NvdXJjZS9QeXRob24vQXV0b0dl
bi9HZW5NYWtlLnB5IGIvQmFzZVRvb2xzL1NvdXJjZS9QeXRob24vQXV0b0dlbi9HZW5NYWtlLnB5
Ci1pbmRleCBlNWYyODJjNGFjLi4yN2EzNGVmN2M2IDEwMDc1NQoraW5kZXggYjcyOTEwM2VmZC4u
YWZjNWIxNGE4YSAxMDA3NTUKIC0tLSBhL0Jhc2VUb29scy9Tb3VyY2UvUHl0aG9uL0F1dG9HZW4v
R2VuTWFrZS5weQogKysrIGIvQmFzZVRvb2xzL1NvdXJjZS9QeXRob24vQXV0b0dlbi9HZW5NYWtl
LnB5Ci1AQCAtNTcxLDcgKzU3MSw3IEBAIGNsZWFubGliOgorQEAgLTU3OSw3ICs1NzksNyBAQCBj
bGVhbmxpYjoKICAgICAgICAgICAgICAgICAgb3MucmVtb3ZlKFJlc3BGaWxlTGlzdCkNCiAgDQog
ICAgICAgICAgIyBjb252ZXJ0IHNvdXJjZSBmaWxlcyBhbmQgYmluYXJ5IGZpbGVzIHRvIGJ1aWxk
IHRhcmdldHMNCkBAIC0xMDEsNyArMTAxLDcgQEAgaW5kZXggZTVmMjgyYzRhYy4uMjdhMzRlZjdj
NiAxMDA3NTUKICAgICAgICAgIGlmIGxlbihzZWxmLlJlc3VsdEZpbGVMaXN0KSA9PSAwIGFuZCBs
ZW4oTXlBZ28uU291cmNlRmlsZUxpc3QpICE9IDA6DQogICAgICAgICAgICAgIEVka0xvZ2dlci5l
cnJvcigiYnVpbGQiLCBBVVRPR0VOX0VSUk9SLCAiTm90aGluZyB0byBidWlsZCIsDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBFeHRyYURhdGE9Ilslc10iICUgc3RyKE15QWdvKSkNCi1A
QCAtNzIyLDcgKzcyMiw3IEBAIGNsZWFubGliOgorQEAgLTczMCw3ICs3MzAsNyBAQCBjbGVhbmxp
YjoKICAgICAgICAgIE91dHB1dEZpbGUgPSAnJw0KICAgICAgICAgIERlcHNGaWxlTGlzdCA9IFtd
DQogIA0KQEAgLTExMCw3ICsxMTAsNyBAQCBpbmRleCBlNWYyODJjNGFjLi4yN2EzNGVmN2M2IDEw
MDc1NQogICAgICAgICAgICAgIGlmIENtZFsyXToNCiAgICAgICAgICAgICAgICAgIGZvciBDb3B5
Q21kIGluIENtZFsyXToNCiAgICAgICAgICAgICAgICAgICAgICBTcmMsIERzdCA9IENvcHlDbWQN
Ci1AQCAtNzU1LDcgKzc1NSw3IEBAIGNsZWFubGliOgorQEAgLTc2Myw3ICs3NjMsNyBAQCBjbGVh
bmxpYjoKICAgICAgICAgICAgICBzZWxmLkJ1aWxkVGFyZ2V0TGlzdC5hcHBlbmQoJ1x0JXMnICUg
Q21kU3RyaW5nKQ0KICANCiAgICAgICAgICAgICAgc2VsZi5QYXJzZVNlY0NtZChEZXBzRmlsZUxp
c3QsIENtZFsxXSkNCkBAIC0xMTksNyArMTE5LDcgQEAgaW5kZXggZTVmMjgyYzRhYy4uMjdhMzRl
ZjdjNiAxMDA3NTUKICAgICAgICAgICAgICAgICAgc2VsZi5CdWlsZFRhcmdldExpc3QuYXBwZW5k
KCclcyA6ICVzJyAlIChzZWxmLlJlcGxhY2VNYWNybyhTZWNPdXRwdXRGaWxlKSwgc2VsZi5SZXBs
YWNlTWFjcm8oU2VjRGVwc0ZpbGUpKSkNCiAgICAgICAgICAgICAgICAgIHNlbGYuQnVpbGRUYXJn
ZXRMaXN0LmFwcGVuZCgnXHQlcycgJSBzZWxmLlJlcGxhY2VNYWNybyhTZWNDbWQpKQ0KICAgICAg
ICAgICAgICBzZWxmLkZmc091dHB1dEZpbGVMaXN0ID0gW10NCi1AQCAtNzk0LDEzICs3OTQsMTMg
QEAgY2xlYW5saWI6CitAQCAtODAyLDEzICs4MDIsMTMgQEAgY2xlYW5saWI6CiAgDQogICAgICBk
ZWYgQ29tbWFuZEV4Y2VlZExpbWl0KHNlbGYpOg0KICAgICAgICAgIEZsYWdEaWN0ID0gew0KQEAg
LTE0MCw3ICsxNDAsNyBAQCBpbmRleCBlNWYyODJjNGFjLi4yN2EzNGVmN2M2IDEwMDc1NQogICAg
ICAgICAgICAgICAgICAgICB9DQogIA0KICAgICAgICAgIFJlc3BEaWN0ID0ge30NCi1AQCAtMTAx
NCw5ICsxMDE0LDkgQEAgY2xlYW5saWI6CitAQCAtMTAyMiw5ICsxMDIyLDkgQEAgY2xlYW5saWI6
CiAgICAgICAgICAgICAgICAgIGlmIG5vdCBzZWxmLk9ialRhcmdldERpY3QuZ2V0KFQuVGFyZ2V0
LlN1YkRpcik6DQogICAgICAgICAgICAgICAgICAgICAgc2VsZi5PYmpUYXJnZXREaWN0W1QuVGFy
Z2V0LlN1YkRpcl0gPSBzZXQoKQ0KICAgICAgICAgICAgICAgICAgc2VsZi5PYmpUYXJnZXREaWN0
W1QuVGFyZ2V0LlN1YkRpcl0uYWRkKE5ld0ZpbGUpDQpAQCAtMTUzLDcgKzE1Myw3IEBAIGluZGV4
IGU1ZjI4MmM0YWMuLjI3YTM0ZWY3YzYgMTAwNzU1CiAgICAgICAgICAgICAgICAgIGlmIFQuR2Vu
RmlsZUxpc3RNYWNybyBhbmQgVC5GaWxlTGlzdE1hY3JvIG5vdCBpbiBzZWxmLkZpbGVMaXN0TWFj
cm9zOg0KICAgICAgICAgICAgICAgICAgICAgIHNlbGYuRmlsZUxpc3RNYWNyb3NbVC5GaWxlTGlz
dE1hY3JvXSA9IFtdDQogZGlmZiAtLWdpdCBhL0Jhc2VUb29scy9Tb3VyY2UvUHl0aG9uL0F1dG9H
ZW4vTW9kdWxlQXV0b0dlbi5weSBiL0Jhc2VUb29scy9Tb3VyY2UvUHl0aG9uL0F1dG9HZW4vTW9k
dWxlQXV0b0dlbi5weQotaW5kZXggNzY0YzUxNzg5Yi4uNDBhYWRiY2ZiYyAxMDA3NTUKK2luZGV4
IGMzNThkN2YwZTMuLjZlZDQ4MDkxZmEgMTAwNzU1CiAtLS0gYS9CYXNlVG9vbHMvU291cmNlL1B5
dGhvbi9BdXRvR2VuL01vZHVsZUF1dG9HZW4ucHkKICsrKyBiL0Jhc2VUb29scy9Tb3VyY2UvUHl0
aG9uL0F1dG9HZW4vTW9kdWxlQXV0b0dlbi5weQogQEAgLTE0MjksNiArMTQyOSw5IEBAIGNsYXNz
IE1vZHVsZUF1dG9HZW4oQXV0b0dlbik6CkBAIC0xNzUsNiArMTc1LDMgQEAgaW5kZXggNzY0YzUx
Nzg5Yi4uNDBhYWRiY2ZiYyAxMDA3NTUKICANCiAgICAgICAgICAjIElnbm9yZSBnZW5lcmF0aW5n
IG1ha2VmaWxlIHdoZW4gaXQgaXMgYSBiaW5hcnkgbW9kdWxlDQogICAgICAgICAgaWYgc2VsZi5J
c0JpbmFyeU1vZHVsZToNCi0tLSAKLTIuNDcuMwotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9vdm1mL292bWYvMDAwNS1VZWZpQ3B1UGtnLUNwdUV4Y2VwdGlvbkhhbmRsZXJMaWItZml4
LXB1c2gtaW5zdHJ1Y3RpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDUt
VWVmaUNwdVBrZy1DcHVFeGNlcHRpb25IYW5kbGVyTGliLWZpeC1wdXNoLWluc3RydWN0aS5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNjUwZTA4NGI1Yi4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwNS1VZWZpQ3B1UGtnLUNwdUV4Y2Vw
dGlvbkhhbmRsZXJMaWItZml4LXB1c2gtaW5zdHJ1Y3RpLnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsNDYgKzAsMCBAQAotRnJvbSA3ZTZiZTBmNDA2OGEyMTU4YWYzYzk3ZTg3M2VkYjMzZmE0ZDVj
NmI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+Ci1EYXRlOiBNb24sIDMgTm92IDIwMjUgMDk6NTY6NTIgKzAxMDAKLVN1Ympl
Y3Q6IFtQQVRDSCA1LzVdIFVlZmlDcHVQa2cvQ3B1RXhjZXB0aW9uSGFuZGxlckxpYjogZml4IHB1
c2ggaW5zdHJ1Y3Rpb25zCi0KLU5hc20gMy4wIGNvbXBsYWlucyBhYm91dCAnZHdvcmQnIGJlaW5n
IGludmFsaWQuICBUaGUgY29tbWVudCB0YWxrcyBhYm91dAotYSAnOC1ieXRlIHZhbHVlJyBzbyAn
cXdvcmQnIHNob3VsZCBiZSBjb3JyZWN0IGhlcmUuCi0KLVdpdGggdGhpcyBjaGFuZ2UgdGhlIGV4
dHJhIGNvbW1lbnQgZXhwbGFpbmluZyB0aGF0IHRoZSBpbnN0cnVjdGlvbgotYWN0dWFsbHkgcHVz
aGVzIGFuIDgtYnl0ZSB2YWx1ZSBkZXNwaXRlIHRoZSAnZHdvcmQnIGtleXdvcmQgaXMgbm90Ci1u
ZWVkZWQgYW55IG1vcmUuICBEcm9wIGl0LgotCi1GaXhlczogaHR0cHM6Ly9naXRodWIuY29tL3Rp
YW5vY29yZS9lZGsyL2lzc3Vlcy8xMTYzNQotU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dp
dGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvY29tbWl0LzljY2Y4NzUxYTc0ZjI2MTQyZTU4NGM3Yjdj
NzU3MmExODJiNjc5OTddCi0oY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCA5Y2NmODc1MWE3NGYy
NjE0MmU1ODRjN2I3Yzc1NzJhMTgyYjY3OTk3KQotU2lnbmVkLW9mZi1ieTogQW5rdXIgVHlhZ2kg
PGFua3VyLnR5YWdpQG5hdmljb2dyb3VwLmNvbT4KLS0tLQotIC4uLi9DcHVFeGNlcHRpb25IYW5k
bGVyTGliL1g2NC9FeGNlcHRpb25IYW5kbGVyQXNtLm5hc20gICAgICAgfCA0ICsrLS0KLSAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0
IGEvVWVmaUNwdVBrZy9MaWJyYXJ5L0NwdUV4Y2VwdGlvbkhhbmRsZXJMaWIvWDY0L0V4Y2VwdGlv
bkhhbmRsZXJBc20ubmFzbSBiL1VlZmlDcHVQa2cvTGlicmFyeS9DcHVFeGNlcHRpb25IYW5kbGVy
TGliL1g2NC9FeGNlcHRpb25IYW5kbGVyQXNtLm5hc20KLWluZGV4IDNkNjRhYzkwODAuLjY3MWVk
OThmODUgMTAwNjQ0Ci0tLS0gYS9VZWZpQ3B1UGtnL0xpYnJhcnkvQ3B1RXhjZXB0aW9uSGFuZGxl
ckxpYi9YNjQvRXhjZXB0aW9uSGFuZGxlckFzbS5uYXNtCi0rKysgYi9VZWZpQ3B1UGtnL0xpYnJh
cnkvQ3B1RXhjZXB0aW9uSGFuZGxlckxpYi9YNjQvRXhjZXB0aW9uSGFuZGxlckFzbS5uYXNtCi1A
QCAtNTcsNyArNTcsNyBAQCBBTElHTiAgIDgKLSBBc21JZHRWZWN0b3JCZWdpbjoNCi0gJWFzc2ln
biBWZWN0b3IgMA0KLSAlcmVwICAyNTYNCi0tICAgIHB1c2ggICAgc3RyaWN0IGR3b3JkICVbVmVj
dG9yXSA7IFRoaXMgaW5zdHJ1Y3Rpb24gcHVzaGVzIHNpZ24tZXh0ZW5kZWQgOC1ieXRlIHZhbHVl
IG9uIHN0YWNrDQotKyAgICBwdXNoICAgIHN0cmljdCBxd29yZCAlW1ZlY3Rvcl0NCi0gICAgIHB1
c2ggICAgcmF4DQotICVpZmRlZiBOT19BQlNPTFVURV9SRUxPQ1NfSU5fVEVYVA0KLSAgICAgbW92
ICAgICByYXgsIHN0cmljdCBxd29yZCAwICAgIDsgbW92ICAgICByYXgsIEFTTV9QRlgoQ29tbW9u
SW50ZXJydXB0RW50cnkpDQotQEAgLTcwLDcgKzcwLDcgQEAgQXNtSWR0VmVjdG9yQmVnaW46Ci0g
QXNtSWR0VmVjdG9yRW5kOg0KLSANCi0gSG9va0FmdGVyU3R1YkhlYWRlckJlZ2luOg0KLS0gICAg
cHVzaCAgICBzdHJpY3QgZHdvcmQgMCAgICAgIDsgMCB3aWxsIGJlIGZpeGVkDQotKyAgICBwdXNo
ICAgIHN0cmljdCBxd29yZCAwICAgICAgOyAwIHdpbGwgYmUgZml4ZWQNCi0gVmVjdG9yTnVtOg0K
LSAgICAgcHVzaCAgICByYXgNCi0gJWlmZGVmIE5PX0FCU09MVVRFX1JFTE9DU19JTl9URVhUDQot
LS0gCi0yLjQ3LjMKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dp
dC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIKaW5kZXggZWM2YzNiNTE2
Yy4uMmViMTk3ZDBiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dp
dC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiCkBAIC0yNSwxMSAr
MjUsMTAgQEAgU1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIuZ2l0
O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGEKICAgICAgICAgICAgZmlsZTovLzAwMDIt
QmFzZVRvb2xzLW1ha2VmaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDMtZGVidWctcHJlZml4LW1hcC5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDA0LXJlcHJvZHVjaWJsZS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6
Ly8wMDA1LVVlZmlDcHVQa2ctQ3B1RXhjZXB0aW9uSGFuZGxlckxpYi1maXgtcHVzaC1pbnN0cnVj
dGkucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVBWID0gImVkazItc3RhYmxlMjAyNTExIgotU1JD
UkVWID0gIjQ2NTQ4YjFhZGFjODIyMTFkOGQxMWRhMTJkZDkxNGY0MWU3YWE3NzUiCitQViA9ICJl
ZGsyLXN0YWJsZTIwMjYwMiIKK1NSQ1JFViA9ICJiN2E3MTVmN2MwM2M0NWM2YjQ1NzViZjg4NTk2
YmZkNzk2NThiOGNlIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+ZWRr
Mi1zdGFibGUuKikiCiAKIENWRV9QUk9EVUNUID0gImVkazIiCi0tIAoyLjQ3LjEKCg==

--===============8654667706659070756==--


Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10807E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 02:44:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38832.1736390683499279073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 18:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3104e403b0=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5092Fkn6004246
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jan 2025 18:44:43 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp9apu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 18:44:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 8 Jan 2025 18:44:42 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 8 Jan 2025 18:44:40 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>, <changqing.li@windriver.com>
Subject: [PATCH 2/2] ovmf: update 202408 -> 202411
Date: Thu, 9 Jan 2025 10:44:37 +0800
Message-ID: <c4e21fa187d96a5cc77a9b6a63be745e959216c8.1736388671.git.jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1736388671.git.jiaying.song.cn@windriver.com>
References: <cover.1736388671.git.jiaying.song.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677f381a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=rlrT01lvWK_a5wnVuvEA:9 a=5l33djTI3zW87Bxe:21 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rP3Ezc8b2_8S548W8vDtMg0b_D_xGSdC
X-Proofpoint-GUID: rP3Ezc8b2_8S548W8vDtMg0b_D_xGSdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_08,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 02:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209614

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Since version edk2-stable202411 already contained a fix for
CVE-2024-38796, patch
0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch was removed.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 -------------------
 ...ovmf-update-path-to-native-BaseTools.patch |  7 ++--
 ...ile-adjust-to-build-in-under-bitbake.patch |  7 ++--
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 35 +++++++++---------
 .../ovmf/ovmf/0004-reproducible.patch         | 25 +++++++------
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 +--
 6 files changed, 45 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-is=
sue-in-BasePeCoffLib.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-=
BasePeCoffLib.patch b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-=
issue-in-BasePeCoffLib.patch
deleted file mode 100644
index c6e15c5069e..00000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeC=
offLib.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5f7bd3f3c4747d5bb2733f017f8c5b93b63a74e3 Mon Sep 17 00:00:00 2001
-From: Doug Flick <dougflick@microsoft.com>
-Date: Fri, 22 Nov 2024 13:03:33 +0800
-Subject: [PATCH] MdePkg: Fix overflow issue in BasePeCoffLib
-
-The RelocDir->Size is a UINT32 value, and RelocDir->VirtualAddress is
-also a UINT32 value. The current code does not check for overflow when
-adding RelocDir->Size to RelocDir->VirtualAddress. This patch adds a
-check to ensure that the addition does not overflow.
-
-Signed-off-by: Doug Flick <dougflick@microsoft.com>
-Authored-by: sriraamx gobichettipalayam <sri..@intel.com>
-
-CVE: CVE-2024-38796
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c95233=
b8525ca6828921affd1496146cff262e65]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- MdePkg/Library/BasePeCoffLib/BasePeCoff.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c b/MdePkg/Library/Ba=
sePeCoffLib/BasePeCoff.c
-index 86ff2e7..128090d 100644
---- a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
-+++ b/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
-@@ -1054,7 +1054,7 @@ PeCoffLoaderRelocateImage (
-     RelocDir =3D &Hdr.Te->DataDirectory[0];=0D
-   }=0D
- =0D
--  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0)) {=0D
-+  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0) && (RelocDir->Size - 1=
 < MAX_UINT32 - RelocDir->VirtualAddress)) {=0D
-     RelocBase    =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (ImageContext, RelocDir->VirtualAddress, TeStrippedOffset);=0D
-     RelocBaseEnd =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (=0D
-                                                   ImageContext,=0D
---=20
-2.34.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index 89ef8d91fcf..cee5042846c 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 5f52c2582ae2226ef324332e352bb4c51b597656 Mon Sep 17 00:00:00 2001
+From 61583b59620946683551f43c6110e656604a252f Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH] ovmf: update path to native BaseTools
+Subject: [PATCH 1/4] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -28,3 +28,6 @@ index 279f0d099a..285f061bf4 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index 01101c24831..11d97c739a0 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 7cf91acf8a19a8052d05e272fad9f7e2f5b9597e Mon Sep 17 00:00:00 2001
+From aacbf7c91732b9959e569e90844cf9de078b2f14 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH 2/4] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -64,3 +64,6 @@ index d369908a09..22c670f316 100644
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 08821650fa8..73910535a71 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 415beee5adacae425f725cf9910784a0cdfa17dc Mon Sep 17 00:00:00 2001
+From 96fa2a7f2f54f1e6330275b5eba07e1efdbd865b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH] debug prefix map
+Subject: [PATCH 3/4] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -22,19 +22,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 9 insertions(+), 9 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 76aaae7261..4829d5cd5d 100755
+index 14f3b643c4..4987488e88 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -894,7 +894,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
- *_*_*_DTCPP_PATH                   =3D DEF(DTCPP_BIN)=0D
+@@ -896,7 +896,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
--DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common=0D
-+DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common ENV(GCC_PREFIX_MAP)=0D
- DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie=0D
+ # All supported GCC archs except LOONGARCH64 support -mstack-protector-gu=
ard=3Dglobal, so set that on everything except LOONGARCH64=0D
+-DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector=0D
++DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector ENV(GCC_PREFIX_MAP)=0D
+ DEFINE GCC_IA32_X64_CC_FLAGS       =3D -mstack-protector-guard=3Dglobal=0D
+ DEFINE GCC_ARM_CC_FLAGS            =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -mabi=3Daapcs -fno-short-enums -funsigned-char -ffunction-sections -fda=
ta-sections -fomit-frame-pointer -Wno-address -mthumb -fno-pic -fno-pie -ms=
tack-protector-guard=3Dglobal=0D
  DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar -ffunction-sections -fdata-sections=0D
- DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-access=0D
-@@ -915,8 +915,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
+@@ -918,8 +918,8 @@ DEFINE GCC_ARM_ASLDLINK_FLAGS      =3D DEF(GCC_ARM_DLI=
NK_FLAGS) -Wl,--entry,Refere
  DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) DEF(GCC_ARM_AARCH64_ASLDL=
INK_FLAGS)=0D
  DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
  DEFINE GCC_IA32_X64_DLINK_FLAGS    =3D DEF(GCC_IA32_X64_DLINK_COMMON) --e=
ntry _$(IMAGE_ENTRY_POINT) --file-alignment 0x20 --section-alignment 0x20 -=
Map $(DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
@@ -45,7 +45,7 @@ index 76aaae7261..4829d5cd5d 100755
  DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -P -DVFRCOMPILE --include =
$(MODULE_NAME)StrDefs.h=0D
  DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
  DEFINE GCC_ASLCC_FLAGS             =3D -x c=0D
-@@ -1069,7 +1069,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
+@@ -1072,7 +1072,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
  *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
  *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -54,7 +54,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
  RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -1097,7 +1097,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1100,7 +1100,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
  *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
@@ -63,7 +63,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
  RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -1206,7 +1206,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
+@@ -1209,7 +1209,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
  *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
  *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -72,7 +72,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
  RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -1234,7 +1234,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
+@@ -1237,7 +1237,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
  *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
  *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
@@ -81,7 +81,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
  RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -1493,7 +1493,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
+@@ -1496,7 +1496,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
  *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
  *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
  *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
@@ -90,7 +90,7 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
    DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -1525,7 +1525,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
+@@ -1528,7 +1528,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
  *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
  *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
  *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
@@ -99,3 +99,6 @@ index 76aaae7261..4829d5cd5d 100755
  =0D
    DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO=0D
    DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index aba5d9e134e..ae0ca0c15cf 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From f4ba093ea8a8a8c333c08605b3a6ff1c82712613 Mon Sep 17 00:00:00 2001
+From fc2d3c17ff2a7b39e8d47b788eeaac5e1487cdee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH] reproducible
+Subject: [PATCH 4/4] reproducible
=20
 This patch fixes various things which make the build more reproducible. So=
me changes
 here only change intermediate artefacts but that means when you have two b=
uild trees
@@ -35,7 +35,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
-index 9d04fc612e..83fd6c9c05 100644
+index 897045b2be..a66003f44a 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
 @@ -13,6 +13,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
@@ -56,7 +56,7 @@ index 9d04fc612e..83fd6c9c05 100644
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2299,7 +2301,7 @@ WriteDebug64 (
+@@ -2308,7 +2310,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -65,7 +65,7 @@ index 9d04fc612e..83fd6c9c05 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2332,7 +2334,7 @@ WriteDebug64 (
+@@ -2341,7 +2343,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -89,10 +89,10 @@ index 45b39d7878..3fed7d1736 100644
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
 diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
-index fbd35d4989..5ddd544d17 100755
+index 6d9c60b702..83ac267647 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
-@@ -575,7 +575,7 @@ cleanlib:
+@@ -576,7 +576,7 @@ cleanlib:
                  os.remove(RespFileList)=0D
  =0D
          # convert source files and binary files to build targets=0D
@@ -101,7 +101,7 @@ index fbd35d4989..5ddd544d17 100755
          if len(self.ResultFileList) =3D=3D 0 and len(MyAgo.SourceFileList=
) !=3D 0:=0D
              EdkLogger.error("build", AUTOGEN_ERROR, "Nothing to build",=0D
                              ExtraData=3D"[%s]" % str(MyAgo))=0D
-@@ -726,7 +726,7 @@ cleanlib:
+@@ -727,7 +727,7 @@ cleanlib:
          OutputFile =3D ''=0D
          DepsFileList =3D []=0D
  =0D
@@ -110,7 +110,7 @@ index fbd35d4989..5ddd544d17 100755
              if Cmd[2]:=0D
                  for CopyCmd in Cmd[2]:=0D
                      Src, Dst =3D CopyCmd=0D
-@@ -759,7 +759,7 @@ cleanlib:
+@@ -760,7 +760,7 @@ cleanlib:
              self.BuildTargetList.append('\t%s' % CmdString)=0D
  =0D
              self.ParseSecCmd(DepsFileList, Cmd[1])=0D
@@ -119,7 +119,7 @@ index fbd35d4989..5ddd544d17 100755
                  self.BuildTargetList.append('%s : %s' % (self.ReplaceMacr=
o(SecOutputFile), self.ReplaceMacro(SecDepsFile)))=0D
                  self.BuildTargetList.append('\t%s' % self.ReplaceMacro(Se=
cCmd))=0D
              self.FfsOutputFileList =3D []=0D
-@@ -798,13 +798,13 @@ cleanlib:
+@@ -799,13 +799,13 @@ cleanlib:
  =0D
      def CommandExceedLimit(self):=0D
          FlagDict =3D {=0D
@@ -140,7 +140,7 @@ index fbd35d4989..5ddd544d17 100755
                     }=0D
  =0D
          RespDict =3D {}=0D
-@@ -1007,9 +1007,9 @@ cleanlib:
+@@ -1008,9 +1008,9 @@ cleanlib:
                  if not self.ObjTargetDict.get(T.Target.SubDir):=0D
                      self.ObjTargetDict[T.Target.SubDir] =3D set()=0D
                  self.ObjTargetDict[T.Target.SubDir].add(NewFile)=0D
@@ -175,3 +175,6 @@ index 65a2176ca9..318b9611ce 100755
  =0D
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
+--=20
+2.39.5
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 32f5335fb8c..58a6828df4b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -28,8 +28,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resume=
C.patch \
            "
=20
-PV =3D "edk2-stable202408"
-SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
+PV =3D "edk2-stable202411"
+SRCREV =3D "0f3867fa6ef0553e26c42f7d71ff6bdb98429742"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"
--=20
2.25.1



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D12E16FF7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:44:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB19im5Q025884
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Dec 2015 01:44:49 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 1 Dec 2015 01:44:48 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 01:44:41 -0800
Message-ID: <be9195b2d1bc7349fb6ec5b04e2303fe668e41a4.1448962573.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448962573.git.liezhi.yang@windriver.com>
References: <cover.1448962573.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] binutils: Fix octeon3 disassembly patch
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
X-List-Received-Date: Tue, 01 Dec 2015 09:44:49 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

The structure has apparently changed, and there was a missing
setting.  This corrects a segfault when disassembling code.

(From OE-Core master rev: 2e8f1ffe3a8d7740b0ac68eefbba3fe28f7ba6d4)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../binutils/binutils/binutils-octeon3.patch       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
index 6108c0d..4e8c69f 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
@@ -229,7 +229,7 @@ Index: git/opcodes/mips-dis.c
 +  { "octeon3",   1, bfd_mach_mips_octeon3, CPU_OCTEON3,
 +    ISA_MIPS64R2 | INSN_OCTEON3, ASE_VIRT | ASE_VIRT64,
 +    mips_cp0_names_numeric,
-+    NULL, 0, mips_hwr_names_numeric },
++    NULL, 0, mips_cp1_names_mips3264, mips_hwr_names_numeric },
 +
    { "xlr", 1, bfd_mach_mips_xlr, CPU_XLR,
      ISA_MIPS64 | INSN_XLR, 0,
-- 
1.7.9.5



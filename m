Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 705AC76E70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 15:54:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9KFsZlJ023822
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Oct 2015 08:54:35 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 20 Oct 2015 08:54:35 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Oct 2015 10:54:33 -0500
Message-ID: <1445356473-186579-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1445356473-186579-1-git-send-email-mark.hatle@windriver.com>
References: <1445356473-186579-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: akuster@mvista.com
Subject: [PATCH] binutils: Fix octeon3 disassembly patch
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
X-List-Received-Date: Tue, 20 Oct 2015 15:54:39 -0000
Content-Type: text/plain

The structure has apparently changed, and there was a missing
setting.  This corrects a segfault when disassembling code.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch | 2 +-
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
1.9.3



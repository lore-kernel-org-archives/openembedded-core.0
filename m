Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C751734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 20:28:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6FKSYDQ007844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:28:34 -0700 (PDT)
Received: from yshi-Precision-T5600.corp.ad.wrs.com (147.11.216.82) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 15 Jul 2015 13:28:33 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 15 Jul 2015 13:15:26 -0700
Message-ID: <1436991327-5726-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 2.0.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Bug 8009: Backport upstream commit to fix 3.14 kernel build failure for qemumips
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
X-List-Received-Date: Wed, 15 Jul 2015 20:28:37 -0000
Content-Type: text/plain


Backported the upstream commit to solve the 3.14 kerne lbuild faiure for qemumips with gcc 4.9.3.

The following changes since commit b985d5039e5b14f5acac135a84f2d6541b531552:

  Merge branch 'standard/base' into standard/mti-malta32 (2015-05-07 14:49:36 -0400)

are available in the git repository at:

  ssh://147.11.216.82/home/yshi/yocto/workspace/qemumips/build/tmp/work/qemumips-poky-linux/linux-yocto/3.14.36+gitAUTOINC+a996d95104_b985d5039e-r0/linux-qemumips-standard-build/source

for you to fetch changes up to 7e1bb35f40c250badd2ef8dbbc7914ba405ddec4:

  MIPS: Fix build with binutils 2.24.51+ (2015-07-15 11:38:32 -0700)

----------------------------------------------------------------
Manuel Lauss (1):
      MIPS: Fix build with binutils 2.24.51+

 arch/mips/Makefile                  |  9 +++++++++
 arch/mips/include/asm/asmmacro-32.h |  6 ++++++
 arch/mips/include/asm/asmmacro.h    |  7 +++++++
 arch/mips/include/asm/fpregdef.h    | 14 ++++++++++++++
 arch/mips/include/asm/mipsregs.h    | 11 ++++++++++-
 arch/mips/kernel/branch.c           |  6 +-----
 arch/mips/kernel/genex.S            |  1 +
 arch/mips/kernel/r2300_fpu.S        |  6 ++++++
 arch/mips/kernel/r2300_switch.S     |  5 +++++
 arch/mips/kernel/r4k_fpu.S          | 27 +++++++++++++++++++++++++--
 arch/mips/kernel/r4k_switch.S       | 11 ++++++++++-
 arch/mips/kernel/r6000_fpu.S        |  5 +++++
 arch/mips/math-emu/cp1emu.c         |  6 +-----
 13 files changed, 100 insertions(+), 14 deletions(-)


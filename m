Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBSGG-0000GC-JZ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:20:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Sep 2012 08:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,405,1344236400"; d="scan'208";a="191416554"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.123])
	by azsmga001.ch.intel.com with ESMTP; 11 Sep 2012 08:07:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 08:07:51 -0700
Message-Id: <1347376071-29566-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] arch-ia32: Add x32 to MACHINEOVERRIDES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 15:20:24 -0000

This will allow the KERNEL_FEATURES to trigger the x32 ABI via overrides

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/ia32/arch-ia32.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 15f67d7..fa70e57 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -24,6 +24,7 @@ ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
 TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
 TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", ":x32", "" ,d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-- 
1.7.7.6




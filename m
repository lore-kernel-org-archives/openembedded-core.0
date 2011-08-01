Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7K-0006ZU-7b
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147069"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:36:00 -0700
Message-Id: <8b019678dfc22df3410b5b1c551874195922cdbf.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 08/22] tune/arch-powerpc64: Fix typo with 64-bit TUNE_CCARGS handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2011 07:40:50 -0000

From: Kumar Gala <galak@kernel.crashing.org>

When figuring out how to set TUNE_CCARGS we should look for 'm64' not
'n64' in TUNE_FEATURES.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../machine/include/powerpc/arch-powerpc64.inc     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index a99f18d..e55910c 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -1,6 +1,6 @@
 TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNE_CONFLICTS[m64] = "m32"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
 
 AVAILTUNES += "powerpc64 powerpc64-nf"
-- 
1.7.3.4




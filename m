Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQC1-0001VX-Sm
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410729"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:45 -0800
Message-Id: <547d7b26b8b7725f59f9e1670114c3adc37962e2.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/16] gcc-4.6: fix toolchain build for SH4
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:22 -0000

From: Michael Brown <Michael_E_Brown@Dell.com>

Signed-off-by: Michael Brown <Michael_E_Brown@dell.com>

Port patch from base openembedded. Since 4.6 already has fixes for config.gcc,
the fix only requires a one line change to gcc-cross4.inc.

The patch was imported from the OpenEmbedded git server
(git://git.openembedded.org/openembedded) as of commit id
3aa8afe97e9cf1340feb9c4442a6ed88b7e32c96.

gcc-4.5: Fix toolchain builds for SH4/SH3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross4.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross4.inc b/meta/recipes-devtools/gcc/gcc-cross4.inc
index ea20a24..4a20818 100644
--- a/meta/recipes-devtools/gcc/gcc-cross4.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross4.inc
@@ -1 +1,3 @@
 require gcc-cross.inc
+
+EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
-- 
1.7.6.4




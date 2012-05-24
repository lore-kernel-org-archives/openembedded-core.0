Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2e-00056c-Os
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034666"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:11 -0700
Message-Id: <bf145078e1ea565b6aa5c918adb7e1a926e9b2e1.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 08/28] external-sourcery-toolchain: ignore GNU_HASH issues with its packages
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
X-List-Received-Date: Thu, 24 May 2012 04:52:53 -0000

From: Christopher Larson <kergoth@gmail.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../meta/external-sourcery-toolchain.bb            |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index a14e958..b8cb6d9 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
@@ -92,6 +92,12 @@ PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux
 # This test should be fixed to ignore .a files in .debug dirs
 INSANE_SKIP_${PN}-dbg = "staticdev"
 
+# We don't care about GNU_HASH in prebuilt binaries
+INSANE_SKIP_${PN}-utils += "ldflags"
+INSANE_SKIP_libstdc++ += "ldflags"
+INSANE_SKIP_libgcc += "ldflags"
+INSANE_SKIP_gdbserver += "ldflags"
+
 PKG_${PN} = "eglibc"
 PKG_${PN}-dev = "eglibc-dev"
 PKG_${PN}-staticdev = "eglibc-staticdev"
-- 
1.7.7.6




Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQX-0006gd-1l
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:53 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772191"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:32 -0700
Message-Id: <d18821c905cef7635ddac4e91d3d93b138fe72c0.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/36] external-csl-toolchain: silence .a/.debug QA warnings
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
X-List-Received-Date: Thu, 03 May 2012 02:05:53 -0000

From: Christopher Larson <kergoth@gmail.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index bafa331..fb553ab 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -90,9 +90,8 @@ external_toolchain_sysroot_adjust() {
 
 PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
 
-INSANE_SKIP_libgcc = "1"
-INSANE_SKIP_libstdc++ = "1"
-INSANE_SKIP_gdbserver = "1"
+# This test should be fixed to ignore .a files in .debug dirs
+INSANE_SKIP_${PN}-dbg = "staticdev"
 
 PKG_${PN} = "eglibc"
 PKG_${PN}-dev = "eglibc-dev"
-- 
1.7.7.6




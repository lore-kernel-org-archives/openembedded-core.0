Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q8EcC-0006Ba-8v
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 18:32:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2011 09:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,324,1299484800"; d="scan'208";a="625616028"
Received: from unknown (HELO localhost) ([10.255.13.36])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2011 09:30:46 -0700
Message-Id: <ac9791ee607094d81c2285faa5a14b76d1459f16.1302279301.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302279301.git.sgw@linux.intel.com>
References: <cover.1302279301.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 09:10:31 -0700
Date: Fri, 08 Apr 2011  9:30:46 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 2/2] bitbake.conf: fix PACKAGE_ARCH[vardepsexclude]
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
X-List-Received-Date: Fri, 08 Apr 2011 16:32:56 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a825c17..f4de612 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -95,9 +95,9 @@ PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('BASE_PACKAGE_ARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${TARGET_ARCH}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
-# MACHINE shouldn't be included here as a variable dependency since machine specific 
-# packages are handled using multimachine
-PACKAGE_ARCHS[vardepsexclude] = "MACHINE"
+# MACHINE_ARCH shouldn't be included here as a variable dependency
+# since machine specific packages are handled using multimachine
+PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"
 
 MULTIMACH_ARCH = "${PACKAGE_ARCH}"
 MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-- 
1.7.1




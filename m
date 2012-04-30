Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7o-0000AM-5B
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:31:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453929"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:21:02 -0700
Message-Id: <c2cec8404ac996817bc7ec44fc4d800ae2735989.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/19] libgcc: Add MLPREFIX to sanity check skip
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
X-List-Received-Date: Mon, 30 Apr 2012 22:31:20 -0000

Fixes:
ERROR: QA Issue: non -staticdev package contains static .a library: lib32-libgcov-dev path '/work/x86-pokymllib32-linux/lib32-libgcc-4.7.0+svnr186651-r0/packages-split/lib32-libgcov-dev/usr/lib/i586-pokymllib32-linux/4.7.1/libgcov.a'
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/work/x86-pokymllib32-linux/lib32-libgcc-4.7.0+svnr186651-r0/temp/log.do_package.9691
NOTE: package lib32-libgcc-4.7.0+svnr186651-r0: task do_package: Failed
ERROR: Task 1077 (virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package) failed with exit code '1'
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/libgcc_4.7.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 8529755..1262fd3 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -66,6 +66,5 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 
 BBCLASSEXTEND = "nativesdk"
 
-INSANE_SKIP_${PN}-dev = "staticdev"
-INSANE_SKIP_libgcov${PKGSUFFIX}-dev = "staticdev"
-
+INSANE_SKIP_${MLPREFIX}${PN}-dev = "staticdev"
+INSANE_SKIP_${MLPREFIX}libgcov${PKGSUFFIX}-dev = "staticdev"
-- 
1.7.7.6




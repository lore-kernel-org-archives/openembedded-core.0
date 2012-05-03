Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQR-0006gd-Vd
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772171"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:20 -0700
Message-Id: <dd303065890e44f6f2c986988938c3599ea94e4f.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/36] libgcc: Add MLPREFIX to sanity check skip
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
X-List-Received-Date: Thu, 03 May 2012 02:05:48 -0000

Fixes:
ERROR: QA Issue: non -staticdev package contains static .a library: lib32-libgcov-dev path '/work/x86-pokymllib32-linux/lib32-libgcc-4.7.0+svnr186651-r0/packages-split/lib32-libgcov-dev/usr/lib/i586-pokymllib32-linux/4.7.1/libgcov.a'
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/work/x86-pokymllib32-linux/lib32-libgcc-4.7.0+svnr186651-r0/temp/log.do_package.9691
NOTE: package lib32-libgcc-4.7.0+svnr186651-r0: task do_package: Failed
ERROR: Task 1077 (virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package) failed with exit code '1'
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/libgcc_4.7.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 8529755..891c03e 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -67,5 +67,4 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 BBCLASSEXTEND = "nativesdk"
 
 INSANE_SKIP_${PN}-dev = "staticdev"
-INSANE_SKIP_libgcov${PKGSUFFIX}-dev = "staticdev"
-
+INSANE_SKIP_${MLPREFIX}libgcov${PKGSUFFIX}-dev = "staticdev"
-- 
1.7.7.6




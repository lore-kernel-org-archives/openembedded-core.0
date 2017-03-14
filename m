Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4F377824
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:37:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 14 Mar 2017 10:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,165,1486454400"; d="scan'208";a="1122478394"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2017 10:37:36 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 09:37:24 +0000
Message-Id: <20170314093726.24891-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 1/3] subversion: remove useless comment
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
X-List-Received-Date: Tue, 14 Mar 2017 17:37:36 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Remove auto-builder comment shown on the recipe because it does not add something
useful.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-devtools/subversion/subversion_1.9.5.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.5.bb b/meta/recipes-devtools/subversion/subversion_1.9.5.bb
index 05fba67..5871b84 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.5.bb
@@ -47,9 +47,4 @@ do_configure_prepend () {
 	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
 }
 
-#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: cannot find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
-#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with the above command before installing it
-#| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
-#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target 'install-serf-lib' failed
-#| make: *** [install-serf-lib] Error 1
 PARALLEL_MAKEINST = ""
-- 
2.10.2



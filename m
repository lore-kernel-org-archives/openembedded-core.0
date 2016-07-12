Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0906E73195
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:14:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2016 04:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="1005225670"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2016 04:14:58 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 14:14:52 +0300
Message-Id: <b7666300ab6844a60982349fef09bb39c7531ef7.1468310468.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1db1fda82b07a5750e581f05d967e01f1f0906b2.1468310468.git.jussi.kukkonen@intel.com>
References: <1db1fda82b07a5750e581f05d967e01f1f0906b2.1468310468.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468310468.git.jussi.kukkonen@intel.com>
References: <cover.1468310468.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 2/5] python3: Add compression to python3-shell dependencies
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
X-List-Received-Date: Tue, 12 Jul 2016 11:14:58 -0000

python3-shell needs python3-compression for tarfile.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 335c3ff..eb9857c 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -194,7 +194,7 @@ RDEPENDS_${PN}-resource="${PN}-core"
 FILES_${PN}-resource="${libdir}/python3.5/lib-dynload/resource.*.so "
 
 SUMMARY_${PN}-shell="Python shell-like functionality"
-RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
+RDEPENDS_${PN}-shell="${PN}-core ${PN}-re ${PN}-compression"
 FILES_${PN}-shell="${libdir}/python3.5/cmd.* ${libdir}/python3.5/commands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/shlex.* ${libdir}/python3.5/shutil.* "
 
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index e04da1d..44fffa4 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -336,7 +336,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.*.so" )
 
-    m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re",
+    m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re ${PN}-compression",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
-- 
2.1.4



Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8cWN-0004dc-TJ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129848258"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 12:00:09 -0700
Message-Id: <a1f5c268db3260e44e705a22e67d54185a83e4e3.1331924359.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331924359.git.nitin.a.kamble@intel.com>
References: <cover.1331924359.git.nitin.a.kamble@intel.com>
Subject: [PATCH 7/7] git: fix packaging warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commits fixes these packaging warnings
 WARNING: For recipe git, the following files/directories were installed
but not shipped in any package:
 WARNING:   /usr/lib/perl-native
 WARNING:   /usr/lib/perl-native/perl
 WARNING:   /usr/lib/perl-native/perl/5.14.2
 WARNING:   /usr/lib/perl-native/perl/5.14.2/Git.pm
 WARNING:   /usr/lib/perl-native/perl/5.14.2/perllocal.pod
 WARNING:   /usr/lib/perl-native/perl/5.14.2/auto
 WARNING:   /usr/lib/perl-native/perl/5.14.2/auto/Git
 WARNING:   /usr/lib/perl-native/perl/5.14.2/auto/Git/.packlist

PR not bumber because no change in the output packages.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/git/git.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ca13ffd..be3831b 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -16,6 +16,7 @@ do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
+	rm -rf ${D}${libdir}/perl-native
 }
 
 do_install_append_virtclass-native() {
@@ -47,6 +48,7 @@ RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${libdir}/python*"
 
+
 # git-tk package with gitk and git-gui
 PACKAGES =+ "${PN}-tk"
 #RDEPENDS_${PN}-tk = "${PN} tk tcl"
-- 
1.7.7.6




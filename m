Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7kQ-0003nW-7M
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:22:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2012 11:10:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163668619"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2012 11:10:40 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:30 -0500
Message-Id: <d7fcf642634cc0e106103971d58875be7ff71c56.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 3/9] perl: use @STAGINGDIR@ in config.sh
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
X-List-Received-Date: Tue, 03 Jul 2012 18:22:50 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

archlibexp in the snapshotted config.sh needs to be relative to
staging dir - it gets generated into Config_heavy.pl as one of the
settings and is used by ExtUtils::Embed during the target build.

The substituted setting doesn't make it into the target package
because it's removed by perl_package_preprocess() before packaging.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
index b3e2d43..75dc2d0 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
@@ -68,7 +68,7 @@ api_version='14'
 api_versionstring='5.14.0'
 ar='ar'
 archlib='/usr/lib/perl5/5.14.2/@ARCH@-thread-multi'
-archlibexp='/usr/lib/perl5/5.14.2/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@/usr/lib/perl5/5.14.2/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
-- 
1.7.0.4




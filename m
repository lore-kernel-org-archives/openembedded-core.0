Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfC8D-0000sD-GS
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 17:38:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 08:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112132912"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jun 2012 08:28:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 08:27:58 -0700
Message-Id: <2dc117f0427b111545b1377f1ce63a6e5f5b0b75.1339687522.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339687522.git.sgw@linux.intel.com>
References: <cover.1339687522.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339687522.git.sgw@linux.intel.com>
References: <cover.1339687522.git.sgw@linux.intel.com>
Subject: [PATCH 3/6] quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
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
X-List-Received-Date: Thu, 14 Jun 2012 15:38:45 -0000

On Fedora 17, bash has moved to /usr/bin/bash and the configure process it find it
on the host machine there, this ensures that it is set correctly for the target.

[YOCTO #2363]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/quilt/quilt_0.60.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt_0.60.bb b/meta/recipes-devtools/quilt/quilt_0.60.bb
index b085daf..89c3f84 100644
--- a/meta/recipes-devtools/quilt/quilt_0.60.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.60.bb
@@ -4,7 +4,10 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r0"
+PR = "r1"
+
+
+CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
 
 PERLPATH = "${bindir}/env perl"
 PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
-- 
1.7.7.6




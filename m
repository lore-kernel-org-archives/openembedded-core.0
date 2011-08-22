Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUK-0006ye-GB
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:56:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970258"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:51 -0700
Message-Id: <90c0491cef641d3d2ef8c9bf75ce86137693c4c3.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/19] rpm: be certain we don't prefix our binaries
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
X-List-Received-Date: Mon, 22 Aug 2011 21:56:57 -0000

From: Chris Larson <chris_larson@mentor.com>

In certain combinations of build/host/target, they can end up
inadvertently prefixed, breaking the assumptions in the recipe.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 0882df7..b805f7d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -162,7 +162,8 @@ EXTRA_OECONF = "--verbose \
 		--enable-maintainer-mode \
 		--with-path-macros=${rpm_macros} \
 		--with-path-lib=${libdir}/rpm \
-		--with-bugreport=http://bugzilla.yoctoproject.org"
+		--with-bugreport=http://bugzilla.yoctoproject.org \
+		--program-prefix="
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
-- 
1.7.6




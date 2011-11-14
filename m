Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoG0-0002AH-D7
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055144"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:28:10 -0800
Message-Id: <f2732d424b8a623902cd826b558f0cc730d21181.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/21] bitbake.conf: Update ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:57 -0000

* Remove an obsolete comment about mercurial
* Remove cvs-native since we have removed cvs SRC_URIs
* Fix svn-native -> subversion since that's the correct dependency name
* Add git-native since it's a core functionality and gnu-config requires it
  and can cause a circular dependency.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0d6b3b8..ffd7a85 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -146,18 +146,15 @@ DATETIME = "${DATE}${TIME}"
 
 # python-native should be here but python relies on building 
 # its own in staging
-# mercurial-native is required to pull mercurial repositories (hg://...)
-# we don't have it yet in the recipies so let's assume it's provided by
-# the underlying OS
 ASSUME_PROVIDED = "\
     bzip2-native \
-    cvs-native \
     grep-native \
     diffstat-native \
+    git-native \
     patch-native \
     perl-native-runtime \
     python-native-runtime \
-    svn-native \
+    subversion-native \
     tar-native \
     texinfo-native \
     virtual/libintl-native \
-- 
1.7.6.4




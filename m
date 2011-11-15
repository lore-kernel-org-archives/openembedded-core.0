Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQBz-0001Vb-RV
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410726"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:43 -0800
Message-Id: <37942b0d7e05a28fa16604207c5bca2253452a49.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/16] bitbake.conf: Update ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:21 -0000

* Remove an obsolete comment about mercurial
* Remove cvs-native since we have removed cvs SRC_URIs
* Remove svn-native since it's subversion and we can build native correctly

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0d6b3b8..a0d7cea 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -146,18 +146,13 @@ DATETIME = "${DATE}${TIME}"
 
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
     patch-native \
     perl-native-runtime \
     python-native-runtime \
-    svn-native \
     tar-native \
     texinfo-native \
     virtual/libintl-native \
-- 
1.7.6.4




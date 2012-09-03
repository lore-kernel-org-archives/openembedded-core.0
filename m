Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8G-0004vG-3S
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497181"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:27 +0100
Message-Id: <309bac1e4a8b4061e500061387a743dbcb2ad827.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/28] packagegroup-core-nfs: remove broken glibc-utils reference
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 10:43:52 -0000

I'm not convinced everyone who wants to serve NFS needs rpcinfo, nor is
it clear that rpcinfo is actually provided as part of eglibc-utils
anymore, so let's just remove this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-core-nfs.bb         |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index e63753b..4b1059c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -20,9 +20,3 @@ RDEPENDS_packagegroup-core-nfs-server = "\
     nfs-utils \
     nfs-utils-client \
     "
-
-# rpcinfo can be useful but only with glibc images
-GLIBC_DEPENDENCIES = "glibc-utils"
-
-RRECOMMENDS_packagegroup-core-nfs-server_append_libc-glibc = " ${GLIBC_DEPENDENCIES}"
-
-- 
1.7.9.5




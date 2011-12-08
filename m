Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYZhK-0007dK-63
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 09:51:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 00:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99987722"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 00:44:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  8 Dec 2011 00:44:14 -0800
Message-Id: <2a913fde0018d7812306e5e164f270384d3af08f.1323333676.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/17] self-hosted-image: remove extra space since we use additional disk instead
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
X-List-Received-Date: Thu, 08 Dec 2011 08:51:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 7ddba9c..53bd989 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,8 +4,6 @@ POKY_EXTRA_INSTALL = "\
     task-self-hosted \
     "
 
-IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
-
 inherit core-image
 
-PR = "r0"
+PR = "r1"
-- 
1.7.6.4




Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b6-0006gw-8G
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633080"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:34 -0800
Message-Id: <54b7c683a3febd1f7edadf5b3c628b0cc2eb5fe4.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 49/62] classes/package: remove out-of-date notice referring to the OE bugtracker
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
X-List-Received-Date: Tue, 17 Jan 2012 08:48:17 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

OpenEmbedded doesn't officially use a bug tracker anymore, and a message
asking the user to fix the metadata could be applied to almost any error
that occurs, so just remove the whole message.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1088470..45447e3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -887,10 +887,7 @@ python populate_packages () {
 	package_list = []
 	for pkg in packages.split():
 		if pkg in package_list:
-			bb.error("-------------------")
 			bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
-			bb.error("Please fix the metadata/report this as bug to OE bugtracker.")
-			bb.error("-------------------")
 		else:
 			package_list.append(pkg)
 
-- 
1.7.6.5




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RllGw-0007aO-NE
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 18:50:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jan 2012 09:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95565810"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.110])
	by azsmga001.ch.intel.com with ESMTP; 13 Jan 2012 09:43:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 17:42:58 +0000
Message-Id: <517b09c9a6bfdb8108a6b999d6b101d3fbc96d7f.1326476501.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/package: remove out-of-date notice referring to the OE bugtracker
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
X-List-Received-Date: Fri, 13 Jan 2012 17:50:39 -0000

OpenEmbedded doesn't officially use a bug tracker anymore, and a message
asking the user to fix the metadata could be applied to almost any error
that occurs, so just remove the whole message.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f8f0a12..f06bf92 100644
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
1.7.5.4




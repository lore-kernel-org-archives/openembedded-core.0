Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUK-0003lF-5U
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2011 23:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="639948970"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2011 23:59:53 -0700
Message-Id: <c4365aac40718286d7cc74a0b387cdb8f47e7723.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Fri, 6 May 2011 16:48:28 +0200
Date: Sun, 08 May 2011 23:59:52 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 14/20] package.bbclass: convert unpackaged file message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Mon, 09 May 2011 07:02:40 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6b3df7..082f233 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -676,9 +676,9 @@ python populate_packages () {
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.note("the following files were installed but not shipped in any package:")
+		bb.warn("the following files were installed but not shipped in any package:")
 		for f in unshipped:
-			bb.note("  " + f)
+			bb.warn("  " + f)
 
 	bb.build.exec_func("package_name_hook", d)
 
-- 
1.7.1.1




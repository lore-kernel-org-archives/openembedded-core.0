Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6803C736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:36:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Sep 2015 09:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,454,1437462000"; d="scan'208";a="796416719"
Received: from afshjern.zpn.intel.com ([10.219.128.48])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 09:36:20 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 11:36:45 -0500
Message-Id: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Cc: clarson@kergoth.com
Subject: [PATCH] Fix recursive mode -st on BUILDDIR setup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Sep 2015 16:36:21 -0000

Removing recursive option from chmod -st on BUILDDIR as it would
take very long on existing build directories

[YOCTO 7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 scripts/oe-setup-builddir | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index f5b7e4e..44c7dcc 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then
 fi
 
 mkdir -p "$BUILDDIR/conf"
-chmod -R -st "$BUILDDIR" 
+chmod -st "$BUILDDIR"
 
 if [ ! -d "$BUILDDIR" ]; then
     echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
-- 
2.5.1



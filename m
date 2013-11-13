Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id CB0786D614
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:32:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2013 06:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920115"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:32:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:38 +0000
Message-Id: <5ae76653682b90639496197bcc8a3eb04eccbc1b.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/11] scripts/create-recipe: fix handling of --help
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
X-List-Received-Date: Wed, 13 Nov 2013 14:32:56 -0000

If --help is specified as the first argument, show the standard help
text instead of trying to process it as a URL.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/create-recipe | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-recipe b/scripts/create-recipe
index 5613e92..b192990 100755
--- a/scripts/create-recipe
+++ b/scripts/create-recipe
@@ -1794,7 +1794,7 @@ sub calculate_sums
 # Main program 
 #
 
-if ( @ARGV < 1 ) {
+if ( @ARGV < 1 || $ARGV[0] eq "--help" ) {
     print "Usage: $0 [-r] <url-of-source-tarballs>\n";
     exit(1);
 }
-- 
1.8.1.2



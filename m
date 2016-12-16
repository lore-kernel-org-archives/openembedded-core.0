Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D915B772DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 16:26:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 16 Dec 2016 08:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="19025459"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga002.jf.intel.com with ESMTP; 16 Dec 2016 08:26:42 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 10:27:58 -0600
Message-Id: <1481905678-8258-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] ruby: upgrade to 2.3.3
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
X-List-Received-Date: Fri, 16 Dec 2016 16:26:44 -0000

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/ruby/{ruby_2.3.1.bb => ruby_2.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.3.1.bb => ruby_2.3.3.bb} (89%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.3.1.bb b/meta/recipes-devtools/ruby/ruby_2.3.3.bb
similarity index 89%
rename from meta/recipes-devtools/ruby/ruby_2.3.1.bb
rename to meta/recipes-devtools/ruby/ruby_2.3.3.bb
index 299383a..7ba9b46 100644
--- a/meta/recipes-devtools/ruby/ruby_2.3.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.3.3.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 
-SRC_URI[md5sum] = "0d896c2e7fd54f722b399f407e48a4c6"
-SRC_URI[sha256sum] = "b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd"
+SRC_URI[md5sum] = "e485f3a55649eb24a1e2e1a40bc120df"
+SRC_URI[sha256sum] = "241408c8c555b258846368830a06146e4849a1d58dcaf6b14a3b6a73058115b7"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.1.4



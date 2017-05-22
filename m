Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C07A477E6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 18:47:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 May 2017 11:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,378,1491289200"; d="scan'208";a="90367943"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2017 11:47:09 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 11:47:01 -0700
Message-Id: <20170522184702.14841-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 1/2] ruby: upgrade to 2.4.1
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
X-List-Received-Date: Mon, 22 May 2017 18:47:13 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-devtools/ruby/{ruby_2.4.0.bb => ruby_2.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.4.0.bb => ruby_2.4.1.bb} (89%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.4.0.bb b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
similarity index 89%
rename from meta/recipes-devtools/ruby/ruby_2.4.0.bb
rename to meta/recipes-devtools/ruby/ruby_2.4.1.bb
index 4d39c476309..1d335f1c287 100644
--- a/meta/recipes-devtools/ruby/ruby_2.4.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 
-SRC_URI[md5sum] = "7e9485dcdb86ff52662728de2003e625"
-SRC_URI[sha256sum] = "152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d"
+SRC_URI[md5sum] = "782bca562e474dd25956dd0017d92677"
+SRC_URI[sha256sum] = "a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.12.0



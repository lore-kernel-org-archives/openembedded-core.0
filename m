Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0F741731D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:52:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 16 Sep 2016 05:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="1031537859"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.107])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2016 05:52:48 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 13:52:30 +0100
Message-Id: <d1d1036f21e8a1d8b6a5be28132e6d01708d3997.1474030160.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
Subject: [PATCH 3/6] runqemu: clarify an INFO message
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
X-List-Received-Date: Fri, 16 Sep 2016 12:52:48 -0000

Make it clearer that we are looking for a file which ends with
qemuboot.conf

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c71a47c..6aaae44 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -205,7 +205,7 @@ class BaseConfig(object):
     def is_deploy_dir_image(self, p):
         if os.path.isdir(p):
             if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), re.M):
-                logger.info("Can't find required qemuboot.conf in %s" % p)
+                logger.info("Can't find required *.qemuboot.conf in %s" % p)
                 return False
             if not re.search('-image-', '\n'.join(os.listdir(p))):
                 logger.info("Can't find *-image-* in %s" % p)
-- 
2.7.4



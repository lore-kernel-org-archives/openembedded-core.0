Return-Path: <george.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9B076FB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:02:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2015 02:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="650616023"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 23 Sep 2015 02:02:10 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id B1C516A4083;
	Wed, 23 Sep 2015 02:01:15 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 12:02:44 +0300
Message-Id: <1442998964-15233-2-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442998964-15233-1-git-send-email-george.l.musat@intel.com>
References: <1442998964-15233-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 2/2] oeqa/runexported: Removed DEPLOY_DIR as mandatory.
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
X-List-Received-Date: Wed, 23 Sep 2015 09:02:12 -0000

We don't need DEPLOY_DIR for every runtime test so there is no
need for it to be mandatory.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 96442b1..7d68965 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -112,7 +112,7 @@ def main():
         d["DEPLOY_DIR"] = options.deploy_dir
     else:
         if not os.path.isdir(d["DEPLOY_DIR"]):
-            raise Exception("The path to DEPLOY_DIR does not exists: %s" % d["DEPLOY_DIR"])
+            print "WARNING: The path to DEPLOY_DIR does not exist: %s" % d["DEPLOY_DIR"]
 
 
     target = FakeTarget(d)
-- 
2.1.4



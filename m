Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 356A173BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:35:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Sep 2015 02:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="812185607"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2015 02:35:16 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 569B46A4005;
	Thu, 24 Sep 2015 02:34:21 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 12:33:17 +0300
Message-Id: <1443087197-3274-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runexported: Added default json file name as first parameter.
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
X-List-Received-Date: Thu, 24 Sep 2015 09:35:17 -0000

Instead of exiting when no parameter is given the default json file
name should be used.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 4213cab..d6097a1 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -90,7 +90,7 @@ def main():
 
     (options, args) = parser.parse_args()
     if len(args) != 1:
-        parser.error("Incorrect number of arguments. The one and only argument should be a json file exported by the build system")
+        args.append("testdata.json") #default file name
 
     with open(args[0], "r") as f:
         loaded = json.load(f)
-- 
2.1.4



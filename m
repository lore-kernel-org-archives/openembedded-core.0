Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E26171C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:18:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="86877667"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 04:18:48 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:18:41 +0300
Message-Id: <ab059b5261963dde84033610955127c9407a3d62.1494846894.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/5] oeqa.utils.git: use --verify in rev_parse()
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
X-List-Received-Date: Mon, 15 May 2017 11:18:48 -0000

We use rev-parse for turning git object names into SHA-1 and checking
their existence. Using --verify option makes sure git-rev-parse does
what we expect.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index e0cb3f0db2..757e3f0cbf 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -64,7 +64,7 @@ class GitRepo(object):
     def rev_parse(self, revision):
         """Do git rev-parse"""
         try:
-            return self.run_cmd(['rev-parse', revision])
+            return self.run_cmd(['rev-parse', '--verify', revision])
         except GitError:
             # Revision does not exist
             return None
-- 
2.12.0



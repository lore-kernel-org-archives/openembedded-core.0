Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB296B1A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 18:17:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2013 11:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,670,1367996400"; d="scan'208";a="370607301"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.64])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2013 11:17:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 19:17:43 +0100
Message-Id: <04ff4f22a900cff90b51d55e383edae1385384da.1373912179.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373912179.git.paul.eggleton@linux.intel.com>
References: <cover.1373912179.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1373912179.git.paul.eggleton@linux.intel.com>
References: <cover.1373912179.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/insane: fix regression in libdir QA regex
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
X-List-Received-Date: Mon, 15 Jul 2013 18:17:52 -0000

There was a slight mistake in the recent change to the lib_re regex -
it still needs to begin with a /.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1023092..b875ac0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -265,7 +265,7 @@ def package_qa_check_libdir(d):
             full_path = os.path.join(root,file)
             my_files.append(full_path[len(pkgd):])
 
-    lib_re = re.compile("^lib.+\.so(\..+)?$")
+    lib_re = re.compile("^/lib.+\.so(\..+)?$")
     exec_re = re.compile("^%s.*/lib.+\.so(\..+)?$" % exec_prefix)
 
     for file in my_files:
-- 
1.8.1.2



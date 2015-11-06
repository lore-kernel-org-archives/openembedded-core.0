Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9D575EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:01:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 05:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844153939"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:01:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:01:17 +0000
Message-Id: <282e2500e794b1a299f74d9a635253e00c19fd5f.1446814828.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] gitignore: fix overzealous exclusion
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
X-List-Received-Date: Fri, 06 Nov 2015 13:01:35 -0000

This was excluding any subdirectory anywhere in the tree named build*,
rather than just at the root - thus anything in
meta/recipes-devtools/build-compare had to be forcibly added. Change the
line so that it only operates at the root of the repo.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index e80a2fd..d8f2259 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,7 +2,7 @@ bitbake
 *.pyc
 *.pyo
 /*.patch
-build*/
+/build*/
 pyshtables.py
 pstage/
 scripts/oe-git-proxy-socks
-- 
2.1.0



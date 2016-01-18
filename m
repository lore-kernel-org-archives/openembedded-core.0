Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DB6F871633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635440114"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:34 +1300
Message-Id: <38cc7325c9618d2b9bc1461bfb624b57eae1ccce.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/10] recipetool: create: add a couple more license checksums
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:29 -0000

I found these when I was looking at libftdi and they seem to be
generic enough to show up in at least a couple of other packages so I
figure I'll add them.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ad6bf7b..43861ee 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -630,11 +630,13 @@ def get_license_md5sums(d, static_only=False):
     md5sums['55ca817ccb7d5b5b66355690e9abc605'] = 'LGPLv2'
     md5sums['252890d9eee26aab7b432e8b8a616475'] = 'LGPLv2'
     md5sums['3214f080875748938ba060314b4f727d'] = 'LGPLv2'
+    md5sums['db979804f025cf55aabec7129cb671ed'] = 'LGPLv2'
     md5sums['d32239bcb673463ab874e80d47fae504'] = 'GPLv3'
     md5sums['f27defe1e96c2e1ecd4e0c9be8967949'] = 'GPLv3'
     md5sums['6a6a8e020838b23406c81b19c1d46df6'] = 'LGPLv3'
     md5sums['3b83ef96387f14655fc854ddc3c6bd57'] = 'Apache-2.0'
     md5sums['385c55653886acac3821999a3ccd17b3'] = 'Artistic-1.0 | GPL-2.0' # some perl modules
+    md5sums['54c7042be62e169199200bc6477f04d1'] = 'BSD-3-Clause'
     return md5sums
 
 def guess_license(srctree):
-- 
2.5.0



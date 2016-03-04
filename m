Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C7E9673219
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 03:23:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 03 Mar 2016 19:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,534,1449561600"; d="scan'208";a="757852551"
Received: from nikhilbh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.241])
	by orsmga003.jf.intel.com with ESMTP; 03 Mar 2016 19:23:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 16:22:50 +1300
Message-Id: <32c068ebeb374d04152f953baa286e02f7b0c780.1457061745.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] bblayers.conf.sample: remove BBLAYERS_NON_REMOVABLE
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
X-List-Received-Date: Fri, 04 Mar 2016 03:23:01 -0000

Hob was the only thing paying attention to this, and now Hob itself has
been removed we can remove this as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bblayers.conf.sample | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/conf/bblayers.conf.sample b/meta/conf/bblayers.conf.sample
index 46126df..c985f4f 100644
--- a/meta/conf/bblayers.conf.sample
+++ b/meta/conf/bblayers.conf.sample
@@ -8,8 +8,3 @@ BBFILES ?= ""
 BBLAYERS ?= " \
   ##OEROOT##/meta \
   "
-
-BBLAYERS_NON_REMOVABLE ?= " \
-  ##OEROOT##/meta \
-  "
-
-- 
2.5.0



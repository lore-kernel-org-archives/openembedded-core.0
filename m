Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 61C39605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 03:23:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 03 Mar 2016 19:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,534,1449561600"; d="scan'208";a="757852654"
Received: from nikhilbh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.241])
	by orsmga003.jf.intel.com with ESMTP; 03 Mar 2016 19:23:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 16:22:53 +1300
Message-Id: <72c7c3cebb2e0b0fa28d3f42873d9559e3e25d2f.1457061745.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] scripts/hob: drop
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
X-List-Received-Date: Fri, 04 Mar 2016 03:23:09 -0000

The Hob UI is gone from BitBake, so we should remove this shortcut
script.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/hob | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100755 scripts/hob

diff --git a/scripts/hob b/scripts/hob
deleted file mode 100755
index 8d33ab1..0000000
--- a/scripts/hob
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/usr/bin/env bash
-export BB_ENV_EXTRAWHITE="DISABLE_SANITY_CHECKS $BB_ENV_EXTRAWHITE"
-DISABLE_SANITY_CHECKS=1 bitbake -u hob $@
-
-ret=$?
-exit $ret
-- 
2.5.0



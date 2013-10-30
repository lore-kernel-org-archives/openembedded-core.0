Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CC6426D092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:41:48 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Oct 2013 08:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="382310679"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.230])
	by azsmga001.ch.intel.com with ESMTP; 30 Oct 2013 08:41:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 15:41:42 +0000
Message-Id: <9da416ebf2f7702d11f2bad84bfed1af3526d26b.1383147565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383147565.git.paul.eggleton@linux.intel.com>
References: <cover.1383147565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1383147565.git.paul.eggleton@linux.intel.com>
References: <cover.1383147565.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/ptest: do not set EXCLUDE_FROM_WORLD
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
X-List-Received-Date: Wed, 30 Oct 2013 15:41:49 -0000

Various normal recipes that we expect to build during a world build now
inherit this class; it cannot therefore set EXCLUDE_FROM_WORLD.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/ptest.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index d67b4e6..347a681 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -1,7 +1,3 @@
-# Ptest packages are built indirectly by a distro_feature,
-# no need for them to be a direct target of 'world'
-EXCLUDE_FROM_WORLD = "1"
-
 SUMMARY_${PN}-ptest ?= "${SUMMARY} - Package test files"
 DESCRIPTION_${PN}-ptest ?= "${DESCRIPTION}  \
 This package contains a test directory ${PTEST_PATH} for package test purposes."
-- 
1.8.1.2



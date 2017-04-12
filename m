Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2301E77D42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 21:26:27 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 12 Apr 2017 14:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="76695875"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga004.jf.intel.com with ESMTP; 12 Apr 2017 14:26:27 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 14:29:14 -0700
Message-Id: <0dec41045ce26c98e153889351188b994669ffce.1492031994.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1492031994.git.brian.avery@intel.com>
References: <cover.1492031994.git.brian.avery@intel.com>
Subject: [PATCH 4/4] oe-run-native: explicitly use bash
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
X-List-Received-Date: Wed, 12 Apr 2017 21:26:28 -0000

This script sources another script (oe-find-native-sysroot) with
arguments.  It was using /bin/sh. Sourcing with arguments works only in
bash so it was failing in dash.  This commit makes it dash proof.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/oe-run-native | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index de3c02e..12f7ce6 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 #
 # Copyright (c) 2016,  Intel Corporation.
 # All Rights Reserved
-- 
1.9.1



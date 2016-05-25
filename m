Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 682B5601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:37:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 24 May 2016 20:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,362,1459839600"; d="scan'208";a="814199863"
Received: from ismailm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.14])
	by orsmga003.jf.intel.com with ESMTP; 24 May 2016 20:37:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:37:09 +1200
Message-Id: <ac62e825009a9257dddea5427ce2e37d2b88db5f.1464147312.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] bsd-headers: set SUMMARY instead of DESCRIPTION
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
X-List-Received-Date: Wed, 25 May 2016 03:37:41 -0000

Short descriptions should go into SUMMARY (DESCRIPTION will get the same
value if not set.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/bsd-headers/bsd-headers.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/bsd-headers/bsd-headers.bb b/meta/recipes-core/bsd-headers/bsd-headers.bb
index 8f43d43..c9945d4 100644
--- a/meta/recipes-core/bsd-headers/bsd-headers.bb
+++ b/meta/recipes-core/bsd-headers/bsd-headers.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "bsd compatible headers"
+SUMMARY = "BSD compatible headers"
 LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://sys-queue.h;beginline=1;endline=32;md5=c6352b0f03bb448600456547d334b56f"
 SECTION = "devel"
-- 
2.5.5



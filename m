Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 534547001D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:37:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 24 May 2016 20:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,362,1459839600"; d="scan'208";a="814199880"
Received: from ismailm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.14])
	by orsmga003.jf.intel.com with ESMTP; 24 May 2016 20:37:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:37:11 +1200
Message-Id: <9d98e71520dc4b017525610697bc766eac0ad4a8.1464147312.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] signing-keys: set SUMMARY instead of DESCRIPTION
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
X-List-Received-Date: Wed, 25 May 2016 03:37:46 -0000

Short descriptions should go into SUMMARY (DESCRIPTION will get the same
value if not set.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/signing-keys.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index ea7400b..3779037 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2015 Intel Corporation
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "Make public keys of the signing keys available"
+SUMMARY = "Makes public keys of the signing keys available"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-- 
2.5.5



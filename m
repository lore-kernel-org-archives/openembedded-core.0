Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB9BD62135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:37:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 24 May 2016 20:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,362,1459839600"; d="scan'208";a="814199869"
Received: from ismailm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.14])
	by orsmga003.jf.intel.com with ESMTP; 24 May 2016 20:37:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:37:10 +1200
Message-Id: <a4c6f9a2bf8ddb04a537800c59ec87a6d21a845c.1464147312.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464147312.git.paul.eggleton@linux.intel.com>
References: <cover.1464147312.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] fts: set SUMMARY instead of DESCRIPTION
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
X-List-Received-Date: Wed, 25 May 2016 03:37:44 -0000

Short descriptions should go into SUMMARY (DESCRIPTION will get the same
value if not set.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/fts/fts.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
index c301720..9d8230f 100644
--- a/meta/recipes-core/fts/fts.bb
+++ b/meta/recipes-core/fts/fts.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "keith bostic's POSIX file tree stream operations library"
+SUMMARY = "POSIX file tree stream operations library"
 HOMEPAGE = "https://sites.google.com/a/bostic.com/keithbostic"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://fts.h;beginline=1;endline=36;md5=2532eddb3d1a21905723a4011ec4e085"
-- 
2.5.5



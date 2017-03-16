Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB0B77589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 16 Mar 2017 02:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="61095536"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2017 02:15:51 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 61C552C8001;
	Thu, 16 Mar 2017 02:15:46 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:34 +0200
Message-Id: <3454d12a1b7b7e1ce21ae7d47b92855f9e7c3c19.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/11] python-native: Remove unused patch
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:50 -0000

avoid_parallel_make_races_on_pgen.patch was removed from SRC_URI as
handled in upstream in db9508891b6.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../avoid_parallel_make_races_on_pgen.patch        | 27 ----------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch

diff --git a/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch b/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
deleted file mode 100644
index a592ea4..0000000
--- a/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-Avoids parallel make races linking errors when making Parser/PGEN
-
-- Implements Richard Purdie's idea
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
-Index: Python-2.7.9/Makefile.pre.in
-===================================================================
---- Python-2.7.9.orig/Makefile.pre.in
-+++ Python-2.7.9/Makefile.pre.in
-@@ -610,12 +610,10 @@ Modules/grpmodule.o: $(srcdir)/Modules/g
- 
- Modules/pwdmodule.o: $(srcdir)/Modules/pwdmodule.c $(srcdir)/Modules/posixmodule.h
- 
--$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
-+$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS) $(PGEN)
- 		@$(MKDIR_P) Include
--		$(MAKE) $(PGEN)
- 		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
--		$(MAKE) $(GRAMMAR_H)
- 		touch $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
-- 
2.1.4



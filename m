Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 756B87001D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 17:06:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2016 10:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,445,1459839600"; d="scan'208";a="994444733"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.17.152])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 10:06:01 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 12:07:37 -0500
Message-Id: <1465492059-7708-2-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
In-Reply-To: <1465492059-7708-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1465492059-7708-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH 1/3] scripts/lib/bsp/engine.py: Rename raw_input commands to input
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
X-List-Received-Date: Thu, 09 Jun 2016 17:06:34 -0000

According to https://docs.python.org/3/whatsnew/3.0.html python3
renamed 'raw_input' to 'input'. Making the appropiate changes for
this.

[YOCTO #9723]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/lib/bsp/engine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index 0c162eb..c44bbc5 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -200,7 +200,7 @@ class EditBoxInputLine(InputLine):
 
         msg += " [default: " + default_choice + "]"
 
-        line = name + " = default(raw_input(\"" + msg + " \"), " + name + ")"
+        line = name + " = default(input(\"" + msg + " \"), " + name + ")"
 
         return line
 
@@ -313,7 +313,7 @@ class BooleanInputLine(InputLine):
 
         msg += " [default: " + default_choice + "]"
 
-        line = name + " = boolean(raw_input(\"" + msg + " \"), " + name + ")"
+        line = name + " = boolean(input(\"" + msg + " \"), " + name + ")"
 
         return line
 
-- 
2.4.11



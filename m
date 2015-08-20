Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8944767D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 04:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787700976"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 04:56:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 2529F6A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:23 +0300
Message-Id: <cfae4fded21ebccf0b427526db6d1a996319cd7e.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/17] wic: rename variable
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:57 -0000

Renamed variable help -> hlp as 'help' is a name of Python
built-in function.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/help.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 5fa5836..dc6ff36 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -41,9 +41,9 @@ def display_help(subcommand, subcommands):
     if subcommand not in subcommands:
         return False
 
-    help = subcommands.get(subcommand, subcommand_error)[2]
+    hlp = subcommands.get(subcommand, subcommand_error)[2]
     pager = subprocess.Popen('less', stdin=subprocess.PIPE)
-    pager.communicate(help)
+    pager.communicate(hlp)
 
     return True
 
-- 
2.1.4



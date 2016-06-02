Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 56CBF773D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 02 Jun 2016 03:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="993699792"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2016 03:13:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id E18526A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:24 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:55 +0300
Message-Id: <bdae29c3f78f894d29543c53ed9a07221c57d1ea.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/16] engine.py: python3: rename sys.maxint to sys.maxsize
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:56 -0000

Renamed sys.maxint -> sys.maxsize as sys.maxint doesn't
exist in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/bsp/engine.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index 5b49486..03bd66e 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -49,7 +49,7 @@ class Line(metaclass=ABCMeta):
     def __init__(self, line):
         self.line = line
         self.generated_line = ""
-        self.prio = sys.maxint
+        self.prio = sys.maxsize
         self.discard = False
 
     @abstractmethod
@@ -154,7 +154,7 @@ class InputLine(Line):
         try:
             self.prio = int(props["prio"])
         except KeyError:
-            self.prio = sys.maxint
+            self.prio = sys.maxsize
 
     def gen(self, context = None):
         try:
@@ -1284,7 +1284,7 @@ class InputLineGroup(InputLine):
     def __init__(self, codeline):
         InputLine.__init__(self, {}, "", 0)
         self.group = []
-        self.prio = sys.maxint
+        self.prio = sys.maxsize
         self.group.append(codeline)
 
     def append(self, line):
-- 
2.1.4



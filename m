Return-Path: <rodrigo.chiossi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED8872825
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 14:19:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2015 06:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508154060"
Received: from rchiossi-1.bz.intel.com (HELO rchiossi-1.localdomain)
	([10.218.99.50])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 06:13:23 -0800
From: Rodrigo Chiossi <rodrigo.chiossi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 12:18:54 -0200
Message-Id: <1420553934-2559-1-git-send-email-rodrigo.chiossi@intel.com>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH] lib/oe/terminal: add support for Terminology terminal emulator
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
X-List-Received-Date: Tue, 06 Jan 2015 14:19:25 -0000

Terminology is the default Enlightenment terminal emulator

Signed-off-by: Rodrigo Chiossi <rodrigo.chiossi@intel.com>
---
 meta/lib/oe/terminal.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 0a623c7..e9af726 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -63,6 +63,10 @@ class Xfce(XTerminal):
     command = 'xfce4-terminal -T "{title}" -e "{command}"'
     priority = 2
 
+class Terminology(XTerminal):
+    command = 'terminology -T="{title}" -e {command}'
+    priority = 2
+
 class Konsole(XTerminal):
     command = 'konsole -T "{title}" -e {command}'
     priority = 2
-- 
2.1.3



Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0F177270
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 22:05:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 19 Feb 2016 14:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,472,1449561600"; d="scan'208";a="51153516"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 14:05:56 -0800
Received: from fjpedraz.zpn.intel.com (fjpedraz.zpn.intel.com [10.219.24.19])
	by linux.intel.com (Postfix) with ESMTP id AABFB6A4004;
	Fri, 19 Feb 2016 14:53:46 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 16:05:41 -0600
Message-Id: <1455919542-28863-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCHv2 1/2] oeqa/utils: added new networke module
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
X-List-Received-Date: Fri, 19 Feb 2016 22:05:57 -0000

A network module was added, and will contain network utility funcions for now.
with get_free_port that returns availabe network port in the system.

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/utils/network.py | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/network.py

diff --git a/meta/lib/oeqa/utils/network.py b/meta/lib/oeqa/utils/network.py
new file mode 100644
index 0000000..2768f6c
--- /dev/null
+++ b/meta/lib/oeqa/utils/network.py
@@ -0,0 +1,8 @@
+import socket
+
+def get_free_port():
+    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+    s.bind(('', 0))
+    addr = s.getsockname()
+    s.close()
+    return addr[1]
-- 
2.5.0



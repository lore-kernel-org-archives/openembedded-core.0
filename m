Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE4C0759CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 09:29:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2015 02:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,658,1427785200"; d="scan'208";a="748037128"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2015 02:29:20 -0700
Received: from ubuntu-ws.rb.intel.com (ubuntu-ws.rb.intel.com [10.237.105.32])
	by linux.intel.com (Postfix) with ESMTP id DFA646A4005;
	Mon, 22 Jun 2015 02:28:42 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 12:28:42 +0300
Message-Id: <1434965322-16583-2-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434965322-16583-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1434965322-16583-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 2/2] oeqa/utils: Minor documentation update to ftools methods.
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
X-List-Received-Date: Mon, 22 Jun 2015 09:29:24 -0000

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/utils/ftools.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 64ebe3d..e396591 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -1,22 +1,26 @@
 import os
 import re
 
+# Replaces file (path) content with 'data'
 def write_file(path, data):
     wdata = data.rstrip() + "\n"
     with open(path, "w") as f:
         f.write(wdata)
 
+# Append 'data' to a specified file (path)
 def append_file(path, data):
     wdata = data.rstrip() + "\n"
     with open(path, "a") as f:
             f.write(wdata)
 
+# Returns the content of the specified file (path)
 def read_file(path):
     data = None
     with open(path) as f:
         data = f.read()
     return data
 
+# Removes 'data' from a specified file (path)
 def remove_from_file(path, data):
     lines = read_file(path).splitlines()
     rmdata = data.strip().splitlines()
-- 
2.1.4



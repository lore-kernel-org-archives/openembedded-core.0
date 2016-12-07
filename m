Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 353C6606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:35 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172592"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:36 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:22 -0600
Message-Id: <2fd5296cdd3485bd4eab59388ba8d19fce3fb022.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 17/32] oeqa/utils/path: Add remove_safe function
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checks if path exists before try to remove of avoid exception.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/utils/path.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/core/utils/path.py b/meta/lib/oeqa/core/utils/path.py
index cb06523..a21caad 100644
--- a/meta/lib/oeqa/core/utils/path.py
+++ b/meta/lib/oeqa/core/utils/path.py
@@ -12,3 +12,8 @@ def findFile(file_name, directory):
         if file_name in f:
             return os.path.join(r, file_name)
     return None
+
+def remove_safe(path):
+    if os.path.exists(path):
+        os.remove(path)
+
-- 
2.1.4



Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 672EA71A96
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533306"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:32 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:44:02 -0600
Message-Id: <2fd5296cdd3485bd4eab59388ba8d19fce3fb022.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 17/32] oeqa/utils/path: Add remove_safe function
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:32 -0000
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



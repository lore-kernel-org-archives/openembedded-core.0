Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A079A77BF4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 21:40:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 29 Mar 2017 14:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,243,1486454400"; d="scan'208";a="80736022"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.126])
	by orsmga005.jf.intel.com with ESMTP; 29 Mar 2017 14:40:13 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 15:44:09 -0600
Message-Id: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, saul.wold@intel.com
Subject: [PATCH 1/2] scripts/lib/compatlayer: detect_layers always use realpath's
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
X-List-Received-Date: Wed, 29 Mar 2017 21:40:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If you are using relative paths and change to other folder for
execution it will fail, so use realpaths always.

[YOCTO #11164]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/compatlayer/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 58f94b7..087ac14 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -112,6 +112,7 @@ def detect_layers(layer_directories, no_auto):
     layers = []
 
     for directory in layer_directories:
+        directory = os.path.realpath(directory)
         if directory[-1] == '/':
             directory = directory[0:-1]
 
-- 
2.1.4



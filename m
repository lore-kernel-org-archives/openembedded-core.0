Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 48488771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567450"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:47 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:57 -0600
Message-Id: <90a1ea368bb7aa090ba61bbb4d460ee00014679d.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 26/55] oeqa/sdkext: Move test cases inside cases directory
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For match with the new structure of the OEQA framework.

In the new framework Test component base directory in this case
sdk module will contain case and context implementations.

[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/sdkext/__init__.py               | 3 ---
 meta/lib/oeqa/sdkext/{ => cases}/devtool.py    | 0
 meta/lib/oeqa/sdkext/{ => cases}/sdk_update.py | 0
 3 files changed, 3 deletions(-)
 rename meta/lib/oeqa/sdkext/{ => cases}/devtool.py (100%)
 rename meta/lib/oeqa/sdkext/{ => cases}/sdk_update.py (100%)

diff --git a/meta/lib/oeqa/sdkext/__init__.py b/meta/lib/oeqa/sdkext/__init__.py
index 4cf3fa7..e69de29 100644
--- a/meta/lib/oeqa/sdkext/__init__.py
+++ b/meta/lib/oeqa/sdkext/__init__.py
@@ -1,3 +0,0 @@
-# Enable other layers to have tests in the same named directory
-from pkgutil import extend_path
-__path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
similarity index 100%
rename from meta/lib/oeqa/sdkext/devtool.py
rename to meta/lib/oeqa/sdkext/cases/devtool.py
diff --git a/meta/lib/oeqa/sdkext/sdk_update.py b/meta/lib/oeqa/sdkext/cases/sdk_update.py
similarity index 100%
rename from meta/lib/oeqa/sdkext/sdk_update.py
rename to meta/lib/oeqa/sdkext/cases/sdk_update.py
-- 
2.1.4



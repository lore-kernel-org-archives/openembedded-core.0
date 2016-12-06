Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7681871AE4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533337"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:36 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:44:12 -0600
Message-Id: <5240c438840ee7a6c59a1acf9abffa8546d53755.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 27/32] oeqa/sdkext: Move test cases inside cases directory
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:35 -0000
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



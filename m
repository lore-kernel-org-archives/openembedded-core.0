Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8074377EFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279660"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:23 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:18 -0500
Message-Id: <1e9c0f3ee67bdcb9a810c1a3e0bdb31a283a6c0c.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 03/30] selftest/cases/package: Call parent setUpClass method
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since config paths are now passed in Test context the setUpClass
method is expected to be call.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/package.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 5b9a6d15851..b07d6ed0abe 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -17,6 +17,8 @@ class VersionOrdering(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
+        super(VersionOrdering, cls).setUpClass()
+
         # Build the tools we need and populate a sysroot
         bitbake("dpkg-native opkg-native rpm-native python3-native")
         bitbake("build-sysroots -c build_native_sysroot")
-- 
2.11.0



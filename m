Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0EC780BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:36:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133714"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:36:54 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:49 -0500
Message-Id: <7eea0ae94f51d3bd5ee933d57f0cc9c90ace5cd2.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 03/29] selftest/cases/package: Call parent setUpClass method
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
X-List-Received-Date: Wed, 12 Jul 2017 19:36:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since config paths are now passed in Test context the setUpClass
method is expected to be call.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/package.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 5b9a6d15851..169698f780d 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -17,6 +17,8 @@ class VersionOrdering(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
+        super().setUpClass()
+
         # Build the tools we need and populate a sysroot
         bitbake("dpkg-native opkg-native rpm-native python3-native")
         bitbake("build-sysroots -c build_native_sysroot")
-- 
2.11.0



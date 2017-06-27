Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4E4C77FA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 16:30:14 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 09:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,402,1493708400"; d="scan'208";a="119404100"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga005.fm.intel.com with ESMTP; 27 Jun 2017 09:30:13 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 11:30:20 -0500
Message-Id: <20170627163020.22521-2-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170627163020.22521-1-anibal.limon@linux.intel.com>
References: <20170627163020.22521-1-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/2] selftest/cases/package: Call parent setUpClass method
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
X-List-Received-Date: Tue, 27 Jun 2017 16:30:14 -0000
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



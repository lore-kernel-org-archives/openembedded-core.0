Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C91BE71A0C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:34:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 08:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,343,1498546800"; d="scan'208";a="1001363531"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Aug 2017 08:34:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Aug 2017 18:30:50 +0300
Message-Id: <e7b03aa7e73bc8e3f08394e4c1e44d8b91f0378f.1502206031.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] cryptodev-tests: depend on openssl 1.0
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
X-List-Received-Date: Tue, 08 Aug 2017 15:34:19 -0000

Upstream ticket:
https://github.com/cryptodev-linux/cryptodev-linux/issues/22

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
index 9cb5dcb94f0..9afb3de217e 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
@@ -2,7 +2,7 @@ require cryptodev.inc
 
 SUMMARY = "A test suite for /dev/crypto device driver"
 
-DEPENDS += "openssl"
+DEPENDS += "openssl10"
 
 SRC_URI += " \
 file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
-- 
2.13.2



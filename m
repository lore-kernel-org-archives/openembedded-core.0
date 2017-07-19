Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B3356782C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 13:21:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 06:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="994712717"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 06:21:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 16:19:11 +0300
Message-Id: <0cfc0d6596b6f107593126a50c37c312b8bc6eb3.1500470150.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
References: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/5] cryptodev-tests: depend on openssl 1.0
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
X-List-Received-Date: Wed, 19 Jul 2017 13:21:41 -0000

Upstream ticket:
https://github.com/cryptodev-linux/cryptodev-linux/issues/22

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb
index c4005242a76..13011799ad5 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb
@@ -2,7 +2,7 @@ require cryptodev.inc
 
 SUMMARY = "A test suite for /dev/crypto device driver"
 
-DEPENDS += "openssl"
+DEPENDS += "openssl10"
 
 SRC_URI += " \
 file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
-- 
2.13.2



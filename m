Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8E19F7882C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:27:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 04:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,340,1511856000"; d="scan'208";a="18133577"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2018 04:27:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 14:27:39 +0200
Message-Id: <20180110122742.1226-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH 1/4] libgcrypt: upgrade to 1.8.2
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
X-List-Received-Date: Wed, 10 Jan 2018 12:27:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libgcrypt/{libgcrypt_1.8.1.bb => libgcrypt_1.8.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.1.bb => libgcrypt_1.8.2.bb} (92%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
index 5bd815ae55a..b36e653a876 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
@@ -21,8 +21,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
 "
-SRC_URI[md5sum] = "b21817f9d850064d2177285f1073ec55"
-SRC_URI[sha256sum] = "7a2875f8b1ae0301732e878c0cca2c9664ff09ef71408f085c50e332656a78b3"
+SRC_URI[md5sum] = "cfb0b5c79eab07686b6898160a407139"
+SRC_URI[sha256sum] = "c8064cae7558144b13ef0eb87093412380efa16c4ee30ad12ecb54886a524c07"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.15.1



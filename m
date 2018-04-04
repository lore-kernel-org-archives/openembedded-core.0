Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id B59CE7474D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:19:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599782"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:19:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:00 +0300
Message-Id: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 01/22] lighttpd: upgrade 1.4.48 -> 1.4.49
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
X-List-Received-Date: Wed, 04 Apr 2018 11:19:54 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lighttpd/{lighttpd_1.4.48.bb => lighttpd_1.4.49.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.48.bb => lighttpd_1.4.49.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
index 3c4444cf423..272a66a10d5 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "1e3a9eb5078f481e3a8a1d0aaac8c3c8"
-SRC_URI[sha256sum] = "0f8ad5aac7529d7b948b9d7e8cd0b4a9e177309d85d6bf6516e28e6e40d74f36"
+SRC_URI[md5sum] = "aaf8165379351c3766e5ad1e5c9dbe8b"
+SRC_URI[sha256sum] = "aedf49d7127d9e4c0ea56618e9e945a17674dc46a37ac7990120f87dd939ce09"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.16.1



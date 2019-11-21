Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 194047F8A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 01:45:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78817512"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 09:45:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CA57D4CE1BE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:36:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 21 Nov 2019 09:45:18 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2019 00:55:36 -0800
Message-ID: <1574326536-1600-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574326536-1600-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1574326536-1600-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: CA57D4CE1BE4.A7E2D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] cmake-native:upgrade 3.15.3 -> 3.15.5
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
X-List-Received-Date: Thu, 21 Nov 2019 01:45:18 -0000
Content-Type: text/plain

---
 .../cmake/{cmake-native_3.15.3.bb => cmake-native_3.15.5.bb}          | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.15.3.bb => cmake-native_3.15.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.15.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.15.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d8a9e2d..24190de 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "bf69e837eeda3dd4e9f52cffcf546a11"
-SRC_URI[sha256sum] = "13958243a01365b05652fa01b21d40fa834f70a9e30efa69c02604e64f58b8f5"
+SRC_URI[md5sum] = "5fe3ebca627b4c3dcc2f127fbcfbceba"
+SRC_URI[sha256sum] = "fbdd7cef15c0ced06bb13024bfda0ecc0dedbcaaaa6b8a5d368c75255243beb4"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.7.4





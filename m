Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D8A987F440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:32:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,356,1559491200"; d="scan'208";a="73123197"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 13:32:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9E98D4CDFCDD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 13:32:23 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 13:32:24 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2019 13:31:41 +0800
Message-ID: <20190807053141.26284-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9E98D4CDFCDD.AD48A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python-scons:upgrade 3.0.5 -> 3.1.0
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
X-List-Received-Date: Wed, 07 Aug 2019 05:32:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-scons-native_3.0.5.bb => python-scons-native_3.1.0.bb}    | 0
 .../python/{python-scons_3.0.5.bb => python-scons_3.1.0.bb}           | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_3.0.5.bb => python-scons-native_3.1.0.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_3.0.5.bb => python-scons_3.1.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.5.bb b/meta/recipes-devtools/python/python-scons-native_3.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_3.0.5.bb
rename to meta/recipes-devtools/python/python-scons-native_3.1.0.bb
diff --git a/meta/recipes-devtools/python/python-scons_3.0.5.bb b/meta/recipes-devtools/python/python-scons_3.1.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python-scons_3.0.5.bb
rename to meta/recipes-devtools/python/python-scons_3.1.0.bb
index 939c15b..b174050 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.5.bb
+++ b/meta/recipes-devtools/python/python-scons_3.1.0.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
-SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
+SRC_URI[md5sum] = "e2fe9d16f81b0285b969238af4b552ff"
+SRC_URI[sha256sum] = "f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f"
 
 S = "${WORKDIR}/scons-${PV}"
 
-- 
2.7.4





Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 76B596067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:33:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38025971"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:33:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 22EE24D0EFD1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:33:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:33:26 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:33:33 +0800
Message-ID: <1521603213-34824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 22EE24D0EFD1.A59B0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python-setuptools: 38.5.2 -> 39.0.1
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
X-List-Received-Date: Wed, 21 Mar 2018 03:33:34 -0000
Content-Type: text/plain

Upgrade python-setuptools from 38.5.2 to 39.0.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_38.5.2.bb => python-setuptools_39.0.1.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_38.5.2.bb => python-setuptools_39.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index b5bd8cc..c5eb4a5 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "b4c7f29c8079bdf2f0f355cdcd999e69"
-SRC_URI[sha256sum] = "8246123e984cadf687163bdcd1bb58eb325e2891b066e1f0224728a41c8d9064"
+SRC_URI[md5sum] = "75310b72ca0ab4e673bf7679f69d7a62"
+SRC_URI[sha256sum] = "bec7badf0f60e7fc8153fac47836edc41b74e5d541d7692e614e635720d6a7c7"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_38.5.2.bb b/meta/recipes-devtools/python/python-setuptools_39.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_38.5.2.bb
rename to meta/recipes-devtools/python/python-setuptools_39.0.1.bb
-- 
2.7.4





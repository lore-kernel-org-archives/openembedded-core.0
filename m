Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E25F97D39B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 04:43:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,322,1566835200"; d="scan'208";a="77257851"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Oct 2019 12:43:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 708564CE14FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:43:16 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 21 Oct 2019 12:43:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2019 12:43:58 +0800
Message-ID: <20191021044358.4292-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 708564CE14FE.A9126
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python-setuptools:upgrade 41.2.0 -> 41.4.0
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
X-List-Received-Date: Mon, 21 Oct 2019 04:43:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_41.2.0.bb => python-setuptools_41.4.0.bb}      | 0
 .../{python3-setuptools_41.2.0.bb => python3-setuptools_41.4.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_41.2.0.bb => python-setuptools_41.4.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_41.2.0.bb => python3-setuptools_41.4.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 322197e..027e259 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "a3470ce184da33f0fa6c9f44f6221bc0"
-SRC_URI[sha256sum] = "66b86bbae7cc7ac2e867f52dc08a6bd064d938bac59dfec71b9b565dd36d6012"
+SRC_URI[md5sum] = "89a592d733b31e180a4b6ad760c0685a"
+SRC_URI[sha256sum] = "7eae782ccf36b790c21bde7d86a4f303a441cd77036b25c559a602cf5186ce4d"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_41.2.0.bb b/meta/recipes-devtools/python/python-setuptools_41.4.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_41.2.0.bb
rename to meta/recipes-devtools/python/python-setuptools_41.4.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_41.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_41.4.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_41.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_41.4.0.bb
-- 
2.7.4





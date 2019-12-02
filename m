Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 966CA7F666
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 09:03:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="79439462"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 17:04:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A72754CE1BEC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:55:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 17:04:00 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Dec 2019 07:30:30 -0800
Message-ID: <1575300630-101677-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575300630-101677-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575300630-101677-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A72754CE1BEC.AA314
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python-setuptools: upgrade 41.6.0 -> 42.0.2
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
X-List-Received-Date: Mon, 02 Dec 2019 09:04:00 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_41.6.0.bb => python-setuptools_42.0.2.bb}      | 0
 .../{python3-setuptools_41.6.0.bb => python3-setuptools_42.0.2.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_41.6.0.bb => python-setuptools_42.0.2.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_41.6.0.bb => python3-setuptools_42.0.2.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index f0f100f..d8bce71 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "5585a55bfc28474ef13cc0b1819c5a46"
-SRC_URI[sha256sum] = "6afa61b391dcd16cb8890ec9f66cc4015a8a31a6e1c2b4e0c464514be1a3d722"
+SRC_URI[md5sum] = "5ac69b66a6f7d4785517017f37df28e9"
+SRC_URI[sha256sum] = "c5b372090d7c8709ce79a6a66872a91e518f7d65af97fca78135e1cb10d4b940"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_41.6.0.bb b/meta/recipes-devtools/python/python-setuptools_42.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_41.6.0.bb
rename to meta/recipes-devtools/python/python-setuptools_42.0.2.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_41.6.0.bb b/meta/recipes-devtools/python/python3-setuptools_42.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_41.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_42.0.2.bb
-- 
2.7.4





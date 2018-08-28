Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0DD78963
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:43:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44069652"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2018 17:43:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5A82C4B6EC84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:43:35 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 28 Aug 2018 17:43:32 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2018 17:43:18 +0800
Message-ID: <20180828094319.19765-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180828094319.19765-1-hongl.fnst@cn.fujitsu.com>
References: <20180828094319.19765-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 5A82C4B6EC84.AEA54
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH]python-setuptools:upgrade to 40.2.0
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
X-List-Received-Date: Tue, 28 Aug 2018 09:43:36 -0000
Content-Type: text/plain

Upgrade python-setuptools from 40.0.0 to 40.2.0

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_40.0.0.bb => python-setuptools_40.2.0.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_40.0.0.bb => python-setuptools_40.2.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 315ba31..c3924b0 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
-SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
+SRC_URI[md5sum] = "592efabea3a65d8e97a025ed52f69b12"
+SRC_URI[sha256sum] = "47881d54ede4da9c15273bac65f9340f8929d4f0213193fa7894be384f2dcfa6"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python-setuptools_40.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_40.0.0.bb
rename to meta/recipes-devtools/python/python-setuptools_40.2.0.bb
-- 
2.7.4





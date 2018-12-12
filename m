Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E5B9C6C19B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 00:39:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,343,1539619200"; d="scan'208";a="49555654"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Dec 2018 08:39:19 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4F4854B734D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 08:39:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 12 Dec 2018 08:39:24 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2018 08:39:09 +0800
Message-ID: <20181212003909.31594-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 4F4854B734D7.AD9C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] python-setuptools:upgrade to 40.6.2
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
X-List-Received-Date: Wed, 12 Dec 2018 00:39:20 -0000
Content-Type: text/plain

1.Upgrade python-setuptools from 40.0.0 to 40.6.2

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
 ...ython-setuptools_40.0.0.bb => python-setuptools_40.6.2.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_40.0.0.bb => python-setuptools_40.6.2.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 315ba31396..fc89eefffd 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
-SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
+SRC_URI[md5sum] = "1c45c7d66dc84ae4ee36581dc9e5359b"
+SRC_URI[sha256sum] = "86bb4d8e1b0fabad1f4642b64c335b673e53e7a381de03c9a89fe678152c4c64"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python-setuptools_40.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_40.0.0.bb
rename to meta/recipes-devtools/python/python-setuptools_40.6.2.bb
-- 
2.17.2





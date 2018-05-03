Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5F44D6022F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 07:25:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39517231"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 May 2018 15:25:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DB6D74B314A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 15:25:05 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 3 May 2018 15:25:05 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 May 2018 15:24:56 +0800
Message-ID: <20180503072458.19458-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180503072458.19458-1-hongl.fnst@cn.fujitsu.com>
References: <20180503072458.19458-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: DB6D74B314A2.ADBA2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gtk-doc: 1.27 -> 1.28
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
X-List-Received-Date: Thu, 03 May 2018 07:25:08 -0000
Content-Type: text/plain

Upgrade gtk-doc from 1.27 to 1.28.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-gnome/gtk-doc/{gtk-doc_1.27.bb => gtk-doc_1.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.27.bb => gtk-doc_1.28.bb} (93%)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
similarity index 93%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
index 4552811..a2ec6ac 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
@@ -18,8 +18,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = "--with-highlight=source-highlight,--with-highlight=no,libxslt-native xmlto-native source-highlight-native python3-six"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.md5sum] = "b29949e0964762e474b706ce22171602"
-SRC_URI[archive.sha256sum] = "e26bd3f7080c749b1cb66c46c6bf8239e2f320a949964fb9c6d56e1b0c6d9a6f"
+SRC_URI[archive.md5sum] = "48550c33f9b9b530f9e5f397979b613a"
+SRC_URI[archive.sha256sum] = "911e29e302252c96128965ee1f4067d5431a88e00ad1023a8bc1d6b922af5715"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.7.4





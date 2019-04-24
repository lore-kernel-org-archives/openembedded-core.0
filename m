Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 93867600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 03:32:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,388,1549900800"; d="scan'208";a="60339880"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 11:32:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 454AC4CD8D87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:32:07 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 11:32:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Apr 2019 11:32:56 +0800
Message-ID: <20190424033256.31641-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 454AC4CD8D87.A91B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] icu:upgrade 64.1 -> 64.2
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
X-List-Received-Date: Wed, 24 Apr 2019 03:32:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from icu_64.1.bb to icu_64.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/icu/{icu_64.1.bb => icu_64.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/icu/{icu_64.1.bb => icu_64.2.bb} (86%)

diff --git a/meta/recipes-support/icu/icu_64.1.bb b/meta/recipes-support/icu/icu_64.2.bb
similarity index 86%
rename from meta/recipes-support/icu/icu_64.1.bb
rename to meta/recipes-support/icu/icu_64.2.bb
index 9a5f8a3b09..bbc76d6483 100644
--- a/meta/recipes-support/icu/icu_64.1.bb
+++ b/meta/recipes-support/icu/icu_64.2.bb
@@ -22,8 +22,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "f150be2231c13bb45206d79e0242372b"
-SRC_URI[sha256sum] = "92f1b7b9d51b396679c17f35a2112423361b8da3c1b9de00aa94fd768ae296e6"
+SRC_URI[md5sum] = "a3d18213beec454e3cdec9a3116d6b05"
+SRC_URI[sha256sum] = "627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b0892f24e82d31d6c"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.20.1





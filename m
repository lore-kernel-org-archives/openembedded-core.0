Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA4C75537
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:42:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42039470"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 10:42:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EFE2D4B5CBE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:43 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 10:42:43 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 10:42:04 +0800
Message-ID: <20180710024207.6296-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: EFE2D4B5CBE6.A1E22
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] icu:61.1 -> 62.1
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
X-List-Received-Date: Tue, 10 Jul 2018 02:42:47 -0000
Content-Type: text/plain

Upgrade icu from 61.1 to 62.1.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-support/icu/{icu_61.1.bb => icu_62.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_61.1.bb => icu_62.1.bb} (80%)

diff --git a/meta/recipes-support/icu/icu_61.1.bb b/meta/recipes-support/icu/icu_62.1.bb
similarity index 80%
rename from meta/recipes-support/icu/icu_61.1.bb
rename to meta/recipes-support/icu/icu_62.1.bb
index ffaf350..ec9db7d 100644
--- a/meta/recipes-support/icu/icu_61.1.bb
+++ b/meta/recipes-support/icu/icu_62.1.bb
@@ -16,14 +16,13 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0001-i18n-Drop-include-xlocale.h.patch \
            "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "68fe38999fef94d622bd6843d43c0615"
-SRC_URI[sha256sum] = "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef"
+SRC_URI[md5sum] = "490ad9d920158e0314e10ba74ae9a150"
+SRC_URI[sha256sum] = "3dd9868d666350dda66a6e305eecde9d479fb70b30d5b55d78a1deffb97d5aa3"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.7.4





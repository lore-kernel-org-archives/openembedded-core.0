Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0B43C75470
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:42:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42039478"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 10:42:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C9304B5CBE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:42:44 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 10:42:43 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 10:42:05 +0800
Message-ID: <20180710024207.6296-5-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 7C9304B5CBE8.AE574
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] nss:3.37.1 -> 3.37.3
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
X-List-Received-Date: Tue, 10 Jul 2018 02:42:49 -0000
Content-Type: text/plain

Upgrade nss from 3.37.1 to 3.37.3

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-support/nss/{nss_3.37.1.bb => nss_3.37.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/nss/{nss_3.37.1.bb => nss_3.37.3.bb} (97%)

diff --git a/meta/recipes-support/nss/nss_3.37.1.bb b/meta/recipes-support/nss/nss_3.37.3.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.37.1.bb
rename to meta/recipes-support/nss/nss_3.37.3.bb
index 0e8b5be..a053659 100644
--- a/meta/recipes-support/nss/nss_3.37.1.bb
+++ b/meta/recipes-support/nss/nss_3.37.3.bb
@@ -25,11 +25,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
-           file://0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch \
            "
 
-SRC_URI[md5sum] = "e9526d7217d02afa96b90b89924c38df"
-SRC_URI[sha256sum] = "097b30e436479ad737b3703b25b6198b6513e202731085c6f097d8853dd20405"
+SRC_URI[md5sum] = "22e8ce40f80ce1e7d9d92ebd07124840"
+SRC_URI[sha256sum] = "9af2bbb615d010bd866bb83f8c0bb22b0fa086171e93030ffb03da3da15cc5be"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4





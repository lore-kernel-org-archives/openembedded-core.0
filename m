Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D2C8B6FF80
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 02:09:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13710124"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2016 10:09:12 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A78E46704AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 10:09:08 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 8 Dec 2016 10:09:08 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2016 02:09:13 -0800
Message-ID: <1481191753-53554-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 4A78E46704AB.A65D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] slang: 2.3.0 -> 2.3.1
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
X-List-Received-Date: Thu, 08 Dec 2016 02:09:15 -0000
Content-Type: text/plain

1)Upgrade slang from 2.3.0 to 2.3.1.
2)Delete one patch, since it is integrated upstream. 
 0001-Fix-error-conflicting-types-for-posix_close.patch


Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/slang/{slang_2.3.0.bb => slang_2.3.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/slang/{slang_2.3.0.bb => slang_2.3.1.bb} (90%)

diff --git a/meta/recipes-extended/slang/slang_2.3.0.bb b/meta/recipes-extended/slang/slang_2.3.1.bb
similarity index 90%
rename from meta/recipes-extended/slang/slang_2.3.0.bb
rename to meta/recipes-extended/slang/slang_2.3.1.bb
index d5967d2..7bf3af6 100644
--- a/meta/recipes-extended/slang/slang_2.3.0.bb
+++ b/meta/recipes-extended/slang/slang_2.3.1.bb
@@ -19,11 +19,11 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://rpathfix.patch \
            file://fix-check-pcre.patch \
            file://slang-fix-the-iconv-existence-checking.patch \
-           file://0001-Fix-error-conflicting-types-for-posix_close.patch \
            file://no-x.patch \
           "
-SRC_URI[md5sum] = "3bcc790460d52db1316c20395b7ac2f1"
-SRC_URI[sha256sum] = "f95224060f45e0d8212a5039b339afa5f1a94a1bb0298e796104e5b12e926129"
+
+SRC_URI[md5sum] = "bd46d1dc17a50c72004ad842829d7b1f"
+SRC_URI[sha256sum] = "a810d5da7b0c0c8c335393c6b4f12884be6fa7696d9ca9521ef21316a4e00f9d"
 
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
 PREMIRRORS_append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
-- 
2.7.4





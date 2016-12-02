Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 79D476022F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 03:04:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13530140"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2016 11:04:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7396440056FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 11:04:20 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 2 Dec 2016 11:04:20 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2016 03:03:57 -0800
Message-ID: <1480676637-3788-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 7396440056FC.A5726
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] diffutils: 3.4 -> 3.5
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
X-List-Received-Date: Fri, 02 Dec 2016 03:04:27 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade diffutils from 3.4 to 3.5.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch        | 0
 .../diffutils/{diffutils-3.4 => diffutils-3.5}/run-ptest              | 0
 .../recipes-extended/diffutils/{diffutils_3.4.bb => diffutils_3.5.bb} | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils-3.4 => diffutils-3.5}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-extended/diffutils/{diffutils-3.4 => diffutils-3.5}/run-ptest (100%)
 rename meta/recipes-extended/diffutils/{diffutils_3.4.bb => diffutils_3.5.bb} (87%)

diff --git a/meta/recipes-extended/diffutils/diffutils-3.4/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/diffutils/diffutils-3.5/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-extended/diffutils/diffutils-3.4/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-extended/diffutils/diffutils-3.5/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-extended/diffutils/diffutils-3.4/run-ptest b/meta/recipes-extended/diffutils/diffutils-3.5/run-ptest
similarity index 100%
rename from meta/recipes-extended/diffutils/diffutils-3.4/run-ptest
rename to meta/recipes-extended/diffutils/diffutils-3.5/run-ptest
diff --git a/meta/recipes-extended/diffutils/diffutils_3.4.bb b/meta/recipes-extended/diffutils/diffutils_3.5.bb
similarity index 87%
rename from meta/recipes-extended/diffutils/diffutils_3.4.bb
rename to meta/recipes-extended/diffutils/diffutils_3.5.bb
index cb7092b..673f5d4 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.4.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.5.bb
@@ -17,8 +17,8 @@ do_configure_prepend () {
 	done
 }
 
-SRC_URI[md5sum] = "df9ca465f30307cffd03da176a43a5d4"
-SRC_URI[sha256sum] = "db53c025f2ac3d217bcf753dad6dee7b410b33d0948495ff015aaf8b91189ce2"
+SRC_URI[md5sum] = "569354697ff1cfc9a9de3781361015fa"
+SRC_URI[sha256sum] = "dad398ccd5b9faca6b0ab219a036453f62a602a56203ac659b43e889bec35533"
 
 inherit ptest
 
-- 
2.7.4





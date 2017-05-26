Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2495A7823A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 02:04:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19323850"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 May 2017 10:04:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CC45247C6D2E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 10:04:15 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 26 May 2017 10:04:16 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 10:04:15 +0800
Message-ID: <1495764255-842-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: CC45247C6D2E.A853F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] pango: 1.40.3 -> 1.40.6
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
X-List-Received-Date: Fri, 26 May 2017 02:04:25 -0000
Content-Type: text/plain

Upgrade pango from 1.40.3 to 1.40.6.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/pango/{pango_1.40.3.bb => pango_1.40.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.40.3.bb => pango_1.40.6.bb} (92%)

diff --git a/meta/recipes-graphics/pango/pango_1.40.3.bb b/meta/recipes-graphics/pango/pango_1.40.6.bb
similarity index 92%
rename from meta/recipes-graphics/pango/pango_1.40.3.bb
rename to meta/recipes-graphics/pango/pango_1.40.6.bb
index e259a82..31c3d2a 100644
--- a/meta/recipes-graphics/pango/pango_1.40.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.6.bb
@@ -17,8 +17,8 @@ SRC_URI += "file://run-ptest \
             file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
-SRC_URI[archive.md5sum] = "17c26720f5a862a12f7e1745e2f1d966"
-SRC_URI[archive.sha256sum] = "abba8b5ce728520c3a0f1535eab19eac3c14aeef7faa5aded90017ceac2711d3"
+SRC_URI[archive.md5sum] = "507c6746fbf53fc9d48c577f1e265de3"
+SRC_URI[archive.sha256sum] = "ca152b7383a1e9f7fd74ae96023dc6770dc5043414793bfe768ff06b6759e573"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
 
-- 
2.7.4





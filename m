Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C3F5A77811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 11:19:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="33090668"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Dec 2017 19:19:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A9D7C48AE9FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 19:19:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 27 Dec 2017 19:19:44 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Dec 2017 19:19:48 +0800
Message-ID: <1514373588-2880-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: A9D7C48AE9FD.AB9B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] atk: 2.26.0 -> 2.27.1
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
X-List-Received-Date: Wed, 27 Dec 2017 11:19:45 -0000
Content-Type: text/plain

Upgrade atk from 2.26.0 to 2.27.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/atk/{atk_2.26.0.bb => atk_2.27.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.26.0.bb => atk_2.27.1.bb} (78%)

diff --git a/meta/recipes-support/atk/atk_2.26.0.bb b/meta/recipes-support/atk/atk_2.27.1.bb
similarity index 78%
rename from meta/recipes-support/atk/atk_2.26.0.bb
rename to meta/recipes-support/atk/atk_2.27.1.bb
index e014ba0..3ac40cc 100644
--- a/meta/recipes-support/atk/atk_2.26.0.bb
+++ b/meta/recipes-support/atk/atk_2.27.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "ee9c329784dead6e386e8b2e0d4d8d6f"
-SRC_URI[archive.sha256sum] = "eafe49d5c4546cb723ec98053290d7e0b8d85b3fdb123938213acb7bb4178827"
+SRC_URI[archive.md5sum] = "4242ba7d2808829e1bfd19f53974f8e9"
+SRC_URI[archive.sha256sum] = "673a953987b301ab1e24e7d11677b6e7ba3226411a168449ba946765b6d44297"
 
 BBCLASSEXTEND = "native"
 
-- 
2.7.4





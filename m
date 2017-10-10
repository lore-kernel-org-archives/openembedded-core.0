Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5071760107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:59:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,505,1500912000"; d="scan'208";a="28805780"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Oct 2017 20:59:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2F55F48029C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:59:30 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 10 Oct 2017 20:59:29 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Oct 2017 20:59:30 +0800
Message-ID: <1507640372-934-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 2F55F48029C1.A67DC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] atk: 2.24.0 -> 2.26.0
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
X-List-Received-Date: Tue, 10 Oct 2017 12:59:32 -0000
Content-Type: text/plain

Upgrade atk from 2.24.0 to 2.26.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/atk/{atk_2.24.0.bb => atk_2.26.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.24.0.bb => atk_2.26.0.bb} (79%)

diff --git a/meta/recipes-support/atk/atk_2.24.0.bb b/meta/recipes-support/atk/atk_2.26.0.bb
similarity index 79%
rename from meta/recipes-support/atk/atk_2.24.0.bb
rename to meta/recipes-support/atk/atk_2.26.0.bb
index d62319c..e616db9 100644
--- a/meta/recipes-support/atk/atk_2.24.0.bb
+++ b/meta/recipes-support/atk/atk_2.26.0.bb
@@ -12,8 +12,9 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "3747a80089dfa3c0bbcf21adfff9968b"
-SRC_URI[archive.sha256sum] = "bb2daa9a808c73a7a79d2983f333e0ba74be42fc51e3ba1faf2551a636487a49"
+SRC_URI[archive.md5sum] = "ee9c329784dead6e386e8b2e0d4d8d6f"
+SRC_URI[archive.sha256sum] = "eafe49d5c4546cb723ec98053290d7e0b8d85b3fdb123938213acb7bb4178827"
+
 
 BBCLASSEXTEND = "native"
 
-- 
2.7.4





Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DC25378917
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 07:45:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35026367"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2018 15:45:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BC336486A76D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 15:45:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 9 Jan 2018 15:45:26 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jan 2018 15:45:52 +0800
Message-ID: <1515483952-23282-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: BC336486A76D.A7283
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] bluez5: 5.47 -> 5.48
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
X-List-Received-Date: Tue, 09 Jan 2018 07:45:28 -0000
Content-Type: text/plain

Upgrade bluez5 form 5.47 to 5.48

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.47.bb => bluez5_5.48.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.47.bb => bluez5_5.48.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.47.bb b/meta/recipes-connectivity/bluez5/bluez5_5.48.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.47.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.48.bb
index 49666f2..84a6cd2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.47.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.48.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "783e15f65e70cdb8f721c659e140dd56"
-SRC_URI[sha256sum] = "cf75bf7cd5d564f21cc4a2bd01d5c39ce425397335fd47d9bbe43af0a58342c8"
+SRC_URI[md5sum] = "c9c853f3c90564cabec75ab35106c355"
+SRC_URI[sha256sum] = "b9a8723072ef66bae7ec301c774902ebcb444c9c5b149b5a199e60a1ba970e90"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.7.4





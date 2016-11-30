Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 532BE600BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 05:32:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13448494"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Nov 2016 13:32:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E8CFC47AC8D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:32:14 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 30 Nov 2016 13:32:13 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2016 05:31:58 -0800
Message-ID: <1480512718-10863-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: E8CFC47AC8D3.AA1F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] bluez5: 5.42 -> 5.43
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
X-List-Received-Date: Wed, 30 Nov 2016 05:32:19 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade bluez5 from 5.42 to 5.43.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.42.bb => bluez5_5.43.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.42.bb => bluez5_5.43.bb} (89%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.42.bb b/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
similarity index 89%
rename from meta/recipes-connectivity/bluez5/bluez5_5.42.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.43.bb
index e6ab9b6..e10b82d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.42.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "cc8c53133d5be0d6c126e00cf2529028"
-SRC_URI[sha256sum] = "4f166fed80fc017396d6f2b3cae5185520875ab456d1c74d6b4eaa4da0e16109"
+SRC_URI[md5sum] = "698def88df96840dfbb0858bb6d73350"
+SRC_URI[sha256sum] = "16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.7.4





Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 60D7177C72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 01:47:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18208847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Apr 2017 09:47:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AB4C647CE222
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 09:47:18 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 27 Apr 2017 09:47:18 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Apr 2017 09:46:54 +0800
Message-ID: <1493257614-12832-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: AB4C647CE222.A6394
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dbus-test: 1.10.14 -> 1.10.18
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
X-List-Received-Date: Thu, 27 Apr 2017 01:47:22 -0000
Content-Type: text/plain

Upgrade dbus-test from 1.10.14 to 1.10.18.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-core/dbus/{dbus-test_1.10.14.bb => dbus-test_1.10.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.14.bb => dbus-test_1.10.18.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.14.bb b/meta/recipes-core/dbus/dbus-test_1.10.18.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.10.14.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.18.bb
index 5394814..141baf2 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.14.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.18.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "3f7b013ce8f641cd4c897acda0ef3467"
-SRC_URI[sha256sum] = "23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083"
+SRC_URI[md5sum] = "1209c455598165a0c5263d4201894179"
+SRC_URI[sha256sum] = "6049ddd5f3f3e2618f615f1faeda0a115104423a7996b7aa73e2f36e38cc514a"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.7.4





Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B848771DBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 04:53:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13975465"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Dec 2016 12:53:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2582141B5F44
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 12:53:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 16 Dec 2016 12:53:19 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2016 12:51:44 +0800
Message-ID: <1481863904-51496-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 2582141B5F44.A2176
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dbus-glib 0.106 -> 0.108
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
X-List-Received-Date: Fri, 16 Dec 2016 04:53:30 -0000
Content-Type: text/plain

Upgrade dbus-glib from 0.106 to 0.108

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-core/dbus/dbus-glib_0.106.bb | 4 ----
 meta/recipes-core/dbus/dbus-glib_0.108.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.106.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.108.bb

diff --git a/meta/recipes-core/dbus/dbus-glib_0.106.bb b/meta/recipes-core/dbus/dbus-glib_0.106.bb
deleted file mode 100644
index 0ae848e..0000000
--- a/meta/recipes-core/dbus/dbus-glib_0.106.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dbus-glib.inc
-
-SRC_URI[md5sum] = "2eea0b7f52b49f600a07abfd8535d4e4"
-SRC_URI[sha256sum] = "b38952706dcf68bad9c302999ef0f420b8cf1a2428227123f0ac4764b689c046"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.108.bb b/meta/recipes-core/dbus/dbus-glib_0.108.bb
new file mode 100644
index 0000000..7a9a69e
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.108.bb
@@ -0,0 +1,4 @@
+require dbus-glib.inc
+
+SRC_URI[md5sum] = "a66a613705870752ca9786e0359aea97"
+SRC_URI[sha256sum] = "9f340c7e2352e9cdf113893ca77ca9075d9f8d5e81476bf2bf361099383c602c"
-- 
2.7.4





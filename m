Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB6760079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 01:18:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,278,1549900800"; d="scan'208";a="57874791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Mar 2019 09:18:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8582C4CD5D20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:18:36 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Mar 2019 09:18:36 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 09:19:12 +0800
Message-ID: <20190328011912.14287-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 8582C4CD5D20.A8BE8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] cups:upgrade 2.2.10 -> 2.2.11
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
X-List-Received-Date: Thu, 28 Mar 2019 01:18:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade from cups_2.2.10.bb to cups_2.2.11.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/cups/cups_2.2.10.bb | 6 ------
 meta/recipes-extended/cups/cups_2.2.11.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups_2.2.10.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.11.bb

diff --git a/meta/recipes-extended/cups/cups_2.2.10.bb b/meta/recipes-extended/cups/cups_2.2.10.bb
deleted file mode 100644
index 490c84e2f4..0000000000
--- a/meta/recipes-extended/cups/cups_2.2.10.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
-
-SRC_URI[md5sum] = "3d22d747403ec5dcd0b66d1332564816"
-SRC_URI[sha256sum] = "77c8b2b3bb7fe8b5fbfffc307f2c817b2d7ec67b657f261a1dd1c61ab81205bb"
diff --git a/meta/recipes-extended/cups/cups_2.2.11.bb b/meta/recipes-extended/cups/cups_2.2.11.bb
new file mode 100644
index 0000000000..aeb2e14e3b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.2.11.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
+
+SRC_URI[md5sum] = "7afbbcd2497e7d742583c492f6de40cd"
+SRC_URI[sha256sum] = "f58010813fd6903f690cdb0c0b91e4d1bc9e5b9570c28734229ba3ed2908b76c"
-- 
2.20.1





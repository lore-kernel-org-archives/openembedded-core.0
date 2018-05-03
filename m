Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 09EE76022F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 07:25:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39517232"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 May 2018 15:25:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5458C472400A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 15:25:05 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 3 May 2018 15:25:04 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 May 2018 15:24:55 +0800
Message-ID: <20180503072458.19458-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 5458C472400A.A9B2C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] cups:2.2.6->2.2.7
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
X-List-Received-Date: Thu, 03 May 2018 07:25:08 -0000
Content-Type: text/plain

Upgrade cups 2.2.6 to 2.2.7

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/cups/cups_2.2.6.bb | 6 ------
 meta/recipes-extended/cups/cups_2.2.7.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups_2.2.6.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.7.bb

diff --git a/meta/recipes-extended/cups/cups_2.2.6.bb b/meta/recipes-extended/cups/cups_2.2.6.bb
deleted file mode 100644
index 3aa934b..0000000
--- a/meta/recipes-extended/cups/cups_2.2.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
-
-SRC_URI[md5sum] = "e91c26d8d97b5a1630a962f530f02192"
-SRC_URI[sha256sum] = "40385778c2b3bdf55030d1c999734e22774c79e3425d91339ce677825620169b"
diff --git a/meta/recipes-extended/cups/cups_2.2.7.bb b/meta/recipes-extended/cups/cups_2.2.7.bb
new file mode 100644
index 0000000..8a363a8
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.2.7.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
+
+SRC_URI[md5sum] = "ac703bcde223dab6d205a5fff193f716"
+SRC_URI[sha256sum] = "3c4b637b737077565ccdfbd5f61785d03f49461ae736fcc2c0ffaf41d2c6ea6a"
-- 
2.7.4





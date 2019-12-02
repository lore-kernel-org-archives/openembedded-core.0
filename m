Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E25A37F35F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 09:03:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="79439445"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 17:03:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3AC1E4CE1A05
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:55:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 17:03:42 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Dec 2019 07:30:29 -0800
Message-ID: <1575300630-101677-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575300630-101677-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575300630-101677-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3AC1E4CE1A05.A7BC2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-pbr: upgrade 5.4.3 -> 5.4.4
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
X-List-Received-Date: Mon, 02 Dec 2019 09:03:41 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python3-pbr_5.4.3.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.4.4.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.4.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.3.bb b/meta/recipes-devtools/python/python3-pbr_5.4.3.bb
deleted file mode 100644
index e7835e7..0000000
--- a/meta/recipes-devtools/python/python3-pbr_5.4.3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[md5sum] = "477d2aa285ad97250a172b199f4060b7"
-SRC_URI[sha256sum] = "2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.4.bb b/meta/recipes-devtools/python/python3-pbr_5.4.4.bb
new file mode 100644
index 0000000..6f335ea
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.4.4.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "65cdc32e1a1ff56d481fc15aa8caf988"
+SRC_URI[sha256sum] = "139d2625547dbfa5fb0b81daebb39601c478c21956dc57e2e07b74450a8c506b"
-- 
2.7.4





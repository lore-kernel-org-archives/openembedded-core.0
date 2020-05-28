Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.6627.1590645691340199020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 23:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,442,1583164800"; 
   d="scan'208";a="93260326"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 May 2020 14:01:31 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B73C84BCC89E
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 14:01:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 May 2020 14:01:30 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>, Zheng Ruoqin
	<zhengrq.fnst@cn.fujitsu.com>
Subject: [OE-core] [PATCH] python3-six: upgrade 1.14.0 -> 1.15.0
Date: Thu, 28 May 2020 14:01:13 +0800
Message-ID: <1590645673-18173-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590645673-18173-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1590645673-18173-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B73C84BCC89E.A7108
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python3-six_1.14.0.bb | 5 -----
 meta/recipes-devtools/python/python3-six_1.15.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-six_1.14.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-six_1.15.0.bb

diff --git a/meta/recipes-devtools/python/python3-six_1.14.0.bb b/meta/recipes-devtools/python/python3-six_1.14.0.bb
deleted file mode 100644
index 151c366caa..0000000000
--- a/meta/recipes-devtools/python/python3-six_1.14.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-six.inc
-
-SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
-SRC_URI[sha256sum] = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
diff --git a/meta/recipes-devtools/python/python3-six_1.15.0.bb b/meta/recipes-devtools/python/python3-six_1.15.0.bb
new file mode 100644
index 0000000000..6c6f3f9629
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-six_1.15.0.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-six.inc
+
+SRC_URI[md5sum] = "9f90a0eaa0ea7747fda01ca79d21ebcb"
+SRC_URI[sha256sum] = "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
-- 
2.17.1




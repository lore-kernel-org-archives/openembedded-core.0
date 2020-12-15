Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.7698.1608017061518822027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 23:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408391"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:23:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F2CE4CE546D
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 15:23:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:23:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] readline: upgrade 8.0 -> 8.1
Date: Tue, 15 Dec 2020 15:23:44 +0800
Message-ID: <1608017024-21664-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 0F2CE4CE546D.A7277
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{readline-8.0 => readline-8.1}/configure-fix.patch     | 0
 .../readline/{readline-8.0 => readline-8.1}/norpath.patch  | 0
 .../readline/{readline-8.0 => readline-8.1}/rl-native.map  | 0
 meta/recipes-core/readline/readline_8.0.bb                 | 7 -------
 meta/recipes-core/readline/readline_8.1.bb                 | 7 +++++++
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/readline/{readline-8.0 => readline-8.1}/configure-fix.patch (100%)
 rename meta/recipes-core/readline/{readline-8.0 => readline-8.1}/norpath.patch (100%)
 rename meta/recipes-core/readline/{readline-8.0 => readline-8.1}/rl-native.map (100%)
 delete mode 100644 meta/recipes-core/readline/readline_8.0.bb
 create mode 100644 meta/recipes-core/readline/readline_8.1.bb

diff --git a/meta/recipes-core/readline/readline-8.0/configure-fix.patch b/meta/recipes-core/readline/readline-8.1/configure-fix.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-8.0/configure-fix.patch
rename to meta/recipes-core/readline/readline-8.1/configure-fix.patch
diff --git a/meta/recipes-core/readline/readline-8.0/norpath.patch b/meta/recipes-core/readline/readline-8.1/norpath.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-8.0/norpath.patch
rename to meta/recipes-core/readline/readline-8.1/norpath.patch
diff --git a/meta/recipes-core/readline/readline-8.0/rl-native.map b/meta/recipes-core/readline/readline-8.1/rl-native.map
similarity index 100%
rename from meta/recipes-core/readline/readline-8.0/rl-native.map
rename to meta/recipes-core/readline/readline-8.1/rl-native.map
diff --git a/meta/recipes-core/readline/readline_8.0.bb b/meta/recipes-core/readline/readline_8.0.bb
deleted file mode 100644
index 99d022a32f..0000000000
--- a/meta/recipes-core/readline/readline_8.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require readline.inc
-
-SRC_URI += "file://configure-fix.patch \
-            file://norpath.patch"
-
-SRC_URI[archive.md5sum] = "7e6c1f16aee3244a69aba6e438295ca3"
-SRC_URI[archive.sha256sum] = "e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461"
diff --git a/meta/recipes-core/readline/readline_8.1.bb b/meta/recipes-core/readline/readline_8.1.bb
new file mode 100644
index 0000000000..0786a08163
--- /dev/null
+++ b/meta/recipes-core/readline/readline_8.1.bb
@@ -0,0 +1,7 @@
+require readline.inc
+
+SRC_URI += "file://configure-fix.patch \
+            file://norpath.patch"
+
+SRC_URI[archive.md5sum] = "e9557dd5b1409f5d7b37ef717c64518e"
+SRC_URI[archive.sha256sum] = "f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02"
-- 
2.25.1




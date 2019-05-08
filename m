Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id ADC6C7D723
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 08:23:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,445,1549900800"; d="scan'208";a="62102623"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 May 2019 16:23:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A7EA44CDBCBB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 16:23:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 8 May 2019 16:23:45 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1555566787-2818-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: A7EA44CDBCBB.A11BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] icu: Added armeb support.
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
Date: Wed, 08 May 2019 08:23:41 -0000
X-Original-Date: Thu, 18 Apr 2019 13:53:07 +0800
X-List-Received-Date: Wed, 08 May 2019 08:23:41 -0000
Content-Type: text/plain

Make icu support arm32 BE.

Upstream-Status: Pending

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../icu/icu/0001-icu-Added-armeb-support.patch     | 30 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_64.2.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch

diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
new file mode 100644
index 0000000..299689d
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -0,0 +1,30 @@
+From 500321387ceca48934bb0f323779117cd518bab6 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 8 May 2019 14:42:30 +0900
+Subject: [PATCH] icu: Added armeb support.
+
+Make icu support arm32 BE.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ i18n/double-conversion-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+index 1e44fca..e4f2a8b 100644
+--- a/i18n/double-conversion-utils.h
++++ b/i18n/double-conversion-utils.h
+@@ -92,7 +92,7 @@ int main(int argc, char** argv) {
+ //
+ // If it prints "correct" then the architecture should be here, in the "correct" section.
+ #if defined(_M_X64) || defined(__x86_64__) || \
+-    defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
++    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
+     defined(__hppa__) || defined(__ia64__) || \
+     defined(__mips__) || \
+     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/icu/icu_64.2.bb
index bbc76d6..10bac7a 100644
--- a/meta/recipes-support/icu/icu_64.2.bb
+++ b/meta/recipes-support/icu/icu_64.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
            file://0001-Fix-big-endian-build.patch \
+           file://0001-icu-Added-armeb-support.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.7.4





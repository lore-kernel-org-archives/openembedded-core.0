Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 56D1676077
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:53:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41291320"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2018 15:53:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8BF774B41ECF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 15:53:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 20 Jun 2018 15:53:24 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jun 2018 15:23:35 -0700
Message-ID: <1528669415-33160-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 8BF774B41ECF.AF080
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nss: Fix build error for aarch64be.
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
X-List-Received-Date: Wed, 20 Jun 2018 07:53:28 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-support/nss/nss_3.35.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/nss/nss_3.35.bb b/meta/recipes-support/nss/nss_3.35.bb
index 84f1916..21da7ec 100644
--- a/meta/recipes-support/nss/nss_3.35.bb
+++ b/meta/recipes-support/nss/nss_3.35.bb
@@ -91,6 +91,8 @@ do_compile() {
         OS_TEST=ppc64
     elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
         OS_TEST=mips
+    elif [ "${TARGET_ARCH}" = "aarch64_be" ]; then
+        OS_TEST="aarch64"
     else
         OS_TEST="${TARGET_ARCH}"
     fi
@@ -146,6 +148,9 @@ do_install() {
         OS_TEST=ppc64
     elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
         OS_TEST=mips
+    elif [ "${TARGET_ARCH}" = "aarch64_be" ]; then
+        CPU_ARCH=aarch64
+        OS_TEST="aarch64"
     else
         OS_TEST="${TARGET_ARCH}"
     fi
-- 
1.9.1





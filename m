Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7276160F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 03:01:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,466,1574092800"; d="scan'208";a="83668236"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 11:01:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2C50B49DF12A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 10:51:56 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 11:01:35 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 11:01:37 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2020 02:09:40 -0800
Message-ID: <1582279780-21243-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582279780-21243-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582279780-21243-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2C50B49DF12A.A1AEE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nss: upgrade 3.49.1 -> 3.50
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
X-List-Received-Date: Fri, 21 Feb 2020 03:01:35 -0000
Content-Type: text/plain

refresh the following patch:
0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch | 4 ++--
 meta/recipes-support/nss/{nss_3.49.1.bb => nss_3.50.bb}       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/nss/{nss_3.49.1.bb => nss_3.50.bb} (98%)

diff --git a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 803c06b218..c380c14491 100644
--- a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -42,8 +42,8 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  /* old gcc doesn't support some poly64x2_t intrinsic */
  #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
      (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
-@@ -28,6 +29,7 @@
-  * that compiler uses -mfpu=neon only. */
+@@ -25,6 +26,7 @@
+ /* We don't test on big endian platform, so disable this on big endian. */
  #define USE_ARM_GCM
  #endif
 +#endif
diff --git a/meta/recipes-support/nss/nss_3.49.1.bb b/meta/recipes-support/nss/nss_3.50.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.49.1.bb
rename to meta/recipes-support/nss/nss_3.50.bb
index b16ade9f62..e9855d7a7e 100644
--- a/meta/recipes-support/nss/nss_3.49.1.bb
+++ b/meta/recipes-support/nss/nss_3.50.bb
@@ -34,8 +34,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
 
-SRC_URI[md5sum] = "6b92ac02dcf9e9e44df5390f6814c157"
-SRC_URI[sha256sum] = "d9aa42e49e02bb0dc0a2f164604cfc718e11a2a06ddb266cd676376ac21b026e"
+SRC_URI[md5sum] = "e0366615e12b147cebc136c915baea37"
+SRC_URI[sha256sum] = "185df319775243f5f5daa9d49b7f9cc5f2b389435be3247c3376579bee063ba7"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.17.1





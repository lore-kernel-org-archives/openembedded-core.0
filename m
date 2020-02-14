Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A98F4610AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:12:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,440,1574092800"; d="scan'208";a="83307851"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2020 00:12:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A3B650A996F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:02:36 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 15 Feb 2020 00:12:09 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 15 Feb 2020 00:12:12 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2020 15:44:27 -0800
Message-ID: <1581723869-21232-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4A3B650A996F.A37AF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] icu: upgrade 64.2 -> 65.1
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
X-List-Received-Date: Fri, 14 Feb 2020 16:12:13 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/icu/{icu_64.2.bb => icu_65.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/icu/{icu_64.2.bb => icu_65.1.bb} (88%)

diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/icu/icu_65.1.bb
similarity index 88%
rename from meta/recipes-support/icu/icu_64.2.bb
rename to meta/recipes-support/icu/icu_65.1.bb
index 44caa43..bd932d7 100644
--- a/meta/recipes-support/icu/icu_64.2.bb
+++ b/meta/recipes-support/icu/icu_65.1.bb
@@ -28,8 +28,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "a3d18213beec454e3cdec9a3116d6b05"
-SRC_URI[sha256sum] = "627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b0892f24e82d31d6c"
+SRC_URI[md5sum] = "d1ff436e26cabcb28e6cb383d32d1339"
+SRC_URI[sha256sum] = "53e37466b3d6d6d01ead029e3567d873a43a5d1c668ed2278e253b683136d948"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.7.4





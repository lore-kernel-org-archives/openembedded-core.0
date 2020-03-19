Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDA860B9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 02:16:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,569,1574092800"; d="scan'208";a="86569447"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Mar 2020 10:16:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EE1A650A9986
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:06:02 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Thu, 19 Mar 2020 10:16:05 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Mar 2020 10:16:14 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2020 00:41:45 -0700
Message-ID: <1584603707-43423-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: EE1A650A9986.A5261
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] icu: upgrade 65.1 ->66.1
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
X-List-Received-Date: Thu, 19 Mar 2020 02:16:09 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/icu/{icu_65.1.bb => icu_66.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_65.1.bb => icu_66.1.bb} (82%)

diff --git a/meta/recipes-support/icu/icu_65.1.bb b/meta/recipes-support/icu/icu_66.1.bb
similarity index 82%
rename from meta/recipes-support/icu/icu_65.1.bb
rename to meta/recipes-support/icu/icu_66.1.bb
index bd932d7db4..5018464c14 100644
--- a/meta/recipes-support/icu/icu_65.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=8bc5d32052a96f214cbdd1e53dfc935d"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -28,8 +28,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "d1ff436e26cabcb28e6cb383d32d1339"
-SRC_URI[sha256sum] = "53e37466b3d6d6d01ead029e3567d873a43a5d1c668ed2278e253b683136d948"
+SRC_URI[md5sum] = "b33dc6766711517c98d318447e5110f8"
+SRC_URI[sha256sum] = "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.17.1





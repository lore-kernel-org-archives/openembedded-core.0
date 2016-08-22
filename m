Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B78F1758DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 05:47:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10138688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2016 13:47:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B2B33430CD01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:47:18 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 22 Aug 2016 13:47:21 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 13:46:01 +0800
Message-ID: <1471844761-24896-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: B2B33430CD01.AE4A6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libidn: 1.32 -> 1.33
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
X-List-Received-Date: Mon, 22 Aug 2016 05:47:20 -0000
Content-Type: text/plain

1)Upgrade libidn from 1.32 to 1.33.
2)Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the LICENSE has not been changed

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/libidn/{libidn_1.32.bb => libidn_1.33.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.32.bb => libidn_1.33.bb} (82%)

diff --git a/meta/recipes-extended/libidn/libidn_1.32.bb b/meta/recipes-extended/libidn/libidn_1.33.bb
similarity index 82%
rename from meta/recipes-extended/libidn/libidn_1.32.bb
rename to meta/recipes-extended/libidn/libidn_1.33.bb
index a233815..26cabd6 100644
--- a/meta/recipes-extended/libidn/libidn_1.32.bb
+++ b/meta/recipes-extended/libidn/libidn_1.33.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=df4be47940a91ee69556f5f71eed4aec \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://lib/idna.h;endline=21;md5=7c0b3828d1b153663be9a04ad4f7975f \
-                    file://src/idn.c;endline=20;md5=f4235f2a2cb2b65786b2979fb3cf7fbf"
+                    file://lib/idna.h;endline=21;md5=37cffad24807f446a24de3e7371f20b9 \
+                    file://src/idn.c;endline=20;md5=09e97034a8877b3451cb65065fc2c06e"
 DEPENDS = "virtual/libiconv"
 
 inherit pkgconfig autotools gettext texinfo
@@ -21,8 +21,8 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://0001-idn-fix-printf-format-security-warnings.patch \
 "
 
-SRC_URI[md5sum] = "4dd8356ba577287ea7076bfa1554b534"
-SRC_URI[sha256sum] = "ba5d5afee2beff703a34ee094668da5c6ea5afa38784cebba8924105e185c4f5"
+SRC_URI[md5sum] = "a9aa7e003665de9c82bd3f9fc6ccf308"
+SRC_URI[sha256sum] = "44a7aab635bb721ceef6beecc4d49dfd19478325e1b47f3196f7d2acc4930e19"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
2.7.4





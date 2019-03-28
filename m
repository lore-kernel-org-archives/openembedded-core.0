Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 49F286C149
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 02:14:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,278,1549900800"; d="scan'208";a="57880327"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Mar 2019 10:14:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 955A74CD5D20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 10:14:51 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Mar 2019 10:14:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 10:15:27 +0800
Message-ID: <20190328021527.4638-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 955A74CD5D20.A7740
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] freetype:upgrade 2.9.1 -> 2.10.0
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
X-List-Received-Date: Thu, 28 Mar 2019 02:14:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade from freetype_2.9.1.bb to freetype_2.10.0.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../freetype/{freetype_2.9.1.bb => freetype_2.10.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.9.1.bb => freetype_2.10.0.bb} (93%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.9.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.0.bb
similarity index 93%
rename from meta/recipes-graphics/freetype/freetype_2.9.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.10.0.bb
index 1e6f66ee9f..200f43c21b 100644
--- a/meta/recipes-graphics/freetype/freetype_2.9.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "60ef7d8160cd4bf8cb118ee9d65367ca"
-SRC_URI[sha256sum] = "db8d87ea720ea9d5edc5388fc7a0497bb11ba9fe972245e0f7f4c7e8b1e1e84d"
+SRC_URI[md5sum] = "a717e6925b61b9dda946322ecd278a42"
+SRC_URI[sha256sum] = "fccc62928c65192fff6c98847233b28eb7ce05f12d2fea3f6cc90e8b4e5fbe06"
 
 inherit autotools pkgconfig multilib_header
 
-- 
2.20.1





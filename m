Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 766A5610BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 02:01:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,558,1574092800"; d="scan'208";a="86367483"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Mar 2020 10:01:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 21D3A50A9960
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 09:51:27 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Mon, 16 Mar 2020 10:01:29 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Mar 2020 10:01:36 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Mar 2020 00:39:34 -0700
Message-ID: <1584344377-112331-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 21D3A50A9960.A19C2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libical: upgrade 3.0.7 -> 3.0.8
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
X-List-Received-Date: Mon, 16 Mar 2020 02:01:39 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libical/{libical_3.0.7.bb => libical_3.0.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.7.bb => libical_3.0.8.bb} (93%)

diff --git a/meta/recipes-support/libical/libical_3.0.7.bb b/meta/recipes-support/libical/libical_3.0.8.bb
similarity index 93%
rename from meta/recipes-support/libical/libical_3.0.7.bb
rename to meta/recipes-support/libical/libical_3.0.8.bb
index a50473e9ec..efb9433412 100644
--- a/meta/recipes-support/libical/libical_3.0.7.bb
+++ b/meta/recipes-support/libical/libical_3.0.8.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-Use-our-hand-build-native-src-generator.patch \
 "
-SRC_URI[md5sum] = "8a5d07a7fba9e73a85e67f76258bf042"
-SRC_URI[sha256sum] = "0abe66df1ea826e57db7f281c704ede834c84139012e6c686ea7adafd4e763fc"
+SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
+SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.17.1





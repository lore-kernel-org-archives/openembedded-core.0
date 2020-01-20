Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BA5D27FCB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:02:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302839"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:02:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 85A944CE280C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:53:37 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:02:44 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:02:52 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:50 -0800
Message-ID: <1579523214-47426-8-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 85A944CE280C.A2633
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libjpeg-turbo: upgrade 2.0.3 -> 2.0.4
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
X-List-Received-Date: Mon, 20 Jan 2020 09:02:51 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_2.0.3.bb => libjpeg-turbo_2.0.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.3.bb => libjpeg-turbo_2.0.4.bb} (95%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
similarity index 95%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 32d3bd93b1..1f49fd3d3b 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[md5sum] = "bd07fddf26f9def7bab02739eb655116"
-SRC_URI[sha256sum] = "4246de500544d4ee408ee57048aa4aadc6f165fc17f141da87669f20ed3241b7"
+SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
+SRC_URI[sha256sum] = "33dd8547efd5543639e890efbf2ef52d5a21df81faf41bb940657af916a23406"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.17.1





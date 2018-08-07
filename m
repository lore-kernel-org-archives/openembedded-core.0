Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4606578998
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 09:32:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="43166953"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2018 17:32:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1607D4B41EE4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 17:32:23 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 7 Aug 2018 17:32:24 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Aug 2018 17:31:44 +0800
Message-ID: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 1607D4B41EE4.AEA81
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] npth:1.5 -> 1.6
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
X-List-Received-Date: Tue, 07 Aug 2018 09:32:33 -0000
Content-Type: text/plain

Upgrade npth from 1.5 to 1.6

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-support/npth/{npth_1.5.bb => npth_1.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/npth/{npth_1.5.bb => npth_1.6.bb} (81%)

diff --git a/meta/recipes-support/npth/npth_1.5.bb b/meta/recipes-support/npth/npth_1.6.bb
similarity index 81%
rename from meta/recipes-support/npth/npth_1.5.bb
rename to meta/recipes-support/npth/npth_1.6.bb
index 8f42a1a..8310efb 100644
--- a/meta/recipes-support/npth/npth_1.5.bb
+++ b/meta/recipes-support/npth/npth_1.6.bb
@@ -10,8 +10,8 @@ SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
           "
 
-SRC_URI[md5sum] = "9ba2dc4302d2f32c66737c43ed191b1b"
-SRC_URI[sha256sum] = "294a690c1f537b92ed829d867bee537e46be93fbd60b16c04630fbbfcd9db3c2"
+SRC_URI[md5sum] = "375d1a15ad969f32d25f1a7630929854"
+SRC_URI[sha256sum] = "1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1"
 
 BINCONFIG = "${bindir}/npth-config"
 
-- 
2.7.4





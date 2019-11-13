Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C5DBE7F02F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 03:23:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78385822"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 11:23:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 89B2D4CE1646
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 11:14:49 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 13 Nov 2019 11:22:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2019 11:23:31 +0800
Message-ID: <20191113032331.10385-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 89B2D4CE1646.AA004
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libcheck:upgrade 0.12.0 -> 0.13.0
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
X-List-Received-Date: Wed, 13 Nov 2019 03:23:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libcheck/{libcheck_0.12.0.bb => libcheck_0.13.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.12.0.bb => libcheck_0.13.0.bb} (83%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb b/meta/recipes-support/libcheck/libcheck_0.13.0.bb
similarity index 83%
rename from meta/recipes-support/libcheck/libcheck_0.12.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.13.0.bb
index 25ac2c4b26..226417f991 100644
--- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.13.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
            file://not-echo-compiler-info-to-check_stdint.h.patch"
-SRC_URI[md5sum] = "31b17c6075820a434119592941186f70"
-SRC_URI[sha256sum] = "464201098bee00e90f5c4bdfa94a5d3ead8d641f9025b560a27755a83b824234"
+SRC_URI[md5sum] = "2c730c40b08482eaeb10132517970593"
+SRC_URI[sha256sum] = "c4336b31447acc7e3266854f73ec188cdb15554d0edd44739631da174a569909"
 UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
-- 
2.20.1





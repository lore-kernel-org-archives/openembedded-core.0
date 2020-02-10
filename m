Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E8A1360FB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:50:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,424,1574092800"; d="scan'208";a="83096260"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Feb 2020 17:50:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DD807406AB15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:40:40 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 10 Feb 2020 17:50:12 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 10 Feb 2020 17:50:14 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2020 09:38:04 -0800
Message-ID: <1581356285-65315-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DD807406AB15.A1A7D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libcheck: upgrade 0.13.0 -> 0.14.0
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
X-List-Received-Date: Mon, 10 Feb 2020 09:50:11 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libcheck/{libcheck_0.13.0.bb => libcheck_0.14.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.13.0.bb => libcheck_0.14.0.bb} (83%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.13.0.bb b/meta/recipes-support/libcheck/libcheck_0.14.0.bb
similarity index 83%
rename from meta/recipes-support/libcheck/libcheck_0.13.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.14.0.bb
index 226417f991..a88f009cdb 100644
--- a/meta/recipes-support/libcheck/libcheck_0.13.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.14.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
            file://not-echo-compiler-info-to-check_stdint.h.patch"
-SRC_URI[md5sum] = "2c730c40b08482eaeb10132517970593"
-SRC_URI[sha256sum] = "c4336b31447acc7e3266854f73ec188cdb15554d0edd44739631da174a569909"
+SRC_URI[md5sum] = "270e82a445be6026040267a5e11cc94b"
+SRC_URI[sha256sum] = "bd0f0ca1be65b70238b32f8e9fe5d36dc2fbf7a759b7edf28e75323a7d74f30b"
 UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
-- 
2.17.1





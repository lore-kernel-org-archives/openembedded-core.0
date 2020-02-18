Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 39CE361580
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:21:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83480842"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 14:21:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B341E406AB15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:11:31 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 14:21:07 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Feb 2020 14:21:14 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 05:39:56 -0800
Message-ID: <1582033197-93331-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582033197-93331-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582033197-93331-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B341E406AB15.A0D27
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libcap: upgrade 2.31 -> 2.32
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
X-List-Received-Date: Tue, 18 Feb 2020 06:21:12 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/libcap/{libcap_2.31.bb => libcap_2.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.31.bb => libcap_2.32.bb} (93%)

diff --git a/meta/recipes-support/libcap/libcap_2.31.bb b/meta/recipes-support/libcap/libcap_2.32.bb
similarity index 93%
rename from meta/recipes-support/libcap/libcap_2.31.bb
rename to meta/recipes-support/libcap/libcap_2.32.bb
index 97959c1025..d78a58f7d2 100644
--- a/meta/recipes-support/libcap/libcap_2.31.bb
+++ b/meta/recipes-support/libcap/libcap_2.32.bb
@@ -12,8 +12,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[md5sum] = "52120c05dc797b01f5a7ae70f4335e96"
-SRC_URI[sha256sum] = "c6088de41e1c97fa8047e2e7de0e4ee0cd13e6cc16538022230ae76727a87c46"
+SRC_URI[md5sum] = "7416119c9fdcfd0e8dd190a432c668e9"
+SRC_URI[sha256sum] = "1005e3d227f2340ad1e3360ef8b69d15e3c72a29c09f4894d7aac038bd26e2be"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.17.1





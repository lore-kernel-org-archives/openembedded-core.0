Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD1760720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 01:44:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78817465"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 09:44:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9BF584CE14FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:36:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 21 Nov 2019 09:44:43 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2019 00:55:35 -0800
Message-ID: <1574326536-1600-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9BF584CE14FF.A935A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] busybox:upgrade 1.31.0 -> 1.31.1
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
X-List-Received-Date: Thu, 21 Nov 2019 01:44:44 -0000
Content-Type: text/plain

---
 meta/recipes-core/busybox/{busybox_1.31.0.bb => busybox_1.31.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/busybox/{busybox_1.31.0.bb => busybox_1.31.1.bb} (92%)

diff --git a/meta/recipes-core/busybox/busybox_1.31.0.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
similarity index 92%
rename from meta/recipes-core/busybox/busybox_1.31.0.bb
rename to meta/recipes-core/busybox/busybox_1.31.1.bb
index 34b1f2c..11e3aed 100644
--- a/meta/recipes-core/busybox/busybox_1.31.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -45,5 +45,5 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "cdba5d4458f944ceec5cdcf7c4914b69"
-SRC_URI[tarball.sha256sum] = "0e4925392fd9f3743cc517e031b68b012b24a63b0cf6c1ff03cce7bb3846cc99"
+SRC_URI[tarball.md5sum] = "70913edaf2263a157393af07565c17f0"
+SRC_URI[tarball.sha256sum] = "d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998"
-- 
2.7.4





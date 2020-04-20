Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1500.1587367791691211755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 00:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,405,1580745600"; 
   d="scan'208";a="89266253"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Apr 2020 15:29:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EE69E46B5FAA
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 15:19:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Apr 2020 15:29:38 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ell: upgrade 0.30 -> 0.31
Date: Tue, 21 Apr 2020 00:13:24 +0800
Message-ID: <1587399204-92744-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: EE69E46B5FAA.A9CB1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.30.bb b/meta/recipes-core/ell/ell_0.31.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.30.bb
rename to meta/recipes-core/ell/ell_0.31.bb
index 17045b3ae5..1db7131ab0 100644
--- a/meta/recipes-core/ell/ell_0.30.bb
+++ b/meta/recipes-core/ell/ell_0.31.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "79c757858688cc6c36087605234d87a8"
-SRC_URI[sha256sum] = "51cf8cc66a9d1038e41f7d619ea5660aa4476904496562b2d45ca79370ca4a5e"
+SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
+SRC_URI[sha256sum] = "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1




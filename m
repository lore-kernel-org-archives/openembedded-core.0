Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.29801.1612156142892101156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 21:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,391,1602518400"; 
   d="scan'208";a="104040211"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Feb 2021 13:09:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 24E034CE4B3E
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Feb 2021 13:08:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 1 Feb 2021 13:08:57 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] mc: upgrade 4.8.25 -> 4.8.26
Date: Mon, 1 Feb 2021 13:08:46 +0800
Message-ID: <1612156126-77401-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 24E034CE4B3E.A50D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mc/{mc_4.8.25.bb => mc_4.8.26.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/mc/{mc_4.8.25.bb => mc_4.8.26.bb} (94%)

diff --git a/meta/recipes-extended/mc/mc_4.8.25.bb b/meta/recipes-extended/mc/mc_4.8.26.bb
similarity index 94%
rename from meta/recipes-extended/mc/mc_4.8.25.bb
rename to meta/recipes-extended/mc/mc_4.8.26.bb
index 83c8a6ecf6..24e81170f4 100644
--- a/meta/recipes-extended/mc/mc_4.8.25.bb
+++ b/meta/recipes-extended/mc/mc_4.8.26.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "407dc20f70082f26c7f5716406cb755cbb6cba3f2f13b841b79a991282d310c2"
+SRC_URI[sha256sum] = "9d6358d0a351a455a1410aab57f33b6b48b0fcf31344b9a10b0ff497595979d1"
 
 inherit autotools gettext pkgconfig
 
@@ -29,6 +29,8 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
 CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
 CACHED_CONFIGUREVARS += "mc_cv_have_zipinfo=yes"
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
         
-- 
2.25.1




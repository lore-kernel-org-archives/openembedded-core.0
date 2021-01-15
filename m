Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3061.1610673041426093656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 17:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,347,1602518400"; 
   d="scan'208";a="103497836"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jan 2021 09:10:28 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 43B144CE6036
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 09:10:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 15 Jan 2021 09:10:23 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libarchive: upgrade 3.4.3 -> 3.5.1
Date: Fri, 15 Jan 2021 09:10:05 +0800
Message-ID: <1610673005-26708-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 43B144CE6036.A4391
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

copyright: add libarchive/archive_entry.c

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libarchive/{libarchive_3.4.3.bb => libarchive_3.5.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.4.3.bb => libarchive_3.5.1.bb} (93%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.3.bb b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
similarity index 93%
rename from meta/recipes-extended/libarchive/libarchive_3.4.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.1.bb
index dbfc067b93..1387b69066 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fe01f5e02b1f0cc934d593a7b0ddceb6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ee1e749213c108cb60d53147f18c31a73d6717d7e3d2481c157e1b34c881ea39"
+SRC_URI[sha256sum] = "9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.25.1




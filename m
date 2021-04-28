Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9045.1619600454086615687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 02:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AbB6mPqzwB89mSc2k7+9eKrPwzL1zdoIgy1kn?=
 =?us-ascii?q?xilNYDZSddGVkN3roeQD2XbP+VIscVwDufTFAqmPRnvA6YV4iLN9AZ6OVBTr0V?=
 =?us-ascii?q?HHEKhM4YfuyDXrGWnf24dmv5tIXLN5DLTLbGRSqebfzE2GH807wN+BmZrY4Nv2?=
 =?us-ascii?q?63t2VwllZ+VBwm5Ce2WmO3Z7TgVHGpY1faD0jqV6jgC9cncaZNnTPAhmY8H/ob?=
 =?us-ascii?q?Tw9K7OUFovAh4LzE20hyq01biSKXOl9yZbfzRR4bpKywT4rzA=3D?=
X-IronPort-AV: E=Sophos;i="5.82,257,1613404800"; 
   d="scan'208";a="107668919"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Apr 2021 17:00:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C9F44D0B8AA
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 17:00:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 17:00:51 +0800
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-networking: upgrade 2.66.0 -> 2.68.1
Date: Wed, 28 Apr 2021 16:59:30 +0800
Message-ID: <1619600372-22241-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619600372-22241-1-git-send-email-wangmy@fujitsu.com>
References: <1619600372-22241-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1C9F44D0B8AA.A7502
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{glib-networking_2.66.0.bb => glib-networking_2.68.1.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.66.0.bb => glib-networking_2.68.1.bb} (91%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb
similarity index 91%
rename from meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.68.1.bb
index 786de744cb..fac04087d1 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099"
+SRC_URI[archive.sha256sum] = "d05d8bd124a9f53fc2b93b18f2386d512e4f48bc5a80470a7967224f3bf53b30"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
@@ -33,4 +33,6 @@ FILES_${PN} += "\
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
 
+RDEPENDS_${PN}-ptest += "bash"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1




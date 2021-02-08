Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.33993.1612785440222518165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 03:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,161,1610380800"; 
   d="scan'208";a="104329838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Feb 2021 19:57:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DACD74CE6F84
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Feb 2021 19:57:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Feb 2021 19:57:13 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] bind: upgrade 9.16.10 -> 9.16.11
Date: Mon, 8 Feb 2021 19:57:01 +0800
Message-ID: <1612785421-42876-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612785421-42876-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1612785421-42876-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: DACD74CE6F84.A66A8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

rename directory of patches
-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.16.10 => bind-9.16.11}/bind9                 | 0
 .../bind/{bind-9.16.10 => bind-9.16.11}/conf.patch            | 0
 .../bind/{bind-9.16.10 => bind-9.16.11}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.16.10 => bind-9.16.11}/named.service         | 0
 .../bind/{bind_9.16.10.bb => bind_9.16.11.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.10 => bind-9.16.11}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.10.bb => bind_9.16.11.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/bind9 b/meta/recipes-connectivity/bind/bind-9.16.11/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.11/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.10/named.service b/meta/recipes-connectivity/bind/bind-9.16.11/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.10/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.11/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.10.bb b/meta/recipes-connectivity/bind/bind_9.16.11.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.16.10.bb
rename to meta/recipes-connectivity/bind/bind_9.16.11.bb
index 71194a61bf..3b76a1f5cd 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.10.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.isc.org/bind/"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4673dc07337cace3b93c65e9ffe57b60"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ef10b4de6371115dcecdc38ca2af4561"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -19,7 +19,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bc47fc019c6205e6a6bfb839c544a1472321df0537ba905b846a4cbffe3362b3"
+SRC_URI[sha256sum] = "0111f64dd7d8f515cfa129e181cce96ff82070d1b27f11a21f6856110d0699c1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.25.1




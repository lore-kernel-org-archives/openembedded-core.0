Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1040.1601011682711101681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 22:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,300,1596470400"; 
   d="scan'208";a="99602434"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Sep 2020 13:27:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 86AB848990DF
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 13:27:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Sep 2020 13:27:52 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] bind:upgrade 9.16.5 -> 9.16.7
Date: Sat, 26 Sep 2020 01:27:57 +0800
Message-ID: <1601054877-37253-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 86AB848990DF.A1374
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.5 => bind-9.16.7}/bind9                     | 0
 .../bind/{bind-9.16.5 => bind-9.16.7}/conf.patch                | 0
 .../bind/{bind-9.16.5 => bind-9.16.7}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.5 => bind-9.16.7}/named.service             | 0
 .../bind/{bind_9.16.5.bb => bind_9.16.7.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.5.bb => bind_9.16.7.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind9 b/meta/recipes-connectivity/bind/bind-9.16.7/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.7/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.7/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.7/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/named.service b/meta/recipes-connectivity/bind/bind-9.16.7/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.5/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.7/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.5.bb b/meta/recipes-connectivity/bind/bind_9.16.7.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.5.bb
rename to meta/recipes-connectivity/bind/bind_9.16.7.bb
index eb263c2eda..5fc2c1d3cd 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.7.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6378b3e51fef11a8be4794dc48e8111ba92d211c0dfd129a0c296ed06a3dc075"
+SRC_URI[sha256sum] = "9f7d1812ebbd26a699f62b6fa8522d5dec57e4bf43af0042a0d60d39ed8314d1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.25.1




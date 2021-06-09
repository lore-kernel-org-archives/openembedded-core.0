Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.5679.1623232707981965597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 02:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: u8a9k1hu87k4oFpWKI2XLhKyBZn2J29Sr6wVYgQS/TKtO9iADrx+q9iIBb2VfbL3WwTDKsKg5o
 NSTjAxV0Cvjw==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="290671770"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="290671770"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 02:58:27 -0700
IronPort-SDR: kk6pIHNjezj+buWbJ2en5rsYd0151mtsSw+yegldYCf5ZFqDl827PynaIYjmaHMwR0zai32MIv
 HaU/XnlAztNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="485668325"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2021 02:58:27 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][hardknott 2/2] bind: 9.16.12 -> 9.16.16
Date: Wed,  9 Jun 2021 17:58:25 +0800
Message-Id: <20210609095825.23472-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609095825.23472-1-chee.yang.lee@intel.com>
References: <20210609095825.23472-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fix for
CVE-2021-25214
CVE-2021-25215
CVE-2021-25216

release notes:
https://downloads.isc.org/isc/bind9/9.16.16/doc/arm/html/notes.html#notes-for-bind-9-16-16

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.12 => bind-9.16.16}/bind9                   | 0
 .../bind/{bind-9.16.12 => bind-9.16.16}/conf.patch              | 0
 .../bind/{bind-9.16.12 => bind-9.16.16}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.12 => bind-9.16.16}/named.service           | 0
 .../bind/{bind_9.16.12.bb => bind_9.16.16.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.16}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.12.bb => bind_9.16.16.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/bind9 b/meta/recipes-connectivity/bind/bind-9.16.16/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.16/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/named.service b/meta/recipes-connectivity/bind/bind-9.16.16/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.16/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.12.bb b/meta/recipes-connectivity/bind/bind_9.16.16.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.12.bb
rename to meta/recipes-connectivity/bind/bind_9.16.16.bb
index 09f77038fa..4e6529307e 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.12.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "9914af9311fd349cab441097898d94fb28d0bfd9bf6ed04fe1f97f042644da7f"
+SRC_URI[sha256sum] = "6c913902adf878e7dc5e229cea94faefc9d40f44775a30213edd08860f761d7b" 
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.17.1


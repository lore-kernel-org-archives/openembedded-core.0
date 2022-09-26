Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63DEC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 04:29:14 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.25084.1664166553371838220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 21:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nvdY1Eoh;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664166553; x=1695702553;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ly2tO9DN08+hoOYsAwGawok9R4LxrjOYVagsGdvnO+Q=;
  b=nvdY1EohkGiIpwrrrK4WddShJj2HFGdwGvqtUv4E1teeoZYsML+B5SAY
   eYAP7pjxvciYf1CE/KnVLGlQTOoriblbzowL234fAYbDqCrGlfGcBT9ou
   Hbi+IGNuTQwRRLxpRu7ssKr+HK0dbL2OwxArg9YPm5lSELGSaX5xQvrBD
   6WxJP7vBKVjZe+0/nW9mwuDl+Kk0P9LAgbEz0TB6VdksB/ROrAD+48+Cw
   7txF0EXbuqZ4UmoHl6UVAqeJ7dKwGnwOVh7EO1Nh0QexWGKPOz+7G92SG
   +zARkaEK3ZsK5cYDZ2QPH3O4bInGhldRqZNO0onyC83PyYm+JmU1/W1SR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="284051756"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200";
   d="scan'208";a="284051756"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2022 21:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="865978400"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200";
   d="scan'208";a="865978400"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga006.fm.intel.com with ESMTP; 25 Sep 2022 21:28:57 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bind: upgrade 9.18.6 -> 9.18.7
Date: Mon, 26 Sep 2022 12:28:53 +0800
Message-Id: <20220926042853.4079338-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 04:29:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171050

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

CVE fixed :
-CVE-2022-2795
-CVE-2022-2881
-CVE-2022-2906
-CVE-2022-3080
-CVE-2022-38178

Notes for BIND 9.18.7 [https://downloads.isc.org/isc/bind9/9.18.7/doc/arm/html/notes.html#notes-for-bind-9-18-7]

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/bind9                     | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/conf.patch                | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/named.service             | 0
 .../bind/{bind_9.18.6.bb => bind_9.18.7.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.6.bb => bind_9.18.7.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/bind9 b/meta/recipes-connectivity/bind/bind-9.18.7/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.7/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.7/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/named.service b/meta/recipes-connectivity/bind/bind-9.18.7/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.7/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.6.bb b/meta/recipes-connectivity/bind/bind_9.18.7.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.6.bb
rename to meta/recipes-connectivity/bind/bind_9.18.7.bb
index 5f54942776..4ab11486bf 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "d43a0fed03c774d1685d203598218c0b7774a88fcc390a0170710d5feb7fbff1"
+SRC_URI[sha256sum] = "9e2acf1698f49d70ad12ffbad39ec6716a7da524e9ebd98429c7c70ba1262981"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.37.3



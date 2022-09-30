Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B848C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 07:28:27 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.3058.1664522898138861651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 00:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=imElFTsA;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664522898; x=1696058898;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=plmpOn8ZVTqHNAPfU/AtHa5zKxJlWwst2Y8djmBVf0k=;
  b=imElFTsAClxj013KjiTWp7kEvKj+kLO31Y69PRRwKe5XHWdLF+9PAwY3
   aHFzxFeq7WZfz3l8B93KwjdfBFC6N2buUpCPQcV9aMIySxmqF0zCpKeqC
   zx0oBIM+vVW9iBHShfJuFhZUK+8zzELsxq8ZC1oY5BCw9cdMx2kqFQYDg
   9pMzTRhtyC9qY32XxYflroVTxAwuYPbmxgE27TKJkZiPYhx5e5wYhKXgN
   p6ADRxJPpvKmPGW3mtPC+nym3+u2Q95+/zdut4YHtEtnIFfBbzClx9BT5
   5sMwYEU63Jk4kZuF1yKp48UAjpIWvqjod2QjIkG4Qt5BPy3hNgrPmTQSV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="299729282"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="299729282"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 00:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="797878629"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="797878629"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 30 Sep 2022 00:28:09 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch 2/2] bind: upgrade 9.18.6 -> 9.18.7
Date: Fri, 30 Sep 2022 15:28:00 +0800
Message-Id: <20220930072800.1881072-2-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930072800.1881072-1-jay.shen.teoh@intel.com>
References: <20220930072800.1881072-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 07:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171213

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

CVE fixed :
-CVE-2022-2795
-CVE-2022-2881
-CVE-2022-2906
-CVE-2022-3080
-CVE-2022-38178

Notes for BIND 9.18.7 [https://downloads.isc.org/isc/bind9/9.18.7/doc/arm/html/notes.html#notes-for-bind-9-18-7]

(From OE-Core rev: 5b87b79c6bb155d23ad4eab3243118b98a3b5906)

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 9adcdc2508..11c8a4e9d3 100644
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



Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1EFC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 07:28:27 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.3058.1664522898138861651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 00:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bP69jpsO;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664522898; x=1696058898;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ibC2r7CJBOtBJFuuvtqaPCHPOOqKabemK4EXfOCWsjQ=;
  b=bP69jpsOHjfuRAquGnHTCErAq+SzMViUS/4xjVAp8wrlt0DG93b++P4n
   u/vlhaK7yOyaE52mlsUHx8B9/Uyj/lt+SkNDQZoewFIyb8eVoVee4fKFI
   1Q9Vs1JVzlUto2BxcfPd1vu+DhGHcGg0PKwE2UjCfiRsa67oxF3zBuQZh
   W7H8NKvt2Bqmdl7nwk5AewipStx/jR29gXlug03DCTH6Z3uJf8IRpmzWv
   fCBNaprgIFdxkqr3cmSD7dXhvlGincxNcdvZL4f8EolBcphNzZBQqn0CC
   gnLY3o5RKFS4ObInL2qsAvzfs56+Wfu6iGdVmLjsMhUvV3m9tuHBePzc6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="299729281"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="299729281"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 00:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="797878618"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="797878618"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 30 Sep 2022 00:28:07 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch 1/2] bind: upgrade 9.18.5 -> 9.18.6
Date: Fri, 30 Sep 2022 15:27:59 +0800
Message-Id: <20220930072800.1881072-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 07:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171212

From: wangmy <wangmy@fujitsu.com>

(From OE-Core rev: f7061fc14cbc4388b1fd0cf6233b1a2e743e20e5)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/bind9                     | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/conf.patch                | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/named.service             | 0
 .../bind/{bind_9.18.5.bb => bind_9.18.6.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.5.bb => bind_9.18.6.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/bind9 b/meta/recipes-connectivity/bind/bind-9.18.6/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.6/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/named.service b/meta/recipes-connectivity/bind/bind-9.18.6/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.6/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.5.bb b/meta/recipes-connectivity/bind/bind_9.18.6.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.5.bb
rename to meta/recipes-connectivity/bind/bind_9.18.6.bb
index 28acecc507..9adcdc2508 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0cee078d74f0bdc4ec374435026b25de7892f26540a18b22a02ef728a11dcae7"
+SRC_URI[sha256sum] = "d43a0fed03c774d1685d203598218c0b7774a88fcc390a0170710d5feb7fbff1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.37.3



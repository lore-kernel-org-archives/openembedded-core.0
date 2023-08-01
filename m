Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D31FC41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7613.1690875707317464613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126603451"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126603451"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52EDFDB3C7
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:42 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96EF7D3F16
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BD56C2FC8177;
	Tue,  1 Aug 2023 16:41:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.16 -> 9.18.17
Date: Tue,  1 Aug 2023 15:41:16 +0800
Message-Id: <1690875687-21573-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--21.046900-10.000000
X-TMASE-MatchedRID: 0LRGK1b0mamjz0nOeth/yRIRh9wkXSlF0hjNs9++x/oH4DTIEE89jH+j
	vhRCUKYAwK5MBEKsd/BQSUm5CsBM4VaTTIuA6AbSzYK5U+QI3O7nrllatbeJEFOat2azgyj1tY4
	N1nU8OYRqyd3L/byFi36OhKWZAZtShp3OtYR8kkwgaafg6U60I793fXsHDB0HuqWf6Nh7tmGeRK
	7qwUtdMOfbYRxKtAGdIKtySTLNoW9grjeh0lt2oH4iswX+GH/Ybo9qnUw920fKUAGJEFJZ7Up2G
	cT5C1HO4K9FmervsqV/XdryBgAySUpCFcNebto2SCtgxgcsrMqSiza26cvwNC99T+uJIleR1vZ7
	s3YIVDL7tBxFpWhrycYoh/qEF/tV3orNkpcxHYRO5y1KmK5bJTZlY6a4lRLZpjlkbDvDJ4f5N6b
	Apqr+0xab+AC2MJ3sJBo2+H9VjZtx9EmrVy1N/EhwlOfYeSqxG1cxYvrc7y+8AP8E7dDFCp6ba/
	D5x6cp4vM1YF6AJbbCCfuIMF6xLbxAi7jPoeEQftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185199

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Remove trailing whitespace from COPYRIGHT

Changelog:
==========
-Add shutdown checks in dns_catz_dbupdate_callback() to
 avoid a race with dns_catz_shutdown_catzs().
-Restore support to read legacy HMAC-MD5 K file pairs.
-Use NS records for relaxed QNAME-minimization mode.
 This reduces the number of queries named makes when
 resolving, as it allows the non-existence of NS RRsets
 at non-referral nodes to be cached in addition to the
 referrals that are normally cached.
-Fix nslookup erroneously reporting a timeout when the
 input is delayed.
-Improve HTTP Connection: header protocol conformance
 in the statistics channel.
-Remove the holes in the isc_result_t enum to compact
 the isc_result tables.
-Fix a data race between the dns_zone and dns_catz
 modules when registering/unregistering a database
 update notification callback for a catalog zone.
-Report "permission denied" instead of "unexpected error"
 when trying to update a zone file on a read-only file
 system. Thanks to Midnight Veil.
-Fix a catz db update notification callback registration
 logic error, which could crash named when receiving an
 AXFR update for a catalog zone while the previous update
 process of the catalog zone was already running.
-Retry without DNS COOKIE on FORMERR if it appears that
 the FORMERR was due to the presence of a DNS COOKIE
 option.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.18.16 => bind-9.18.17}/bind9                 | 0
 .../bind/{bind-9.18.16 => bind-9.18.17}/conf.patch            | 0
 .../bind/{bind-9.18.16 => bind-9.18.17}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.16 => bind-9.18.17}/named.service         | 0
 .../bind/{bind_9.18.16.bb => bind_9.18.17.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind-9.18.17}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.16.bb => bind_9.18.17.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.17/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.17/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.17/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/bind9 b/meta/recipes-connectivity/bind/bind-9.18.17/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.17/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.17/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.17/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.17/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.17/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.17/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.16/named.service b/meta/recipes-connectivity/bind/bind-9.18.17/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.16/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.17/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.16.bb b/meta/recipes-connectivity/bind/bind_9.18.17.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.16.bb
rename to meta/recipes-connectivity/bind/bind_9.18.17.bb
index d9b62bb8b0..9e7973ecbf 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.16.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.17.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d8cf7bd9c4fd5471a588e7e66e672408"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c7a0b6d9a1b692a5da9af9d503671f43"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "c88234fe07ee75c3c8a9e59152fee64b714643de8e22cf98da3db4d0b57e0775"
+SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1



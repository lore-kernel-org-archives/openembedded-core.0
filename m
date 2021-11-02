Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52E1C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 03:36:16 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4658.1635824166038039310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 20:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3ANA+8GKP1L+QYuzPvrR2FlcFynXyQoLVcMsFnjC/?=
 =?us-ascii?q?WdQPqgmhzhjBRzTFLXT3TbPjZZGD9cth3YYq+o0wEuJGEm99gGjLY11k3ESsS9?=
 =?us-ascii?q?pCt6fd1j6vIF3rLaJWFFSqL1u1GAjX7BJ1yHiC0SiuFaOC79CAljfjQHdIQNca?=
 =?us-ascii?q?fUsxPbV49IMseoUI78wIJqtYAbemRW2thi/uryyHsEAPNNwpPD44hw/nrRCWDE?=
 =?us-ascii?q?xjFkGhwUlQWPZintbJF/pUfJMp3yaqZdxMUTmTId9NWSdovzJnhlo/Y1xwrTN2?=
 =?us-ascii?q?4kLfnaVBMSbnXVeSMoiMOHfH83V4Z/Wpvuko4HKN0hUN/lDyPkNVg4NtQt52sU?=
 =?us-ascii?q?hpvNarJ8AgYe0ABTX4jYfAeodcrJlD666R/1XbudGPhxfhrBkw6MYAUv+1wG2x?=
 =?us-ascii?q?m8f0DNCtLaQiOge+zyr+3RuRgwMM5I6HW0Ck30p175WiBS694HtaYGOOXjeK0F?=
 =?us-ascii?q?QwY3qhmdcsyreJAAda3UCn9Xg=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AKk17ZKroHdfM+YKjCxDKimoaV5pOeYIsimQD?=
 =?us-ascii?q?101hICG9E/b5qynAppkmPHPP4gr5O0tApTnjAsa9qBrnnPYf3WB4B8bAYOCMgg?=
 =?us-ascii?q?eVxe9Zg7ff/w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.87,201,1631548800";
   d="scan'208";a="116754501"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Nov 2021 11:36:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DAEA04D0DC98
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 11:35:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 2 Nov 2021 11:35:55 +0800
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.16.21 -> 9.16.22
Date: Tue, 2 Nov 2021 11:35:09 +0800
Message-ID: <1635824112-40302-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: DAEA04D0DC98.AACB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 03:36:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157730

--- 9.16.22 released ---

5726.[security]	The "lame-ttl" option is now forcibly set to 0. This
			effectively disables the lame server cache, as it could
			previously be abused by an attacker to significantly
			degrade resolver performance. (CVE-2021-25219)
			[GL #2899]

5724.[bug]		Address a potential deadlock when checking zone content
			consistency. [GL #2908]

5723.[bug]		Change 5709 broke backward compatibility for the
			"check-names master ..." and "check-names slave ..."
			options. This has been fixed. [GL #2911]

5720.[contrib]	Old-style DLZ drivers that had to be enabled at
			build-time have been marked as deprecated. [GL #2814]

5719.[func]		The "map" zone file format has been marked as
			deprecated. [GL #2882]

5717.[func]		The "cache-file" option, which was documented as "for
			testing purposes only" and not to be used, has been
			removed. [GL #2903]

5716.[bug]		Multiple library names were mistakenly passed to the
			krb5-config utility when ./configure was invoked with
			the --with-gssapi=[/path/to/]krb5-config option. This
			has been fixed by invoking krb5-config separately for
			each required library. [GL #2866]

5715.[func]		Add a check for ports specified in "*-source(-v6)"
			options clashing with a global listening port. Such a
			configuration was already unsupported, but it failed
			silently; it is now treated as an error. [GL #2888]

5714.[bug]		Remove the "adjust interface" mechanism which was
			responsible for setting up listeners on interfaces when
			the "*-source(-v6)" address and port were the same as
			the "listen-on(-v6)" address and port. Such a
			configuration is no longer supported; under certain
			timing conditions, that mechanism could prevent named
			from listening on some TCP ports. This has been fixed.
			[GL #2852]

5712.[doc]		Add deprecation notice about removing native PKCS#11
			support in the next major BIND 9 release. [GL #2691]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/bind9                   | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/conf.patch              | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.21 => bind-9.16.22}/named.service           | 0
 .../bind/{bind_9.16.21.bb => bind_9.16.22.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.21 => bind-9.16.22}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.21.bb => bind_9.16.22.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.22/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.22/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/bind9 b/meta/recipes-connectivity/bind/bind-9.16.22/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.22/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.22/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.22/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.22/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.22/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.22/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.22/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/named.service b/meta/recipes-connectivity/bind/bind-9.16.22/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.21/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.22/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.21.bb b/meta/recipes-connectivity/bind/bind_9.16.22.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.21.bb
rename to meta/recipes-connectivity/bind/bind_9.16.22.bb
index 390c84248d..bde9a793b0 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.22.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "65da5fd4fb80b7d0d7452876f81fd6d67cdcee54a5e3c1d65610334665dfa815"
+SRC_URI[sha256sum] = "65e7b2af6479db346e2fc99bcfb6ec3240066468e09dbec575ebc7c57d994061"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.25.1





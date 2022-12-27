Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAF6C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:35:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.152362.1672122946060119409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oZEHkQGo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672122944; i=@fujitsu.com;
	bh=1pWWjdLFc/cTbbycZC/LyYpoRGy8wq6VyB4CwSt2YMA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oZEHkQGoJD+x55ZbBbphKO4Dl8WgWx7lWzEPfok8JfQBfpEPodDdtSAE3oOoznjM0
	 vrNh3oXZ303lYKOvrBva8CfKDWai0EaxtejiOdsy6bfbY1TBG9Q4hBzDb4axuI3yz1
	 b7pg/UexFbOMT6o9wd5CRc/7zHCIb508rYMXtYXnyhZ6D3gWggXWnXAeZ0cb2ueekf
	 9LcV69M6mlc4Q9PdisqS4PEJezNzG59N09IyxKrIp72cXXzv6AyO8B1iAdDdEyNfYb
	 7L1pzdTYqKZqKlk+XHcKw5bECM3h29JqYPuD0PxGSvsZWWpcZxTrXGPPCTwz+MzMvj
	 v3HIewepqDoOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORpGs/aVW
  ywcp+GYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPj5htsBdttKg6cWMHewPjMrIuRk0NI4AGj
  xNWFMl2MXED2JSaJ1/PXsEI4exgldm7sZgKpYhOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhASuJ3Qdeg9ksAqoSl/r2gtm8Ak4SkxcuYQGxJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eMEPUKErMvtwMVV8hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGusV5SUWZ
  6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYCCmFLNV72B8u/SP
  3iFGSQ4mJVFeqe5VyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeC+D5ASLUtNTK9Iyc4BRAZOW4
  OBREoFo5S0uSMwtzkyHSJ1iVJQS5+2cCJQQAElklObBtcEi8RKjrJQwLyMDA4MQT0FqUW5mCa
  r8K0ZxDkYlYV51kPE8mXklcNNfAS1mAlr84dBKkMUliQgpqQamBKFJMoubkgo2iAc/2a+3IUV
  QeZbWj+vtm9JzNy0R2jS/rfRR2xfl/m3TbMM15ibK+Rqr8hsbxyhlmhiJaPhxFpU6zpD+PSnY
  23HmuqyDzeZ8990jC5/o9+pf88+ITspb7Hgt65Nn6u2EFfP+vC3TZOzuerV+vfutczkiPKd4z
  EUnTlh2TmxvMnsgq3/Sx6n7YpVY+3KF1wZevqcpWLl56Y01Fwq5XjdVSTJxFQgKKt/7UREUxf
  hr10yRtp2uP61tymwVJ28LeV0rULrhyF52nUWG0QwxHAyWzRzR9zmfPZk0K6Dm8iYtIbs688z
  r6y7EfJa5WBF+Vl1oz9Jox54rFzs8gj8Lu858fHjeEiWW4oxEQy3mouJEANiA+P0/AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-587.messagelabs.com!1672122943!180404!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31445 invoked from network); 27 Dec 2022 06:35:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:35:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 109E81AD
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 06:35:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 04AD27B
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 06:35:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:35:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.9 -> 9.18.10
Date: Tue, 27 Dec 2022 14:35:06 +0800
Message-ID: <1672122906-31708-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 06:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
The key file IO locks objects would never get deleted from the hashtable due to
off-by-one error.

ANY responses could sometimes have the wrong TTL.

Speed up the named shutdown time by explicitly canceling all recursing ns_client
objects for

Removing a catalog zone from catalog-zones without also removing the referenced
zone could leave a dangling pointer. [GL #3683]

nslookup and host were not honoring the selected port in TCP mode. [GL #3721]

Deprecate alt-transfer-source, alt-transfer-source-v6 and
use-alt-transfer-source. [GL #3694]

Move the "final reference detached" log message from dns_zone unit to the
DEBUG(1) log level.

Fix assertion failure in isc_http API used by statschannel if the read callback
would be called on HTTP request that has been already closed.

Deduplicate time unit conversion factors.

Copy TLS identifier when setting up primaries for catalog member zones.

Deprecate 'auto-dnssec'. [GL #3667]

The decompression implementation in dns_name_fromwire() is now smaller and
faster. [GL #3655]

Use the current domain name when checking answers from a dual-stack-server.

Ensure 'named-checkconf -z' respects the check-wildcard option when loading a
zone.  [GL #1905]

Deprecate 'coresize', 'datasize', 'files', and 'stacksize' named.conf options.

The view's zone table was not locked when it should have been leading to race
conditions when external extensions that manipulate the zone table where in use.

Some browsers (Firefox) send more than 10 HTTP headers.  Bump the number of
allowed HTTP headers to 100. [GL #3670]

NXDOMAIN cache records are no longer retained in the cache after expiry,
even when serve-stale is in use. [GL #3386]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/bind9                    | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/conf.patch               | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/generate-rndc-key.sh     | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/named.service            | 0
 .../bind/{bind_9.18.9.bb => bind_9.18.10.bb}                    | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.9.bb => bind_9.18.10.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/bind9 b/meta/recipes-connectivity/bind/bind-9.18.10/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.10/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/named.service b/meta/recipes-connectivity/bind/bind-9.18.10/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.10/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.9.bb b/meta/recipes-connectivity/bind/bind_9.18.10.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.9.bb
rename to meta/recipes-connectivity/bind/bind_9.18.10.bb
index 160986eb53..cb0e251d51 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.10.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6a9665998d568604460df0918fc8ccfad7d29388d4d842560c056cc211cbb243"
+SRC_URI[sha256sum] = "f415a92feb62568b50854a063cb231e257351f8672186d0ab031a49b3de2cac6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1



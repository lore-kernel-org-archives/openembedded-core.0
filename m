Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98152C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 08:34:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.7004.1653381261876260357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 01:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pkwhoDgQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653381260; i=@fujitsu.com;
	bh=pHyQpgSY84/Lq8quxgkub2UYtC7xOLmLinawboW/vSw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pkwhoDgQwOWrXU5rXpxikmPr+lJtzAnQeKTBvtw6JgiCTqCDbAzyN84BgarS8GlvV
	 07mjrZfB2VgwwffywEETY/04FU/Yy/acgYywvTE2aVSa47tCiGL2EF2jcEqV3qQULB
	 sB7r9+Hj4LIaNgM2WGyzEz1SAdPVDM+w6XnErctfLtXfrPRhF+Z/dNLSLVTb1cNp84
	 ZY2uxkqt/sZAgB4uSz9TC3hxvm5ko9nPavnj6iNZ4L3NRuwD6kV7p4PeuC2wEJD5bH
	 46k2k5AO3K6IdslwZ6YTe1KAzltUSfuG9AAwH0s0bS8iyGp0Ddjd2OmfdciuMqKaQt
	 lJm161WHOCfKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqNs9oyf
  J4MlXKYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPNjrfMBY9dKlrb1zM3MC637WLk4hASeMwo
  0ba0namLkRPIOc8kseyJOERiD6PEpIfb2EASbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0s4Cjx4c47sHIWAVWJ6St3sYDYvEDxVT+Wg8UlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJixDapXTeLquU3MExj5ZyFpn4WkfQEj0ypGq6SizPSMktzEzBxdQwM
  DXUNDU10zXSNDA73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMCQTClmu7SD
  cW7fT71DjJIcTEqivBktPUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHiz24FygkWp6akVaZk5w
  PiASUtw8CiJ8LZPB0rzFhck5hZnpkOkTjHqcvz99HcvsxBLXn5eqpQ4bxdIkQBIUUZpHtwIWK
  xeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMGwUyhSczrwRu0yugI5iAjuiV6AQ5oiQRISX
  VwGR79h3vLdMHXcwcUzX3LGmtY+o7srVAysano27JDmX77PeLNC6d9k6zurnCu0s5/l6DceH1
  L20LSzyM7xek7OY2FC6JseU9pXQtdflXjScvLkzl7ruy/rx/hN8zPvWXb7/K6h9dLRuzorEzp
  UWfhVf9/oubxy1CmwI2G/7+czej8E3jr6k2ZX1ndojd03i+Zva2lB4Wl19zA9NW/xQVutaudq
  HH6tzvm7Ov2X/syjR6biTz+M+8a/dq+thmhGybVZQosyVAfobTLc/VvGn7vkewHVvEoLNKbn7
  HBe0HDo+y4v7+qug59jeo9PL+hyc/J17YaJN08UKD/HSDU3OYapt+Jvd+WM63vD96zXQ2u4VK
  LMUZiYZazEXFiQCvWNLeUAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1653381259!65721!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9658 invoked from network); 24 May 2022 08:34:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 May 2022 08:34:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BEC4B10019A
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9D40A100183
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 24 May 2022 09:34:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] bind: upgrade 9.18.2 -> 9.18.3
Date: Tue, 24 May 2022 16:33:42 +0800
Message-ID: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 08:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166051

Changelog:
==========
[security]
 Fix a crash in DNS-over-HTTPS (DoH) code caused by
 premature TLS stream socket object deletion.
 (CVE-2022-1183) [GL #3216]

[bug]
 RPZ NSIP and NSDNAME rule processing didn't handle stub
 and static-stub zones at or above the query name.  This
 has now been addressed. [GL #3232]
 Fixed a deadlock that could occur if an rndc
 connection arrived during the shutdown of network
 interfaces. [GL #3272]

 Refactor the fctx_done() function to set fctx to
 NULL after detaching, so that reference counting
 errors will be easier to avoid. [GL #2969]

 udp_recv() in dispatch could trigger an INSIST when the
 callback's result indicated success but the response
 was canceled in the meantime. [GL #3300]

 Work around a jemalloc quirk which could trigger an
 out-of-memory condition in named over time. [GL #3287]

 If there was a pending negative cache DS entry,
 validations depending upon it could fail. [GL #3279]

 dig returned a 0 exit status on UDP connection failure.
 [GL #3235]

 Fix an assertion failure when using dig with +nssearch
 and +tcp options by starting the next query in the
 send_done() callback (like in the UDP mode) instead
 of doing that recursively in start_tcp(). Also
 ensure that queries interrupted while connecting
 are detached properly. [GL #3144]

 Don't remove CDS/CDNSKEY DELETE records on zone sign
 when using 'auto-dnssec maintain;'. [GL #2931]

[contrib]
 Avoid name space collision in dlz modules by prefixing
 functions with 'dlz_'. [GL !5778]

 dlz: Add FALLTHROUGH and UNREACHABLE macros. [GL #3306]

[func]
 Add new named command-line option -C to print built-in
 defaults. [GL #1326]

 Introduce the concept of broken catalog zones described
 in the DNS catalog zones draft version 5 document.
 [GL #3224]

 Add DNS Extended Errors when stale answers are returned
 from cache. [GL #2267]

 Implement support for catalog zones change of ownership
 (coo) mechanism described in the DNS catalog zones draft
 version 5 document. [GL #3223]

 Implement support for catalog zones options new syntax
 based on catalog zones custom properties with "ext"
 suffix described in the DNS catalog zones draft version
 5 document. [GL #3222]

 Implement reference counting for TLS contexts and
 allow reloading of TLS certificates on reconfiguration
 without destroying the underlying TCP listener sockets
 for TLS-based DNS transports. [GL #3122]
 Add support for remote TLS certificates
 verification, both to BIND and dig, making it possible
 to implement Strict and Mutual TLS authentication,
 as described in RFC 9103, Section 9.3. [GL #3163]

[cleanup]
 Remove use of exclusive mode in ns_interfacemgr in
 favor of rwlocked access to localhost and localnets
 members of dns_aclenv_t structure. [GL #3229]

 Remove the task exclusive mode use in ns_clientmgr.
 [GL #3230]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/bind9                     | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/conf.patch                | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/named.service             | 0
 .../bind/{bind_9.18.2.bb => bind_9.18.3.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.2.bb => bind_9.18.3.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind9 b/meta/recipes-connectivity/bind/bind-9.18.3/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.3/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/named.service b/meta/recipes-connectivity/bind/bind-9.18.3/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.3/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.2.bb b/meta/recipes-connectivity/bind/bind_9.18.3.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.18.2.bb
rename to meta/recipes-connectivity/bind/bind_9.18.3.bb
index 1c77aceb9f..b511b77f2e 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "2e4b38779bba0a23ee634fdf7c525fd9794c41d692bfd83cda25823a2a3ed969"
+SRC_URI[sha256sum] = "0ad8da773bd93cba0ef66cc81999698ebdf9c3e51faed5e5c8c1eb75cad2ae6f"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1



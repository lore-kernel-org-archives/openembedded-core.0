Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.6300.1627542418018845306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wvai9hKv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627542414; i=@fujitsu.com;
	bh=6Q+l62O+iSONwg3WhWUTjw+Y5wIO88IHhXwpONxw61k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wvai9hKvQnCcs86URhh8Q66UrETZLmfimmp9OemSZw5EJ4+7BTezodX6Vj3Kr3PNl
	 ZzbCSxNb+EzpUNW8YirV6gTX0cTNZzum23xttFQv4ODWR46EnxatiQWWp2IvPxikdq
	 u/PYtu9UrbBl/kBoBShOEEkEf+U+pGM9K81o/XzI4xfC4XJ/zcotJ9m/wHW4NQNYUr
	 ICzog9fLHvlmOwAsFf0naoUKN6t558KGZkSMLXS+QWlcC6ThdcLZQD2Jc+vsslMw27
	 Wt90h/O1au7Oz7s/dwRsapU8P5prmkRCvURlN3fAc4ncRKoBMuq3QqtHZTTiZF1WXT
	 XEaqk7nhYxf3A==
Received: from [100.113.6.138] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 69/AE-07695-E8352016; Thu, 29 Jul 2021 07:06:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVbcnmCn
  RoHcFo8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnF32Q/2gqnOFd1LH7A3MF617mLk5BASmMUk
  cXKfaRcjF5B9glHi/LznLCAJNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu4cdxBYWsJFof
  L2CDaSERUBVYtelepAwr4CTxPv2RawgtoSAgsSUh++ZIeKCEidnPmGBGCMhcfDFC2aIGkWJ2Z
  ebWSDsColZs9qYJjDyzkLSMgtJywJGplWMlklFmekZJbmJmTm6hgYGuoaGxromukYGpnqJVbp
  JeqmlusmpeSVFiUBZvcTyYr3iytzknBS9vNSSTYzA4EopZDm7g/HL6w96hxglOZiURHl/2TEl
  CvEl5adUZiQWZ8QXleakFh9ilOHgUJLg3RQElBMsSk1PrUjLzAEGOkxagoNHSYRXKAAozVtck
  JhbnJkOkTrFqCglzrs4ECghAJLIKM2Da4NF1yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwr
  yhIFN4MvNK4Ka/AlrMBLS4toQRZHFJIkJKqoGpIFtPrH7KeibzVYy8y9ZMf/Qv+lRf9E/RY88
  9H+yRZUm7nrA8jYOb4eyr/WerFqu5/7US+XykcImTSFi81nf3+By/R5YPDHa3XNlgNf/xj4uP
  HpWI5UQE66/l0u7acXdns74pL+cH2wnyZz64nZ4h9szL9qDybBHblEvvJGNfdaxrkI/wcfTel
  Xh+0bTq0F9B19tCo2ffnn7s2km3loBTHwQnnJ/Qvl/8qd76tkULyu54atdem/THYYJIivrE7S
  w7VjkUXT2y/kF7rqjJwkdPXE3n1G6fa9T5i+fVx+ovX5b/UhSzWXl3pd/d+Sy1jTmJgb6B0+v
  VhGrOCBldyEmdmCBir7e8t5rX5YSwzIp3SizFGYmGWsxFxYkAy1HTFCkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-248.messagelabs.com!1627542411!133846!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23376 invoked from network); 29 Jul 2021 07:06:51 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:06:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T76gGb001513
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 08:06:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:06:40 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.16.18 -> 9.16.19
Date: Thu, 29 Jul 2021 15:06:26 +0800
Message-ID: <1627542388-24698-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

	--- 9.16.19 released ---

5671.	[bug]		A race condition could occur where two threads were
			competing for the same set of key file locks, leading to
			a deadlock. This has been fixed. [GL #2786]

5670.	[bug]		create_keydata() created an invalid placeholder keydata
			record upon a refresh failure, which prevented the
			database of managed keys from subsequently being read
			back. This has been fixed. [GL #2686]

5669.	[func]		KASP support was extended with the "check DS" feature.
			Zones with "dnssec-policy" and "parental-agents"
			configured now check for DS presence and can perform
			automatic KSK rollovers. [GL #1126]

5668.	[bug]		Rescheduling a setnsec3param() task when a zone failed
			to load on startup caused a hang on shutdown. This has
			been fixed. [GL #2791]

5667.	[bug]		The configuration-checking code failed to account for
			the inheritance rules of the "dnssec-policy" option.
			This has been fixed. [GL #2780]

5666.	[doc]		The safe "edns-udp-size" value was tweaked to match the
			probing value from BIND 9.16 for better compatibility.
			[GL #2183]

5665.	[bug]		If nsupdate sends an SOA request and receives a REFUSED
			response, it now fails over to the next available
			server. [GL #2758]

5664.	[func]		For UDP messages larger than the path MTU, named now
			sends an empty response with the TC (TrunCated) bit set.
			In addition, setting the DF (Don't Fragment) flag on
			outgoing UDP sockets was re-enabled. [GL #2790]

5662.	[bug]		Views with recursion disabled are now configured with a
			default cache size of 2 MB unless "max-cache-size" is
			explicitly set. This prevents cache RBT hash tables from
			being needlessly preallocated for such views. [GL #2777]

5661.	[bug]		Change 5644 inadvertently introduced a deadlock: when
			locking the key file mutex for each zone structure in a
			different view, the "in-view" logic was not considered.
			This has been fixed. [GL #2783]

5658.	[bug]		Increasing "max-cache-size" for a running named instance
			(using "rndc reconfig") did not cause the hash tables
			used by cache databases to be grown accordingly. This
			has been fixed. [GL #2770]

5655.	[bug]		Signed, insecure delegation responses prepared by named
			either lacked the necessary NSEC records or contained
			duplicate NSEC records when both wildcard expansion and
			CNAME chaining were required to prepare the response.
			This has been fixed. [GL #2759]

5653.	[bug]		A bug that caused the NSEC3 salt to be changed on every
			restart for zones using KASP has been fixed. [GL #2725]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.18 => bind-9.16.19}/bind9                   | 0
 .../bind/{bind-9.16.18 => bind-9.16.19}/conf.patch              | 0
 .../bind/{bind-9.16.18 => bind-9.16.19}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.18 => bind-9.16.19}/named.service           | 0
 .../bind/{bind_9.16.18.bb => bind_9.16.19.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.18 => bind-9.16.19}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.18.bb => bind_9.16.19.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.19/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.19/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.19/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.19/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.19/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.19/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/bind9 b/meta/recipes-connectivity/bind/bind-9.16.19/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.19/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.19/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.19/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.19/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.19/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.19/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.19/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.19/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.19/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.18/named.service b/meta/recipes-connectivity/bind/bind-9.16.19/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.18/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.19/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.18.bb b/meta/recipes-connectivity/bind/bind_9.16.19.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.18.bb
rename to meta/recipes-connectivity/bind/bind_9.16.19.bb
index e7a1c5d9e9..e26cdf9701 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.18.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.19.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3c6263a4364eb5dce233f9f22b90acfa1ec2488d534f91d21663d0ac25ce5e65"
+SRC_URI[sha256sum] = "20bf727559302c933475904847041916bb6c279680c170babc01a76998e80ad3"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


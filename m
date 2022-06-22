Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A158DC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:38:30 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.4811.1655883500299624535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V6vPZLOr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655883498; i=@fujitsu.com;
	bh=RosLxcXSQF9v/hiqyoYgnsEEsOAycE6kyu2JAV+LAdg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V6vPZLOrbi0siVBkcOd58d1X8o8FR3w8ZHj1rwUJT66KE08fvJU2S9LTANUqatLte
	 N7rCMNSMXMoPNzXybI1042adz7T/luti0sjz8OKXi/1dttit+8Kvgavr7zUgFeSBJS
	 DpRQhiB1PJBYLEbnrv5OXxLk3dVXtEJI0+o8EA50muLB/nTUeEynvCxGzrnD4XUTLy
	 nQk5uiZcEPphr/hjm0aVt1sb+ohEs9Y8fada5tn9P5evxSvgWsPfKluilQG2vbs75+
	 TAV2lGeh+BlcphWfd4JVfIfx6CVXUBffwmQl0xBcb85dGFWVLw86XxMeSwt13z5qxi
	 pagT7JIPoSVDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8OxWffVsU1
  JBpNnC1jc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBn/b+xkKdhuXvF93jHWBsanBl2MXBxCAg8Y
  JVretTFDODeYJDoX/2WHcPYwSmw8cgrI4eRgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  8BKhAUsJV7MnsgGYrMIqErsunKaFcTmFXCSuHtgMwuILSGgIDHl4XtmEJtTwFni4NUOsLgQUM
  2WW2+ZIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83Q82pkJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaN1UlFmekZJbmJmjq6hgYGuoaGprrGRrqGRmV5ilW6iXmqpbnlqcYmukV5iebFeanGx
  XnFlbnJOil5easkmRmAYpxQr1O1gvLbyp94hRkkOJiVRXskDm5KE+JLyUyozEosz4otKc1KLD
  zHKcHAoSfA2HwbKCRalpqdWpGXmAGMKJi3BwaMkwqt6CCjNW1yQmFucmQ6ROsVoyTF19r/9zB
  zLweTMr20HmIVY8vLzUqXEeb8eBGoQAGnIKM2DGweL+0uMslLCvIwMDAxCPAWpRbmZJajyrxj
  FORiVhHnvHgWawpOZVwK39RXQQUxABz1ZvgHkoJJEhJRUA5P1lKhXPIpnN1zJXBjGcpxt5uwT
  B3o6RMTfTbTVPdvxvuHP7fw9dyOW1J/b+u6JzssHK0+Zh/6OiC9R3Pv66q89n1llnzseDLv4r
  epe+2WrzV2qere4qhLeTUrKfPuN/UebwKJQDxHGedubp6rL8O32cdE7N/kQ7780j3Uy/8RXvE
  vyfat8747W/zXB+So7jRlLcrUW7lk84U2Y9k/FwsacvgnbKqznB4Zn1wp0bPial9ttwnTwwO2
  9r/UcaqzlGOOadaTfmeZ6m9vP+/8ldJ7sCj6nI3zvZihEMHm7TXzz6NMC5cD4/d0BGc2TOB5/
  Kbjppf/Tx0Xm7DzB+zKZYjorp30990v8RNxl6Rihd9uUWIozEg21mIuKEwEC8HVmdgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1655883498!90409!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10710 invoked from network); 22 Jun 2022 07:38:18 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:38:18 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E1B21142
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D4F8573
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:38:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.3 -> 9.18.4
Date: Wed, 22 Jun 2022 15:37:49 +0800
Message-ID: <1655883470-22765-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655883470-22765-1-git-send-email-wangmy@fujitsu.com>
References: <1655883470-22765-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:38:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167215

Changelog:
==========
[func]          Don't try to process DNSSEC-related and ZONEMD records
                in catz. [GL #3380]

[func]          Add some more dnssec-policy checks to detect weird
                policies. [GL #1611]

[test]          Add new set of unit test macros and move the unit
                tests under single namespace in /tests/. [GL !6243]

[func]          Key timing options for 'dnssec-settime' and related
                utilities now accept "UNSET" times as printed by
                'dnssec-settime -p'. [GL #3361]

[bug]           When the fetches-per-server quota was adjusted
                because of an authoritative server timing out more
                or less frequently, it was incorrectly set to 1
                rather than the intended value.  This has been
                fixed. [GL #3327]

[bug]           Only write key files if the dnssec-policy keymgr has
                changed the metadata. [GL #3302]

[func]          Key timing options for 'dnssec-keygen' and
                'dnssec-settime' now accept times as printed by
                'dnssec-settime -p'. [GL !2947]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/bind9                     | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/conf.patch                | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/named.service             | 0
 .../bind/{bind_9.18.3.bb => bind_9.18.4.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.3.bb => bind_9.18.4.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.4/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.4/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.4/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/bind9 b/meta/recipes-connectivity/bind/bind-9.18.4/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.4/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.4/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.4/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.4/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.4/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.4/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/named.service b/meta/recipes-connectivity/bind/bind-9.18.4/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.4/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.3.bb b/meta/recipes-connectivity/bind/bind_9.18.4.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.18.3.bb
rename to meta/recipes-connectivity/bind/bind_9.18.4.bb
index b511b77f2e..5af2022129 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0ad8da773bd93cba0ef66cc81999698ebdf9c3e51faed5e5c8c1eb75cad2ae6f"
+SRC_URI[sha256sum] = "f277ae50159a00c300eb926a9c5d51953038a936bd8242d6913dfb6eac42761d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1



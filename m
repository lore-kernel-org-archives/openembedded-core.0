Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19929C28B27
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7048.1740828319010136327
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hvhciGGW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MBz3xKIN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019551741a0d-42714353-31d0-45e7-8919-eb68fb75c0f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dXgKXXGO1Pan4jrliL+E7IZcJOGG705irbAjU4+H6kU=;
	b=hvhciGGWEJArWhrUbMhOqdjG6+cjZhNiluTvAYTclTAQFcId+3cQmTRCZJatyBCP
	nhVOgLU2tW0UuekwesR0C970fJVRDI4xIr/nZcHmKGpEj8Jj0zKX42RnvS7kS6d5zQR
	TowUUKUW1Lc2BAF7rQ86/osWRimSJbuBnnKn+gGw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dXgKXXGO1Pan4jrliL+E7IZcJOGG705irbAjU4+H6kU=;
	b=MBz3xKINbhrApQCI5T48//jseJsK5CfEhx9ZhuST9MgMRy0IFEcIB/5LepWInwUa
	xaJfkoyO3OgdgffB1gRIwqGGvZso/YRe2YQxnZPoW0Mv1rf/KiEDfYh5jsVH6/tDkRO
	r0aUcnBnsV+nqfmJtRzgjNNEUldJFUyiuTuPWsnM=
Content-Type: multipart/mixed; boundary="===============0252685266338882869=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.6 SUCCEEDED
Message-ID: <0101019551741a0d-42714353-31d0-45e7-8919-eb68fb75c0f8-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212104

--===============0252685266338882869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.5-9.20.6.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c29774b21ad039c0d9ed6837eb3cef4f76b41712 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 06:37:30 +0000
Subject: [PATCH] bind: upgrade 9.20.5 -> 9.20.6

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.5.bb => bind_9.20.6.bb}                   | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.5.bb => bind_9.20.6.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 0d670edda6..56b3ef1f50 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 0a45935f9d1207535f83df62ed52f358ed546bbe Mon Sep 17 00:00:00 2001
+From a59ec7150da53bdc4d6807c8b97c6ebc5aae862c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 10b8caafbb..b2c8bf3788 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From dd484b0bd58832fc241afdc8ea05693228348353 Mon Sep 17 00:00:00 2001
+From f9a875bf707419db48773ed8621c43e9f8cdb155 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 13f9d7f..6516d0d 100644
+index 56d794b..b0f8edf 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 49b0a5eea1..83af8d0237 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 9a06dbf831f012c6019237527d2bf1aa7a3a543a Mon Sep 17 00:00:00 2001
+From 9b0e673ffc123b7a597221dc9f19bd01f92b0b5e Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 168a77a..13f9d7f 100644
+index f4b9ec3..56d794b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 16ac510cfa..398b804462 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 27d1113a4c378583e0fcff91d70256bdcd78de0b Mon Sep 17 00:00:00 2001
+From 800ecfc2184238b78ec5c03173f6ad855c6f8666 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index baeeafe33e..317d24e622 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1fa4d0eb9631771bd751f04ce898433580996e5e Mon Sep 17 00:00:00 2001
+From fd4dedd09ea1e83d49de1c271f089952d2e8deee Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 93aa304126..20cd2ed77d 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 2ea2e4e502e5840d52e76461e071882cc65f1766 Mon Sep 17 00:00:00 2001
+From df9b0417232f48b035bb08f0c8a3f04f40253602 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.5.bb b/meta/recipes-connectivity/bind/bind_9.20.6.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.5.bb
rename to meta/recipes-connectivity/bind/bind_9.20.6.bb
index abd2da5249..7a03f8598d 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "19274fd739c023772b4212a0b6c201cf4364855fa7e6a7d3db49693f55db1ab8"
+SRC_URI[sha256sum] = "ed7f54b44f84a7201a2fa7a949f3021ea568529bfad90fca664fd55c05104134"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.44.1


--===============0252685266338882869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libns-9.20.5.so /usr/lib/.debug/libisccfg-9.20.5.so /usr/lib/.debug/libisccc-9.20.5.so /usr/lib/.debug/libdns-9.20.5.so /usr/lib/.debug/libisc-9.20.5.so", added "/usr/lib/.debug/libns-9.20.6.so /usr/lib/.debug/libisccfg-9.20.6.so /usr/lib/.debug/libdns-9.20.6.so /usr/lib/.debug/libisccc-9.20.6.so /usr/lib/.debug/libisc-9.20.6.so"
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 14997208 to 15032464 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind-dev: FILELIST: added "/usr/include/dns/ede.h"
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1584477 to 1587039 (+0%)
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.20.5.so /usr/lib/libdns-9.20.5.so /usr/lib/libisc-9.20.5.so /usr/lib/libisccc-9.20.5.so /usr/lib/libisccfg-9.20.5.so", added "/usr/lib/libns-9.20.6.so /usr/lib/libdns-9.20.6.so /usr/lib/libisc-9.20.6.so /usr/lib/libisccc-9.20.6.so /usr/lib/libisccfg-9.20.6.so"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.5.so", added "/usr/lib/*-9.20.6.so"
packages/core2-64-poky-linux/bind/bind-libs: PKGSIZE changed from 3487056 to 3491152 (+0%)
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.5/bin/nsupdate -> /usr/src/debug/bind/9.20.6/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.5/bin/tools -> /usr/src/debug/bind/9.20.6/bin/tools, directory renamed /usr/src/debug/bind/9.20.5/bin/delv -> /usr/src/debug/bind/9.20.6/bin/delv, directory renamed /usr/src/debug/bind/9.20.5/lib/ns/include/ns -> /usr/src/debug/bind/9.20.6/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.5/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.6/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.5/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.6/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.5/bin/named -> /usr/src/debug/bind/9.20.6/bin/named, directory renamed /usr/src/debug/bind/9.20.5/bin/named/include/named -> /usr/src/debug/bind/9.20.6/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.5/bin/named/include/dlz -
 > /usr/src/debug/bind/9.20.6/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.5/bin/rndc -> /usr/src/debug/bind/9.20.6/bin/rndc, directory renamed /usr/src/debug/bind/9.20.5/lib/isc/netmgr -> /usr/src/debug/bind/9.20.6/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.5/bin/confgen -> /usr/src/debug/bind/9.20.6/bin/confgen, directory renamed /usr/src/debug/bind/9.20.5/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.6/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.5/bin/dnssec -> /usr/src/debug/bind/9.20.6/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.5/lib/isc -> /usr/src/debug/bind/9.20.6/lib/isc, directory renamed /usr/src/debug/bind/9.20.5/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.6/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.5/lib/dns/include/irs -> /usr/src/debug/bind/9.20.6/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.5/lib/isc/include/isc -> /usr/src/debug/bind/9.20.6/lib/isc/in
 clude/isc, directory renamed /usr/src/debug/bind/9.20.5/lib/ns -> /usr/src/debug/bind/9.20.6/lib/ns, directory renamed /usr/src/debug/bind/9.20.5/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.6/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.5/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.6/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.5/lib/dns/include/dst -> /usr/src/debug/bind/9.20.6/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.5/lib/isccfg -> /usr/src/debug/bind/9.20.6/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.5/bin/dig -> /usr/src/debug/bind/9.20.6/bin/dig, directory renamed /usr/src/debug/bind/9.20.5/bin/plugins -> /usr/src/debug/bind/9.20.6/bin/plugins, directory renamed /usr/src/debug/bind/9.20.5/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.6/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.5/lib/isccc -> /usr/src/debug/bind/9.20.6/lib/isccc, directory renamed /usr/src/d
 ebug/bind/9.20.5/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.6/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.5/bin/check -> /usr/src/debug/bind/9.20.6/bin/check, removed "/usr/src/debug/bind/9.20.5/lib/dns/include/dns/name.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/zone.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/result.h /usr/src/debug/bind/9.20.5/lib/dns/gssapictx.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/diff.h /usr/src/debug/bind/9.20.5/lib/dns/zoneverify.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/journal.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/ssu.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdatasetiter.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/nta.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/tsig.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/catz.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdataset.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/sdlz.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/m
 asterdump.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/types.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdata.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/db.h /usr/src/debug/bind/9.20.5/lib/dns/rbt-zonedb.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/dnssec.h /usr/src/debug/bind/9.20.5/lib/dns/compress.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/tkey.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rbt.h /usr/src/debug/bind/9.20.5/lib/dns/private.c /usr/src/debug/bind/9.20.5/lib/dns/validator.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/nsec3.h /usr/src/debug/bind/9.20.5/lib/dns/transport.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/time.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/dns64.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/cert.h /usr/src/debug/bind/9.20.5/lib/dns/nsec.c /usr/src/debug/bind/9.20.5/lib/dns/peer.c /usr/src/debug/bind/9.20.5/lib/dns/sdlz.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/peer.h /usr/src/debug/bind/9.20.5/li
 b/dns/include/dns/dlz_dlopen.h /usr/src/debug/bind/9.20.5/lib/dns/keystore.c /usr/src/debug/bind/9.20.5/lib/dns/ds.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/private.h /usr/src/debug/bind/9.20.5/lib/dns/zt.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/zt.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/keymgr.h /usr/src/debug/bind/9.20.5/lib/dns/master.c /usr/src/debug/bind/9.20.5/lib/dns/masterdump.c /usr/src/debug/bind/9.20.5/lib/dns/nametree.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/enumclass.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/remote.h /usr/src/debug/bind/9.20.5/lib/dns/ecs.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/master.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/stats.h /usr/src/debug/bind/9.20.5/lib/dns/keydata.c /usr/src/debug/bind/9.20.5/lib/dns/rpz.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/dyndb.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/acl.h /usr/src/debug/bind/9.20.5/lib/dns/db.c /usr/src/debug/bind/9.20.5/lib/dns/i
 nclude/dns/dispatch.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/client.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/dbiterator.h /usr/src/debug/bind/9.20.5/lib/dns/openssl_link.c /usr/src/debug/bind/9.20.5/lib/dns/skr.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/transport.h /usr/src/debug/bind/9.20.5/lib/dns/ipkeylist.c /usr/src/debug/bind/9.20.5/lib/dns/rdatalist.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/zonekey.h /usr/src/debug/bind/9.20.5/lib/dns/rbt.c /usr/src/debug/bind/9.20.5/lib/dns/resconf.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/nametree.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdatastruct.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/clientinfo.h /usr/src/debug/bind/9.20.5/lib/dns/qp.c /usr/src/debug/bind/9.20.5/lib/dns/ssu.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/ipkeylist.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/kasp.h /usr/src/debug/bind/9.20.5/lib/dns/qpcache.c /usr/src/debug/bind/9.20.5/lib/dns/rdataset.c /usr/src
 /debug/bind/9.20.5/lib/dns/rootns.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdatalist.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/fixedname.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdataslab.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdatatype.h /usr/src/debug/bind/9.20.5/lib/dns/dbiterator.c /usr/src/debug/bind/9.20.5/lib/dns/rriterator.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/soa.h /usr/src/debug/bind/9.20.5/lib/dns/acl.c /usr/src/debug/bind/9.20.5/lib/dns/cache.c /usr/src/debug/bind/9.20.5/lib/dns/dns64.c /usr/src/debug/bind/9.20.5/lib/dns/dyndb.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/cache.h /usr/src/debug/bind/9.20.5/lib/dns/nsec3.c /usr/src/debug/bind/9.20.5/lib/dns/order.c /usr/src/debug/bind/9.20.5/lib/dns/rbtdb.c /usr/src/debug/bind/9.20.5/lib/dns/rcode.c /usr/src/debug/bind/9.20.5/lib/dns/rdata.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rootns.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/iptable.h /usr/src/debug/bind/9.2
 0.5/lib/dns/include/dns/log.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/order.h /usr/src/debug/bind/9.20.5/lib/dns/opensslrsa_link.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rdataclass.h /usr/src/debug/bind/9.20.5/lib/dns/rbtdb_p.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/dlz.h /usr/src/debug/bind/9.20.5/lib/dns/dispatch.c /usr/src/debug/bind/9.20.5/lib/dns/dst_api.c /usr/src/debug/bind/9.20.5/lib/dns/dlz.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/update.h /usr/src/debug/bind/9.20.5/lib/dns/fixedname.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rcode.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/callbacks.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/validator.h /usr/src/debug/bind/9.20.5/lib/dns/rbt-cachedb.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/dsdigest.h /usr/src/debug/bind/9.20.5/lib/dns/stats.c /usr/src/debug/bind/9.20.5/lib/dns/xfrin.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/compress.h /usr/src/debug/bind/9.20.5/lib/dns/include
 /dns/rrl.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/adb.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/ds.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/view.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/xfrin.h /usr/src/debug/bind/9.20.5/lib/dns/dst_parse.h /usr/src/debug/bind/9.20.5/lib/dns/log.c /usr/src/debug/bind/9.20.5/lib/dns/dst_parse.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/request.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/forward.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rpz.h /usr/src/debug/bind/9.20.5/lib/dns/keytable.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/ncache.h /usr/src/debug/bind/9.20.5/lib/dns/request.c /usr/src/debug/bind/9.20.5/lib/dns/badcache.c /usr/src/debug/bind/9.20.5/lib/dns/nta.c /usr/src/debug/bind/9.20.5/lib/dns/byaddr.c /usr/src/debug/bind/9.20.5/lib/dns/qp_p.h /usr/src/debug/bind/9.20.5/lib/dns/db_p.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/bit.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/ecs.h /u
 sr/src/debug/bind/9.20.5/lib/dns/keymgr.c /usr/src/debug/bind/9.20.5/lib/dns/time.c /usr/src/debug/bind/9.20.5/lib/dns/tkey.c /usr/src/debug/bind/9.20.5/lib/dns/tsig.c /usr/src/debug/bind/9.20.5/lib/dns/view.c /usr/src/debug/bind/9.20.5/lib/dns/zone.c /usr/src/debug/bind/9.20.5/lib/dns/catz.c /usr/src/debug/bind/9.20.5/lib/dns/diff.c /usr/src/debug/bind/9.20.5/lib/dns/dst_openssl.h /usr/src/debug/bind/9.20.5/lib/dns/kasp.c /usr/src/debug/bind/9.20.5/lib/dns/name.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/enumtype.h /usr/src/debug/bind/9.20.5/lib/dns/client.c /usr/src/debug/bind/9.20.5/lib/dns/key.c /usr/src/debug/bind/9.20.5/lib/dns/result.c /usr/src/debug/bind/9.20.5/lib/dns/forward.c /usr/src/debug/bind/9.20.5/lib/dns/adb.c /usr/src/debug/bind/9.20.5/lib/dns/qpzone_p.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/ttl.h /usr/src/debug/bind/9.20.5/lib/dns/ssu_external.c /usr/src/debug/bind/9.20.5/lib/dns/tsig_p.h /usr/src/debug/bind/9.20.5/lib/dns/zone_p.h /usr/src/debug/bin
 d/9.20.5/lib/dns/resolver.c /usr/src/debug/bind/9.20.5/lib/dns/opensslecdsa_link.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/byaddr.h /usr/src/debug/bind/9.20.5/lib/dns/openssleddsa_link.c /usr/src/debug/bind/9.20.5/lib/dns/ncache.c /usr/src/debug/bind/9.20.5/lib/dns/iptable.c /usr/src/debug/bind/9.20.5/lib/dns/qpzone.c /usr/src/debug/bind/9.20.5/lib/dns/remote.c /usr/src/debug/bind/9.20.5/lib/dns/update.c /usr/src/debug/bind/9.20.5/lib/dns/zonekey.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/skr.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/rriterator.h /usr/src/debug/bind/9.20.5/lib/dns/hmac_link.c /usr/src/debug/bind/9.20.5/lib/dns/message.c /usr/src/debug/bind/9.20.5/lib/dns/rdataslab.c /usr/src/debug/bind/9.20.5/lib/dns/journal.c /usr/src/debug/bind/9.20.5/lib/dns/ttl.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/secalg.h /usr/src/debug/bind/9.20.5/lib/dns/qpcache_p.h /usr/src/debug/bind/9.20.5/lib/dns/callbacks.c /usr/src/debug/bind/9.20.5/lib/dns/rdatasetiter.c
  /usr/src/debug/bind/9.20.5/lib/dns/include/dns/keyflags.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/keystore.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/keydata.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/keytable.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/message.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/resolver.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/secproto.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/zoneverify.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/opcode.h /usr/src/debug/bind/9.20.5/lib/dns/dst_internal.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/nsec.h /usr/src/debug/bind/9.20.5/lib/dns/clientinfo.c /usr/src/debug/bind/9.20.5/lib/dns/include/dns/badcache.h /usr/src/debug/bind/9.20.5/lib/dns/include/dns/qp.h /usr/src/debug/bind/9.20.5/lib/dns/rrl.c /usr/src/debug/bind/9.20.5/lib/dns/soa.c /usr/src/debug/bind/9.20.5/lib/dns/dnssec.c", added "/usr/src/debug/bind/9.20.6/lib/dns/include/dns/kasp.h /usr/src/debug/bind/9.20.
 6/lib/dns/qpcache.c /usr/src/debug/bind/9.20.6/lib/dns/rootns.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdatalist.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/fixedname.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdataslab.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdatatype.h /usr/src/debug/bind/9.20.6/lib/dns/tsig.c /usr/src/debug/bind/9.20.6/lib/dns/rriterator.c /usr/src/debug/bind/9.20.6/lib/dns/dbiterator.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/soa.h /usr/src/debug/bind/9.20.6/lib/dns/acl.c /usr/src/debug/bind/9.20.6/lib/dns/cache.c /usr/src/debug/bind/9.20.6/lib/dns/dns64.c /usr/src/debug/bind/9.20.6/lib/dns/dyndb.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/cache.h /usr/src/debug/bind/9.20.6/lib/dns/nsec3.c /usr/src/debug/bind/9.20.6/lib/dns/order.c /usr/src/debug/bind/9.20.6/lib/dns/rbtdb.c /usr/src/debug/bind/9.20.6/lib/dns/rcode.c /usr/src/debug/bind/9.20.6/lib/dns/rdata.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rootns.h /usr/src/d
 ebug/bind/9.20.6/lib/dns/include/dns/iptable.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/log.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/order.h /usr/src/debug/bind/9.20.6/lib/dns/opensslrsa_link.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdataclass.h /usr/src/debug/bind/9.20.6/lib/dns/rbtdb_p.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/dlz.h /usr/src/debug/bind/9.20.6/lib/dns/dispatch.c /usr/src/debug/bind/9.20.6/lib/dns/dst_api.c /usr/src/debug/bind/9.20.6/lib/dns/dlz.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/update.h /usr/src/debug/bind/9.20.6/lib/dns/fixedname.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rcode.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/callbacks.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/validator.h /usr/src/debug/bind/9.20.6/lib/dns/rbt-cachedb.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/dsdigest.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/ede.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/compress.h /usr/
 src/debug/bind/9.20.6/lib/dns/include/dns/rrl.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/adb.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/ds.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/view.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/xfrin.h /usr/src/debug/bind/9.20.6/lib/dns/dst_parse.h /usr/src/debug/bind/9.20.6/lib/dns/log.c /usr/src/debug/bind/9.20.6/lib/dns/dst_parse.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/request.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/forward.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rpz.h /usr/src/debug/bind/9.20.6/lib/dns/keytable.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/ncache.h /usr/src/debug/bind/9.20.6/lib/dns/request.c /usr/src/debug/bind/9.20.6/lib/dns/badcache.c /usr/src/debug/bind/9.20.6/lib/dns/nta.c /usr/src/debug/bind/9.20.6/lib/dns/byaddr.c /usr/src/debug/bind/9.20.6/lib/dns/db_p.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/bit.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/ecs.h /usr/sr
 c/debug/bind/9.20.6/lib/dns/rdataset.c /usr/src/debug/bind/9.20.6/lib/dns/keymgr.c /usr/src/debug/bind/9.20.6/lib/dns/view.c /usr/src/debug/bind/9.20.6/lib/dns/zone.c /usr/src/debug/bind/9.20.6/lib/dns/master.c /usr/src/debug/bind/9.20.6/lib/dns/catz.c /usr/src/debug/bind/9.20.6/lib/dns/diff.c /usr/src/debug/bind/9.20.6/lib/dns/dst_openssl.h /usr/src/debug/bind/9.20.6/lib/dns/kasp.c /usr/src/debug/bind/9.20.6/lib/dns/name.c /usr/src/debug/bind/9.20.6/lib/dns/ede.c /usr/src/debug/bind/9.20.6/lib/dns/nsec.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/enumtype.h /usr/src/debug/bind/9.20.6/lib/dns/client.c /usr/src/debug/bind/9.20.6/lib/dns/key.c /usr/src/debug/bind/9.20.6/lib/dns/result.c /usr/src/debug/bind/9.20.6/lib/dns/forward.c /usr/src/debug/bind/9.20.6/lib/dns/adb.c /usr/src/debug/bind/9.20.6/lib/dns/qpzone_p.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/ttl.h /usr/src/debug/bind/9.20.6/lib/dns/ssu_external.c /usr/src/debug/bind/9.20.6/lib/dns/tsig_p.h /usr/src/debug/bind/
 9.20.6/lib/dns/zone_p.h /usr/src/debug/bind/9.20.6/lib/dns/resolver.c /usr/src/debug/bind/9.20.6/lib/dns/opensslecdsa_link.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/byaddr.h /usr/src/debug/bind/9.20.6/lib/dns/openssleddsa_link.c /usr/src/debug/bind/9.20.6/lib/dns/ncache.c /usr/src/debug/bind/9.20.6/lib/dns/iptable.c /usr/src/debug/bind/9.20.6/lib/dns/qpzone.c /usr/src/debug/bind/9.20.6/lib/dns/remote.c /usr/src/debug/bind/9.20.6/lib/dns/update.c /usr/src/debug/bind/9.20.6/lib/dns/zonekey.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/skr.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rriterator.h /usr/src/debug/bind/9.20.6/lib/dns/qp_p.h /usr/src/debug/bind/9.20.6/lib/dns/hmac_link.c /usr/src/debug/bind/9.20.6/lib/dns/message.c /usr/src/debug/bind/9.20.6/lib/dns/stats.c /usr/src/debug/bind/9.20.6/lib/dns/xfrin.c /usr/src/debug/bind/9.20.6/lib/dns/rdataslab.c /usr/src/debug/bind/9.20.6/lib/dns/journal.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/secalg.h /usr/src/debug
 /bind/9.20.6/lib/dns/qpcache_p.h /usr/src/debug/bind/9.20.6/lib/dns/callbacks.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/keyflags.h /usr/src/debug/bind/9.20.6/lib/dns/rdatasetiter.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/keystore.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/keydata.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/keytable.h /usr/src/debug/bind/9.20.6/lib/dns/peer.c /usr/src/debug/bind/9.20.6/lib/dns/sdlz.c /usr/src/debug/bind/9.20.6/lib/dns/time.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/message.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/resolver.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/zoneverify.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/opcode.h /usr/src/debug/bind/9.20.6/lib/dns/dst_internal.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/nsec.h /usr/src/debug/bind/9.20.6/lib/dns/tkey.c /usr/src/debug/bind/9.20.6/lib/dns/clientinfo.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/badcache.h /usr/src/debug/bind/9.20.6/
 lib/dns/include/dns/qp.h /usr/src/debug/bind/9.20.6/lib/dns/rrl.c /usr/src/debug/bind/9.20.6/lib/dns/soa.c /usr/src/debug/bind/9.20.6/lib/dns/dnssec.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/name.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/zone.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/result.h /usr/src/debug/bind/9.20.6/lib/dns/gssapictx.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/diff.h /usr/src/debug/bind/9.20.6/lib/dns/zoneverify.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/journal.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/ssu.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdatasetiter.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/nta.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/tsig.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/catz.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdataset.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/sdlz.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/masterdump.h /usr/src/debug/bind/9.20.6/l
 ib/dns/include/dns/types.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdata.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/db.h /usr/src/debug/bind/9.20.6/lib/dns/rbt-zonedb.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/dnssec.h /usr/src/debug/bind/9.20.6/lib/dns/compress.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/tkey.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rbt.h /usr/src/debug/bind/9.20.6/lib/dns/private.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/secproto.h /usr/src/debug/bind/9.20.6/lib/dns/validator.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/nsec3.h /usr/src/debug/bind/9.20.6/lib/dns/transport.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/time.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/dns64.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/cert.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/dlz_dlopen.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/peer.h /usr/src/debug/bind/9.20.6/lib/dns/keystore.c /usr/src/debug/bind/9.20.6/lib/
 dns/ds.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/private.h /usr/src/debug/bind/9.20.6/lib/dns/zt.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/zt.h /usr/src/debug/bind/9.20.6/lib/dns/ttl.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/keymgr.h /usr/src/debug/bind/9.20.6/lib/dns/masterdump.c /usr/src/debug/bind/9.20.6/lib/dns/nametree.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/enumclass.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/remote.h /usr/src/debug/bind/9.20.6/lib/dns/ecs.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/master.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/stats.h /usr/src/debug/bind/9.20.6/lib/dns/keydata.c /usr/src/debug/bind/9.20.6/lib/dns/rpz.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/dyndb.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/acl.h /usr/src/debug/bind/9.20.6/lib/dns/db.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/dispatch.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/client.h /usr/src/debug/bind/9.20.6/lib/dn
 s/include/dns/dbiterator.h /usr/src/debug/bind/9.20.6/lib/dns/openssl_link.c /usr/src/debug/bind/9.20.6/lib/dns/skr.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/transport.h /usr/src/debug/bind/9.20.6/lib/dns/ipkeylist.c /usr/src/debug/bind/9.20.6/lib/dns/rdatalist.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/zonekey.h /usr/src/debug/bind/9.20.6/lib/dns/rbt.c /usr/src/debug/bind/9.20.6/lib/dns/resconf.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/nametree.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/rdatastruct.h /usr/src/debug/bind/9.20.6/lib/dns/include/dns/clientinfo.h /usr/src/debug/bind/9.20.6/lib/dns/qp.c /usr/src/debug/bind/9.20.6/lib/dns/ssu.c /usr/src/debug/bind/9.20.6/lib/dns/include/dns/ipkeylist.h"
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9972246 to 9983969 (+0%)
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.20.5" to "9.20.6"
packages/core2-64-poky-linux/bind: PKGV changed from 9.20.5 [default] to 9.20.6 [default]
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.5/bind-9.20.5.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.6/bind-9.20.6.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.5.so to libdns-9.20.6.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.5.so to libisccc-9.20.6.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.5.so to libisccfg-9.20.6.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.5.so to libisc-9.20.6.so
  /usr/lib/libns.so changed symlink target from libns-9.20.5.so to libns-9.20.6.so
  /usr/lib/libdns-9.20.5.so moved to /usr/lib/libdns-9.20.6.so
  /usr/lib/libisc-9.20.5.so moved to /usr/lib/libisc-9.20.6.so
  /usr/lib/libisccc-9.20.5.so moved to /usr/lib/libisccc-9.20.6.so
  /usr/lib/libisccfg-9.20.5.so moved to /usr/lib/libisccfg-9.20.6.so
  /usr/lib/libns-9.20.5.so moved to /usr/lib/libns-9.20.6.so
  /usr/include/dns/ede.h was added

--===============0252685266338882869==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.5-9.20.6.patch"

RnJvbSBjMjk3NzRiMjFhZDAzOWMwZDllZDY4MzdlYjNjZWY0Zjc2YjQxNzEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNjozNzozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC41IC0+IDkuMjAuNgoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEtYXZv
aWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8IDQg
KystLQogLi4uYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMt
c3lzci5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
Y29uZi5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL2JpbmQvaW5pdC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgfCAyICstCiAuLi4vYmluZC9i
aW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICAgICAgICAgICAgIHwgMiAr
LQogLi4uL2JpbmQve2JpbmRfOS4yMC41LmJiID0+IGJpbmRfOS4yMC42LmJifSAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjIw
LjUuYmIgPT4gYmluZF85LjIwLjYuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmlu
ZC11c2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1h
dm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCmluZGV4IDBkNjcwZWRkYTYu
LjU2YjNlZjFmNTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1
cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBhNDU5MzVmOWQx
MjA3NTM1ZjgzZGY2MmVkNTJmMzU4ZWQ1NDZiYmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGE1OWVjNzE1MGRhNTNiZGM0ZDY4MDdjOGI5N2M2ZWJjNWFhZTg2MmMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBNb24sIDE1IE9jdCAyMDE4IDE2OjU1OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lk
IHN0YXJ0IGZhaWx1cmUgd2l0aCBiaW5kIHVzZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1o
aWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25z
LnBhdGNoCmluZGV4IDEwYjhjYWFmYmIuLmIyYzhiZjM3ODggMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0
LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVp
bGQtb3B0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGQ0ODRiMGJkNTg4MzJmYzI0
MWFmZGM4ZWEwNTY5MzIyODM0ODM1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjlh
ODc1YmY3MDc0MTlkYjQ4NzczZWQ4NjIxYzQzZTlmOGNkYjE1NSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6
IE1vbiwgMjcgQXVnIDIwMTggMjE6MjQ6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYG5hbWVk
L2x3cmVzZCAtVicgYW5kIHN0YXJ0IGxvZyBoaWRlIGJ1aWxkIG9wdGlvbnMKQEAgLTIwLDcgKzIw
LDcgQEAgU2lnbmVkLW9mZi1ieTogQXJtaW4gS3VzdGVyIDxha3VzdGVyQG12aXN0YS5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDEzZjlkN2YuLjY1MTZkMGQg
MTAwNjQ0CitpbmRleCA1NmQ3OTRiLi5iMGY4ZWRmIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFj
CiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNSw3ICszNSw3IEBAIEFDX0RFRklORShbUEFDS0FH
RV9WRVJTSU9OX0VYVFJBXSwgWyJdW2JpbmRfVkVSU0lPTl9FWFRSQV1bIl0sIFtCSU5EIDkgRXh0
cmEgcGFyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9i
aW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNo
aW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAppbmRleCA0OWIwYTVlZWEx
Li44M2FmOGQwMjM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNy
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5z
dXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDlhMDZkYmY4MzFmMDEyYzYwMTkyMzc1MjdkMmJmMWFhN2EzYTU0M2Eg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDliMGU2NzNmZmMxMjNiN2E1OTcyMjFkYzlm
MTliZDAxZjkyYjBiNWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEdvcnRt
YWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAx
NSAxMToyMjowMCAtMDQwMAogU3ViamVjdDogW1BBVENIXSBiaW5kOiBlbnN1cmUgc2VhcmNoaW5n
IGZvciBqc29uIGhlYWRlcnMgc2VhcmNoZXMgc3lzcm9vdApAQCAtMzIsNyArMzIsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMTY4YTc3YS4uMTNmOWQ3
ZiAxMDA2NDQKK2luZGV4IGY0YjllYzMuLjU2ZDc5NGIgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUu
YWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTg2Myw3ICs4NjMsNyBAQCBBU19DQVNFKFskd2l0
aF9sbWRiXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
L2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBh
dGNoCmluZGV4IDE2YWM1MTBjZmEuLjM5OGI4MDQ0NjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjdk
MTExM2E0YzM3ODU4M2UwZmNmZjkxZDcwMjU2YmRjZDc4ZGUwYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODAwZWNmYzIxODQyMzhiNzhlYzVjMDMxNzNmNmFkODU1YzZmODY2NiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgog
RGF0ZTogVHVlLCAzMCBOb3YgMjAxMCAxMzozNTo0MiArMDgwMAogU3ViamVjdDogW1BBVENIXSBi
aW5kOiBhZGQgbmV3IHJlY2lwZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0
LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmluZGV4IGJhZWVhZmUzM2UuLjMxN2QyNGU2MjIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1y
b290ZnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFmYTRkMGViOTYzMTc3MWJkNzUxZjA0
Y2U4OTg0MzM1ODA5OTZlNWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZkNGRlZGQw
OWVhMWU4M2Q0OWRlMWMyNzFmMDg5OTUyZDJlOGRlZWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDI3IE1h
ciAyMDE0IDAyOjM0OjQxICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluaXQuZDogYWRkIHN1cHBv
cnQgZm9yIHJlYWQtb25seSByb290ZnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9w
LXdvcmsucGF0Y2gKaW5kZXggOTNhYTMwNDEyNi4uMjBjZDJlZDc3ZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9w
LXdvcmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFr
ZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJl
YTJlNGU1MDJlNTg0MGQ1MmU3NjQ2MWUwNzE4ODJjYzY1ZjE3NjYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGRmOWIwNDE3MjMyZjQ4YjAzNWJiMDhmMGM4YTNmMDRmNDAyNTM2MDIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUaHUsIDE1IE5vdiAyMDEyIDAyOjI3OjU0ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2JpbmQgc3RvcCIgd29yawpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC41LmJiIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC42LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAu
NS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC42
LmJiCmluZGV4IGFiZDJkYTUyNDkuLjdhMDNmODU5OGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjYuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9
ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQt
dXNlci5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE5Mjc0
ZmQ3MzljMDIzNzcyYjQyMTJhMGI2YzIwMWNmNDM2NDg1NWZhN2U2YTdkM2RiNDk2OTNmNTVkYjFh
YjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWQ3ZjU0YjQ0Zjg0YTcyMDFhMmZhN2E5NDlmMzAy
MWVhNTY4NTI5YmZhZDkwZmNhNjY0ZmQ1NWMwNTEwNDEzNCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93IHRoZSBFU1YgdmVy
c2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDQuMQoK

--===============0252685266338882869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-dev: FILELIST: added "/usr/include/dns/ede.h"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.5.so /usr/lib/libisc-9.20.5.so /usr/lib/libisccc-9.20.5.so /usr/lib/libisccfg-9.20.5.so /usr/lib/libns-9.20.5.so", added "/usr/lib/libdns-9.20.6.so /usr/lib/libisc-9.20.6.so /usr/lib/libisccc-9.20.6.so /usr/lib/libns-9.20.6.so /usr/lib/libisccfg-9.20.6.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.5.so to libdns-9.20.6.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.5.so to libisccc-9.20.6.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.5.so to libisccfg-9.20.6.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.5.so to libisc-9.20.6.so
  /usr/lib/libns.so changed symlink target from libns-9.20.5.so to libns-9.20.6.so
  /usr/lib/libdns-9.20.5.so moved to /usr/lib/libdns-9.20.6.so
  /usr/lib/libisc-9.20.5.so moved to /usr/lib/libisc-9.20.6.so
  /usr/lib/libisccc-9.20.5.so moved to /usr/lib/libisccc-9.20.6.so
  /usr/lib/libisccfg-9.20.5.so moved to /usr/lib/libisccfg-9.20.6.so
  /usr/lib/libns-9.20.5.so moved to /usr/lib/libns-9.20.6.so
  /usr/include/dns/ede.h was added

--===============0252685266338882869==--


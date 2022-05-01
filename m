Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49388C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.2251.1651434542023789292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=R7XNeODP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180812b4f80-8a7aeee7-d7aa-4381-bd1f-5ba8d8f060dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v+POo1cvKbHtIeEi9/GC6Psv2AZQeOUHucIxKPoggqc=;
	b=R7XNeODPICDI2YHN70zK0GwE73W+X7BufFadG+XcETrdkCtl4vDziRupb3va2DoD
	0Tum25fT81QMBevMCEq0g5vy6cYhaT970OaSwN6UM6PSYcK+cVLJbkqbBYnU0IWonce
	XhdzLnStDqFOGyumXKjs2L54yw7i8a9T+St+Kz60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v+POo1cvKbHtIeEi9/GC6Psv2AZQeOUHucIxKPoggqc=;
	b=KnrRCNEZxS+6AnffH1Sh0krYzLUxwIF7vrpRYbiA0EydgqwxO2A7HzaO3gi912zr
	p3NSZ3U2w3LMphwGVPKtEL6hJQkr1uT6wlxB7avwnNoYv83cOh+kl04VROgP1razupD
	i1AFwL+pfgt6Cp/LCAxjYhFApNJOB/3pxVOwGgEc=
Content-Type: multipart/mixed; boundary="===============5966393198246276249=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.2 SUCCEEDED
Message-ID: 
 <01010180812b4f80-8a7aeee7-d7aa-4381-bd1f-5ba8d8f060dd-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165093

--===============5966393198246276249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.1-9.18.2.patch
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
--===============5966393198246276249==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.1-9.18.2.patch"

From 5649f8f780782cf629b3554921852b6b01a4f1ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 06:43:24 +0000
Subject: [PATCH] bind: upgrade 9.18.1 -> 9.18.2

---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/bind9                     | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/conf.patch                | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.1 => bind-9.18.2}/named.service             | 0
 .../bind/{bind_9.18.1.bb => bind_9.18.2.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.1.bb => bind_9.18.2.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/bind9 b/meta/recipes-connectivity/bind/bind-9.18.2/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.2/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.1/named.service b/meta/recipes-connectivity/bind/bind-9.18.2/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.1/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.2/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.1.bb b/meta/recipes-connectivity/bind/bind_9.18.2.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.18.1.bb
rename to meta/recipes-connectivity/bind/bind_9.18.2.bb
index 6aa832f8f5..1c77aceb9f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "57c7afd871694d615cb4defb1c1bd6ed023350943d7458414db8d493ef560427"
+SRC_URI[sha256sum] = "2e4b38779bba0a23ee634fdf7c525fd9794c41d692bfd83cda25823a2a3ed969"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.27.0


--===============5966393198246276249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/hp.h /usr/include/isc/queue.h"
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.18.1.so /usr/lib/libisccfg-9.18.1.so /usr/lib/libbind9-9.18.1.so /usr/lib/libisccc-9.18.1.so /usr/lib/libisc-9.18.1.so /usr/lib/libdns-9.18.1.so /usr/lib/libirs-9.18.1.so", added "/usr/lib/libirs-9.18.2.so /usr/lib/libdns-9.18.2.so /usr/lib/libbind9-9.18.2.so /usr/lib/libns-9.18.2.so /usr/lib/libisccfg-9.18.2.so /usr/lib/libisccc-9.18.2.so /usr/lib/libisc-9.18.2.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.1.so to libbind9-9.18.2.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.1.so to libdns-9.18.2.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.1.so to libirs-9.18.2.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.1.so to libisccc-9.18.2.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.1.so to libisccfg-9.18.2.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.1.so to libisc-9.18.2.so
  /usr/lib/libns.so changed symlink target from libns-9.18.1.so to libns-9.18.2.so
  /usr/lib/libbind9-9.18.1.so moved to /usr/lib/libbind9-9.18.2.so
  /usr/lib/libdns-9.18.1.so moved to /usr/lib/libdns-9.18.2.so
  /usr/lib/libirs-9.18.1.so moved to /usr/lib/libirs-9.18.2.so
  /usr/lib/libisc-9.18.1.so moved to /usr/lib/libisc-9.18.2.so
  /usr/lib/libisccc-9.18.1.so moved to /usr/lib/libisccc-9.18.2.so
  /usr/lib/libisccfg-9.18.1.so moved to /usr/lib/libisccfg-9.18.2.so
  /usr/lib/libns-9.18.1.so moved to /usr/lib/libns-9.18.2.so
  /usr/include/isc/hp.h was removed
  /usr/include/isc/queue.h was removed

--===============5966393198246276249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 11089772 to 11017528 (-1%)
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisc-9.18.1.so /usr/lib/.debug/libns-9.18.1.so /usr/lib/.debug/libisccfg-9.18.1.so /usr/lib/.debug/libisccc-9.18.1.so /usr/lib/.debug/libdns-9.18.1.so /usr/lib/.debug/libirs-9.18.1.so /usr/lib/.debug/libbind9-9.18.1.so", added "/usr/lib/.debug/libisccc-9.18.2.so /usr/lib/.debug/libisccfg-9.18.2.so /usr/lib/.debug/libisc-9.18.2.so /usr/lib/.debug/libbind9-9.18.2.so /usr/lib/.debug/libdns-9.18.2.so /usr/lib/.debug/libirs-9.18.2.so /usr/lib/.debug/libns-9.18.2.so"
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1447974 to 1442788 (-0%)
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/queue.h /usr/include/isc/hp.h"
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 304209 to 307230 (+1%)
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.1.so", added "/usr/lib/*-9.18.2.so"
packages/core2-32-poky-linux/bind/bind-libs: PKGSIZE changed from 6364496 to 6323536 (-1%)
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.18.1.so /usr/lib/libirs-9.18.1.so /usr/lib/libbind9-9.18.1.so /usr/lib/libdns-9.18.1.so /usr/lib/libisccc-9.18.1.so /usr/lib/libns-9.18.1.so /usr/lib/libisc-9.18.1.so", added "/usr/lib/libisccfg-9.18.2.so /usr/lib/libirs-9.18.2.so /usr/lib/libdns-9.18.2.so /usr/lib/libns-9.18.2.so /usr/lib/libisc-9.18.2.so /usr/lib/libisccc-9.18.2.so /usr/lib/libbind9-9.18.2.so"
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9493893 to 9460306 (-0%)
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/nsupdate -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/nsupdate, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/named/include/named -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/named/include/named, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isccfg -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isccfg, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/bind9/include/bind9 -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/bind9/include/bind9, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/ns/include/ns -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns/rdata/generic -> /usr/
 src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns/include/dst -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isccc -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isccc, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/plugins -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/plugins, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/check -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/check, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/bind9 -> /usr/src/debug/bind/9.18.2-r0/bind
 -9.18.2/lib/bind9, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isccc/include/isccc -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.18.1-r0/build/bin/named -> /usr/src/debug/bind/9.18.2-r0/build/bin/named, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/dnssec -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/dnssec, directory renamed /usr/src/debug/bind/9.18.1-r0/build/lib/dns/include/dns -> /usr/src/debug/bind/9.18.2-r0/build/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/irs/include/irs -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/irs/include/irs, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/dig -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/dig, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/irs -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/irs, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.
 1/bin/delv -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/delv, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/rndc -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/rndc, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/tools -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/tools, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/named -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/named, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns/include/dns -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/ns -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib
 /ns, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/netmgr -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/confgen -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/confgen, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/confgen/include/confgen -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/dns -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/dns, directory renamed /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/bin/named/include/dlz -> /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/bin/named/include/dlz, removed "/usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/hash.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/result.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/task.c /usr/src/debug/bind/9.18.1
 -r0/bind-9.18.1/lib/isc/include/isc/managers.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/iterated_hash.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/random.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/event.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/glob.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/stdio.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/bind9.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/mutexblock.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/pool.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/crc64.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/netaddr.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/netscope.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/resource.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/url.c /usr/
 src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/hash.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/netscope.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/log.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/errno2result.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/timer_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/taskpool.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/httpd.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/time.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/stdtime.c /usr/s
 rc/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/httpd.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/os.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/siphash.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/tls.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/task.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/error.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/task_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/error.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/glob.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/utf8.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/buffer.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/pool.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/dir.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/lib.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/tls.h /usr/src/debug/b
 ind/9.18.1-r0/bind-9.18.1/lib/isc/file.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/hex.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/tm.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/result.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/string.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/astack.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/managers.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/safe.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/entropy.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/file.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1
 /lib/isc/timer.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/netaddr.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/nonce.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/errno.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/ratelimiter.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/condition.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/once.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/base64.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/md.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/net.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/tm.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/rwlock.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/hmac.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/taskpool.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/net.h
  /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/commandline.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/safe.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/heap.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/timer.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/condition.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/fsaccess_common.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/bind9.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/hp.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/netmgr_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/errno2result.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/string.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/syslog.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/r
 esource.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/base32.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/thread.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/backtrace.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/rwlock.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/dir.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/region.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/mem.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/queue.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/offset.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/hp.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/queue.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/meminfo.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/fsaccess.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/parseint.c /usr/src/debug/bind/9.18.1-r0
 /bind-9.18.1/lib/isc/ratelimiter.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/fsaccess_common_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/lex.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/os_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/meminfo.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/iterated_hash.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/quota.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/stats.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/stats.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/md.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/mutex.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/event.h /usr/src/debug/bind/9.18.1-r0/bind-
 9.18.1/lib/isc/include/isc/fsaccess.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/ht.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/assertions.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/types.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/utf8.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/log.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/mutexblock.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/entropy_private.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/time.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/radix.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/counter.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/symtab.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/portset.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/syslo
 g.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/mem_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/aes.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/sockaddr.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/os.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/random.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/tls_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/region.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/nonce.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/trampoline.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/aes.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/app.h /usr/src/debug/bind/9.18.1-r0/bi
 nd-9.18.1/lib/isc/include/isc/url.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/app.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/astack.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/symtab.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/regex.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/trampoline_p.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/serial.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/serial.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/interfaceiter.c /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/include/isc/radix.h /usr/src/debug/bind/9.18.1-r0/bind-9.18.1/lib/isc/ht.c", added "/usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/syslog.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/astack.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/mem_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/task.h /usr/src
 /debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/tls_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/heap.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/stdio.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/entropy.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/bind9.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/syslog.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/netaddr.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/nonce.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/os_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/stdtime.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/quota.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/task.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/task_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/mutexblock.h /usr/src/d
 ebug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/result.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/base64.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/lib.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/stats.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/netaddr.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/trampoline.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/mutexblock.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/serial.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/app.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/pool.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/sockaddr.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/log.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/fsaccess_common.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/errno2result.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/is
 c/meminfo.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/string.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/meminfo.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/iterated_hash.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/os.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/serial.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/hex.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/counter.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/timer.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/url.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/managers.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/commandline.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/entropy_private.h /usr/src/debu
 g/bind/9.18.2-r0/bind-9.18.2/lib/isc/crc64.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/interfaceiter.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/errno2result.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/rwlock.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/mem.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/tm.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/trampoline_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/errno.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/iterated_hash.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/symtab.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/ratelimiter.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/result.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/tm.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc
 /aes.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/regex.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/fsaccess.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/condition.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/url.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/tls.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/region.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/fsaccess.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/taskpool.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/assertions.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/ht.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/glob.c /usr/src/d
 ebug/bind/9.18.2-r0/bind-9.18.2/lib/isc/time.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/event.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/file.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/netmgr_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/fsaccess_common_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/lex.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/ratelimiter.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/bind9.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/hmac.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/httpd.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/offset.h /usr/src/debug/bind/9.18.2
 -r0/bind-9.18.2/lib/isc/safe.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/glob.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/ht.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/time.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/timer.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/backtrace.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/string.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/httpd.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/utf8.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/region.h /usr/sr
 c/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/event.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/dir.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/radix.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/resource.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/resource.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/net.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/pool.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/safe.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/log.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/utf8.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/astack.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/parseint.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/siphash.c /usr/src/debug/bind/9.18.2-r0/bind
 -9.18.2/lib/isc/include/isc/file.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/dir.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/md.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/base32.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/app.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/netscope.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/error.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/hash.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/net.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/types.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/taskpool.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/thread.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/tls.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include
 /isc/nonce.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/random.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/radix.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/aes.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/error.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/buffer.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/portset.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/rwlock.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/once.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/hash.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/random.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/
 symtab.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/mutex.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/md.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/netscope.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/timer_p.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/managers.h /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/condition.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/os.c /usr/src/debug/bind/9.18.2-r0/bind-9.18.2/lib/isc/include/isc/stats.h"
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind-utils: PKGSIZE changed from 450664 to 458856 (+2%)
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind/bind: PKGSIZE changed from 1179112 to 1179144 (+0%)
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.1/bind-9.18.1.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.2/bind-9.18.2.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PV changed from "9.18.1" to "9.18.2"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.1 [default] to 9.18.2 [default]
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.1.so to libbind9-9.18.2.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.1.so to libdns-9.18.2.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.1.so to libirs-9.18.2.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.1.so to libisccc-9.18.2.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.1.so to libisccfg-9.18.2.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.1.so to libisc-9.18.2.so
  /usr/lib/libns.so changed symlink target from libns-9.18.1.so to libns-9.18.2.so
  /usr/lib/libbind9-9.18.1.so moved to /usr/lib/libbind9-9.18.2.so
  /usr/lib/libdns-9.18.1.so moved to /usr/lib/libdns-9.18.2.so
  /usr/lib/libirs-9.18.1.so moved to /usr/lib/libirs-9.18.2.so
  /usr/lib/libisc-9.18.1.so moved to /usr/lib/libisc-9.18.2.so
  /usr/lib/libisccc-9.18.1.so moved to /usr/lib/libisccc-9.18.2.so
  /usr/lib/libisccfg-9.18.1.so moved to /usr/lib/libisccfg-9.18.2.so
  /usr/lib/libns-9.18.1.so moved to /usr/lib/libns-9.18.2.so
  /usr/include/isc/hp.h was removed
  /usr/include/isc/queue.h was removed

--===============5966393198246276249==--


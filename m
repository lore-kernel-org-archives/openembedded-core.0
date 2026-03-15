Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CADEFCBBF
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28967.1773582114873782959
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UQH3YI6+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bR8fBKLA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019cf1bb5d8b-3e636939-a2eb-4c79-b4ec-5a0cbc78c58c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YotW7yLWm8/CjuuK5TZqiE1Dm1O/OBE7BooueYoERbw=;
	b=UQH3YI6+KzHBLGSlDt3ahYo67FC/CjzyiG7soSznAWcW5emOhNGiWozzpwoRXmNs
	Px0WFbbJEzAkQ5b3R60aTb0PEsNRr27M6f3zqqk7zCfjEPRhuPvYMD2N5axbyaNGGva
	yvOIxT/kIcviXPN5KOgbehGMhyWuZcxH7Y26Td24=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YotW7yLWm8/CjuuK5TZqiE1Dm1O/OBE7BooueYoERbw=;
	b=bR8fBKLA2inpUv2XO6jzCo6P7L//9/dI08UGQhAUx2m/22a8Pf6TxytddtUz1B+r
	q1Dzs6ojGwTmVMQdV9VxA6ZaMzJzqmgoVnGGRMl14yaTGU1mtsokxAs5gyErVSFxl8I
	tKHsoYsDUUl3Y2s6tx8MHr0oMfUGYdEhKdumEihI=
Content-Type: multipart/mixed; boundary="===============7353589092051152112=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.20 SUCCEEDED
Message-ID: <0101019cf1bb5d8b-3e636939-a2eb-4c79-b4ec-5a0cbc78c58c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233131

--===============7353589092051152112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.18-9.20.20.patch
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
From 70c8ba57ede3e9f1d7f4ec046f6f68ad284860bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 06:06:33 +0000
Subject: [PATCH] bind: upgrade 9.20.18 -> 9.20.20

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.18.bb => bind_9.20.20.bb}                 | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.18.bb => bind_9.20.20.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4fa377a594..1ba9aa7499 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From d6a0ef6ee3854cb8d4d1cea3bd1c4da88b59d274 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86..877413462d 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From 58b1972a81dd0849058a4a0e1a26a5e15bf16967 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index a4e7a34..8780f36 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0..eab5b6e1ba 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From 3c1178565153e05c7819015167f73628f56099d1 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index b8f57bb..a4e7a34 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index ec22fe84c4..fb0609bb18 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From e7975ed62510349f240df8e3ef8fd2cab11f6377 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index fd96d46448..c485e04f10 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From 945c24224efa3184263e0de461106b085061f287 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 155cc5a110..709b50a54b 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From 780bd826781cea9bce1f94fd065b1e929a030750 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.18.bb b/meta/recipes-connectivity/bind/bind_9.20.20.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.18.bb
rename to meta/recipes-connectivity/bind/bind_9.20.20.bb
index 3a7cff614f..b42c109105 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.18.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.20.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "dfc546c990ac4515529cd45c4dd995862b18ae8a2d0cb29208e8896a5d325331"
+SRC_URI[sha256sum] = "19b8335d25305231d5eb8f7d924240d1ac97c4da7c93eaa6273503133aa6106a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============7353589092051152112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 15850736 to 15883496 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libns-9.20.18.so /usr/lib/.debug/libdns-9.20.18.so /usr/lib/.debug/libisccfg-9.20.18.so /usr/lib/.debug/libisc-9.20.18.so /usr/lib/.debug/libisccc-9.20.18.so", added "/usr/lib/.debug/libns-9.20.20.so /usr/lib/.debug/libdns-9.20.20.so /usr/lib/.debug/libisc-9.20.20.so /usr/lib/.debug/libisccc-9.20.20.so /usr/lib/.debug/libisccfg-9.20.20.so"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1599165 to 1603388 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGSIZE changed from 3552984 to 3557096 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.18.so /usr/lib/libdns-9.20.18.so /usr/lib/libisccfg-9.20.18.so /usr/lib/libisc-9.20.18.so /usr/lib/libns-9.20.18.so", added "/usr/lib/libdns-9.20.20.so /usr/lib/libisccfg-9.20.20.so /usr/lib/libisccc-9.20.20.so /usr/lib/libisc-9.20.20.so /usr/lib/libns-9.20.20.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.18.so", added "/usr/lib/*-9.20.20.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10059493 to 10081900 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.18/lib/dns -> /usr/src/debug/bind/9.20.20/lib/dns, directory renamed /usr/src/debug/bind/9.20.18/lib/isccc -> /usr/src/debug/bind/9.20.20/lib/isccc, directory renamed /usr/src/debug/bind/9.20.18/bin/check -> /usr/src/debug/bind/9.20.20/bin/check, directory renamed /usr/src/debug/bind/9.20.18/bin/named/include/named -> /usr/src/debug/bind/9.20.20/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.18/lib/dns/include/irs -> /usr/src/debug/bind/9.20.20/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.18/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.20/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.18/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.20/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.18/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.20/bin/confgen/include/confgen, directory renamed /usr/
 src/debug/bind/9.20.18/lib/dns/include/dst -> /usr/src/debug/bind/9.20.20/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.18/bin/rndc -> /usr/src/debug/bind/9.20.20/bin/rndc, directory renamed /usr/src/debug/bind/9.20.18/bin/plugins -> /usr/src/debug/bind/9.20.20/bin/plugins, directory renamed /usr/src/debug/bind/9.20.18/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.20/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.18/bin/delv -> /usr/src/debug/bind/9.20.20/bin/delv, directory renamed /usr/src/debug/bind/9.20.18/lib/isc/netmgr -> /usr/src/debug/bind/9.20.20/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.18/lib/ns/include/ns -> /usr/src/debug/bind/9.20.20/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.18/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.20/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.18/bin/nsupdate -> /usr/src/debug/bind/9.20.20/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.18/lib/
 isc/include/isc -> /usr/src/debug/bind/9.20.20/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.18/bin/dig -> /usr/src/debug/bind/9.20.20/bin/dig, directory renamed /usr/src/debug/bind/9.20.18/lib/ns -> /usr/src/debug/bind/9.20.20/lib/ns, directory renamed /usr/src/debug/bind/9.20.18/lib/isc -> /usr/src/debug/bind/9.20.20/lib/isc, directory renamed /usr/src/debug/bind/9.20.18/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.20/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.18/lib/dns/include/dns -> /usr/src/debug/bind/9.20.20/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.18/bin/named/include/dlz -> /usr/src/debug/bind/9.20.20/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.18/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.20/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.18/bin/tools -> /usr/src/debug/bind/9.20.20/bin/tools, directory renamed /usr/src/debug/bind/9.20.18/bin/confgen -> /u
 sr/src/debug/bind/9.20.20/bin/confgen, directory renamed /usr/src/debug/bind/9.20.18/lib/isccfg -> /usr/src/debug/bind/9.20.20/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.18/bin/named -> /usr/src/debug/bind/9.20.20/bin/named, directory renamed /usr/src/debug/bind/9.20.18/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.20/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.18/bin/dnssec -> /usr/src/debug/bind/9.20.20/bin/dnssec
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.18" to "9.20.20"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.18/bind-9.20.18.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.20/bind-9.20.20.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.18 [default] to 9.20.20 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.18" to "9.20.20"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.18.so to libdns-9.20.20.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.18.so to libisccc-9.20.20.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.18.so to libisccfg-9.20.20.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.18.so to libisc-9.20.20.so
  /usr/lib/libns.so changed symlink target from libns-9.20.18.so to libns-9.20.20.so
  /usr/lib/libdns-9.20.18.so moved to /usr/lib/libdns-9.20.20.so
  /usr/lib/libisc-9.20.18.so moved to /usr/lib/libisc-9.20.20.so
  /usr/lib/libisccc-9.20.18.so moved to /usr/lib/libisccc-9.20.20.so
  /usr/lib/libisccfg-9.20.18.so moved to /usr/lib/libisccfg-9.20.20.so
  /usr/lib/libns-9.20.18.so moved to /usr/lib/libns-9.20.20.so

--===============7353589092051152112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.18.so /usr/lib/libdns-9.20.18.so /usr/lib/libisc-9.20.18.so /usr/lib/libns-9.20.18.so /usr/lib/libisccc-9.20.18.so", added "/usr/lib/libdns-9.20.20.so /usr/lib/libisc-9.20.20.so /usr/lib/libns-9.20.20.so /usr/lib/libisccfg-9.20.20.so /usr/lib/libisccc-9.20.20.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.18.so to libdns-9.20.20.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.18.so to libisccc-9.20.20.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.18.so to libisccfg-9.20.20.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.18.so to libisc-9.20.20.so
  /usr/lib/libns.so changed symlink target from libns-9.20.18.so to libns-9.20.20.so
  /usr/lib/libdns-9.20.18.so moved to /usr/lib/libdns-9.20.20.so
  /usr/lib/libisc-9.20.18.so moved to /usr/lib/libisc-9.20.20.so
  /usr/lib/libisccc-9.20.18.so moved to /usr/lib/libisccc-9.20.20.so
  /usr/lib/libisccfg-9.20.18.so moved to /usr/lib/libisccfg-9.20.20.so
  /usr/lib/libns-9.20.18.so moved to /usr/lib/libns-9.20.20.so

--===============7353589092051152112==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.18-9.20.20.patch"

RnJvbSA3MGM4YmE1N2VkZTNlOWYxZDdmNGVjMDQ2ZjZmNjhhZDI4NDg2MGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDY6MDY6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMTggLT4gOS4yMC4yMAoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEt
YXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uMDAw
MS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8
IDQgKystLQogLi4uYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNo
ZXMtc3lzci5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvY29uZi5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL2JpbmQvaW5pdC5k
LWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgfCAyICstCiAuLi4vYmlu
ZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICAgICAgICAgICAgIHwg
MiArLQogLi4uL2JpbmQve2JpbmRfOS4yMC4xOC5iYiA9PiBiaW5kXzkuMjAuMjAuYmJ9ICAgICAg
ICAgICAgICAgICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85
LjIwLjE4LmJiID0+IGJpbmRfOS4yMC4yMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0
aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8w
MDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKaW5kZXggNGZhMzc3
YTU5NC4uMWJhOWFhNzQ5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQt
ZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmEzZmYy
YTAyNmM1NWRjNjc2NTViYWYyOGUwZjQxNzUyMzJlZTBmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZDZhMGVmNmVlMzg1NGNiOGQ0ZDFjZWEzYmQxYzRkYTg4YjU5ZDI3NCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4K
IERhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6MDkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
YXZvaWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQt
bG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9w
dGlvbnMucGF0Y2gKaW5kZXggMzY5MTg1YWQ4Ni4uODc3NDEzNDYyZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQt
c3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlk
ZS1idWlsZC1vcHRpb25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0OWNhN2I1NDMyZGQ2
YzI0NTQxYmJkZTIxYmNhNTA0M2NkMGMwMDBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA1OGIxOTcyYTgxZGQwODQ5MDU4YTRhMGUxYTI2YTVlMTViZjE2OTY3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgog
RGF0ZTogTW9uLCAyNyBBdWcgMjAxOCAyMToyNDoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBg
bmFtZWQvbHdyZXNkIC1WJyBhbmQgc3RhcnQgbG9nIGhpZGUgYnVpbGQgb3B0aW9ucwpAQCAtMjAs
NyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXJAbXZpc3RhLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYzM4NTJlYy4uM2I3
YTQ0NiAxMDA2NDQKK2luZGV4IGE0ZTdhMzQuLjg3ODBmMzYgMTAwNjQ0CiAtLS0gYS9jb25maWd1
cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTM1LDcgKzM1LDcgQEAgQUNfREVGSU5FKFtQ
QUNLQUdFX1ZFUlNJT05fRVhUUkFdLCBbIl1bYmluZF9WRVJTSU9OX0VYVFJBXVsiXSwgW0JJTkQg
OSBFeHRyYSBwYXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3Iu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1z
ZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCmluZGV4IDRhMDY2
Mjk0ZjAuLmVhYjViNmUxYmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVz
LXN5c3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmlu
ZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZmExNjVjYjRhOWRmZWI3MmYwZGI3ODdkZWNkNTI3ZTNkNTg3
Y2Q0ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2MxMTc4NTY1MTUzZTA1Yzc4MTkw
MTUxNjdmNzM2MjhmNTYwOTlkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwg
R29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA5IEp1
biAyMDE1IDExOjIyOjAwIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGVuc3VyZSBzZWFy
Y2hpbmcgZm9yIGpzb24gaGVhZGVycyBzZWFyY2hlcyBzeXNyb290CkBAIC0zMiw3ICszMiw3IEBA
IFNpZ25lZC1vZmYtYnk6IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBjNmExMGY2Li5j
Mzg1MmVjIDEwMDY0NAoraW5kZXggYjhmNTdiYi4uYTRlN2EzNCAxMDA2NDQKIC0tLSBhL2NvbmZp
Z3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtODY1LDcgKzg2NSw3IEBAIEFTX0NBU0Uo
WyR3aXRoX2xtZGJdLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2Nv
bmYucGF0Y2gKaW5kZXggZWMyMmZlODRjNC4uZmIwNjA5YmIxOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA0YjlmNmY2NzM1MzQwZDU1OGQ5YzlmYmE5Yzg0ZDdmOTlkM2NiZGUyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBlNzk3NWVkNjI1MTAzNDlmMjQwZGY4ZTNlZjhmZDJjYWIxMWY2Mzc3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUWluZyBIZSA8cWluZy5oZUBpbnRlbC5j
b20+CiBEYXRlOiBUdWUsIDMwIE5vdiAyMDEwIDEzOjM1OjQyICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGJpbmQ6IGFkZCBuZXcgcmVjaXBlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1
cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKaW5kZXggZmQ5NmQ0NjQ0OC4uYzQ4NWUw
NGYxMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1v
bmx5LXJvb3Rmcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTk5MzNiZTc4OTAyZDkwMDE0
ZjE3N2I1NjMzZGQxNTk4NGJjMWJjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTQ1
YzI0MjI0ZWZhMzE4NDI2M2UwZGU0NjExMDZiMDg1MDYxZjI4NyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwg
MjcgTWFyIDIwMTQgMDI6MzQ6NDEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gaW5pdC5kOiBhZGQg
c3VwcG9ydCBmb3IgcmVhZC1vbmx5IHJvb3RmcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5k
LXN0b3Atd29yay5wYXRjaAppbmRleCAxNTVjYzVhMTEwLi43MDliNTBhNTRiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5k
LXN0b3Atd29yay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZTQyOTg5OWMzNGVhOGE0Zjg1ZGU0MjhlMjJlZTQ5YzQ1MzI4MWU4MiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNzgwYmQ4MjY3ODFjZWE5YmNlMWY5NGZkMDY1YjFlOTI5YTAzMDc1
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTUgTm92IDIwMTIgMDI6Mjc6NTQgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gYmluZDogbWFrZSAiL2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjE4LmJiIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZF85LjIwLjE4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZF85LjIwLjIwLmJiCmluZGV4IDNhN2NmZjYxNGYuLmI0MmMxMDkxMDUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMTguYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yMC5iYgpAQCAtMjAsNyArMjAsNyBA
QCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0k
e1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJl
LXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZGZjNTQ2Yzk5MGFjNDUxNTUyOWNkNDVjNGRkOTk1ODYyYjE4YWU4YTJkMGNiMjkyMDhl
ODg5NmE1ZDMyNTMzMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxOWI4MzM1ZDI1MzA1MjMxZDVl
YjhmN2Q5MjQyNDBkMWFjOTdjNGRhN2M5M2VhYTYyNzM1MDMxMzNhYTYxMDZhIgogCiBVUFNUUkVB
TV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cg
dGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi40Ny4xCgo=

--===============7353589092051152112==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D655ECD98F5
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 05:53:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13246.1781762008895234649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 22:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SH5b32UA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aM/IWshK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ed94aa40f-23608963-6220-41da-a4e8-f7f5ad5d9a47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kuCBm7rwhY0TRQnngewrNnobeG2RAxN0g85mSQkiiq8=;
	b=SH5b32UABDnMzTwlg46rVG6lEGst8YXl50vscjvJewixVdJjiu7PUb3/EGc2uX3B
	B9WUQ6IeY3BHBI78mgGpXjJJZs+oKpphcchPid8U4im59bAHm41c+3klJWLI0TqFsU2
	VwpATHv3KZwAE3WiHNVvrmjLlJzPo1QHpChnOTv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kuCBm7rwhY0TRQnngewrNnobeG2RAxN0g85mSQkiiq8=;
	b=aM/IWshKs2maKXVFXkxSyN4znRlIvy2jr2N29Xg7RcO+4x0nolX+B5amqlFgmudq
	PFojd0+nPBjwtZWJEtzLA4QB+4Ogm5DQcVitEc14+PZDTIUYGAXOQcxtte9y6xx5pWT
	1wWotFDkNrsKLJJSX8PGhxXAhNjVk2ExAJenAKZo=
Content-Type: multipart/mixed; boundary="===============5050168485955384105=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.24 SUCCEEDED
Message-ID: <0101019ed94aa40f-23608963-6220-41da-a4e8-f7f5ad5d9a47-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 05:53:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 05:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239049

--===============5050168485955384105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.23-9.20.24.patch
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
From 3639668719b0ddf536a78d7916b314b9337f3245 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 18 Jun 2026 05:32:46 +0000
Subject: [PATCH] bind: upgrade 9.20.23 -> 9.20.24

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.23.bb => bind_9.20.24.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.23.bb => bind_9.20.24.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4fa377a594..806ca9c5bd 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From e4886a825c82a7d6f4bd6badeeaeea700e429483 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 7279a73e87..9b2870bd38 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77f8fafab0cc91c3ad8fbf1382b1d0f2d2cd99a6 Mon Sep 17 00:00:00 2001
+From e5f31670d79906033209d6b30d925dcd0324c95a Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86..1bbf17b12e 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From c18ad4de676ed9350837c4c90a5e53a941712ba4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index c845a8e..d065454 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0..352a2f1bc1 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From 6f0289bc8ee2c5a6d386d6d6921875219b268951 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index 7b9a63b..c845a8e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index ec22fe84c4..c7f6941908 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From d308d9b835f4ad11e5824e7333668792980c1357 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index fd96d46448..ec9eec6d3e 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From 23b997fc6276a527e1cf36312cd121170c15978c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 155cc5a110..54d948bb17 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From f5932fde97bb5b47144d926219f3903145a71185 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.23.bb b/meta/recipes-connectivity/bind/bind_9.20.24.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.23.bb
rename to meta/recipes-connectivity/bind/bind_9.20.24.bb
index ebc4422b67..bec78c1d9c 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.23.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.24.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "5d4475aed3f9e500ef554b2b14d972bdb83d33de214a9b3be92918ea46908371"
+SRC_URI[sha256sum] = "989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============5050168485955384105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 16129792 to 16132352 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.20.23.so /usr/lib/.debug/libisc-9.20.23.so /usr/lib/.debug/libisccfg-9.20.23.so /usr/lib/.debug/libisccc-9.20.23.so /usr/lib/.debug/libns-9.20.23.so", added "/usr/lib/.debug/libdns-9.20.24.so /usr/lib/.debug/libisccfg-9.20.24.so /usr/lib/.debug/libisc-9.20.24.so /usr/lib/.debug/libisccc-9.20.24.so /usr/lib/.debug/libns-9.20.24.so"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1602699 to 1602531 (-0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.23.so", added "/usr/lib/*-9.20.24.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.23.so /usr/lib/libdns-9.20.23.so /usr/lib/libns-9.20.23.so /usr/lib/libisc-9.20.23.so /usr/lib/libisccfg-9.20.23.so", added "/usr/lib/libisccfg-9.20.24.so /usr/lib/libdns-9.20.24.so /usr/lib/libns-9.20.24.so /usr/lib/libisccc-9.20.24.so /usr/lib/libisc-9.20.24.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10088773 to 10095910 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.23/bin/plugins -> /usr/src/debug/bind/9.20.24/bin/plugins, directory renamed /usr/src/debug/bind/9.20.23/bin/named/include/named -> /usr/src/debug/bind/9.20.24/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.23/lib/isc/netmgr -> /usr/src/debug/bind/9.20.24/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.23/bin/confgen -> /usr/src/debug/bind/9.20.24/bin/confgen, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.24/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.23/bin/dig -> /usr/src/debug/bind/9.20.24/bin/dig, directory renamed /usr/src/debug/bind/9.20.23/lib/ns -> /usr/src/debug/bind/9.20.24/lib/ns, directory renamed /usr/src/debug/bind/9.20.23/bin/tools -> /usr/src/debug/bind/9.20.24/bin/tools, directory renamed /usr/src/debug/bind/9.20.23/lib/isccc -> /usr/src/debug/bind/9.20.24/lib/isccc, directo
 ry renamed /usr/src/debug/bind/9.20.23/bin/named -> /usr/src/debug/bind/9.20.24/bin/named, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.24/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.23/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.24/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.24/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.24/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.23/bin/check -> /usr/src/debug/bind/9.20.24/bin/check, directory renamed /usr/src/debug/bind/9.20.23/lib/ns/include/ns -> /usr/src/debug/bind/9.20.24/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.23/bin/dnssec -> /usr/src/debug/bind/9.20.24/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.23/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.24/lib/isccc
 /include/isccc, directory renamed /usr/src/debug/bind/9.20.23/lib/isccfg -> /usr/src/debug/bind/9.20.24/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.23/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.24/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.23/bin/delv -> /usr/src/debug/bind/9.20.24/bin/delv, directory renamed /usr/src/debug/bind/9.20.23/lib/isc -> /usr/src/debug/bind/9.20.24/lib/isc, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/include/dst -> /usr/src/debug/bind/9.20.24/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/include/irs -> /usr/src/debug/bind/9.20.24/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.23/bin/nsupdate -> /usr/src/debug/bind/9.20.24/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.23/lib/dns -> /usr/src/debug/bind/9.20.24/lib/dns, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/include/dns -> /usr/src/debug/bind/9.20.24/lib/dns/include/dns, direc
 tory renamed /usr/src/debug/bind/9.20.23/bin/rndc -> /usr/src/debug/bind/9.20.24/bin/rndc, directory renamed /usr/src/debug/bind/9.20.23/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.24/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.23/lib/isc/include/isc -> /usr/src/debug/bind/9.20.24/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.23/bin/named/include/dlz -> /usr/src/debug/bind/9.20.24/bin/named/include/dlz
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.23/bind-9.20.23.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.23" to "9.20.24"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.23 [default] to 9.20.24 [default]
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.23.so to libdns-9.20.24.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.23.so to libisccc-9.20.24.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.23.so to libisccfg-9.20.24.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.23.so to libisc-9.20.24.so
  /usr/lib/libns.so changed symlink target from libns-9.20.23.so to libns-9.20.24.so
  /usr/lib/libdns-9.20.23.so moved to /usr/lib/libdns-9.20.24.so
  /usr/lib/libisc-9.20.23.so moved to /usr/lib/libisc-9.20.24.so
  /usr/lib/libisccc-9.20.23.so moved to /usr/lib/libisccc-9.20.24.so
  /usr/lib/libisccfg-9.20.23.so moved to /usr/lib/libisccfg-9.20.24.so
  /usr/lib/libns-9.20.23.so moved to /usr/lib/libns-9.20.24.so

--===============5050168485955384105==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.23-9.20.24.patch"

RnJvbSAzNjM5NjY4NzE5YjBkZGY1MzZhNzhkNzkxNmIzMTRiOTMzN2YzMjQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTggSnVuIDIwMjYgMDU6MzI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMjMgLT4gOS4yMC4yNAoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEt
YXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uLzAw
MDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoICAgICB8
IDIgKy0KIC4uLjAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9w
dGlvbnMucGF0Y2ggfCA0ICsrLS0KIC4uLmJpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1o
ZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiAuLi4vYmlu
ZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCAgIHwg
MiArLQogLi4uL2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAg
ICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL3tiaW5kXzkuMjAuMjMuYmIgPT4gYmluZF85LjIw
LjI0LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC97YmluZF85LjIwLjIzLmJiID0+IGJpbmRfOS4yMC4yNC5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0
YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0
Y2gKaW5kZXggNGZhMzc3YTU5NC4uODA2Y2E5YzViZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmlu
ZC11c2VyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMmEzZmYyYTAyNmM1NWRjNjc2NTViYWYyOGUwZjQxNzUyMzJlZTBmZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTQ4ODZhODI1YzgyYTdkNmY0YmQ2YmFkZWVhZWVhNzAw
ZTQyOTQ4MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6MDkgKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gYXZvaWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1tNC1CYWNrcG9y
dC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxk
Lm00LW1hY3Jvcy5wYXRjaAppbmRleCA3Mjc5YTczZTg3Li45YjI4NzBiZDM4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4
X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxk
Lm00LW1hY3Jvcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzdmOGZhZmFiMGNjOTFjM2Fk
OGZiZjEzODJiMWQwZjJkMmNkOTlhNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTVm
MzE2NzBkNzk5MDYwMzMyMDlkNmIzMGQ5MjVkY2QwMzI0Yzk1YSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTog
RnJpLCAxMCBBcHIgMjAyNiAyMzozMzo0OSArMDAwMAogU3ViamVjdDogW1BBVENIXSBtNDogQmFj
a3BvcnQgYXhfcHJvZ19jY19mb3JfYnVpbGQubTQgbWFjcm9zCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFy
dC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQt
b3B0aW9ucy5wYXRjaAppbmRleCAzNjkxODVhZDg2Li4xYmJmMTdiMTJlIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFu
ZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1o
aWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ5Y2E3YjU0MzJk
ZDZjMjQ1NDFiYmRlMjFiY2E1MDQzY2QwYzAwMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGMxOGFkNGRlNjc2ZWQ5MzUwODM3YzRjOTBhNWU1M2E5NDE3MTJiYTQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBNb24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGBuYW1lZC9sd3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0y
MCw3ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBjMzg1MmVjLi4z
YjdhNDQ2IDEwMDY0NAoraW5kZXggYzg0NWE4ZS4uZDA2NTQ1NCAxMDA2NDQKIC0tLSBhL2NvbmZp
Z3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUo
W1BBQ0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklO
RCA5IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJl
LXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggNGEw
NjYyOTRmMC4uMzUyYTJmMWJjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNo
ZXMtc3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9i
aW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYTE2NWNiNGE5ZGZlYjcyZjBkYjc4N2RlY2Q1MjdlM2Q1
ODdjZDRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2ZjAyODliYzhlZTJjNWE2ZDM4
NmQ2ZDY5MjE4NzUyMTliMjY4OTUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1
bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkg
SnVuIDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNl
YXJjaGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5c3Jvb3QKQEAgLTMyLDcgKzMyLDcg
QEAgU2lnbmVkLW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZl
ci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGM2YTEwZjYu
LmMzODUyZWMgMTAwNjQ0CitpbmRleCA3YjlhNjNiLi5jODQ1YThlIDEwMDY0NAogLS0tIGEvY29u
ZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04NjUsNyArODY1LDcgQEAgQVNfQ0FT
RShbJHdpdGhfbG1kYl0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
Y29uZi5wYXRjaAppbmRleCBlYzIyZmU4NGM0Li5jN2Y2OTQxOTA4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDRiOWY2ZjY3MzUzNDBkNTU4ZDljOWZiYTljODRkN2Y5OWQzY2JkZTIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGQzMDhkOWI4MzVmNGFkMTFlNTgyNGU3MzMzNjY4NzkyOTgwYzEz
NTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVs
LmNvbT4KIERhdGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYmluZDogYWRkIG5ldyByZWNpcGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rm
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQt
c3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRleCBmZDk2ZDQ2NDQ4Li5lYzll
ZWM2ZDNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9p
bml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFk
LW9ubHktcm9vdGZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOTkzM2JlNzg5MDJkOTAw
MTRmMTc3YjU2MzNkZDE1OTg0YmMxYmM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
M2I5OTdmYzYyNzZhNTI3ZTFjZjM2MzEyY2QxMjExNzBjMTU5NzhjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1
LCAyNyBNYXIgMjAxNCAwMjozNDo0MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFk
ZCBzdXBwb3J0IGZvciByZWFkLW9ubHkgcm9vdGZzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJp
bmQtc3RvcC13b3JrLnBhdGNoCmluZGV4IDE1NWNjNWExMTAuLjU0ZDk0OGJiMTcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJp
bmQtc3RvcC13b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBlNDI5ODk5YzM0ZWE4YTRmODVkZTQyOGUyMmVlNDljNDUzMjgxZTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBmNTkzMmZkZTk3YmI1YjQ3MTQ0ZDkyNjIxOWYzOTAzMTQ1YTcx
MTg1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3
aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjMuYmIg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI0LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kXzkuMjAuMjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kXzkuMjAuMjQuYmIKaW5kZXggZWJjNDQyMmI2Ny4uYmVjNzhjMWQ5YyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI0LmJiCkBAIC0yMSw3ICsyMSw3
IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59
LSR7UFZ9LnRhci54eiBcCiAJCSAgIGZpbGU6Ly8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2Nf
Zm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVkNDQ3NWFlZDNmOWU1MDBlZjU1NGIyYjE0ZDk3MmJkYjgzZDMzZGUyMTRhOWIz
YmU5MjkxOGVhNDY5MDgzNzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTg5ZmVmMWZjODhlYTU5
ZDA0Y2Q4NmY4NTRkY2E1YTQ2MTZhMjBhOTk2OGJjZGRlM2MxYTM2NjhhYjM2YmUwOCIKIAogVVBT
VFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9s
bG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDcuMQoK

--===============5050168485955384105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.23.so /usr/lib/libdns-9.20.23.so /usr/lib/libns-9.20.23.so /usr/lib/libisc-9.20.23.so /usr/lib/libisccfg-9.20.23.so", added "/usr/lib/libisccfg-9.20.24.so /usr/lib/libisccc-9.20.24.so /usr/lib/libdns-9.20.24.so /usr/lib/libns-9.20.24.so /usr/lib/libisc-9.20.24.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.23.so to libdns-9.20.24.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.23.so to libisccc-9.20.24.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.23.so to libisccfg-9.20.24.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.23.so to libisc-9.20.24.so
  /usr/lib/libns.so changed symlink target from libns-9.20.23.so to libns-9.20.24.so
  /usr/lib/libdns-9.20.23.so moved to /usr/lib/libdns-9.20.24.so
  /usr/lib/libisc-9.20.23.so moved to /usr/lib/libisc-9.20.24.so
  /usr/lib/libisccc-9.20.23.so moved to /usr/lib/libisccc-9.20.24.so
  /usr/lib/libisccfg-9.20.23.so moved to /usr/lib/libisccfg-9.20.24.so
  /usr/lib/libns-9.20.23.so moved to /usr/lib/libns-9.20.24.so

--===============5050168485955384105==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBB6C678DA
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.27790.1748786127843611659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jidXqGkF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=k15rrB4K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101972bc6a041-65341dbb-4ed8-4538-b450-8d7e15aa41e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dtWihIURVFucUAuFMY98mSsrZIPdahlxFlRRkGpjrFg=;
	b=jidXqGkFk0Nzgqnuv5+vRvESMCnY9rGHUpfQ3B86JCCUuyLmHOrsslEjebZEqItQ
	A2YtTtnSpnWm7BosuscAwgQFsF9AISIuewHQqz/vFzJx2Ak3Cv5Dx+12PmIM6jl5KrV
	x1ibOI0iktjgrPvpo60LCvAz8Zb/NDZrnbb3rUlk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dtWihIURVFucUAuFMY98mSsrZIPdahlxFlRRkGpjrFg=;
	b=k15rrB4KUIEsfmu8NZYsCFKJKLoki4uy4sqNu2RhBL+ZMVT/XbAuIOevUtR1PrqP
	mdue0OUw8aOzcHl3n5gNga5xcON3jW7g74dmylzWr8UfQWzYTc4NQ5EWcKJeFf9On4t
	Dd6lWvGYvMPNDhFo7jQEs4jQutkpFBbdEn6/b6v8=
Content-Type: multipart/mixed; boundary="===============7492408617676397339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.9 SUCCEEDED
Message-ID: <010101972bc6a041-65341dbb-4ed8-4538-b450-8d7e15aa41e1-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217578

--===============7492408617676397339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.8-9.20.9.patch
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
From d32d334161cee0ef724ecac5733bf432fb913536 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 07:50:47 +0000
Subject: [PATCH] bind: upgrade 9.20.8 -> 9.20.9

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.8.bb => bind_9.20.9.bb}                   | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.8.bb => bind_9.20.9.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 78ab6b87fc..c82fb478fe 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
+From 2c0230e9d721e82d3f73b850fb3df0e5106b2ca8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 53e439721f..e4dc9b536c 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
+From 46b7d2fdb0be9bdb9ddcf27109da6b70ddb72deb Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f9cf4a4..0ce3d26 100644
+index 1d5a8e6..18ab890 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d208fc1c..f176c856d2 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
+From 2b840c91ea9c5ec417ce3e6fef6f6648bcb179c2 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 334b551..f9cf4a4 100644
+index 9701cdb..1d5a8e6 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 102fe46ffe..30729ec89e 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
+From e166027f4181160ff6b1173bb9a501ac9dc605fe Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 984d401c70..29cdaa8715 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
+From 89526f2a32bd6b1092ab2374d5bfd588f3517c2c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 74f2ef83a0..d11de32617 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
+From 3330f05741b58cf0171f21d1f4032cc3a2856929 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.8.bb b/meta/recipes-connectivity/bind/bind_9.20.9.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.8.bb
rename to meta/recipes-connectivity/bind/bind_9.20.9.bb
index 864daed97e..93ff957fc5 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.8.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3004d99c476beab49a986c2d49f902e2cd7766c9ab18b261e8b353cabf3a04b5"
+SRC_URI[sha256sum] = "3d26900ed9c9a859073ffea9b97e292c1248dad18279b17b05fcb23c3091f86d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============7492408617676397339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 15055664 to 15061328 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccc-9.20.8.so /usr/lib/.debug/libdns-9.20.8.so /usr/lib/.debug/libisccfg-9.20.8.so /usr/lib/.debug/libisc-9.20.8.so /usr/lib/.debug/libns-9.20.8.so", added "/usr/lib/.debug/libisccc-9.20.9.so /usr/lib/.debug/libns-9.20.9.so /usr/lib/.debug/libisccfg-9.20.9.so /usr/lib/.debug/libisc-9.20.9.so /usr/lib/.debug/libdns-9.20.9.so"
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1588149 to 1588892 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.8.so", added "/usr/lib/*-9.20.9.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.8.so /usr/lib/libns-9.20.8.so /usr/lib/libisccc-9.20.8.so /usr/lib/libdns-9.20.8.so /usr/lib/libisc-9.20.8.so", added "/usr/lib/libns-9.20.9.so /usr/lib/libisccc-9.20.9.so /usr/lib/libisccfg-9.20.9.so /usr/lib/libdns-9.20.9.so /usr/lib/libisc-9.20.9.so"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind-utils: PKGSIZE changed from 479544 to 479736 (+0%)
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.20.8" to "9.20.9"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.8/bind-9.20.8.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.9/bind-9.20.9.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-64-poky-linux/bind: PKGV changed from 9.20.8 [default] to 9.20.9 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.20.8" to "9.20.9"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.8.so to libdns-9.20.9.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.8.so to libisccc-9.20.9.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.8.so to libisccfg-9.20.9.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.8.so to libisc-9.20.9.so
  /usr/lib/libns.so changed symlink target from libns-9.20.8.so to libns-9.20.9.so
  /usr/lib/libdns-9.20.8.so moved to /usr/lib/libdns-9.20.9.so
  /usr/lib/libisc-9.20.8.so moved to /usr/lib/libisc-9.20.9.so
  /usr/lib/libisccc-9.20.8.so moved to /usr/lib/libisccc-9.20.9.so
  /usr/lib/libisccfg-9.20.8.so moved to /usr/lib/libisccfg-9.20.9.so
  /usr/lib/libns-9.20.8.so moved to /usr/lib/libns-9.20.9.so

--===============7492408617676397339==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.8-9.20.9.patch"

RnJvbSBkMzJkMzM0MTYxY2VlMGVmNzI0ZWNhYzU3MzNiZjQzMmZiOTEzNTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNzo1MDo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC44IC0+IDkuMjAuOQoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEtYXZv
aWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8IDQg
KystLQogLi4uYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMt
c3lzci5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
Y29uZi5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL2JpbmQvaW5pdC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgfCAyICstCiAuLi4vYmluZC9i
aW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICAgICAgICAgICAgIHwgMiAr
LQogLi4uL2JpbmQve2JpbmRfOS4yMC44LmJiID0+IGJpbmRfOS4yMC45LmJifSAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjIw
LjguYmIgPT4gYmluZF85LjIwLjkuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmlu
ZC11c2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1h
dm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCmluZGV4IDc4YWI2Yjg3ZmMu
LmM4MmZiNDc4ZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1
cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM3MGY3NDE2NGJl
YThhOGM1NGMwM2JlY2ZmYjJmMjExMDNkZDFmMzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDJjMDIzMGU5ZDcyMWU4MmQzZjczYjg1MGZiM2RmMGU1MTA2YjJjYTggTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBNb24sIDE1IE9jdCAyMDE4IDE2OjU1OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lk
IHN0YXJ0IGZhaWx1cmUgd2l0aCBiaW5kIHVzZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1o
aWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25z
LnBhdGNoCmluZGV4IDUzZTQzOTcyMWYuLmU0ZGM5YjUzNmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0
LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVp
bGQtb3B0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGRkNjdkODU3MDVjYmNmYTlh
Mjc1OWM0NmYzY2RmM2QwZDYzNzVkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDZi
N2QyZmRiMGJlOWJkYjlkZGNmMjcxMDlkYTZiNzBkZGI3MmRlYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6
IE1vbiwgMjcgQXVnIDIwMTggMjE6MjQ6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYG5hbWVk
L2x3cmVzZCAtVicgYW5kIHN0YXJ0IGxvZyBoaWRlIGJ1aWxkIG9wdGlvbnMKQEAgLTIwLDcgKzIw
LDcgQEAgU2lnbmVkLW9mZi1ieTogQXJtaW4gS3VzdGVyIDxha3VzdGVyQG12aXN0YS5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGY5Y2Y0YTQuLjBjZTNkMjYg
MTAwNjQ0CitpbmRleCAxZDVhOGU2Li4xOGFiODkwIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFj
CiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNSw3ICszNSw3IEBAIEFDX0RFRklORShbUEFDS0FH
RV9WRVJTSU9OX0VYVFJBXSwgWyJdW2JpbmRfVkVSU0lPTl9FWFRSQV1bIl0sIFtCSU5EIDkgRXh0
cmEgcGFyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9i
aW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNo
aW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAppbmRleCAzOGQyMDhmYzFj
Li5mMTc2Yzg1NmQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNy
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5z
dXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDhjOWM4MTc5MzNlZWYyMDMyOGYxMDIzN2JiZDk2NDU4MGRiMGEzYWQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJiODQwYzkxZWE5YzVlYzQxN2NlM2U2ZmVm
NmY2NjQ4YmNiMTc5YzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEdvcnRt
YWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAx
NSAxMToyMjowMCAtMDQwMAogU3ViamVjdDogW1BBVENIXSBiaW5kOiBlbnN1cmUgc2VhcmNoaW5n
IGZvciBqc29uIGhlYWRlcnMgc2VhcmNoZXMgc3lzcm9vdApAQCAtMzIsNyArMzIsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMzM0YjU1MS4uZjljZjRh
NCAxMDA2NDQKK2luZGV4IDk3MDFjZGIuLjFkNWE4ZTYgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUu
YWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTg2Myw3ICs4NjMsNyBAQCBBU19DQVNFKFskd2l0
aF9sbWRiXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
L2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBh
dGNoCmluZGV4IDEwMmZlNDZmZmUuLjMwNzI5ZWM4OWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODNh
ODkyYWYxOWJmMTQ1NWNlNzEzMjM1MDMzMmVkNmQ3ZjFlMmI5NCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZTE2NjAyN2Y0MTgxMTYwZmY2YjExNzNiYjlhNTAxYWM5ZGM2MDVmZSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgog
RGF0ZTogVHVlLCAzMCBOb3YgMjAxMCAxMzozNTo0MiArMDgwMAogU3ViamVjdDogW1BBVENIXSBi
aW5kOiBhZGQgbmV3IHJlY2lwZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0
LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmluZGV4IDk4NGQ0MDFjNzAuLjI5Y2RhYTg3MTUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1y
b290ZnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDEzOTNjYmY2YjAwODQxMjhmZGZjOWI1
YWZiM2JjYzMwNzI2NWQwOTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg5NTI2ZjJh
MzJiZDZiMTA5MmFiMjM3NGQ1YmZkNTg4ZjM1MTdjMmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDI3IE1h
ciAyMDE0IDAyOjM0OjQxICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluaXQuZDogYWRkIHN1cHBv
cnQgZm9yIHJlYWQtb25seSByb290ZnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9w
LXdvcmsucGF0Y2gKaW5kZXggNzRmMmVmODNhMC4uZDExZGUzMjYxNyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9w
LXdvcmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFr
ZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNl
MDY1MDZiYjNmZTY2MWUwMzE2MWFmM2E2MDNiZDIyODU5MGEyNTQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDMzMzBmMDU3NDFiNThjZjAxNzFmMjFkMWY0MDMyY2MzYTI4NTY5MjkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUaHUsIDE1IE5vdiAyMDEyIDAyOjI3OjU0ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2JpbmQgc3RvcCIgd29yawpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC44LmJiIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC45LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAu
OC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC45
LmJiCmluZGV4IDg2NGRhZWQ5N2UuLjkzZmY5NTdmYzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjkuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9
ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQt
dXNlci5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMwMDRk
OTljNDc2YmVhYjQ5YTk4NmMyZDQ5ZjkwMmUyY2Q3NzY2YzlhYjE4YjI2MWU4YjM1M2NhYmYzYTA0
YjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2QyNjkwMGVkOWM5YTg1OTA3M2ZmZWE5Yjk3ZTI5
MmMxMjQ4ZGFkMTgyNzliMTdiMDVmY2IyM2MzMDkxZjg2ZCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93IHRoZSBFU1YgdmVy
c2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDcuMQoK

--===============7492408617676397339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.20.8.so /usr/lib/libisccc-9.20.8.so /usr/lib/libdns-9.20.8.so /usr/lib/libisc-9.20.8.so /usr/lib/libisccfg-9.20.8.so", added "/usr/lib/libisccfg-9.20.9.so /usr/lib/libisccc-9.20.9.so /usr/lib/libdns-9.20.9.so /usr/lib/libisc-9.20.9.so /usr/lib/libns-9.20.9.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.8.so to libdns-9.20.9.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.8.so to libisccc-9.20.9.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.8.so to libisccfg-9.20.9.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.8.so to libisc-9.20.9.so
  /usr/lib/libns.so changed symlink target from libns-9.20.8.so to libns-9.20.9.so
  /usr/lib/libdns-9.20.8.so moved to /usr/lib/libdns-9.20.9.so
  /usr/lib/libisc-9.20.8.so moved to /usr/lib/libisc-9.20.9.so
  /usr/lib/libisccc-9.20.8.so moved to /usr/lib/libisccc-9.20.9.so
  /usr/lib/libisccfg-9.20.8.so moved to /usr/lib/libisccfg-9.20.9.so
  /usr/lib/libns-9.20.8.so moved to /usr/lib/libns-9.20.9.so

--===============7492408617676397339==--


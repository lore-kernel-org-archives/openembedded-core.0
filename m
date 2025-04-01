Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C0DC3601C
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.18062.1743511388383171667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AtVh5fal;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z4FlAZbm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f1607d4d-ecfa373b-a437-4480-9640-e234ea64d37f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xbaLhvKHNUDFX/nn2d3l6OnPF/vhJOJoKt+CuwZVVUk=;
	b=AtVh5falqQjKrM3gnuYEVGp+dq9QZMR1CJ27tBDNjlULTrmCjLz+BmzUr7Tpixel
	ssxuHOik+XIH4J18hyiqxAoNZHbhappRMjfJtCAAyzZmYyBiwobGi/ez6GH+4Ufy5vM
	BaTG2RWdd/kkhU03v8mpXaGd3mhjb60+Ik0bh/10=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xbaLhvKHNUDFX/nn2d3l6OnPF/vhJOJoKt+CuwZVVUk=;
	b=Z4FlAZbmTccasA7uAQkdybB8xBvbPC7m1Xq6OSY7qQkEVuS4W4gB+9n2Zw/4WLrh
	k4RU1/R2Nol2aiF2g6RzEr/qhWbrTHloJWr4A1Wmyxo+GNYsWoxU6HdKAOYISyBSIKV
	P3C21rF5KN0oPXBE09XueefkO2L9KVfzSbuQFPZ4=
Content-Type: multipart/mixed; boundary="===============6397232578754941041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.7 SUCCEEDED
Message-ID: <01010195f1607d4d-ecfa373b-a437-4480-9640-e234ea64d37f-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214031

--===============6397232578754941041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.6-9.20.7.patch
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
From 161cefe5aa4d9c569342a929e9f131a13b60051c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 06:50:19 +0000
Subject: [PATCH] bind: upgrade 9.20.6 -> 9.20.7

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.6.bb => bind_9.20.7.bb}                   | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.6.bb => bind_9.20.7.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 0d670edda6..78ab6b87fc 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 0a45935f9d1207535f83df62ed52f358ed546bbe Mon Sep 17 00:00:00 2001
+From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 10b8caafbb..53e439721f 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From dd484b0bd58832fc241afdc8ea05693228348353 Mon Sep 17 00:00:00 2001
+From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 13f9d7f..6516d0d 100644
+index f9cf4a4..0ce3d26 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 49b0a5eea1..38d208fc1c 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 9a06dbf831f012c6019237527d2bf1aa7a3a543a Mon Sep 17 00:00:00 2001
+From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 168a77a..13f9d7f 100644
+index 334b551..f9cf4a4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 16ac510cfa..102fe46ffe 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 27d1113a4c378583e0fcff91d70256bdcd78de0b Mon Sep 17 00:00:00 2001
+From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index baeeafe33e..984d401c70 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1fa4d0eb9631771bd751f04ce898433580996e5e Mon Sep 17 00:00:00 2001
+From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 93aa304126..74f2ef83a0 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 2ea2e4e502e5840d52e76461e071882cc65f1766 Mon Sep 17 00:00:00 2001
+From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.6.bb b/meta/recipes-connectivity/bind/bind_9.20.7.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.6.bb
rename to meta/recipes-connectivity/bind/bind_9.20.7.bb
index 7a03f8598d..b4202f1a59 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "ed7f54b44f84a7201a2fa7a949f3021ea568529bfad90fca664fd55c05104134"
+SRC_URI[sha256sum] = "43323c8d22d2144282c37b4060ec11e98c24835e225688876fad08ba7b95dca6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============6397232578754941041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.6.so /usr/lib/libdns-9.20.6.so /usr/lib/libns-9.20.6.so /usr/lib/libisccc-9.20.6.so /usr/lib/libisc-9.20.6.so", added "/usr/lib/libdns-9.20.7.so /usr/lib/libisccfg-9.20.7.so /usr/lib/libisccc-9.20.7.so /usr/lib/libisc-9.20.7.so /usr/lib/libns-9.20.7.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.6.so to libdns-9.20.7.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.6.so to libisccc-9.20.7.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.6.so to libisccfg-9.20.7.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.6.so to libisc-9.20.7.so
  /usr/lib/libns.so changed symlink target from libns-9.20.6.so to libns-9.20.7.so
  /usr/lib/libdns-9.20.6.so moved to /usr/lib/libdns-9.20.7.so
  /usr/lib/libisc-9.20.6.so moved to /usr/lib/libisc-9.20.7.so
  /usr/lib/libisccc-9.20.6.so moved to /usr/lib/libisccc-9.20.7.so
  /usr/lib/libisccfg-9.20.6.so moved to /usr/lib/libisccfg-9.20.7.so
  /usr/lib/libns-9.20.6.so moved to /usr/lib/libns-9.20.7.so

--===============6397232578754941041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.6-9.20.7.patch"

RnJvbSAxNjFjZWZlNWFhNGQ5YzU2OTM0MmE5MjllOWYxMzFhMTNiNjAwNTFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNjo1MDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC42IC0+IDkuMjAuNwoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEtYXZv
aWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8IDQg
KystLQogLi4uYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMt
c3lzci5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
Y29uZi5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL2JpbmQvaW5pdC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgfCAyICstCiAuLi4vYmluZC9i
aW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICAgICAgICAgICAgIHwgMiAr
LQogLi4uL2JpbmQve2JpbmRfOS4yMC42LmJiID0+IGJpbmRfOS4yMC43LmJifSAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjIw
LjYuYmIgPT4gYmluZF85LjIwLjcuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmlu
ZC11c2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1h
dm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCmluZGV4IDBkNjcwZWRkYTYu
Ljc4YWI2Yjg3ZmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1
cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBhNDU5MzVmOWQx
MjA3NTM1ZjgzZGY2MmVkNTJmMzU4ZWQ1NDZiYmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGM3MGY3NDE2NGJlYThhOGM1NGMwM2JlY2ZmYjJmMjExMDNkZDFmMzEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBNb24sIDE1IE9jdCAyMDE4IDE2OjU1OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lk
IHN0YXJ0IGZhaWx1cmUgd2l0aCBiaW5kIHVzZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1o
aWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25z
LnBhdGNoCmluZGV4IDEwYjhjYWFmYmIuLjUzZTQzOTcyMWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0
LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVp
bGQtb3B0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGQ0ODRiMGJkNTg4MzJmYzI0
MWFmZGM4ZWEwNTY5MzIyODM0ODM1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGRk
NjdkODU3MDVjYmNmYTlhMjc1OWM0NmYzY2RmM2QwZDYzNzVkZSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6
IE1vbiwgMjcgQXVnIDIwMTggMjE6MjQ6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYG5hbWVk
L2x3cmVzZCAtVicgYW5kIHN0YXJ0IGxvZyBoaWRlIGJ1aWxkIG9wdGlvbnMKQEAgLTIwLDcgKzIw
LDcgQEAgU2lnbmVkLW9mZi1ieTogQXJtaW4gS3VzdGVyIDxha3VzdGVyQG12aXN0YS5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDEzZjlkN2YuLjY1MTZkMGQg
MTAwNjQ0CitpbmRleCBmOWNmNGE0Li4wY2UzZDI2IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFj
CiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNSw3ICszNSw3IEBAIEFDX0RFRklORShbUEFDS0FH
RV9WRVJTSU9OX0VYVFJBXSwgWyJdW2JpbmRfVkVSU0lPTl9FWFRSQV1bIl0sIFtCSU5EIDkgRXh0
cmEgcGFyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9i
aW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNo
aW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAppbmRleCA0OWIwYTVlZWEx
Li4zOGQyMDhmYzFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNy
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5z
dXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDlhMDZkYmY4MzFmMDEyYzYwMTkyMzc1MjdkMmJmMWFhN2EzYTU0M2Eg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhjOWM4MTc5MzNlZWYyMDMyOGYxMDIzN2Ji
ZDk2NDU4MGRiMGEzYWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEdvcnRt
YWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAx
NSAxMToyMjowMCAtMDQwMAogU3ViamVjdDogW1BBVENIXSBiaW5kOiBlbnN1cmUgc2VhcmNoaW5n
IGZvciBqc29uIGhlYWRlcnMgc2VhcmNoZXMgc3lzcm9vdApAQCAtMzIsNyArMzIsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMTY4YTc3YS4uMTNmOWQ3
ZiAxMDA2NDQKK2luZGV4IDMzNGI1NTEuLmY5Y2Y0YTQgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUu
YWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTg2Myw3ICs4NjMsNyBAQCBBU19DQVNFKFskd2l0
aF9sbWRiXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
L2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBh
dGNoCmluZGV4IDE2YWM1MTBjZmEuLjEwMmZlNDZmZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjdk
MTExM2E0YzM3ODU4M2UwZmNmZjkxZDcwMjU2YmRjZDc4ZGUwYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODNhODkyYWYxOWJmMTQ1NWNlNzEzMjM1MDMzMmVkNmQ3ZjFlMmI5NCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgog
RGF0ZTogVHVlLCAzMCBOb3YgMjAxMCAxMzozNTo0MiArMDgwMAogU3ViamVjdDogW1BBVENIXSBi
aW5kOiBhZGQgbmV3IHJlY2lwZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0
LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmluZGV4IGJhZWVhZmUzM2UuLjk4NGQ0MDFjNzAg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1y
b290ZnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFmYTRkMGViOTYzMTc3MWJkNzUxZjA0
Y2U4OTg0MzM1ODA5OTZlNWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDEzOTNjYmY2
YjAwODQxMjhmZGZjOWI1YWZiM2JjYzMwNzI2NWQwOTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDI3IE1h
ciAyMDE0IDAyOjM0OjQxICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluaXQuZDogYWRkIHN1cHBv
cnQgZm9yIHJlYWQtb25seSByb290ZnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9w
LXdvcmsucGF0Y2gKaW5kZXggOTNhYTMwNDEyNi4uNzRmMmVmODNhMCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9w
LXdvcmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFr
ZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJl
YTJlNGU1MDJlNTg0MGQ1MmU3NjQ2MWUwNzE4ODJjYzY1ZjE3NjYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGNlMDY1MDZiYjNmZTY2MWUwMzE2MWFmM2E2MDNiZDIyODU5MGEyNTQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUaHUsIDE1IE5vdiAyMDEyIDAyOjI3OjU0ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2JpbmQgc3RvcCIgd29yawpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC42LmJiIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC43LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAu
Ni5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC43
LmJiCmluZGV4IDdhMDNmODU5OGQuLmI0MjAyZjFhNTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjcuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9
ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQt
dXNlci5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVkN2Y1
NGI0NGY4NGE3MjAxYTJmYTdhOTQ5ZjMwMjFlYTU2ODUyOWJmYWQ5MGZjYTY2NGZkNTVjMDUxMDQx
MzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDMzMjNjOGQyMmQyMTQ0MjgyYzM3YjQwNjBlYzEx
ZTk4YzI0ODM1ZTIyNTY4ODg3NmZhZDA4YmE3Yjk1ZGNhNiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93IHRoZSBFU1YgdmVy
c2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDcuMQoK

--===============6397232578754941041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 15032464 to 15073624 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccfg-9.20.6.so /usr/lib/.debug/libisc-9.20.6.so /usr/lib/.debug/libdns-9.20.6.so /usr/lib/.debug/libisccc-9.20.6.so /usr/lib/.debug/libns-9.20.6.so", added "/usr/lib/.debug/libisccfg-9.20.7.so /usr/lib/.debug/libns-9.20.7.so /usr/lib/.debug/libisccc-9.20.7.so /usr/lib/.debug/libdns-9.20.7.so /usr/lib/.debug/libisc-9.20.7.so"
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1587039 to 1588962 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind-libs: PKGSIZE changed from 3491152 to 3495600 (+0%)
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.6.so /usr/lib/libisc-9.20.6.so /usr/lib/libns-9.20.6.so /usr/lib/libisccc-9.20.6.so /usr/lib/libisccfg-9.20.6.so", added "/usr/lib/libdns-9.20.7.so /usr/lib/libisc-9.20.7.so /usr/lib/libisccfg-9.20.7.so /usr/lib/libns-9.20.7.so /usr/lib/libisccc-9.20.7.so"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.6.so", added "/usr/lib/*-9.20.7.so"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9983969 to 9996492 (+0%)
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind-utils: PKGSIZE changed from 483608 to 483640 (+0%)
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind/bind: PKGSIZE changed from 1312969 to 1313097 (+0%)
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind: PKGV changed from 9.20.6 [default] to 9.20.7 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.20.6" to "9.20.7"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.6/bind-9.20.6.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.7/bind-9.20.7.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.6.so to libdns-9.20.7.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.6.so to libisccc-9.20.7.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.6.so to libisccfg-9.20.7.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.6.so to libisc-9.20.7.so
  /usr/lib/libns.so changed symlink target from libns-9.20.6.so to libns-9.20.7.so
  /usr/lib/libdns-9.20.6.so moved to /usr/lib/libdns-9.20.7.so
  /usr/lib/libisc-9.20.6.so moved to /usr/lib/libisc-9.20.7.so
  /usr/lib/libisccc-9.20.6.so moved to /usr/lib/libisccc-9.20.7.so
  /usr/lib/libisccfg-9.20.6.so moved to /usr/lib/libisccfg-9.20.7.so
  /usr/lib/libns-9.20.6.so moved to /usr/lib/libns-9.20.7.so

--===============6397232578754941041==--


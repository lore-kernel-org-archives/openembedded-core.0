Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E3CC83F04
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1424.1751386807485108968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ismvh+sD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jbZvZP6+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6c9d9e1-753f299d-c457-431c-88c8-89db3172e56c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386806;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b+q/ZMVeujEYD8UEEuUvoplBCUPd9Hif9L/XqIcS9cI=;
	b=ismvh+sDN1NlprUPpfI4pXpxs0MuGtuqjHU6bQ9hsWSX25YHhvmBiqruScpwuDgU
	LlbZDElEoUCYvGg+4nn7LWUVllEcdW6hDNaNG96srClYwMRgziy8bmI1mTQskv6DlJg
	h3Oi+hHMIHeodKHnVPocPB5MPxmmHJonoA+JQqc0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386806;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b+q/ZMVeujEYD8UEEuUvoplBCUPd9Hif9L/XqIcS9cI=;
	b=jbZvZP6+Fl+brU+VsHV4LGBjX9Qc/cpupLpENoRTUj5Y6uU6Dey/imQzmtN54/wu
	FcGJpBUsvFuUcab/M3i6C2uJ/f49gt5P3dNP7eodB6tbQ2LkPVmliaYngl3RTm/5ENr
	VLiZbkJVGAijFTDOF7AQkCiJ15UjjGzXo4uwM2YA=
Content-Type: multipart/mixed; boundary="===============6458550787633088460=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.10 SUCCEEDED
Message-ID: <01010197c6c9d9e1-753f299d-c457-431c-88c8-89db3172e56c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219606

--===============6458550787633088460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.9-9.20.10.patch
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
From 6607eb106793de4276679ac9bb2283cf1f613d57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 07:23:57 +0000
Subject: [PATCH] bind: upgrade 9.20.9 -> 9.20.10

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.9.bb => bind_9.20.10.bb}                  | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.9.bb => bind_9.20.10.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 78ab6b87fc..3853486391 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
+From decc46aedb242b0047debab8be7141bbf9e6a8c7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 53e439721f..2291d53f77 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
+From f44f06cd905df56846550d38bcc399c4ce751d08 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f9cf4a4..0ce3d26 100644
+index ac31c8a..1076489 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d208fc1c..a94a3a5132 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
+From 38c725133d09b13c868e3cbbc8a6bc385ba85234 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 334b551..f9cf4a4 100644
+index d9aa4e1..ac31c8a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 102fe46ffe..a71f1ed18d 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
+From 5405b3ec6ffea0abd905e8302c694218d7897822 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 984d401c70..5eb136d625 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
+From 9a5222252512719e7341d1ac0f2ee05ad7f0e7ce Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 74f2ef83a0..d00b87413c 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
+From fa36234f7a95897c0b1d66fb49dc586e4747dd24 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.9.bb b/meta/recipes-connectivity/bind/bind_9.20.10.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.9.bb
rename to meta/recipes-connectivity/bind/bind_9.20.10.bb
index 93ff957fc5..32f0bdf7b5 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.10.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3d26900ed9c9a859073ffea9b97e292c1248dad18279b17b05fcb23c3091f86d"
+SRC_URI[sha256sum] = "0fb3ba2c337bb488ca68f5df296c435cd255058fb63d0822e91db0235c905716"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============6458550787633088460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.9.so /usr/lib/libdns-9.20.9.so /usr/lib/libisc-9.20.9.so /usr/lib/libns-9.20.9.so /usr/lib/libisccc-9.20.9.so", added "/usr/lib/libns-9.20.10.so /usr/lib/libisccc-9.20.10.so /usr/lib/libisc-9.20.10.so /usr/lib/libdns-9.20.10.so /usr/lib/libisccfg-9.20.10.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.9.so to libdns-9.20.10.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.9.so to libisccc-9.20.10.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.9.so to libisccfg-9.20.10.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.9.so to libisc-9.20.10.so
  /usr/lib/libns.so changed symlink target from libns-9.20.9.so to libns-9.20.10.so
  /usr/lib/libdns-9.20.10.so was added
  /usr/lib/libisc-9.20.10.so was added
  /usr/lib/libisccc-9.20.10.so was added
  /usr/lib/libisccfg-9.20.10.so was added
  /usr/lib/libns-9.20.10.so was added
  /usr/lib/libdns-9.20.9.so was removed
  /usr/lib/libisc-9.20.9.so was removed
  /usr/lib/libisccc-9.20.9.so was removed
  /usr/lib/libisccfg-9.20.9.so was removed
  /usr/lib/libns-9.20.9.so was removed

--===============6458550787633088460==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.9-9.20.10.patch"

RnJvbSA2NjA3ZWIxMDY3OTNkZTQyNzY2NzlhYzliYjIyODNjZjFmNjEzZDU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwNzoyMzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC45IC0+IDkuMjAuMTAKCi0tLQogLi4uL2JpbmQvYmluZC8wMDAxLWF2
b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggICB8IDIgKy0KIC4uLjAwMDEt
bmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggfCA0
ICsrLS0KIC4uLmJpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVz
LXN5c3IucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
L2NvbmYucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiAuLi4vYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCAgIHwgMiArLQogLi4uL2JpbmQv
YmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgICAgICAgICAgICB8IDIg
Ky0KIC4uLi9iaW5kL3tiaW5kXzkuMjAuOS5iYiA9PiBiaW5kXzkuMjAuMTAuYmJ9ICAgICAgICAg
ICAgICAgICAgfCAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRfOS4y
MC45LmJiID0+IGJpbmRfOS4yMC4xMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1i
aW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAx
LWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKaW5kZXggNzhhYjZiODdm
Yy4uMzg1MzQ4NjM5MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFp
bHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzcwZjc0MTY0
YmVhOGE4YzU0YzAzYmVjZmZiMmYyMTEwM2RkMWYzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZGVjYzQ2YWVkYjI0MmIwMDQ3ZGViYWI4YmU3MTQxYmJmOWU2YThjNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERh
dGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6MDkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXZv
aWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9n
LWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlv
bnMucGF0Y2gKaW5kZXggNTNlNDM5NzIxZi4uMjI5MWQ1M2Y3NyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3Rh
cnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1i
dWlsZC1vcHRpb25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwZGQ2N2Q4NTcwNWNiY2Zh
OWEyNzU5YzQ2ZjNjZGYzZDBkNjM3NWRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBm
NDRmMDZjZDkwNWRmNTY4NDY1NTBkMzhiY2MzOTljNGNlNzUxZDA4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogTW9uLCAyNyBBdWcgMjAxOCAyMToyNDoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBgbmFt
ZWQvbHdyZXNkIC1WJyBhbmQgc3RhcnQgbG9nIGhpZGUgYnVpbGQgb3B0aW9ucwpAQCAtMjAsNyAr
MjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXJAbXZpc3RhLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZjljZjRhNC4uMGNlM2Qy
NiAxMDA2NDQKK2luZGV4IGFjMzFjOGEuLjEwNzY0ODkgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUu
YWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTM1LDcgKzM1LDcgQEAgQUNfREVGSU5FKFtQQUNL
QUdFX1ZFUlNJT05fRVhUUkFdLCBbIl1bYmluZF9WRVJTSU9OX0VYVFJBXVsiXSwgW0JJTkQgOSBF
eHRyYSBwYXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFy
Y2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCmluZGV4IDM4ZDIwOGZj
MWMuLmE5NGEzYTUxMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5
c3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1l
bnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gOGM5YzgxNzkzM2VlZjIwMzI4ZjEwMjM3YmJkOTY0NTgwZGIwYTNh
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzhjNzI1MTMzZDA5YjEzYzg2OGUzY2Ji
YzhhNmJjMzg1YmE4NTIzNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwgR29y
dG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA5IEp1biAy
MDE1IDExOjIyOjAwIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGVuc3VyZSBzZWFyY2hp
bmcgZm9yIGpzb24gaGVhZGVycyBzZWFyY2hlcyBzeXNyb290CkBAIC0zMiw3ICszMiw3IEBAIFNp
Z25lZC1vZmYtYnk6IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAzMzRiNTUxLi5mOWNm
NGE0IDEwMDY0NAoraW5kZXggZDlhYTRlMS4uYWMzMWM4YSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtODYzLDcgKzg2Myw3IEBAIEFTX0NBU0UoWyR3
aXRoX2xtZGJdLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYu
cGF0Y2gKaW5kZXggMTAyZmU0NmZmZS4uYTcxZjFlZDE4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4
M2E4OTJhZjE5YmYxNDU1Y2U3MTMyMzUwMzMyZWQ2ZDdmMWUyYjk0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA1NDA1YjNlYzZmZmVhMGFiZDkwNWU4MzAyYzY5NDIxOGQ3ODk3ODIyIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUWluZyBIZSA8cWluZy5oZUBpbnRlbC5jb20+
CiBEYXRlOiBUdWUsIDMwIE5vdiAyMDEwIDEzOjM1OjQyICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGJpbmQ6IGFkZCBuZXcgcmVjaXBlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBv
cnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKaW5kZXggOTg0ZDQwMWM3MC4uNWViMTM2ZDYy
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5k
LWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5
LXJvb3Rmcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTM5M2NiZjZiMDA4NDEyOGZkZmM5
YjVhZmIzYmNjMzA3MjY1ZDA5NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWE1MjIy
MjUyNTEyNzE5ZTczNDFkMWFjMGYyZWUwNWFkN2YwZTdjZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjcg
TWFyIDIwMTQgMDI6MzQ6NDEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gaW5pdC5kOiBhZGQgc3Vw
cG9ydCBmb3IgcmVhZC1vbmx5IHJvb3RmcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0
b3Atd29yay5wYXRjaAppbmRleCA3NGYyZWY4M2EwLi5kMDBiODc0MTNjIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0
b3Atd29yay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9t
YWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
Y2UwNjUwNmJiM2ZlNjYxZTAzMTYxYWYzYTYwM2JkMjI4NTkwYTI1NCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZmEzNjIzNGY3YTk1ODk3YzBiMWQ2NmZiNDlkYzU4NmU0NzQ3ZGQyNCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJp
dmVyLmNvbT4KIERhdGU6IFRodSwgMTUgTm92IDIwMTIgMDI6Mjc6NTQgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gYmluZDogbWFrZSAiL2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjkuYmIgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjEwLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzku
MjAuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4y
MC4xMC5iYgppbmRleCA5M2ZmOTU3ZmM1Li4zMmYwYmRmN2I1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4xMC5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50
YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgt
YmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
M2QyNjkwMGVkOWM5YTg1OTA3M2ZmZWE5Yjk3ZTI5MmMxMjQ4ZGFkMTgyNzliMTdiMDVmY2IyM2Mz
MDkxZjg2ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwZmIzYmEyYzMzN2JiNDg4Y2E2OGY1ZGYy
OTZjNDM1Y2QyNTUwNThmYjYzZDA4MjJlOTFkYjAyMzVjOTA1NzE2IgogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVT
ViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi40Ny4xCgo=

--===============6458550787633088460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.20.9.so /usr/lib/.debug/libisc-9.20.9.so /usr/lib/.debug/libisccfg-9.20.9.so /usr/lib/.debug/libisccc-9.20.9.so /usr/lib/.debug/libns-9.20.9.so", added "/usr/lib/.debug/libisccc-9.20.10.so /usr/lib/.debug/libdns-9.20.10.so /usr/lib/.debug/libns-9.20.10.so /usr/lib/.debug/libisc-9.20.10.so /usr/lib/.debug/libisccfg-9.20.10.so"
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 15065184 to 15073800 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1588892 to 1589444 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.9.so", added "/usr/lib/*-9.20.10.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.9.so /usr/lib/libdns-9.20.9.so /usr/lib/libisc-9.20.9.so /usr/lib/libns-9.20.9.so /usr/lib/libisccc-9.20.9.so", added "/usr/lib/libdns-9.20.10.so /usr/lib/libisc-9.20.10.so /usr/lib/libisccc-9.20.10.so /usr/lib/libisccfg-9.20.10.so /usr/lib/libns-9.20.10.so"
packages/core2-64-poky-linux/bind/bind-libs: PKGSIZE changed from 3507888 to 3507928 (+0%)
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind/bind: PKGSIZE changed from 1313097 to 1313129 (+0%)
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.20.9" to "9.20.10"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.9/bind-9.20.9.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.10/bind-9.20.10.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-64-poky-linux/bind: PKGV changed from 9.20.9 [default] to 9.20.10 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.20.9" to "9.20.10"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.9.so to libdns-9.20.10.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.9.so to libisccc-9.20.10.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.9.so to libisccfg-9.20.10.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.9.so to libisc-9.20.10.so
  /usr/lib/libns.so changed symlink target from libns-9.20.9.so to libns-9.20.10.so
  /usr/lib/libdns-9.20.10.so was added
  /usr/lib/libisc-9.20.10.so was added
  /usr/lib/libisccc-9.20.10.so was added
  /usr/lib/libisccfg-9.20.10.so was added
  /usr/lib/libns-9.20.10.so was added
  /usr/lib/libdns-9.20.9.so was removed
  /usr/lib/libisc-9.20.9.so was removed
  /usr/lib/libisccc-9.20.9.so was removed
  /usr/lib/libisccfg-9.20.9.so was removed
  /usr/lib/libns-9.20.9.so was removed

--===============6458550787633088460==--


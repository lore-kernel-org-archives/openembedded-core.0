Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C21CAC59F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:37 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30917.1757937276320908418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bZMCclpR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=snKUUiWd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101994d3a11c1-dde1644b-225f-47f0-b458-d98ee974c944-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m9HbIvrTwOMJoY3juS1DCee/t88TOzxQ7Vwjj+GCmgg=;
	b=bZMCclpREQlESPI2LiK2qGj1zwTo5MKScIHPVBEcJt7ef93R2ERy3E/vok94arb5
	lltaHkbIipIaWPWUY/KntRpw9pbIKVgBwS2qP2p0zUegyI1UdTD4eVRCGTTrz0kEvek
	facom0J5LcipmBRsR6bQ7Yj5ZiuLP+ZRFKrNZedA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m9HbIvrTwOMJoY3juS1DCee/t88TOzxQ7Vwjj+GCmgg=;
	b=snKUUiWdlA2s8gJIaxCisyT8b9mx9BwJ0vPmdf0APh4tvzlelVsddNvFXKhrEKf8
	UhXWcmtfBdYenUInY7zmVPX4RJfWHQ0VwCPYOvj+WpdMWn3QZMUTo6JO/NpFl5uBi4X
	RsWZXG1TYN5HoKj98Is5XTbUPhbNKl3bLQ+/Ur2Y=
Content-Type: multipart/mixed; boundary="===============3370136468463508891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.13 SUCCEEDED
Message-ID: <010101994d3a11c1-dde1644b-225f-47f0-b458-d98ee974c944-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223408

--===============3370136468463508891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.12-9.20.13.patch
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
From 7a5e76c389553d005790db2cdae3083b63958fb3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 07:15:02 +0000
Subject: [PATCH] bind: upgrade 9.20.12 -> 9.20.13

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.12.bb => bind_9.20.13.bb}                 | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.12.bb => bind_9.20.13.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 78ab6b87fc..10f3a19249 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
+From 4f689356fb4f9ddba7d8b70f578ac19abcbf12a6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 53e439721f..9d67d2c04b 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
+From 985e43285ec874d2d70003f4f4241f045d58e012 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f9cf4a4..0ce3d26 100644
+index 295bfd6..5c7d7fb 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d208fc1c..c267028b7d 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
+From 07059c54fd7db9c501e6d13488e09e0f2f6a81c1 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 334b551..f9cf4a4 100644
+index 6ee5459..295bfd6 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 102fe46ffe..45625d6ed3 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
+From 52e46486c064a0129205274eee72924c0c4d367a Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 984d401c70..eabd8ef409 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
+From 48c88fd1db101fba636ca86f8f345c6f3f186b68 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 74f2ef83a0..0250e1f2aa 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
+From 3c461dc6ff1aaad7c459f285f4cbcab3e436502d Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.12.bb b/meta/recipes-connectivity/bind/bind_9.20.13.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.12.bb
rename to meta/recipes-connectivity/bind/bind_9.20.13.bb
index d3db481930..de39924c3d 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.12.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.13.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "dd32d6eb67504e8a430aaf70b4ef894f3d0226b44c7e02370c9b0d377f1c7999"
+SRC_URI[sha256sum] = "151f9376ead317e646a5d0c9f01c060386d891118d7437a7f829bb9727c7b34c"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============3370136468463508891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.12-9.20.13.patch"

RnJvbSA3YTVlNzZjMzg5NTUzZDAwNTc5MGRiMmNkYWUzMDgzYjYzOTU4ZmIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDc6MTU6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMTIgLT4gOS4yMC4xMwoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEt
YXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uMDAw
MS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8
IDQgKystLQogLi4uYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNo
ZXMtc3lzci5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvY29uZi5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL2JpbmQvaW5pdC5k
LWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgfCAyICstCiAuLi4vYmlu
ZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICAgICAgICAgICAgIHwg
MiArLQogLi4uL2JpbmQve2JpbmRfOS4yMC4xMi5iYiA9PiBiaW5kXzkuMjAuMTMuYmJ9ICAgICAg
ICAgICAgICAgICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85
LjIwLjEyLmJiID0+IGJpbmRfOS4yMC4xMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0
aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8w
MDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKaW5kZXggNzhhYjZi
ODdmYy4uMTBmM2ExOTI0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQt
ZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzcwZjc0
MTY0YmVhOGE4YzU0YzAzYmVjZmZiMmYyMTEwM2RkMWYzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNGY2ODkzNTZmYjRmOWRkYmE3ZDhiNzBmNTc4YWMxOWFiY2JmMTJhNiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4K
IERhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6MDkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
YXZvaWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQt
bG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9w
dGlvbnMucGF0Y2gKaW5kZXggNTNlNDM5NzIxZi4uOWQ2N2QyYzA0YiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQt
c3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlk
ZS1idWlsZC1vcHRpb25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwZGQ2N2Q4NTcwNWNi
Y2ZhOWEyNzU5YzQ2ZjNjZGYzZDBkNjM3NWRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5ODVlNDMyODVlYzg3NGQyZDcwMDAzZjRmNDI0MWYwNDVkNThlMDEyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgog
RGF0ZTogTW9uLCAyNyBBdWcgMjAxOCAyMToyNDoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBg
bmFtZWQvbHdyZXNkIC1WJyBhbmQgc3RhcnQgbG9nIGhpZGUgYnVpbGQgb3B0aW9ucwpAQCAtMjAs
NyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXJAbXZpc3RhLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZjljZjRhNC4uMGNl
M2QyNiAxMDA2NDQKK2luZGV4IDI5NWJmZDYuLjVjN2Q3ZmIgMTAwNjQ0CiAtLS0gYS9jb25maWd1
cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTM1LDcgKzM1LDcgQEAgQUNfREVGSU5FKFtQ
QUNLQUdFX1ZFUlNJT05fRVhUUkFdLCBbIl1bYmluZF9WRVJTSU9OX0VYVFJBXVsiXSwgW0JJTkQg
OSBFeHRyYSBwYXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3Iu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1z
ZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCmluZGV4IDM4ZDIw
OGZjMWMuLmMyNjcwMjhiN2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVz
LXN5c3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmlu
ZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gOGM5YzgxNzkzM2VlZjIwMzI4ZjEwMjM3YmJkOTY0NTgwZGIw
YTNhZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDcwNTljNTRmZDdkYjljNTAxZTZk
MTM0ODhlMDllMGYyZjZhODFjMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwg
R29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA5IEp1
biAyMDE1IDExOjIyOjAwIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGVuc3VyZSBzZWFy
Y2hpbmcgZm9yIGpzb24gaGVhZGVycyBzZWFyY2hlcyBzeXNyb290CkBAIC0zMiw3ICszMiw3IEBA
IFNpZ25lZC1vZmYtYnk6IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAzMzRiNTUxLi5m
OWNmNGE0IDEwMDY0NAoraW5kZXggNmVlNTQ1OS4uMjk1YmZkNiAxMDA2NDQKIC0tLSBhL2NvbmZp
Z3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtODYzLDcgKzg2Myw3IEBAIEFTX0NBU0Uo
WyR3aXRoX2xtZGJdLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2Nv
bmYucGF0Y2gKaW5kZXggMTAyZmU0NmZmZS4uNDU2MjVkNmVkMyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA4M2E4OTJhZjE5YmYxNDU1Y2U3MTMyMzUwMzMyZWQ2ZDdmMWUyYjk0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA1MmU0NjQ4NmMwNjRhMDEyOTIwNTI3NGVlZTcyOTI0YzBjNGQzNjdh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUWluZyBIZSA8cWluZy5oZUBpbnRlbC5j
b20+CiBEYXRlOiBUdWUsIDMwIE5vdiAyMDEwIDEzOjM1OjQyICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGJpbmQ6IGFkZCBuZXcgcmVjaXBlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1
cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKaW5kZXggOTg0ZDQwMWM3MC4uZWFiZDhl
ZjQwOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1v
bmx5LXJvb3Rmcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTM5M2NiZjZiMDA4NDEyOGZk
ZmM5YjVhZmIzYmNjMzA3MjY1ZDA5NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDhj
ODhmZDFkYjEwMWZiYTYzNmNhODZmOGYzNDVjNmYzZjE4NmI2OCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwg
MjcgTWFyIDIwMTQgMDI6MzQ6NDEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gaW5pdC5kOiBhZGQg
c3VwcG9ydCBmb3IgcmVhZC1vbmx5IHJvb3RmcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5k
LXN0b3Atd29yay5wYXRjaAppbmRleCA3NGYyZWY4M2EwLi4wMjUwZTFmMmFhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5k
LXN0b3Atd29yay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gY2UwNjUwNmJiM2ZlNjYxZTAzMTYxYWYzYTYwM2JkMjI4NTkwYTI1NCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gM2M0NjFkYzZmZjFhYWFkN2M0NTlmMjg1ZjRjYmNhYjNlNDM2NTAy
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTUgTm92IDIwMTIgMDI6Mjc6NTQgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gYmluZDogbWFrZSAiL2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjEyLmJiIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4xMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZF85LjIwLjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZF85LjIwLjEzLmJiCmluZGV4IGQzZGI0ODE5MzAuLmRlMzk5MjRjM2QgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMTIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4xMy5iYgpAQCAtMjAsNyArMjAsNyBA
QCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0k
e1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJl
LXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZGQzMmQ2ZWI2NzUwNGU4YTQzMGFhZjcwYjRlZjg5NGYzZDAyMjZiNDRjN2UwMjM3MGM5
YjBkMzc3ZjFjNzk5OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxNTFmOTM3NmVhZDMxN2U2NDZh
NWQwYzlmMDFjMDYwMzg2ZDg5MTExOGQ3NDM3YTdmODI5YmI5NzI3YzdiMzRjIgogCiBVUFNUUkVB
TV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cg
dGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi40Ny4xCgo=

--===============3370136468463508891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccfg-9.20.12.so /usr/lib/.debug/libdns-9.20.12.so /usr/lib/.debug/libns-9.20.12.so /usr/lib/.debug/libisccc-9.20.12.so /usr/lib/.debug/libisc-9.20.12.so", added "/usr/lib/.debug/libns-9.20.13.so /usr/lib/.debug/libisccc-9.20.13.so /usr/lib/.debug/libisccfg-9.20.13.so /usr/lib/.debug/libisc-9.20.13.so /usr/lib/.debug/libdns-9.20.13.so"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 15101800 to 15137528 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1591330 to 1594253 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.12.so", added "/usr/lib/*-9.20.13.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.12.so /usr/lib/libdns-9.20.12.so /usr/lib/libisccfg-9.20.12.so /usr/lib/libisc-9.20.12.so /usr/lib/libns-9.20.12.so", added "/usr/lib/libisccfg-9.20.13.so /usr/lib/libns-9.20.13.so /usr/lib/libdns-9.20.13.so /usr/lib/libisc-9.20.13.so /usr/lib/libisccc-9.20.13.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGSIZE changed from 3528472 to 3540792 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 116654 to 118002 (+1%)
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.12" to "9.20.13"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.12/bind-9.20.12.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.13/bind-9.20.13.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.12 [default] to 9.20.13 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.12" to "9.20.13"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.12.so to libdns-9.20.13.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.12.so to libisccc-9.20.13.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.12.so to libisccfg-9.20.13.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.12.so to libisc-9.20.13.so
  /usr/lib/libns.so changed symlink target from libns-9.20.12.so to libns-9.20.13.so
  /usr/lib/libdns-9.20.12.so moved to /usr/lib/libdns-9.20.13.so
  /usr/lib/libisc-9.20.12.so moved to /usr/lib/libisc-9.20.13.so
  /usr/lib/libisccc-9.20.12.so moved to /usr/lib/libisccc-9.20.13.so
  /usr/lib/libisccfg-9.20.12.so moved to /usr/lib/libisccfg-9.20.13.so
  /usr/lib/libns-9.20.12.so moved to /usr/lib/libns-9.20.13.so

--===============3370136468463508891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.12.so /usr/lib/libisc-9.20.12.so /usr/lib/libisccfg-9.20.12.so /usr/lib/libisccc-9.20.12.so /usr/lib/libns-9.20.12.so", added "/usr/lib/libisccc-9.20.13.so /usr/lib/libdns-9.20.13.so /usr/lib/libisc-9.20.13.so /usr/lib/libisccfg-9.20.13.so /usr/lib/libns-9.20.13.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.12.so to libdns-9.20.13.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.12.so to libisccc-9.20.13.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.12.so to libisccfg-9.20.13.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.12.so to libisc-9.20.13.so
  /usr/lib/libns.so changed symlink target from libns-9.20.12.so to libns-9.20.13.so
  /usr/lib/libdns-9.20.12.so moved to /usr/lib/libdns-9.20.13.so
  /usr/lib/libisc-9.20.12.so moved to /usr/lib/libisc-9.20.13.so
  /usr/lib/libisccc-9.20.12.so moved to /usr/lib/libisccc-9.20.13.so
  /usr/lib/libisccfg-9.20.12.so moved to /usr/lib/libisccfg-9.20.13.so
  /usr/lib/libns-9.20.12.so moved to /usr/lib/libns-9.20.13.so

--===============3370136468463508891==--


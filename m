Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EE7D5C0EF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17391.1765872135074496581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Pv6u6Ath;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=I9IpMO8i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e6951-42070c03-5370-474c-bac5-2d512e8f3bf8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IHPyFpe9r8JXdrCSNtHfDFkCE5N+NxNqO0Y+TyuvtJs=;
	b=Pv6u6AthmJvxNVzlQVvHXXohkFMpTYFeph2A5jsB91c+PENuVRyyHq97cQgIUAUA
	GBJerpYGsdjnmn4Jo8J1VcgbniIH7lBictt7rPCzgzA7dJGKhn+r3xeNF5UJntm7ftr
	WuPRmLog4joCLkAiSRzWFowrS16gFj59nGlHsItI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IHPyFpe9r8JXdrCSNtHfDFkCE5N+NxNqO0Y+TyuvtJs=;
	b=I9IpMO8ian99S2RsCzgT+XxDOn8o/IKYdBeyOrx2QEevjMppc/i5h/ImQ5c67rL2
	J+WWfJPOlg20+y9u0NUKMiOm1yUDrHCEY2OIx9QHoyLFUHlEIzSr/nzS3NHuzeVblVg
	Hgl9qPexm6ABx8Qp4D02nD+NqZxUHm+c3vl8LgDU=
Content-Type: multipart/mixed; boundary="===============6560697763322577286=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.16 SUCCEEDED
Message-ID: <0101019b262e6951-42070c03-5370-474c-bac5-2d512e8f3bf8-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227777

--===============6560697763322577286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.15-9.20.16.patch
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
From a734e0cb5517c3fbbf77173e6c7817668c15d5c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 21:58:18 +0000
Subject: [PATCH] bind: upgrade 9.20.15 -> 9.20.16

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch | 2 +-
 ...01-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 meta/recipes-connectivity/bind/bind/conf.patch              | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch           | 2 +-
 .../bind/{bind_9.20.15.bb => bind_9.20.16.bb}               | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.15.bb => bind_9.20.16.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index dda94c14e7..97eb705481 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 7128d079b0c315414410c4bcfb18b445cd7afda2 Mon Sep 17 00:00:00 2001
+From 0f2b89c948375d06415d209381ee9c8eeb53b998 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 5d3bd682f4..8a50e0fc56 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 56249e557c820a743f1390174bd93104698e70f2 Mon Sep 17 00:00:00 2001
+From d5554526a25f3b8e50206baa94401197bc98634e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 295bfd6..5c7d7fb 100644
+index 481ec7a..9f4ecd0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 9bbe0998c6..83b7b07618 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fe34ede0bbb0c60624cc281c938b9ca784505f5a Mon Sep 17 00:00:00 2001
+From 984edfef3433374872c672a345126b8c029b3b5d Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,10 +32,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6ee5459..295bfd6 100644
+index 152db02..481ec7a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
+@@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 8a45667fc4..bfb69f9d6a 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 24452a9a46ba21233925218e4fca066b338ba70d Mon Sep 17 00:00:00 2001
+From 934d86695041852f04cf262b8f2984ebe4b16bee Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 97fac429dd..66b2156cf2 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 2fb98a36b3b35aeaa4852bd8bc268fbf66d0ad2d Mon Sep 17 00:00:00 2001
+From 5b80ecb4bc5205310bc25771a3f994072aed2b9d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 3adb694eaa..331d354cd6 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 3f18a00d627ec06d26d189e7ef1818d2c237274b Mon Sep 17 00:00:00 2001
+From fa3a73d937dfc32a0f54ce9e8724e0c2cfe5d530 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.15.bb b/meta/recipes-connectivity/bind/bind_9.20.16.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.15.bb
rename to meta/recipes-connectivity/bind/bind_9.20.16.bb
index 1195b5bdc3..33068b5b5a 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "d62b38fae48ba83fca6181112d0c71018d8b0f2ce285dc79dc6a0367722ccabb"
+SRC_URI[sha256sum] = "03ffcc7a4fcb7c39b82b34be1ba2b59f6c191bc795c5935530d5ebe630a352d6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============6560697763322577286==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.15-9.20.16.patch"

RnJvbSBhNzM0ZTBjYjU1MTdjM2ZiYmY3NzE3M2U2Yzc4MTc2NjhjMTVkNWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjE6NTg6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMTUgLT4gOS4yMC4xNgoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEt
YXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCB8IDIgKy0KIC4uLjAxLW5h
bWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIHwgNCAr
Ky0tCiAuLi5uZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCB8IDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9j
b25mLnBhdGNoICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL2JpbmQvaW5pdC5kLWFkZC1z
dXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoIHwgMiArLQogLi4uL2JpbmQvYmluZC9t
YWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgICAgICAgICAgfCAyICstCiAuLi4v
YmluZC97YmluZF85LjIwLjE1LmJiID0+IGJpbmRfOS4yMC4xNi5iYn0gICAgICAgICAgICAgICB8
IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzkuMjAuMTUuYmIg
PT4gYmluZF85LjIwLjE2LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNl
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQt
c3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAppbmRleCBkZGE5NGMxNGU3Li45N2Vi
NzA1NDgxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8w
MDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdp
dGgtYmluZC11c2VyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MTI4ZDA3OWIwYzMxNTQx
NDQxMGM0YmNmYjE4YjQ0NWNkN2FmZGEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAw
ZjJiODljOTQ4Mzc1ZDA2NDE1ZDIwOTM4MWVlOWM4ZWViNTNiOTk4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9u
LCAxNSBPY3QgMjAxOCAxNjo1NTowOSArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBzdGFy
dCBmYWlsdXJlIHdpdGggYmluZCB1c2VyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1i
dWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
MDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRj
aAppbmRleCA1ZDNiZDY4MmY0Li44YTUwZTBmYzU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ct
aGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9w
dGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2MjQ5ZTU1N2M4MjBhNzQzZjEzOTAx
NzRiZDkzMTA0Njk4ZTcwZjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ1NTU0NTI2
YTI1ZjNiOGU1MDIwNmJhYTk0NDAxMTk3YmM5ODYzNGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24s
IDI3IEF1ZyAyMDE4IDIxOjI0OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBuYW1lZC9sd3Jl
c2QgLVYnIGFuZCBzdGFydCBsb2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0yMCw3ICsyMCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAyOTViZmQ2Li41YzdkN2ZiIDEwMDY0
NAoraW5kZXggNDgxZWM3YS4uOWY0ZWNkMCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysr
IGIvY29uZmlndXJlLmFjCiBAQCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUoW1BBQ0tBR0VfVkVS
U0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklORCA5IEV4dHJhIHBh
cgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1l
bnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1m
b3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggOWJiZTA5OThjNi4uODNi
N2IwNzYxOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
YmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1z
ZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBmZTM0ZWRlMGJiYjBjNjA2MjRjYzI4MWM5MzhiOWNhNzg0NTA1ZjVhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ODRlZGZlZjM0MzMzNzQ4NzJjNjcyYTM0NTEyNmI4
YzAyOWIzYjVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBHb3J0bWFrZXIg
PHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkgSnVuIDIwMTUgMTE6
MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNlYXJjaGluZyBmb3Ig
anNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5c3Jvb3QKQEAgLTMyLDEwICszMiwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNmVlNTQ1OS4uMjk1YmZkNiAx
MDA2NDQKK2luZGV4IDE1MmRiMDIuLjQ4MWVjN2EgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMK
ICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTg2Myw3ICs4NjMsNyBAQCBBU19DQVNFKFskd2l0aF9s
bWRiXSwKK0BAIC04NjUsNyArODY1LDcgQEAgQVNfQ0FTRShbJHdpdGhfbG1kYl0sCiAgCVtub10s
W10sCiAgCVthdXRvfHllc10sIFtQS0dfQ0hFQ0tfTU9EVUxFUyhbTE1EQl0sIFtsbWRiXSwKICAJ
CQkJICAgICAgIFthY19saWJfbG1kYl9mb3VuZD15ZXNdLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKaW5kZXggOGE0NTY2N2ZjNC4uYmZiNjlmOWQ2
YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNDQ1MmE5YTQ2YmEyMTIzMzkyNTIxOGU0ZmNhMDY2YjMz
OGJhNzBkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MzRkODY2OTUwNDE4NTJmMDRj
ZjI2MmI4ZjI5ODRlYmU0YjE2YmVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUWlu
ZyBIZSA8cWluZy5oZUBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDMwIE5vdiAyMDEwIDEzOjM1OjQy
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGFkZCBuZXcgcmVjaXBlCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQt
Zm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKaW5k
ZXggOTdmYWM0MjlkZC4uNjZiMjE1NmNmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMmZiOThhMzZiM2IzNWFlYWE0ODUyYmQ4YmMyNjhmYmY2NmQwYWQyZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNWI4MGVjYjRiYzUyMDUzMTBiYzI1NzcxYTNmOTk0MDcyYWVkMmI5
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJp
dmVyLmNvbT4KIERhdGU6IFRodSwgMjcgTWFyIDIwMTQgMDI6MzQ6NDEgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gaW5pdC5kOiBhZGQgc3VwcG9ydCBmb3IgcmVhZC1vbmx5IHJvb3RmcwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQt
YmluZC1zdG9wLXdvcmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaAppbmRleCAzYWRiNjk0ZWFhLi4z
MzFkMzU0Y2Q2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2YxOGEwMGQ2MjdlYzA2ZDI2ZDE4OWU3ZWYxODE4ZDJj
MjM3Mjc0YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmEzYTczZDkzN2RmYzMyYTBm
NTRjZTllODcyNGUwYzJjZmU1ZDUzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJv
eSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTUgTm92IDIwMTIg
MDI6Mjc6NTQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogbWFrZSAiL2V0Yy9pbml0LmQv
YmluZCBzdG9wIiB3b3JrCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZF85LjIwLjE1LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRf
OS4yMC4xNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjE1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjE2LmJiCmluZGV4IDExOTViNWJkYzMuLjMzMDY4
YjViNWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzku
MjAuMTUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4x
Ni5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNj
L2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDYyYjM4ZmFlNDhiYTgzZmNhNjE4MTExMmQwYzcx
MDE4ZDhiMGYyY2UyODVkYzc5ZGM2YTAzNjc3MjJjY2FiYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIwM2ZmY2M3YTRmY2I3YzM5YjgyYjM0YmUxYmEyYjU5ZjZjMTkxYmM3OTVjNTkzNTUzMGQ1ZWJl
NjMwYTM1MmQ2IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9p
c2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAK
Mi40Ny4xCgo=

--===============6560697763322577286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.15.so /usr/lib/libdns-9.20.15.so /usr/lib/libisc-9.20.15.so /usr/lib/libisccfg-9.20.15.so /usr/lib/libns-9.20.15.so", added "/usr/lib/libdns-9.20.16.so /usr/lib/libisccfg-9.20.16.so /usr/lib/libisc-9.20.16.so /usr/lib/libisccc-9.20.16.so /usr/lib/libns-9.20.16.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.15.so to libdns-9.20.16.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.15.so to libisccc-9.20.16.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.15.so to libisccfg-9.20.16.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.15.so to libisc-9.20.16.so
  /usr/lib/libns.so changed symlink target from libns-9.20.15.so to libns-9.20.16.so
  /usr/lib/libdns-9.20.15.so moved to /usr/lib/libdns-9.20.16.so
  /usr/lib/libisc-9.20.15.so moved to /usr/lib/libisc-9.20.16.so
  /usr/lib/libisccc-9.20.15.so moved to /usr/lib/libisccc-9.20.16.so
  /usr/lib/libisccfg-9.20.15.so moved to /usr/lib/libisccfg-9.20.16.so
  /usr/lib/libns-9.20.15.so moved to /usr/lib/libns-9.20.16.so

--===============6560697763322577286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libns-9.20.15.so /usr/lib/.debug/libdns-9.20.15.so /usr/lib/.debug/libisc-9.20.15.so /usr/lib/.debug/libisccfg-9.20.15.so /usr/lib/.debug/libisccc-9.20.15.so", added "/usr/lib/.debug/libdns-9.20.16.so /usr/lib/.debug/libisc-9.20.16.so /usr/lib/.debug/libisccc-9.20.16.so /usr/lib/.debug/libns-9.20.16.so /usr/lib/.debug/libisccfg-9.20.16.so"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 15162104 to 15165456 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1596129 to 1596315 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.20.15.so /usr/lib/libdns-9.20.15.so /usr/lib/libisc-9.20.15.so /usr/lib/libisccc-9.20.15.so /usr/lib/libisccfg-9.20.15.so", added "/usr/lib/libisccfg-9.20.16.so /usr/lib/libns-9.20.16.so /usr/lib/libdns-9.20.16.so /usr/lib/libisc-9.20.16.so /usr/lib/libisccc-9.20.16.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.15.so", added "/usr/lib/*-9.20.16.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.15/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.16/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.15/lib/isccc -> /usr/src/debug/bind/9.20.16/lib/isccc, directory renamed /usr/src/debug/bind/9.20.15/bin/named -> /usr/src/debug/bind/9.20.16/bin/named, directory renamed /usr/src/debug/bind/9.20.15/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.16/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.15/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.16/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.15/bin/nsupdate -> /usr/src/debug/bind/9.20.16/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.15/lib/isc/netmgr -> /usr/src/debug/bind/9.20.16/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.15/lib/dns -> /usr/src/debug/bind/9.20.16/lib/dns, directory renamed /usr/src/debug/bind/9.20.15/lib/i
 sc/include/isc -> /usr/src/debug/bind/9.20.16/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.16/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.15/bin/check -> /usr/src/debug/bind/9.20.16/bin/check, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.16/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.15/bin/confgen -> /usr/src/debug/bind/9.20.16/bin/confgen, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.16/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.15/bin/plugins -> /usr/src/debug/bind/9.20.16/bin/plugins, directory renamed /usr/src/debug/bind/9.20.15/bin/dnssec -> /usr/src/debug/bind/9.20.16/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.16/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/incl
 ude/irs -> /usr/src/debug/bind/9.20.16/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.15/bin/dig -> /usr/src/debug/bind/9.20.16/bin/dig, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/include/dst -> /usr/src/debug/bind/9.20.16/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.15/bin/tools -> /usr/src/debug/bind/9.20.16/bin/tools, directory renamed /usr/src/debug/bind/9.20.15/bin/rndc -> /usr/src/debug/bind/9.20.16/bin/rndc, directory renamed /usr/src/debug/bind/9.20.15/bin/named/include/named -> /usr/src/debug/bind/9.20.16/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/include/dns -> /usr/src/debug/bind/9.20.16/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.15/lib/ns -> /usr/src/debug/bind/9.20.16/lib/ns, directory renamed /usr/src/debug/bind/9.20.15/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.16/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.15/bin/delv -> /usr/src/debug/
 bind/9.20.16/bin/delv, directory renamed /usr/src/debug/bind/9.20.15/lib/ns/include/ns -> /usr/src/debug/bind/9.20.16/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.15/lib/isccfg -> /usr/src/debug/bind/9.20.16/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.15/bin/named/include/dlz -> /usr/src/debug/bind/9.20.16/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.15/lib/isc -> /usr/src/debug/bind/9.20.16/lib/isc
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10064990 to 10066238 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind/bind: PKGSIZE changed from 1317193 to 1317257 (+0%)
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.15 [default] to 9.20.16 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.15" to "9.20.16"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.15/bind-9.20.15.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.16/bind-9.20.16.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.15.so to libdns-9.20.16.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.15.so to libisccc-9.20.16.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.15.so to libisccfg-9.20.16.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.15.so to libisc-9.20.16.so
  /usr/lib/libns.so changed symlink target from libns-9.20.15.so to libns-9.20.16.so
  /usr/lib/libdns-9.20.15.so moved to /usr/lib/libdns-9.20.16.so
  /usr/lib/libisc-9.20.15.so moved to /usr/lib/libisc-9.20.16.so
  /usr/lib/libisccc-9.20.15.so moved to /usr/lib/libisccc-9.20.16.so
  /usr/lib/libisccfg-9.20.15.so moved to /usr/lib/libisccfg-9.20.16.so
  /usr/lib/libns-9.20.15.so moved to /usr/lib/libns-9.20.16.so

--===============6560697763322577286==--


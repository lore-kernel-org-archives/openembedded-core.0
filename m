Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C90CA0EC5
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.88629.1754057268399332155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j9JQOBCh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=f0DYJmFH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019865f5d9b7-0984db27-b5ef-41d5-9630-be42ec84478b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ad4NvTWULg8kJBokfGiKzP/dQjnlpoh3oC200TaRC5Y=;
	b=j9JQOBChDIeiJQ2FZfdQYOmRvQqnfWhwdQf/p9tm80Bbb/+ZP1qyI6hqrzCp6o2U
	DRlm21mfBsBbv4jafSYiFoXBSC4/ntVD5rIDy03SVGo3w466Cl6C/apZMCxfoJjmtt5
	dNjrMVbms6dc59iWRUwvjX913Ypi0SBwym5FpS+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ad4NvTWULg8kJBokfGiKzP/dQjnlpoh3oC200TaRC5Y=;
	b=f0DYJmFHLXJznCn65YduYSmUBOWZKpcqi6/3DGdKZTc+IPjCc41J/wkeYDZ+rcQg
	7n65FXVKxLlXru9OfCqE9m+x4E5/CZSG9+cJO0kz4kogptdYcRkPSoJf9ArrN52bKOs
	vKQmbWPlAPVoxblHSvnjS1uiUlntE5pCrRUnBvHA=
Content-Type: multipart/mixed; boundary="===============4133422508841823185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.11 SUCCEEDED
Message-ID: <0101019865f5d9b7-0984db27-b5ef-41d5-9630-be42ec84478b-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221262

--===============4133422508841823185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.10-9.20.11.patch
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
From 3de2db783625bbc5d1e4847a3e5f956122cbea22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 08:26:15 +0000
Subject: [PATCH] bind: upgrade 9.20.10 -> 9.20.11

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.10.bb => bind_9.20.11.bb}                 | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.10.bb => bind_9.20.11.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 78ab6b87fc..afb09f40a2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
+From f7e8be34d49cf4bcf5b44eb9c8c9c3e3304eec0f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 53e439721f..c1f2291b4b 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
+From 085f8c4bebfbbd0ec5a68d8cbc1d8ada78db36da Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f9cf4a4..0ce3d26 100644
+index 8700f81..102d8fa 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d208fc1c..d6480dbd37 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
+From 456b454e0456a11ab118084ef2311c7b1cd8ba8b Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 334b551..f9cf4a4 100644
+index f25c368..8700f81 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 102fe46ffe..f8f978dec9 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
+From 94a9914a6c2b7ca9dac5be9600e83d68ed6d03c5 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 984d401c70..f4b1281532 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
+From 142b1a5dbf2935c848c49becfa71421a3ab0fd20 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 74f2ef83a0..b883fd1402 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
+From 9438376167b00a3b4ecda093e956eee47c97e7ef Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.10.bb b/meta/recipes-connectivity/bind/bind_9.20.11.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.10.bb
rename to meta/recipes-connectivity/bind/bind_9.20.11.bb
index 32f0bdf7b5..8d230f6e95 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.10.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.11.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0fb3ba2c337bb488ca68f5df296c435cd255058fb63d0822e91db0235c905716"
+SRC_URI[sha256sum] = "4da2d532e668bc21e883f6e6d9d3d81794d9ec60b181530385649a56f46ee17a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============4133422508841823185==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.10-9.20.11.patch"

RnJvbSAzZGUyZGI3ODM2MjViYmM1ZDFlNDg0N2EzZTVmOTU2MTIyY2JlYTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwODoyNjoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC4xMCAtPiA5LjIwLjExCgotLS0KIC4uLi9iaW5kL2JpbmQvMDAwMS1h
dm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICAgfCAyICstCiAuLi4wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIHwg
NCArKy0tCiAuLi5iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hl
cy1zeXNyLnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9jb25mLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2JpbmQvYmluZC9pbml0LmQt
YWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggICB8IDIgKy0KIC4uLi9iaW5k
L2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgICAgICAgfCAy
ICstCiAuLi4vYmluZC97YmluZF85LjIwLjEwLmJiID0+IGJpbmRfOS4yMC4xMS5iYn0gICAgICAg
ICAgICAgICAgIHwgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzku
MjAuMTAuYmIgPT4gYmluZF85LjIwLjExLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRo
LWJpbmQtdXNlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAppbmRleCA3OGFiNmI4
N2ZjLi5hZmIwOWY0MGEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNzBmNzQx
NjRiZWE4YThjNTRjMDNiZWNmZmIyZjIxMTAzZGQxZjMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBmN2U4YmUzNGQ0OWNmNGJjZjViNDRlYjljOGM5YzNlMzMwNGVlYzBmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgog
RGF0ZTogTW9uLCAxNSBPY3QgMjAxOCAxNjo1NTowOSArMDgwMAogU3ViamVjdDogW1BBVENIXSBh
dm9pZCBzdGFydCBmYWlsdXJlIHdpdGggYmluZCB1c2VyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1s
b2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0
aW9ucy5wYXRjaAppbmRleCA1M2U0Mzk3MjFmLi5jMWYyMjkxYjRiIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1z
dGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRl
LWJ1aWxkLW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBkZDY3ZDg1NzA1Y2Jj
ZmE5YTI3NTljNDZmM2NkZjNkMGQ2Mzc1ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDA4NWY4YzRiZWJmYmJkMGVjNWE2OGQ4Y2JjMWQ4YWRhNzhkYjM2ZGEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBE
YXRlOiBNb24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBu
YW1lZC9sd3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0yMCw3
ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBmOWNmNGE0Li4wY2Uz
ZDI2IDEwMDY0NAoraW5kZXggODcwMGY4MS4uMTAyZDhmYSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUoW1BB
Q0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklORCA5
IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNl
YXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggMzhkMjA4
ZmMxYy4uZDY0ODBkYmQzNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMt
c3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5k
LWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA4YzljODE3OTMzZWVmMjAzMjhmMTAyMzdiYmQ5NjQ1ODBkYjBh
M2FkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NTZiNDU0ZTA0NTZhMTFhYjExODA4
NGVmMjMxMWM3YjFjZDhiYThiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBH
b3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkgSnVu
IDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNlYXJj
aGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5c3Jvb3QKQEAgLTMyLDcgKzMyLDcgQEAg
U2lnbmVkLW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDMzNGI1NTEuLmY5
Y2Y0YTQgMTAwNjQ0CitpbmRleCBmMjVjMzY4Li44NzAwZjgxIDEwMDY0NAogLS0tIGEvY29uZmln
dXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04NjMsNyArODYzLDcgQEAgQVNfQ0FTRShb
JHdpdGhfbG1kYl0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29u
Zi5wYXRjaAppbmRleCAxMDJmZTQ2ZmZlLi5mOGY5NzhkZWM5IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDgzYTg5MmFmMTliZjE0NTVjZTcxMzIzNTAzMzJlZDZkN2YxZTJiOTQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDk0YTk5MTRhNmMyYjdjYTlkYWM1YmU5NjAwZTgzZDY4ZWQ2ZDAzYzUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNv
bT4KIERhdGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gYmluZDogYWRkIG5ldyByZWNpcGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3Vw
cG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRleCA5ODRkNDAxYzcwLi5mNGIxMjgx
NTMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0
LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9u
bHktcm9vdGZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxMzkzY2JmNmIwMDg0MTI4ZmRm
YzliNWFmYjNiY2MzMDcyNjVkMDk0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNDJi
MWE1ZGJmMjkzNWM4NDhjNDliZWNmYTcxNDIxYTNhYjBmZDIwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAy
NyBNYXIgMjAxNCAwMjozNDo0MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFkZCBz
dXBwb3J0IGZvciByZWFkLW9ubHkgcm9vdGZzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQt
c3RvcC13b3JrLnBhdGNoCmluZGV4IDc0ZjJlZjgzYTAuLmI4ODNmZDE0MDIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQt
c3RvcC13b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBjZTA2NTA2YmIzZmU2NjFlMDMxNjFhZjNhNjAzYmQyMjg1OTBhMjU0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA5NDM4Mzc2MTY3YjAwYTNiNGVjZGEwOTNlOTU2ZWVlNDdjOTdlN2Vm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAogU3ViamVj
dDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMTAuYmIgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjExLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
XzkuMjAuMTAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
XzkuMjAuMTEuYmIKaW5kZXggMzJmMGJkZjdiNS4uOGQyMzBmNmU5NSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4xMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjExLmJiCkBAIC0yMCw3ICsyMCw3IEBA
IFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59LSR7
UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUt
d2l0aC1iaW5kLXVzZXIucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIwZmIzYmEyYzMzN2JiNDg4Y2E2OGY1ZGYyOTZjNDM1Y2QyNTUwNThmYjYzZDA4MjJlOTFk
YjAyMzVjOTA1NzE2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRkYTJkNTMyZTY2OGJjMjFlODgz
ZjZlNmQ5ZDNkODE3OTRkOWVjNjBiMTgxNTMwMzg1NjQ5YTU2ZjQ2ZWUxN2EiCiAKIFVQU1RSRUFN
X0NIRUNLX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8iCiAjIGZvbGxvdyB0
aGUgRVNWIHZlcnNpb25zIGRpdmlzaWJsZSBieSAyCi0tIAoyLjQ3LjEKCg==

--===============4133422508841823185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libns-9.20.10.so /usr/lib/.debug/libisccc-9.20.10.so /usr/lib/.debug/libisc-9.20.10.so /usr/lib/.debug/libdns-9.20.10.so /usr/lib/.debug/libisccfg-9.20.10.so", added "/usr/lib/.debug/libisccc-9.20.11.so /usr/lib/.debug/libisccfg-9.20.11.so /usr/lib/.debug/libisc-9.20.11.so /usr/lib/.debug/libns-9.20.11.so /usr/lib/.debug/libdns-9.20.11.so"
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 15074176 to 15076960 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1589444 to 1589947 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.10.so", added "/usr/lib/*-9.20.11.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.10.so /usr/lib/libisccfg-9.20.10.so /usr/lib/libisc-9.20.10.so /usr/lib/libns-9.20.10.so /usr/lib/libisccc-9.20.10.so", added "/usr/lib/libdns-9.20.11.so /usr/lib/libisccc-9.20.11.so /usr/lib/libisc-9.20.11.so /usr/lib/libisccfg-9.20.11.so /usr/lib/libns-9.20.11.so"
packages/core2-64-poky-linux/bind/bind-libs: PKGSIZE changed from 3507928 to 3512024 (+0%)
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind-utils: PKGSIZE changed from 479736 to 483832 (+1%)
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.20.10" to "9.20.11"
packages/core2-64-poky-linux/bind: PKGV changed from 9.20.10 [default] to 9.20.11 [default]
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.10/bind-9.20.10.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.11/bind-9.20.11.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.10.so to libdns-9.20.11.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.10.so to libisccc-9.20.11.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.10.so to libisccfg-9.20.11.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.10.so to libisc-9.20.11.so
  /usr/lib/libns.so changed symlink target from libns-9.20.10.so to libns-9.20.11.so
  /usr/lib/libdns-9.20.10.so moved to /usr/lib/libdns-9.20.11.so
  /usr/lib/libisc-9.20.10.so moved to /usr/lib/libisc-9.20.11.so
  /usr/lib/libisccc-9.20.10.so moved to /usr/lib/libisccc-9.20.11.so
  /usr/lib/libisccfg-9.20.10.so moved to /usr/lib/libisccfg-9.20.11.so
  /usr/lib/libns-9.20.10.so moved to /usr/lib/libns-9.20.11.so

--===============4133422508841823185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.20.10.so /usr/lib/libisccfg-9.20.10.so /usr/lib/libisccc-9.20.10.so /usr/lib/libdns-9.20.10.so /usr/lib/libisc-9.20.10.so", added "/usr/lib/libisccc-9.20.11.so /usr/lib/libns-9.20.11.so /usr/lib/libdns-9.20.11.so /usr/lib/libisc-9.20.11.so /usr/lib/libisccfg-9.20.11.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.10.so to libdns-9.20.11.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.10.so to libisccc-9.20.11.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.10.so to libisccfg-9.20.11.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.10.so to libisc-9.20.11.so
  /usr/lib/libns.so changed symlink target from libns-9.20.10.so to libns-9.20.11.so
  /usr/lib/libdns-9.20.10.so moved to /usr/lib/libdns-9.20.11.so
  /usr/lib/libisc-9.20.10.so moved to /usr/lib/libisc-9.20.11.so
  /usr/lib/libisccc-9.20.10.so moved to /usr/lib/libisccc-9.20.11.so
  /usr/lib/libisccfg-9.20.10.so moved to /usr/lib/libisccfg-9.20.11.so
  /usr/lib/libns-9.20.10.so moved to /usr/lib/libns-9.20.11.so

--===============4133422508841823185==--


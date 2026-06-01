Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87383CD8C82
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1557.1780328132457840933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J5L/gx+E;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xHsae23u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e83d36c7b-e057f13f-76a9-4b2b-8282-952ddabcc353-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/nF5eZz1WIdrECiR/JZX5kgFabF5RdbNu3nQUznVdZ0=;
	b=J5L/gx+EurnbcGHgK0vh0ba2Git6/rz9tFeaGPCoZZVL5Yjb9oeI7MigBEn7VZ/q
	JCJh5DLDV5VpNyxMPXfoBM7OPax7j08DnIQyn6EKUnLUZosB8Dpe/rvT+K2ZPAcEQja
	rRCfe8/xCZI59ATF0cjmxquBTesEm3oV8YVO9+LE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/nF5eZz1WIdrECiR/JZX5kgFabF5RdbNu3nQUznVdZ0=;
	b=xHsae23uZSGhbgnQNE8jltwKDz9zKrN1Kk25r4TrDQBk7oXLN3QjARQISZ7shUha
	CW9kKz5DSToUWAxASIlXHoro08U3NuNIzl7L8LjMPhLROIapWdqNqF3R9UpiEjWHxX5
	VVY7Db6tBduTFEOlfGcuAbO03WMdh0WGrHteSL2Q=
Content-Type: multipart/mixed; boundary="===============8871085271411113380=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.23 SUCCEEDED
Message-ID: <0101019e83d36c7b-e057f13f-76a9-4b2b-8282-952ddabcc353-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237854

--===============8871085271411113380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.22-9.20.23.patch
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
From 12d74fcb69908f9e85982443a32269742387ddf3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:14:59 +0000
Subject: [PATCH] bind: upgrade 9.20.22 -> 9.20.23

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.22.bb => bind_9.20.23.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.22.bb => bind_9.20.23.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4fa377a594..21a626baf2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From 286beb79d77c7752c754a986894d29c8562815de Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 7279a73e87..3ddb119eba 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77f8fafab0cc91c3ad8fbf1382b1d0f2d2cd99a6 Mon Sep 17 00:00:00 2001
+From 6903ee8f2a9efde471741c8652e837e27370c86a Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86..36258f55e2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From d0f12d17b15e4feaae5ab2e88938c1b639da3ddd Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index b02c57c..cf89c49 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0..fccba600ae 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From 147a501f3862fc87093d234af69b89f68b187f4a Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index b0a5372..b02c57c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index ec22fe84c4..f8b1f83f40 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From e6a1bc0aa3535045473125658ac8174ad6e365e2 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index fd96d46448..7f06df2277 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From 156be3c4ecbc9015b0b86129f085b1ffaaf1cff4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 155cc5a110..aceeba823b 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From 512be2a6dc48533e24d1e7f919394784f38a35f6 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.22.bb b/meta/recipes-connectivity/bind/bind_9.20.23.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.22.bb
rename to meta/recipes-connectivity/bind/bind_9.20.23.bb
index 318412a62c..ebc4422b67 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.23.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "cba92ff631b949655f475fe4b54290f6860fd0070d399f2279f6437c0d383ec6"
+SRC_URI[sha256sum] = "5d4475aed3f9e500ef554b2b14d972bdb83d33de214a9b3be92918ea46908371"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============8871085271411113380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.20.22.so /usr/lib/libdns-9.20.22.so /usr/lib/libisccc-9.20.22.so /usr/lib/libisc-9.20.22.so /usr/lib/libisccfg-9.20.22.so", added "/usr/lib/libns-9.20.23.so /usr/lib/libisccfg-9.20.23.so /usr/lib/libisccc-9.20.23.so /usr/lib/libisc-9.20.23.so /usr/lib/libdns-9.20.23.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.22.so to libdns-9.20.23.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.22.so to libisccc-9.20.23.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.22.so to libisccfg-9.20.23.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.22.so to libisc-9.20.23.so
  /usr/lib/libns.so changed symlink target from libns-9.20.22.so to libns-9.20.23.so
  /usr/lib/libdns-9.20.22.so moved to /usr/lib/libdns-9.20.23.so
  /usr/lib/libisc-9.20.22.so moved to /usr/lib/libisc-9.20.23.so
  /usr/lib/libisccc-9.20.22.so moved to /usr/lib/libisccc-9.20.23.so
  /usr/lib/libisccfg-9.20.22.so moved to /usr/lib/libisccfg-9.20.23.so
  /usr/lib/libns-9.20.22.so moved to /usr/lib/libns-9.20.23.so

--===============8871085271411113380==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.22-9.20.23.patch"

RnJvbSAxMmQ3NGZjYjY5OTA4ZjllODU5ODI0NDNhMzIyNjk3NDIzODdkZGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzoxNDo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC4yMiAtPiA5LjIwLjIzCgotLS0KIC4uLi9iaW5kL2JpbmQvMDAwMS1h
dm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICAgfCAyICstCiAuLi4vMDAw
MS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2ggICAgIHwg
MiArLQogLi4uMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0
aW9ucy5wYXRjaCB8IDQgKystLQogLi4uYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhl
YWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5k
L2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgfCAy
ICstCiAuLi4vYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICAg
ICAgICAgICAgIHwgMiArLQogLi4uL2JpbmQve2JpbmRfOS4yMC4yMi5iYiA9PiBiaW5kXzkuMjAu
MjMuYmJ9ICAgICAgICAgICAgICAgICB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL3tiaW5kXzkuMjAuMjIuYmIgPT4gYmluZF85LjIwLjIzLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3Rh
cnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRj
aAppbmRleCA0ZmEzNzdhNTk0Li4yMWE2MjZiYWYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5k
LXVzZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAw
MS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAyYTNmZjJhMDI2YzU1ZGM2NzY1NWJhZjI4ZTBmNDE3NTIzMmVlMGZmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyODZiZWI3OWQ3N2M3NzUyYzc1NGE5ODY4OTRkMjljODU2
MjgxNWRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAxNSBPY3QgMjAxOCAxNjo1NTowOSArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBhdm9pZCBzdGFydCBmYWlsdXJlIHdpdGggYmluZCB1c2VyCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0
LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQu
bTQtbWFjcm9zLnBhdGNoCmluZGV4IDcyNzlhNzNlODcuLjNkZGIxMTllYmEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQtQmFja3BvcnQtYXhf
cHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQu
bTQtbWFjcm9zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3N2Y4ZmFmYWIwY2M5MWMzYWQ4
ZmJmMTM4MmIxZDBmMmQyY2Q5OWE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2OTAz
ZWU4ZjJhOWVmZGU0NzE3NDFjODY1MmU4MzdlMjczNzBjODZhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPGtoZW0ucmFqQG9zcy5xdWFsY29tbS5jb20+CiBEYXRlOiBG
cmksIDEwIEFwciAyMDI2IDIzOjMzOjQ5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG00OiBCYWNr
cG9ydCBheF9wcm9nX2NjX2Zvcl9idWlsZC5tNCBtYWNyb3MKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0
LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1v
cHRpb25zLnBhdGNoCmluZGV4IDM2OTE4NWFkODYuLjM2MjU4ZjU1ZTIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5k
LXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhp
ZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDljYTdiNTQzMmRk
NmMyNDU0MWJiZGUyMWJjYTUwNDNjZDBjMDAwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZDBmMTJkMTdiMTVlNGZlYWFlNWFiMmU4ODkzOGMxYjYzOWRhM2RkZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4K
IERhdGU6IE1vbiwgMjcgQXVnIDIwMTggMjE6MjQ6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
YG5hbWVkL2x3cmVzZCAtVicgYW5kIHN0YXJ0IGxvZyBoaWRlIGJ1aWxkIG9wdGlvbnMKQEAgLTIw
LDcgKzIwLDcgQEAgU2lnbmVkLW9mZi1ieTogQXJtaW4gS3VzdGVyIDxha3VzdGVyQG12aXN0YS5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGMzODUyZWMuLjNi
N2E0NDYgMTAwNjQ0CitpbmRleCBiMDJjNTdjLi5jZjg5YzQ5IDEwMDY0NAogLS0tIGEvY29uZmln
dXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNSw3ICszNSw3IEBAIEFDX0RFRklORShb
UEFDS0FHRV9WRVJTSU9OX0VYVFJBXSwgWyJdW2JpbmRfVkVSU0lPTl9FWFRSQV1bIl0sIFtCSU5E
IDkgRXh0cmEgcGFyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNy
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUt
c2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAppbmRleCA0YTA2
NjI5NGYwLi5mY2NiYTYwMGFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hl
cy1zeXNyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2Jp
bmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGZhMTY1Y2I0YTlkZmViNzJmMGRiNzg3ZGVjZDUyN2UzZDU4
N2NkNGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE0N2E1MDFmMzg2MmZjODcwOTNk
MjM0YWY2OWI4OWY2OGIxODdmNGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVs
IEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgOSBK
dW4gMjAxNSAxMToyMjowMCAtMDQwMAogU3ViamVjdDogW1BBVENIXSBiaW5kOiBlbnN1cmUgc2Vh
cmNoaW5nIGZvciBqc29uIGhlYWRlcnMgc2VhcmNoZXMgc3lzcm9vdApAQCAtMzIsNyArMzIsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVy
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYzZhMTBmNi4u
YzM4NTJlYyAxMDA2NDQKK2luZGV4IGIwYTUzNzIuLmIwMmM1N2MgMTAwNjQ0CiAtLS0gYS9jb25m
aWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTg2NSw3ICs4NjUsNyBAQCBBU19DQVNF
KFskd2l0aF9sbWRiXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kL2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9j
b25mLnBhdGNoCmluZGV4IGVjMjJmZTg0YzQuLmY4YjFmODNmNDAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNGI5ZjZmNjczNTM0MGQ1NThkOWM5ZmJhOWM4NGQ3Zjk5ZDNjYmRlMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZTZhMWJjMGFhMzUzNTA0NTQ3MzEyNTY1OGFjODE3NGFkNmUzNjVl
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwu
Y29tPgogRGF0ZTogVHVlLCAzMCBOb3YgMjAxMCAxMzozNTo0MiArMDgwMAogU3ViamVjdDogW1BB
VENIXSBiaW5kOiBhZGQgbmV3IHJlY2lwZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1z
dXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmluZGV4IGZkOTZkNDY0NDguLjdmMDZk
ZjIyNzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2lu
aXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQt
b25seS1yb290ZnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE5OTMzYmU3ODkwMmQ5MDAx
NGYxNzdiNTYzM2RkMTU5ODRiYzFiYzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE1
NmJlM2M0ZWNiYzkwMTViMGI4NjEyOWYwODViMWZmYWFmMWNmZjQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUs
IDI3IE1hciAyMDE0IDAyOjM0OjQxICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluaXQuZDogYWRk
IHN1cHBvcnQgZm9yIHJlYWQtb25seSByb290ZnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmlu
ZC1zdG9wLXdvcmsucGF0Y2gKaW5kZXggMTU1Y2M1YTExMC4uYWNlZWJhODIzYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmlu
ZC1zdG9wLXdvcmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGU0Mjk4OTljMzRlYThhNGY4NWRlNDI4ZTIyZWU0OWM0NTMyODFlODIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDUxMmJlMmE2ZGM0ODUzM2UyNGQxZTdmOTE5Mzk0Nzg0ZjM4YTM1
ZjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdp
bmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE1IE5vdiAyMDEyIDAyOjI3OjU0ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2JpbmQgc3RvcCIgd29yawpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yMi5iYiBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjMuYmIKc2ltaWxhcml0
eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmRfOS4yMC4yMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmRfOS4yMC4yMy5iYgppbmRleCAzMTg0MTJhNjJjLi5lYmM0NDIyYjY3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjIyLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjMuYmIKQEAgLTIxLDcgKzIxLDcg
QEAgU1JDX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BWfS8ke0JQTn0t
JHtQVn0udGFyLnh6IFwKIAkJICAgZmlsZTovLzAwMDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19m
b3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiY2JhOTJmZjYzMWI5NDk2NTVmNDc1ZmU0YjU0MjkwZjY4NjBmZDAwNzBkMzk5ZjIy
NzlmNjQzN2MwZDM4M2VjNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZDQ0NzVhZWQzZjllNTAw
ZWY1NTRiMmIxNGQ5NzJiZGI4M2QzM2RlMjE0YTliM2JlOTI5MThlYTQ2OTA4MzcxIgogCiBVUFNU
UkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xs
b3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi40Ny4xCgo=

--===============8871085271411113380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 16134112 to 16129792 (-0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccc-9.20.22.so /usr/lib/.debug/libdns-9.20.22.so /usr/lib/.debug/libisccfg-9.20.22.so /usr/lib/.debug/libns-9.20.22.so /usr/lib/.debug/libisc-9.20.22.so", added "/usr/lib/.debug/libisccc-9.20.23.so /usr/lib/.debug/libdns-9.20.23.so /usr/lib/.debug/libns-9.20.23.so /usr/lib/.debug/libisccfg-9.20.23.so /usr/lib/.debug/libisc-9.20.23.so"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1603648 to 1602699 (-0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.22.so /usr/lib/libns-9.20.22.so /usr/lib/libisccc-9.20.22.so /usr/lib/libdns-9.20.22.so /usr/lib/libisc-9.20.22.so", added "/usr/lib/libisccc-9.20.23.so /usr/lib/libns-9.20.23.so /usr/lib/libdns-9.20.23.so /usr/lib/libisc-9.20.23.so /usr/lib/libisccfg-9.20.23.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.22.so", added "/usr/lib/*-9.20.23.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10085710 to 10088773 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.22/lib/dns/include/irs -> /usr/src/debug/bind/9.20.23/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.22/lib/ns -> /usr/src/debug/bind/9.20.23/lib/ns, directory renamed /usr/src/debug/bind/9.20.22/bin/plugins -> /usr/src/debug/bind/9.20.23/bin/plugins, directory renamed /usr/src/debug/bind/9.20.22/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.23/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.22/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.23/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.22/lib/ns/include/ns -> /usr/src/debug/bind/9.20.23/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.22/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.23/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.22/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.23/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind
 /9.20.22/bin/delv -> /usr/src/debug/bind/9.20.23/bin/delv, directory renamed /usr/src/debug/bind/9.20.22/lib/dns/include/dns -> /usr/src/debug/bind/9.20.23/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.22/bin/confgen -> /usr/src/debug/bind/9.20.23/bin/confgen, directory renamed /usr/src/debug/bind/9.20.22/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.23/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.22/bin/rndc -> /usr/src/debug/bind/9.20.23/bin/rndc, directory renamed /usr/src/debug/bind/9.20.22/lib/dns/include/dst -> /usr/src/debug/bind/9.20.23/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.22/bin/dnssec -> /usr/src/debug/bind/9.20.23/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.22/bin/dig -> /usr/src/debug/bind/9.20.23/bin/dig, directory renamed /usr/src/debug/bind/9.20.22/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.23/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.22/bin/named/include/named ->
  /usr/src/debug/bind/9.20.23/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.22/bin/named -> /usr/src/debug/bind/9.20.23/bin/named, directory renamed /usr/src/debug/bind/9.20.22/lib/isc/netmgr -> /usr/src/debug/bind/9.20.23/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.22/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.23/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.22/lib/dns -> /usr/src/debug/bind/9.20.23/lib/dns, directory renamed /usr/src/debug/bind/9.20.22/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.23/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.22/bin/nsupdate -> /usr/src/debug/bind/9.20.23/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.22/bin/named/include/dlz -> /usr/src/debug/bind/9.20.23/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.22/bin/tools -> /usr/src/debug/bind/9.20.23/bin/tools, directory renamed /usr/src/debug/bind/9.20.22/bin/check
  -> /usr/src/debug/bind/9.20.23/bin/check, directory renamed /usr/src/debug/bind/9.20.22/lib/isccc -> /usr/src/debug/bind/9.20.23/lib/isccc, directory renamed /usr/src/debug/bind/9.20.22/lib/isccfg -> /usr/src/debug/bind/9.20.23/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.22/lib/isc -> /usr/src/debug/bind/9.20.23/lib/isc, directory renamed /usr/src/debug/bind/9.20.22/lib/isc/include/isc -> /usr/src/debug/bind/9.20.23/lib/isc/include/isc
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.22 [default] to 9.20.23 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.22" to "9.20.23"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.22/bind-9.20.22.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.23/bind-9.20.23.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.22.so to libdns-9.20.23.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.22.so to libisccc-9.20.23.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.22.so to libisccfg-9.20.23.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.22.so to libisc-9.20.23.so
  /usr/lib/libns.so changed symlink target from libns-9.20.22.so to libns-9.20.23.so
  /usr/lib/libdns-9.20.22.so moved to /usr/lib/libdns-9.20.23.so
  /usr/lib/libisc-9.20.22.so moved to /usr/lib/libisc-9.20.23.so
  /usr/lib/libisccc-9.20.22.so moved to /usr/lib/libisccc-9.20.23.so
  /usr/lib/libisccfg-9.20.22.so moved to /usr/lib/libisccfg-9.20.23.so
  /usr/lib/libns-9.20.22.so moved to /usr/lib/libns-9.20.23.so

--===============8871085271411113380==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A40AF42107
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19735.1776261873605934514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NWk2aK2d;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0VA7qgqS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d91753d17-52651beb-521c-4714-a73c-c00716d14bc7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mgu/PrGF1lyax7chbN003XC6IFTPtkUC/mp7556Pw6Q=;
	b=NWk2aK2dxcX/d2nFdOW6gJgZvnd5K1ycbeK8sHHvF3ASsBCmDbbWMVwNX90ZMuO8
	kzGQGYbJQLd/xzZw9lwCQEdjJpq2cupS2MO4PycIBDq7XP7/ko0Vp84J4Py4cvnURWA
	kUav/RXWQ5L9Y+ZA1Xrtab3mC8VSs+5AF49WoRRc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mgu/PrGF1lyax7chbN003XC6IFTPtkUC/mp7556Pw6Q=;
	b=0VA7qgqSIlPc3v6xkps9hPGNo5ljTJpWfy7qyMsNrkRU0bCtGXGyW6FvYnlp6LwH
	2RSXvES5svkydiRXJa5YAH2IPQIq1PmYKIvBFjs+DcXKp5MRQHQTvtWjLS4VIMqbDx+
	miJhHiz/OmF/B0fT/dlJCzrwYybs87gARcE+rCa4=
Content-Type: multipart/mixed; boundary="===============8940264060421916598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.22 SUCCEEDED
Message-ID: <0101019d91753d17-52651beb-521c-4714-a73c-c00716d14bc7-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235213

--===============8940264060421916598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.20-9.20.22.patch
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
From 25f354a84430756a1fee52cecdd98b783b99165a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:07:31 +0000
Subject: [PATCH] bind: upgrade 9.20.20 -> 9.20.22

---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.20.bb => bind_9.20.22.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.20.bb => bind_9.20.22.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4fa377a594..8f7627d8c0 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From fafc8e32b3bf65ab58926c04f62b072131045669 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 7279a73e87..f310c7337b 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77f8fafab0cc91c3ad8fbf1382b1d0f2d2cd99a6 Mon Sep 17 00:00:00 2001
+From 92694541ea5db345bbb3c7b294c94192c4a90152 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86..f643e4d689 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From 9bb7b5dd7cdcdc65409616141848615625681979 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index 47e12c3..ee215af 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0..fc9d1137a9 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From 626c7df8226f9ddd39790cbe12d870abbb605305 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index 59457e0..47e12c3 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index ec22fe84c4..e1de5e0d5e 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From 05570f673e7141f2da7e758f673e18a578aba9ad Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index fd96d46448..817519cd1f 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From f9713e4dc5ea7fc30c58859805d25737a9e95fe9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 155cc5a110..5b2cdf1b14 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From 465c4b6dbdfc6fa5a9385fe69e1d6d413715ba14 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.20.bb b/meta/recipes-connectivity/bind/bind_9.20.22.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.20.bb
rename to meta/recipes-connectivity/bind/bind_9.20.22.bb
index dd51c3a808..c459cf28c9 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.22.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "19b8335d25305231d5eb8f7d924240d1ac97c4da7c93eaa6273503133aa6106a"
+SRC_URI[sha256sum] = "cba92ff631b949655f475fe4b54290f6860fd0070d399f2279f6437c0d383ec6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============8940264060421916598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.20.so /usr/lib/libisccc-9.20.20.so /usr/lib/libisc-9.20.20.so /usr/lib/libdns-9.20.20.so /usr/lib/libns-9.20.20.so", added "/usr/lib/libisccfg-9.20.22.so /usr/lib/libdns-9.20.22.so /usr/lib/libisc-9.20.22.so /usr/lib/libisccc-9.20.22.so /usr/lib/libns-9.20.22.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.20.so to libdns-9.20.22.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.20.so to libisccc-9.20.22.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.20.so to libisccfg-9.20.22.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.20.so to libisc-9.20.22.so
  /usr/lib/libns.so changed symlink target from libns-9.20.20.so to libns-9.20.22.so
  /usr/lib/libdns-9.20.20.so moved to /usr/lib/libdns-9.20.22.so
  /usr/lib/libisc-9.20.20.so moved to /usr/lib/libisc-9.20.22.so
  /usr/lib/libisccc-9.20.20.so moved to /usr/lib/libisccc-9.20.22.so
  /usr/lib/libisccfg-9.20.20.so moved to /usr/lib/libisccfg-9.20.22.so
  /usr/lib/libns-9.20.20.so moved to /usr/lib/libns-9.20.22.so

--===============8940264060421916598==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.20-9.20.22.patch"

RnJvbSAyNWYzNTRhODQ0MzA3NTZhMWZlZTUyY2VjZGQ5OGI3ODNiOTkxNjVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6MDc6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMjAgLT4gOS4yMC4yMgoKLS0tCiAuLi4vYmluZC9iaW5kLzAwMDEt
YXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAgIHwgMiArLQogLi4uLzAw
MDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoICAgICB8
IDIgKy0KIC4uLjAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9w
dGlvbnMucGF0Y2ggfCA0ICsrLS0KIC4uLmJpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1o
ZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiAuLi4vYmlu
ZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCAgIHwg
MiArLQogLi4uL2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAg
ICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL3tiaW5kXzkuMjAuMjAuYmIgPT4gYmluZF85LjIw
LjIyLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC97YmluZF85LjIwLjIwLmJiID0+IGJpbmRfOS4yMC4yMi5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0
YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0
Y2gKaW5kZXggNGZhMzc3YTU5NC4uOGY3NjI3ZDhjMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmlu
ZC11c2VyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMmEzZmYyYTAyNmM1NWRjNjc2NTViYWYyOGUwZjQxNzUyMzJlZTBmZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmFmYzhlMzJiM2JmNjVhYjU4OTI2YzA0ZjYyYjA3MjEz
MTA0NTY2OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6MDkgKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gYXZvaWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1tNC1CYWNrcG9y
dC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxk
Lm00LW1hY3Jvcy5wYXRjaAppbmRleCA3Mjc5YTczZTg3Li5mMzEwYzczMzdiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4
X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxk
Lm00LW1hY3Jvcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzdmOGZhZmFiMGNjOTFjM2Fk
OGZiZjEzODJiMWQwZjJkMmNkOTlhNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTI2
OTQ1NDFlYTVkYjM0NWJiYjNjN2IyOTRjOTQxOTJjNGE5MDE1MiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxraGVtLnJhakBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTog
RnJpLCAxMCBBcHIgMjAyNiAyMzozMzo0OSArMDAwMAogU3ViamVjdDogW1BBVENIXSBtNDogQmFj
a3BvcnQgYXhfcHJvZ19jY19mb3JfYnVpbGQubTQgbWFjcm9zCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFy
dC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQt
b3B0aW9ucy5wYXRjaAppbmRleCAzNjkxODVhZDg2Li5mNjQzZTRkNjg5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFu
ZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1o
aWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ5Y2E3YjU0MzJk
ZDZjMjQ1NDFiYmRlMjFiY2E1MDQzY2QwYzAwMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDliYjdiNWRkN2NkY2RjNjU0MDk2MTYxNDE4NDg2MTU2MjU2ODE5NzkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBNb24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGBuYW1lZC9sd3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0y
MCw3ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBjMzg1MmVjLi4z
YjdhNDQ2IDEwMDY0NAoraW5kZXggNDdlMTJjMy4uZWUyMTVhZiAxMDA2NDQKIC0tLSBhL2NvbmZp
Z3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUo
W1BBQ0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklO
RCA5IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJl
LXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggNGEw
NjYyOTRmMC4uZmM5ZDExMzdhOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNo
ZXMtc3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9i
aW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYTE2NWNiNGE5ZGZlYjcyZjBkYjc4N2RlY2Q1MjdlM2Q1
ODdjZDRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MjZjN2RmODIyNmY5ZGRkMzk3
OTBjYmUxMmQ4NzBhYmJiNjA1MzA1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1
bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkg
SnVuIDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNl
YXJjaGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5c3Jvb3QKQEAgLTMyLDcgKzMyLDcg
QEAgU2lnbmVkLW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZl
ci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGM2YTEwZjYu
LmMzODUyZWMgMTAwNjQ0CitpbmRleCA1OTQ1N2UwLi40N2UxMmMzIDEwMDY0NAogLS0tIGEvY29u
ZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC04NjUsNyArODY1LDcgQEAgQVNfQ0FT
RShbJHdpdGhfbG1kYl0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
Y29uZi5wYXRjaAppbmRleCBlYzIyZmU4NGM0Li5lMWRlNWUwZDVlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDRiOWY2ZjY3MzUzNDBkNTU4ZDljOWZiYTljODRkN2Y5OWQzY2JkZTIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDA1NTcwZjY3M2U3MTQxZjJkYTdlNzU4ZjY3M2UxOGE1NzhhYmE5
YWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVs
LmNvbT4KIERhdGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYmluZDogYWRkIG5ldyByZWNpcGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rm
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQt
c3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRleCBmZDk2ZDQ2NDQ4Li44MTc1
MTljZDFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9p
bml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFk
LW9ubHktcm9vdGZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOTkzM2JlNzg5MDJkOTAw
MTRmMTc3YjU2MzNkZDE1OTg0YmMxYmM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBm
OTcxM2U0ZGM1ZWE3ZmMzMGM1ODg1OTgwNWQyNTczN2E5ZTk1ZmU5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1
LCAyNyBNYXIgMjAxNCAwMjozNDo0MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFk
ZCBzdXBwb3J0IGZvciByZWFkLW9ubHkgcm9vdGZzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJp
bmQtc3RvcC13b3JrLnBhdGNoCmluZGV4IDE1NWNjNWExMTAuLjViMmNkZjFiMTQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJp
bmQtc3RvcC13b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBlNDI5ODk5YzM0ZWE4YTRmODVkZTQyOGUyMmVlNDljNDUzMjgxZTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA0NjVjNGI2ZGJkZmM2ZmE1YTkzODVmZTY5ZTFkNmQ0MTM3MTVi
YTE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3
aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjAuYmIg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjIyLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kXzkuMjAuMjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kXzkuMjAuMjIuYmIKaW5kZXggZGQ1MWMzYTgwOC4uYzQ1OWNmMjhjOSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjIyLmJiCkBAIC0yMSw3ICsyMSw3
IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59
LSR7UFZ9LnRhci54eiBcCiAJCSAgIGZpbGU6Ly8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2Nf
Zm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjE5YjgzMzVkMjUzMDUyMzFkNWViOGY3ZDkyNDI0MGQxYWM5N2M0ZGE3YzkzZWFh
NjI3MzUwMzEzM2FhNjEwNmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2JhOTJmZjYzMWI5NDk2
NTVmNDc1ZmU0YjU0MjkwZjY4NjBmZDAwNzBkMzk5ZjIyNzlmNjQzN2MwZDM4M2VjNiIKIAogVVBT
VFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9s
bG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDcuMQoK

--===============8940264060421916598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccfg-9.20.20.so /usr/lib/.debug/libisccc-9.20.20.so /usr/lib/.debug/libisc-9.20.20.so /usr/lib/.debug/libdns-9.20.20.so /usr/lib/.debug/libns-9.20.20.so", added "/usr/lib/.debug/libns-9.20.22.so /usr/lib/.debug/libisccc-9.20.22.so /usr/lib/.debug/libisc-9.20.22.so /usr/lib/.debug/libisccfg-9.20.22.so /usr/lib/.debug/libdns-9.20.22.so"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 15883464 to 15893560 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1603388 to 1603648 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.20.so /usr/lib/libisc-9.20.20.so /usr/lib/libdns-9.20.20.so /usr/lib/libisccc-9.20.20.so /usr/lib/libns-9.20.20.so", added "/usr/lib/libdns-9.20.22.so /usr/lib/libisc-9.20.22.so /usr/lib/libisccfg-9.20.22.so /usr/lib/libisccc-9.20.22.so /usr/lib/libns-9.20.22.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.20.so", added "/usr/lib/*-9.20.22.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.22/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.20/bin/named/include/named -> /usr/src/debug/bind/9.20.22/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.22/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/include/irs -> /usr/src/debug/bind/9.20.22/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.20/bin/plugins -> /usr/src/debug/bind/9.20.22/bin/plugins, directory renamed /usr/src/debug/bind/9.20.20/bin/dnssec -> /usr/src/debug/bind/9.20.22/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.20/bin/nsupdate -> /usr/src/debug/bind/9.20.22/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.20/bin/named -> /usr/src/debug/bind/9.20.22/bin/named, directory renamed /usr/src/debug/bind/9.20.20/lib/isc -> 
 /usr/src/debug/bind/9.20.22/lib/isc, directory renamed /usr/src/debug/bind/9.20.20/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.22/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.20/lib/ns -> /usr/src/debug/bind/9.20.22/lib/ns, directory renamed /usr/src/debug/bind/9.20.20/lib/dns -> /usr/src/debug/bind/9.20.22/lib/dns, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.22/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.22/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.20/bin/tools -> /usr/src/debug/bind/9.20.22/bin/tools, directory renamed /usr/src/debug/bind/9.20.20/bin/confgen -> /usr/src/debug/bind/9.20.22/bin/confgen, directory renamed /usr/src/debug/bind/9.20.20/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.22/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.20/bin/delv -> /usr/src/debug/bind/9.20
 .22/bin/delv, directory renamed /usr/src/debug/bind/9.20.20/lib/ns/include/ns -> /usr/src/debug/bind/9.20.22/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/include/dst -> /usr/src/debug/bind/9.20.22/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.20/lib/isc/include/isc -> /usr/src/debug/bind/9.20.22/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.20/lib/isccc -> /usr/src/debug/bind/9.20.22/lib/isccc, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.22/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.20/bin/rndc -> /usr/src/debug/bind/9.20.22/bin/rndc, directory renamed /usr/src/debug/bind/9.20.20/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.22/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.20/lib/isc/netmgr -> /usr/src/debug/bind/9.20.22/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.20/bin/dig -> /usr/src/debug/bind/9.
 20.22/bin/dig, directory renamed /usr/src/debug/bind/9.20.20/lib/isccfg -> /usr/src/debug/bind/9.20.22/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.20/lib/dns/include/dns -> /usr/src/debug/bind/9.20.22/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.20/bin/check -> /usr/src/debug/bind/9.20.22/bin/check, directory renamed /usr/src/debug/bind/9.20.20/bin/named/include/dlz -> /usr/src/debug/bind/9.20.22/bin/named/include/dlz
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10081900 to 10085710 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.20/bind-9.20.20.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.22/bind-9.20.22.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.20" to "9.20.22"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.20 [default] to 9.20.22 [default]
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.20.so to libdns-9.20.22.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.20.so to libisccc-9.20.22.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.20.so to libisccfg-9.20.22.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.20.so to libisc-9.20.22.so
  /usr/lib/libns.so changed symlink target from libns-9.20.20.so to libns-9.20.22.so
  /usr/lib/libdns-9.20.20.so moved to /usr/lib/libdns-9.20.22.so
  /usr/lib/libisc-9.20.20.so moved to /usr/lib/libisc-9.20.22.so
  /usr/lib/libisccc-9.20.20.so moved to /usr/lib/libisccc-9.20.22.so
  /usr/lib/libisccfg-9.20.20.so moved to /usr/lib/libisccfg-9.20.22.so
  /usr/lib/libns-9.20.20.so moved to /usr/lib/libns-9.20.22.so

--===============8940264060421916598==--


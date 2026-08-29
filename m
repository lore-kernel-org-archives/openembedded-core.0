Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D234C61DDE
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2089.1787982254283525490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NjqsVUPp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P16hKv0n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a04c0c0ceb-f8d4425d-5910-4be9-a19f-ebf2c80f57db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982253;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=hOuh+2ObYbxoYIBX7xAv1WKKJ+P3lpEv05W+xRajiqI=;
	b=NjqsVUPpkzpmBEsciubnQAuzcIi9eROV6PQy2QH9dgMo7q20+ae5L99AvZNzEGyU
	vdYx9SFXXAT/U2B4b3ZHIzNIhqcZ57XPGH6xdH+3YtAPsVw933s+fH90iAMVnVHT4mL
	j9LcSud9WWHxEKJDHkshjpkw0Ig/yeFPReaML/sQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982253;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=hOuh+2ObYbxoYIBX7xAv1WKKJ+P3lpEv05W+xRajiqI=;
	b=P16hKv0n2tsWNeyLPxZoIsY/j2Ic6P+guOq2plwWrx/1gU4q0dXB/knIk6o7fhxE
	dLH/rvp5v37+r2pVo+LtGvaVLwJI6o9KwQxgFzJlJv+W0RDzcz4LrPGq0bEHXOJPizj
	KrhEA0UmkBvwOr9Q0G8JX+9HU6aVjVZiwLhPYUuQ=
Content-Type: multipart/mixed; boundary="===============6218797508523192304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.8.1 SUCCEEDED
Message-ID: <010101a04c0c0ceb-f8d4425d-5910-4be9-a19f-ebf2c80f57db-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244626

--===============6218797508523192304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libksba* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libksba-upgrade-1.8.0-1.8.1.patch
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
From 183a6186653e3cd52a91edb58400ebcab16c8cd2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 29 Aug 2026 05:44:06 +0000
Subject: [PATCH] libksba: upgrade 1.8.0 -> 1.8.1

Source: ChangeLog

2026-08-24  Werner Koch  <wk@gnupg.org>

	Release 1.8.1.
	+ commit 717381422750fb5a3e971d768ba46cae9a01682d

2026-07-30  NIIBE Yutaka  <gniibe@fsij.org>

	Fix CMS parser to avoid possible infinite loop.
	+ commit 06720f9b16a172404f49089cbb6eb95e4344f562
	* src/cms-parser.c (_ksba_cms_parse_signed_data_part_2): Finish
	when detecting no progress.
	(_ksba_cms_parse_enveloped_data_part_1): Likewise.
---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch            | 2 +-
 .../libksba/{libksba_1.8.0.bb => libksba_1.8.1.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.8.0.bb => libksba_1.8.1.bb} (95%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index 94612ec0a9..1ba19e5c75 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From a915d694b97f3226f6776ce405e8562b568070bf Mon Sep 17 00:00:00 2001
+From 1d1feec71e364aba1fe9e2608f422e8970bd9e9e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
diff --git a/meta/recipes-support/libksba/libksba_1.8.0.bb b/meta/recipes-support/libksba/libksba_1.8.1.bb
similarity index 95%
rename from meta/recipes-support/libksba/libksba_1.8.0.bb
rename to meta/recipes-support/libksba/libksba_1.8.1.bb
index 553fd336cc..ce08fe4426 100644
--- a/meta/recipes-support/libksba/libksba_1.8.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.8.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "296b9db9095749f2aa104202d7ab7fd09ad10710e00780a709c9754b1a1d9292"
+SRC_URI[sha256sum] = "c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.47.1


--===============6218797508523192304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.16.0", added "/usr/lib/libksba.so.8.16.1"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.16.0 to libksba.so.8.16.1
  /usr/lib/libksba.so changed symlink target from libksba.so.8.16.0 to libksba.so.8.16.1
  /usr/lib/libksba.so.8.16.0 moved to /usr/lib/libksba.so.8.16.1

--===============6218797508523192304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.8.0-1.8.1.patch"

RnJvbSAxODNhNjE4NjY1M2UzY2Q1MmE5MWVkYjU4NDAwZWJjYWIxNmM4Y2QyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjkgQXVnIDIwMjYgMDU6NDQ6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJrc2JhOiB1cGdyYWRlIDEuOC4wIC0+IDEuOC4xCgpTb3VyY2U6IENoYW5nZUxvZwoKMjAyNi0w
OC0yNCAgV2VybmVyIEtvY2ggIDx3a0BnbnVwZy5vcmc+CgoJUmVsZWFzZSAxLjguMS4KCSsgY29t
bWl0IDcxNzM4MTQyMjc1MGZiNWEzZTk3MWQ3NjhiYTQ2Y2FlOWEwMTY4MmQKCjIwMjYtMDctMzAg
IE5JSUJFIFl1dGFrYSAgPGduaWliZUBmc2lqLm9yZz4KCglGaXggQ01TIHBhcnNlciB0byBhdm9p
ZCBwb3NzaWJsZSBpbmZpbml0ZSBsb29wLgoJKyBjb21taXQgMDY3MjBmOWIxNmExNzI0MDRmNDkw
ODljYmI2ZWI5NWU0MzQ0ZjU2MgoJKiBzcmMvY21zLXBhcnNlci5jIChfa3NiYV9jbXNfcGFyc2Vf
c2lnbmVkX2RhdGFfcGFydF8yKTogRmluaXNoCgl3aGVuIGRldGVjdGluZyBubyBwcm9ncmVzcy4K
CShfa3NiYV9jbXNfcGFyc2VfZW52ZWxvcGVkX2RhdGFfcGFydF8xKTogTGlrZXdpc2UuCi0tLQog
Li4uL2xpYmtzYmEvbGlia3NiYS9rc2JhLWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaCAgICAg
ICAgICAgIHwgMiArLQogLi4uL2xpYmtzYmEve2xpYmtzYmFfMS44LjAuYmIgPT4gbGlia3NiYV8x
LjguMS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3Ni
YS97bGlia3NiYV8xLjguMC5iYiA9PiBsaWJrc2JhXzEuOC4xLmJifSAoOTUlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYS9rc2JhLWFkZC1wa2djb25m
aWctc3VwcG9ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYS9r
c2JhLWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaAppbmRleCA5NDYxMmVjMGE5Li4xYmExOWU1
Yzc1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmEva3Ni
YS1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlia3NiYS9saWJrc2JhL2tzYmEtYWRkLXBrZ2NvbmZpZy1zdXBwb3J0LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhOTE1ZDY5NGI5N2YzMjI2ZjY3NzZjZTQwNWU4NTYyYjU2ODA3MGJmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxZDFmZWVjNzFlMzY0YWJhMWZlOWUyNjA4ZjQy
MmU4OTcwYmQ5ZTllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAzIERlYyAyMDEyIDE4OjE3OjMxICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmtzYmE6IGFkZCBwa2djb25maWcgc3VwcG9ydApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuOC4wLmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuOC4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8x
LjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhXzEu
OC4xLmJiCmluZGV4IDU1M2ZkMzM2Y2MuLmNlMDhmZTQ0MjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJrc2JhL2xpYmtzYmFfMS44LjEuYmIKQEAgLTI4LDcgKzI4LDcgQEAgU1JDX1VS
SSA9ICIke0dOVVBHX01JUlJPUn0vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuYnoyIFwKICAgICAg
ICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjI5NmI5ZGI5MDk1NzQ5ZjJhYTEwNDIwMmQ3YWI3ZmQwOWFkMTA3MTBlMDA3ODBhNzA5
Yzk3NTRiMWExZDkyOTIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzJmODQzOTMwMTE4MjcyMTlh
ZTExNzEzMWRiYThlNzY4NGMyYmVkMDk2MWVlZDExYjA2NDJjMmFjYmE0NDBiNSIKIAogZG9fY29u
ZmlndXJlOnByZXBlbmQgKCkgewogCSMgRWxzZSB0aGVzZSBjb3VsZCBiZSB1c2VkIGluIHByZWZl
cmVuY2UgdG8gdGhvc2UgaW4gYWNsb2NhbC1jb3B5Ci0tIAoyLjQ3LjEKCg==

--===============6218797508523192304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.8.0.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.8.1.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libksba: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 1461208 to 1461472 (+0%)
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/.debug/libksba.so.8.16.0", added "/usr/lib/.debug/libksba.so.8.16.1"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGSIZE changed from 1013623 to 1013977 (+0%)
packages/x86-64-v3-poky-linux/libksba/libksba-src: FILELIST: directory renamed /usr/src/debug/libksba/1.8.0/tests -> /usr/src/debug/libksba/1.8.1/tests, directory renamed /usr/src/debug/libksba/1.8.0/src -> /usr/src/debug/libksba/1.8.1/src
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-src: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PV changed from "1.8.0" to "1.8.1"
packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.16.0", added "/usr/lib/libksba.so.8.16.1"
packages/x86-64-v3-poky-linux/libksba/libksba: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba: PV changed from "1.8.0" to "1.8.1"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.16.0 to libksba.so.8.16.1
  /usr/lib/libksba.so changed symlink target from libksba.so.8.16.0 to libksba.so.8.16.1
  /usr/lib/libksba.so.8.16.0 moved to /usr/lib/libksba.so.8.16.1

--===============6218797508523192304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libksba-changelog.txt"

Changelog for libksba: 1.8.0 -> 1.8.1
Source: ChangeLog

2026-08-24  Werner Koch  <wk@gnupg.org>

	Release 1.8.1.
	+ commit 717381422750fb5a3e971d768ba46cae9a01682d

2026-07-30  NIIBE Yutaka  <gniibe@fsij.org>

	Fix CMS parser to avoid possible infinite loop.
	+ commit 06720f9b16a172404f49089cbb6eb95e4344f562
	* src/cms-parser.c (_ksba_cms_parse_signed_data_part_2): Finish
	when detecting no progress.
	(_ksba_cms_parse_enveloped_data_part_1): Likewise.

--===============6218797508523192304==--


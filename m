Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EB6CDB475
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:55 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50609.1781195500092651335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oYeJnuKF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V8avb3aC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019eb7869f10-e8a70820-9817-4141-9d99-98f02c2251ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rpm51LsigEZihUwhzem5Q+BNrCiXcQviHxQm4+b7vtw=;
	b=oYeJnuKFuOfJY41WhpApxx7uTKyBRsXZdSXSl5yKJhMEuF8m5rwgEYnqvYgyT7jY
	j9JHLDrhw9C0ImnUdOd0L0nlXm+lwdYxrxumXKF96vrMojUf72Mxf0hnKNsuL/qKISB
	k5hJ/NHmyV4gxSt5uPwL6J8j3iOAX2Vzw+Raqrqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rpm51LsigEZihUwhzem5Q+BNrCiXcQviHxQm4+b7vtw=;
	b=V8avb3aCFr7B6ebu1ZDl8s3OooelNXW3oVjyPguyctPx+uulRYzF8AxSXI6SPFvc
	licKKnpxN0HlVD1w5HRx8G5YvFoJfMkbkmKyJ2TRqWjcBZEOeaNnsXH2PnMRwTg5nX/
	0gi9OJ0TxAbylB6b1bwz57S46ugQJG7sdN3wlND8=
Content-Type: multipart/mixed; boundary="===============7918160320239183315=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.27 SUCCEEDED
Message-ID: <0101019eb7869f10-e8a70820-9817-4141-9d99-98f02c2251ee-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238525

--===============7918160320239183315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.26-0.3.27.patch
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
From 58c5b6baa04695bcad02bb9de3606985d1fb3bb9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:54:14 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.26 -> 0.3.27

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.26.bb => libxmlb_0.3.27.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.26.bb => libxmlb_0.3.27.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 96707c2b0f..2dd4a6727b 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 463658f88ed0c3d0b41a5f9e546d00e574f44e79 Mon Sep 17 00:00:00 2001
+From 14e62a2eb40fdd1c78b82b4855541686608c3d45 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index ce2ced7..aa60b6b 100644
+index 043db65..be86a38 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2960,7 +2960,7 @@ xb_speed_func(void)
+@@ -3304,7 +3304,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
index b736346a8f..c68f375aa3 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "f969b4dd491a7367f7500f55f576c810985363d7"
+SRCREV = "2320a66cd267a82bfd41db90e35cd33e1f71bd8b"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============7918160320239183315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1976648 to 2034824 (+3%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 355651 to 357291 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 289382 to 305766 (+6%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 524066 to 538134 (+3%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: directory renamed /usr/src/debug/libxmlb/0.3.26/src -> /usr/src/debug/libxmlb/0.3.27/src
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGSIZE changed from 207692 to 207784 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.26 [default] to 0.3.27 [default]

--===============7918160320239183315==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.26-0.3.27.patch"

RnJvbSA1OGM1YjZiYWEwNDY5NWJjYWQwMmJiOWRlMzYwNjk4NWQxZmIzYmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6NTQ6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4yNiAtPiAwLjMuMjcKCi0tLQogLi4uL2xpYnhtbGIvMDAwMS14
Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L2xpYnhtbGIve2xpYnhtbGJfMC4zLjI2LmJiID0+IGxpYnhtbGJfMC4zLjI3LmJifSAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMjYuYmIgPT4g
bGlieG1sYl8wLjMuMjcuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJ
Ui5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxm
dGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggOTY3MDdjMmIwZi4uMmRk
NGE2NzI3YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8w
MDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29k
ZS1HX1RFU1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NjM2NThmODhlZDBj
M2QwYjQxYTVmOWU1NDZkMDBlNTc0ZjQ0ZTc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAxNGU2MmEyZWI0MGZkZDFjNzhiODJiNDg1NTU0MTY4NjYwOGMzZDQ1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTog
U2F0LCAxNiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1zZWxm
LXRlc3QuYzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy94Yi1z
ZWxmLXRlc3QuYyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotaW5kZXggY2UyY2VkNy4uYWE2MGI2YiAx
MDA2NDQKK2luZGV4IDA0M2RiNjUuLmJlODZhMzggMTAwNjQ0CiAtLS0gYS9zcmMveGItc2VsZi10
ZXN0LmMKICsrKyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotQEAgLTI5NjAsNyArMjk2MCw3IEBAIHhi
X3NwZWVkX2Z1bmModm9pZCkKK0BAIC0zMzA0LDcgKzMzMDQsNyBAQCB4Yl9zcGVlZF9mdW5jKHZv
aWQpCiAgaW50CiAgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjYuYmIgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNi5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjcuYmIKaW5k
ZXggYjczNjM0NmE4Zi4uYzY4ZjM3NWFhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYl8wLjMuMjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnht
bGIvbGlieG1sYl8wLjMuMjcuYmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxl
Oi8vMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZp
bGU6Ly9ydW4tcHRlc3QgXAogIgotU1JDUkVWID0gImY5NjliNGRkNDkxYTczNjdmNzUwMGY1NWY1
NzZjODEwOTg1MzYzZDciCitTUkNSRVYgPSAiMjMyMGE2NmNkMjY3YTgyYmZkNDFkYjkwZTM1Y2Qz
M2UxZjcxYmQ4YiIKIAogREVQRU5EUyA9ICJnbGliLTIuMCB4eiB6c3RkIgogCi0tIAoyLjQ3LjEK
Cg==

--===============7918160320239183315==--


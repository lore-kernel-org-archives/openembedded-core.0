Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE34D1F9D8
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11783.1728994543212041021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LAioHJnc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OxciNu37;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010192901b6239-9a09516e-a66e-4b7b-97b8-0fcd3012357e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994567;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KvVyC2M3Fmyri0i5fiU2OjRuADlD2Do0xqrPaUTmXgs=;
	b=LAioHJnchrCDqGQ41JRLeTkKXbvdIWurmZsBpmDhXwBKepZmYQ8Tx0c60lazQCiw
	BQWudGeXlH4kvFYiCNiU+XqJBMGd9bnJzLvoA4GHs3wgCeoOCgOZVFUeQiGHXEN81m6
	XDS4Ex6JaMF5Kkr3HrMXHop8KrO84TrwVszsQv3w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994567;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KvVyC2M3Fmyri0i5fiU2OjRuADlD2Do0xqrPaUTmXgs=;
	b=OxciNu37/qcbfc48921BVXbpN7jz3iUFtBijyVdz7eNKqKZuYmNKa2J6rAdAqSO/
	FrVnfaZSBJoNcfhBUbvFS/5W5BD08lLFyDeI9v3r2LSDVYY7+PeHuWdO44Be/lhMORt
	FR13oRy2+RP7TW662Ki3qe3O73BAipPYq7PhZJ1w=
Content-Type: multipart/mixed; boundary="===============6509885717919547158=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.20 SUCCEEDED
Message-ID: <01010192901b6239-9a09516e-a66e-4b7b-97b8-0fcd3012357e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205877

--===============6509885717919547158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.19-0.3.20.patch
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
From 7ca5cb473e446f96c295f15e9100e4378dd0f338 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 10:35:12 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.19 -> 0.3.20

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.19.bb => libxmlb_0.3.20.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.19.bb => libxmlb_0.3.20.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 27081d8749..b1b2526bc1 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 8a1aa4c318b8dbe4c0c2b1c4968f867ea6641b32 Mon Sep 17 00:00:00 2001
+From 95a26923d5d036fe666886ed8f01e5814ea81349 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 1daca18..2e5b251 100644
+index baba19e..7da3b6f 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2876,7 +2876,7 @@ xb_speed_func(void)
+@@ -2882,7 +2882,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.20.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.20.bb
index de8d860d00..49828a07ff 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.20.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "4393955fb7c8bbcb6a2c65ff54f16c39dc165e59"
+SRCREV = "248b5cc58eb1dcd0083ca237044726402ec7e8fb"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.44.1


--===============6509885717919547158==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.19-0.3.20.patch"

RnJvbSA3Y2E1Y2I0NzNlNDQ2Zjk2YzI5NWYxNWU5MTAwZTQzNzhkZDBmMzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTA6MzU6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4xOSAtPiAwLjMuMjAKCi0tLQogLi4uL2xpYnhtbGIvMDAwMS14
Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L2xpYnhtbGIve2xpYnhtbGJfMC4zLjE5LmJiID0+IGxpYnhtbGJfMC4zLjIwLmJifSAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMTkuYmIgPT4g
bGlieG1sYl8wLjMuMjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJ
Ui5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxm
dGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggMjcwODFkODc0OS4uYjFi
MjUyNmJjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8w
MDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29k
ZS1HX1RFU1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YTFhYTRjMzE4Yjhk
YmU0YzBjMmIxYzQ5NjhmODY3ZWE2NjQxYjMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5NWEyNjkyM2Q1ZDAzNmZlNjY2ODg2ZWQ4ZjAxZTU4MTRlYTgxMzQ5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTog
U2F0LCAxNiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1zZWxm
LXRlc3QuYzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy94Yi1z
ZWxmLXRlc3QuYyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotaW5kZXggMWRhY2ExOC4uMmU1YjI1MSAx
MDA2NDQKK2luZGV4IGJhYmExOWUuLjdkYTNiNmYgMTAwNjQ0CiAtLS0gYS9zcmMveGItc2VsZi10
ZXN0LmMKICsrKyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotQEAgLTI4NzYsNyArMjg3Niw3IEBAIHhi
X3NwZWVkX2Z1bmModm9pZCkKK0BAIC0yODgyLDcgKzI4ODIsNyBAQCB4Yl9zcGVlZF9mdW5jKHZv
aWQpCiAgaW50CiAgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMTkuYmIgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4xOS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjAuYmIKaW5k
ZXggZGU4ZDg2MGQwMC4uNDk4MjhhMDdmZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYl8wLjMuMTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnht
bGIvbGlieG1sYl8wLjMuMjAuYmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxl
Oi8vMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZp
bGU6Ly9ydW4tcHRlc3QgXAogIgotU1JDUkVWID0gIjQzOTM5NTVmYjdjOGJiY2I2YTJjNjVmZjU0
ZjE2YzM5ZGMxNjVlNTkiCitTUkNSRVYgPSAiMjQ4YjVjYzU4ZWIxZGNkMDA4M2NhMjM3MDQ0NzI2
NDAyZWM3ZThmYiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIERFUEVORFMgPSAiZ2xpYi0yLjAg
eHogenN0ZCIKLS0gCjIuNDQuMQoK

--===============6509885717919547158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxmlb: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1750056 to 1755528 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 355447 to 355536 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 511212 to 511913 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.19" to "0.3.20"
packages/core2-64-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.19 [default] to 0.3.20 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb: PV changed from "0.3.19" to "0.3.20"

--===============6509885717919547158==--


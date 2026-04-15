Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D433AF428D0
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19821.1776261880313926298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jFM2hIsd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ewccheLZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d917580f8-12363f03-4aa2-4d08-8601-12df99eafc18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261890;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IJg+U1u6+5ZZdIBAoy2U3MIEhK+gbuTM779TSfR1wUw=;
	b=jFM2hIsd6uWifCoAd4WHGmbob8DuuEBDddrk2Ke2ZhFBdtI2ih+jLgvOyGwEwge0
	wM+8GmswNhodSpc0kfrHbt3Squ7IGCe3oFqwfsLvze00xnUQPQ1yr91X75gnUgYX9QA
	Q4CiAwxK7zRUikS87WVlGPaboPya3PczB3OfdJco=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261890;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IJg+U1u6+5ZZdIBAoy2U3MIEhK+gbuTM779TSfR1wUw=;
	b=ewccheLZfmk4+eQos/HA1NoI84IICLLec8tX3GzP4ZPaagyHC0mlNwOKqpCa7Au4
	5syE86vbQsuULgkgru3rpciIq5D5mYYK2hq93cE/J42mWTTCwzTZgQxpaXUtn0ZnfyS
	/kMF+gYThO45H67DACk0xD+v4NFtX6YautR7I4EU=
Content-Type: multipart/mixed; boundary="===============2614496700256174803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.26 SUCCEEDED
Message-ID: <0101019d917580f8-12363f03-4aa2-4d08-8601-12df99eafc18-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235278

--===============2614496700256174803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.25-0.3.26.patch
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
From 1e4596f24ec00edb50986e499296bb6219f03db5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 11:55:55 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.25 -> 0.3.26

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.25.bb => libxmlb_0.3.26.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.25.bb => libxmlb_0.3.26.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 1c46f6fc1e..5b489723d4 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 2dbc50d49e2048f7227c406931a69f747e0eb12c Mon Sep 17 00:00:00 2001
+From c00ccce2cb52474c416dd1cdc631780008947ac7 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 76b2e12..c68c13a 100644
+index ce2ced7..aa60b6b 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2912,7 +2912,7 @@ xb_speed_func(void)
+@@ -2960,7 +2960,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
index 8687436052..b736346a8f 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "b31dec072f4428123db3866c18bf32bc5db04d35"
+SRCREV = "f969b4dd491a7367f7500f55f576c810985363d7"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============2614496700256174803==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.25-0.3.26.patch"

RnJvbSAxZTQ1OTZmMjRlYzAwZWRiNTA5ODZlNDk5Mjk2YmI2MjE5ZjAzZGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTE6NTU6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4yNSAtPiAwLjMuMjYKCi0tLQogLi4uL2xpYnhtbGIvMDAwMS14
Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L2xpYnhtbGIve2xpYnhtbGJfMC4zLjI1LmJiID0+IGxpYnhtbGJfMC4zLjI2LmJifSAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMjUuYmIgPT4g
bGlieG1sYl8wLjMuMjYuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJ
Ui5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxm
dGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggMWM0NmY2ZmMxZS4uNWI0
ODk3MjNkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8w
MDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29k
ZS1HX1RFU1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyZGJjNTBkNDllMjA0
OGY3MjI3YzQwNjkzMWE2OWY3NDdlMGViMTJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjMDBjY2NlMmNiNTI0NzRjNDE2ZGQxY2RjNjMxNzgwMDA4OTQ3YWM3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTog
U2F0LCAxNiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1zZWxm
LXRlc3QuYzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy94Yi1z
ZWxmLXRlc3QuYyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotaW5kZXggNzZiMmUxMi4uYzY4YzEzYSAx
MDA2NDQKK2luZGV4IGNlMmNlZDcuLmFhNjBiNmIgMTAwNjQ0CiAtLS0gYS9zcmMveGItc2VsZi10
ZXN0LmMKICsrKyBiL3NyYy94Yi1zZWxmLXRlc3QuYwotQEAgLTI5MTIsNyArMjkxMiw3IEBAIHhi
X3NwZWVkX2Z1bmModm9pZCkKK0BAIC0yOTYwLDcgKzI5NjAsNyBAQCB4Yl9zcGVlZF9mdW5jKHZv
aWQpCiAgaW50CiAgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjUuYmIgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjYuYmIKaW5k
ZXggODY4NzQzNjA1Mi4uYjczNjM0NmE4ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYl8wLjMuMjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnht
bGIvbGlieG1sYl8wLjMuMjYuYmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxl
Oi8vMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZp
bGU6Ly9ydW4tcHRlc3QgXAogIgotU1JDUkVWID0gImIzMWRlYzA3MmY0NDI4MTIzZGIzODY2YzE4
YmYzMmJjNWRiMDRkMzUiCitTUkNSRVYgPSAiZjk2OWI0ZGQ0OTFhNzM2N2Y3NTAwZjU1ZjU3NmM4
MTA5ODUzNjNkNyIKIAogREVQRU5EUyA9ICJnbGliLTIuMCB4eiB6c3RkIgogCi0tIAoyLjQ3LjEK
Cg==

--===============2614496700256174803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1870968 to 1897720 (+1%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 355644 to 355651 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 277094 to 281190 (+1%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 519007 to 524066 (+1%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: directory renamed /usr/src/debug/libxmlb/0.3.25/src -> /usr/src/debug/libxmlb/0.3.26/src
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.25 [default] to 0.3.26 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.25" to "0.3.26"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.25 [default] to 0.3.26 [default]

--===============2614496700256174803==--


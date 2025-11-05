Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C01CD4F2A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2349.1762384572388914338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pF/tu4nI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IysrvR/y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564ed27d-37d953ad-c7f5-4daa-9215-c4f8baea88d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=drvwOtDRO4RzNrmymStvDgzMLdsgCa7X8G3E6bhPNoA=;
	b=pF/tu4nIUZgTdRZZoQdQlUNvCKrvPCijveqDoKX6UV+j35ibUBIFh7hrbVcf8kF7
	NXG3jC4Ni38Lb6aVJTqJxo+zEf6k+1Nf2JlnOMsffckUaJFevUb2jXgFGUdj+0y/fOd
	/gJcuK/y55kGV+IuS4bszqOftQS8zR5mXB53/Njw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=drvwOtDRO4RzNrmymStvDgzMLdsgCa7X8G3E6bhPNoA=;
	b=IysrvR/yx3lFwTlcXzRg9sjWJIdMmcXIhEA4F1P85a6Drz/JqGnzJEKLVxLxElPv
	VIr9W9+wUICyc9uOe9QPNHRc9RDTpyrz5rNrYsIdjZLcmzVCtwd5kgaQXVTeRkmRfb6
	g5hz4JHIXiFQalCJ72d0WOyQ4jU0gQewNXVYPYJA=
Content-Type: multipart/mixed; boundary="===============8372134043145592167=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.24 SUCCEEDED
Message-ID: <0101019a564ed27d-37d953ad-c7f5-4daa-9215-c4f8baea88d6-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225878

--===============8372134043145592167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.23-0.3.24.patch
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
From 6918ea1008a6856356b367b983eb7537b745dd55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 20:11:58 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.23 -> 0.3.24

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 1c46f6fc1e..bb03269306 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 2dbc50d49e2048f7227c406931a69f747e0eb12c Mon Sep 17 00:00:00 2001
+From e5ece12e5ce28efce7e7c1059e4b82fa32aa6b7b Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 76b2e12..c68c13a 100644
+index 681fca8..3b14656 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2912,7 +2912,7 @@ xb_speed_func(void)
+@@ -2918,7 +2918,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
index 54df81c718..24eb62c98c 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "65bfb3099beeb7a5ffae995db124f55bea70f41e"
+SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============8372134043145592167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1830568 to 1830264 (-0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 355632 to 355644 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.23" to "0.3.24"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.23 [default] to 0.3.24 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.23" to "0.3.24"

--===============8372134043145592167==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.23-0.3.24.patch"

RnJvbSA2OTE4ZWExMDA4YTY4NTYzNTZiMzY3Yjk4M2ViNzUzN2I3NDVkZDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMDoxMTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbGI6IHVwZ3JhZGUgMC4zLjIzIC0+IDAuMy4yNAoKLS0tCiAuLi4vbGlieG1sYi8wMDAxLXhi
LXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCB8IDYgKysrLS0tCiAuLi4v
bGlieG1sYi97bGlieG1sYl8wLjMuMjMuYmIgPT4gbGlieG1sYl8wLjMuMjQuYmJ9ICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL3tsaWJ4bWxiXzAuMy4yMy5iYiA9PiBs
aWJ4bWxiXzAuMy4yNC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElS
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0
ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAppbmRleCAxYzQ2ZjZmYzFlLi5iYjAz
MjY5MzA2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAw
MDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2Rl
LUdfVEVTVF9TUkNESVIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJkYmM1MGQ0OWUyMDQ4
ZjcyMjdjNDA2OTMxYTY5Zjc0N2UwZWIxMmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGU1ZWNlMTJlNWNlMjhlZmNlN2U3YzEwNTllNGI4MmZhMzJhYTZiN2IgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBT
YXQsIDE2IFNlcCAyMDIzIDE0OjAyOjU3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHhiLXNlbGYt
dGVzdC5jOiBoYXJkY29kZSBHX1RFU1RfU1JDRElSCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVk
LW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3hiLXNl
bGYtdGVzdC5jIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1pbmRleCA3NmIyZTEyLi5jNjhjMTNhIDEw
MDY0NAoraW5kZXggNjgxZmNhOC4uM2IxNDY1NiAxMDA2NDQKIC0tLSBhL3NyYy94Yi1zZWxmLXRl
c3QuYwogKysrIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1AQCAtMjkxMiw3ICsyOTEyLDcgQEAgeGJf
c3BlZWRfZnVuYyh2b2lkKQorQEAgLTI5MTgsNyArMjkxOCw3IEBAIHhiX3NwZWVkX2Z1bmModm9p
ZCkKICBpbnQKICBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICB7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yMy5iYiBiL21ldGEvcmVjaXBl
cy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjI0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjIzLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNC5iYgppbmRl
eCA1NGRmODFjNzE4Li4yNGViNjJjOThjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiXzAuMy4yMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1s
Yi9saWJ4bWxiXzAuMy4yNC5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICIgXAogCWZpbGU6
Ly8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCBcCiAJZmls
ZTovL3J1bi1wdGVzdCBcCiAiCi1TUkNSRVYgPSAiNjViZmIzMDk5YmVlYjdhNWZmYWU5OTVkYjEy
NGY1NWJlYTcwZjQxZSIKK1NSQ1JFViA9ICJkMDA0Y2NhNDY1ZTVjNWFmM2NlMDJjMDJhMTU5Nzhm
ZjAyYjUxMGMzIgogCiBERVBFTkRTID0gImdsaWItMi4wIHh6IHpzdGQiCiAKLS0gCjIuNDcuMQoK

--===============8372134043145592167==--


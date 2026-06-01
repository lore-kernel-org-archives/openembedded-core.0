Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEB1CD98C6
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1551.1780328129264517875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qGMBlhoW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D+PFm4+x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e83d3aec0-49b13802-9490-4998-864c-21d061ec417b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YnqQJPMZui87CXsg3+mv6yvMBVQcXeTwF7DzZ5X9dD4=;
	b=qGMBlhoWxd1BmQS1nW027VWwwRV+/JRoa3mVXvOZxm65/d2qjk44QiSyjLyYp3t7
	INa0Q1+43jw8a4N1qodf/vBf5vaY4xKjT0NQAmb4icXyWhfy9h9gqlWmz1td0VgljEI
	hNOIwhGmRvif5UfoYdgJutSbbSx4ZHhxubJFQrm4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YnqQJPMZui87CXsg3+mv6yvMBVQcXeTwF7DzZ5X9dD4=;
	b=D+PFm4+x8aH5YCBoQx3rpdobHDZfaz0i4mBmhY4P6XiRhKbUTcW+a3XTLWgFJAox
	pGnskg/9qkCYAfw4L74kWld5vJ+O0159Jsw9Xo/2z06Nb0VZ1oTOTEulZdZJCCFrqE8
	I3h1IV6US/9R4kJOlFFa2+4fuyOI84A94uedGdEQ=
Content-Type: multipart/mixed; boundary="===============4139884621604302583=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.27 SUCCEEDED
Message-ID: <0101019e83d3aec0-49b13802-9490-4998-864c-21d061ec417b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237917

--===============4139884621604302583==
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
From a7266bf62129f6806c91af5fe8101a7aed80fdf1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:08:57 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.26 -> 0.3.27

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.26.bb => libxmlb_0.3.27.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.26.bb => libxmlb_0.3.27.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 96707c2b0f..d630026c32 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 463658f88ed0c3d0b41a5f9e546d00e574f44e79 Mon Sep 17 00:00:00 2001
+From 71efdfec5aa2c02dff81b144dd5208e7c6437ae2 Mon Sep 17 00:00:00 2001
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


--===============4139884621604302583==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.26-0.3.27.patch"

RnJvbSBhNzI2NmJmNjIxMjlmNjgwNmM5MWFmNWZlODEwMWE3YWVkODBmZGYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMTowODo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbGI6IHVwZ3JhZGUgMC4zLjI2IC0+IDAuMy4yNwoKLS0tCiAuLi4vbGlieG1sYi8wMDAxLXhi
LXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCB8IDYgKysrLS0tCiAuLi4v
bGlieG1sYi97bGlieG1sYl8wLjMuMjYuYmIgPT4gbGlieG1sYl8wLjMuMjcuYmJ9ICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL3tsaWJ4bWxiXzAuMy4yNi5iYiA9PiBs
aWJ4bWxiXzAuMy4yNy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElS
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0
ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAppbmRleCA5NjcwN2MyYjBmLi5kNjMw
MDI2YzMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAw
MDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2Rl
LUdfVEVTVF9TUkNESVIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ2MzY1OGY4OGVkMGMz
ZDBiNDFhNWY5ZTU0NmQwMGU1NzRmNDRlNzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDcxZWZkZmVjNWFhMmMwMmRmZjgxYjE0NGRkNTIwOGU3YzY0MzdhZTIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBT
YXQsIDE2IFNlcCAyMDIzIDE0OjAyOjU3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHhiLXNlbGYt
dGVzdC5jOiBoYXJkY29kZSBHX1RFU1RfU1JDRElSCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVk
LW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3hiLXNl
bGYtdGVzdC5jIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1pbmRleCBjZTJjZWQ3Li5hYTYwYjZiIDEw
MDY0NAoraW5kZXggMDQzZGI2NS4uYmU4NmEzOCAxMDA2NDQKIC0tLSBhL3NyYy94Yi1zZWxmLXRl
c3QuYwogKysrIGIvc3JjL3hiLXNlbGYtdGVzdC5jCi1AQCAtMjk2MCw3ICsyOTYwLDcgQEAgeGJf
c3BlZWRfZnVuYyh2b2lkKQorQEAgLTMzMDQsNyArMzMwNCw3IEBAIHhiX3NwZWVkX2Z1bmModm9p
ZCkKICBpbnQKICBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICB7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNi5iYiBiL21ldGEvcmVjaXBl
cy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjI3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjI2LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yNy5iYgppbmRl
eCBiNzM2MzQ2YThmLi5jNjhmMzc1YWEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiXzAuMy4yNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1s
Yi9saWJ4bWxiXzAuMy4yNy5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICIgXAogCWZpbGU6
Ly8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCBcCiAJZmls
ZTovL3J1bi1wdGVzdCBcCiAiCi1TUkNSRVYgPSAiZjk2OWI0ZGQ0OTFhNzM2N2Y3NTAwZjU1ZjU3
NmM4MTA5ODUzNjNkNyIKK1NSQ1JFViA9ICIyMzIwYTY2Y2QyNjdhODJiZmQ0MWRiOTBlMzVjZDMz
ZTFmNzFiZDhiIgogCiBERVBFTkRTID0gImdsaWItMi4wIHh6IHpzdGQiCiAKLS0gCjIuNDcuMQoK

--===============4139884621604302583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1976648 to 2034824 (+3%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 355651 to 357291 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 289382 to 305766 (+6%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: directory renamed /usr/src/debug/libxmlb/0.3.26/src -> /usr/src/debug/libxmlb/0.3.27/src
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 524066 to 538134 (+3%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.26" to "0.3.27"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.26 [default] to 0.3.27 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGSIZE changed from 207692 to 207784 (+0%)

--===============4139884621604302583==--


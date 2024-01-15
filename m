Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2AAC54791
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.88277.1705340029282008064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TSGWnlfD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LPOaUnJ2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d0e2fc582-f5238b46-1565-4d6f-884a-749a4102db23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QAZsn/TmWhwPE2XMYWt3dWQPjgnv8k8TsB26gP9jcm4=;
	b=TSGWnlfDLBDJ/nGwQKsXtyTGA7tfEUHK4xD+T98JNrhK4n1Zok76ss0HwAztnPjS
	CCkVK6tbFEZIbzrC9CngisC+UXD+tfe+jjhypB3bvooqVIBd3P4m8xuW9WW7QtlwtVS
	PJ61xcwJB1mvJNBhY6zHBAoHzY2uLZOYvZzCNMi0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QAZsn/TmWhwPE2XMYWt3dWQPjgnv8k8TsB26gP9jcm4=;
	b=LPOaUnJ2T88wDnRPMXTVheG4ZANeV/m6Mb4Wtk2T1xUStni09qZQv+rlkfhlg24y
	8ZfQR1ICWtwRXOF9pC2zqyIxERgsxaWZ6afXJHrhg8oEwtMGoNFVt2zx9zVs9omJrzX
	Qg1JKEUGyvRh+070O/Y8eU4gSppYxdxNijg0TzKw=
Content-Type: multipart/mixed; boundary="===============0450732911563769618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.72 SUCCEEDED
Message-ID: <0101018d0e2fc582-f5238b46-1565-4d6f-884a-749a4102db23-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193698

--===============0450732911563769618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.72* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.71-5.72.patch
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
From 7041b7aa16df7a05a3cf3289ae352efaec9ee7ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 05:22:13 +0000
Subject: [PATCH] bluez5: upgrade 5.71 -> 5.72

---
 .../bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch       | 6 +++---
 ...sts-add-a-target-for-building-tests-without-runnin.patch | 4 ++--
 .../0004-src-shared-util.c-include-linux-limits.h.patch     | 4 ++--
 .../bluez5/{bluez5_5.71.bb => bluez5_5.72.bb}               | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.71.bb => bluez5_5.72.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index 3546c7c305..b1e93dbe19 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From e8808a2f5e17d375411c7409eaffb17e72f65022 Mon Sep 17 00:00:00 2001
+From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -27,10 +27,10 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index f92d860..a5f7117 100644
+index 5e06d4e..4864d36 100644
 --- a/unit/test-gatt.c
 +++ b/unit/test-gatt.c
-@@ -4479,7 +4479,7 @@ int main(int argc, char *argv[])
+@@ -4546,7 +4546,7 @@ int main(int argc, char *argv[])
  			test_server, service_db_1, NULL,
  			raw_pdu(0x03, 0x00, 0x02),
  			raw_pdu(0xbf, 0x00),
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index be05093551..881494a354 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From 3724958858b0ee430f37fb83388c3737d2039a3a Mon Sep 17 00:00:00 2001
+From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index e7221bd..9595fd1 100644
+index e738eb3..dab17dd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -710,6 +710,9 @@ endif
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index 6ef135327d..516d859069 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From ad069fadfcce2cf70f45b1c4a42665448675297e Mon Sep 17 00:00:00 2001
+From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/util.c b/src/shared/util.c
-index 34491f4..412f3ad 100644
+index c0c2c4a..036dc0d 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.71.bb b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.71.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.72.bb
index b9bc3dd1b6..9fda960ea7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.71.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "b828d418c93ced1f55b616fb5482cf01537440bfb34fbda1a564f3ece94735d8"
+SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.42.0


--===============0450732911563769618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.71-5.72.patch"

RnJvbSA3MDQxYjdhYTE2ZGY3YTA1YTNjZjMyODlhZTM1MmVmYWVjOWVlN2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDU6MjI6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bHVlejU6IHVwZ3JhZGUgNS43MSAtPiA1LjcyCgotLS0KIC4uLi9ibHVlejUvYmx1ZXo1LzAwMDEt
dGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoICAgICAgIHwgNiArKystLS0KIC4uLnN0cy1h
ZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoIHwgNCAr
Ky0tCiAuLi4vMDAwNC1zcmMtc2hhcmVkLXV0aWwuYy1pbmNsdWRlLWxpbnV4LWxpbWl0cy5oLnBh
dGNoICAgICB8IDQgKystLQogLi4uL2JsdWV6NS97Ymx1ZXo1XzUuNzEuYmIgPT4gYmx1ZXo1XzUu
NzIuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS97Ymx1ZXo1XzUuNzEuYmIgPT4gYmx1ZXo1XzUuNzIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdC1nYXR0
LUZpeC1odW5nLWlzc3VlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1LzAwMDEtdGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoCmluZGV4IDM1NDZjN2Mz
MDUuLmIxZTkzZGJlMTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1
ZXo1L2JsdWV6NS8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0LWdhdHQtRml4LWh1
bmctaXNzdWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU4ODA4YTJmNWUxN2QzNzU0MTFj
NzQwOWVhZmZiMTdlNzJmNjUwMjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZiNTgz
YTU3ZjlmNGFiOTU2YTA5ZTliYjk2ZDg5YWExMzU1M2JmMjEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJp
LCAyNCBBdWcgMjAxOCAxMjowNDowMyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0LWdhdHQ6
IEZpeCBodW5nIGlzc3VlCkBAIC0yNywxMCArMjcsMTAgQEAgU2lnbmVkLW9mZi1ieTogTWluZ2xp
IFl1IDxNaW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3VuaXQvdGVzdC1nYXR0LmMgYi91
bml0L3Rlc3QtZ2F0dC5jCi1pbmRleCBmOTJkODYwLi5hNWY3MTE3IDEwMDY0NAoraW5kZXggNWUw
NmQ0ZS4uNDg2NGQzNiAxMDA2NDQKIC0tLSBhL3VuaXQvdGVzdC1nYXR0LmMKICsrKyBiL3VuaXQv
dGVzdC1nYXR0LmMKLUBAIC00NDc5LDcgKzQ0NzksNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqYXJndltdKQorQEAgLTQ1NDYsNyArNDU0Niw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pCiAgCQkJdGVzdF9zZXJ2ZXIsIHNlcnZpY2VfZGJfMSwgTlVMTCwKICAJCQlyYXdf
cGR1KDB4MDMsIDB4MDAsIDB4MDIpLAogIAkJCXJhd19wZHUoMHhiZiwgMHgwMCksCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0cy1h
ZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdHMtYWRkLWEtdGFy
Z2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaAppbmRleCBiZTA1MDkz
NTUxLi44ODE0OTRhMzU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdp
dGhvdXQtcnVubmluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1
L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdldC1mb3ItYnVpbGRpbmctdGVzdHMtd2l0aG91
dC1ydW5uaW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM3MjQ5NTg4NThiMGVlNDMwZjM3
ZmI4MzM4OGMzNzM3ZDIwMzlhM2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDczOGU3
M2IzODYzNTJmZDkwZjFmMjZjYzFlZTc1NDI3Y2Y0ZGMyM2IgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERh
dGU6IEZyaSwgMSBBcHIgMjAxNiAxNzowNzozNCArMDMwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0
czogYWRkIGEgdGFyZ2V0IGZvciBidWlsZGluZyB0ZXN0cyB3aXRob3V0IHJ1bm5pbmcgdGhlbQpA
QCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCiAKIGRp
ZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCBlNzIyMWJkLi45NTk1
ZmQxIDEwMDY0NAoraW5kZXggZTczOGViMy4uZGFiMTdkZCAxMDA2NDQKIC0tLSBhL01ha2VmaWxl
LmFtCiArKysgYi9NYWtlZmlsZS5hbQogQEAgLTcxMCw2ICs3MTAsOSBAQCBlbmRpZgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDQtc3JjLXNo
YXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDA0LXNyYy1zaGFyZWQtdXRpbC5jLWluY2x1ZGUt
bGludXgtbGltaXRzLmgucGF0Y2gKaW5kZXggNmVmMTM1MzI3ZC4uNTE2ZDg1OTA2OSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDQtc3JjLXNo
YXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwNC1zcmMtc2hhcmVkLXV0aWwuYy1pbmNs
dWRlLWxpbnV4LWxpbWl0cy5oLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhZDA2OWZhZGZj
Y2UyY2Y3MGY0NWIxYzRhNDI2NjU0NDg2NzUyOTdlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBiNTNkZjYxYjQxMDg4YjY4YzEyN2FjNzZjYzcxNjgzYWMzNDUzYjlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KIERhdGU6IE1vbiwgMTIgRGVjIDIwMjIgMTM6MTA6MTkgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gc3JjL3NoYXJlZC91dGlsLmM6IGluY2x1ZGUgbGludXgvbGltaXRzLmgKQEAgLTE0LDcgKzE0
LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL3NyYy9z
aGFyZWQvdXRpbC5jIGIvc3JjL3NoYXJlZC91dGlsLmMKLWluZGV4IDM0NDkxZjQuLjQxMmYzYWQg
MTAwNjQ0CitpbmRleCBjMGMyYzRhLi4wMzZkYzBkIDEwMDY0NAogLS0tIGEvc3JjL3NoYXJlZC91
dGlsLmMKICsrKyBiL3NyYy9zaGFyZWQvdXRpbC5jCiBAQCAtMjMsNiArMjMsNyBAQApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzEuYmIgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43Mi5iYgpzaW1pbGFyaXR5
IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9i
bHVlejVfNS43MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1XzUuNzIuYmIKaW5kZXggYjliYzNkZDFiNi4uOWZkYTk2MGVhNyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzIuYmIKQEAgLTEsNiArMSw2
IEBACiByZXF1aXJlIGJsdWV6NS5pbmMKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI4MjhkNDE4
YzkzY2VkMWY1NWI2MTZmYjU0ODJjZjAxNTM3NDQwYmZiMzRmYmRhMWE1NjRmM2VjZTk0NzM1ZDgi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDk5ZDdmYTM0NWE5OTZjMWJiNjUwZjVjNjc0OWUxZDky
OTExMWZhNmVjZTBiZTBlOTg2ODdmZWU2MTI0NTM2ZSIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAyMC0y
NDQ5MF0gPSAiY3BlLWluY29ycmVjdDogVGhpcyBpc3N1ZSBoYXMga2VybmVsIGZpeGVzIHJhdGhl
ciB0aGFuIGJsdWV6IGZpeGVzIgogCi0tIAoyLjQyLjAKCg==

--===============0450732911563769618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.11", added "/usr/lib/libbluetooth.so.3.19.12"
Changes to packages/core2-64-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.11 to libbluetooth.so.3.19.12
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.11 to libbluetooth.so.3.19.12
  /usr/lib/libbluetooth.so.3.19.11 moved to /usr/lib/libbluetooth.so.3.19.12

--===============0450732911563769618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 33496200 to 33647200 (+0%)
packages/core2-64-poky-linux/bluez5/bluez5-dbg: FILELIST: removed "/usr/lib/.debug/libbluetooth.so.3.19.11", added "/usr/lib/.debug/libbluetooth.so.3.19.12"
packages/core2-64-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-dbg: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-dev: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-doc: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-locale: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-noinst-tools: PKGSIZE changed from 5237016 to 5249304 (+0%)
packages/core2-64-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-obex: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 6198771 to 6268595 (+1%)
packages/core2-64-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-ptest: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 8313398 to 8400912 (+1%)
packages/core2-64-poky-linux/bluez5/bluez5-src: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-src: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5-testtools: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5/bluez5: PKGSIZE changed from 6115668 to 6137060 (+0%)
packages/core2-64-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.11", added "/usr/lib/libbluetooth.so.3.19.12"
packages/core2-64-poky-linux/bluez5/bluez5: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5/bluez5: PV changed from "5.71" to "5.72"
packages/core2-64-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.71.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.72.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch"
packages/core2-64-poky-linux/bluez5: PKGV changed from 5.71 [default] to 5.72 [default]
packages/core2-64-poky-linux/bluez5: PV changed from "5.71" to "5.72"
Changes to packages/core2-64-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.11 to libbluetooth.so.3.19.12
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.11 to libbluetooth.so.3.19.12
  /usr/lib/libbluetooth.so.3.19.11 moved to /usr/lib/libbluetooth.so.3.19.12

--===============0450732911563769618==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA973C3065B
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13424.1713248037244273313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MUFubT4G;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=e1EuHZlP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018ee58a65cb-8f836d7c-56db-4edd-83d0-04d39893e25a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tItiAnUyTesTPN7fSzZvVUxiy4y1JceTvux6doW6Y/k=;
	b=MUFubT4GMvLnTYmiV229HZd1ZWoeaMzABNSQnmc44xkXerMGleiCd4WQr21F2yq0
	SBDmQ87Q5tDxauoI8pXTm250Af+yL/F5LwBZQCuXUARURkhMRPPVcEEQgQ5qR+xdvfY
	1km/gqt1k7JUZCm7mjgrEClU9KSSKq+mKiTTZ0g4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tItiAnUyTesTPN7fSzZvVUxiy4y1JceTvux6doW6Y/k=;
	b=e1EuHZlPkhudt7l4jxvMhrA1OcQl4FMkiS8wrJnerP1o/5PRTq/62XVxe9KtSpfd
	qPTuEUL8XQhqfwAM6NA/1BfDWWUYF/jlaES0YTqbQ/DYzdp7lwPpAK2Knu/Fhug5mYs
	D4wavIOdBTfpZY7KFscGGxwHBRlpOEDo3j1559XA=
Content-Type: multipart/mixed; boundary="===============7668128358657587892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.74 FAILED
Message-ID: <0101018ee58a65cb-8f836d7c-56db-4edd-83d0-04d39893e25a-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198255

--===============7668128358657587892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.74* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.72-5.74.patch
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
From 60e40c5f877c7ca4a2451f277ebc49d18172da7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 17:25:54 +0000
Subject: [PATCH] bluez5: upgrade 5.72 -> 5.74

---
 .../bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch      | 7 +++----
 ...ts-add-a-target-for-building-tests-without-runnin.patch | 7 +++----
 .../0004-src-shared-util.c-include-linux-limits.h.patch    | 5 ++---
 .../bluez5/{bluez5_5.72.bb => bluez5_5.74.bb}              | 2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.72.bb => bluez5_5.74.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index b1e93dbe19..8b2219068f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
+From b1e659a24c42d08dd1a15683cb698eaadad95fb5 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -21,16 +21,15 @@ no action.
 Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
 ---
  unit/test-gatt.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index 5e06d4e..4864d36 100644
+index 1613fbc..25dd614 100644
 --- a/unit/test-gatt.c
 +++ b/unit/test-gatt.c
-@@ -4546,7 +4546,7 @@ int main(int argc, char *argv[])
+@@ -4547,7 +4547,7 @@ int main(int argc, char *argv[])
  			test_server, service_db_1, NULL,
  			raw_pdu(0x03, 0x00, 0x02),
  			raw_pdu(0xbf, 0x00),
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 881494a354..8116dfaae4 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,20 +1,19 @@
-From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
+From 903864e6a1bd274a122844c293d4825119cde85d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile.am | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index e738eb3..dab17dd 100644
+index 05d0293..534a340 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -710,6 +710,9 @@ endif
+@@ -708,6 +708,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index 516d859069..11c35f7e79 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
+From 1b7e6b296fcac3bf720d81a0790b675cdbe72baa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
@@ -8,13 +8,12 @@ systems such as those using musl.
 
 Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  src/shared/util.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/util.c b/src/shared/util.c
-index c0c2c4a..036dc0d 100644
+index ee59b94..84e5820 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.74.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.72.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.74.bb
index 9fda960ea7..3fc46a0cc1 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.74.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
+SRC_URI[sha256sum] = "1b35d23099f6b66d1ab065c17bf9bf286e854063e9b17477b17804d70de9089a"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.42.0


--===============7668128358657587892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.72-5.74.patch"

RnJvbSA2MGU0MGM1Zjg3N2M3Y2E0YTI0NTFmMjc3ZWJjNDlkMTgxNzJkYTdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTc6MjU6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bHVlejU6IHVwZ3JhZGUgNS43MiAtPiA1Ljc0CgotLS0KIC4uLi9ibHVlejUvYmx1ZXo1LzAwMDEt
dGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoICAgICAgfCA3ICsrKy0tLS0KIC4uLnRzLWFk
ZC1hLXRhcmdldC1mb3ItYnVpbGRpbmctdGVzdHMtd2l0aG91dC1ydW5uaW4ucGF0Y2ggfCA3ICsr
Ky0tLS0KIC4uLi8wMDA0LXNyYy1zaGFyZWQtdXRpbC5jLWluY2x1ZGUtbGludXgtbGltaXRzLmgu
cGF0Y2ggICAgfCA1ICsrLS0tCiAuLi4vYmx1ZXo1L3tibHVlejVfNS43Mi5iYiA9PiBibHVlejVf
NS43NC5iYn0gICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
Ymx1ZXo1L3tibHVlejVfNS43Mi5iYiA9PiBibHVlejVfNS43NC5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0LWdh
dHQtRml4LWh1bmctaXNzdWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6
NS9ibHVlejUvMDAwMS10ZXN0LWdhdHQtRml4LWh1bmctaXNzdWUucGF0Y2gKaW5kZXggYjFlOTNk
YmUxOS4uOGIyMjE5MDY4ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
bHVlejUvYmx1ZXo1LzAwMDEtdGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3QtZ2F0dC1GaXgt
aHVuZy1pc3N1ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmI1ODNhNTdmOWY0YWI5NTZh
MDllOWJiOTZkODlhYTEzNTUzYmYyMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjFl
NjU5YTI0YzQyZDA4ZGQxYTE1NjgzY2I2OThlYWFkYWQ5NWZiNSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBG
cmksIDI0IEF1ZyAyMDE4IDEyOjA0OjAzICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3QtZ2F0
dDogRml4IGh1bmcgaXNzdWUKQEAgLTIxLDE2ICsyMSwxNSBAQCBubyBhY3Rpb24uCiBVcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtYmx1ZXRvb3Ro
Jm09MTUzNTA4ODgxODA0NjM1Jnc9Ml0KIAogU2lnbmVkLW9mZi1ieTogTWluZ2xpIFl1IDxNaW5n
bGkuWXVAd2luZHJpdmVyLmNvbT4KLQogLS0tCiAgdW5pdC90ZXN0LWdhdHQuYyB8IDIgKy0KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL3VuaXQvdGVzdC1nYXR0LmMgYi91bml0L3Rlc3QtZ2F0dC5jCi1pbmRleCA1ZTA2ZDRlLi40
ODY0ZDM2IDEwMDY0NAoraW5kZXggMTYxM2ZiYy4uMjVkZDYxNCAxMDA2NDQKIC0tLSBhL3VuaXQv
dGVzdC1nYXR0LmMKICsrKyBiL3VuaXQvdGVzdC1nYXR0LmMKLUBAIC00NTQ2LDcgKzQ1NDYsNyBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAgLTQ1NDcsNyArNDU0Nyw3IEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgCQkJdGVzdF9zZXJ2ZXIsIHNlcnZp
Y2VfZGJfMSwgTlVMTCwKICAJCQlyYXdfcGR1KDB4MDMsIDB4MDAsIDB4MDIpLAogIAkJCXJhd19w
ZHUoMHhiZiwgMHgwMCksCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdp
dGhvdXQtcnVubmluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1
ZXo1LzAwMDEtdGVzdHMtYWRkLWEtdGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1
bm5pbi5wYXRjaAppbmRleCA4ODE0OTRhMzU0Li44MTE2ZGZhYWU0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJn
ZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdldC1m
b3ItYnVpbGRpbmctdGVzdHMtd2l0aG91dC1ydW5uaW4ucGF0Y2gKQEAgLTEsMjAgKzEsMTkgQEAK
LUZyb20gNzM4ZTczYjM4NjM1MmZkOTBmMWYyNmNjMWVlNzU0MjdjZjRkYzIzYiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTAzODY0ZTZhMWJkMjc0YTEyMjg0NGMyOTNkNDgyNTExOWNk
ZTg1ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAxIEFwciAyMDE2IDE3OjA3OjM0ICsw
MzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBhZGQgYSB0YXJnZXQgZm9yIGJ1aWxkaW5nIHRl
c3RzIHdpdGhvdXQgcnVubmluZyB0aGVtCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbb2Ugc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgTWFrZWZpbGUuYW0gfCAzICsrKwogIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFr
ZWZpbGUuYW0KLWluZGV4IGU3MzhlYjMuLmRhYjE3ZGQgMTAwNjQ0CitpbmRleCAwNWQwMjkzLi41
MzRhMzQwIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAt
NzEwLDYgKzcxMCw5IEBAIGVuZGlmCitAQCAtNzA4LDYgKzcwOCw5IEBAIGVuZGlmCiAgVEVTVFMg
PSAkKHVuaXRfdGVzdHMpCiAgQU1fVEVTVFNfRU5WSVJPTk1FTlQgPSBNQUxMT0NfQ0hFQ0tfPTMg
TUFMTE9DX1BFUlRVUkJfPTY5CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JsdWV6NS9ibHVlejUvMDAwNC1zcmMtc2hhcmVkLXV0aWwuYy1pbmNsdWRlLWxpbnV4LWxp
bWl0cy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAw
MDQtc3JjLXNoYXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5wYXRjaAppbmRleCA1
MTZkODU5MDY5Li4xMWMzNWY3ZTc5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JsdWV6NS9ibHVlejUvMDAwNC1zcmMtc2hhcmVkLXV0aWwuYy1pbmNsdWRlLWxpbnV4LWxp
bWl0cy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6
NS8wMDA0LXNyYy1zaGFyZWQtdXRpbC5jLWluY2x1ZGUtbGludXgtbGltaXRzLmgucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGI1M2RmNjFiNDEwODhiNjhjMTI3YWM3NmNjNzE2ODNhYzM0NTNi
OWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFiN2U2YjI5NmZjYWMzYmY3MjBkODFh
MDc5MGI2NzVjZGJlNzJiYWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogTW9uLCAxMiBEZWMgMjAyMiAx
MzoxMDoxOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBzcmMvc2hhcmVkL3V0aWwuYzogaW5jbHVk
ZSBsaW51eC9saW1pdHMuaApAQCAtOCwxMyArOCwxMiBAQCBzeXN0ZW1zIHN1Y2ggYXMgdGhvc2Ug
dXNpbmcgbXVzbC4KIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW3RvIGxpbnV4LWJsdWV0
b290aEB2Z2VyLmtlcm5lbC5vcmcsbHVpei52b24uZGVudHpAaW50ZWwuY29tLGZyZWRlcmljLmRh
bmlzQGNvbGxhYm9yYS5jb21dCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgotCiAtLS0KICBzcmMvc2hhcmVkL3V0aWwuYyB8IDEgKwogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3NoYXJlZC91dGls
LmMgYi9zcmMvc2hhcmVkL3V0aWwuYwotaW5kZXggYzBjMmM0YS4uMDM2ZGMwZCAxMDA2NDQKK2lu
ZGV4IGVlNTliOTQuLjg0ZTU4MjAgMTAwNjQ0CiAtLS0gYS9zcmMvc2hhcmVkL3V0aWwuYwogKysr
IGIvc3JjL3NoYXJlZC91dGlsLmMKIEBAIC0yMyw2ICsyMyw3IEBACmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43Mi5iYiBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81Ljc0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81Ljcy
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43
NC5iYgppbmRleCA5ZmRhOTYwZWE3Li4zZmM0NmEwY2MxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43NC5iYgpAQCAtMSw2ICsxLDYgQEAKIHJlcXVp
cmUgYmx1ZXo1LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDk5ZDdmYTM0NWE5OTZjMWJi
NjUwZjVjNjc0OWUxZDkyOTExMWZhNmVjZTBiZTBlOTg2ODdmZWU2MTI0NTM2ZSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIxYjM1ZDIzMDk5ZjZiNjZkMWFiMDY1YzE3YmY5YmYyODZlODU0MDYzZTli
MTc0NzdiMTc4MDRkNzBkZTkwODlhIgogCiBDVkVfU1RBVFVTW0NWRS0yMDIwLTI0NDkwXSA9ICJj
cGUtaW5jb3JyZWN0OiBUaGlzIGlzc3VlIGhhcyBrZXJuZWwgZml4ZXMgcmF0aGVyIHRoYW4gYmx1
ZXogZml4ZXMiCiAKLS0gCjIuNDIuMAoK

--===============7668128358657587892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d6ab282365088dc04d5596424b6940b2dd2dfb93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d6ab282365088dc04d5596424b6940b2dd2dfb93"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 611 Local 599 Mirrors 0 Missed 12 Current 377 (98% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 389 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 457 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 505 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_create_spdx_setscene)
NOTE: recipe glibc-locale-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.74-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 351 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_fetch)
NOTE: recipe python3-pygobject-3.46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.74-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.74-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 650 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 704 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 900 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 902 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 933 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 939 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 946 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 948 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1613 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_unpack)
NOTE: recipe bluez5-5.74-r0: task do_unpack: Started
NOTE: recipe bluez5-5.74-r0: task do_unpack: Succeeded
NOTE: Running task 1760 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 988 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.74-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bluez5-5.74-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_deploy_source_date_epoch)
NOTE: Running task 2304 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.74-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.74-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2644 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_collect_spdx_deps)
NOTE: Running task 2673 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_populate_lic)
NOTE: recipe bluez5-5.74-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_deploy_source_date_epoch unihash changed to 08129408c4871b7f15eedcc3da4c822d4e9f1c9381dda12d4723ae58430fdfd7
NOTE: recipe bluez5-5.74-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.74-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.74-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_populate_lic unihash changed to ce8199182fb4a222e1adf814cfbfa10a686c5256d2b4dfd99e0dcb0b9b733ff8
NOTE: Setscene tasks completed
NOTE: recipe bluez5-5.74-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.74-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2674 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_configure)
NOTE: recipe bluez5-5.74-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/
 home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes
 -devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'quilt-native', 'vala', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libffi', 'libical', 'libpcre2', 'libseccomp', 'sqlite3', 'zl
 ib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
| libtoolize: and rerunning libtoolize and aclocal.
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:21: installing './compile'
| configure.ac:5: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: './install-sh' is updated
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../bluez-5.74/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot   --enable-test   --enable-datafiles   --enable-library   --enable-pie    --without-zsh-completion-dir  --disable-static  --enable-a2dp --enable-avrcp --disable-btpclient --disable-cups --enable-deprecated --disable-health --enable-hid --enable-hog --disable-manpages --disable-mesh --disable-midi --enable-network --disable-nfc 
 --enable-obex --enable-client --disable-sap --disable-sixaxis --enable-systemd --disable-testing --disable-threads --enable-tools --enable-udev
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot accepts -fsanitize=undefined... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot   option to reload object files... -r
| checking for x86_64-poky-linux-file... no
| checking for file... file
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for explicit_bzero... yes
| checking for getrandom... yes
| checking for rawmemchr... yes
| checking for signalfd... yes
| checking for clock_gettime in -lrt... yes
| checking for pthread_create in -lpthread... yes
| checking for dlopen in -ldl... yes
| checking for linux/types.h... yes
| checking for linux/if_alg.h... yes
| checking for linux/uinput.h... yes
| checking for linux/uhid.h... yes
| checking for sys/random.h... yes
| checking for glib-2.0 >= 2.28... yes
| checking for dbus-1 >= 1.10... yes
| checking D-Bus configuration directory... /usr/share
| checking D-Bus system bus services dir... /usr/share/dbus-1/system-services
| checking D-Bus session bus services dir... /usr/share/dbus-1/services
| checking for libudev >= 196... yes
| checking udev directory... /usr/lib/udev
| checking for libical... yes
| checking for readline/readline.h... yes
| checking systemd system unit dir... /usr/lib/systemd/system
| checking systemd user unit dir... /usr/lib/systemd/user
| configure: error: conditional "CUPS_SERVERBIN" was never defined.
| Usually this means the macro was only invoked conditionally.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/run.do_configure.344811:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/run.do_configure.344811, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/run.do_configure.344811, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/run.do_configure.344811, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/run.do_configure.344811, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/run.do_configure.344811, line 289
NOTE: recipe bluez5-5.74-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2674 tasks of which 2666 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415172527.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415172527.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.74-r0 do_configure: configure failed
ERROR: bluez5-5.74-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/run.do_configure.344811', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.74/temp/log.do_configure.344811
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.74.bb:do_configure) failed with exit code '1'

--===============7668128358657587892==--


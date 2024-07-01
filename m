Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E0AC41513
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2171.1719853075118007553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OV2+22nj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wc8GSAJG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101906f3b4714-d892eb6a-b176-47ce-b89b-ac310ef42595-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853074;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yVGSFkQonlOxNX5+oWjFtNC02EabUiRaCX3/bDoP4+M=;
	b=OV2+22njJTHAau5vojpdDIk9kwJdRlypiApMnHqJLmO6Bk0dX02Z2Zuh8Sp5s+KS
	RU+WVK7+9xcfSNbvLwzGp80CljIeOGUR694rkd1AKRZ09nAMcO0X+RS+Pj4IIkexV2o
	DKFAeTlQa9mHgzw6a4VqBs7zcmtPpV2C6FjJ+qDs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853074;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yVGSFkQonlOxNX5+oWjFtNC02EabUiRaCX3/bDoP4+M=;
	b=wc8GSAJGq1fgyjqDAmmkhn1Ud/ohcUwd14hDfgwBhfUaxQgKFS9vwVCgbGS7Rb99
	TMrXD/yA7uaDbH9DPfy4OUHAAyahC4xDaVcGT5huiEoiB7kisY2u7TQAvyjlsL6Pvi2
	nLXRMATnRbu6liBA0UC3qQKEi2kHTa01esnrQ91Y=
Content-Type: multipart/mixed; boundary="===============1580085187889845071=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.76 FAILED
Message-ID: <010101906f3b4714-d892eb6a-b176-47ce-b89b-ac310ef42595-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201314

--===============1580085187889845071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.76* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.72-5.76.patch
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
From b3d0f1833e11165b322c44fc6a64ce5faade76c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 05:04:39 +0000
Subject: [PATCH] bluez5: upgrade 5.72 -> 5.76

---
 .../bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch      | 7 +++----
 ...ts-add-a-target-for-building-tests-without-runnin.patch | 7 +++----
 .../0004-src-shared-util.c-include-linux-limits.h.patch    | 5 ++---
 .../bluez5/{bluez5_5.72.bb => bluez5_5.76.bb}              | 2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.72.bb => bluez5_5.76.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index b1e93dbe19..f9c867152a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
+From 5beaa77673c64401ae1393c1f30df85a17e8bc77 Mon Sep 17 00:00:00 2001
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
index 881494a354..b6856fc4bb 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,20 +1,19 @@
-From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
+From a5dea0711d68fbf2538fd39460b9ebd54a526c94 Mon Sep 17 00:00:00 2001
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
index 516d859069..13f93a1dbb 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
+From 5d8666424937e7ee7d524f154b6e24b77bceac98 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.76.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.72.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.76.bb
index 9fda960ea7..86ae191837 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.76.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
+SRC_URI[sha256sum] = "55e2c645909ad82d833c42ce85ec20434e0ef0070941b1eab73facdd240bbd63"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.44.0


--===============1580085187889845071==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.72-5.76.patch"

RnJvbSBiM2QwZjE4MzNlMTExNjViMzIyYzQ0ZmM2YTY0Y2U1ZmFhZGU3NmMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwNTowNDozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJs
dWV6NTogdXBncmFkZSA1LjcyIC0+IDUuNzYKCi0tLQogLi4uL2JsdWV6NS9ibHVlejUvMDAwMS10
ZXN0LWdhdHQtRml4LWh1bmctaXNzdWUucGF0Y2ggICAgICB8IDcgKysrLS0tLQogLi4udHMtYWRk
LWEtdGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaCB8IDcgKysr
LS0tLQogLi4uLzAwMDQtc3JjLXNoYXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5w
YXRjaCAgICB8IDUgKystLS0KIC4uLi9ibHVlejUve2JsdWV6NV81LjcyLmJiID0+IGJsdWV6NV81
Ljc2LmJifSAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
bHVlejUve2JsdWV6NV81LjcyLmJiID0+IGJsdWV6NV81Ljc2LmJifSAoOTQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3QtZ2F0
dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1
L2JsdWV6NS8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaAppbmRleCBiMWU5M2Ri
ZTE5Li5mOWM4NjcxNTJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Js
dWV6NS9ibHVlejUvMDAwMS10ZXN0LWdhdHQtRml4LWh1bmctaXNzdWUucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdC1nYXR0LUZpeC1o
dW5nLWlzc3VlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYjU4M2E1N2Y5ZjRhYjk1NmEw
OWU5YmI5NmQ4OWFhMTM1NTNiZjIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YmVh
YTc3NjczYzY0NDAxYWUxMzkzYzFmMzBkZjg1YTE3ZThiYzc3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogTWluZ2xpIFl1IDxNaW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZy
aSwgMjQgQXVnIDIwMTggMTI6MDQ6MDMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdC1nYXR0
OiBGaXggaHVuZyBpc3N1ZQpAQCAtMjEsMTYgKzIxLDE1IEBAIG5vIGFjdGlvbi4KIFVwc3RyZWFt
LVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL21hcmMuaW5mby8/bD1saW51eC1ibHVldG9vdGgm
bT0xNTM1MDg4ODE4MDQ2MzUmdz0yXQogCiBTaWduZWQtb2ZmLWJ5OiBNaW5nbGkgWXUgPE1pbmds
aS5ZdUB3aW5kcml2ZXIuY29tPgotCiAtLS0KICB1bml0L3Rlc3QtZ2F0dC5jIHwgMiArLQogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvdW5pdC90ZXN0LWdhdHQuYyBiL3VuaXQvdGVzdC1nYXR0LmMKLWluZGV4IDVlMDZkNGUuLjQ4
NjRkMzYgMTAwNjQ0CitpbmRleCAxNjEzZmJjLi4yNWRkNjE0IDEwMDY0NAogLS0tIGEvdW5pdC90
ZXN0LWdhdHQuYwogKysrIGIvdW5pdC90ZXN0LWdhdHQuYwotQEAgLTQ1NDYsNyArNDU0Niw3IEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtNDU0Nyw3ICs0NTQ3LDcgQEAg
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAJCQl0ZXN0X3NlcnZlciwgc2Vydmlj
ZV9kYl8xLCBOVUxMLAogIAkJCXJhd19wZHUoMHgwMywgMHgwMCwgMHgwMiksCiAgCQkJcmF3X3Bk
dSgweGJmLCAweDAwKSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1
ZXo1L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdldC1mb3ItYnVpbGRpbmctdGVzdHMtd2l0
aG91dC1ydW5uaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVl
ejUvMDAwMS10ZXN0cy1hZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVu
bmluLnBhdGNoCmluZGV4IDg4MTQ5NGEzNTQuLmI2ODU2ZmM0YmIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdl
dC1mb3ItYnVpbGRpbmctdGVzdHMtd2l0aG91dC1ydW5uaW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdHMtYWRkLWEtdGFyZ2V0LWZv
ci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaApAQCAtMSwyMCArMSwxOSBAQAot
RnJvbSA3MzhlNzNiMzg2MzUyZmQ5MGYxZjI2Y2MxZWU3NTQyN2NmNGRjMjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBhNWRlYTA3MTFkNjhmYmYyNTM4ZmQzOTQ2MGI5ZWJkNTRhNTI2
Yzk0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEgQXByIDIwMTYgMTc6MDc6MzQgKzAz
MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBhIHRhcmdldCBmb3IgYnVpbGRpbmcgdGVz
dHMgd2l0aG91dCBydW5uaW5nIHRoZW0KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
IFtvZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBNYWtlZmlsZS5hbSB8IDMgKysrCiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtl
ZmlsZS5hbQotaW5kZXggZTczOGViMy4uZGFiMTdkZCAxMDA2NDQKK2luZGV4IDA1ZDAyOTMuLjUz
NGEzNDAgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KLUBAIC03
MTAsNiArNzEwLDkgQEAgZW5kaWYKK0BAIC03MDgsNiArNzA4LDkgQEAgZW5kaWYKICBURVNUUyA9
ICQodW5pdF90ZXN0cykKICBBTV9URVNUU19FTlZJUk9OTUVOVCA9IE1BTExPQ19DSEVDS189MyBN
QUxMT0NfUEVSVFVSQl89NjkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmx1ZXo1L2JsdWV6NS8wMDA0LXNyYy1zaGFyZWQtdXRpbC5jLWluY2x1ZGUtbGludXgtbGlt
aXRzLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAw
NC1zcmMtc2hhcmVkLXV0aWwuYy1pbmNsdWRlLWxpbnV4LWxpbWl0cy5oLnBhdGNoCmluZGV4IDUx
NmQ4NTkwNjkuLjEzZjkzYTFkYmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmx1ZXo1L2JsdWV6NS8wMDA0LXNyYy1zaGFyZWQtdXRpbC5jLWluY2x1ZGUtbGludXgtbGlt
aXRzLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1
LzAwMDQtc3JjLXNoYXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYjUzZGY2MWI0MTA4OGI2OGMxMjdhYzc2Y2M3MTY4M2FjMzQ1M2I5
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWQ4NjY2NDI0OTM3ZTdlZTdkNTI0ZjE1
NGI2ZTI0Yjc3YmNlYWM5OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBNb24sIDEyIERlYyAyMDIyIDEz
OjEwOjE5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9zaGFyZWQvdXRpbC5jOiBpbmNsdWRl
IGxpbnV4L2xpbWl0cy5oCkBAIC04LDEzICs4LDEyIEBAIHN5c3RlbXMgc3VjaCBhcyB0aG9zZSB1
c2luZyBtdXNsLgogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbdG8gbGludXgtYmx1ZXRv
b3RoQHZnZXIua2VybmVsLm9yZyxsdWl6LnZvbi5kZW50ekBpbnRlbC5jb20sZnJlZGVyaWMuZGFu
aXNAY29sbGFib3JhLmNvbV0KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+Ci0KIC0tLQogIHNyYy9zaGFyZWQvdXRpbC5jIHwgMSArCiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvc2hhcmVkL3V0aWwu
YyBiL3NyYy9zaGFyZWQvdXRpbC5jCi1pbmRleCBjMGMyYzRhLi4wMzZkYzBkIDEwMDY0NAoraW5k
ZXggZWU1OWI5NC4uODRlNTgyMCAxMDA2NDQKIC0tLSBhL3NyYy9zaGFyZWQvdXRpbC5jCiArKysg
Yi9zcmMvc2hhcmVkL3V0aWwuYwogQEAgLTIzLDYgKzIzLDcgQEAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjcyLmJiIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzYuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81Ljc2
LmJiCmluZGV4IDlmZGE5NjBlYTcuLjg2YWUxOTE4MzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjcyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81Ljc2LmJiCkBAIC0xLDYgKzEsNiBAQAogcmVxdWly
ZSBibHVlejUuaW5jCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OTlkN2ZhMzQ1YTk5NmMxYmI2
NTBmNWM2NzQ5ZTFkOTI5MTExZmE2ZWNlMGJlMGU5ODY4N2ZlZTYxMjQ1MzZlIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjU1ZTJjNjQ1OTA5YWQ4MmQ4MzNjNDJjZTg1ZWMyMDQzNGUwZWYwMDcwOTQx
YjFlYWI3M2ZhY2RkMjQwYmJkNjMiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMjAtMjQ0OTBdID0gImNw
ZS1pbmNvcnJlY3Q6IFRoaXMgaXNzdWUgaGFzIGtlcm5lbCBmaXhlcyByYXRoZXIgdGhhbiBibHVl
eiBmaXhlcyIKIAotLSAKMi40NC4wCgo=

--===============1580085187889845071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-058465859ed5a62997bb9424e8eb88b543f43a86"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:058465859ed5a62997bb9424e8eb88b543f43a86"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 392 Local 380 Mirrors 0 Missed 12 Current 600 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1975 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_recipe_qa)
NOTE: recipe bluez5-5.76-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.76-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2681 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_fetch)
NOTE: recipe bluez5-5.76-r0: task do_fetch: Started
NOTE: recipe bluez5-5.76-r0: task do_fetch: Succeeded
NOTE: Running task 2682 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_unpack)
NOTE: Running task 2683 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.76-r0: task do_unpack: Started
NOTE: recipe bluez5-5.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.76-r0: task do_unpack: Succeeded
NOTE: Running task 2684 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_patch)
NOTE: Running task 2685 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.76-r0: task do_patch: Started
NOTE: recipe bluez5-5.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.76-r0: task do_patch: Succeeded
NOTE: Running task 2686 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_deploy_source_date_epoch)
NOTE: Running task 2687 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_populate_lic)
NOTE: recipe bluez5-5.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.76-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_deploy_source_date_epoch unihash changed to f65fada108c5cf8b13259907eaeaf6c25f2036b655a2af10426dbaaf99d2f0f9
NOTE: recipe bluez5-5.76-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_populate_lic unihash changed to 209927faddbcf7b0715bb65f61b03b72caa9378d705da73085d6c90b21ee70bb
NOTE: Setscene tasks completed
NOTE: Running task 2688 of 2703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_configure)
NOTE: recipe bluez5-5.76-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot', '/
 home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
| libtoolize: and rerunning libtoolize and aclocal.
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:21: installing './compile'
| configure.ac:5: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: './install-sh' is updated
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../bluez-5.76/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking   --enable-test   --enable-datafiles   --enable-library   --enable-pie    --without-zsh-completion-dir  --disable-static  --enable-a2dp --enable-avrcp --disable-btpclient --disable-cups --enable-deprecated --disable-health --enable-hid --enable-hog --disable-manpages --disable-mesh --disable-midi --enable-network --disable-nfc --enable-obex --enable-client --disable-sap --disable-sixaxis --enable-systemd --disable-testing --disable-threads --enable-tool
 s --enable-udev
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
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
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot accepts -fsanitize=undefined... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
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
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/run.do_configure.3963244:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/run.do_configure.3963244, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/run.do_configure.3963244, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/run.do_configure.3963244, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/run.do_configure.3963244, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/run.do_configure.3963244, line 289
NOTE: recipe bluez5-5.76-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2688 tasks of which 2679 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701050409.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701050409.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.76-r0 do_configure: configure failed
ERROR: bluez5-5.76-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/run.do_configure.3963244', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.76/temp/log.do_configure.3963244
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.76.bb:do_configure) failed with exit code '1'

--===============1580085187889845071==--


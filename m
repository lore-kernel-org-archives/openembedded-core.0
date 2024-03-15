Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BE9C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1234.1710522010374095625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MAvrFUqw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4jjHM6sG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e430e8780-0bcc4c8a-111f-4e29-815a-6629c987f29c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522009;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CZhGcYGXaR930egaLxJldVsyGgiGJgHeetRwiBDHQyI=;
	b=MAvrFUqwCuuHOB8s4Jcr+l9au1ddSoqYaQO1CJl8YHU/pg5LSm4PgAKtsf3hpeix
	T/Sx6zzuopZoCSEui9dRZ4rcnHiJLyujHXAtek6aVC7DvT93wtIIZlgGcYHjejWCGvt
	yqJ6KXB+DJqZfq0v7EVfVBnVwLbYZgCWKUhKzv+s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522009;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CZhGcYGXaR930egaLxJldVsyGgiGJgHeetRwiBDHQyI=;
	b=4jjHM6sGVrBXFEQxHy7P0zNRDoFuGbrG/qHlEodfxWafXGGDjzcsRPlR3Qki59e5
	GAGQNSLG+GgTduY4tHpItbvl+C9W/F/1h0+zkbtyQI8oqkSKqxHtcMAovwd4PVQ0aD4
	RQFkvvTt8r/5Xym7TVWZzQHnUzIbwG/Nq5Z98Hl4=
Content-Type: multipart/mixed; boundary="===============2543435547427112631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.73 FAILED
Message-ID: <0101018e430e8780-0bcc4c8a-111f-4e29-815a-6629c987f29c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197146

--===============2543435547427112631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.73* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.72-5.73.patch
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
From 8890dc2137219ff4ba5a898dc5a0600a74090de2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 05:05:47 +0000
Subject: [PATCH] bluez5: upgrade 5.72 -> 5.73

---
 .../bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch      | 3 +--
 ...ts-add-a-target-for-building-tests-without-runnin.patch | 7 +++----
 .../0004-src-shared-util.c-include-linux-limits.h.patch    | 5 ++---
 .../bluez5/{bluez5_5.72.bb => bluez5_5.73.bb}              | 2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.72.bb => bluez5_5.73.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index b1e93dbe19..9aa060c467 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
+From 6651b78a6eb52fd6217ba89715fd25790f584cc3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -21,7 +21,6 @@ no action.
 Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
 ---
  unit/test-gatt.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 881494a354..2c3eb9f8c9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,20 +1,19 @@
-From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
+From 9e61da068b98e407e8f330ce765df823c12e0988 Mon Sep 17 00:00:00 2001
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
+index dc9a96b..dac6908 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -710,6 +710,9 @@ endif
+@@ -707,6 +707,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index 516d859069..a02841d606 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
+From 31c4f101f6002ec298e2efd09349a4eb543bb95f Mon Sep 17 00:00:00 2001
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
+index 74d4367..9e01a80 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.73.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.72.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.73.bb
index 9fda960ea7..436f29b562 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.73.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
+SRC_URI[sha256sum] = "257e9075ce05c70d48c5defd254e78c418416f7584b45f9dddc884ff88e3fc53"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.42.0


--===============2543435547427112631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.72-5.73.patch"

RnJvbSA4ODkwZGMyMTM3MjE5ZmY0YmE1YTg5OGRjNWEwNjAwYTc0MDkwZGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDU6MDU6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bHVlejU6IHVwZ3JhZGUgNS43MiAtPiA1LjczCgotLS0KIC4uLi9ibHVlejUvYmx1ZXo1LzAwMDEt
dGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoICAgICAgfCAzICstLQogLi4udHMtYWRkLWEt
dGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaCB8IDcgKysrLS0t
LQogLi4uLzAwMDQtc3JjLXNoYXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5wYXRj
aCAgICB8IDUgKystLS0KIC4uLi9ibHVlejUve2JsdWV6NV81LjcyLmJiID0+IGJsdWV6NV81Ljcz
LmJifSAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVl
ejUve2JsdWV6NV81LjcyLmJiID0+IGJsdWV6NV81LjczLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3QtZ2F0dC1G
aXgtaHVuZy1pc3N1ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2Js
dWV6NS8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaAppbmRleCBiMWU5M2RiZTE5
Li45YWEwNjBjNDY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6
NS9ibHVlejUvMDAwMS10ZXN0LWdhdHQtRml4LWh1bmctaXNzdWUucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdC1nYXR0LUZpeC1odW5n
LWlzc3VlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYjU4M2E1N2Y5ZjRhYjk1NmEwOWU5
YmI5NmQ4OWFhMTM1NTNiZjIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NjUxYjc4
YTZlYjUyZmQ2MjE3YmE4OTcxNWZkMjU3OTBmNTg0Y2MzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogTWluZ2xpIFl1IDxNaW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwg
MjQgQXVnIDIwMTggMTI6MDQ6MDMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdC1nYXR0OiBG
aXggaHVuZyBpc3N1ZQpAQCAtMjEsNyArMjEsNiBAQCBubyBhY3Rpb24uCiBVcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtYmx1ZXRvb3RoJm09MTUz
NTA4ODgxODA0NjM1Jnc9Ml0KIAogU2lnbmVkLW9mZi1ieTogTWluZ2xpIFl1IDxNaW5nbGkuWXVA
d2luZHJpdmVyLmNvbT4KLQogLS0tCiAgdW5pdC90ZXN0LWdhdHQuYyB8IDIgKy0KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdl
dC1mb3ItYnVpbGRpbmctdGVzdHMtd2l0aG91dC1ydW5uaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0cy1hZGQtYS10YXJnZXQtZm9yLWJ1
aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoCmluZGV4IDg4MTQ5NGEzNTQuLjJjM2Vi
OWY4YzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6
NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdldC1mb3ItYnVpbGRpbmctdGVzdHMtd2l0aG91dC1ydW5u
aW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAw
MDEtdGVzdHMtYWRkLWEtdGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5w
YXRjaApAQCAtMSwyMCArMSwxOSBAQAotRnJvbSA3MzhlNzNiMzg2MzUyZmQ5MGYxZjI2Y2MxZWU3
NTQyN2NmNGRjMjNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZTYxZGEwNjhiOThl
NDA3ZThmMzMwY2U3NjVkZjgyM2MxMmUwOTg4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmks
IDEgQXByIDIwMTYgMTc6MDc6MzQgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBh
IHRhcmdldCBmb3IgYnVpbGRpbmcgdGVzdHMgd2l0aG91dCBydW5uaW5nIHRoZW0KIAogVXBzdHJl
YW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBNYWtlZmls
ZS5hbSB8IDMgKysrCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0t
Z2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5kZXggZTczOGViMy4uZGFiMTdkZCAx
MDA2NDQKK2luZGV4IGRjOWE5NmIuLmRhYzY5MDggMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQog
KysrIGIvTWFrZWZpbGUuYW0KLUBAIC03MTAsNiArNzEwLDkgQEAgZW5kaWYKK0BAIC03MDcsNiAr
NzA3LDkgQEAgZW5kaWYKICBURVNUUyA9ICQodW5pdF90ZXN0cykKICBBTV9URVNUU19FTlZJUk9O
TUVOVCA9IE1BTExPQ19DSEVDS189MyBNQUxMT0NfUEVSVFVSQl89NjkKICAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDA0LXNyYy1zaGFyZWQt
dXRpbC5jLWluY2x1ZGUtbGludXgtbGltaXRzLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwNC1zcmMtc2hhcmVkLXV0aWwuYy1pbmNsdWRlLWxpbnV4
LWxpbWl0cy5oLnBhdGNoCmluZGV4IDUxNmQ4NTkwNjkuLmEwMjg0MWQ2MDYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDA0LXNyYy1zaGFyZWQt
dXRpbC5jLWluY2x1ZGUtbGludXgtbGltaXRzLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDQtc3JjLXNoYXJlZC11dGlsLmMtaW5jbHVkZS1s
aW51eC1saW1pdHMuaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjUzZGY2MWI0MTA4OGI2
OGMxMjdhYzc2Y2M3MTY4M2FjMzQ1M2I5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MzFjNGYxMDFmNjAwMmVjMjk4ZTJlZmQwOTM0OWE0ZWI1NDNiYjk1ZiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBE
YXRlOiBNb24sIDEyIERlYyAyMDIyIDEzOjEwOjE5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNy
Yy9zaGFyZWQvdXRpbC5jOiBpbmNsdWRlIGxpbnV4L2xpbWl0cy5oCkBAIC04LDEzICs4LDEyIEBA
IHN5c3RlbXMgc3VjaCBhcyB0aG9zZSB1c2luZyBtdXNsLgogCiBVcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbdG8gbGludXgtYmx1ZXRvb3RoQHZnZXIua2VybmVsLm9yZyxsdWl6LnZvbi5kZW50
ekBpbnRlbC5jb20sZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbV0KIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0KIC0tLQogIHNyYy9zaGFy
ZWQvdXRpbC5jIHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYg
LS1naXQgYS9zcmMvc2hhcmVkL3V0aWwuYyBiL3NyYy9zaGFyZWQvdXRpbC5jCi1pbmRleCBjMGMy
YzRhLi4wMzZkYzBkIDEwMDY0NAoraW5kZXggNzRkNDM2Ny4uOWUwMWE4MCAxMDA2NDQKIC0tLSBh
L3NyYy9zaGFyZWQvdXRpbC5jCiArKysgYi9zcmMvc2hhcmVkL3V0aWwuYwogQEAgLTIzLDYgKzIz
LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6
NV81LjcyLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzMu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9ibHVlejUvYmx1ZXo1XzUuNzIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjczLmJiCmluZGV4IDlmZGE5NjBlYTcuLjQzNmYyOWI1NjIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81Ljcy
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjczLmJi
CkBAIC0xLDYgKzEsNiBAQAogcmVxdWlyZSBibHVlejUuaW5jCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI0OTlkN2ZhMzQ1YTk5NmMxYmI2NTBmNWM2NzQ5ZTFkOTI5MTExZmE2ZWNlMGJlMGU5ODY4
N2ZlZTYxMjQ1MzZlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1N2U5MDc1Y2UwNWM3MGQ0OGM1
ZGVmZDI1NGU3OGM0MTg0MTZmNzU4NGI0NWY5ZGRkYzg4NGZmODhlM2ZjNTMiCiAKIENWRV9TVEFU
VVNbQ1ZFLTIwMjAtMjQ0OTBdID0gImNwZS1pbmNvcnJlY3Q6IFRoaXMgaXNzdWUgaGFzIGtlcm5l
bCBmaXhlcyByYXRoZXIgdGhhbiBibHVleiBmaXhlcyIKIAotLSAKMi40Mi4wCgo=

--===============2543435547427112631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-19f27037b2b785673c8f68f19ea783856f732e4d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:19f27037b2b785673c8f68f19ea783856f732e4d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 385 Local 373 Mirrors 0 Missed 12 Current 603 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1962 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_recipe_qa)
NOTE: recipe bluez5-5.73-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.73-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2667 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_fetch)
NOTE: recipe bluez5-5.73-r0: task do_fetch: Started
NOTE: recipe bluez5-5.73-r0: task do_fetch: Succeeded
NOTE: Running task 2668 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_unpack)
NOTE: Running task 2669 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.73-r0: task do_unpack: Started
NOTE: recipe bluez5-5.73-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.73-r0: task do_unpack: Succeeded
NOTE: Running task 2670 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_patch)
NOTE: Running task 2671 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.73-r0: task do_patch: Started
NOTE: recipe bluez5-5.73-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.73-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.73-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.73-r0: task do_patch: Succeeded
NOTE: Running task 2672 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_deploy_source_date_epoch)
NOTE: Running task 2673 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_populate_lic)
NOTE: recipe bluez5-5.73-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.73-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.73-r0: task do_populate_lic: Succeeded
NOTE: recipe bluez5-5.73-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2674 of 2689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_configure)
NOTE: recipe bluez5-5.73-r0: task do_configure: Started
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
| libtoolize: and rerunning libtoolize and aclocal.
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:21: installing './compile'
| configure.ac:5: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: './install-sh' is updated
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../bluez-5.73/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot   --enable-test   --enable-datafiles   --enable-library   --enable-pie    --without-zsh-completion-dir  --disable-static  --enable-a2dp --enable-avrcp --disable-btpclient --disable-cups --enable-deprecated --disable-health --enable-hid --enable-hog --disable-manpages --disable-mesh --disable-midi --enable-network --disable-nfc 
 --enable-obex --enable-client --disable-sap --disable-sixaxis --enable-systemd --disable-testing --disable-threads --enable-tools --enable-udev
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
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
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot accepts -fsanitize=undefined... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot
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
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
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
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/run.do_configure.1190083:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/run.do_configure.1190083, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/run.do_configure.1190083, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/run.do_configure.1190083, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/run.do_configure.1190083, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/run.do_configure.1190083, line 289
NOTE: recipe bluez5-5.73-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2674 tasks of which 2665 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315050520.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315050520.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.73-r0 do_configure: configure failed
ERROR: bluez5-5.73-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/run.do_configure.1190083', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.73/temp/log.do_configure.1190083
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.73.bb:do_configure) failed with exit code '1'

--===============2543435547427112631==--


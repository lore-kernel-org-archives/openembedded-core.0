Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF9FC52D6F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.18604.1718475798848074768
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GAwg8bl3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1KSGUb7v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101901d23b621-10eb81c0-b5cd-4266-b6b6-24932436dc86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=9hn9v9o7RDLzE2xi1tJihU5zvNvRrgbY8P5QdQVU1b8=;
	b=GAwg8bl3L0R/NLDg++CcpDB+fjBeCbvUP+KVG5l+52QtDGt05YuRYWaXpb8UtOBD
	5AMCf2HQhj+kkkdV3goL38Bq8Cv7CD9seu4itJ+Y/675NJLe0VND4JCx3p3VgutV8Jv
	+K/JoOprJKZBO/tpNyjdT/Dr6AK6RsjjAtxFwrQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=9hn9v9o7RDLzE2xi1tJihU5zvNvRrgbY8P5QdQVU1b8=;
	b=1KSGUb7vQ1n+5zzjsqUoNmlX7uUkkBfHtUf0yazzCDFaCTz1STRkw90InkF6K/kD
	WvpnmLrIv4uJQS7OJa9pox38CTBrKwdlGhku5iyVB3gFu7mjb1rlmPiSfJwvLjfoCJz
	p6ndeqJA3n2ccBMh6GT9lSJOSDF50Ld/64w8E2SY=
Content-Type: multipart/mixed; boundary="===============9017095629453061530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 2.6.0 SUCCEEDED
Message-ID: <010101901d23b621-10eb81c0-b5cd-4266-b6b6-24932436dc86-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200675

--===============9017095629453061530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *2.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-2.4.1-2.6.0.patch
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
From fdfe668137dece19649856d3531b5c3359f12862 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 05:49:57 +0000
Subject: [PATCH] kea: upgrade 2.4.1 -> 2.6.0

---
 ...er_unittest_support.cc-do-not-write-.patch |  3 +--
 .../kea/files/fix-multilib-conflict.patch     |  7 +++---
 .../kea/files/fix_pid_keactrl.patch           |  7 +++---
 .../kea/{kea_2.4.1.bb => kea_2.6.0.bb}        | 23 +++++++++++++++++--
 4 files changed, 28 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.0.bb} (77%)

diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 94fbd12737..bc2b6b3a81 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 841924e1fe8db2bff3eab8d37634ef08f86c00ec Mon Sep 17 00:00:00 2001
+From 857605a8903cd700001b15431933cb0de18fdcbb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
@@ -8,7 +8,6 @@ This breaks reproducibility and is needed only in unit testing.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  src/lib/log/logger_unittest_support.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 5b135b3aee..fa89962999 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
+From b9010a7b4b80521dd40342e02505e82aeb6bdc98 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 22 Sep 2020 15:02:33 +0800
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
@@ -14,14 +14,13 @@ Because they are all commented out, replace the expanded libdir path with
 
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
  src/bin/keactrl/kea-dhcp4.conf.pre      | 4 ++--
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-index e6ae8b8..50a3092 100644
+index d8e0429..b2ec5b5 100644
 --- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
 +++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
 @@ -51,7 +51,8 @@
@@ -35,7 +34,7 @@ index e6ae8b8..50a3092 100644
  //          "param1": "foo"
  //      }
 diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 6edb8a1..b2a7385 100644
+index 55af9db..056f06f 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
 @@ -255,7 +255,7 @@
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 63a6a2805b..c0c1b998e0 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
+From db2d5e1f71dd00efce59d91e0d6cc1df78d41ea3 Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -7,16 +7,15 @@ Upstream-Status: Inappropriate [embedded specific]
 Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
 
 Signed-off-by: Armin kuster <akuster808@gmail.com>
-
 ---
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index 450e997..c353ca9 100644
+index cccfdac..20ae2e6 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -149,8 +149,8 @@ check_running() {
+@@ -146,8 +146,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.6.0.bb
similarity index 77%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.0.bb
index 19309ce314..da15b572ba 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.0.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2009-2023 Internet Systems Consortium, Inc. ("ISC")
+# +Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
+#  
+#  This Source Code Form is subject to the terms of the Mozilla Public
+#  License, v. 2.0. If a copy of the MPL was not distributed with this
+# 
+#
+
 SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
+LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +37,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
+SRC_URI[sha256sum] = "207ceae33eb3b81ec4e6ac5605249a85b93779333b62aadf39e489f11dbcdc8d"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.44.0


--===============9017095629453061530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-2.4.1-2.6.0.patch"

RnJvbSBmZGZlNjY4MTM3ZGVjZTE5NjQ5ODU2ZDM1MzFiNWMzMzU5ZjEyODYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDU6NDk6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
ZWE6IHVwZ3JhZGUgMi40LjEgLT4gMi42LjAKCi0tLQogLi4uZXJfdW5pdHRlc3Rfc3VwcG9ydC5j
Yy1kby1ub3Qtd3JpdGUtLnBhdGNoIHwgIDMgKy0tCiAuLi4va2VhL2ZpbGVzL2ZpeC1tdWx0aWxp
Yi1jb25mbGljdC5wYXRjaCAgICAgfCAgNyArKystLS0KIC4uLi9rZWEvZmlsZXMvZml4X3BpZF9r
ZWFjdHJsLnBhdGNoICAgICAgICAgICB8ICA3ICsrKy0tLQogLi4uL2tlYS97a2VhXzIuNC4xLmJi
ID0+IGtlYV8yLjYuMC5iYn0gICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKystLQogNCBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS97a2VhXzIuNC4xLmJiID0+IGtlYV8yLjYuMC5iYn0g
KDc3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8w
MDAxLXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5vdC13cml0ZS0u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLXNyYy1saWIt
bG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5vdC13cml0ZS0ucGF0Y2gKaW5kZXgg
OTRmYmQxMjczNy4uYmMyYjZiM2E4MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9rZWEvZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5j
Yy1kby1ub3Qtd3JpdGUtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2Vh
L2ZpbGVzLzAwMDEtc3JjLWxpYi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90
LXdyaXRlLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODQxOTI0ZTFmZThkYjJiZmYzZWFi
OGQzNzYzNGVmMDhmODZjMDBlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODU3NjA1
YTg5MDNjZDcwMDAwMWIxNTQzMTkzM2NiMGRlMThmZGNiYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0
ZTogVHVlLCAxMCBOb3YgMjAyMCAxNTo1NzowMyArMDAwMAogU3ViamVjdDogW1BBVENIXSBzcmMv
bGliL2xvZy9sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYzogZG8gbm90IHdyaXRlIGJ1aWxkCkBA
IC04LDcgKzgsNiBAQCBUaGlzIGJyZWFrcyByZXByb2R1Y2liaWxpdHkgYW5kIGlzIG5lZWRlZCBv
bmx5IGluIHVuaXQgdGVzdGluZy4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtv
ZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIHNyYy9saWIvbG9nL2xvZ2dlcl91bml0dGVzdF9z
dXBwb3J0LmNjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMv
Zml4LW11bHRpbGliLWNvbmZsaWN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9r
ZWEvZmlsZXMvZml4LW11bHRpbGliLWNvbmZsaWN0LnBhdGNoCmluZGV4IDViMTM1YjNhZWUuLmZh
ODk5NjI5OTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVz
L2ZpeC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2tlYS9maWxlcy9maXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDA2ZWJkMWIyY2VkNDI2YzQyMGVkMTYyOTgwZWNhMTk0ZjlmOTE4YWUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGI5MDEwYTdiNGI4MDUyMWRkNDAzNDJlMDI1MDVlODJhZWI2
YmRjOTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjIgU2VwIDIwMjAgMTU6MDI6MzMgKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gVGhlcmUgYXJlIGNvbmZsaWN0IG9mIGNvbmZpZyBmaWxlcyBiZXR3ZWVu
IGtlYSBhbmQgbGliMzIta2VhOgpAQCAtMTQsMTQgKzE0LDEzIEBAIEJlY2F1c2UgdGhleSBhcmUg
YWxsIGNvbW1lbnRlZCBvdXQsIHJlcGxhY2UgdGhlIGV4cGFuZGVkIGxpYmRpciBwYXRoIHdpdGgK
IAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0bGFiLmlzYy5vcmcvaXNj
LXByb2plY3RzL2tlYS8tL2lzc3Vlcy8yNjAyXQogU2lnbmVkLW9mZi1ieTogS2FpIEthbmcgPGth
aS5rYW5nQHdpbmRyaXZlci5jb20+Ci0KIC0tLQogIHNyYy9iaW4va2VhY3RybC9rZWEtY3RybC1h
Z2VudC5jb25mLnByZSB8IDMgKystCiAgc3JjL2Jpbi9rZWFjdHJsL2tlYS1kaGNwNC5jb25mLnBy
ZSAgICAgIHwgNCArKy0tCiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvYmluL2tlYWN0cmwva2VhLWN0cmwtYWdlbnQu
Y29uZi5wcmUgYi9zcmMvYmluL2tlYWN0cmwva2VhLWN0cmwtYWdlbnQuY29uZi5wcmUKLWluZGV4
IGU2YWU4YjguLjUwYTMwOTIgMTAwNjQ0CitpbmRleCBkOGUwNDI5Li5iMmVjNWI1IDEwMDY0NAog
LS0tIGEvc3JjL2Jpbi9rZWFjdHJsL2tlYS1jdHJsLWFnZW50LmNvbmYucHJlCiArKysgYi9zcmMv
YmluL2tlYWN0cmwva2VhLWN0cmwtYWdlbnQuY29uZi5wcmUKIEBAIC01MSw3ICs1MSw4IEBACkBA
IC0zNSw3ICszNCw3IEBAIGluZGV4IGU2YWU4YjguLjUwYTMwOTIgMTAwNjQ0CiAgLy8gICAgICAg
ICAgInBhcmFtMSI6ICJmb28iCiAgLy8gICAgICB9CiBkaWZmIC0tZ2l0IGEvc3JjL2Jpbi9rZWFj
dHJsL2tlYS1kaGNwNC5jb25mLnByZSBiL3NyYy9iaW4va2VhY3RybC9rZWEtZGhjcDQuY29uZi5w
cmUKLWluZGV4IDZlZGI4YTEuLmIyYTczODUgMTAwNjQ0CitpbmRleCA1NWFmOWRiLi4wNTZmMDZm
IDEwMDY0NAogLS0tIGEvc3JjL2Jpbi9rZWFjdHJsL2tlYS1kaGNwNC5jb25mLnByZQogKysrIGIv
c3JjL2Jpbi9rZWFjdHJsL2tlYS1kaGNwNC5jb25mLnByZQogQEAgLTI1NSw3ICsyNTUsNyBAQApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4X3BpZF9r
ZWFjdHJsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4X3Bp
ZF9rZWFjdHJsLnBhdGNoCmluZGV4IDYzYTZhMjgwNWIuLmMwYzFiOTk4ZTAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeF9waWRfa2VhY3RybC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXhfcGlkX2tlYWN0
cmwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM4NzhhMzU2NzEyNjA2NTQ5ZjdmMTg4YjYy
ZjdkMWNhZTA4YTE3NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRiMmQ1ZTFmNzFk
ZDAwZWZjZTU5ZDkxZTBkNmNjMWRmNzhkNDFlYTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBcm1pbiBrdXN0ZXIgPGFrdXN0ZXI4MDhAZ21haWwuY29tPgogRGF0ZTogV2VkLCAxNCBP
Y3QgMjAyMCAyMjo0ODozMSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBCdXN5Ym94IGRvZXMgbm90
IHN1cHBvcnQgcHMgLXAgc28gdXNlIHBncmVwCkBAIC03LDE2ICs3LDE1IEBAIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbZW1iZWRkZWQgc3BlY2lmaWNdCiBCYXNlZCBvbiBjaGFuZ2Vz
IGZyb20gRGllZ28gU3VlaXJvIDxEaWVnby5TdWVpcm9AYXJtLmNvbT4KIAogU2lnbmVkLW9mZi1i
eTogQXJtaW4ga3VzdGVyIDxha3VzdGVyODA4QGdtYWlsLmNvbT4KLQogLS0tCiAgc3JjL2Jpbi9r
ZWFjdHJsL2tlYWN0cmwuaW4gfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2Jpbi9rZWFjdHJsL2tlYWN0
cmwuaW4gYi9zcmMvYmluL2tlYWN0cmwva2VhY3RybC5pbgotaW5kZXggNDUwZTk5Ny4uYzM1M2Nh
OSAxMDA2NDQKK2luZGV4IGNjY2ZkYWMuLjIwYWUyZTYgMTAwNjQ0CiAtLS0gYS9zcmMvYmluL2tl
YWN0cmwva2VhY3RybC5pbgogKysrIGIvc3JjL2Jpbi9rZWFjdHJsL2tlYWN0cmwuaW4KLUBAIC0x
NDksOCArMTQ5LDggQEAgY2hlY2tfcnVubmluZygpIHsKK0BAIC0xNDYsOCArMTQ2LDggQEAgY2hl
Y2tfcnVubmluZygpIHsKICAgICAgIyBHZXQgdGhlIFBJRCBmcm9tIHRoZSBQSUQgZmlsZSAoaWYg
aXQgZXhpc3RzKQogICAgICBnZXRfcGlkX2Zyb21fZmlsZSAiJHtwcm9jX25hbWV9IgogICAgICBp
ZiBbICR7X3BpZH0gLWd0IDAgXTsgdGhlbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9rZWEva2VhXzIuNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEv
a2VhXzIuNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkva2VhL2tlYV8yLjQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9rZWEva2VhXzIuNi4wLmJiCmluZGV4IDE5MzA5Y2UzMTQuLmRhMTViNTcyYmEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8yLjQuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9rZWFfMi42LjAuYmIKQEAgLTEsOSAr
MSwyOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMg
QEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKEMpIDIwMDktMjAyMyBJbnRlcm5ldCBTeXN0
ZW1zIENvbnNvcnRpdW0sIEluYy4gKCJJU0MiKQorIyArQ29weXJpZ2h0IChDKSAyMDA5LTIwMjQg
SW50ZXJuZXQgU3lzdGVtcyBDb25zb3J0aXVtLCBJbmMuICgiSVNDIikKKyMgIAorIyAgVGhpcyBT
b3VyY2UgQ29kZSBGb3JtIGlzIHN1YmplY3QgdG8gdGhlIHRlcm1zIG9mIHRoZSBNb3ppbGxhIFB1
YmxpYworIyAgTGljZW5zZSwgdi4gMi4wLiBJZiBhIGNvcHkgb2YgdGhlIE1QTCB3YXMgbm90IGRp
c3RyaWJ1dGVkIHdpdGggdGhpcworIyAKKyMKKwogU1VNTUFSWSA9ICJJU0MgS2VhIERIQ1AgU2Vy
dmVyIgogREVTQ1JJUFRJT04gPSAiS2VhIGlzIHRoZSBuZXh0IGdlbmVyYXRpb24gb2YgREhDUCBz
b2Z0d2FyZSBkZXZlbG9wZWQgYnkgSVNDLiBJdCBzdXBwb3J0cyBib3RoIERIQ1B2NCBhbmQgREhD
UHY2IHByb3RvY29scyBhbG9uZyB3aXRoIHRoZWlyIGV4dGVuc2lvbnMsIGUuZy4gcHJlZml4IGRl
bGVnYXRpb24gYW5kIGR5bmFtaWMgdXBkYXRlcyB0byBETlMuIgogSE9NRVBBR0UgPSAiaHR0cDov
L2tlYS5pc2Mub3JnIgogU0VDVElPTiA9ICJjb25uZWN0aXZpdHkiCiBMSUNFTlNFID0gIk1QTC0y
LjAiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lYTA2MWZhMDE4ODgz
ODA3MmM0MjQ4YzEzMThlYzEzMSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTYxODA5M2VhOWRlOTJjNzBhMTE1MjY4YzFkNTM0MjFmIgogCiBERVBFTkRTID0gImJvb3N0
IGxvZzRjcGx1cyBvcGVuc3NsIgogCkBAIC0xOCw3ICszNyw3IEBAIFNSQ19VUkkgPSAiaHR0cDov
L2Z0cC5pc2Mub3JnL2lzYy9rZWEvJHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmls
ZTovL2ZpeF9waWRfa2VhY3RybC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXNyYy1s
aWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5vdC13cml0ZS0ucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODE1YzYxZjVjMjcxY2FhNGExZGIz
MWRkNjU2ZWI1MGE3ZjZlYTk3M2RhMzY5MGY3Yzg1ODE0MDhlMTgwMTMxYSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIyMDdjZWFlMzNlYjNiODFlYzRlNmFjNTYwNTI0OWE4NWI5Mzc3OTMzM2I2MmFh
ZGYzOWU0ODlmMTFkYmNkYzhkIgogCiBpbmhlcml0IGF1dG90b29scyBzeXN0ZW1kIHVwZGF0ZS1y
Yy5kIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbgogCi0tIAoyLjQ0LjAKCg==

--===============9017095629453061530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/dns/rrcollator.h /usr/include/kea/dns/rrset_collection_base.h /usr/include/kea/util/strutil.h /usr/include/kea/util/filename.h /usr/include/kea/util/encode/base64.h /usr/include/kea/util/encode/base32hex_from_binary.h /usr/include/kea/util/encode/base32hex.h /usr/include/kea/dns/nsec3hash.h /usr/include/kea/util/io_utilities.h /usr/include/kea/dns/rdatafields.h /usr/include/kea/util/encode/binary_from_base32hex.h /usr/include/kea/dns/rrset_collection.h /usr/include/kea/util/io/fd_share.h /usr/include/kea/dns/masterload.h /usr/include/kea/util/encode/hex.h /usr/include/kea/dns/zone_checker.h /usr/include/kea/util/file_utilities.h /usr/include/kea/util/encode/base16_from_binary.h /usr/include/kea/dns/qid_gen.h /usr/include/kea/dns/rdata_pimpl_holder.h /usr/include/kea/util/time_utilities.h /usr/include/kea/dns/dns_fwd.h /usr/include/kea/util/encode/binary_from_base16.h", added "/usr/include/kea/util/io.h /usr
 /include/kea/dhcp/option_classless_static_route.h /usr/include/kea/asiolink/io_service_mgr.h /usr/include/kea/dns/txt_like.h /usr/include/kea/util/str.h /usr/include/kea/dns/time_utils.h /usr/include/kea/config/cmd_response_creator_factory.h /usr/include/kea/dns/char_string.h /usr/include/kea/config/cmd_response_creator.h /usr/include/kea/d2srv/nc_trans.h /usr/include/kea/util/encode/encode.h /usr/include/kea/util/filesystem.h /usr/include/kea/d2srv/d2_update_message.h /usr/include/kea/d2srv/dns_client.h /usr/include/kea/config/cmd_http_listener.h /usr/include/kea/dhcp/option4_dnr.h /usr/include/kea/util/chrono_time_utils.h /usr/include/kea/dhcp/option6_dnr.h /usr/include/kea/d2srv/d2_stats.h /usr/include/kea/d2srv/d2_zone.h /usr/include/kea/d2srv/d2_tsig_key.h"
packages/core2-64-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea6/dnr.json /usr/share/doc/kea/examples/kea4/dnr.json", added "/usr/share/doc/kea/SECURITY.md"
packages/core2-64-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-cc.so.54 /usr/lib/libkea-cc.so.54.0.0 /usr/lib/libkea-asiodns.so.35 /usr/lib/libkea-dhcpsrv.so.90 /usr/lib/libkea-dns++.so.42.0.0 /usr/lib/libkea-log.so.48 /usr/lib/libkea-dhcp++.so.74 /usr/lib/libkea-http.so.56 /usr/lib/libkea-eval.so.52.0.0 /usr/lib/libkea-d2srv.so.30 /usr/lib/libkea-cfgclient.so.51 /usr/lib/libkea-database.so.48 /usr/lib/libkea-util.so.68 /usr/lib/libkea-asiolink.so.56.0.0 /usr/lib/libkea-dhcpsrv.so.90.0.0 /usr/lib/libkea-exceptions.so.23 /usr/lib/libkea-hooks.so.78.0.0 /usr/lib/libkea-process.so.57 /usr/lib/libkea-database.so.48.0.0 /usr/lib/libkea-cryptolink.so.38.0.0 /usr/lib/libkea-tcp.so.5 /usr/lib/libkea-log.so.48.0.0 /usr/share/kea/api/libreload.json /usr/lib/libkea-stats.so.29 /usr/lib/libkea-asiodns.so.35.0.0 /usr/lib/libkea-http.so.56.0.0 /usr/lib/libkea-dhcp_ddns.so.41.0.0 /usr/lib/libkea-d2srv.so.30.0.0 /usr/lib/libkea-tcp.so.5.0.0 /usr/lib/libkea-exceptions.so.23.0.0 /usr/lib/lib
 kea-asiolink.so.56 /usr/lib/libkea-dns++.so.42 /usr/lib/libkea-cryptolink.so.38 /usr/lib/libkea-process.so.57.0.0 /usr/lib/libkea-dhcp_ddns.so.41 /usr/lib/libkea-util.so.68.0.0 /usr/lib/libkea-dhcp++.so.74.0.0 /usr/lib/libkea-eval.so.52 /usr/lib/libkea-hooks.so.78 /usr/lib/libkea-cfgclient.so.51.0.0 /usr/lib/libkea-stats.so.29.0.0", added "/usr/lib/libkea-cc.so.68.0.0 /usr/lib/libkea-eval.so.69.0.0 /usr/lib/libkea-util.so.84 /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh /usr/lib/libkea-http.so.71 /usr/lib/libkea-d2srv.so.46.0.0 /usr/lib/libkea-log.so.61 /usr/lib/libkea-dns++.so.56 /usr/lib/libkea-stats.so.41.0.0 /usr/lib/kea/hooks/libdhcp_perfmon.so /usr/lib/libkea-asiolink.so.71.0.0 /usr/lib/libkea-database.so.61 /usr/lib/libkea-process.so.72 /usr/lib/libkea-cc.so.68 /usr/lib/libkea-dhcp_ddns.so.56 /usr/lib/libkea-eval.so.69 /usr/lib/libkea-dhcp++.so.89.0.0 /usr/lib/libkea-database.so.61.0.0 /usr/share/kea/scripts/pgsql/upgrad
 e_018_to_019.sh /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh /usr/lib/libkea-tcp.so.18 /usr/lib/libkea-http.so.71.0.0 /usr/lib/libkea-cryptolink.so.50.0.0 /usr/lib/libkea-tcp.so.18.0.0 /usr/lib/libkea-asiodns.so.48.0.0 /usr/lib/libkea-asiodns.so.48 /usr/lib/libkea-util.so.84.0.0 /usr/lib/libkea-dhcp_ddns.so.56.0.0 /usr/lib/libkea-dns++.so.56.0.0 /usr/lib/libkea-stats.so.41 /usr/lib/libkea-dhcp++.so.89 /usr/lib/libkea-exceptions.so.33.0.0 /usr/lib/libkea-hooks.so.97 /usr/lib/libkea-cfgclient.so.65 /usr/lib/libkea-asiolink.so.71 /usr/lib/libkea-d2srv.so.46 /usr/lib/libkea-exceptions.so.33 /usr/lib/libkea-cryptolink.so.50 /usr/lib/libkea-process.so.72.0.0 /usr/lib/libkea-log.so.61.0.0 /usr/lib/libkea-dhcpsrv.so.108.0.0 /usr/lib/libkea-hooks.so.97.0.0 /usr/share/kea/api/extended-info6-upgrade.json /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh /usr/lib/libkea-cfgclient.so.65.0
 .0 /usr/lib/libkea-dhcpsrv.so.108"
Changes to packages/core2-64-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.35.0.0 to libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.56.0.0 to libkea-asiolink.so.71.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.54.0.0 to libkea-cc.so.68.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.51.0.0 to libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.38.0.0 to libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.30.0.0 to libkea-d2srv.so.46.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.48.0.0 to libkea-database.so.61.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.41.0.0 to libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.74.0.0 to libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.90.0.0 to libkea-dhcpsrv.so.108.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.42.0.0 to libkea-dns++.so.56.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.52.0.0 to libkea-eval.so.69.0.0
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.23.0.0 to libkea-exceptions.so.33.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.78.0.0 to libkea-hooks.so.97.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.56.0.0 to libkea-http.so.71.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.48.0.0 to libkea-log.so.61.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.57.0.0 to libkea-process.so.72.0.0
  /usr/lib/libkea-stats.so changed symlink target from libkea-stats.so.29.0.0 to libkea-stats.so.41.0.0
  /usr/lib/libkea-tcp.so changed symlink target from libkea-tcp.so.5.0.0 to libkea-tcp.so.18.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.68.0.0 to libkea-util.so.84.0.0
  /usr/lib/libkea-asiodns.so.35.0.0 moved to /usr/lib/libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiodns.so.35 moved to /usr/lib/libkea-asiodns.so.48
  /usr/lib/libkea-asiolink.so.56.0.0 moved to /usr/lib/libkea-asiolink.so.71.0.0
  /usr/lib/libkea-asiolink.so.56 moved to /usr/lib/libkea-asiolink.so.71
  /usr/lib/libkea-cc.so.54.0.0 moved to /usr/lib/libkea-cc.so.68.0.0
  /usr/lib/libkea-cc.so.54 moved to /usr/lib/libkea-cc.so.68
  /usr/lib/libkea-cfgclient.so.51.0.0 moved to /usr/lib/libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cfgclient.so.51 moved to /usr/lib/libkea-cfgclient.so.65
  /usr/lib/libkea-cryptolink.so.38.0.0 moved to /usr/lib/libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-cryptolink.so.38 moved to /usr/lib/libkea-cryptolink.so.50
  /usr/lib/libkea-d2srv.so.30.0.0 moved to /usr/lib/libkea-d2srv.so.46.0.0
  /usr/lib/libkea-d2srv.so.30 moved to /usr/lib/libkea-d2srv.so.46
  /usr/lib/libkea-database.so.48.0.0 moved to /usr/lib/libkea-database.so.61.0.0
  /usr/lib/libkea-database.so.48 moved to /usr/lib/libkea-database.so.61
  /usr/lib/libkea-dhcp_ddns.so.41.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp_ddns.so.41 moved to /usr/lib/libkea-dhcp_ddns.so.56
  /usr/lib/libkea-dhcp++.so.74.0.0 moved to /usr/lib/libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcp++.so.74 moved to /usr/lib/libkea-dhcp++.so.89
  /usr/lib/libkea-dns++.so.42.0.0 moved to /usr/lib/libkea-dns++.so.56.0.0
  /usr/lib/libkea-dns++.so.42 moved to /usr/lib/libkea-dns++.so.56
  /usr/lib/libkea-eval.so.52.0.0 moved to /usr/lib/libkea-eval.so.69.0.0
  /usr/lib/libkea-eval.so.52 moved to /usr/lib/libkea-eval.so.69
  /usr/lib/libkea-exceptions.so.23.0.0 moved to /usr/lib/libkea-exceptions.so.33.0.0
  /usr/lib/libkea-exceptions.so.23 moved to /usr/lib/libkea-exceptions.so.33
  /usr/lib/libkea-hooks.so.78.0.0 moved to /usr/lib/libkea-hooks.so.97.0.0
  /usr/lib/libkea-hooks.so.78 moved to /usr/lib/libkea-hooks.so.97
  /usr/lib/libkea-http.so.56.0.0 moved to /usr/lib/libkea-http.so.71.0.0
  /usr/lib/libkea-http.so.56 moved to /usr/lib/libkea-http.so.71
  /usr/lib/libkea-log.so.48.0.0 moved to /usr/lib/libkea-log.so.61.0.0
  /usr/lib/libkea-log.so.48 moved to /usr/lib/libkea-log.so.61
  /usr/lib/libkea-process.so.57.0.0 moved to /usr/lib/libkea-process.so.72.0.0
  /usr/lib/libkea-process.so.57 moved to /usr/lib/libkea-process.so.72
  /usr/lib/libkea-stats.so.29.0.0 moved to /usr/lib/libkea-stats.so.41.0.0
  /usr/lib/libkea-stats.so.29 moved to /usr/lib/libkea-stats.so.41
  /usr/lib/libkea-util.so.68.0.0 moved to /usr/lib/libkea-util.so.84.0.0
  /usr/lib/libkea-util.so.68 moved to /usr/lib/libkea-util.so.84
  /usr/include/kea/asiolink/io_service_mgr.h was added
  /usr/include/kea/config/cmd_http_listener.h was added
  /usr/include/kea/config/cmd_response_creator_factory.h was added
  /usr/include/kea/config/cmd_response_creator.h was added
  /usr/include/kea/d2srv/d2_stats.h was added
  /usr/include/kea/d2srv/d2_tsig_key.h was added
  /usr/include/kea/d2srv/d2_update_message.h was added
  /usr/include/kea/d2srv/d2_zone.h was added
  /usr/include/kea/d2srv/dns_client.h was added
  /usr/include/kea/d2srv/nc_trans.h was added
  /usr/include/kea/dhcp/option4_dnr.h was added
  /usr/include/kea/dhcp/option6_dnr.h was added
  /usr/include/kea/dhcp/option_classless_static_route.h was added
  /usr/include/kea/dns/char_string.h was added
  /usr/include/kea/dns/time_utils.h was added
  /usr/include/kea/dns/txt_like.h was added
  /usr/include/kea/util/chrono_time_utils.h was added
  /usr/include/kea/util/encode/encode.h was added
  /usr/include/kea/util/filesystem.h was added
  /usr/include/kea/util/io.h was added
  /usr/include/kea/util/str.h was added
  /usr/lib/kea/hooks/libdhcp_perfmon.so was added
  /usr/lib/libkea-dhcpsrv.so.108.0.0 was added
  /usr/lib/libkea-dhcpsrv.so.108 was added
  /usr/lib/libkea-tcp.so.18.0.0 was added
  /usr/lib/libkea-tcp.so.18 was added
  /usr/share/kea/api/extended-info6-upgrade.json was added
  /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_018_to_019.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh was added
  /usr/include/kea/dns/dns_fwd.h was removed
  /usr/include/kea/dns/masterload.h was removed
  /usr/include/kea/dns/nsec3hash.h was removed
  /usr/include/kea/dns/qid_gen.h was removed
  /usr/include/kea/dns/rdatafields.h was removed
  /usr/include/kea/dns/rdata_pimpl_holder.h was removed
  /usr/include/kea/dns/rrcollator.h was removed
  /usr/include/kea/dns/rrset_collection_base.h was removed
  /usr/include/kea/dns/rrset_collection.h was removed
  /usr/include/kea/dns/zone_checker.h was removed
  /usr/include/kea/util/encode/base16_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex.h was removed
  /usr/include/kea/util/encode/base64.h was removed
  /usr/include/kea/util/encode/binary_from_base16.h was removed
  /usr/include/kea/util/encode/binary_from_base32hex.h was removed
  /usr/include/kea/util/encode/hex.h was removed
  /usr/include/kea/util/filename.h was removed
  /usr/include/kea/util/file_utilities.h was removed
  /usr/include/kea/util/io/fd_share.h was removed
  /usr/include/kea/util/io_utilities.h was removed
  /usr/include/kea/util/strutil.h was removed
  /usr/include/kea/util/time_utilities.h was removed
  /usr/lib/libkea-dhcpsrv.so.90.0.0 was removed
  /usr/lib/libkea-dhcpsrv.so.90 was removed
  /usr/lib/libkea-tcp.so.5.0.0 was removed
  /usr/lib/libkea-tcp.so.5 was removed
  /usr/share/kea/api/libreload.json was removed

--===============9017095629453061530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kea/kea-dbg: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-dhcpsrv.so.90.0.0 /usr/lib/.debug/libkea-cryptolink.so.38.0.0 /usr/lib/.debug/libkea-dhcp++.so.74.0.0 /usr/lib/.debug/libkea-log.so.48.0.0 /usr/lib/.debug/libkea-hooks.so.78.0.0 /usr/lib/.debug/libkea-cfgclient.so.51.0.0 /usr/lib/.debug/libkea-database.so.48.0.0 /usr/lib/.debug/libkea-util.so.68.0.0 /usr/lib/.debug/libkea-eval.so.52.0.0 /usr/lib/.debug/libkea-dhcp_ddns.so.41.0.0 /usr/lib/.debug/libkea-asiolink.so.56.0.0 /usr/lib/.debug/libkea-asiodns.so.35.0.0 /usr/lib/.debug/libkea-http.so.56.0.0 /usr/lib/.debug/libkea-process.so.57.0.0 /usr/lib/.debug/libkea-cc.so.54.0.0 /usr/lib/.debug/libkea-d2srv.so.30.0.0 /usr/lib/.debug/libkea-tcp.so.5.0.0 /usr/lib/.debug/libkea-stats.so.29.0.0 /usr/lib/.debug/libkea-dns++.so.42.0.0 /usr/lib/.debug/libkea-exceptions.so.23.0.0", added "/usr/lib/.debug/libkea-process.so.72.0.0 /usr/lib/.debug/libkea-asiodns.so.48.0.0 /usr/lib/.debug/libkea-dns++.so.56.0.0 /usr/li
 b/.debug/libkea-cryptolink.so.50.0.0 /usr/lib/.debug/libkea-http.so.71.0.0 /usr/lib/.debug/libkea-log.so.61.0.0 /usr/lib/.debug/libkea-cfgclient.so.65.0.0 /usr/lib/kea/hooks/.debug/libdhcp_perfmon.so /usr/lib/.debug/libkea-database.so.61.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.108.0.0 /usr/lib/.debug/libkea-util.so.84.0.0 /usr/lib/.debug/libkea-dhcp++.so.89.0.0 /usr/lib/.debug/libkea-stats.so.41.0.0 /usr/lib/.debug/libkea-dhcp_ddns.so.56.0.0 /usr/lib/.debug/libkea-asiolink.so.71.0.0 /usr/lib/.debug/libkea-tcp.so.18.0.0 /usr/lib/.debug/libkea-d2srv.so.46.0.0 /usr/lib/.debug/libkea-cc.so.68.0.0 /usr/lib/.debug/libkea-eval.so.69.0.0 /usr/lib/.debug/libkea-exceptions.so.33.0.0 /usr/lib/.debug/libkea-hooks.so.97.0.0"
packages/core2-64-poky-linux/kea/kea-dbg: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-dbg: PKGSIZE changed from 331380496 to 351667448 (+6%)
packages/core2-64-poky-linux/kea/kea-dev: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/dns/nsec3hash.h /usr/include/kea/dns/rdata_pimpl_holder.h /usr/include/kea/util/encode/base32hex.h /usr/include/kea/dns/rrset_collection.h /usr/include/kea/util/encode/binary_from_base16.h /usr/include/kea/dns/rdatafields.h /usr/include/kea/util/strutil.h /usr/include/kea/util/io/fd_share.h /usr/include/kea/dns/zone_checker.h /usr/include/kea/util/file_utilities.h /usr/include/kea/util/encode/hex.h /usr/include/kea/dns/masterload.h /usr/include/kea/util/io_utilities.h /usr/include/kea/util/time_utilities.h /usr/include/kea/dns/qid_gen.h /usr/include/kea/util/encode/binary_from_base32hex.h /usr/include/kea/dns/dns_fwd.h /usr/include/kea/util/filename.h /usr/include/kea/dns/rrset_collection_base.h /usr/include/kea/dns/rrcollator.h /usr/include/kea/util/encode/base16_from_binary.h /usr/include/kea/util/encode/base32hex_from_binary.h /usr/include/kea/util/encode/base64.h", added "/usr/include/kea/dns/char_strin
 g.h /usr/include/kea/dns/time_utils.h /usr/include/kea/config/cmd_response_creator_factory.h /usr/include/kea/util/encode/encode.h /usr/include/kea/d2srv/nc_trans.h /usr/include/kea/config/cmd_response_creator.h /usr/include/kea/d2srv/d2_zone.h /usr/include/kea/util/io.h /usr/include/kea/util/filesystem.h /usr/include/kea/util/str.h /usr/include/kea/util/chrono_time_utils.h /usr/include/kea/dhcp/option4_dnr.h /usr/include/kea/dhcp/option6_dnr.h /usr/include/kea/d2srv/dns_client.h /usr/include/kea/d2srv/d2_stats.h /usr/include/kea/d2srv/d2_tsig_key.h /usr/include/kea/d2srv/d2_update_message.h /usr/include/kea/dns/txt_like.h /usr/include/kea/asiolink/io_service_mgr.h /usr/include/kea/config/cmd_http_listener.h /usr/include/kea/dhcp/option_classless_static_route.h"
packages/core2-64-poky-linux/kea/kea-dev: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-dev: PKGSIZE changed from 3983538 to 3976558 (-0%)
packages/core2-64-poky-linux/kea/kea-doc: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea4/dnr.json /usr/share/doc/kea/examples/kea6/dnr.json", added "/usr/share/doc/kea/SECURITY.md"
packages/core2-64-poky-linux/kea/kea-doc: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-doc: PKGSIZE changed from 1322472 to 1343103 (+2%)
packages/core2-64-poky-linux/kea/kea-locale: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-locale: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-src: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-src: FILELIST: directory renamed /usr/src/debug/kea/2.4.1/src/lib/process -> /usr/src/debug/kea/2.6.0/src/lib/process, directory renamed /usr/src/debug/kea/2.4.1/src/bin/lfc -> /usr/src/debug/kea/2.6.0/src/bin/lfc, directory renamed /usr/src/debug/kea/2.4.1/src/lib/process/cfgrpt -> /usr/src/debug/kea/2.6.0/src/lib/process/cfgrpt, directory renamed /usr/src/debug/kea/2.4.1/src/lib/eval -> /usr/src/debug/kea/2.6.0/src/lib/eval, directory renamed /usr/src/debug/kea/2.4.1/src/lib/log/interprocess -> /usr/src/debug/kea/2.6.0/src/lib/log/interprocess, directory renamed /usr/src/debug/kea/2.4.1/src/lib/cc -> /usr/src/debug/kea/2.6.0/src/lib/cc, directory renamed /usr/src/debug/kea/2.4.1/src/bin/agent -> /usr/src/debug/kea/2.6.0/src/bin/agent, directory renamed /usr/src/debug/kea/2.4.1/src/hooks/dhcp/stat_cmds -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/stat_cmds, directory renamed /usr/src/debug/kea/2.4.1/src/lib/asiodns -> /usr/src/debug/kea/2.6.0/src/l
 ib/asiodns, directory renamed /usr/src/debug/kea/2.4.1/src/lib/hooks -> /usr/src/debug/kea/2.6.0/src/lib/hooks, directory renamed /usr/src/debug/kea/2.4.1/src/bin/dhcp4 -> /usr/src/debug/kea/2.6.0/src/bin/dhcp4, directory renamed /usr/src/debug/kea/2.4.1/src/hooks/dhcp/lease_cmds -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/lease_cmds, directory renamed /usr/src/debug/kea/2.4.1/src/bin/dhcp6 -> /usr/src/debug/kea/2.6.0/src/bin/dhcp6, directory renamed /usr/src/debug/kea/2.4.1/src/lib/dhcp_ddns -> /usr/src/debug/kea/2.6.0/src/lib/dhcp_ddns, directory renamed /usr/src/debug/kea/2.4.1/src/lib/cryptolink -> /usr/src/debug/kea/2.6.0/src/lib/cryptolink, directory renamed /usr/src/debug/kea/2.4.1/src/lib/d2srv -> /usr/src/debug/kea/2.6.0/src/lib/d2srv, directory renamed /usr/src/debug/kea/2.4.1/src/lib/exceptions -> /usr/src/debug/kea/2.6.0/src/lib/exceptions, directory renamed /usr/src/debug/kea/2.4.1/src/lib/tcp -> /usr/src/debug/kea/2.6.0/src/lib/tcp, directory renamed /usr/src/debug/kea/
 2.4.1/src/hooks/dhcp/run_script -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/run_script, directory renamed /usr/src/debug/kea/2.4.1/src/lib/database -> /usr/src/debug/kea/2.6.0/src/lib/database, directory renamed /usr/src/debug/kea/2.4.1/src/lib/http -> /usr/src/debug/kea/2.6.0/src/lib/http, directory renamed /usr/src/debug/kea/2.4.1/src/lib/log -> /usr/src/debug/kea/2.6.0/src/lib/log, directory renamed /usr/src/debug/kea/2.4.1/src/lib/config -> /usr/src/debug/kea/2.6.0/src/lib/config, directory renamed /usr/src/debug/kea/2.4.1/src/lib/dhcpsrv/parsers -> /usr/src/debug/kea/2.6.0/src/lib/dhcpsrv/parsers, directory renamed /usr/src/debug/kea/2.4.1/src/lib/config_backend -> /usr/src/debug/kea/2.6.0/src/lib/config_backend, directory renamed /usr/src/debug/kea/2.4.1/src/hooks/dhcp/flex_option -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/flex_option, directory renamed /usr/src/debug/kea/2.4.1/src/lib/dhcpsrv -> /usr/src/debug/kea/2.6.0/src/lib/dhcpsrv, directory renamed /usr/src/debug/kea/2.4
 .1/src/hooks/dhcp/bootp -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/bootp, directory renamed /usr/src/debug/kea/2.4.1/src/lib/stats -> /usr/src/debug/kea/2.6.0/src/lib/stats, removed "/usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/version.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor_class.cc /usr/src/debug/kea/2.4.1/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.4.1/src/lib/util/csv_file.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_process.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_ia.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_callouts.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_int.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdatafields.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/addr_utilities.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/protocol_util.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_update_mgr.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/tcp_acceptor.h /usr/src/debug/kea/2.4.1/s
 rc/lib/asiolink/tls_acceptor.h /usr/src/debug/kea/2.4.1/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/base16_from_binary.h /usr/src/debug/kea/2.4.1/src/lib/util/labeled_value.h /usr/src/debug/kea/2.4.1/src/lib/util/dhcp_space.cc /usr/src/debug/kea/2.4.1/src/lib/util/dhcp_space.h /usr/src/debug/kea/2.4.1/src/lib/util/pid_file.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_service_states.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor_class.h /usr/src/debug/kea/2.4.1/src/lib/util/versioned_csv_file.cc /usr/src/debug/kea/2.4.1/src/lib/util/staged_value.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_lpf.cc /usr/src/debug/kea/2.4.1/src/lib/dns/serial.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_queue_mgr.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/command_creator.cc /usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer_inputsource.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_service.cc /usr/src/debug/
 kea/2.4.1/src/lib/dhcp/option_int_array.h /usr/src/debug/kea/2.4.1/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/opaque_data_tuple.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_log.cc /usr/src/debug/kea/2.4.1/src/lib/dns/name.cc /usr/src/debug/kea/2.4.1/src/lib/util/thread_pool.h /usr/src/debug/kea/2.4.1/src/lib/util/buffer.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdataclass.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_lexer.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/lease_update_backlog.cc /usr/src/debug/kea/2.4.1/src/lib/dns/tsigerror.cc /usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer_inputsource.h /usr/src/debug/kea/2.4.1/src/lib/util/memory_segment.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigkey.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/iface_mgr_linux.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_server_type.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/hwaddr.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid_factory.
 cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/util/filename.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/common_tls.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr4.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr6.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_ring.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_controller.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter6.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_string.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrparamregistry.cc /usr/src/debug/kea/2.4.1/src/bin/d2/parser_context.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/std_option_defs.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_opaque_data_tuples.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata_pimpl_holder.h /usr/src/debug/k
 ea/2.4.1/src/hooks/dhcp/high_availability/command_creator.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/base32hex.h /usr/src/debug/kea/2.4.1/src/lib/dns/nsec3hash.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrset_collection_base.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/docsis3_option_defs.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/process_spawn.cc /usr/src/debug/kea/2.4.1/src/lib/dns/name_internal.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/openssl_tls.cc /usr/src/debug/kea/2.4.1/src/lib/util/strutil.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_custom.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_socket.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/classify.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/iface_mgr.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_inet6.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrparamregistry.h /usr/src/debug/kea/2.4.1/src/lib/util/io/fd_share.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec3param_comm
 on.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/communication_state.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_opaque_data_tuples.cc /usr/src/debug/kea/2.4.1/src/lib/util/reconnect_ctl.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_auth.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrtype.cc /usr/src/debug/kea/2.4.1/src/bin/d2/simple_add.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/classify.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid_factory.h /usr/src/debug/kea/2.4.1/src/lib/util/range_utilities.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigerror.h /usr/src/debug/kea/2.4.1/src/lib/dns/masterload.cc /usr/src/debug/kea/2.4.1/src/bin/d2/parser_context.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/openssl_tls.h /usr/src/debug/kea/2.4.1/src/bin/d2/main.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt6.h /usr/src/debug/kea/2.4.1/src/lib/util/labeled_value.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_auth.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrset.cc /usr/src/debug/kea/2.4.1/sr
 c/lib/dhcp/pkt_filter_inet6.cc /usr/src/debug/kea/2.4.1/src/lib/dns/opcode.h /usr/src/debug/kea/2.4.1/src/lib/dns/question.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaaddr.h /usr/src/debug/kea/2.4.1/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.4.1/src/lib/util/pointer_util.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/dhcp6.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_data_types.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/dhcp4.h /usr/src/debug/kea/2.4.1/src/lib/util/io/socketsession.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrclass.h /usr/src/debug/kea/2.4.1/src/lib/util/watch_socket.h /usr/src/debug/kea/2.4.1/src/lib/dns/serial.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_definition.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrset_collection.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt6.cc /usr/src/debug/kea/2.4.1/src/lib/dns/edns.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_space.cc /usr/src/debug/kea/2.4.1/src/bin/d2/simple_remove.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4o
 6.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_endpoint.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/ds_like.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_impl.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec_bitmap.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/interval_timer.h /usr/src/debug/kea/2.4.1/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_addrlst.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_addrlst.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_pdexclude.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_messages.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rcode.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr4.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr6.cc /usr/src/debug/kea/2.4.1/src/lib/util/encod
 e/binary_from_base16.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec_bitmap.cc /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrtype.h /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/binary_from_base32hex.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_string.cc /usr/src/debug/kea/2.4.1/src/lib/util/watched_thread.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/opaque_data_tuple.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_status_code.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_address.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/char_string.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_pdexclude.cc /usr/src/debug/kea/2.4.1/src/lib/util/encode/utf8.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_status_code.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader.cc /us
 r/src/debug/kea/2.4.1/src/lib/dns/qid_gen.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_ia.cc /usr/src/debug/kea/2.4.1/src/lib/dns/dns_fwd.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdatafields.cc /usr/src/debug/kea/2.4.1/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_custom.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/udp_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/tcp_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/dns/message.h /usr/src/debug/kea/2.4.1/src/bin/d2/simple_add.h /usr/src/debug/kea/2.4.1/src/lib/dns/nsec3hash.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_dnr.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_dnr.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_signal.cc /usr/src/debug/kea/2.4.1/src/lib/util/strutil.h /usr/src/debug/kea/2.4.1/src/bin/d2/nc_remove.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/common_tls.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket_acceptor.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp
 /high_availability/ha_service_states.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/tcp_socket.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/tls_socket.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/udp_socket.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrclass.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_address.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config_parser.h /usr/src/debug/kea/2.4.1/src/lib/util/filename.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_definition.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrcollator.cc /usr/src/debug/kea/2.4.1/src/lib/util/csv_file.cc /usr/src/debug/kea/2.4.1/src/lib/util/triplet.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaaddr.cc /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader_callbacks.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/char_string.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_signal.h /usr/sr
 c/debug/kea/2.4.1/src/bin/d2/nc_add.h /usr/src/debug/kea/2.4.1/src/lib/util/state_model.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_controller.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec3param_common.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_asio_socket.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/lease_update_backlog.h /usr/src/debug/kea/2.4.1/src/lib/dns/masterload.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/lexer_util.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/utf8.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/protocol_util.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/query_filter.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/iface_mgr.cc /usr/src/debug/kea/2.4.1/src/lib/dns/tsigkey.h /usr/src/debug/kea/2.4.1/src/lib/util/io/socketsession.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_parser.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata.cc /usr/src/debug/kea/
 2.4.1/src/lib/asiolink/io_error.h /usr/src/debug/kea/2.4.1/src/lib/dns/labelsequence.h /usr/src/debug/kea/2.4.1/src/lib/util/state_model.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_dnr.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/hwaddr.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_dnr.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/libdhcp++.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/addr_utilities.cc /usr/src/debug/kea/2.4.1/src/bin/d2/simple_remove.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config.h /usr/src/debug/kea/2.4.1/src/lib/dns/messagerenderer.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config_parser.cc /usr/src/debug/kea/2.4.1/src/lib/util/bigints.h /usr/src/debug/kea/2.4.1/src/lib/dns/exceptions.h /usr/src/debug/kea/2.4.1/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_queue_mgr.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_update_mgr.h /usr/src/debug/kea/2.4.1/src/lib/util/file_utilities.h /usr/src/debug/kea/
 2.4.1/src/lib/dns/edns.h /usr/src/debug/kea/2.4.1/src/lib/util/pid_file.cc /usr/src/debug/kea/2.4.1/src/lib/util/encode/base64.h /usr/src/debug/kea/2.4.1/src/lib/dns/name.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter.cc /usr/src/debug/kea/2.4.1/src/lib/dns/tsig.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_thread_pool.cc /usr/src/debug/kea/2.4.1/src/lib/util/optional.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket.cc /usr/src/debug/kea/2.4.1/src/lib/dns/tsigrecord.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4o6.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_addrlst.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_addrlst.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/base_n.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_client_fqdn.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_client_fqdn.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_client_fqdn.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6
 _client_fqdn.h /usr/src/debug/kea/2.4.1/src/lib/util/io/fd_share.cc /usr/src/debug/kea/2.4.1/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.4.1/src/lib/util/io/fd.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrttl.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdataclass.cc /usr/src/debug/kea/2.4.1/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaprefix.cc /usr/src/debug/kea/2.4.1/src/lib/dns/messagerenderer.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_socket.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrcollator.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_process.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/query_filter.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrset_collection.h /usr/src/debug/kea/2.4.1/src/lib/dns/zone_checker.h /usr/src/debug/kea/2.4.1/src/bin/d2/nc_add.cc /usr/src/debug/kea/2.4.1/src/lib/dns/zone_checker.cc /usr/src/debug/kea/
 2.4.1/src/lib/dns/master_lexer_state.h /usr/src/debug/kea/2.4.1/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_impl.h /usr/src/debug/kea/2.4.1/src/lib/dns/message.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_lexer.ll /usr/src/debug/kea/2.4.1/src/lib/asiolink/process_spawn.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_inet.cc /usr/src/debug/kea/2.4.1/src/lib/dns/question.h /usr/src/debug/kea/2.4.1/src/lib/dns/qid_gen.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_parser.yy /usr/src/debug/kea/2.4.1/src/bin/d2/nc_remove.cc /usr/src/debug/kea/2.4.1/src/lib/util/memory_segment_local.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/txt_like.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_space_container.h /usr/src/debug/kea/2.4.1/src/lib/util/io_utilities.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/libdhcp++.h /usr/src/debug/kea/2.4.1/src/li
 b/dns/tsig.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_messages.h /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_space.h /usr/src/debug/kea/2.4.1/src/lib/util/file_utilities.cc /usr/src/debug/kea/2.4.1/src/lib/util/versioned_csv_file.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rcode.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/communication_state.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrttl.h /usr/src/debug/kea/2.4.1/src/lib/dns/opcode.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/interval_timer.cc /usr/src/debug/kea/2.4.1/src/lib/dns/exceptions.cc /usr/src/debug/kea/2.4.1/src/lib/util/encode/hex.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigrecord.cc /usr/src/debug/kea/2.4.1/src/lib/util/time_utilities.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_lpf.h /us
 r/src/debug/kea/2.4.1/src/lib/dns/rrset.h /usr/src/debug/kea/2.4.1/src/lib/util/io/sockaddr_util.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/base32hex_from_binary.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_log.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_parser.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_inet.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader_callbacks.h /usr/src/debug/kea/2.4.1/src/bin/d2/location.hh /usr/src/debug/kea/2.4.1/src/lib/dhcp/socket_info.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_thread_pool.h /usr/src/debug/kea/2.4.1/src/lib/util/reconnect_ctl.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_service.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaprefix.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_data_types.h /usr/src/debug/kea/2.4.1/src/lib/util/io/fd.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_acceptor.h /usr/src/debug/kea/2.4.1/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.4.1/src/l
 ib/dhcp/option.cc /usr/src/debug/kea/2.4.1/src/lib/util/time_utilities.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service.h /usr/src/debug/kea/2.4.1/src/lib/util/io/pktinfo_utilities.h /usr/src/debug/kea/2.4.1/src/lib/dns/labelsequence.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter6.cc", added "/usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/version.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor_class.cc /usr/src/debug/kea/2.6.0/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.6.0/src/lib/util/csv_file.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_process.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_ia.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_callouts.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_int.h /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove_without_dhcid.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/addr_utilities.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/protocol_util.
 h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_update_mgr.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/tcp_acceptor.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_mgr.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tls_acceptor.h /usr/src/debug/kea/2.6.0/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.6.0/src/lib/util/labeled_value.h /usr/src/debug/kea/2.6.0/src/lib/util/dhcp_space.cc /usr/src/debug/kea/2.6.0/src/lib/util/dhcp_space.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_messages.cc /usr/src/debug/kea/2.6.0/src/lib/util/pid_file.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service_states.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor_class.h /usr/src/debug/kea/2.6.0/src/lib/util/versioned_csv_file.cc /usr/src/debug/kea/2.6.0/src/lib/util/staged_value.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_lpf.cc /usr/src/debug/kea/2.6.0/src/lib/dns/serial.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_queue_mgr.h /usr/src/debug/kea/2.6.0/src/h
 ooks/dhcp/high_availability/command_creator.cc /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer_inputsource.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_int_array.h /usr/src/debug/kea/2.6.0/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/opaque_data_tuple.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_log.cc /usr/src/debug/kea/2.6.0/src/lib/dns/name.cc /usr/src/debug/kea/2.6.0/src/lib/util/thread_pool.h /usr/src/debug/kea/2.6.0/src/lib/util/buffer.h /usr/src/debug/kea/2.6.0/src/lib/dns/rdataclass.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_callouts.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_lexer.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_update_backlog.cc /usr/src/debug/kea/2.6.0/src/lib/dns/tsigerror.cc /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer_inputsource.h /usr/src/debug/kea/2.6.0/src/lib/util/memory_segment.h /usr/src/de
 bug/kea/2.6.0/src/lib/dns/tsigkey.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/iface_mgr_linux.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_server_type.h /usr/src/debug/kea/2.6.0/src/lib/util/encode/encode.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/hwaddr.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid_factory.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/common_tls.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr4.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr6.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_ring.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_controller.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter6.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt.h /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add_without_dhcid.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_string.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer.h /usr/src/debug/k
 ea/2.6.0/src/lib/dns/rrparamregistry.cc /usr/src/debug/kea/2.6.0/src/bin/d2/parser_context.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/std_option_defs.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_opaque_data_tuples.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/command_creator.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/docsis3_option_defs.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/process_spawn.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_config.h /usr/src/debug/kea/2.6.0/src/lib/dns/name_internal.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/openssl_tls.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_custom.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_sync_filter.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_socket.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/classify.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/iface_mgr.h /usr/src/debug/kea/2.6.0/src/lib/
 dhcp/pkt_filter_inet6.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_mgr.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrparamregistry.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/communication_state.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_opaque_data_tuples.cc /usr/src/debug/kea/2.6.0/src/lib/util/reconnect_ctl.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_auth.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rrtype.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/classify.h /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_remove.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid_factory.h /usr/src/debug/kea/2.6.0/src/lib/util/filesystem.h /usr/src/debug/kea/2.6.0/src/lib/util/range_utilities.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsigerror.h /usr/src/debug/kea/2.6.0/src/bin/d2/parser_context.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/openssl_tls.h /usr/src/debug/kea
 /2.6.0/src/bin/d2/main.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt6.h /usr/src/debug/kea/2.6.0/src/lib/util/labeled_value.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_auth.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrset.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_inet6.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_messages.h /usr/src/debug/kea/2.6.0/src/lib/dns/opcode.h /usr/src/debug/kea/2.6.0/src/lib/dns/question.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaaddr.h /usr/src/debug/kea/2.6.0/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.6.0/src/lib/util/pointer_util.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/dhcp6.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_data_types.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/dhcp4.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrclass.h /usr/src/debug/kea/2.6.0/src/lib/util/watch_socket.h /usr/src/debug/kea/2.6.0/src/lib/dns/serial.h /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_remove.h /usr/src/debug/kea/2.6.0/src/lib/dhc
 p/option_definition.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt6.cc /usr/src/debug/kea/2.6.0/src/lib/dns/edns.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_space.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt4o6.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_endpoint.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_impl.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rdata.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/interval_timer.h /usr/src/debug/kea/2.6.0/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_addrlst.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_addrlst.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_pdexclude.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_messages.cc /usr/src/debug/kea/2.6.0/src/lib/dns/char_string.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service.cc /usr/src/debug/kea/2.6.0/src/lib/
 dns/rcode.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr4.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr6.cc /usr/src/debug/kea/2.6.0/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrtype.h /usr/src/debug/kea/2.6.0/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.6.0/src/lib/util/stopwatch.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_string.cc /usr/src/debug/kea/2.6.0/src/lib/util/watched_thread.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/opaque_data_tuple.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_status_code.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt4.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_address.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_pdexclude.cc /usr/src/debug/kea/2.6.0/src/lib/util/encode/utf8.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_status_code.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_loader.cc /usr/src/debug/kea/2.6.0/src/lib/util/fi
 lesystem.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_ia.cc /usr/src/debug/kea/2.6.0/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_custom.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_classless_static_route.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/udp_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tcp_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/dns/message.h /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_sync_filter.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_dnr.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_dnr.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_signal.cc /usr/src/debug/kea/2.6.0/src/bin/d2/nc_remove.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/common_tls.h /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add_without_dhcid.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_log.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket_accep
 tor.h /usr/src/debug/kea/2.6.0/src/lib/util/str.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service_states.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tcp_socket.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tls_socket.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/udp_socket.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrclass.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_address.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config_parser.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_definition.cc /usr/src/debug/kea/2.6.0/src/lib/util/csv_file.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_classless_static_route.cc /usr/src/debug/kea/2.6.0/src/lib/util/triplet.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaaddr.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_config.cc /usr/src/debug/kea/2.6.0/src/lib/dns/time_utils.cc /usr/src/debug/kea/2.6.0/src/lib/dns/time_utils.h /usr/src/debug/kea/2.6.0/
 src/lib/dhcp/pkt4.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_signal.h /usr/src/debug/kea/2.6.0/src/bin/d2/nc_add.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_mgr.cc /usr/src/debug/kea/2.6.0/src/lib/util/state_model.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_controller.cc /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_add.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_asio_socket.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_update_backlog.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm_store.cc /usr/src/debug/kea/2.6.0/src/lib/util/encode/utf8.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/protocol_util.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/query_filter.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/iface_mgr.cc /usr/src/debug/kea/2.6.0/src/lib/dns/tsigkey.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket.h /usr/src/debug/kea/2.6.0/src/lib/util/str.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_parser.cc /usr/s
 rc/debug/kea/2.6.0/src/lib/dns/rdata.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_error.h /usr/src/debug/kea/2.6.0/src/lib/dns/labelsequence.h /usr/src/debug/kea/2.6.0/src/lib/util/state_model.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_dnr.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/hwaddr.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_dnr.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/libdhcp++.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/addr_utilities.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config.h /usr/src/debug/kea/2.6.0/src/lib/dns/messagerenderer.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config_parser.cc /usr/src/debug/kea/2.6.0/src/lib/util/bigints.h /usr/src/debug/kea/2.6.0/src/lib/dns/exceptions.h /usr/src/debug/kea/2.6.0/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_queue_mgr.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_update_mgr.h /usr/src/debug/
 kea/2.6.0/src/lib/dns/edns.h /usr/src/debug/kea/2.6.0/src/lib/util/pid_file.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration_store.cc /usr/src/debug/kea/2.6.0/src/lib/dns/name.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter.cc /usr/src/debug/kea/2.6.0/src/lib/dns/tsig.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_thread_pool.cc /usr/src/debug/kea/2.6.0/src/lib/util/optional.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket.cc /usr/src/debug/kea/2.6.0/src/lib/dns/tsigrecord.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt4o6.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_addrlst.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_addrlst.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_client_fqdn.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_client_fqdn.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove_without_dhcid.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_client_fqdn.h /usr/src
 /debug/kea/2.6.0/src/lib/dhcp/option6_client_fqdn.h /usr/src/debug/kea/2.6.0/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.6.0/src/lib/util/io/fd.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rrttl.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter.h /usr/src/debug/kea/2.6.0/src/lib/dns/rdataclass.cc /usr/src/debug/kea/2.6.0/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_mgr.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_log.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaprefix.cc /usr/src/debug/kea/2.6.0/src/lib/dns/messagerenderer.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_loader.h /usr/src/debug/kea/2.6.0/src/lib/dns/char_string.h /usr/src/debug/kea/2.6.0/src/lib/util/io.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_socket.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_process.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/query_filter.h /usr/s
 rc/debug/kea/2.6.0/src/lib/util/encode/encode.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration_store.h /usr/src/debug/kea/2.6.0/src/bin/d2/nc_add.cc /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer_state.h /usr/src/debug/kea/2.6.0/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_relationship_mapper.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm_store.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_impl.h /usr/src/debug/kea/2.6.0/src/lib/dns/message.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt.cc /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_add.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_lexer.ll /usr/src/debug/kea/2.6.0/src/lib/asiolink/process_spawn.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_inet.cc /usr/src/debug/kea/2.6.0/src/lib/dns/question.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_parser.yy /usr/src/debug/kea/2.6.0/src/bin/d2/nc_remove.cc /usr/src/debug/kea/2.6.0/src/lib/util/me
 mory_segment_local.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_space_container.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/version.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/libdhcp++.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsig.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_messages.h /usr/src/debug/kea/2.6.0/src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_space.h /usr/src/debug/kea/2.6.0/src/lib/util/versioned_csv_file.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rcode.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/communication_state.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrttl.h /usr/src/debug/kea/2.6.0/src/lib/dns/opcode.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/interval_timer.cc /usr/src/debug/kea/2.6.0/src/lib/dns/exceptions.cc /usr/src
 /debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsigrecord.cc /usr/src/debug/kea/2.6.0/src/lib/dns/txt_like.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_lpf.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrset.h /usr/src/debug/kea/2.6.0/src/lib/util/io/sockaddr_util.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_log.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_parser.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_inet.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_loader_callbacks.h /usr/src/debug/kea/2.6.0/src/bin/d2/location.hh /usr/src/debug/kea/2.6.0/src/lib/dhcp/socket_info.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_thread_pool.h /usr/src/debug/kea/2.6.0/src/lib/util/reconnect_ctl.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaprefix.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_data_types.h /usr/src/debug/kea/2.6.0/src/lib/uti
 l/io/fd.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_acceptor.h /usr/src/debug/kea/2.6.0/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service.h /usr/src/debug/kea/2.6.0/src/lib/util/io/pktinfo_utilities.h /usr/src/debug/kea/2.6.0/src/lib/dns/labelsequence.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter6.cc"
packages/core2-64-poky-linux/kea/kea-src: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-src: PKGSIZE changed from 12450411 to 12453387 (+0%)
packages/core2-64-poky-linux/kea/kea-staticdev: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-staticdev: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-exceptions.so.23 /usr/lib/libkea-dhcpsrv.so.90.0.0 /usr/lib/libkea-asiolink.so.56.0.0 /usr/lib/libkea-dns++.so.42 /usr/lib/libkea-stats.so.29.0.0 /usr/lib/libkea-cryptolink.so.38.0.0 /usr/lib/libkea-hooks.so.78 /usr/lib/libkea-database.so.48.0.0 /usr/lib/libkea-d2srv.so.30.0.0 /usr/lib/libkea-eval.so.52 /usr/lib/libkea-util.so.68.0.0 /usr/lib/libkea-dhcp_ddns.so.41 /usr/lib/libkea-dhcpsrv.so.90 /usr/lib/libkea-asiodns.so.35.0.0 /usr/lib/libkea-asiodns.so.35 /usr/share/kea/api/libreload.json /usr/lib/libkea-cc.so.54 /usr/lib/libkea-cc.so.54.0.0 /usr/lib/libkea-exceptions.so.23.0.0 /usr/lib/libkea-dhcp++.so.74 /usr/lib/libkea-http.so.56 /usr/lib/libkea-log.so.48 /usr/lib/libkea-dhcp_ddns.so.41.0.0 /usr/lib/libkea-dns++.so.42.0.0 /usr/lib/libkea-hooks.so.78.0.0 /usr/lib/libkea-process.so.57.0.0 /usr/lib/libkea-database.so.48 /usr/lib/libkea-cryptolink.so.38 /usr/lib/libkea-util.so.68 /usr/lib/libkea-cfgclient.so.51
  /usr/lib/libkea-d2srv.so.30 /usr/lib/libkea-eval.so.52.0.0 /usr/lib/libkea-cfgclient.so.51.0.0 /usr/lib/libkea-dhcp++.so.74.0.0 /usr/lib/libkea-process.so.57 /usr/lib/libkea-http.so.56.0.0 /usr/lib/libkea-stats.so.29 /usr/lib/libkea-tcp.so.5 /usr/lib/libkea-log.so.48.0.0 /usr/lib/libkea-asiolink.so.56 /usr/lib/libkea-tcp.so.5.0.0", added "/usr/lib/libkea-hooks.so.97.0.0 /usr/lib/libkea-log.so.61.0.0 /usr/lib/libkea-asiolink.so.71.0.0 /usr/lib/kea/hooks/libdhcp_perfmon.so /usr/lib/libkea-d2srv.so.46 /usr/lib/libkea-cryptolink.so.50.0.0 /usr/lib/libkea-dhcpsrv.so.108 /usr/lib/libkea-database.so.61.0.0 /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh /usr/lib/libkea-dhcp++.so.89.0.0 /usr/lib/libkea-asiodns.so.48.0.0 /usr/lib/libkea-util.so.84 /usr/lib/libkea-eval.so.69.0.0 /usr/lib/libkea-cc.so.68.0.0 /usr/lib/libkea-log.so.61 /usr/lib/libkea-exceptions.so.33.0.0 /usr/lib/libkea-htt
 p.so.71 /usr/lib/libkea-d2srv.so.46.0.0 /usr/lib/libkea-dhcp_ddns.so.56.0.0 /usr/lib/libkea-process.so.72 /usr/lib/libkea-process.so.72.0.0 /usr/lib/libkea-database.so.61 /usr/lib/libkea-cryptolink.so.50 /usr/lib/libkea-dhcpsrv.so.108.0.0 /usr/lib/libkea-exceptions.so.33 /usr/lib/libkea-stats.so.41.0.0 /usr/lib/libkea-dns++.so.56 /usr/lib/libkea-tcp.so.18 /usr/lib/libkea-cfgclient.so.65.0.0 /usr/share/kea/scripts/pgsql/upgrade_018_to_019.sh /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh /usr/lib/libkea-eval.so.69 /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh /usr/lib/libkea-cc.so.68 /usr/lib/libkea-dhcp_ddns.so.56 /usr/share/kea/api/extended-info6-upgrade.json /usr/lib/libkea-tcp.so.18.0.0 /usr/lib/libkea-http.so.71.0.0 /usr/lib/libkea-asiolink.so.71 /usr/lib/libkea-cfgclient.so.65 /usr/lib/libkea-hooks.so.97 /usr/lib/libkea-dhcp++.so.89 /usr/lib/libkea-dns++.so.56.0.0 /usr/lib/libkea-stats.so.41 /usr/lib/libkea-asiodns.so.
 48 /usr/lib/libkea-util.so.84.0.0"
packages/core2-64-poky-linux/kea/kea: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea: PKGSIZE changed from 19750583 to 20070912 (+2%)
packages/core2-64-poky-linux/kea: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/2.4.1/kea-2.4.1.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch" to "http://ftp.isc.org/isc/kea/2.6.0/kea-2.6.0.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch"
packages/core2-64-poky-linux/kea: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
Changes to packages/core2-64-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.35.0.0 to libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.56.0.0 to libkea-asiolink.so.71.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.54.0.0 to libkea-cc.so.68.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.51.0.0 to libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.38.0.0 to libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.30.0.0 to libkea-d2srv.so.46.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.48.0.0 to libkea-database.so.61.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.41.0.0 to libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.74.0.0 to libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.90.0.0 to libkea-dhcpsrv.so.108.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.42.0.0 to libkea-dns++.so.56.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.52.0.0 to libkea-eval.so.69.0.0
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.23.0.0 to libkea-exceptions.so.33.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.78.0.0 to libkea-hooks.so.97.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.56.0.0 to libkea-http.so.71.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.48.0.0 to libkea-log.so.61.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.57.0.0 to libkea-process.so.72.0.0
  /usr/lib/libkea-stats.so changed symlink target from libkea-stats.so.29.0.0 to libkea-stats.so.41.0.0
  /usr/lib/libkea-tcp.so changed symlink target from libkea-tcp.so.5.0.0 to libkea-tcp.so.18.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.68.0.0 to libkea-util.so.84.0.0
  /usr/lib/libkea-asiodns.so.35.0.0 moved to /usr/lib/libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiodns.so.35 moved to /usr/lib/libkea-asiodns.so.48
  /usr/lib/libkea-asiolink.so.56.0.0 moved to /usr/lib/libkea-asiolink.so.71.0.0
  /usr/lib/libkea-asiolink.so.56 moved to /usr/lib/libkea-asiolink.so.71
  /usr/lib/libkea-cc.so.54.0.0 moved to /usr/lib/libkea-cc.so.68.0.0
  /usr/lib/libkea-cc.so.54 moved to /usr/lib/libkea-cc.so.68
  /usr/lib/libkea-cfgclient.so.51.0.0 moved to /usr/lib/libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cfgclient.so.51 moved to /usr/lib/libkea-cfgclient.so.65
  /usr/lib/libkea-cryptolink.so.38.0.0 moved to /usr/lib/libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-cryptolink.so.38 moved to /usr/lib/libkea-cryptolink.so.50
  /usr/lib/libkea-d2srv.so.30.0.0 moved to /usr/lib/libkea-d2srv.so.46.0.0
  /usr/lib/libkea-d2srv.so.30 moved to /usr/lib/libkea-d2srv.so.46
  /usr/lib/libkea-database.so.48.0.0 moved to /usr/lib/libkea-database.so.61.0.0
  /usr/lib/libkea-database.so.48 moved to /usr/lib/libkea-database.so.61
  /usr/lib/libkea-dhcp_ddns.so.41.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp_ddns.so.41 moved to /usr/lib/libkea-dhcp_ddns.so.56
  /usr/lib/libkea-dhcp++.so.74.0.0 moved to /usr/lib/libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcp++.so.74 moved to /usr/lib/libkea-dhcp++.so.89
  /usr/lib/libkea-dns++.so.42.0.0 moved to /usr/lib/libkea-dns++.so.56.0.0
  /usr/lib/libkea-dns++.so.42 moved to /usr/lib/libkea-dns++.so.56
  /usr/lib/libkea-eval.so.52.0.0 moved to /usr/lib/libkea-eval.so.69.0.0
  /usr/lib/libkea-eval.so.52 moved to /usr/lib/libkea-eval.so.69
  /usr/lib/libkea-exceptions.so.23.0.0 moved to /usr/lib/libkea-exceptions.so.33.0.0
  /usr/lib/libkea-exceptions.so.23 moved to /usr/lib/libkea-exceptions.so.33
  /usr/lib/libkea-hooks.so.78.0.0 moved to /usr/lib/libkea-hooks.so.97.0.0
  /usr/lib/libkea-hooks.so.78 moved to /usr/lib/libkea-hooks.so.97
  /usr/lib/libkea-http.so.56.0.0 moved to /usr/lib/libkea-http.so.71.0.0
  /usr/lib/libkea-http.so.56 moved to /usr/lib/libkea-http.so.71
  /usr/lib/libkea-log.so.48.0.0 moved to /usr/lib/libkea-log.so.61.0.0
  /usr/lib/libkea-log.so.48 moved to /usr/lib/libkea-log.so.61
  /usr/lib/libkea-process.so.57.0.0 moved to /usr/lib/libkea-process.so.72.0.0
  /usr/lib/libkea-process.so.57 moved to /usr/lib/libkea-process.so.72
  /usr/lib/libkea-stats.so.29.0.0 moved to /usr/lib/libkea-stats.so.41.0.0
  /usr/lib/libkea-stats.so.29 moved to /usr/lib/libkea-stats.so.41
  /usr/lib/libkea-util.so.68.0.0 moved to /usr/lib/libkea-util.so.84.0.0
  /usr/lib/libkea-util.so.68 moved to /usr/lib/libkea-util.so.84
  /usr/include/kea/asiolink/io_service_mgr.h was added
  /usr/include/kea/config/cmd_http_listener.h was added
  /usr/include/kea/config/cmd_response_creator_factory.h was added
  /usr/include/kea/config/cmd_response_creator.h was added
  /usr/include/kea/d2srv/d2_stats.h was added
  /usr/include/kea/d2srv/d2_tsig_key.h was added
  /usr/include/kea/d2srv/d2_update_message.h was added
  /usr/include/kea/d2srv/d2_zone.h was added
  /usr/include/kea/d2srv/dns_client.h was added
  /usr/include/kea/d2srv/nc_trans.h was added
  /usr/include/kea/dhcp/option4_dnr.h was added
  /usr/include/kea/dhcp/option6_dnr.h was added
  /usr/include/kea/dhcp/option_classless_static_route.h was added
  /usr/include/kea/dns/char_string.h was added
  /usr/include/kea/dns/time_utils.h was added
  /usr/include/kea/dns/txt_like.h was added
  /usr/include/kea/util/chrono_time_utils.h was added
  /usr/include/kea/util/encode/encode.h was added
  /usr/include/kea/util/filesystem.h was added
  /usr/include/kea/util/io.h was added
  /usr/include/kea/util/str.h was added
  /usr/lib/kea/hooks/libdhcp_perfmon.so was added
  /usr/lib/libkea-dhcpsrv.so.108.0.0 was added
  /usr/lib/libkea-dhcpsrv.so.108 was added
  /usr/lib/libkea-tcp.so.18.0.0 was added
  /usr/lib/libkea-tcp.so.18 was added
  /usr/share/kea/api/extended-info6-upgrade.json was added
  /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_018_to_019.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh was added
  /usr/include/kea/dns/dns_fwd.h was removed
  /usr/include/kea/dns/masterload.h was removed
  /usr/include/kea/dns/nsec3hash.h was removed
  /usr/include/kea/dns/qid_gen.h was removed
  /usr/include/kea/dns/rdatafields.h was removed
  /usr/include/kea/dns/rdata_pimpl_holder.h was removed
  /usr/include/kea/dns/rrcollator.h was removed
  /usr/include/kea/dns/rrset_collection_base.h was removed
  /usr/include/kea/dns/rrset_collection.h was removed
  /usr/include/kea/dns/zone_checker.h was removed
  /usr/include/kea/util/encode/base16_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex.h was removed
  /usr/include/kea/util/encode/base64.h was removed
  /usr/include/kea/util/encode/binary_from_base16.h was removed
  /usr/include/kea/util/encode/binary_from_base32hex.h was removed
  /usr/include/kea/util/encode/hex.h was removed
  /usr/include/kea/util/filename.h was removed
  /usr/include/kea/util/file_utilities.h was removed
  /usr/include/kea/util/io/fd_share.h was removed
  /usr/include/kea/util/io_utilities.h was removed
  /usr/include/kea/util/strutil.h was removed
  /usr/include/kea/util/time_utilities.h was removed
  /usr/lib/libkea-dhcpsrv.so.90.0.0 was removed
  /usr/lib/libkea-dhcpsrv.so.90 was removed
  /usr/lib/libkea-tcp.so.5.0.0 was removed
  /usr/lib/libkea-tcp.so.5 was removed
  /usr/share/kea/api/libreload.json was removed

--===============9017095629453061530==--


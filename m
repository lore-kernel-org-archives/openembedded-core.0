Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10877C3DA5E
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1291.1721071144959217155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gfCoAgt0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=E5oJ6Sh9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d58cb0-146e1924-f8eb-4cdd-88fe-519cc9cbfab2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071144;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=rOPwHHvX3ylAK9S06E8Y31uwVSYvUh0TDBNcUUXQwys=;
	b=gfCoAgt0/MHAxp9o6zLf3iFhUUB9h/A65tR6S32JdGLHvyEfmwxYmljtL/CAtcZS
	qAiNk1jYP/PPY8UJU7q3QBxDfON3GMO7GZJW0/Z0ZBQJJyMGARZl8YULV0QTe5uirmN
	CNuu14iW/ev7kpGso2jEdZ17n32pAFeHiwtGncZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071144;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=rOPwHHvX3ylAK9S06E8Y31uwVSYvUh0TDBNcUUXQwys=;
	b=E5oJ6Sh9ZpK8j+1Te+iYVcIEh7KZxzeIasMI4bPWy1CqElj28cYCQIIpn9GgaFQS
	pI0y2e4cKrUav9vKMLpeJb9oCFjSpNMW1mT0UJ/f7pVgX6nqkXzLE36KSewor1Y8jXZ
	RN+yiCjtZ7TKtQn0YHBtD2D1ve/ZTBmSp6SguB5M=
Content-Type: multipart/mixed; boundary="===============2457109856594270301=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 2.6.0 FAILED
Message-ID: <01010190b7d58cb0-146e1924-f8eb-4cdd-88fe-519cc9cbfab2-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201944

--===============2457109856594270301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *2.6.0* has Failed(do_compile).

Detailed error information:

do_compile failed



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
From 906c4afbc36b7827b2fadd86ed5fe2bb81bc7222 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 07:44:36 +0000
Subject: [PATCH] kea: upgrade 2.4.1 -> 2.6.0

---
 ...er_unittest_support.cc-do-not-write-.patch |  3 +--
 .../kea/files/fix-multilib-conflict.patch     |  7 +++---
 .../kea/files/fix_pid_keactrl.patch           |  7 +++---
 .../kea/{kea_2.4.1.bb => kea_2.6.0.bb}        | 23 +++++++++++++++++--
 4 files changed, 28 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.0.bb} (77%)

diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 94fbd12737..b9e8e656e2 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 841924e1fe8db2bff3eab8d37634ef08f86c00ec Mon Sep 17 00:00:00 2001
+From a2eeb4bffed88cbe9b50eaca212bdd97cae36d32 Mon Sep 17 00:00:00 2001
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
index 5b135b3aee..ac8376e9db 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
+From a7bf58bfccc3a802fae956dddaf3957b6843bdfe Mon Sep 17 00:00:00 2001
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
index 63a6a2805b..15716b416a 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
+From ea66bbe3f06a4b6228b2fdecca5513755ded5d68 Mon Sep 17 00:00:00 2001
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


--===============2457109856594270301==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-2.4.1-2.6.0.patch"

RnJvbSA5MDZjNGFmYmMzNmI3ODI3YjJmYWRkODZlZDVmZTJiYjgxYmM3MjIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDc6NDQ6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
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
OTRmYmQxMjczNy4uYjllOGU2NTZlMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9rZWEvZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5j
Yy1kby1ub3Qtd3JpdGUtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2Vh
L2ZpbGVzLzAwMDEtc3JjLWxpYi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90
LXdyaXRlLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODQxOTI0ZTFmZThkYjJiZmYzZWFi
OGQzNzYzNGVmMDhmODZjMDBlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTJlZWI0
YmZmZWQ4OGNiZTliNTBlYWNhMjEyYmRkOTdjYWUzNmQzMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
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
ZWEvZmlsZXMvZml4LW11bHRpbGliLWNvbmZsaWN0LnBhdGNoCmluZGV4IDViMTM1YjNhZWUuLmFj
ODM3NmU5ZGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVz
L2ZpeC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2tlYS9maWxlcy9maXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDA2ZWJkMWIyY2VkNDI2YzQyMGVkMTYyOTgwZWNhMTk0ZjlmOTE4YWUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGE3YmY1OGJmY2NjM2E4MDJmYWU5NTZkZGRhZjM5NTdiNjg0
M2JkZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdA
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
ZF9rZWFjdHJsLnBhdGNoCmluZGV4IDYzYTZhMjgwNWIuLjE1NzE2YjQxNmEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeF9waWRfa2VhY3RybC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXhfcGlkX2tlYWN0
cmwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM4NzhhMzU2NzEyNjA2NTQ5ZjdmMTg4YjYy
ZjdkMWNhZTA4YTE3NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVhNjZiYmUzZjA2
YTRiNjIyOGIyZmRlY2NhNTUxMzc1NWRlZDVkNjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
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

--===============2457109856594270301==
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
DISTRO_VERSION       = "5.0+snapshot-f4c1e4074486f98b57b41094715da86aec609570"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f4c1e4074486f98b57b41094715da86aec609570"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 198 Local 186 Mirrors 0 Missed 12 Current 258 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1089 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_recipe_qa)
NOTE: recipe kea-2.6.0-r0: task do_recipe_qa: Started
NOTE: recipe kea-2.6.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1282 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_fetch)
NOTE: recipe kea-2.6.0-r0: task do_fetch: Started
NOTE: recipe kea-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_unpack)
NOTE: Running task 1284 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kea-2.6.0-r0: task do_unpack: Started
NOTE: recipe kea-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kea-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1285 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_patch)
NOTE: Running task 1286 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_collect_spdx_deps)
NOTE: recipe kea-2.6.0-r0: task do_patch: Started
NOTE: recipe kea-2.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe kea-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kea-2.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kea-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1287 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1288 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_populate_lic)
NOTE: recipe kea-2.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kea-2.6.0-r0: task do_populate_lic: Started
NOTE: recipe kea-2.6.0-r0: task do_populate_lic: Succeeded
NOTE: recipe kea-2.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1289 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_configure)
NOTE: recipe kea-2.6.0-r0: task do_configure: Started
NOTE: recipe kea-2.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1290 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_compile)
NOTE: recipe kea-2.6.0-r0: task do_compile: Started
NOTE: recipe kea-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1291 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_install)
NOTE: recipe kea-2.6.0-r0: task do_install: Started
NOTE: recipe kea-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1292 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_package)
NOTE: Running task 1293 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_populate_sysroot)
NOTE: recipe kea-2.6.0-r0: task do_package: Started
NOTE: recipe kea-2.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe kea-2.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kea-2.6.0-r0: task do_package: Succeeded
NOTE: Running task 1294 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_packagedata)
NOTE: recipe kea-2.6.0-r0: task do_packagedata: Started
NOTE: recipe kea-2.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1295 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_create_spdx)
NOTE: Running task 1296 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_package_write_ipk)
NOTE: Running task 1297 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_package_write_deb)
NOTE: Running task 1298 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_package_write_rpm)
NOTE: Running task 1299 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_package_qa)
NOTE: recipe kea-2.6.0-r0: task do_create_spdx: Started
NOTE: recipe kea-2.6.0-r0: task do_package_write_ipk: Started
NOTE: recipe kea-2.6.0-r0: task do_package_write_deb: Started
NOTE: recipe kea-2.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe kea-2.6.0-r0: task do_package_qa: Started
NOTE: recipe kea-2.6.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe kea-2.6.0-r0: task do_package_qa: Failed
NOTE: recipe kea-2.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe kea-2.6.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe kea-2.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1299 tasks of which 1280 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715073527.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715073527.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_package_qa
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: kea-2.6.0-r0 do_package_qa: QA Issue: File /usr/sbin/kea-admin in package kea contains reference to TMPDIR [buildpaths]
ERROR: kea-2.6.0-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kea/2.6.0/temp/log.do_package_qa.3119373
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/kea/kea_2.6.0.bb:do_package_qa) failed with exit code '1'

--===============2457109856594270301==--


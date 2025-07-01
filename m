Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83952C83F0E
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1426.1751386807841302544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=smGKm8X5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=m+kOUyL1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6ca17c8-2e5174e3-4f36-4092-be7b-4ffdb8d9f176-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bKZFI1OicJTgyuUiv/JZ93+TGn6kBCMCkkz9sqHivoY=;
	b=smGKm8X5gBQwgJ/yxiVArOmz8RtWMwDgDVBGk6CD4FRINVYYenajwekTSoGVgk5B
	l7o2PcyhbHotr9ePPjBTYeyr5xfSq6El3j3ySACmk8YNbyclVSCMlYZD+GYCc3FKYAm
	Y78yljmj5vpdOhiM9EfP+bQgcibYL/JSJi1jTZhg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bKZFI1OicJTgyuUiv/JZ93+TGn6kBCMCkkz9sqHivoY=;
	b=m+kOUyL1qnjm2WXOrbYyP2fOUkF2gbsnBnHzoQNKrKX3rT3KdFOVuxS9Fo3M+qVC
	I3MFFmeE6AGXxOjZ8mPmX2vZ4vONietEwuueH1bJcjhiBuJ0eTwMwuJg/0BCU09s2Fg
	XpLU+OCmTJ+Sb+K8OW7oh0U7X1VbkGd9OBa0qSIk=
Content-Type: multipart/mixed; boundary="===============8127771125239782779=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.17p1 SUCCEEDED
Message-ID: <01010197c6ca17c8-2e5174e3-4f36-4092-be7b-4ffdb8d9f176-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219664

--===============8127771125239782779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sudo* to *1.9.17p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.16p2-1.9.17p1.patch
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
From a73e4d1fec4e434213a9202ba7b4c1a3fc26af0c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 11:34:58 +0000
Subject: [PATCH] sudo: upgrade 1.9.16p2 -> 1.9.17p1

---
 ...o.conf.in-fix-conflict-with-multilib.patch |  6 ++---
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.16p2.bb => sudo_1.9.17p1.bb}    | 23 ++++++++++++++++++-
 3 files changed, 26 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.16p2.bb => sudo_1.9.17p1.bb} (74%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index ec0384e257..9882e8e078 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 61ae82a2ba502492b6a78f248258abb71daeb227 Mon Sep 17 00:00:00 2001
+From b79e2088337ca5ef05731bb7b3950edab5342353 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -20,7 +20,7 @@ Upstream-Status: Inappropriate [OE configuration specific]
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 2187457..0908d24 100644
+index bdd676c..094341c 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -52,7 +52,7 @@ index 2187457..0908d24 100644
  # Sudo plugin directory:
 @@ -74,7 +74,7 @@
  # The default directory to use when searching for plugins that are
- # specified without a fully qualified path name.
+ # specified without a fully-qualified path name.
  #
 -#Path plugin_dir @plugindir@
 +#Path plugin_dir $plugindir
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 0afbf669f0..a23de1fcf7 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a6876cbeb2aa51837935ba3fd82ee87 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
similarity index 74%
rename from meta/recipes-extended/sudo/sudo_1.9.16p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index fbe507ad32..78dd13eaff 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.md
+# +++ LICENSE.md
+# @@ -1,6 +1,6 @@
+#  Sudo is distributed under the following license:
+#  
+# -    Copyright (c) 1994-1996, 1998-2024
+# +    Copyright (c) 1994-1996, 1998-2025
+#          Todd C. Miller <Todd.Miller@sudo.ws>
+#  
+#      Permission to use, copy, modify, and distribute this software for any
+# 
+#
+
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
@@ -7,7 +28,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c"
+SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.47.1


--===============8127771125239782779==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.16p2-1.9.17p1.patch"

RnJvbSBhNzNlNGQxZmVjNGU0MzQyMTNhOTIwMmJhN2I0YzFhM2ZjMjZhZjBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMTozNDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
ZG86IHVwZ3JhZGUgMS45LjE2cDIgLT4gMS45LjE3cDEKCi0tLQogLi4uby5jb25mLmluLWZpeC1j
b25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoIHwgIDYgKystLS0KIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9zdWRvL3N1ZG8uaW5jICAgICAgICAgICB8ICAyICstCiAuLi4ve3N1ZG9fMS45LjE2cDIu
YmIgPT4gc3Vkb18xLjkuMTdwMS5iYn0gICAgfCAyMyArKysrKysrKysrKysrKysrKystCiAzIGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8ve3N1ZG9fMS45LjE2cDIuYmIgPT4gc3Vkb18xLjkuMTdw
MS5iYn0gKDc0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9maWxl
cy8wMDAxLXN1ZG8uY29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0aWxpYi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5jb25mLmluLWZpeC1jb25m
bGljdC13aXRoLW11bHRpbGliLnBhdGNoCmluZGV4IGVjMDM4NGUyNTcuLjk4ODJlOGUwNzggMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5jb25m
LmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5jb25mLmluLWZpeC1jb25mbGljdC13aXRoLW11
bHRpbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MWFlODJhMmJhNTAyNDkyYjZhNzhm
MjQ4MjU4YWJiNzFkYWViMjI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNzllMjA4
ODMzN2NhNWVmMDU3MzFiYjdiMzk1MGVkYWI1MzQyMzUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3
IE5vdiAyMDIwIDExOjEzOjQwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN1ZG8uY29uZi5pbjog
Zml4IGNvbmZsaWN0IHdpdGggbXVsdGlsaWIKQEAgLTIwLDcgKzIwLDcgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBjb25maWd1cmF0aW9uIHNwZWNpZmljXQogIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9l
eGFtcGxlcy9zdWRvLmNvbmYuaW4gYi9leGFtcGxlcy9zdWRvLmNvbmYuaW4KLWluZGV4IDIxODc0
NTcuLjA5MDhkMjQgMTAwNjQ0CitpbmRleCBiZGQ2NzZjLi4wOTQzNDFjIDEwMDY0NAogLS0tIGEv
ZXhhbXBsZXMvc3Vkby5jb25mLmluCiArKysgYi9leGFtcGxlcy9zdWRvLmNvbmYuaW4KIEBAIC00
LDcgKzQsNyBAQApAQCAtNTIsNyArNTIsNyBAQCBpbmRleCAyMTg3NDU3Li4wOTA4ZDI0IDEwMDY0
NAogICMgU3VkbyBwbHVnaW4gZGlyZWN0b3J5OgogQEAgLTc0LDcgKzc0LDcgQEAKICAjIFRoZSBk
ZWZhdWx0IGRpcmVjdG9yeSB0byB1c2Ugd2hlbiBzZWFyY2hpbmcgZm9yIHBsdWdpbnMgdGhhdCBh
cmUKLSAjIHNwZWNpZmllZCB3aXRob3V0IGEgZnVsbHkgcXVhbGlmaWVkIHBhdGggbmFtZS4KKyAj
IHNwZWNpZmllZCB3aXRob3V0IGEgZnVsbHktcXVhbGlmaWVkIHBhdGggbmFtZS4KICAjCiAtI1Bh
dGggcGx1Z2luX2RpciBAcGx1Z2luZGlyQAogKyNQYXRoIHBsdWdpbl9kaXIgJHBsdWdpbmRpcgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8vc3Vkby5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmluYwppbmRleCAwYWZiZjY2OWYwLi5hMjNkZTFmY2Y3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmluYworKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmluYwpAQCAtNCw3ICs0LDcgQEAgSE9NRVBB
R0UgPSAiaHR0cDovL3d3dy5zdWRvLndzIgogQlVHVFJBQ0tFUiA9ICJodHRwOi8vd3d3LnN1ZG8u
d3MvYnVncy8iCiBTRUNUSU9OID0gImFkbWluIgogTElDRU5TRSA9ICJJU0MgJiBCU0QtMy1DbGF1
c2UgJiBCU0QtMi1DbGF1c2UgJiBabGliIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRS5tZDttZDU9MGE2ODc2Y2JlYjJhYTUxODM3OTM1YmEzZmQ4MmVlODcgXAorTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9Mjg0MWM4MjJlNTg3ZGIxNDUzNjRjYTk1
ZTliZTJmZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcGx1Z2lucy9zdWRvZXJzL3Jl
ZGJsYWNrLmM7YmVnaW5saW5lPTE7ZW5kbGluZT00NjttZDU9MDNlMzUzMTc2OTliYTAwYjQ5NjI1
MWUwZGZlOWYxMDkgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliL3V0aWwvcmVhbGxv
Y2FycmF5LmM7YmVnaW5saW5lPTM7ZW5kbGluZT0xNTttZDU9Mzk3ZGQ0NWM3NjgzZTkwYjlmOGJm
MjQ2MzhjZjAzYmYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliL3V0aWwvZm5tYXRj
aC5jO2JlZ2lubGluZT0zO2VuZGxpbmU9Mjc7bWQ1PTAwNGQ3ZDI4NjZiYTFmNWI0MTE3NDkwNjg0
OWQyZTBmIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45
LjE2cDIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xN3AxLmJiCnNp
bWlsYXJpdHkgaW5kZXggNzQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRv
L3N1ZG9fMS45LjE2cDIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1
ZG9fMS45LjE3cDEuYmIKaW5kZXggZmJlNTA3YWQzMi4uNzhkZDEzZWFmZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8vc3Vkb18xLjkuMTZwMi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xN3AxLmJiCkBAIC0xLDMgKzEsMjQgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisjICsrKyBMSUNFTlNFLm1kCisjIEBAIC0x
LDYgKzEsNiBAQAorIyAgU3VkbyBpcyBkaXN0cmlidXRlZCB1bmRlciB0aGUgZm9sbG93aW5nIGxp
Y2Vuc2U6CisjICAKKyMgLSAgICBDb3B5cmlnaHQgKGMpIDE5OTQtMTk5NiwgMTk5OC0yMDI0Cisj
ICsgICAgQ29weXJpZ2h0IChjKSAxOTk0LTE5OTYsIDE5OTgtMjAyNQorIyAgICAgICAgICBUb2Rk
IEMuIE1pbGxlciA8VG9kZC5NaWxsZXJAc3Vkby53cz4KKyMgIAorIyAgICAgIFBlcm1pc3Npb24g
dG8gdXNlLCBjb3B5LCBtb2RpZnksIGFuZCBkaXN0cmlidXRlIHRoaXMgc29mdHdhcmUgZm9yIGFu
eQorIyAKKyMKKwogcmVxdWlyZSBzdWRvLmluYwogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LnN1
ZG8ud3MvZGlzdC9zdWRvLSR7UFZ9LnRhci5neiBcCkBAIC03LDcgKzI4LDcgQEAgU1JDX1VSSSA9
ICJodHRwczovL3d3dy5zdWRvLndzL2Rpc3Qvc3Vkby0ke1BWfS50YXIuZ3ogXAogCiBQQU1fU1JD
X1VSSSA9ICJmaWxlOi8vc3Vkby5wYW0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NzZhYTU2
ZDNlM2IyYTc1NTkzMzA3ODY0Mjg4YWRkYjc0OGM5YzEzNmUyNWQ5NWE5Y2M2OTlhYWZhNzcyMzlj
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmNjA3ZWE3MTcwNzIxOTc3MzhhNzhmNzc4NjkyY2Q2
ZGY5YTdlM2U0MDQ1NjVmNTFkZTA2M2NhMjc0NTVkMzIiCiAKIERFUEVORFMgKz0gIiB2aXJ0dWFs
L2NyeXB0ICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywgJ2xp
YnBhbScsICcnLCBkKX0iCiBSREVQRU5EUzoke1BOfSArPSAiICR7QGJiLnV0aWxzLmNvbnRhaW5z
KCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywgJ3BhbS1wbHVnaW4tbGltaXRzIHBhbS1wbHVnaW4t
a2V5aW5pdCcsICcnLCBkKX0iCi0tIAoyLjQ3LjEKCg==

--===============8127771125239782779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/sudo: PACKAGES: added "sudo-locale-yue"
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PKGSIZE changed from 89615 to 106851 (+19%)
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PKGSIZE changed from 34798 to 44126 (+27%)
packages/core2-64-poky-linux/sudo/sudo-locale-it: PKGSIZE changed from 90147 to 105111 (+17%)
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PKGSIZE changed from 96374 to 106699 (+11%)
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PKGSIZE changed from 93091 to 103072 (+11%)

--===============8127771125239782779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sudo: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo: PACKAGES: added "sudo-locale-yue"
packages/core2-64-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.16p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.17p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-64-poky-linux/sudo/sudo-dbg: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 6286256 to 6277808 (-0%)
packages/core2-64-poky-linux/sudo/sudo-dev: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-doc: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-doc: PKGSIZE changed from 3308101 to 3285048 (-1%)
packages/core2-64-poky-linux/sudo/sudo-lib: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-lib: PKGSIZE changed from 995956 to 995973 (+0%)
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PKGSIZE changed from 89615 to 106851 (+19%)
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PKGSIZE changed from 34798 to 44126 (+27%)
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PKGSIZE changed from 105272 to 105311 (+0%)
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-id: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-id: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-it: PKGSIZE changed from 90147 to 105111 (+17%)
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PKGSIZE changed from 96374 to 106699 (+11%)
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PKGSIZE changed from 93091 to 103072 (+11%)
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PKGSIZE changed from 134508 to 135813 (+1%)
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PKGSIZE changed from 95704 to 95100 (-1%)
packages/core2-64-poky-linux/sudo/sudo-src: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-src: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-src: PKGSIZE changed from 576052 to 576378 (+0%)
packages/core2-64-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo-sudo: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]
packages/core2-64-poky-linux/sudo/sudo: PV changed from "1.9.16p2" to "1.9.17p1"
packages/core2-64-poky-linux/sudo/sudo: PKGV changed from 1.9.16p2 [default] to 1.9.17p1 [default]

--===============8127771125239782779==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164BCCD3437
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15623.1777645543244506823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=G8a8O5nS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eBRBGsgg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee5cee-626d42e2-078d-42ec-bda4-a37baab77648-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hELuXYI6cm11hRiZJEmnmehWmTVOh2APaxyqmjDAJqU=;
	b=G8a8O5nSJ0OZKGoCfflAhcN9imGsz7huk+nBTHIKIQectka9zvMI+WRoMdJOkrO/
	pJ6gaTYc59aboLdEKGf4c7zgrVwpOjXShANGgn3Txpq2Rt9/IkIkLDlo+Z/4l8rP2xZ
	t51KLoaFbB7TWWar5fd94apeF7RJA46RFyoqx5Uc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hELuXYI6cm11hRiZJEmnmehWmTVOh2APaxyqmjDAJqU=;
	b=eBRBGsggp7l8Oa11Pk/ojl5fT3CV3nwLXkk2nnmTbasfrOZSvrrlvEImj8DV4f5Z
	fOeIgkpIgb0k2Y+TnhXPplTIszbyNkOeZaxA95FQg7c+9taWi+c/pCMozz6eb+LeZb6
	PKbmOLIVMXLBq9z4OBIJIw6+/mSfHj+HBoy1Tnl4=
Content-Type: multipart/mixed; boundary="===============4336090728701561710=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.1 SUCCEEDED
Message-ID: <0101019de3ee5cee-626d42e2-078d-42ec-bda4-a37baab77648-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236245

--===============4336090728701561710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.0.1-26.1.patch
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
From 93e3d5cb96d6a671a5875d9d45c69d9b4db28324 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:02:48 +0000
Subject: [PATCH] python3-pip: upgrade 26.0.1 -> 26.1

---
 .../python3-pip/no_shebang_mangling.patch     |  2 +-
 ...hon3-pip_26.0.1.bb => python3-pip_26.1.bb} | 25 +++++++++++++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.0.1.bb => python3-pip_26.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index b057852b7e..5823d6307c 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 60093e823780d9a3483844cc3faaed18dc1c351b Mon Sep 17 00:00:00 2001
+From adccf194155f40fb1d387c2cac432341a1dc8a0e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/recipes-devtools/python/python3-pip_26.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pip_26.0.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.1.bb
index 28af8f7ec7..2ad597a00f 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/pip/_vendor/urllib3/LICENSE.txt
+# +++ src/pip/_vendor/urllib3/LICENSE.txt
+# @@ -1,6 +1,6 @@
+#  MIT License
+#  
+# -Copyright (c) 2008-2020 Andrey Petrov and contributors (see CONTRIBUTORS.txt)
+# +Copyright (c) 2008-2020 Andrey Petrov and contributors.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.org/project/pip"
 SECTION = "devel/python"
@@ -19,14 +40,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/rich/LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303 \
                     file://src/pip/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
                     file://src/pip/_vendor/truststore/LICENSE;md5=74420fc3965c4558a4a1529e63c2867f \
-                    file://src/pip/_vendor/urllib3/LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c \
+                    file://src/pip/_vendor/urllib3/LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda \
                     "
 
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
+SRC_URI[sha256sum] = "81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
-- 
2.47.1


--===============4336090728701561710==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.0.1-26.1.patch"

RnJvbSA5M2UzZDVjYjk2ZDZhNjcxYTU4NzVkOWQ0NWM2OWQ5YjRkYjI4MzI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOTowMjo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDI2LjAuMSAtPiAyNi4xCgotLS0KIC4uLi9weXRob24zLXBpcC9u
b19zaGViYW5nX21hbmdsaW5nLnBhdGNoICAgICB8ICAyICstCiAuLi5ob24zLXBpcF8yNi4wLjEu
YmIgPT4gcHl0aG9uMy1waXBfMjYuMS5iYn0gfCAyNSArKysrKysrKysrKysrKysrKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1waXBfMjYuMC4xLmJiID0+IHB5dGhv
bjMtcGlwXzI2LjEuYmJ9ICg3NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNo
CmluZGV4IGIwNTc4NTJiN2UuLjU4MjNkNjMwN2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFu
Z2xpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDYwMDkzZTgyMzc4MGQ5YTM0ODM4NDRj
YzNmYWFlZDE4ZGMxYzM1MWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGFkY2NmMTk0
MTU1ZjQwZmIxZDM4N2MyY2FjNDMyMzQxYTFkYzhhMGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz4KIERhdGU6IFdlZCwgMjMgRmViIDIwMjIgMTI6Mjc6MDYgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gcHl0aG9uMy1waXA6IERvbid0IGNoYW5nZSBzaGViYW5nCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2LjAuMS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2
LjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBp
cF8yNi4xLmJiCmluZGV4IDI4YWY4ZjdlYzcuLjJhZDU5N2EwMGYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMC4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMS5iYgpAQCAtMSwzICsxLDI0
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gc3JjL3BpcC9fdmVuZG9yL3VybGxpYjMvTElDRU5T
RS50eHQKKyMgKysrIHNyYy9waXAvX3ZlbmRvci91cmxsaWIzL0xJQ0VOU0UudHh0CisjIEBAIC0x
LDYgKzEsNiBAQAorIyAgTUlUIExpY2Vuc2UKKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDA4LTIw
MjAgQW5kcmV5IFBldHJvdiBhbmQgY29udHJpYnV0b3JzIChzZWUgQ09OVFJJQlVUT1JTLnR4dCkK
KyMgK0NvcHlyaWdodCAoYykgMjAwOC0yMDIwIEFuZHJleSBQZXRyb3YgYW5kIGNvbnRyaWJ1dG9y
cy4KKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2Us
IHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgb2YgdGhpcyBzb2Z0d2FyZSBhbmQg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwK
KyMgCisjCisKIFNVTU1BUlkgPSAiVGhlIFB5UEEgcmVjb21tZW5kZWQgdG9vbCBmb3IgaW5zdGFs
bGluZyBQeXRob24gcGFja2FnZXMiCiBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2pl
Y3QvcGlwIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCkBAIC0xOSwxNCArNDAsMTQgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTYzZWM1MmJhZjk1MTYzYjU5
NzAwOGJiNDZkYjY4MDMwIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3Zl
bmRvci9yaWNoL0xJQ0VOU0U7bWQ1PWI1ZjBiOTRmYmM5NGY1YWQ5YWU0ZWZjZjhhNzc4MzAzIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci90b21saS9MSUNFTlNF
O21kNT1hYWFhZjA4NzlkMTdkZjAxMTBkMWFhOGM4YzlmNDZmNSBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvdHJ1c3RzdG9yZS9MSUNFTlNFO21kNT03NDQyMGZj
Mzk2NWM0NTU4YTRhMTUyOWU2M2MyODY3ZiBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9z
cmMvcGlwL192ZW5kb3IvdXJsbGliMy9MSUNFTlNFLnR4dDttZDU9YzI4MjNjYjk5NTQzOWM5ODRm
ZDYyYTk3M2Q3OTgxNWMgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVu
ZG9yL3VybGxpYjMvTElDRU5TRS50eHQ7bWQ1PTUyZDI3M2EzMDU0Y2VkNTYxMjc1ZDRkMTUyNjBl
Y2RhIFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YQogCiBTUkNfVVJJICs9ICJmaWxlOi8vbm9fc2hlYmFuZ19tYW5nbGlu
Zy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM0MDM3ZDhhMjc3Yzg5YjMyMGFiZTYz
NmQ1OWY5MWU2ZDA5MjJkMDhhMDViNjBlODVlNTNiMjk2NjEzMzQ2ZDgiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiODFlMTNlYmNjYTNmZmE4Y2M4NWU0ZGVmZjVjMjdlMWVlMjZkZWEwYWE3ZmMyZjI5
NGEwNzNhYzIwODgwNmZmMyIKIAogZG9faW5zdGFsbDphcHBlbmQoKXsKIAkjIHBpcCB2ZW5kb3Jz
IGRpc3RsaWIgd2hpY2ggc2hpcHMgV2luZG93cyBsYXVuY2hlciB0ZW1wbGF0ZXMgKCouZXhlKS4K
LS0gCjIuNDcuMQoK

--===============4336090728701561710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.1.d
 ist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses, dir
 ectory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests, di
 rectory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info, removed "/usr/lib/python3.14/site-packages/pip/_vendor/urllib3/
 util/__pycache__/queue.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/six.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_toml_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/securetransport.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/appengine.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_implementation.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/bindings.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/request.py /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/weakref_finalize.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_v
 endor/dependency_groups/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/_appengine_environ.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/low_level.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_implementation.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_appengine_environ.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/six.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_lint_dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/py.typed /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/makefile.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/request.cpython-314.pyc /usr/lib/python3.1
 4/site-packages/pip/_vendor/urllib3/packages/backports/weakref_finalize.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/ntlmpool.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/LICENSE.txt /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_lint_dependency_groups.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/ntlmpool.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_pip_wrapper.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__main__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_pip_wrapper.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/securetransport.py /usr/lib/python3.14/sit
 e-packages/pip/_vendor/urllib3/packages/backports/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/makefile.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_toml_compat.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/low_level.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/bindings.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/queue.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/appengine.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__main__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__init__.py", added "/usr/lib/python3.14/site-packages/pip/_vendor/url
 lib3/http2/__pycache__/connection.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/response.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/fetch.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/emscripten_fetch_worker.js /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/connection.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/fetch.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/py.typed /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/connection.cp
 ython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_base_connection.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/util.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/request.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/connection.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/request.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_request_methods.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2
 /__pycache__/probe.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/response.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_base_connection.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/probe.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_request_methods.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/errors.py"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_base_connection.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/connection.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/emscripten_fetch_worker.js was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/fetch.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/fetch.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/request.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/response.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/request.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/response.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2 was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/connection.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/probe.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/probe.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_base_connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_request_methods.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/py.typed was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_request_methods.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/__pycache__/util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/util.py was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_implementation.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_lint_dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__main__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_pip_wrapper.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_implementation.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_lint_dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__main__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_pip_wrapper.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_toml_compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/py.typed was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_toml_compat.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_appengine_environ.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/appengine.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/ntlmpool.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/appengine.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/_appengine_environ.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/ntlmpool.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/securetransport.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/bindings.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/low_level.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/securetransport.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/bindings.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/low_level.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/makefile.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/makefile.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/weakref_finalize.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/weakref_finalize.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/six.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/six.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/request.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/request.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/__pycache__/queue.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/queue.py was removed

--===============4336090728701561710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.0.1.tar.gz;downloadfilename=pip-26.0.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.tar.gz;downloadfilename=pip-26.1.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.0.1" to "26.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.0.1" to "26.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.0.1" to "26.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.0.1" to "26.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.0.1" to "26.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.0.1" to "26.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.0.1" to "26.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10330297 to 10675433 (+3%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-pa
 ckages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore, 
 directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources,
  directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna, removed "/usr/lib/python3.14/site-packages/pip/_vendor/urllib3/
 util/__pycache__/queue.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/securetransport.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/LICENSE.txt /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_pip_wrapper.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_lint_dependency_groups.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/six.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/appengine.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/bindings.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_secur
 etransport/__pycache__/low_level.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_toml_compat.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/_appengine_environ.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_appengine_environ.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/ntlmpool.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__main__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/queue.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/appengine.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/weakref_finalize.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/low_level.py /usr/lib/python3.14/
 site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/bindings.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/makefile.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/weakref_finalize.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_lint_dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/py.typed /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/securetransport.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/ntlmpool.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/makefile.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/__init__.cpython-314.pyc /usr/lib/
 python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/six.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_pip_wrapper.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_implementation.py /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_implementation.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_toml_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/request.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/request.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__main__.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/pip/_vendor/url
 lib3/contrib/emscripten/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_base_connection.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/emscripten_fetch_worker.js /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_request_methods.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/connection.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/response.cpython-314.pyc /usr/lib/python3.14/site-packages/p
 ip/_vendor/urllib3/util/util.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/request.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/connection.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/probe.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_base_connection.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/connection.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/fetch.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/response.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/probe.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/py.typed /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_reque
 st_methods.py /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/connection.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/request.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/fetch.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.0.1 [default] to 26.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.0.1" to "26.1"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_base_connection.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/connection.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/emscripten_fetch_worker.js was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/fetch.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/fetch.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/request.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/__pycache__/response.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/request.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/emscripten/response.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2 was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/connection.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/probe.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/http2/__pycache__/probe.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_base_connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/_request_methods.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/py.typed was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/_request_methods.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/__pycache__/util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/util.py was added
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/dependency_groups/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_implementation.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_lint_dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__main__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_pip_wrapper.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_implementation.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_lint_dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/__main__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_pip_wrapper.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/__pycache__/_toml_compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/py.typed was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/dependency_groups/_toml_compat.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_appengine_environ.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/appengine.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/ntlmpool.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/appengine.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/_appengine_environ.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/ntlmpool.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/__pycache__/securetransport.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/bindings.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/low_level.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/securetransport.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/bindings.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/contrib/_securetransport/__pycache__/low_level.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/makefile.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/makefile.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/__pycache__/weakref_finalize.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/backports/weakref_finalize.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__init__.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/__pycache__/six.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/packages/six.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/__pycache__/request.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/request.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/__pycache__/queue.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/urllib3/util/queue.py was removed

--===============4336090728701561710==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E954C021AB
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8061.1739623336802420466
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fQh/eEma;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ThvU7SG3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019509a1891d-81eb9884-02ed-4d75-96db-a9157f2b506b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+Nl7EDqoi3NgAsldFJRR9+CWAnF3CKYK1vPOLogd3rU=;
	b=fQh/eEmawbTjoMwTjDGAunZ5DPJfBIKiq/QT4ob4+ZdVPu38laXOt4erbjIH51cn
	381PJhL8RjcasefH+lhfdN4zf1K9DHAfVTUJjXKa+mf50aBVwX4BMFvBbghM8IYLiiz
	PgLD5967maQRWNWaNjcD2bJJlPImGkNn9eExewfQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+Nl7EDqoi3NgAsldFJRR9+CWAnF3CKYK1vPOLogd3rU=;
	b=ThvU7SG3RQmMuI/IEht1DHwjqXVW8POJ2xMR0xiQFfFnTaycIKt25mRJQHffTW2N
	21XpvDUvCS/HxsBNTvFeemWPRbG8+DsZzek3YuN00S2UtFv1c/UNHOLzvJWno+2jMXj
	K3M9OVTbxj8o7d8hr16VjUAbLmLFGPRAy2wpmxjk=
Content-Type: multipart/mixed; boundary="===============0099522741003695360=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.17.0 SUCCEEDED
Message-ID: <0101019509a1891d-81eb9884-02ed-4d75-96db-a9157f2b506b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211421

--===============0099522741003695360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-babel* to *2.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.16.0-2.17.0.patch
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
From 3de66036e48d55491cccbc1baa8a6d29d2b1e38b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:30:07 +0000
Subject: [PATCH] python3-babel: upgrade 2.16.0 -> 2.17.0

---
 ...abel_2.16.0.bb => python3-babel_2.17.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.16.0.bb => python3-babel_2.17.0.bb} (35%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.16.0.bb b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
similarity index 35%
rename from meta/recipes-devtools/python/python3-babel_2.16.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.17.0.bb
index 929d7e9983..1983edbb0c 100644
--- a/meta/recipes-devtools/python/python3-babel_2.16.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2013-2024 by the Babel Team, see AUTHORS for more information.
+# +Copyright (c) 2013-2025 by the Babel Team, see AUTHORS for more information.
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions
+# 
+#
+
 SUMMARY = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e7ebed8cd9f4ff11f547e3afd024a28c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e83509a66c69efcb4f3a7d4f27fd0693"
 
-SRC_URI[sha256sum] = "d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316"
+SRC_URI[sha256sum] = "0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf0afb9d"
 
 inherit pypi setuptools3
 
-- 
2.44.1


--===============0099522741003695360==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.16.0-2.17.0.patch"

RnJvbSAzZGU2NjAzNmU0OGQ1NTQ5MWNjY2JjMWJhYThhNmQyOWQyYjFlMzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6MzA6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJhYmVsOiB1cGdyYWRlIDIuMTYuMCAtPiAyLjE3LjAKCi0tLQogLi4uYWJlbF8yLjE2
LjAuYmIgPT4gcHl0aG9uMy1iYWJlbF8yLjE3LjAuYmJ9IHwgMjMgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iYWJlbF8yLjE2LjAuYmIg
PT4gcHl0aG9uMy1iYWJlbF8yLjE3LjAuYmJ9ICgzNSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTYuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjE3LjAuYmIKc2ltaWxhcml0eSBpbmRl
eCAzNSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJh
YmVsXzIuMTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWJhYmVsXzIuMTcuMC5iYgppbmRleCA5MjlkN2U5OTgzLi4xOTgzZWRiYjBjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmFiZWxfMi4xNi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjE3LjAu
YmIKQEAgLTEsOSArMSwyOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysr
IExJQ0VOU0UKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMTMtMjAyNCBi
eSB0aGUgQmFiZWwgVGVhbSwgc2VlIEFVVEhPUlMgZm9yIG1vcmUgaW5mb3JtYXRpb24uCisjICtD
b3B5cmlnaHQgKGMpIDIwMTMtMjAyNSBieSB0aGUgQmFiZWwgVGVhbSwgc2VlIEFVVEhPUlMgZm9y
IG1vcmUgaW5mb3JtYXRpb24uCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291
cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAgbW9kaWZpY2F0aW9uLCBh
cmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCisjIAor
IworCiBTVU1NQVJZID0gIkEgY29sbGVjdGlvbiBvZiB0b29scyBmb3IgaW50ZXJuYXRpb25hbGl6
aW5nIFB5dGhvbiBhcHBsaWNhdGlvbnMiCiBIT01FUEFHRSA9ICJodHRwOi8vYmFiZWwuZWRnZXdh
bGwub3JnLyIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ZTdlYmVkOGNkOWY0ZmYxMWY1NDdlM2FmZDAyNGEyOGMiCitMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lODM1MDlhNjZjNjllZmNiNGYzYTdk
NGYyN2ZkMDY5MyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQxZjM1NTRjYTI2NjA1ZmUxNzNm
M2RlMGM2NWY3NTBmNWE0MmY5MjQ0OTliZjEzNGRlNjQyMzU4MjI5OGUzMTYiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMGM1NGNmZmIxOWY2OTBjZGNjNTJhM2I1MGJjYmY3MWUwN2E4MDhkMWM4MGQ1
NDlmMjQ1OWI5ZDJjZjBhZmI5ZCIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIu
NDQuMQoK

--===============0099522741003695360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-babel: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/babel/babel-2.16.0.tar.gz;downloadfilename=babel-2.16.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/babel/babel-2.17.0.tar.gz;downloadfilename=babel-2.17.0.tar.gz"
packages/core2-64-poky-linux/python3-babel/python3-babel-dbg: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-dbg: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-dev: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-dev: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-doc: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-doc: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-locale: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-locale: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-src: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-src: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-staticdev: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-staticdev: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel/python3-babel: PKGV changed from 2.16.0 [default] to 2.17.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel: PV changed from "2.16.0" to "2.17.0"
packages/core2-64-poky-linux/python3-babel/python3-babel: PKGSIZE changed from 29325023 to 31314473 (+7%)
packages/core2-64-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.13/site-packages/babel-2.16.0.dist-info -> /usr/lib/python3.13/site-packages/babel-2.17.0.dist-info, removed "/usr/lib/python3.13/site-packages/babel/locale-data/kok_IN.dat", added "/usr/lib/python3.13/site-packages/babel/locale-data/yue_Hant_CN.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl_KZ.dat /usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl_UZ.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab_CN.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn_UZ.dat /usr/lib/python3.13/site-packages/babel/locale-data/ltg.dat /usr/lib/python3.13/site-packages/babel/locale-data/mhn.dat /usr/lib/python3.13/site-packages/babel/locale-data/lld.dat /
 usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn_CN.dat /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hans_MY.dat /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hant_MY.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa.dat /usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl.dat /usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva_IN.dat /usr/lib/python3.13/site-packages/babel/locale-data/ltg_LV.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl.dat /usr/lib/python3.13/site-packages/babel/locale-data/lld_IT.dat /usr/lib/python3.13/site-packages/babel/locale-data/mhn_IT.dat /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn.dat /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn_IN.dat"
Changes to packages/core2-64-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.13/site-packages/babel-2.16.0.dist-info moved to /usr/lib/python3.13/site-packages/babel-2.17.0.dist-info
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl_UZ.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn_UZ.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab_CN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl_KZ.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva_IN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn_IN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/lld.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/lld_IT.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/ltg.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/ltg_LV.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/mhn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/mhn_IT.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/yue_Hant_CN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hans_MY.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hant_MY.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn_CN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_IN.dat was removed

--===============0099522741003695360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.13/site-packages/babel-2.16.0.dist-info -> /usr/lib/python3.13/site-packages/babel-2.17.0.dist-info, removed "/usr/lib/python3.13/site-packages/babel/locale-data/kok_IN.dat", added "/usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva_IN.dat /usr/lib/python3.13/site-packages/babel/locale-data/yue_Hant_CN.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn_UZ.dat /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn_IN.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl_UZ.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl.dat /usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab_CN.dat /usr/lib/python3.13/site-packages/babel/locale-data/lld_IT.dat /usr/lib/python3.13/site-packages/babel/locale-data
 /mhn_IT.dat /usr/lib/python3.13/site-packages/babel/locale-data/ltg_LV.dat /usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn_CN.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl.dat /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl_KZ.dat /usr/lib/python3.13/site-packages/babel/locale-data/lld.dat /usr/lib/python3.13/site-packages/babel/locale-data/ltg.dat /usr/lib/python3.13/site-packages/babel/locale-data/mhn.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa.dat /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn.dat /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn.dat /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hans_MY.dat /usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva.dat /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hant_MY.dat"
Changes to packages/core2-64-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.13/site-packages/babel-2.16.0.dist-info moved to /usr/lib/python3.13/site-packages/babel-2.17.0.dist-info
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Cyrl_UZ.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kaa_Latn_UZ.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab_CN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Arab.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kk_Cyrl_KZ.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Deva_IN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_Latn_IN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/lld.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/lld_IT.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/ltg.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/ltg_LV.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/mhn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/mhn_IT.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/yue_Hant_CN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hans_MY.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Hant_MY.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn_CN.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/zh_Latn.dat was added
  /usr/lib/python3.13/site-packages/babel/locale-data/kok_IN.dat was removed

--===============0099522741003695360==--


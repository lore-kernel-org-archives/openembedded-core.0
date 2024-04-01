Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FAECD12AE
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44649.1711994602160981819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HC4y5gmS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PSDmdmzc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad4855e-ee154736-7136-4f65-8f90-2fd3eedf38bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CPh6AWBlLAxE7+2tldUbehLE6mlINFVpFKN5PW2ioyE=;
	b=HC4y5gmS28IZL9/IqLSdxPTE8q6dq0F1TDu3vu9QqANeBC0krtFGDOIVtOB49ATf
	EANETWOOkZdz/F0/cZFmulffMvM40M4OyjP6gbj1EUafBBtK/eB5hT1tbanGKPGn0/c
	p7naGZz8pX8vBE78u+Sd0OtXCkEJe7MX0zk3B7YU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CPh6AWBlLAxE7+2tldUbehLE6mlINFVpFKN5PW2ioyE=;
	b=PSDmdmzcM1lIV/QdWqyfJuqWqNT+o8mKP+hEB0uZ9jCW4pujdViHwv0WjJ5U1ZHd
	ElVfEze740VjP8bGd1FiZ+9O5XVFtL0l7zpMjogSwWdTiqcq7iEf467w2/bZMl3fyP4
	QzYYiIIVTUslGMSA2OwNj2HVCP+/IsETcYEI/F/0=
Content-Type: multipart/mixed; boundary="===============6168749706296160643=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.3.280.0 SUCCEEDED
Message-ID: <0101018e9ad4855e-ee154736-7136-4f65-8f90-2fd3eedf38bc-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197793

--===============6168749706296160643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-volk* to *1.3.280.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.3.275.0-1.3.280.0.patch
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
From 495693cf5322f11e7fec297690abc26bb5795396 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:24:15 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.3.275.0 -> 1.3.280.0

---
 ..._1.3.275.0.bb => vulkan-volk_1.3.280.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.275.0.bb => vulkan-volk_1.3.280.0.bb} (56%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
similarity index 56%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
index f4e6e89aac..f109b010f0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
@@ -1,3 +1,22 @@
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
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2018-2023 Arseny Kapoulkine
+# +Copyright (c) 2018-2024 Arseny Kapoulkine
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "A meta-loader for Vulkan"
 DESCRIPTION = "Volk allows one to dynamically load entrypoints required \
 to use Vulkan without linking to vulkan-1.dll or statically linking Vulkan loader. \
@@ -7,10 +26,10 @@ BUGTRACKER = "https://github.com/zeux/volk"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=b2dd098d35668a801190a9d9d47461b0"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "f2a16e3e19c2349b873343b2dc38a1d4c25af23a"
+SRCREV = "01986ac85fa2e5c70df09aeae9c907e27c5d50b2"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============6168749706296160643==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSA0OTU2OTNjZjUzMjJmMTFlN2ZlYzI5NzY5MGFiYzI2YmI1Nzk1Mzk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDoyNDoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12b2xrOiB1cGdyYWRlIDEuMy4yNzUuMCAtPiAxLjMuMjgwLjAKCi0tLQogLi4uXzEuMy4y
NzUuMC5iYiA9PiB2dWxrYW4tdm9sa18xLjMuMjgwLjAuYmJ9IHwgMjMgKysrKysrKysrKysrKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZvbGtfMS4zLjI3NS4w
LmJiID0+IHZ1bGthbi12b2xrXzEuMy4yODAuMC5iYn0gKDU2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4yNzUuMC5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS4zLjI4MC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggNTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXZvbGtfMS4zLjI3NS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi12b2xrXzEuMy4yODAuMC5iYgppbmRleCBmNGU2ZTg5YWFjLi5mMTA5YjAxMGYw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEu
My4yNzUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xr
XzEuMy4yODAuMC5iYgpAQCAtMSwzICsxLDIyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NI
S1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRo
ZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3
IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVk
ZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZp
YSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNv
cHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElD
RU5TRS5tZAorIyArKysgTElDRU5TRS5tZAorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdo
dCAoYykgMjAxOC0yMDIzIEFyc2VueSBLYXBvdWxraW5lCisjICtDb3B5cmlnaHQgKGMpIDIwMTgt
MjAyNCBBcnNlbnkgS2Fwb3Vsa2luZQorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFu
dGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICBv
ZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAi
U29mdHdhcmUiKSwgdG8gZGVhbAorIyAKKyMKKwogU1VNTUFSWSA9ICJBIG1ldGEtbG9hZGVyIGZv
ciBWdWxrYW4iCiBERVNDUklQVElPTiA9ICJWb2xrIGFsbG93cyBvbmUgdG8gZHluYW1pY2FsbHkg
bG9hZCBlbnRyeXBvaW50cyByZXF1aXJlZCBcCiB0byB1c2UgVnVsa2FuIHdpdGhvdXQgbGlua2lu
ZyB0byB2dWxrYW4tMS5kbGwgb3Igc3RhdGljYWxseSBsaW5raW5nIFZ1bGthbiBsb2FkZXIuIFwK
QEAgLTcsMTAgKzI2LDEwIEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3pldXgv
dm9sayIKIFNFQ1RJT04gPSAibGlicyIKIAogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1iMmRkMDk4ZDM1NjY4YTgwMTE5MGE5ZDlkNDc0
NjFiMCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTEyZTZhZjNh
MGUyYTVlNWRiZjc3OTZhYTgyYjY0NjI2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
emV1eC92b2xrLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImYy
YTE2ZTNlMTljMjM0OWI4NzMzNDNiMmRjMzhhMWQ0YzI1YWYyM2EiCitTUkNSRVYgPSAiMDE5ODZh
Yzg1ZmEyZTVjNzBkZjA5YWVhZTljOTA3ZTI3YzVkNTBiMiIKIAogUyA9ICIke1dPUktESVJ9L2dp
dCIKIAotLSAKMi40Mi4wCgo=

--===============6168749706296160643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 369770 to 387180 (+5%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 361743 to 379153 (+5%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 646736 to 646776 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]

--===============6168749706296160643==--


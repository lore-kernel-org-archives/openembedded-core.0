Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A183C52D1F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13583.1713248037832778467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZCTgTxQB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JnF1VTH2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a9a65-6c638025-83e1-4ee7-a48d-22c26b323689-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rg89UKEvHXOy/jFwCIAMiL5i8XKiqhbFl4itNQHIhJI=;
	b=ZCTgTxQBPfGarlJPSjSKnth7Wql+CqdHAZUo3Vq3N/b3+Rz0vGjcyCf7b/oDAoIg
	ZlKBUGFtEp1RqMm0+HQXEoUiQiduxY9dr/TO+2LeheTjPniTZnVCksDCIdGK/IHKDWJ
	dBh1N/ilfiQMbqKqA1XVfxZ+L1v7N51RmUEqomwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rg89UKEvHXOy/jFwCIAMiL5i8XKiqhbFl4itNQHIhJI=;
	b=JnF1VTH2wGTpDX143Vd4OH4aiyj7lQ/kkw4+yoiYyvHa9i3KWNOtKCSkH+Du8XH8
	f8P01qWZkeyWH5dSbq1DTXEtSbQdTXsxY5XefMXd5hAJ8jAt5t7BHI6sYde3CTGeszM
	fx8vrKM0Xs3DNY7MUPGC7XoHzgs6Qlp0wVe2Mg78=
Content-Type: multipart/mixed; boundary="===============7708457100775145783=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.3.280.0 SUCCEEDED
Message-ID: <0101018ee58a9a65-6c638025-83e1-4ee7-a48d-22c26b323689-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198364

--===============7708457100775145783==
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
From 6e1d6bf9f2158e1e54f322d40c70fb6ff99d6810 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:03:00 +0000
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


--===============7708457100775145783==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSA2ZTFkNmJmOWYyMTU4ZTFlNTRmMzIyZDQwYzcwZmI2ZmY5OWQ2ODEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6MDM6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjMuMjc1LjAgLT4gMS4zLjI4MC4wCgotLS0KIC4uLl8xLjMu
Mjc1LjAuYmIgPT4gdnVsa2FuLXZvbGtfMS4zLjI4MC4wLmJifSB8IDIzICsrKysrKysrKysrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12b2xrXzEuMy4yNzUu
MC5iYiA9PiB2dWxrYW4tdm9sa18xLjMuMjgwLjAuYmJ9ICg1NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMuMjc1LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4yODAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDU2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1
bGthbi12b2xrXzEuMy4yNzUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdm9sa18xLjMuMjgwLjAuYmIKaW5kZXggZjRlNmU4OWFhYy4uZjEwOWIwMTBm
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18x
LjMuMjc1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9s
a18xLjMuMjgwLjAuYmIKQEAgLTEsMyArMSwyMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19D
SEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBU
aGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5l
dyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVl
ZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2
aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBj
b3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJ
Q0VOU0UubWQKKyMgKysrIExJQ0VOU0UubWQKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmln
aHQgKGMpIDIwMTgtMjAyMyBBcnNlbnkgS2Fwb3Vsa2luZQorIyArQ29weXJpZ2h0IChjKSAyMDE4
LTIwMjQgQXJzZW55IEthcG91bGtpbmUKKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3Jh
bnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAg
b2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUg
IlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgCisjCisKIFNVTU1BUlkgPSAiQSBtZXRhLWxvYWRlciBm
b3IgVnVsa2FuIgogREVTQ1JJUFRJT04gPSAiVm9sayBhbGxvd3Mgb25lIHRvIGR5bmFtaWNhbGx5
IGxvYWQgZW50cnlwb2ludHMgcmVxdWlyZWQgXAogdG8gdXNlIFZ1bGthbiB3aXRob3V0IGxpbmtp
bmcgdG8gdnVsa2FuLTEuZGxsIG9yIHN0YXRpY2FsbHkgbGlua2luZyBWdWxrYW4gbG9hZGVyLiBc
CkBAIC03LDEwICsyNiwxMCBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS96ZXV4
L3ZvbGsiCiBTRUNUSU9OID0gImxpYnMiCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9YjJkZDA5OGQzNTY2OGE4MDExOTBhOWQ5ZDQ3
NDYxYjAiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT0xMmU2YWYz
YTBlMmE1ZTVkYmY3Nzk2YWE4MmI2NDYyNiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L3pldXgvdm9say5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJm
MmExNmUzZTE5YzIzNDliODczMzQzYjJkYzM4YTFkNGMyNWFmMjNhIgorU1JDUkVWID0gIjAxOTg2
YWM4NWZhMmU1YzcwZGYwOWFlYWU5YzkwN2UyN2M1ZDUwYjIiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDIuMAoK

--===============7708457100775145783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 369770 to 387180 (+5%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 361743 to 379153 (+5%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 646736 to 646776 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]

--===============7708457100775145783==--


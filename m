Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29518C15504
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8491.1698848704568825964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RSAv0MjV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NJuhICnX;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b46057a-eba36aff-adb8-4f3b-9fe8-2f263f6bb4b9-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lfazvckoWm4vJayWtBWa/QIgv/54AYvQGtYm3vXIPKI=;
	b=RSAv0MjVZD5p9qcOZhVrfbe/cW2+hQR/2+h441RIPmxWU51T9qvNmXWN6NQOQUaU
	4WI+lTbIldl+Vt0hLQMGV+wDueyIQE1hgjk8xs6nVAFbTK8fjC1a20Qh1BPVPGy0HZv
	NKdxbXCHZ8Jxy87IawrD+iQsnp0FlbKc60Ri5hCY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lfazvckoWm4vJayWtBWa/QIgv/54AYvQGtYm3vXIPKI=;
	b=NJuhICnXgvpYOgBGk6XCdFcC0S/GJ6qXPRx2UpdO9EbWIzZqU5NSkWhE+OwHFJMx
	zm68nA4cso+Ko4m2khSIG3uwMi1gfpRnGw2p8fR2A6dP0kb3I7t1U5CvI/k9zKNm5NB
	InVXCOr+GlkMNaUP3ianEguQ45EiUpjc6BckMimA=
Content-Type: multipart/mixed; boundary="===============0866679674451768563=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyrsistent: upgrading to 0.20.0 SUCCEEDED
Message-ID: <0101018b8b46057a-eba36aff-adb8-4f3b-9fe8-2f263f6bb4b9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189964

--===============0866679674451768563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyrsistent* to *0.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyrsistent-upgrade-0.19.3-0.20.0.patch
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
From 102c6f7ad3969d7d163db2ff79762b139f2342f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:24:26 +0000
Subject: [PATCH] python3-pyrsistent: upgrade 0.19.3 -> 0.20.0

---
 ...0.19.3.bb => python3-pyrsistent_0.20.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyrsistent_0.19.3.bb => python3-pyrsistent_0.20.0.bb} (25%)

diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
similarity index 25%
rename from meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb
rename to meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
index 05654c348d..ba09fd0b25 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.mit
+# +++ LICENSE.mit
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2022 Tobias Gustafsson
+# +Copyright (c) 2023 Tobias Gustafsson
+#  
+#  Permission is hereby granted, free of charge, to any person
+#  obtaining a copy of this software and associated documentation
+# 
+#
+
 SUMMARY = "Persistent/Immutable/Functional data structures for Python"
 HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e"
+LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=f798dc4222a29fea881fa998cdf4a8c8"
 
-SRC_URI[sha256sum] = "1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440"
+SRC_URI[sha256sum] = "4c48f78f62ab596c679086084d0dd13254ae4f3d6c72a83ffdf5ebdef8f265a4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


--===============0866679674451768563==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyrsistent-upgrade-0.19.3-0.20.0.patch"

RnJvbSAxMDJjNmY3YWQzOTY5ZDdkMTYzZGIyZmY3OTc2MmIxMzlmMjM0MmY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToyNDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlyc2lzdGVudDogdXBncmFkZSAwLjE5LjMgLT4gMC4yMC4wCgotLS0KIC4uLjAuMTku
My5iYiA9PiBweXRob24zLXB5cnNpc3RlbnRfMC4yMC4wLmJifSB8IDIzICsrKysrKysrKysrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlyc2lzdGVudF8w
LjE5LjMuYmIgPT4gcHl0aG9uMy1weXJzaXN0ZW50XzAuMjAuMC5iYn0gKDI1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjE5
LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8w
LjIwLjAuYmIKc2ltaWxhcml0eSBpbmRleCAyNSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5cnNpc3RlbnRfMC4xOS4zLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjIwLjAuYmIKaW5k
ZXggMDU2NTRjMzQ4ZC4uYmEwOWZkMGIyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5cnNpc3RlbnRfMC4xOS4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXJzaXN0ZW50XzAuMjAuMC5iYgpAQCAtMSw5ICsx
LDI4IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5taXQKKyMgKysrIExJQ0VOU0Uu
bWl0CisjIEBAIC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDIyIFRvYmlhcyBHdXN0
YWZzc29uCisjICtDb3B5cmlnaHQgKGMpIDIwMjMgVG9iaWFzIEd1c3RhZnNzb24KKyMgIAorIyAg
UGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJz
b24KKyMgIG9idGFpbmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBk
b2N1bWVudGF0aW9uCisjIAorIworCiBTVU1NQVJZID0gIlBlcnNpc3RlbnQvSW1tdXRhYmxlL0Z1
bmN0aW9uYWwgZGF0YSBzdHJ1Y3R1cmVzIGZvciBQeXRob24iCiBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vdG9iZ3UvcHlyc2lzdGVudCIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5taXQ7bWQ1PWI2OTVlYjljNmU3YTZmYjFiMWJjMmQx
OTNjNDI3NzZlIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5taXQ7bWQ1PWY3
OThkYzQyMjJhMjlmZWE4ODFmYTk5OGNkZjRhOGM4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MWEyOTk0NzczNzA2YmJiNDk5NWMzMWE5N2JjOTRmMTQxODMxNDkyM2JkMTA0OGM2ZDk2NDgzNzA0
MDM3NjQ0MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0YzQ4Zjc4ZjYyYWI1OTZjNjc5MDg2MDg0
ZDBkZDEzMjU0YWU0ZjNkNmM3MmE4M2ZmZGY1ZWJkZWY4ZjI2NWE0IgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjM5LjIKCg==

--===============0866679674451768563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyrsistent: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyrsistent/pyrsistent-0.19.3.tar.gz;downloadfilename=pyrsistent-0.19.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyrsistent/pyrsistent-0.20.0.tar.gz;downloadfilename=pyrsistent-0.20.0.tar.gz"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-dbg: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-dbg: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-dbg: PKGSIZE changed from 83520 to 83608 (+0%)
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-dev: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-dev: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-doc: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-doc: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-locale: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-locale: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-src: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-src: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-src: PKGSIZE changed from 49792 to 49802 (+0%)
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-staticdev: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent-staticdev: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent: PKGV changed from 0.19.3 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent: PV changed from "0.19.3" to "0.20.0"
packages/core2-64-poky-linux/python3-pyrsistent/python3-pyrsistent: PKGSIZE changed from 442957 to 450755 (+2%)
Changes to packages/core2-64-poky-linux/python3-pyrsistent (sysroot):
  /usr/lib/python3.11/site-packages/pyrsistent-0.19.3.dist-info moved to /usr/lib/python3.11/site-packages/pyrsistent-0.20.0.dist-info

--===============0866679674451768563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyrsistent (sysroot):
  /usr/lib/python3.11/site-packages/pyrsistent-0.19.3.dist-info moved to /usr/lib/python3.11/site-packages/pyrsistent-0.20.0.dist-info

--===============0866679674451768563==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C31C3ABA6
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20156.1744723977141998501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KVpk1q/Z;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=T8LjGkoW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019639a720e6-aea3d74f-2f43-4121-a32d-9e115109c3c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DpyEMt8qj1RLKKMeDCdwt8jyXS/utPnLe5kvMmxRWAQ=;
	b=KVpk1q/Zq0tJf2U46Jm4L65XFi4YjvvYCvg2gfXDkBNssf4H1z4Se5lj6USO0+fX
	KHByilBrbBggYxOD8fEo2Zk3vOOaTe2HDeX65w7vNNq3V6HvcOhOA5lsq0lcRlhRryN
	D6tarZRDc/dFHA/DoqenIqG6BmueApoSFBz8OfKA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DpyEMt8qj1RLKKMeDCdwt8jyXS/utPnLe5kvMmxRWAQ=;
	b=T8LjGkoWAI5H9gEDBDGkSPLxDsw3BuWhb4vrU6xVDZqzneW/lSBslvhlT9XQF4qV
	+z3CrEqQEp2RwO/OR/382wiW47L3jlgyJ7eYyvpaS9L1usD5PhO6FsroMFMdi8EFf2m
	o+88GkMd1TDE5zfo9Ev5DYCXCs3u6JHhTQv8nxjE=
Content-Type: multipart/mixed; boundary="===============6731368930233266193=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.4.4 SUCCEEDED
Message-ID: <0101019639a720e6-aea3d74f-2f43-4121-a32d-9e115109c3c8-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214880

--===============6731368930233266193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.3-2.4.4.patch
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
From c761099ea7acb8a64b3e448ee72796d2e73350f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:34:33 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.3 -> 2.4.4

---
 ...ython3-pdm-backend_2.4.3.bb => python3-pdm-backend_2.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.3.bb => python3-pdm-backend_2.4.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
index 46440c9d5d..71275f3ee8 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728"
+SRC_URI[sha256sum] = "f72551eeb319f74ca25856c24fb4026684eeb0dddd9df68482901ab0dc481258"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============6731368930233266193==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.3-2.4.4.patch"

RnJvbSBjNzYxMDk5ZWE3YWNiOGE2NGIzZTQ0OGVlNzI3OTZkMmU3MzM1MGY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6MzQ6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1iYWNrZW5kOiB1cGdyYWRlIDIuNC4zIC0+IDIuNC40CgotLS0KIC4uLnl0aG9u
My1wZG0tYmFja2VuZF8yLjQuMy5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNC40LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjMuYmIgPT4gcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNC5iYn0gKDgyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjQuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjQuYmIKaW5kZXgg
NDY0NDBjOWQ1ZC4uNzEyNzVmM2VlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNC5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTRhNTY0Mjk3YjNjNWI2MjlhNTI4YjkyZmQ4ZmY2
MWVhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGJkOTA0N2E3YWMxMGQxMWE1MjI3ZTk3MTYz
YjYxN2FkNWQ2NjUwNTA0NzZmZjYzODY3ZDk3MTc1ODIwMDcyOCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmNzI1NTFlZWIzMTlmNzRjYTI1ODU2YzI0ZmI0MDI2Njg0ZWViMGRkZGQ5ZGY2ODQ4Mjkw
MWFiMGRjNDgxMjU4IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0
YQogCi0tIAoyLjQ3LjEKCg==

--===============6731368930233266193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm-backend: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.3.tar.gz;downloadfilename=pdm_backend-2.4.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.4.tar.gz;downloadfilename=pdm_backend-2.4.4.tar.gz"
packages/core2-64-poky-linux/python3-pdm-backend: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.3" to "2.4.4"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 755661 to 757509 (+0%)
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
Changes to packages/core2-64-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.13/site-packages/pdm_backend-2.4.3.dist-info moved to /usr/lib/python3.13/site-packages/pdm_backend-2.4.4.dist-info

--===============6731368930233266193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.13/site-packages/pdm_backend-2.4.3.dist-info moved to /usr/lib/python3.13/site-packages/pdm_backend-2.4.4.dist-info

--===============6731368930233266193==--


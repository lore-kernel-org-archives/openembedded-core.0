Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD48EC2BB85
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13435.1713248038923158842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hqRe+CuA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=s0gg5DYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58a6f38-01bb8033-b16a-4bfa-90e0-0787d5f7cdc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MCLa1j73hdAFe4IFEEkw/iFO1Tm7x3/8Hl3SjZ0uadA=;
	b=hqRe+CuAX87ba4njYtNL0qmB2eguJNbipWJZVTOcfukik+U+u2L2aLpvhifkznDA
	ew0hkE8eacuLEcxXFzUA+WIUKRo6fJoHkT+N7i4WXT0p31MWvV4c2U9uDdUF4uMxXxM
	PBb2/wjfYRgMXRtB0rsx0f25dkNKYANoV3J1Yl3Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MCLa1j73hdAFe4IFEEkw/iFO1Tm7x3/8Hl3SjZ0uadA=;
	b=s0gg5DYDCkFCiRfVoTenrCn32Ep40KJRFZx0N7UA/rMROkfP1gbneBVN0Y8CkC5e
	xxZGeDl2a7vepJxqGRIJ9Jv6euSryKY4uyXI/Px15XRveqcDp2ih+lZ7y9rjVfjKam9
	Ew1uU9rawjfl7wtVxBcHioYHpKBX7ccdPowwME50=
Content-Type: multipart/mixed; boundary="===============4747253156543408141=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 24.0 SUCCEEDED
Message-ID: <0101018ee58a6f38-01bb8033-b16a-4bfa-90e0-0787d5f7cdc3-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198300

--===============4747253156543408141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-packaging* to *24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-23.2-24.0.patch
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
From 9cb0423ccfaf541ede6a9f734a41f3189e914f43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:29:54 +0000
Subject: [PATCH] python3-packaging: upgrade 23.2 -> 24.0

---
 .../{python3-packaging_23.2.bb => python3-packaging_24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_23.2.bb => python3-packaging_24.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-packaging_23.2.bb b/meta/recipes-devtools/python/python3-packaging_24.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-packaging_23.2.bb
rename to meta/recipes-devtools/python/python3-packaging_24.0.bb
index 2d35936615..0942eeb15e 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "048fb0e9405036518eaaf48a55953c750c11e1a1b68e0dd1a9d62ed0c092cfc5"
+SRC_URI[sha256sum] = "eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============4747253156543408141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.12/site-packages/packaging-23.2.dist-info moved to /usr/lib/python3.12/site-packages/packaging-24.0.dist-info

--===============4747253156543408141==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-23.2-24.0.patch"

RnJvbSA5Y2IwNDIzY2NmYWY1NDFlZGU2YTlmNzM0YTQxZjMxODllOTE0ZjQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6Mjk6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyMy4yIC0+IDI0LjAKCi0tLQogLi4uL3tweXRob24z
LXBhY2thZ2luZ18yMy4yLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzI0LjAuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjMuMi5iYiA9
PiBweXRob24zLXBhY2thZ2luZ18yNC4wLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjQuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGFja2FnaW5nXzIzLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYWNrYWdpbmdfMjQuMC5iYgppbmRleCAyZDM1OTM2NjE1Li4wOTQyZWViMTVl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2Fn
aW5nXzIzLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
Y2thZ2luZ18yNC4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9wYWNrYWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgfCBCU0QtMi1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA0OGZiMGU5NDA1
MDM2NTE4ZWFhZjQ4YTU1OTUzYzc1MGMxMWUxYTFiNjhlMGRkMWE5ZDYyZWQwYzA5MmNmYzUiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZWI4MmM1ZTNlNTYyMDkwNzQ3NjZlNjg4NWJiMDRiOGMzOGEw
YzAxNWQwYTMwMDM2ZWJlN2VjZTM0Yzk5ODllOSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0
X2NvcmUKIAotLSAKMi40Mi4wCgo=

--===============4747253156543408141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-packaging: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.2.tar.gz;downloadfilename=packaging-23.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-24.0.tar.gz;downloadfilename=packaging-24.0.tar.gz"
packages/core2-64-poky-linux/python3-packaging: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-src: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 346314 to 349410 (+1%)
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PV changed from "23.2" to "24.0"
Changes to packages/core2-64-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.12/site-packages/packaging-23.2.dist-info moved to /usr/lib/python3.12/site-packages/packaging-24.0.dist-info

--===============4747253156543408141==--


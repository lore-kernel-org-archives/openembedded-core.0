Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACAECA0ECF
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.12169.1752594936216481472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fNlfyq1A;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iKNjZ/Zr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101980ecc86ba-bc83ea31-77f6-4ffe-a73b-2a2cdfb5cb41-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594941;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lvUs5Q6Nfbl2YekrtZHVNBYzVUIL2qWWi62SZ+PQHQI=;
	b=fNlfyq1AfmWINY5bw/uB8MMTnGYHMWQBdMmtbfmlcYOOqFETM7xZ8bWMaaHORefC
	Q+ScRnDBhIWbvG1eEH5c0poOMNGgALRt4lb3QiJ/pU6tYJPVisJ6SXf600DTGeg+cSB
	pkzkJL11oY5hSLp1nxrfkSuxUR9O/7+tJ3L2gF8E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594941;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lvUs5Q6Nfbl2YekrtZHVNBYzVUIL2qWWi62SZ+PQHQI=;
	b=iKNjZ/ZrE/uoAZJ3nBNzSYfiHY0aY9x03AeHEMGlKKJL0t4Nplkl6i8tzkSdVzBP
	SooutDLcV8BvtI5QGlRXFPE3oh+WJ+Sdfbvagiqjg6oKB7klf2lh8NrznkzZTYFeEld
	HCXnVO7CvC31cDpXnYSrzoEexOIoiFLJEYkE7DmE=
Content-Type: multipart/mixed; boundary="===============4088594214063691401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.4.5 SUCCEEDED
Message-ID: <010101980ecc86ba-bc83ea31-77f6-4ffe-a73b-2a2cdfb5cb41-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220346

--===============4088594214063691401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.4-2.4.5.patch
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
From e01ded6df1b80a0b9299cad6efdf3e0accd97bfc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:10:16 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.4 -> 2.4.5

---
 ...ython3-pdm-backend_2.4.4.bb => python3-pdm-backend_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.4.bb => python3-pdm-backend_2.4.5.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
index 71275f3ee8..e0fe16bd71 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "f72551eeb319f74ca25856c24fb4026684eeb0dddd9df68482901ab0dc481258"
+SRC_URI[sha256sum] = "56c019c440308adad5d057c08cbb777e65f43b991a3b0920749781258972fe5b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4088594214063691401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm-backend: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.4.tar.gz;downloadfilename=pdm_backend-2.4.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.5.tar.gz;downloadfilename=pdm_backend-2.4.5.tar.gz"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 757509 to 757534 (+0%)
packages/core2-64-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
Changes to packages/core2-64-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.13/site-packages/pdm_backend-2.4.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info

--===============4088594214063691401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.13/site-packages/pdm_backend-2.4.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info

--===============4088594214063691401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.4-2.4.5.patch"

RnJvbSBlMDFkZWQ2ZGYxYjgwYTBiOTI5OWNhZDZlZmRmM2UwYWNjZDk3YmZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6MTA6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1iYWNrZW5kOiB1cGdyYWRlIDIuNC40IC0+IDIuNC41CgotLS0KIC4uLnl0aG9u
My1wZG0tYmFja2VuZF8yLjQuNC5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNC41LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjQuYmIgPT4gcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNS5iYn0gKDgyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjUuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC40LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjUuYmIKaW5kZXgg
NzEyNzVmM2VlOC4uZTBmZTE2YmQ3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNS5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTRhNTY0Mjk3YjNjNWI2MjlhNTI4YjkyZmQ4ZmY2
MWVhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjcyNTUxZWViMzE5Zjc0Y2EyNTg1NmMyNGZi
NDAyNjY4NGVlYjBkZGRkOWRmNjg0ODI5MDFhYjBkYzQ4MTI1OCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI1NmMwMTljNDQwMzA4YWRhZDVkMDU3YzA4Y2JiNzc3ZTY1ZjQzYjk5MWEzYjA5MjA3NDk3
ODEyNTg5NzJmZTViIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0
YQogCi0tIAoyLjQ3LjEKCg==

--===============4088594214063691401==--


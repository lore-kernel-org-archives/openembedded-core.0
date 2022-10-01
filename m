Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936A1C3A59F
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.345.1664643227257295476
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WyLyJLdO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101839477dabc-1daaa207-7ccd-441e-847a-8fd5b3fd7691-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XNjBsDVctMdHgI/vciA3zD3BKAsKHDR3TBsJj9LkJMk=;
	b=WyLyJLdOfK5IXLl1R9PiEw3lrL/JDjyTyzY8KnkBTzSBbuUyzvBjAFOKRvyTEC9w
	lL1+xklMxGO+TohULks7Z7Ps/t7rqrYgpCAtqPS/bvSP+GoYs71+8Ir03vH/xr1Pa3E
	h32W31uD75/Qs4K3mc/BMVnZKff/rsEuRWeJ3tPI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XNjBsDVctMdHgI/vciA3zD3BKAsKHDR3TBsJj9LkJMk=;
	b=lCgcfewqfbPOS9DfyZH4ESLvRAwXlRDj4/hihpWEze24NYyahIntbOzvVOAekpb9
	lBm3J2rkJAoQ/S2Yf5Fm6PVOm6hLU4cHCHzsT9YBSOKqx2KIm3WNtij01jkJ7d8Ssp1
	NGtEszfFGPpW328EHBnXDRIYeg7XuhqOIHWuH7HA=
Content-Type: multipart/mixed; boundary="===============4184458101229654974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2022.9.24 SUCCEEDED
Message-ID: 
 <010101839477dabc-1daaa207-7ccd-441e-847a-8fd5b3fd7691-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171270

--===============4184458101229654974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2022.9.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2022.9.14-2022.9.24.patch
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
--===============4184458101229654974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.10/site-packages/certifi-2022.9.14.dist-info moved to /usr/lib/python3.10/site-packages/certifi-2022.9.24.dist-info

--===============4184458101229654974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-certifi: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.9.14.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.9.24.tar.gz"
packages/core2-32-poky-linux/python3-certifi: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 301096 to 298454 (-1%)
Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.10/site-packages/certifi-2022.9.14.dist-info moved to /usr/lib/python3.10/site-packages/certifi-2022.9.24.dist-info

--===============4184458101229654974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2022.9.14-2022.9.24.patch"

RnJvbSBjMjZjN2ZjMGFhZWY0ZjYwYTM1ZGIyY2VkODYxZGRkMmU2Zjg0NzdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNzo1NTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDIyLjkuMTQgLT4gMjAyMi45LjI0CgotLS0KIC4uLnl0
aG9uMy1jZXJ0aWZpXzIwMjIuOS4xNC5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyMi45LjI0LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2VydGlmaV8yMDIy
LjkuMTQuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4yNC5iYn0gKDg2JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjku
MTQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIy
LjkuMjQuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45LjE0LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjkuMjQuYmIKaW5k
ZXggMTE3YTMyYjFkNC4uYTZiNzQ2NzA1MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45LjE0LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4yNC5iYgpAQCAtNyw3ICs3
LDcgQEAgSE9NRVBBR0UgPSAiIGh0dHA6Ly9jZXJ0aWZpLmlvLyIKIExJQ0VOU0UgPSAiSVNDIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2MyYjc0MDQzNjljNTg3YzM1
NTlhZmI2MDRmY2UyZjIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzNjk3Mzg4NWI5NTQyZTZi
ZDAxZGVhMjg3YjJiNGIzYjIxMjM2MzA3YzU2MzI0ZmNjM2YxMTYwZjJkNjU1ZWQ1IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjBkOWM2MDExMjRlNWE2YmE5NzEyZGJjNjBkOWM1M2MyMWUzNGY1ZjY0
MWZlODMwMDIzMTczOTQzMTFiZGNlMTQiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0t
IAoyLjMxLjEKCg==

--===============4184458101229654974==--


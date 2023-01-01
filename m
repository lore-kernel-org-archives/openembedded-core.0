Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62913C54EF1
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20663.1672605966778140874
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l1Ij+KIb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101856f159ecf-87c4f4d7-5703-4f44-85ea-c6093b66e707-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eZGQ6ducOEjP0PEqzan4d80wm/gf4eGW66t3CDXDgSU=;
	b=l1Ij+KIbftiUey/U3G+WiIa6p36PpTl/4W3352SaPMfUhacFRekr2fx99GKN+SEw
	opmKSG3xlGTyOYVS6BCFm84hkUxvledwA4OZTVMhFCoC9HqLCQg+BOCaRilRJuHE27j
	CiM6Gb5p3PPzlr7Ed+jHNCwutP89fqUmBkI08+xA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eZGQ6ducOEjP0PEqzan4d80wm/gf4eGW66t3CDXDgSU=;
	b=jEKoxHBYFv+Xjx5QvXTnlNhOv5L5ysqSLCh6N2SwXEo7zN4/vPnxNMeYsC6R4rmi
	Ib5xnMWDBlIiu4PKEQ6BWgtSSqT1cz9idBXC47dECO22ZmpmE19wfPOWMWlRmmryvU7
	ZSoQuug/XwBG/uYhFIScZ7JswhetSoGXUV25cSPE=
Content-Type: multipart/mixed; boundary="===============4284894631953798026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2022.12.7 SUCCEEDED
Message-ID: <010101856f159ecf-87c4f4d7-5703-4f44-85ea-c6093b66e707-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175247

--===============4284894631953798026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2022.12.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2022.9.24-2022.12.7.patch
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
--===============4284894631953798026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/WHEEL was removed

--===============4284894631953798026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2022.9.24-2022.12.7.patch"

RnJvbSA1OTgyZjc4ZWNhN2E0ZDc1ZWVmNTI5Y2YxYjNkODIwNTM3NTViZjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwODowNTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDIyLjkuMjQgLT4gMjAyMi4xMi43CgotLS0KIC4uLnl0
aG9uMy1jZXJ0aWZpXzIwMjIuOS4yNC5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyMi4xMi43LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2VydGlmaV8yMDIy
LjkuMjQuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjIuMTIuNy5iYn0gKDg2JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjku
MjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIy
LjEyLjcuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45LjI0LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjEyLjcuYmIKaW5k
ZXggYTZiNzQ2NzA1Mi4uZGNhM2QyNjgxMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45LjI0LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuMTIuNy5iYgpAQCAtNyw3ICs3
LDcgQEAgSE9NRVBBR0UgPSAiIGh0dHA6Ly9jZXJ0aWZpLmlvLyIKIExJQ0VOU0UgPSAiSVNDIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2MyYjc0MDQzNjljNTg3YzM1
NTlhZmI2MDRmY2UyZjIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwZDljNjAxMTI0ZTVhNmJh
OTcxMmRiYzYwZDljNTNjMjFlMzRmNWY2NDFmZTgzMDAyMzE3Mzk0MzExYmRjZTE0IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjM1ODI0YjRjM2E5NzExNTk2NGI0MDg4NDRkNjRhYTE0ZGIxY2M1MThm
NjU2MmU4ZDcyNjE2OTlkMTM1MGE5ZTMiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0t
IAoyLjM3LjMKCg==

--===============4284894631953798026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-certifi: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.9.24.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.12.7.tar.gz"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 300049 to 288912 (-4%)
Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/WHEEL was removed

--===============4284894631953798026==--


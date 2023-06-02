Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EDFCA9ED4
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7525.1685693431666895453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ArfVpItx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b288019-77ddd459-1a00-45bf-a39c-01f19df142c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w+wR2E+HhiivXv1Gm7XEb2zmM0bIpAnVy11TUDWXC3s=;
	b=ArfVpItxEU2JFlNWLK/pCfhaQiJNb5L8shbSFJJIRIvdVEktgzMzr6U6rvq+V2Kg
	Mgs0ohTIX12U9Fwa0xb0GRClSMnANHJxD0zTeHQ9ksXqaoUri4UDLZDmJU0WgSFlx/H
	encm1jqKfAFgW4UfhiXedVqR8gPPLM8nuCe7F0Rs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w+wR2E+HhiivXv1Gm7XEb2zmM0bIpAnVy11TUDWXC3s=;
	b=Ojhmgbz2RK+fWLXnnCys+2oB+XBD8w3vjXrR+KfpW6njMXss+KX0rpTeqZsoCK5/
	YrV9ZzMuPAbAzaRxvms6ySret85tko7W0r6hXCVA+76YYfYP5Lalbf2XpQkMSMRDdeI
	pEAGo/0P6N/ofsDclpryDyYhwK/rdff3YKf/kePc=
Content-Type: multipart/mixed; boundary="===============5393181073677549646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2023.5.7 SUCCEEDED
Message-ID: <010101887b288019-77ddd459-1a00-45bf-a39c-01f19df142c6-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182192

--===============5393181073677549646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2023.5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2022.12.7-2023.5.7.patch
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
--===============5393181073677549646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2022.12.7-2023.5.7.patch"

RnJvbSAzNjI0NTNmYjYzNjU1NmYzZjlmMmI3MTdkZWEzMTQ2MGQ4ZGQzNDJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMzoyNDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDIyLjEyLjcgLT4gMjAyMy41LjcKCi0tLQogLi4ucHl0
aG9uMy1jZXJ0aWZpXzIwMjIuMTIuNy5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyMy41LjcuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jZXJ0aWZpXzIwMjIu
MTIuNy5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyMy41LjcuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi4xMi43
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMy41
LjcuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi4xMi43LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIzLjUuNy5iYgppbmRleCBi
MmUzZWMxMjVhLi45MjRiMDVjMTJjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjEyLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMy41LjcuYmIKQEAgLTcsNyArNyw3IEBA
IEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNjMmI3NDA0MzY5YzU4N2MzNTU5YWZi
NjA0ZmNlMmYyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzU4MjRiNGMzYTk3MTE1OTY0YjQw
ODg0NGQ2NGFhMTRkYjFjYzUxOGY2NTYyZThkNzI2MTY5OWQxMzUwYTllMyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIwZjBkNTZkYzVhNmFkNTZmZDRiYTM2NDg0ZDZjYzM0NDUxZTFjNjU0OGM2MWRh
YWQ4YzMyMDE2OWY5MWVkZGM3IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi4z
OS4yCgo=

--===============5393181073677549646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was removed

--===============5393181073677549646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-certifi: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.12.7.tar.gz;downloadfilename=certifi-2022.12.7.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2023.5.7.tar.gz;downloadfilename=certifi-2023.5.7.tar.gz"
packages/core2-32-poky-linux/python3-certifi: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 288912 to 291905 (+1%)
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was removed

--===============5393181073677549646==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BA1C71136
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20184.1672605967779477443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cmmR7seo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101856f15a28d-d94f0fc1-a684-4672-a007-32557f6a0dbf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=evaoAYLy/vdXAvLKLT3vnAf3xCghiR+8ozL8V1RuccY=;
	b=cmmR7seoi2INDy/rhF+lcuzcWvdcj/74XyBL1h53asUv0Tls8uxCMhQWsrkkl6AM
	HcnGQjLeWAdwRZ070W6IEtcNjAXpSPASLgVZ2KsajeDhkjrWk9Y39w+xTbsXhn0Q787
	sz+h+yHt1sSjX/cAi0S9C2dsvryA8WIw58FUmqU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=evaoAYLy/vdXAvLKLT3vnAf3xCghiR+8ozL8V1RuccY=;
	b=j4SB+pNe3bJSBwoiRHiNVIv7IlD9TTaCns8MowYGWIXOZRtGCZp3wAZNH8J4Qpe8
	v6mXpxV77gIh5e1Kkq8Zwun/JE5o/lr1xbTqPoso8GEb742K94qJGjoIQ/efkcvBav8
	NJVp+bsb9gl+r4Jcc/cpybT4KJWQRtq0uAoro3tA=
Content-Type: multipart/mixed; boundary="===============0222911577518629454=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyrsistent: upgrading to 0.19.3 SUCCEEDED
Message-ID: <010101856f15a28d-d94f0fc1-a684-4672-a007-32557f6a0dbf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175275

--===============0222911577518629454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyrsistent* to *0.19.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyrsistent-upgrade-0.19.2-0.19.3.patch
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
--===============0222911577518629454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pyrsistent (sysroot):
  /usr/lib/python3.11/site-packages/pyrsistent-0.19.2.dist-info moved to /usr/lib/python3.11/site-packages/pyrsistent-0.19.3.dist-info

--===============0222911577518629454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyrsistent: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyrsistent/pyrsistent-0.19.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyrsistent/pyrsistent-0.19.3.tar.gz"
packages/core2-32-poky-linux/python3-pyrsistent: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dbg: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dbg: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dev: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dev: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-doc: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-doc: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-locale: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-locale: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-src: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-src: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-staticdev: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-staticdev: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent: PV changed from "0.19.2" to "0.19.3"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent: PKGSIZE changed from 441235 to 441251 (+0%)
Changes to packages/core2-32-poky-linux/python3-pyrsistent (sysroot):
  /usr/lib/python3.11/site-packages/pyrsistent-0.19.2.dist-info moved to /usr/lib/python3.11/site-packages/pyrsistent-0.19.3.dist-info

--===============0222911577518629454==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyrsistent-upgrade-0.19.2-0.19.3.patch"

RnJvbSAzYWQ2ZDJiMTI2ODkwZTMzZjQwMzc2ZmMyN2NmOGE3OGI0MmVhN2RkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDoyMzoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlyc2lzdGVudDogdXBncmFkZSAwLjE5LjIgLT4gMC4xOS4zCgotLS0KIC4uLnl0aG9u
My1weXJzaXN0ZW50XzAuMTkuMi5iYiA9PiBweXRob24zLXB5cnNpc3RlbnRfMC4xOS4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlyc2lzdGVudF8wLjE5
LjIuYmIgPT4gcHl0aG9uMy1weXJzaXN0ZW50XzAuMTkuMy5iYn0gKDc5JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjE5LjIu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjE5
LjMuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5cnNpc3RlbnRfMC4xOS4yLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjE5LjMuYmIKaW5kZXgg
MGIzMDlkZThiMS4uMDU2NTRjMzQ4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5cnNpc3RlbnRfMC4xOS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXJzaXN0ZW50XzAuMTkuMy5iYgpAQCAtMyw3ICszLDcg
QEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3RvYmd1L3B5cnNpc3RlbnQiCiBMSUNF
TlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWl0O21kNT1i
Njk1ZWI5YzZlN2E2ZmIxYjFiYzJkMTkzYzQyNzc2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImJmYTAzNTFiZTg5YzlmY2JjYjhjOTg3OWI4MjZmNDM1M2JlMTBmNThmOGE2NzdlZmFiMGMwMTdi
ZjcxMzdlYzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWEyOTk0NzczNzA2YmJiNDk5NWMzMWE5
N2JjOTRmMTQxODMxNDkyM2JkMTA0OGM2ZDk2NDgzNzA0MDM3NjQ0MCIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi4zNy4zCgo=

--===============0222911577518629454==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE862C64EBF
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.858.1667349632528139790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OJVoZK9V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c8585d-294ed065-b1b4-4186-91d1-b102a124b320-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RdUH1J6RoUPtwL8ERMVOJn5yK1I/f6UQUNQnxe2MX6k=;
	b=OJVoZK9VGcRGG6wIp7FpN50eYAxYerWSynHJ5/l+L1FWAbeobrlK0roKP7/qeDus
	R+Jv7v9k0A65rFk8nc1Ehqt3RY75Wr0+JfbSdibeCi3FVR/JARd5I0wN5IGnbouL0OK
	nE5dEAPuWg41mek2CWUXTIfEb4ZCihbsSOzgAGBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RdUH1J6RoUPtwL8ERMVOJn5yK1I/f6UQUNQnxe2MX6k=;
	b=aeIA+RG5xnSZ/IxQH0096QoZrB1haTqHRrESiLNeQb4QKT+RyF3nXZzo2dNBIJQH
	wc1CMDvvUSfTJHognDzjGI1YjZpneeuX9cBzUIlR57JJLY3p3rMje6E4gjGaFBgmaZ0
	YqKqt4jOSGNNxCg2qKvvFsNNczD3OF+R+ntZmzpI=
Content-Type: multipart/mixed; boundary="===============5188530014582907319=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyrsistent: upgrading to 0.19.1 SUCCEEDED
Message-ID: <0101018435c8585d-294ed065-b1b4-4186-91d1-b102a124b320-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172433

--===============5188530014582907319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyrsistent* to *0.19.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyrsistent-upgrade-0.18.1-0.19.1.patch
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
--===============5188530014582907319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyrsistent: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyrsistent/pyrsistent-0.18.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyrsistent/pyrsistent-0.19.1.tar.gz"
packages/core2-32-poky-linux/python3-pyrsistent: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dbg: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dbg: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dev: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-dev: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-doc: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-doc: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-locale: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-locale: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-src: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-src: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-staticdev: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent-staticdev: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent: PKGV changed from 0.18.1 [default] to 0.19.1 [default]
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent: PV changed from "0.18.1" to "0.19.1"
packages/core2-32-poky-linux/python3-pyrsistent/python3-pyrsistent: PKGSIZE changed from 432144 to 441559 (+2%)
Changes to packages/core2-32-poky-linux/python3-pyrsistent (sysroot):
  /usr/lib/python3.11/site-packages/pyrsistent-0.18.1.dist-info moved to /usr/lib/python3.11/site-packages/pyrsistent-0.19.1.dist-info

--===============5188530014582907319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pyrsistent (sysroot):
  /usr/lib/python3.11/site-packages/pyrsistent-0.18.1.dist-info moved to /usr/lib/python3.11/site-packages/pyrsistent-0.19.1.dist-info

--===============5188530014582907319==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyrsistent-upgrade-0.18.1-0.19.1.patch"

RnJvbSA5ZmNlMmEyZGI0ZDQ2NWQ4MTViMGY1ZmRlZjc2MGRmMzkxYzlkYjAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDo0OTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlyc2lzdGVudDogdXBncmFkZSAwLjE4LjEgLT4gMC4xOS4xCgotLS0KIC4uLnl0aG9u
My1weXJzaXN0ZW50XzAuMTguMS5iYiA9PiBweXRob24zLXB5cnNpc3RlbnRfMC4xOS4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlyc2lzdGVudF8wLjE4
LjEuYmIgPT4gcHl0aG9uMy1weXJzaXN0ZW50XzAuMTkuMS5iYn0gKDc5JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjE4LjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjE5
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5cnNpc3RlbnRfMC4xOC4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlyc2lzdGVudF8wLjE5LjEuYmIKaW5kZXgg
YjRkOWUzYWYzOS4uY2M0MDIyZTRhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5cnNpc3RlbnRfMC4xOC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXJzaXN0ZW50XzAuMTkuMS5iYgpAQCAtMyw3ICszLDcg
QEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3RvYmd1L3B5cnNpc3RlbnQiCiBMSUNF
TlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWl0O21kNT1i
Njk1ZWI5YzZlN2E2ZmIxYjFiYzJkMTkzYzQyNzc2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImQ0ZDYxZjhiOTkzYTcyNTViYTcxNGRmM2FjYTUyNzAwZjgxMjUyODlmODRmNzA0Y2Y4MDkxNjUx
N2M0NmViOTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2ZlNmQ4YjI5M2QxMjMyNTVmZDNiNDc1
YjVmNGU4NTFlYjVjYmFlZTIwNjRjODkzM2FhMjczNDQzODE3NDRhZSIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi4zMS4xCgo=

--===============5188530014582907319==--


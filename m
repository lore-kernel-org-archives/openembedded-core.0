Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC809C7115D
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.145720.1673805743871948688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JAlVnAoa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185b698c473-b7876354-0949-4bc2-b35d-7b4f1f128aa0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8jozdyloanRI/1lmfGKvQhZP7l5dSI/BZ0zxSNXunXI=;
	b=JAlVnAoaQB1XChs4HKk2j63+LBL1PqCG7oBDjo+sugPPfN+ggm/9HtV/+FXgU7Mi
	S4scgYDYx5TKbHzvGaHCDdoJszI4WPVVd6yNOipBLC0L+aRTN+h/kxeHSNDC9BtgTih
	XJ4ziV8wWRiLc7pSZ3uFIGADjCz2bnRfckn26A+Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8jozdyloanRI/1lmfGKvQhZP7l5dSI/BZ0zxSNXunXI=;
	b=FxAoXWFY33tvsdLYEqNaypyU3cvWB1GHVXzC9z0Di7Nek7JPxI8sdZfaGQfPA1sL
	CQJb3/K3LE/4yXV03proMieaj9gU7cobOPEgOF2damj0v+rwjggdwzJ/e3UsACvDXZf
	KkyQ6LGmwpiPHufLwXHLGwIXNMcEBjIec8oziVDI=
Content-Type: multipart/mixed; boundary="===============5816492283426311309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 6.0.0 SUCCEEDED
Message-ID: <01010185b698c473-b7876354-0949-4bc2-b35d-7b4f1f128aa0-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175909

--===============5816492283426311309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *6.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-5.2.0-6.0.0.patch
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
--===============5816492283426311309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "5.2.0" to "6.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-5.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.0.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "5.2.0" to "6.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "5.2.0" to "6.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "5.2.0" to "6.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "5.2.0" to "6.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "5.2.0" to "6.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "5.2.0" to "6.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 5.2.0 [default] to 6.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 133615 to 133685 (+0%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "5.2.0" to "6.0.0"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-5.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.0.0.dist-info

--===============5816492283426311309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-5.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.0.0.dist-info

--===============5816492283426311309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-5.2.0-6.0.0.patch"

RnJvbSA3ZTQ0ZWJmNWFlZGJmMmFjNzM3NzUwNTlkZjI2ODFmYjcyZTJkYzgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTE6NTk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YTogdXBncmFkZSA1LjIuMCAtPiA2LjAuMAoKLS0tCiAu
Li5pYi1tZXRhZGF0YV81LjIuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjAu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWltcG9ydGxp
Yi1tZXRhZGF0YV81LjIuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjAuMC5i
Yn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1w
b3J0bGliLW1ldGFkYXRhXzUuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuMC4wLmJiCmluZGV4IDg5M2M2M2Q3
ZTUuLmIzM2ExYjU4NTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNS4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjAuMC5iYgpAQCAtOCw3
ICs4LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIFBZUElf
UEFDS0FHRSA9ICJpbXBvcnRsaWJfbWV0YWRhdGEiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIv
aW1wb3J0bGliLW1ldGFkYXRhLyg/UDxwdmVyPihcZCtbXC5cLV9dKikrKS8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI0MDRkNDhkNjJiYmEwYjdhNzdmZjlkNDA1ZWZkOTE1MDFiZWYyZTY3ZmY0
YWNlMGJlZDQwYTBjZjI4YzNjN2NkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzNTRiZWRlYjYw
ZWZhNmFmZmRjYzhhZTEyMWI3MzU0NGE3YWE3NDE1NmQwNDczMTE5NDhmNmQ3MTFjZDM3OGQiCiAK
IFMgPSAiJHtXT1JLRElSfS9pbXBvcnRsaWJfbWV0YWRhdGEtJHtQVn0iCiAKLS0gCjIuMzcuMwoK

--===============5816492283426311309==--


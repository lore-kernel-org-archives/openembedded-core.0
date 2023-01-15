Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467DBC761A6
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.145827.1673805743415100124
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SOR4/NCr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c335-cdcee04d-62ef-49a7-ad49-a80f3e1fbec4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wVACPDNZYPNIXhUhJ8xudg3WmMaGpNtMYVJGrAOwXfw=;
	b=SOR4/NCrVWs798cJBTw2uQ9QbE8UUyvIhN+0mm3YxZeZIIZm4zy3eBzAApzJfL4V
	54tlTUqz2YXq7PjRLnFqtAKRpYQE8iTfOn03TFdBNY8QdfvuNDwofUTLT3CPxJ8LnUI
	qTCQd+Na6QNjAVROP6cgwaz8Ha1bNW3pdVjir3C0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wVACPDNZYPNIXhUhJ8xudg3WmMaGpNtMYVJGrAOwXfw=;
	b=B+dnPgbrTVLJdScQ5NggGWPFQsPwMxpG8WOo5RHGAoJ2GS0EHN/RRKerp8TYst4L
	t7KomVOBVnRWGF+FSe28h+G/5KceJUtAwqYpktd4v7dGqxVxIbAI1dKZLQk4AWeh9XR
	LhYVCQ6PBB0FlAEqvpL+Eq2PNa7W3hbn/ft+wXkU=
Content-Type: multipart/mixed; boundary="===============9020221744967397765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 0.29.33 SUCCEEDED
Message-ID: <01010185b698c335-cdcee04d-62ef-49a7-ad49-a80f3e1fbec4-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175896

--===============9020221744967397765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *0.29.33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.32-0.29.33.patch
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
--===============9020221744967397765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.32.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.33.tar.gz"
packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 7606636 to 7607060 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8571668 to 8572978 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 10308483 to 10313136 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.32" to "0.29.33"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.32 [default] to 0.29.33 [default]
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-0.29.32.dist-info moved to /usr/lib/python3.11/site-packages/Cython-0.29.33.dist-info

--===============9020221744967397765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-0.29.32.dist-info moved to /usr/lib/python3.11/site-packages/Cython-0.29.33.dist-info

--===============9020221744967397765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.32-0.29.33.patch"

RnJvbSA3ZWJhYmQ4NGFjMDg3ZDljYWRkZTZlYjA5MDM5ZGNiMjEzNmQ5OTdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTE6MTY6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAwLjI5LjMyIC0+IDAuMjkuMzMKCi0tLQogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYyAgICAgICAgICAgICAgICAgIHwg
MiArLQogLi4uL3tweXRob24zLWN5dGhvbl8wLjI5LjMyLmJiID0+IHB5dGhvbjMtY3l0aG9uXzAu
MjkuMzMuYmJ9ICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0
aG9uXzAuMjkuMzIuYmIgPT4gcHl0aG9uMy1jeXRob25fMC4yOS4zMy5iYn0gKDEwMCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWN5dGhvbi5pbmMKaW5kZXggNzUw
Y2NmZDdhZS4uMzBkMWIzOTQ2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24tY3l0aG9uLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1jeXRob24uaW5jCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFLnR4dDttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEiCiBQ
WVBJX1BBQ0tBR0UgPSAiQ3l0aG9uIgogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2Rr
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODczM2NmNDc1OGI3OTMwNGYyYTRlMzllYmZhYzVl
OTIzNDFiY2U0N2JjY2ViMjZjMTI1NDM5OGIyZjhjMWFmNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI1MDQwNzY0YzRhNGQyY2U5NjRhMzk1ZGEyNGYwZDFhZTU4MTQ0OTk1ZGFiOTJjNmI5NmY0NGMz
ZjRkNzIyODZhIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiQ3l0aG9uLSg/UDxwdmVyPi4qKVwu
dGFyIgogCiBpbmhlcml0IHB5cGkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMC4yOS4zMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMC4yOS4zMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8wLjI5
LjMyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0
aG9uXzAuMjkuMzMuYmIKLS0gCjIuMzcuMwoK

--===============9020221744967397765==--


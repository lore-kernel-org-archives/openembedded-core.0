Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52F0C71131
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.144502.1671136351709164705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HUIO4NoK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185177d1577-a8f98846-bafc-487a-aacb-0afafeec5b09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JyRjg8gzmFixzFrCj9/HJqQ2C4LAOIqLJUz588/pyYo=;
	b=HUIO4NoKdV3RQLAlm6mq4qAYTzrrNXs+zLIqcqe+m8mKuwFyT5/CygPxdZ7cDu0q
	9yL2lXLi6CX5ZDLUU6CwGZF1rnzgvyydP5nWxqta7APq5k0+j4/XcVjlYMi3BY22AkB
	H/B+vOqo2RTp9jLr9UttaosBA/eH5YSph2Rq9QLE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JyRjg8gzmFixzFrCj9/HJqQ2C4LAOIqLJUz588/pyYo=;
	b=IHWDcWLtVN/1PhRat5WXbCjMcDPGSlY9tzPE6P7wUZGSR0p1qf/z7+D7vkrgliO0
	nf5ZCR3SVuZ3/Ei911o0PE90xusUoNbWBD/e5Q4ZuyAgxcmxxQmG+fDLo8fEP20f9Qm
	0ya1j2xXiQ7fFMCuCRNIU+JxCWDReOSY86u16ImY=
Content-Type: multipart/mixed; boundary="===============0299084350393296405=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.11.0 SUCCEEDED
Message-ID: <01010185177d1577-a8f98846-bafc-487a-aacb-0afafeec5b09-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174651

--===============0299084350393296405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.10.0-3.11.0.patch
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
--===============0299084350393296405==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.10.0-3.11.0.patch"

RnJvbSBmNzRhNDNiZmZmNjA0NzA0NzRkMjBkNTY1ZDk4ZDFlZjdjOTg3NjdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTI6MDA6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgMy4xMC4wIC0+IDMuMTEuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXppcHBfMy4xMC4wLmJiID0+IHB5dGhvbjMtemlwcF8zLjExLjAuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXppcHBfMy4xMC4wLmJiID0+IHB5
dGhvbjMtemlwcF8zLjExLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTAu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBf
My4xMS4wLmJiCmluZGV4IDU2ZDhlNzA2YzguLjcwZWJhZmMxNjggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTAuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjExLjAuYmIKQEAgLTMsNyAr
Myw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9qYXJhY28vemlwcCIKIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9N2E3MTI2
ZTA2ODIwNjI5MGYzZmU5ZjhkNmM3MTNlYTYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3YTcy
NjJmZDkzMGJkM2UzNmM1MGI5YTY0ODk3YWVjM2ZhZmZmM2RmZGVlYzk2MjNhZTIyYjQwZTkzZjk5
YmI4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE3YTIyZTA1OTI5MjkwYTY3NDAxNDQwYjM5Njkw
YWU2NTYzMjc5YmNlZDVmMzE0NjA5ZDlkMDM3OThmNTY3NjYiCiAKIERFUEVORFMgKz0gIiR7UFlU
SE9OX1BOfS1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiAKLS0gCjIuMzcuMwoK

--===============0299084350393296405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.10.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.11.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 31831 to 36123 (+13%)
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.11.0.dist-info

--===============0299084350393296405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 31831 to 36123 (+13%)
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.11.0.dist-info

--===============0299084350393296405==--


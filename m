Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87104C7EE33
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.12298.1678895726027964931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y4m5bsnW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010186e5fbba17-9f220e3a-91e4-49e2-b4da-d4601cc9a18c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aEQng/xCTP61sEF4N4VzzBR4UUqsyEGa99EhYg1FwmM=;
	b=Y4m5bsnWq8/DiXI7+5QbXcyIy25xC6eFlZoHPUa6nukwMZPLXKXYDDgsOi5bqkQ/
	7HU1ZV6Ehmt1EGjMmLIdChPF3SNtQxqOAECl7RqKc6B6Li1ygHXy7bsgHkFkVawdqEN
	5GesNppOSB4cVX27noYzILwBp6spoySAaHqX/w9Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aEQng/xCTP61sEF4N4VzzBR4UUqsyEGa99EhYg1FwmM=;
	b=FxZvY/VQmPpWKgOtnwdpPhSX3y61Q+n/logQJQw8UdA+3wlkuJ+GmMN5F7WvO6U+
	L0g98p4xR/bWGJo+PcAAAoSmrvDn5K+TXC0ZTI3+EBcC4ETa8Iz8fbbux+PJLO4bP7/
	S+5Pe3Xn+QgydyIBnycE5bob3PVVtnR+nTxIECtU=
Content-Type: multipart/mixed; boundary="===============2337874045217530203=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 0.11.1 SUCCEEDED
Message-ID: <01010186e5fbba17-9f220e3a-91e4-49e2-b4da-d4601cc9a18c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178599

--===============2337874045217530203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pathspec* to *0.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.11.0-0.11.1.patch
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
--===============2337874045217530203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.11.0.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.11.1.dist-info

--===============2337874045217530203==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.11.0-0.11.1.patch"

RnJvbSA0YjMyMjU0N2ZhMzRhM2E3NmI1NjhiZTFlM2Q4NDkzMjUzYWQ4NjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDc6NTg6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhdGhzcGVjOiB1cGdyYWRlIDAuMTEuMCAtPiAwLjExLjEKCi0tLQogLi4uL3tweXRo
b24zLXBhdGhzcGVjXzAuMTEuMC5iYiA9PiBweXRob24zLXBhdGhzcGVjXzAuMTEuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYXRoc3BlY18wLjExLjAu
YmIgPT4gcHl0aG9uMy1wYXRoc3BlY18wLjExLjEuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTEuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18wLjExLjEuYmIKc2lt
aWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBhdGhzcGVjXzAuMTEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTEuMS5iYgppbmRleCBiZjBkZmJkNzI4Li5m
NDliZjA4MGU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGF0aHNwZWNfMC4xMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1wYXRoc3BlY18wLjExLjEuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2
ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNUEwtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9ODE1Y2E1OTljOWRmMjQ3YTBjN2Y2MTliYWIxMjNkYWQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI2NGQzMzhkNGUwOTE0ZTkxYzE3OTIzMjFlNjkwN2I1YTU5M2YxYWIx
ODUxZGU3ZmMyNjk1NTdhMjFiMzBlYmJjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI3OThkZTgw
MGZhOTI3ODBlMzNhY2NhOTI1OTQ1ZTlhMTlhMTMzYjcxNTA2N2NmMTY1Yjg4NjZjMTVhMzE2ODci
CiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============2337874045217530203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.11.0.tar.gz;downloadfilename=pathspec-0.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.11.1.tar.gz;downloadfilename=pathspec-0.11.1.tar.gz"
packages/core2-32-poky-linux/python3-pathspec: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 157448 to 158221 (+0%)
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.11.0.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.11.1.dist-info

--===============2337874045217530203==--


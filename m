Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8895DC48BD1
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.346.1664643227272995169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n3l6y/oq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101839477dc06-41fc7fa6-d0de-43be-bd43-cb79906c1da7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z8qHQtQB1EdHOXCRaqeXKVfKGYCZFBAg0xFdRT1KGEI=;
	b=n3l6y/oqBfC1n8CuzdwVV0JZEP1A8Tw8CBaL+Rpdm1HnBa1i3HoDus1kIWi1Et7y
	xfcLrEZsr7Z/3QPTxX26Fb3PuhvKO4T4cMGXEwdMlLcH+Oo2hx7fKl28PehT6Tkr2gJ
	Job+/folLddISDnLTYun5TuwFUMQ23Bv04TIb/kU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z8qHQtQB1EdHOXCRaqeXKVfKGYCZFBAg0xFdRT1KGEI=;
	b=f91n1o4PKkIN6qmrXl5GMTd8IVkiBHE+1aYgRbYZRhRJhFlG82eo3Io35lhWdqLy
	875ookxKItpmyqsKjpnZd+0PdQT7vIUJCsEZFgD8iU0XWxB6k1CZp5Y4Ijl1HFcYGES
	R2oe1XwxEcYDQFaTelMcinDaQhlMALmcKEwiG2xA=
Content-Type: multipart/mixed; boundary="===============0405262790175297061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.3 SUCCEEDED
Message-ID: 
 <010101839477dc06-41fc7fa6-d0de-43be-bd43-cb79906c1da7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171272

--===============0405262790175297061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.2.2-1.2.3.patch
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
--===============0405262790175297061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.2.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.3.dist-info

--===============0405262790175297061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.2.2-1.2.3.patch"

RnJvbSAyNTBlZGZjM2IwMzcwYjAxYzhkMzkxMTY3NzcyMzYzNjNhN2ZkMDYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoyODoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjIuMiAtPiAxLjIuMwoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLW1ha29fMS4yLjIuYmIgPT4gcHl0aG9uMy1tYWtvXzEuMi4zLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1ha29fMS4yLjIuYmIgPT4gcHl0aG9u
My1tYWtvXzEuMi4zLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1ha29fMS4yLjMuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4yLjIuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJi
CmluZGV4IGUzNzc0ZWU2MjEuLjEyYWNmZWU3NzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJiCkBAIC04LDcgKzgsNyBAQCBQWVBJ
X1BBQ0tBR0UgPSAiTWFrbyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxk
X21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3MjQ4NjliMzYzYmE2MzBhMjcyYTVmODlm
NjhjMDcwMzUyMTM3YjhmZDE3NTc2NTAwMTdiN2UwNmZkYTE2M2YiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiN2ZkZTk2NDY2ZmNmZWVkYjBlZWQ5NGYxODdmMjBiMjNkODVlNGNiNDE0NDRiZTBlNTQy
ZTJjOGM2NWMzOTZjZCIKIAogUkRFUEVORFM6JHtQTn0gPSAiJHtQWVRIT05fUE59LWh0bWwgXAog
ICAgICAgICAgICAgICAgICAgJHtQWVRIT05fUE59LW1hcmt1cHNhZmUgXAotLSAKMi4zMS4xCgo=

--===============0405262790175297061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.3.tar.gz"
packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 507898 to 507908 (+0%)
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.2.2" to "1.2.3"
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.2.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.3.dist-info

--===============0405262790175297061==--


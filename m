Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B97C71133
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.145433.1671136351198038392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XNYnGQjO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d1462-3a7d7448-bcf6-4716-bc49-c40fa6c507f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rxr8rJvKJHAHp4W6SZPI27V9GvRXFftXgO5vNmgm0Ro=;
	b=XNYnGQjOy2HcDzTdMy8fRwd+4GwkBrJG/oKiJzC8i/6mKMDulIuRJRW6cNxZmvyb
	PiD8jXuD+wg+Bpr9DPUMnsw8eEn5hBG1kMhpwnmlpi0/LvapzKyWsTjRhuMN9FMSPH5
	GLnmTue0kHISp5H8Z17iK+OxKVOoxLuprgizpkwk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rxr8rJvKJHAHp4W6SZPI27V9GvRXFftXgO5vNmgm0Ro=;
	b=A2HT4APPH9h9k6iiod1uuaKZC+WuVTxqlKw9VuOOH3h9TPziS93TbNXznQZhGVq8
	6KdpMnkZuZVVs31X4wbaqv0kjrALfSBMwuGbx135/dm+vjQMMnbbccZxXc5oqxr9v4V
	k1vZ4Z5JKSmsXKKoO5bTwKVHZknziRrcrRKgpMaI=
Content-Type: multipart/mixed; boundary="===============3108975175757199380=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.16.0 SUCCEEDED
Message-ID: <01010185177d1462-3a7d7448-bcf6-4716-bc49-c40fa6c507f2-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174650

--===============3108975175757199380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.15.0-3.16.0.patch
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
--===============3108975175757199380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodome: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.16.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodome: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1042020 to 1042016 (-0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2772679 to 2772209 (-0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2843641 to 2844219 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3644614 to 3644710 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.15.0" to "3.16.0"
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info

--===============3108975175757199380==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.15.0-3.16.0.patch"

RnJvbSA5ZGI2ZDI0MzRkODViOWM0MDA1OTE5NDFhYTEzMmYxZGIwNDBiYmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6NDI6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZTogdXBncmFkZSAzLjE1LjAgLT4gMy4xNi4wCgotLS0KIC4uLm4z
LXB5Y3J5cHRvZG9tZV8zLjE1LjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xNi4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21l
XzMuMTUuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjE2LjAuYmJ9ICgzOCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9t
ZV8zLjE1LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlw
dG9kb21lXzMuMTYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDM4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMTUuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8z
LjE2LjAuYmIKaW5kZXggY2FiZTkxODlmMi4uMTVlZTMxYzY2YSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjE1LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjE2
LjAuYmIKQEAgLTEsNSArMSw1IEBACiByZXF1aXJlIHB5dGhvbi1weWNyeXB0b2RvbWUuaW5jCiBp
bmhlcml0IHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MTM1ZGRkYWQ1MDQ1
OTJiY2MxOGIwZDJkOTVjZTg2YzNhNWVhODdlYzY0NDdlZjI1Y2ZlZGVhMTJkNjAxOGI4IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjBlNDVkMmQ4NTJhNjZlY2ZiOTA0ZjA5MGMzZjg3ZGMwZGZiODlh
NDk5NTcwYWJhZDg1OTBmMTBkOWNmZmIzNTAiCiAKLS0gCjIuMzcuMwoK

--===============3108975175757199380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info

--===============3108975175757199380==--


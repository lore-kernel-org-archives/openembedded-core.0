Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D49C87FDC
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.12143.1678895725599081107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ilnguLfc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010186e5fbbbd4-f805c4c1-7a2d-4aa5-84b9-08b8fa468d20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3m4OTw56fevTWDvTJ41PvJoCRs7UH1L/3XAPqgT2tCU=;
	b=ilnguLfce5mFy8tsSuCLXMLBAc3mswy+KPPNrZl0fNZHT3HZv1kYocnrpylZ5WOg
	jzsyX36cFAdSwkEF+2eyoBaM7AgA9Edlu7hQlEcgepLFFn0j4XBrsaeq9ycPjQpML2x
	KAnGjJJCZ2ynumXSpwIwjX188GoleeDc8WyglZxE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3m4OTw56fevTWDvTJ41PvJoCRs7UH1L/3XAPqgT2tCU=;
	b=P3tRv01FW6okUjUPmx4XbYwy8SZDAnhd/UKFsKoDBckKFKXOtR76IeqGNm18Z7Hh
	Ycps/AG6mTEItT4rEZ+is8qKc8T0Hqbbiqr5etQdpwjX7B+klIlyr0H7hKotd87ptT3
	HULTXgZSEPcGKGtZ6etddRdMxMwAk+NLBBFg6mBU=
Content-Type: multipart/mixed; boundary="===============2096533344707192497=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.6.0 SUCCEEDED
Message-ID: <01010186e5fbbbd4-f805c4c1-7a2d-4aa5-84b9-08b8fa468d20-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178597

--===============2096533344707192497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-testtools* to *2.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.5.0-2.6.0.patch
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
--===============2096533344707192497==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.5.0-2.6.0.patch"

RnJvbSBmY2Q1MjJlZmU2MTNiZjRkYzgzNGI2MTU2ZDg4MzA1OGI1MzQ2MjMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDg6MTk6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRlc3R0b29sczogdXBncmFkZSAyLjUuMCAtPiAyLjYuMAoKLS0tCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi10ZXN0dG9vbHMuaW5jICAgICAgICAgICAgICAgfCAy
ICstCiAuLi4ve3B5dGhvbjMtdGVzdHRvb2xzXzIuNS4wLmJiID0+IHB5dGhvbjMtdGVzdHRvb2xz
XzIuNi4wLmJifSAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy10
ZXN0dG9vbHNfMi41LjAuYmIgPT4gcHl0aG9uMy10ZXN0dG9vbHNfMi42LjAuYmJ9ICg5OCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tdGVzdHRvb2xz
LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXRlc3R0b29scy5pbmMK
aW5kZXggZWY1ZTE1Y2MzYS4uZTAwNGQwZWIwYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24tdGVzdHRvb2xzLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbi10ZXN0dG9vbHMuaW5jCkBAIC02LDcgKzYsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lMmM5ZDNlOGJhNzE0MWM4M2JmZWYxOTBl
MGI5Mzc5YSIKIAogaW5oZXJpdCBweXBpCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1N2MxMzQz
M2Q5NGY5ZmZkZTNiZTY1MzQxNzdkMTBmYjBjMTUwN2NjNDk5MzE5MTI4OTU4Y2E5MWE2NWNiMjNm
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI4YjY1ZTE0YzBmMmQzZWNiYmZiNWY1NWM5ZGNkZTVl
NGZhYTgwYWMxNmEzN2E4MjM5MDlhMWZlM2NiY2IzMGEiCiAKIERFUEVORFMgKz0gIiBcCiAgICAg
JHtQWVRIT05fUE59LXBiciBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRlc3R0b29sc18yLjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIu
NS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVz
dHRvb2xzXzIuNi4wLmJiCmluZGV4IDg5NmVjZWU2NWMuLjc5ZTQ2YTAyZGUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi41LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0b29sc18yLjYu
MC5iYgpAQCAtMSwyICsxLDMgQEAKIGluaGVyaXQgc2V0dXB0b29sczMKIHJlcXVpcmUgcHl0aG9u
LXRlc3R0b29scy5pbmMKKwotLSAKMi4zOS4yCgo=

--===============2096533344707192497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.11/site-packages/testtools-2.5.0.dist-info moved to /usr/lib/python3.11/site-packages/testtools-2.6.0.dist-info

--===============2096533344707192497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-testtools: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.5.0.tar.gz;downloadfilename=testtools-2.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.6.0.tar.gz;downloadfilename=testtools-2.6.0.tar.gz"
packages/core2-32-poky-linux/python3-testtools: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools/python3-testtools: PV changed from "2.5.0" to "2.6.0"
packages/core2-32-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.5.0 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 1969720 to 1967368 (-0%)
Changes to packages/core2-32-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.11/site-packages/testtools-2.5.0.dist-info moved to /usr/lib/python3.11/site-packages/testtools-2.6.0.dist-info

--===============2096533344707192497==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E7AC64ED6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10149.1676508396739928557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iZcKhLp6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018657aff8a4-a9f4d256-306c-4cb8-bbbe-bb946d1d0ec4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0rm8VGdjSKIK/X07+vkKvML+H/g5h3NfD0jsPjFmi1U=;
	b=iZcKhLp6zdDY+5S9Rg77pYbTvv2CUnnMyz1pGtC7luryA7/JvLawp4nanDVe6a6Q
	JPUS3OayQMvcKVahCdOl6HPNvasijp5lcm9QdrhYHSuz4O+1UcVY0gsz66zTdM6WNLr
	apXSjiUr9y+FILF5gdCULqQz7jbaXpuJ6Fe2mjiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0rm8VGdjSKIK/X07+vkKvML+H/g5h3NfD0jsPjFmi1U=;
	b=Cb7ZA+X9jKUVdo722HOVU3R1nXGRSM+vB0LdecxwxC/GGpiPJ9pldR6olzI//LZU
	+Einw70GKIvgxVhT5KYhWtCM1H0YjtIUtybzRZKT9GUzPzhIgfk+96kmx3pAYubMtO2
	dBl8Djv4Ywo/vjEiv22hmtVuJ0G1MlzlKnoRZc5w=
Content-Type: multipart/mixed; boundary="===============3471338792064679783=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 39.0.1 SUCCEEDED
Message-ID: <0101018657aff8a4-a9f4d256-306c-4cb8-bbbe-bb946d1d0ec4-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177238

--===============3471338792064679783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *39.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-39.0.0-39.0.1.patch
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
--===============3471338792064679783==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-39.0.0-39.0.1.patch"

RnJvbSBlZmQyYjliNWZkN2QyYjk2NDNlNTE2ZThlNWExMjdlOWFjMWUzNmYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTU6NDk6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRlIDM5LjAuMCAtPiAzOS4wLjEKCi0t
LQogLi4udmVjdG9yc18zOS4wLjAuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18z
OS4wLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9yc18zOS4wLjAuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
c18zOS4wLjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5LjAuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18zOS4wLjEuYmIK
c2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5LjAuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5
LjAuMS5iYgppbmRleCA2YWFmNjUwMWI0Li40NThjYTJhZGJkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzkuMC4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9yc18zOS4wLjEuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0
aGUgc2FtZSB0aW1lCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MmU1OTY3MGEwODIwYjViYmZh
ODVmNzI0YjhhZWJkNjEzODU3ODdlYjhiNjYwN2Y2NGQ1MzM5NjkxMjRiMmEwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjBjYmFlYjUwYmRiN2YzYzlkN2E5M2IyNmEwNDYyZWY2ZTk3Yzc2OGNhNzhk
OTAyODU0ZmUwNDVjMzBiNjgwYzYiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVj
dG9ycyIKIAotLSAKMi4zNy4zCgo=

--===============3471338792064679783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-39.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-39.0.1.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "39.0.0" to "39.0.1"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.0.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.1.dist-info

--===============3471338792064679783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.0.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.1.dist-info

--===============3471338792064679783==--


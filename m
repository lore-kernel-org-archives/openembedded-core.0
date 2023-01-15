Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28671C76186
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145714.1673805743546413430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K+r2i1m0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c2c3-16e42b8a-1bc1-48c2-a5f0-8b9e5d61181f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4GHr7kLIJMA8Ml1W14cWzDXz3AScHjcafZMa4tFimPc=;
	b=K+r2i1m0GoosP5O5jecTbP8ewKJrvcbWe8FyLki/RdLy+F/+7x9Kqj0ADH2pbpGI
	0zuXzlAh4PnZ36Ckm9D3I5WvfjouCXu3U6YIBwfmbObKyfDCwUhN3DoswnQbKtM+etz
	dOvH7mPlfe08/zyBWcZc3GX6NpJoCZPOGQMsSge0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4GHr7kLIJMA8Ml1W14cWzDXz3AScHjcafZMa4tFimPc=;
	b=gSjlbTD8Uzgs8wOpNDtpb7rP2hfkJehSRpksprYm9vQCg2PygI4Ixvms9Lv6wN0e
	hXL762Qz7LFBh3M8kz2RhJzxFlEwwYHfo5sxzlaG28wUVo0eqjF1qbmVbzQVy4LaPmg
	ZmiXUu2R+FtRK4asGgQaAjrjlHFdbsUjmsAmgOPQ=
Content-Type: multipart/mixed; boundary="===============7649952398253234485=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 39.0.0 SUCCEEDED
Message-ID: <01010185b698c2c3-16e42b8a-1bc1-48c2-a5f0-8b9e5d61181f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175900

--===============7649952398253234485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *39.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-38.0.4-39.0.0.patch
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
--===============7649952398253234485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-38.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-39.0.0.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 75075369 to 75079978 (+0%)
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "38.0.4" to "39.0.0"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.4.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.0.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.chain_with_garbage.pem /usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__about__.cpython-310.pyc /usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__init__.cpython-310.pyc"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 38.0.4 [default] to 39.0.0 [default]
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.4.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.0.dist-info
  /usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__about__.cpython-310.pyc was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.chain_with_garbage.pem was added

--===============7649952398253234485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.4.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.0.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.chain_with_garbage.pem /usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__about__.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.4.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.0.dist-info
  /usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__about__.cpython-310.pyc was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.chain_with_garbage.pem was added

--===============7649952398253234485==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-38.0.4-39.0.0.patch"

RnJvbSAzNzkyZWVkMDZkMzc2MWNiZWViY2MxOWJhMjhlZjc3YjQ3OGJkODRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTA6NTM6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRlIDM4LjAuNCAtPiAzOS4wLjAKCi0t
LQogLi4udmVjdG9yc18zOC4wLjQuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18z
OS4wLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9yc18zOC4wLjQuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
c18zOS4wLjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4LjAuNC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18zOS4wLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4LjAuNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5
LjAuMC5iYgppbmRleCBhMzZjYmViMDlhLi42YWFmNjUwMWI0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzguMC40
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9yc18zOS4wLjAuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0
aGUgc2FtZSB0aW1lCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZWM2MjY5NWJlYzVkZjgxMDI4
OGRkY2VhZTk5OGFlNjkxY2RiOGExNjI4MDhkNmNiYzk2MGQzZGViOWE3ZGIxIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjUyZTU5NjcwYTA4MjBiNWJiZmE4NWY3MjRiOGFlYmQ2MTM4NTc4N2ViOGI2
NjA3ZjY0ZDUzMzk2OTEyNGIyYTAiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVj
dG9ycyIKIAotLSAKMi4zNy4zCgo=

--===============7649952398253234485==--


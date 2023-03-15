Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E41BC7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12140.1678895725213396804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EGrQ0Cbb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010186e5fbc6d1-cdc0bb11-8a34-47a1-95eb-47861e100861-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A0umSFlvZunMz31mj2anG2lGQcag4WK8oMxmgZQmwRc=;
	b=EGrQ0CbblzoPy1fZ2g2JHeOpKGab2VrIYie25PrFNcTD5v/5k6sTVIgLDxT7lhUn
	8uGUK5kIoxnT93Kv2//oKS6h3fcUa0pM8oa8rr7SnSP23UGnAMzJnt/Y/EZ4O1hHK3W
	K/DEzqFxYajIbxo9PFfQG4sjVudluMMPOMDyXdok=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A0umSFlvZunMz31mj2anG2lGQcag4WK8oMxmgZQmwRc=;
	b=rNyVbKnZHhwu1elr5+6cnEo6X73yP4tk0TCQRi5Rlw2se5vPo71xoZWKpEg5TigC
	Y6qhDtOu6dJIAIo/0CI9RsYiPtYSIW0QT7PaRWqKhpFgE1Sh2qgSPwyS9ymsNYz1qAl
	blhC0FeSNdPtFDqAOKFNCLVzr0atQwoRHzynTdi4=
Content-Type: multipart/mixed; boundary="===============3288466817069801150=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.41.1 SUCCEEDED
Message-ID: <01010186e5fbc6d1-cdc0bb11-8a34-47a1-95eb-47861e100861-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:28 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178645

--===============3288466817069801150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.41.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.41.0-3.41.1.patch
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
--===============3288466817069801150==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.41.0-3.41.1.patch"

RnJvbSBjYzk4N2FkODRhZmM5NTQ0ZjJjM2UzZmEzMDQyN2E1ZjQ5MTY1MmNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTU6NTE6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNDEuMCAtPiAzLjQxLjEKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjQxLjAuYmIgPT4gc3FsaXRlM18zLjQxLjEuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNDEuMC5iYiA9PiBzcWxpdGUzXzMuNDEu
MS5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjQxLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjQx
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy40MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjQxLjEuYmIKaW5kZXggZjE3YzE1ZTI1OC4uMWQ5Y2YxMDI1OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy40MS4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNDEuMS5iYgpAQCAt
NCw3ICs0LDcgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyMy9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OWY3N2FjNTNmZDlh
YTVkNzM5NWYyNDk5Y2I4MTY0MTBlNTYyMTk4NGExMjFiODU4Y2NjYTA1MzEwYjA1YzcwIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjRkYWRmYmVhYjlmOGUxNmM2OTVkNGZiYmM1MWMxNmIyZjc3ZmI5
N2ZmNGMxYzNkMTM5OTE5ZGZjMDM4YzllMzMiCiAKICMgLTE5MjQyIGlzIG9ubHkgYW4gaXNzdWUg
aW4gc3BlY2lmaWMgZGV2ZWxvcG1lbnQgYnJhbmNoIGNvbW1pdHMKIENWRV9DSEVDS19JR05PUkUg
Kz0gIkNWRS0yMDE5LTE5MjQyIgotLSAKMi4zOS4yCgo=

--===============3288466817069801150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sqlite3: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3: PKGV changed from 3.41.0 [default] to 3.41.1 [default]
packages/core2-32-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2023/sqlite-autoconf-3410000.tar.gz" to "http://www.sqlite.org/2023/sqlite-autoconf-3410100.tar.gz"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.41.0 [default] to 3.41.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.41.0 [default] to 3.41.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.41.0 [default] to 3.41.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.41.0 [default] to 3.41.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 4962092 to 4964456 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.41.0 [default] to 3.41.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 10141203 to 10143487 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.41.0 [default] to 3.41.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3: PV changed from "3.41.0" to "3.41.1"
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGV changed from 3.41.0 [default] to 3.41.1 [default]

--===============3288466817069801150==--


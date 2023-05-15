Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71C2CA9EC9
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3766.1684186747757284046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F8k0udvp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a50fb-c495cd41-7bf8-48e6-bf47-7f9bfe015e97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sMIxYSs4DnZnLWUGxWsC5pcXPLwMR4QJcidmFwlDrBQ=;
	b=F8k0udvpt4wHOVvYgKVuzkzM4BasjpH0OKjsnahmHyFEq0l3xJUVsSjHO6lzDPyR
	i+IBYTjK/XM9DoNHSTqhk/AcFEoFZDX3gyhiu73t7JEk1dImqjZq8CVFH/VQpnAv8yW
	t8NGeZWocVR4yWooJaJf2KZDC3h2bqNWmuGYgGkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sMIxYSs4DnZnLWUGxWsC5pcXPLwMR4QJcidmFwlDrBQ=;
	b=A8nXtvC7N4Sz83j6WtqLkVJrCr5QehizWe0rNDoVvCuOi/hG4wxLoseq6vyUGOCW
	1oXnzzhYF+KKWMgdfgoQhRkoAR9HJYAJARlYht9/fCNHTKTPa0pr2XhbWTU6o/DCS8J
	5bh0tHP7iIS3dtc9HTjSRvz16FpJ5Lzihg7dZ99s=
Content-Type: multipart/mixed; boundary="===============2347710886312664788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 3.9.0 SUCCEEDED
Message-ID: <01010188215a50fb-c495cd41-7bf8-48e6-bf47-7f9bfe015e97-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181304

--===============2347710886312664788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flit-core* to *3.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-flit-core-upgrade-3.8.0-3.9.0.patch
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
--===============2347710886312664788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-flit-core: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/f/flit/flit-3.8.0.tar.gz;downloadfilename=flit-3.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/f/flit/flit-3.9.0.tar.gz;downloadfilename=flit-3.9.0.tar.gz"
packages/core2-32-poky-linux/python3-flit-core: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dbg: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dbg: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-doc: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-doc: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-locale: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-locale: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-src: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-src: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-staticdev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-staticdev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PKGSIZE changed from 87520 to 88427 (+1%)
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PKGSIZE changed from 239828 to 241833 (+1%)
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
Changes to packages/core2-32-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info

--===============2347710886312664788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.8.0-3.9.0.patch"

RnJvbSA3MjI5MWIzMjQ5OGE1Yjg1YTVjMzE1NTQ3NzlhNDgzNmE1MDFiYmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTA6NTU6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWZsaXQtY29yZTogdXBncmFkZSAzLjguMCAtPiAzLjkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtZmxpdC1jb3JlXzMuOC4wLmJiID0+IHB5dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWZsaXQtY29yZV8zLjguMC5i
YiA9PiBweXRob24zLWZsaXQtY29yZV8zLjkuMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuOC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZsaXQtY29yZV8zLjkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZmxpdC1jb3JlXzMuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJiCmluZGV4IDJlNWIxZTgwNjkuLmIw
YmVmNGI2YjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1mbGl0LWNvcmVfMy44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWZsaXQtY29yZV8zLjkuMC5iYgpAQCAtOCw3ICs4LDcgQEAgQlVHVFJBQ0tFUiA9ICJo
dHRwczovL2dpdGh1Yi5jb20vcHlwYS9mbGl0L2lzc3VlcyIKIExJQ0VOU0UgPSAiQlNELTMtQ2xh
dXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NDFlYjc4ZmE4YTg3
Mjk4M2E4ODJjNjk0YTgzMDVmMDgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMGYyYThmNGJk
NDVkYzc5NGJlZmJmNTgzOWVjYzBmZDM4MzBkNjVhNTdiZDUyYjU5OTc1NDJmYWM1ZDVlOTM3Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3NWVkZjVlYjMyNGRhMjBkNTM1NzBhNmE2Zjg3ZjUxZTYw
NmVlZTgzODQ5MjVjZDY2YTkwNjExMTQwODQ0YzciCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxp
dF9jb3JlCiAKLS0gCjIuMzkuMgoK

--===============2347710886312664788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info

--===============2347710886312664788==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E9DC77B6F
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10146.1676508396007469567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JAhd+cg9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018657aff91c-b15dac68-7551-49b2-9153-83b9f3304b86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k5WLyffqPBgG/xDt5bIUGu3GF+QFziQLsVU2GekdCUM=;
	b=JAhd+cg97PoZsjKX84JmT69MpEeWRzGEC2e7+7jU0ZKcPSvy8uFoSlXTUwIoACWE
	XQMRFgo1dHZMxPIxbqCHgoME1+gV1G1c9oPJAe3N+UIfWcmCHYl7Tf/ToDqmEt7RkFb
	3IHDISJSH77Y1Am7bVV8pQV9rdtdDd5SivXyG7ao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k5WLyffqPBgG/xDt5bIUGu3GF+QFziQLsVU2GekdCUM=;
	b=X6vLLszvEuqJEPgfaRVLutGYQNf9Aw1uRjAS8T+oT3I0W9g/Y+oNONNSlIGSAmrA
	JMdbv599j2ywOev8LxPB8OewlSJCKuVlX7S3KbRUyQZ9aK8XhBZqjDrd0TmFa2g2KrH
	rS3QzVGI8L+V1s2UsTao1BOzW7w8SQDAQF0PFB3A=
Content-Type: multipart/mixed; boundary="===============2158214594247973313=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.5.0 SUCCEEDED
Message-ID: <0101018657aff91c-b15dac68-7551-49b2-9153-83b9f3304b86-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177231

--===============2158214594247973313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.4.0-4.5.0.patch
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
--===============2158214594247973313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-typing-extensions: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.5.0.tar.gz"
packages/core2-32-poky-linux/python3-typing-extensions: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 197979 to 207643 (+5%)
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.4.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.5.0.dist-info

--===============2158214594247973313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.4.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.5.0.dist-info

--===============2158214594247973313==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.4.0-4.5.0.patch"

RnJvbSBjZjc0NThjMzc0MzQxZWJjMDVmNzAxOTczOTgxYzRkYmFhNTg5Mjc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTY6MTU6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXR5cGluZy1leHRlbnNpb25zOiB1cGdyYWRlIDQuNC4wIC0+IDQuNS4wCgotLS0KIC4u
LmctZXh0ZW5zaW9uc180LjQuMC5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNS4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHlwaW5nLWV4
dGVuc2lvbnNfNC40LjAuYmIgPT4gcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjUuMC5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHlwaW5nLWV4dGVuc2lvbnNfNC40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC41LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cGluZy1l
eHRlbnNpb25zXzQuNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC41LjAuYmIKaW5kZXggMjdlYzc1NjBlYS4uODBm
ODdjYWU4NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXR5cGluZy1leHRlbnNpb25zXzQuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjUuMC5iYgpAQCAtMTUsNyArMTUsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mMTZiMzIzOTE3OTkyZTBm
OGE2ZjAwNzFiYzk5MTNlMiIKICMgVGhlIG5hbWUgb24gUHlQaSBpcyBzbGlnaHRseSBkaWZmZXJl
bnQuCiBQWVBJX1BBQ0tBR0UgPSAidHlwaW5nX2V4dGVuc2lvbnMiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIxNTExNDM0YmI5MmJmOGRkMTk4YzEyYjFjYzgxMmU4MDBkNDE4MWNmY2I4Njc2NzRl
MGY4Mjc5Y2M5MzA4N2FhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjYjVmNGE3OTEzOWQ2OTk2
MDdiM2VmNjIyYTFkZWRhZmE4NGUxMTVhYjAwMjRlMGQ5YzA0NGE5NDc5Y2E3Y2IiCiAKIGluaGVy
aXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuMzcuMwoK

--===============2158214594247973313==--


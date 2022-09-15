Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90916C6FD33
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web08.10732.1663251513489447564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=O+N+y6t7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101834183fda2-0e59d3cc-0af9-4d77-a19c-7e5668477e64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S1VS2wpEmgM8laKcH7dZxdGdufXeWIkKpttbC1FvdeE=;
	b=O+N+y6t7zZt8d0ZDAuuEJXxjtLlaghleQ1wbqDs55wO04W85IGsz6WrOj18tfEXn
	5NkkXhK/Q2OMl7kdAbaUBRUE78dwvmycqwl0FM6f3eARmB8oWUtAnMvo+9n8f46Xj3T
	z8H3UZobnN+Avs1mRwxr05fTDZM4G0pqzg173TFw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S1VS2wpEmgM8laKcH7dZxdGdufXeWIkKpttbC1FvdeE=;
	b=ambkYTHEy+fmBxD3V2T6Ev93yRJHD/WlTJ8I3rhPGLGNWtAob8CHmINbTySdMRLP
	4Rn2ZtCCB91vZp1OaB4GQeMEQGIeYRHVkQvl8w2OsNLKAHhJkQGNsZ0hXVCIGhD1PeT
	NPJGW7ulYZwpzx/ydXdCSzzQr0vCIeiEd0Sdoqx8=
Content-Type: multipart/mixed; boundary="===============0624097210440616645=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.4 SUCCEEDED
Message-ID: 
 <010101834183fda2-0e59d3cc-0af9-4d77-a19c-7e5668477e64-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170729

--===============0624097210440616645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-idna* to *3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.3-3.4.patch
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
--===============0624097210440616645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/LICENSE.md was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/LICENSE.md was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/WHEEL was removed

--===============0624097210440616645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-idna: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.3.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.4.tar.gz"
packages/core2-32-poky-linux/python3-idna: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna/python3-idna-src: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/python3-idna/python3-idna: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 485324 to 489812 (+1%)
packages/core2-32-poky-linux/python3-idna/python3-idna: PV changed from "3.3" to "3.4"
Changes to packages/core2-32-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/LICENSE.md was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/idna-0.0.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/LICENSE.md was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/idna-3.3.dist-info/WHEEL was removed

--===============0624097210440616645==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.3-3.4.patch"

RnJvbSBhYmM5YmQwYTgyODA4OTU0Njk5NDQzYTJhNzJkNjE5MzdjZjE5MGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6NTg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlkbmE6IHVwZ3JhZGUgMy4zIC0+IDMuNAoKLS0tCiAuLi4vcHl0aG9uL3tweXRob24z
LWlkbmFfMy4zLmJiID0+IHB5dGhvbjMtaWRuYV8zLjQuYmJ9ICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWlkbmFfMy4zLmJiID0+IHB5dGhvbjMtaWRu
YV8zLjQuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWlkbmFfMy4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWlkbmFfMy40LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy40LmJiCmluZGV4IGVlOTJmNDRm
ZDUuLjEwYzk5ZWUwZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pZG5hXzMuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaWRuYV8zLjQuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9ramQvaWRuYSIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgUHl0aG9uLTIuMCAm
IFVuaWNvZGUtVE9VIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9
MjM5NjY4YTdjNjA2NmQ5ZTBjNTM4MmU5YzhjNmMwZTEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI5ZDY0M2ZmMGE1NWI3NjJkNWNkYjEyNGI4ZWFhOTljNjYzMjJlMjE1N2I2OTE2MGJjMzI3OTZl
ODI0MzYwZTZkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxNGY1MjhlOGRlYWQ3ZDMyOTgzM2I5
MWM1ZmFhODdkNjBiZjcxODI0Y2QxMmE3NTMwYjU1MjYwNjNkMDJjYjQiCiAKIGluaGVyaXQgcHlw
aSBzZXR1cHRvb2xzMwogCi0tIAoyLjMxLjEKCg==

--===============0624097210440616645==--


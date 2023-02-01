Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002B2C77B71
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.30012.1675272856299364873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GxwpGpvK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101860e0b201e-2d5da237-4e9f-4d3b-ad8f-24babc90ea32-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LLomCZqmAr49500UssAxsW6XpX8z0jzNl42BAr5HV5s=;
	b=GxwpGpvKKsl6WitkgJ5Nw2BA02XtOPKJfyoYTg5+cjQkRe9ZEPya9moY5q546Tmg
	1q07SaWu2zlU60Im7vL0Uxbq350GqKldI7LOEwCyGg8N1WuewhzmLMnQsyCmFSr1dWu
	jVN8eQEniWqW8U2OfCSpBg9gE5OScOcAGYq3kXDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LLomCZqmAr49500UssAxsW6XpX8z0jzNl42BAr5HV5s=;
	b=NENnNTnjSXfVLk34p4MH/ITcmUE+tCY+/8Bg03HnKwy61c9+y7Oz4F91iqyRKW5a
	eBQh9alY7uaWGMSmTtHnnT/sYQx8dUM+ap/fqg1l3Njajy3ChbNuUIXyw7ZscK2P8Wn
	vwa+6I7mpVQ6Txz0j7fzSzrpcgrTce2TWNcZv4Mo=
Content-Type: multipart/mixed; boundary="===============1087784498542759575=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.12.0 SUCCEEDED
Message-ID: <010101860e0b201e-2d5da237-4e9f-4d3b-ad8f-24babc90ea32-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176603

--===============1087784498542759575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.11.0-3.12.0.patch
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
--===============1087784498542759575==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.11.0-3.12.0.patch"

RnJvbSAwZGYyNDQ1NzU3YjAzMjkyMDI0ZjQzNTY1NGJiODI3ZWJlMWI0NTRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMzoxMjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtemlwcDogdXBncmFkZSAzLjExLjAgLT4gMy4xMi4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtemlwcF8zLjExLjAuYmIgPT4gcHl0aG9uMy16aXBwXzMuMTIuMC5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtemlwcF8zLjExLjAuYmIgPT4gcHl0
aG9uMy16aXBwXzMuMTIuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjExLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjEyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xMS4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8z
LjEyLjAuYmIKaW5kZXggNzBlYmFmYzE2OC4uMWIzNmU0MjU0MyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xMS4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTIuMC5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2phcmFjby96aXBwIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03YTcxMjZl
MDY4MjA2MjkwZjNmZTlmOGQ2YzcxM2VhNiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE3YTIy
ZTA1OTI5MjkwYTY3NDAxNDQwYjM5NjkwYWU2NTYzMjc5YmNlZDVmMzE0NjA5ZDlkMDM3OThmNTY3
NjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzNlZmQ2MzkzNjM5OGFhYzc4ZmQ5MmI2ZjQ4NjUx
OTAxMTlkNmM5MWI1MzE1MzJlNzk4OTc3ZWE4ZGQ0MDJlYiIKIAogREVQRU5EUyArPSAiJHtQWVRI
T05fUE59LXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIAotLSAKMi4zNy4zCgo=

--===============1087784498542759575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/core2-32-poky-linux/python3-zipp: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.12.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 35974 to 36365 (+1%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.11.0" to "3.12.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.11.0 [default] to 3.12.0 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.11.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.12.0.dist-info

--===============1087784498542759575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.11.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.12.0.dist-info

--===============1087784498542759575==--


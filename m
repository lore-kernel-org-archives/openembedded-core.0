Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B9EC77B73
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30356.1675272854710616487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iZ10KSex;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101860e0b1fc9-c245be37-5896-4ba0-9d69-269a9b18fd72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YUYH6msnVyr9FTnjSga+t75nFyE2gtEjDPylRHQ1v3Q=;
	b=iZ10KSex83pbnIC5tCABlvw+XeWZIvQy35yuJPAxfY5kinvvmLlygMiAPZ1YFFtG
	doqJmjez5ljjfqqi/lLY+nxydAQ0Y9x62fHm9VgdnDxFuiFD78xrquC+pUt99ixy/CS
	3rk9OFvtsAfNMqbDGWCKrRmCKH+nsWNl8E0IHVI4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YUYH6msnVyr9FTnjSga+t75nFyE2gtEjDPylRHQ1v3Q=;
	b=ZNXdse1GST7wUjUFJcGi+OpiahfsFACrfXf0zGAeu/PRIURAAeorTbbQoNehOOeH
	26yCpf7/5uM7i1Mfa60m2pJ3TJTHD9V/lQOk81Utllx2keMbrXJNX0WIt7O2PgX+q5C
	1qgLyRlcoucv0DffiXnUJgNgVAifpNZ4rh4CtXyk=
Content-Type: multipart/mixed; boundary="===============4797047722669662050=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.2.6 SUCCEEDED
Message-ID: <010101860e0b1fc9-c245be37-5896-4ba0-9d69-269a9b18fd72-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176601

--===============4797047722669662050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wcwidth* to *0.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.5-0.2.6.patch
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
--===============4797047722669662050==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.5-0.2.6.patch"

RnJvbSAxMzcwYjVkNzFhMDY2NzhkYWVhMTFiM2Q2NjY4ZTJhZmZmMWVlNWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMzoxMDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2N3aWR0aDogdXBncmFkZSAwLjIuNSAtPiAwLjIuNgoKLS0tCiAuLi4ve3B5dGhvbjMt
d2N3aWR0aF8wLjIuNS5iYiA9PiBweXRob24zLXdjd2lkdGhfMC4yLjYuYmJ9ICAgICB8IDMgKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuMi41LmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjIuNi5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIuNS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuMi42LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuMi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjIuNi5iYgppbmRleCBhNTMyZDNjNWNiLi4zNjgxNDZkYmE0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjIuNi5iYgpAQCAtNCw4ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVttZDVzdW1dID0gImEwN2E3NWY5OWQzMTZlMTQ4MzhhYzc2MGM4MzFlYTM3IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImM0ZDY0N2I5OTg3MjkyOWZkYjdiZGNhYTRmYmU3ZjAxNDEzZWQzZDk4MDc3
ZGY3OTg1MzBlNWIwNGYxMTZjODMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTUyMjA3ODBhNDA0
ZGJlMzM1Mzc4OTg3MDk3OGU0NzJjZmU0Nzc3NjFmMDZlZTU1MDc3MjU2ZTUwOWIxNTZkMCIKIAog
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHB0ZXN0CiAKLS0gCjIuMzcuMwoK

--===============4797047722669662050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-wcwidth: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.5.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.6.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 8899 to 9001 (+1%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.2.5" to "0.2.6"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 461857 to 498155 (+8%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.2.5 [default] to 0.2.6 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.2.5" to "0.2.6"
Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.5.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info

--===============4797047722669662050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.5.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info

--===============4797047722669662050==--


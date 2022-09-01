Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51285C6FA96
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12461.1662040787048347271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XlPn6sN0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182f959c16c-40cc9b9f-4932-40f4-a9c7-79976631cc84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JISPSC3QJ5qjWACg71eVg+6ZUQYNm2fQLaxloRp4kOs=;
	b=XlPn6sN0kLSwR6W9rush3SzZy8/R+8DUo1Lop5TIK4+Md7bVAoICmtdnSOBEbJx2
	pA923XKwezTz3dO2LmRpEAHr+kUaAw5+OgdXlICXzLX74VQOpHDiDYmrCD7oV1dWhQ4
	IOYIES9LNW5+A01uDq3i9n0OBZVO2RPNyo4cg954=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JISPSC3QJ5qjWACg71eVg+6ZUQYNm2fQLaxloRp4kOs=;
	b=fyg92511cKx5DDJMBl3je8cM+vogKrse12c/nw9mQyHaI/aX7ECsI5kNdDvYC2Wa
	T8HkveIwj2fxZvr7/QTdqvptLTHYBN1X/jBBYc7ZPXfxdD5lwlxnviA9UhJf82lPVlC
	MgGFHpwCd/VTNluPudqjGiKEmWjD8ZKEbags7034=
Content-Type: multipart/mixed; boundary="===============1588323957024990453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.8.3 SUCCEEDED
Message-ID: 
 <01010182f959c16c-40cc9b9f-4932-40f4-a9c7-79976631cc84-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170193

--===============1588323957024990453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.8.1-2022.8.3.patch
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
--===============1588323957024990453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.8.1" to "2022.8.3"
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.3.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.8.1" to "2022.8.3"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.8.1" to "2022.8.3"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.8.1" to "2022.8.3"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.8.1" to "2022.8.3"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.8.1" to "2022.8.3"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.8.1" to "2022.8.3"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 243478 to 243550 (+0%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.8.1 [default] to 2022.8.3 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.8.1" to "2022.8.3"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info

--===============1588323957024990453==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.8.1-2022.8.3.patch"

RnJvbSBjZDZmY2JjNGYyODkxODdjMTM0MDRlYjNiNTY1NjljYzJlMDdmZDVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzowNDozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMi44LjEgLT4gMjAyMi44LjMKCi0tLQogLi4ueXRo
b24zLWR0c2NoZW1hXzIwMjIuOC4xLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMi44LjMuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDIy
LjguMS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjIuOC4zLmJifSAoODMlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjgu
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIy
LjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi44LjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjguMy5iYgppbmRl
eCAzOGY2NDZlNTBhLi5iYzgxOWMwZGQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi44LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC4zLmJiCkBAIC03LDcgKzcs
NyBAQCBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1h
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2U1NmE5OTIwOTQ0MjIzZDZmOTNmZDUxYWRhMTlk
ZDhkYjU1NGFjOTE4MmVmNTJjMWM1YzlkNDk2NmFiMzBhYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIxMjhjODhhMzkzY2QwNDE1NGNlZjRkNGIxMGE2NDNlNDQ3M2FlMjkwYjQzNmU4ZTYxZDJlOTdh
ZThlNTMyNTVkIgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIK
IFJERVBFTkRTOiR7UE59ICs9ICJweXRob24zLXJ1YW1lbC15YW1sIHB5dGhvbjMtanNvbnNjaGVt
YSBweXRob24zLXJmYzM5ODciCi0tIAoyLjMxLjEKCg==

--===============1588323957024990453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.8.1.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info

--===============1588323957024990453==--


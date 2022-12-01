Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFB0C6371A
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.46772.1669908627634578444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LBF7T9RH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010184ce4f7a62-f03cb753-da69-4b3e-a7e5-9b0a40cce64e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+/CxUhOGxMGga+GZd99O07X73gpzJw9fABJ3DLjJ9wk=;
	b=LBF7T9RHuZfnMPhYwLntBV8I7V4WJOWlvWdvVJaCCP2loww7qCy54OEZyURYDpW6
	WZFvL/IYUAMNbE0Z8RZ+Foomu4f8A8GO33+LPXqVbKLi3tRJ4eEvRVPd/9/YWwWk+fR
	lw0V97G+wZLNJw4zuj8vRB926TkhhIvqvejiVU6s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+/CxUhOGxMGga+GZd99O07X73gpzJw9fABJ3DLjJ9wk=;
	b=KvabzwqipUpvjuOa5qAb4RnSav2EsS1JzxaJWvzDh8ORXdDYgW/+R3qbqVMyblpp
	YPCIiYprGyGvQCADBQ83aMyqLNpghmCydPPoOtKsABm1TSEuWMOL3i7qZClKfPXksnE
	N0mQjfWeHSNg1yVUsVC3as2aiUoLKz17ksjBGuc4=
Content-Type: multipart/mixed; boundary="===============2745891913883241387=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 0.10.2 SUCCEEDED
Message-ID: <01010184ce4f7a62-f03cb753-da69-4b3e-a7e5-9b0a40cce64e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174163

--===============2745891913883241387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pathspec* to *0.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.10.1-0.10.2.patch
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
--===============2745891913883241387==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.10.1-0.10.2.patch"

RnJvbSA5OWJiZTg5NzI5MGFhYjIxZmQwZjhhZTgwODRmZmIyMTMxOTk5OGNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOTo0NDoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGF0aHNwZWM6IHVwZ3JhZGUgMC4xMC4xIC0+IDAuMTAuMgoKLS0tCiAuLi4ve3B5dGhv
bjMtcGF0aHNwZWNfMC4xMC4xLmJiID0+IHB5dGhvbjMtcGF0aHNwZWNfMC4xMC4yLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhdGhzcGVjXzAuMTAuMS5i
YiA9PiBweXRob24zLXBhdGhzcGVjXzAuMTAuMi5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNwZWNfMC4xMC4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTAuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcGF0aHNwZWNfMC4xMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNwZWNfMC4xMC4yLmJiCmluZGV4IDhmMmFmMGVjOTkuLjk3
ZTNhZDQwNDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wYXRoc3BlY18wLjEwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBhdGhzcGVjXzAuMTAuMi5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZl
bC9weXRob24iCiBMSUNFTlNFID0gIk1QTC0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04MTVjYTU5OWM5ZGYyNDdhMGM3ZjYxOWJhYjEyM2RhZCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjdhY2U2MTYxYjYyMWQzMWU3OTAyZWI2YjVhZTE0OGQxMmNmZDIzZjRh
MjQ5YjlmZmI2YjlmZWUxMjA4NDMyM2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGY2YmY3M2U1
NzU4ZmQzNjVlZjVkNThjZTA5YWM3YzI3ZDI4MzNhOGQ3ZGE1MTcxMmVhYzZlMjdlMzUxNDFiMCIK
IAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzEuMQoK

--===============2745891913883241387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pathspec: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.2.tar.gz"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 152443 to 154762 (+2%)
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PV changed from "0.10.1" to "0.10.2"
Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.10.2.dist-info

--===============2745891913883241387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.10.2.dist-info

--===============2745891913883241387==--


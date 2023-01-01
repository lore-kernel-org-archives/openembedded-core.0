Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDFFC54EBE
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.20173.1672605966753106553
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d6XVoOdj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101856f159e31-9af7047c-bb97-4cac-8b85-77e24135faf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9xsjHKTK9DT7alzem0OE+GJGNaQLj644DCl2vmSvlKg=;
	b=d6XVoOdjtiAJfpEB+yjaREwKErhnyg3A+XXOB8ggfipac+tOOC8VhQiOJfdOeZJ9
	yU+mmQClWRT+xvLPd7eDEkvvtlZAvv+p+AEB01j+tLhO/UL+IEs9NE3w2R276RIn/Wa
	01uLalpzi7kQ0PmzSc7l+8xdHsNyDDsg2zPBUqYo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9xsjHKTK9DT7alzem0OE+GJGNaQLj644DCl2vmSvlKg=;
	b=KHQFshurKW+uTimGspF8gZmPC0siZ897rWpj4nuPG1CFOpso2kCocEfL7sMinuEI
	yszGUewmosrEIQTY84fQ2Ub1tS5OQoZmm4OQEX3OurzkY+FpTZYaAr0qtM25Cz1la2z
	lbrlBigbve2XwsnBglSrhQx9ZocAl0eh0HsiP2kc=
Content-Type: multipart/mixed; boundary="===============0315814115587057099=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 22.2.0 SUCCEEDED
Message-ID: <010101856f159e31-9af7047c-bb97-4cac-8b85-77e24135faf4-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175250

--===============0315814115587057099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-attrs* to *22.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-22.1.0-22.2.0.patch
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
--===============0315814115587057099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-attrs/python3-attrs: FILELIST: removed "/usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/AUTHORS.rst /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/top_level.txt /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/METADATA /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/RECORD /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/WHEEL /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/LICENSE", added "/usr/lib/python3.11/site-packages/attr/_typing_compat.pyi /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/top_level.txt /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/METADATA /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/RECORD /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/WHEEL /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/LICENSE"
Changes to packages/core2-32-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info moved to /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info
  /usr/lib/python3.11/site-packages/attr/_typing_compat.pyi was added
  /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/AUTHORS.rst was removed

--===============0315814115587057099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-attrs: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/attrs/attrs-22.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/a/attrs/attrs-22.2.0.tar.gz"
packages/core2-32-poky-linux/python3-attrs: PV changed from "22.1.0" to "22.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dbg: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dbg: PV changed from "22.1.0" to "22.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dev: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dev: PV changed from "22.1.0" to "22.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-doc: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-doc: PV changed from "22.1.0" to "22.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-locale: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-locale: PV changed from "22.1.0" to "22.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-src: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-src: PV changed from "22.1.0" to "22.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-staticdev: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-staticdev: PV changed from "22.1.0" to "22.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs: PKGSIZE changed from 381273 to 390038 (+2%)
packages/core2-32-poky-linux/python3-attrs/python3-attrs: FILELIST: removed "/usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/LICENSE /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/WHEEL /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/METADATA /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/AUTHORS.rst /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/RECORD /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/top_level.txt", added "/usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/LICENSE /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/WHEEL /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/METADATA /usr/lib/python3.11/site-packages/attr/_typing_compat.pyi /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/RECORD /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info/top_level.txt"
packages/core2-32-poky-linux/python3-attrs/python3-attrs: PKGV changed from 22.1.0 [default] to 22.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs: PV changed from "22.1.0" to "22.2.0"
Changes to packages/core2-32-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info moved to /usr/lib/python3.11/site-packages/attrs-22.2.0.dist-info
  /usr/lib/python3.11/site-packages/attr/_typing_compat.pyi was added
  /usr/lib/python3.11/site-packages/attrs-22.1.0.dist-info/AUTHORS.rst was removed

--===============0315814115587057099==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-22.1.0-22.2.0.patch"

RnJvbSBiMWQyNTU0MGVhZmVjMjFlZTRhN2I3YjM3ZmE1OWNjZTFmN2U1Mzc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwODowMjo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXR0cnM6IHVwZ3JhZGUgMjIuMS4wIC0+IDIyLjIuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWF0dHJzXzIyLjEuMC5iYiA9PiBweXRob24zLWF0dHJzXzIyLjIuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWF0dHJzXzIyLjEuMC5iYiA9PiBw
eXRob24zLWF0dHJzXzIyLjIuMC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjIuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzIyLjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgy
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNf
MjIuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXR0cnNfMjIuMi4wLmJiCmluZGV4IGJhMDdhYzcxZTMuLjIwZGNjYzY2MzkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yMi4xLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzIyLjIuMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hdHRycy5vcmcvIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTU1NzMx
ODI0Y2Y5MjA1Y2ZhYmVhYjlhMDYwMDg4NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI5YWRj
MjY2NTQ0N2U1MTkxZDBlN2M1NjhmZGU3OGIyMWY5NjcyZDM0NDI4MWQwYzZlMWFiMDg1NDI5YjIy
YjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzkyMjdiZmMyZjAxOTkzYzAzZjY4ZGIzN2QxZDE1
Yzk2OTAxODgzMjNjMDY3YzY0MWYxYTM1Y2E1ODE4NWY5OSIKIAogaW5oZXJpdCBweXBpIHB5dGhv
bl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi4zNy4zCgo=

--===============0315814115587057099==--


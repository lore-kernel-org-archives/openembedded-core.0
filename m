Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483C5C71155
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20178.1672605967124317526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZkvAwbkL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101856f15a064-ef59b954-f157-4b4e-8a03-7a7b0ef57d3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bJF6+nhyGi+RnMvT6SY9f4i0ZKaSuULs4byeMwaOK30=;
	b=ZkvAwbkLfcwx8OcZ9qaYCI/j3rmhRFH/zhu/0IBeca1ISXD97dHOga4ViWZpWKHz
	Fet0RcncFCMuPeh+VONy9DUqH4U60TyW2qJpcrASJQOkdWUDo2qKEoASt1a5UQwsAn1
	TlfkFdYFAdtuJqHenLxR6vEc2nzMM9sm4DL4cdVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bJF6+nhyGi+RnMvT6SY9f4i0ZKaSuULs4byeMwaOK30=;
	b=R20m2espzM9SrErRSy1EopFYbgcWbBSs8BeQ5OIbWEi3E43hESMJ6Xo/x5Xhrb/2
	r1x2VMTZSW/F9PC4exddkz2fDXztvm8KgEqVx39f1kg8YMuej2oq569CYvjh90eSdk3
	y0LWKijza3WcULoVQj5XOqxszYhXIE7v2gWtT9Lk=
Content-Type: multipart/mixed; boundary="===============3789751155037753696=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.23.0 SUCCEEDED
Message-ID: <010101856f15a064-ef59b954-f157-4b4e-8a03-7a7b0ef57d3c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175257

--===============3789751155037753696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycairo* to *1.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.21.0-1.23.0.patch
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
--===============3789751155037753696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info"
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info

--===============3789751155037753696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycairo: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases//download/v1.21.0/pycairo-1.21.0.tar.gz" to "https://github.com/pygobject/pycairo/releases//download/v1.23.0/pycairo-1.23.0.tar.gz"
packages/core2-32-poky-linux/python3-pycairo: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGSIZE changed from 392132 to 392140 (+0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 358648 to 360684 (+1%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.21.0" to "1.23.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.21.0 [default] to 1.23.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info", added "/usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGSIZE changed from 419917 to 423497 (+1%)
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.11/site-packages/pycairo-1.21.0.egg-info moved to /usr/lib/python3.11/site-packages/pycairo-1.23.0.egg-info

--===============3789751155037753696==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.21.0-1.23.0.patch"

RnJvbSBmZWFlZmFlZThiOGQ5Nzc5YjViMDcxNDJmOWFlM2YxNmQ5MGNmNDkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDowOTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljYWlybzogdXBncmFkZSAxLjIxLjAgLT4gMS4yMy4wCgotLS0KIC4uLi97cHl0aG9u
My1weWNhaXJvXzEuMjEuMC5iYiA9PiBweXRob24zLXB5Y2Fpcm9fMS4yMy4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljYWlyb18xLjIxLjAuYmIg
PT4gcHl0aG9uMy1weWNhaXJvXzEuMjMuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjIxLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljYWlyb18xLjIzLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Y2Fpcm9fMS4yMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljYWlyb18xLjIzLjAuYmIKaW5kZXggYjY5MjA2NzgwOS4uNTIxNGEwNWQ1
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y2Fp
cm9fMS4yMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWNhaXJvXzEuMjMuMC5iYgpAQCAtMTMsNyArMTMsNyBAQCBERVBFTkRTID0gImNhaXJvIHB5dGhv
bjMiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vcHljYWly
by0ke1BWfS50YXIuZ3oiCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5
Z29iamVjdC9weWNhaXJvL3JlbGVhc2VzLyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1MTkw
N2YxOGE1NTJkZjkzOGFhMzM4NjY1N2ZmNGI1YTQ5MzdkZGU3MGUxMWFhMDQyYmMyOTc5NTdmNGI3
NGIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWI2MWFjODE4NzIzYWRjMDQzNjczMDEzMTdlYjJl
ODE0YTgzNTIyZjA3YmJkMWY0MDlhZjBkYWRhNDYzYzQ0YyIKIAogUyA9ICIke1dPUktESVJ9L3B5
Y2Fpcm8tJHtQVn0iCiAKLS0gCjIuMzcuMwoK

--===============3789751155037753696==--


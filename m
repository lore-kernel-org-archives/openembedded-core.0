Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57656C88C99
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.32113.1680384533094011503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jGymyzR1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101873eb925c7-85fb9b83-38d8-48f2-96cd-641516991747-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VuwqLqQJ2frcu2AWW3X+OLH+ZaUiYBiyJHDv3dnh0Cc=;
	b=jGymyzR11PRvur+CUotI5pk/iP8sYw8vd4nqenaSRgbZiPLkXZTKxpmtt1tnwy8+
	9/ANpUDKlKzccbpWwXHQwLpuvo7vY9zfMCIpqOcznPCC3vbv8YvJcKovmSjpO4du5PH
	UBLcHkOBY+vMnAxwjDJigcg1EAVHDyM3irw5vJ3w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VuwqLqQJ2frcu2AWW3X+OLH+ZaUiYBiyJHDv3dnh0Cc=;
	b=p9obkEnCcf6v5ZPEk6+l/tD0SCnCoeuQIWR0QQXediiZDpIm3ouslIjKZqGqvk6+
	YKl7UDi5yBlQIvySFnmwLcqiC1Ytk0g/V+8IbaJvwM+kDXUjVTuwsuAYzUZGO2JPN+I
	Xj8oQQXV6Y4UGczDszXYMv9cBpDcH5HM3t/ApEVM=
Content-Type: multipart/mixed; boundary="===============4171494787530680887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 0.11.1 SUCCEEDED
Message-ID: <010101873eb925c7-85fb9b83-38d8-48f2-96cd-641516991747-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179505

--===============4171494787530680887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pathspec* to *0.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.11.0-0.11.1.patch
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
--===============4171494787530680887==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.11.0-0.11.1.patch"

RnJvbSBmZGJmNTUzNjQ1NDM4N2FmN2RiNDBhYTYzMzgwYzcxNGIyZmE4ODFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwOToyOToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGF0aHNwZWM6IHVwZ3JhZGUgMC4xMS4wIC0+IDAuMTEuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtcGF0aHNwZWNfMC4xMS4wLmJiID0+IHB5dGhvbjMtcGF0aHNwZWNfMC4xMS4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhdGhzcGVjXzAuMTEuMC5i
YiA9PiBweXRob24zLXBhdGhzcGVjXzAuMTEuMS5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNwZWNfMC4xMS4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTEuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcGF0aHNwZWNfMC4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNwZWNfMC4xMS4xLmJiCmluZGV4IGJmMGRmYmQ3MjguLmY0
OWJmMDgwZTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wYXRoc3BlY18wLjExLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBhdGhzcGVjXzAuMTEuMS5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZl
bC9weXRob24iCiBMSUNFTlNFID0gIk1QTC0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04MTVjYTU5OWM5ZGYyNDdhMGM3ZjYxOWJhYjEyM2RhZCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjY0ZDMzOGQ0ZTA5MTRlOTFjMTc5MjMyMWU2OTA3YjVhNTkzZjFhYjE4
NTFkZTdmYzI2OTU1N2EyMWIzMGViYmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjc5OGRlODAw
ZmE5Mjc4MGUzM2FjY2E5MjU5NDVlOWExOWExMzNiNzE1MDY3Y2YxNjViODg2NmMxNWEzMTY4NyIK
IAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============4171494787530680887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pathspec: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.11.0.tar.gz;downloadfilename=pathspec-0.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.11.1.tar.gz;downloadfilename=pathspec-0.11.1.tar.gz"
packages/core2-32-poky-linux/python3-pathspec: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 157448 to 158221 (+0%)
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PV changed from "0.11.0" to "0.11.1"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 0.11.0 [default] to 0.11.1 [default]
Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.11.0.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.11.1.dist-info

--===============4171494787530680887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.11.0.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.11.1.dist-info

--===============4171494787530680887==--


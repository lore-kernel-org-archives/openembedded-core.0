Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F5CC6FD3A
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.10761.1663251513206899325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Dr1dIdT0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101834183fd0a-8bf1be14-cfac-4ac3-a204-74cec9ecd22b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IebxC1V6LUms0hrVICxJP++NYScZrExS6v1MuEbi9bc=;
	b=Dr1dIdT0HHixmlVK6f9laTq5wFK6MONn6TmXBsGmTBkjSVEcrLirY/L9cIYvRS5Y
	TQ6ukcfFbCcYp6tfiBuPfn79Ln4CvKS8EPIiph56h3LGorZ/yux1UH4eBP+I9UH5UQ6
	W5xaFVNyJe9fr0z0VzQMVOttDRRv8+nLi7wU+bhw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IebxC1V6LUms0hrVICxJP++NYScZrExS6v1MuEbi9bc=;
	b=hYjodMnEsmsA5yt0Ax84K9mqjI6tGHawrlbgRXYTXN37gSigXS/s6VBj3iE1JHtn
	akAoC5fhAUw6H24OTnIENEdqmBOQKSCKKb0RUSQeOE6nR3ZVeVQe7VdCZBWlU0cOelB
	tgUIzYzR1vyYZqqmWwKDTpuj4tK0eBR2f/fXxRSI=
Content-Type: multipart/mixed; boundary="===============5473209576446821962=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.9.0 SUCCEEDED
Message-ID: 
 <010101834183fd0a-8bf1be14-cfac-4ac3-a204-74cec9ecd22b-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170721

--===============5473209576446821962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.8.1-1.9.0.patch
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
--===============5473209576446821962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info -> /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info, directory renamed /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info/licenses -> /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses, added "/usr/lib/python3.10/site-packages/hatchling/cli/metadata/__init__.py /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__/__init__.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__ was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__/__init__.cpython-310.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__ was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__/__init__.cpython-310.pyc was added

--===============5473209576446821962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.9.0.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 520071 to 533221 (+3%)
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.8.1" to "1.9.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info -> /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info, directory renamed /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info/licenses -> /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses, added "/usr/lib/python3.10/site-packages/hatchling/cli/metadata/__init__.py /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__/__init__.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__ was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__/__init__.cpython-310.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__ was added
  /usr/lib/python3.10/site-packages/hatchling/cli/metadata/__pycache__/__init__.cpython-310.pyc was added

--===============5473209576446821962==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.8.1-1.9.0.patch"

RnJvbSBhZGVjNmZkNmY1MDQyNjRhOTNiOWUzYjRjN2ViZjk2MTk0YzczZmQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6NTE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjguMSAtPiAxLjkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtaGF0Y2hsaW5nXzEuOC4xLmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuOS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhhdGNobGluZ18xLjguMS5i
YiA9PiBweXRob24zLWhhdGNobGluZ18xLjkuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuOC4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuOS4wLmJiCmluZGV4IGJmZGI2NjQ3MTUuLjAx
MWY1ZWQxMTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1oYXRjaGxpbmdfMS44LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWhhdGNobGluZ18xLjkuMC5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2ZSBweXRob24z
LXRvbWxpLW5hdGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1u
YXRpdmUgcHl0aG9uMy1lZGl0YWJsZXMtbmF0aXZlIgogREVQRU5EUzpyZW1vdmU6Y2xhc3MtbmF0
aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjQ0OGIwNGIyM2ZhZWQ2NjliMmI1NjViOTk4YWM5NTVhZjRmZWVhNjZjNWRlZWQzYTEyMTJhYzkz
OTlkMmUxY2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjU3YzczNjJmNDM3Yjk0MjZlNGI5NDIy
OGEyMWQyYWM1ODA0ZmJiMmFiY2IwMWFkZGUyNTQ0YTM1YmIzMDNjZCIKIAogZG9fY29tcGlsZTpw
cmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNyYwotLSAKMi4zMS4xCgo=

--===============5473209576446821962==--


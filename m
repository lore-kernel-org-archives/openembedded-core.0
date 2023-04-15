Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7E3C88CBE
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13797.1681581684288546984
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=i6Q6bK9d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187861438b3-ca4b96d3-8a04-4769-a489-1737e031f80e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lt6RqqqvH7+4kgFBSBB/gsbrN7JF1TK5dOyDLZgfUcY=;
	b=i6Q6bK9dA6JLXiOl9yK+QN+UdoDdkg6mYqrAy9oT5ADf0ZJdYrOqGqnPAXhYj1/T
	rc8wt+Hv8Xf9uQj+IljG8EgOYXoMA8kEUQXlc5WqX5t5ObmoceM6a1shTBEI7NE1OBp
	LBUmyftqP+Gk5cZ0bw7l9Wb6XMETiYUaBDmYF5xU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lt6RqqqvH7+4kgFBSBB/gsbrN7JF1TK5dOyDLZgfUcY=;
	b=OZ783DR8gO31XYgUtqE5CU23nsQNDSkZJTwEf5gb17kTPG3L56lC6VCko/jTcTJb
	0qjIQ41QaG+HF5y2TnP8sXVggG/2zYm5UMY4YD7qbQMMWD1Ge+AmQq4e1Pe3iKPn54u
	lePFpeLLP0DiZmlYzyc5C7+AY+/JTV2S6MKxKC5I=
Content-Type: multipart/mixed; boundary="===============4307969111173275748=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 23.1 SUCCEEDED
Message-ID: <01010187861438b3-ca4b96d3-8a04-4769-a489-1737e031f80e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180041

--===============4307969111173275748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-packaging* to *23.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-23.0-23.1.patch
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
--===============4307969111173275748==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-23.0-23.1.patch"

RnJvbSBiNGU0NzJhYWRlYTQ3ODMzMWU4MjIyNTBmOTdmNTcwMDljNGE1ZWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTA6Mjk6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyMy4wIC0+IDIzLjEKCi0tLQogLi4uL3tweXRob24z
LXBhY2thZ2luZ18yMy4wLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzIzLjEuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjMuMC5iYiA9
PiBweXRob24zLXBhY2thZ2luZ18yMy4xLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGFja2FnaW5nXzIzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMS5iYgppbmRleCBiZGExMjRlMzJjLi41M2QzNTIyZGQ3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2Fn
aW5nXzIzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
Y2thZ2luZ18yMy4xLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9wYWNrYWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgfCBCU0QtMi1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI2YWQyOTdmODkw
N2RlMGZhMmZlMWNjYmQyNmZkYWYzODdmNWY0N2M3Mjc1ZmVkZjhjY2U4OWY5OTQ0NmNmOTciCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYTM5Mjk4MGQyYjZjZmZhNjQ0NDMxODk4YmU1NGIwMDQ1MTUx
MzE5ZDFlN2VjMzRmMGNmZWQ0ODc2N2RkMzM0ZiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0
X2NvcmUKIAotLSAKMi4zOS4yCgo=

--===============4307969111173275748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-packaging: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging: PKGV changed from 23.0 [default] to 23.1 [default]
packages/core2-32-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.0.tar.gz;downloadfilename=packaging-23.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.1.tar.gz;downloadfilename=packaging-23.1.tar.gz"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 23.0 [default] to 23.1 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 23.0 [default] to 23.1 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 23.0 [default] to 23.1 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 23.0 [default] to 23.1 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 23.0 [default] to 23.1 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 23.0 [default] to 23.1 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PV changed from "23.0" to "23.1"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 294633 to 324933 (+10%)
packages/core2-32-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.11/site-packages/packaging-23.0.dist-info -> /usr/lib/python3.11/site-packages/packaging-23.1.dist-info, added "/usr/lib/python3.11/site-packages/packaging/__pycache__/metadata.cpython-311.pyc /usr/lib/python3.11/site-packages/packaging/metadata.py"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGV changed from 23.0 [default] to 23.1 [default]
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.1.dist-info
  /usr/lib/python3.11/site-packages/packaging/metadata.py was added
  /usr/lib/python3.11/site-packages/packaging/__pycache__/metadata.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.1.dist-info
  /usr/lib/python3.11/site-packages/packaging/metadata.py was added
  /usr/lib/python3.11/site-packages/packaging/__pycache__/metadata.cpython-311.pyc was added

--===============4307969111173275748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 294633 to 324933 (+10%)
packages/core2-32-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.11/site-packages/packaging-23.0.dist-info -> /usr/lib/python3.11/site-packages/packaging-23.1.dist-info, added "/usr/lib/python3.11/site-packages/packaging/__pycache__/metadata.cpython-311.pyc /usr/lib/python3.11/site-packages/packaging/metadata.py"
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.1.dist-info
  /usr/lib/python3.11/site-packages/packaging/metadata.py was added
  /usr/lib/python3.11/site-packages/packaging/__pycache__/metadata.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.1.dist-info
  /usr/lib/python3.11/site-packages/packaging/metadata.py was added
  /usr/lib/python3.11/site-packages/packaging/__pycache__/metadata.cpython-311.pyc was added

--===============4307969111173275748==--


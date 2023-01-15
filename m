Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E8DC7115A
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.145719.1673805743817699384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DKCA7DT2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185b698c46d-fe2d3b6a-1cf0-4c44-a31a-e3a4ffd055f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=quVf+0Tq/oc2ntpAIC1fvtZE8eNT//h+T9yWhXBDA2M=;
	b=DKCA7DT2sV64ib8eOeW00tkn3sVLng9c6XVJN5FIYvJEXj36LOtlxYNWwYvbYo7x
	86Kd8VbJggizBfPA56Rn9G6axtPvpSoQV8qEJcMUkgAfMwRvbXitHeiTRXQDP5dotza
	hXq9ENBjw0EslJ322ILGpt6VuzP03+5hoDMkBMoE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=quVf+0Tq/oc2ntpAIC1fvtZE8eNT//h+T9yWhXBDA2M=;
	b=RGXtS2SHsNQmYuY+f3ksv1ij8idV4KQcv9H7X1WCfH4yi1DMi7L8kMXOKi0ojldJ
	kEbfTWiFandIXHIq9c3HGYNr6qjKzml+1NK/ByrmI0DrajONyuDsO3b3WKftKKvKF8A
	W5x1OF686UiKL40g3ne4CjgXcIq2IJW/vUd3dCVU=
Content-Type: multipart/mixed; boundary="===============3925502228223215065=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 23.0 SUCCEEDED
Message-ID: <01010185b698c46d-fe2d3b6a-1cf0-4c44-a31a-e3a4ffd055f9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175908

--===============3925502228223215065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-packaging* to *23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-22.0-23.0.patch
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
--===============3925502228223215065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-packaging: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-22.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.0.tar.gz"
packages/core2-32-poky-linux/python3-packaging: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGV changed from 22.0 [default] to 23.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PV changed from "22.0" to "23.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.11/site-packages/packaging-22.0.dist-info -> /usr/lib/python3.11/site-packages/packaging-23.0.dist-info, removed "/usr/lib/python3.11/site-packages/packaging/__about__.py /usr/lib/python3.11/site-packages/packaging/__pycache__/__about__.cpython-311.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 292566 to 294633 (+1%)
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.11/site-packages/packaging-22.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.0.dist-info
  /usr/lib/python3.11/site-packages/packaging/__about__.py was removed
  /usr/lib/python3.11/site-packages/packaging/__pycache__/__about__.cpython-311.pyc was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.11/site-packages/packaging-22.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.0.dist-info
  /usr/lib/python3.11/site-packages/packaging/__about__.py was removed
  /usr/lib/python3.11/site-packages/packaging/__pycache__/__about__.cpython-311.pyc was removed

--===============3925502228223215065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.11/site-packages/packaging-22.0.dist-info -> /usr/lib/python3.11/site-packages/packaging-23.0.dist-info, removed "/usr/lib/python3.11/site-packages/packaging/__pycache__/__about__.cpython-311.pyc /usr/lib/python3.11/site-packages/packaging/__about__.py"
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.11/site-packages/packaging-22.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.0.dist-info
  /usr/lib/python3.11/site-packages/packaging/__about__.py was removed
  /usr/lib/python3.11/site-packages/packaging/__pycache__/__about__.cpython-311.pyc was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.11/site-packages/packaging-22.0.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.0.dist-info
  /usr/lib/python3.11/site-packages/packaging/__about__.py was removed
  /usr/lib/python3.11/site-packages/packaging/__pycache__/__about__.cpython-311.pyc was removed

--===============3925502228223215065==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-22.0-23.0.patch"

RnJvbSA2NGI5MTJjNzI2MWE0N2YwY2IyMDgzYjE1Y2E1MTg1ZmM3Y2NjNjIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTI6MDU6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyMi4wIC0+IDIzLjAKCi0tLQogLi4uL3tweXRob24z
LXBhY2thZ2luZ18yMi4wLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzIzLjAuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjIuMC5iYiA9
PiBweXRob24zLXBhY2thZ2luZ18yMy4wLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjIuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGFja2FnaW5nXzIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMC5iYgppbmRleCAyMmYwNjY0MTZiLi43YjY5Yzg4MGMx
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2Fn
aW5nXzIyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
Y2thZ2luZ18yMy4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9wYWNrYWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgfCBCU0QtMi1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIxOThlYzIwYmQ0
YzAxN2I4Zjk3MTdlMDBmMGM4NzE0MDc2ZmMyZmQ5MzgxNjc1MGFiNDhlMmM0MWRlMmNmZDMiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYjZhZDI5N2Y4OTA3ZGUwZmEyZmUxY2NiZDI2ZmRhZjM4N2Y1
ZjQ3YzcyNzVmZWRmOGNjZTg5Zjk5NDQ2Y2Y5NyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0
X2NvcmUKIAotLSAKMi4zNy4zCgo=

--===============3925502228223215065==--


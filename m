Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E97C77B62
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10288.1676508396658513289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gUjc4FQ8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018657aff967-8d2b933b-c71d-4976-b1a5-d9e1023fa5be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xVF0d+HiCoWL9wbJRB/0ityM568oaLpPuvdqtr32X6E=;
	b=gUjc4FQ8yPb1HvQs5W8NI/bgR9SAkd6ZaPuQlJzPf6a/SypwKAW7zutf4nCgXdNV
	FbwOwQPU7723Awy9AoeRWYVaxSK3JEoGW1alet9m4SlVUo2JSiMQjc+ixyY/dXUjX+r
	iF5SQBZZLIMqdrHJb0NI/sVirVLUdrbl0M9Ac918=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xVF0d+HiCoWL9wbJRB/0ityM568oaLpPuvdqtr32X6E=;
	b=aiC5+1wMUZvqWUaUx2mgoO/AIL+R4U888Ge4QsC+dD8GIUbEO11pxsPLieS8AyXg
	LAHiQ0jizx28AQrKf6t01V6UK73WN0Sle3yuCxC4SHybcscoYosmz6hESKDzmBQQBQ8
	DH5qTPyNyIUXF4/9a7RscNxtPJ3RyeHdz3IAli2E=
Content-Type: multipart/mixed; boundary="===============3271300506193116246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.13.0 SUCCEEDED
Message-ID: <0101018657aff967-8d2b933b-c71d-4976-b1a5-d9e1023fa5be-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177236

--===============3271300506193116246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.12.2-1.13.0.patch
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
--===============3271300506193116246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.12.2.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.13.0.tar.gz"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.12.2 [default] to 1.13.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.12.2" to "1.13.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 732189 to 733179 (+0%)
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.13.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.13.0.dist-info

--===============3271300506193116246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.13.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.13.0.dist-info

--===============3271300506193116246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.12.2-1.13.0.patch"

RnJvbSA3NjAzOGU1MDk2ZjIyNmFmOWI5OTA1ZDc3ZmFmNTE1NGIyMDdkODUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTY6MDE6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjEyLjIgLT4gMS4xMy4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjEyLjIuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4xMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTIu
Mi5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjEzLjAuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjEyLjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTMuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTIuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjEzLjAuYmIKaW5kZXggN2Y1YTI5
ODc5Yi4uMTdlN2Y4NmJhNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjEyLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjEzLjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSIKIERFUEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRo
b24zLWhhdGNobGluZy1uYXRpdmUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4YTZkNzE5ZDk2
NjUzYTBmMzkwMTA3MmIxMjcxMGM5YzNjYzkzNGY5MDYxYjQ0Mzc3NWM2Nzg5YjQ1MzMzNDk1Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImY4ZDI3NWEyY2M3MjA3MzUyODZiN2MyZTJiYzM1ZGEwNTc2
MWU2ZDM2OTVjMmZhNDE2NTUwMzk1ZjEwYzUzYzciCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsK
ICAgICBleHBvcnQgUFlUSE9OUEFUSD1zcmMKLS0gCjIuMzcuMwoK

--===============3271300506193116246==--


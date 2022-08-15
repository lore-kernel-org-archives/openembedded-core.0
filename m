Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DE7C3276D
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.6333.1660589819989571958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c+k03j8h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182a2ddc825-23aabc0b-a175-438d-b80b-cc776f7176ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HR5fDvV5pxTr9HJ7mBoiD1UWOYQ7H4WjZGUxI6E4YvE=;
	b=c+k03j8h6C7V8D+8l90TPP2NvCE9klonF3WxU8S2tLd1qkksG9n75uqcWnxvvPLi
	2NC5EET7gbOVlH0R9nX0FpCt+wkcVGB7YVyEsOgKHUEIuRumaHWb/lJq6liVaWWaXv7
	JLgNHAXFMOtY3cb8Cx+kVbANlVZdAlNXcTpP2tlg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HR5fDvV5pxTr9HJ7mBoiD1UWOYQ7H4WjZGUxI6E4YvE=;
	b=bFrLV7SvhE3jFaJVHf7VqrWQPXKQ/XhKB49crxfPZZu1goNyJiJIPo6ynBURK57K
	/QTRUTyyhlouGvBBNFzg7JrJtQCHrHdS9DoGd29zV49UUZDAd6GtEY4vZgjvRlhbwq+
	Nnnq82tufiyW+kVugt80lxMYYypKERH11gzJHBBM=
Content-Type: multipart/mixed; boundary="===============4767283098487154585=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.7.1 SUCCEEDED
Message-ID: 
 <01010182a2ddc825-23aabc0b-a175-438d-b80b-cc776f7176ae-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169371

--===============4767283098487154585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.6.0-1.7.1.patch
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
--===============4767283098487154585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.6.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.7.1.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info -> /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info, directory renamed /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info/licenses -> /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info/licenses, added "/usr/lib/python3.10/site-packages/hatchling/metadata/__pycache__/classifiers.cpython-310.pyc /usr/lib/python3.10/site-packages/hatchling/metadata/classifiers.py"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.6.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.6.0" to "1.7.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 436650 to 518236 (+19%)
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info
  /usr/lib/python3.10/site-packages/hatchling/metadata/classifiers.py was added
  /usr/lib/python3.10/site-packages/hatchling/metadata/__pycache__/classifiers.cpython-310.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info
  /usr/lib/python3.10/site-packages/hatchling/metadata/classifiers.py was added
  /usr/lib/python3.10/site-packages/hatchling/metadata/__pycache__/classifiers.cpython-310.pyc was added

--===============4767283098487154585==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.6.0-1.7.1.patch"

RnJvbSBlOTE0NDk5YjkxNzlkNjFlYWRjNWZkYzUyMzI3YzRmMWFiMDZiNmZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6MDI6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjYuMCAtPiAxLjcuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtaGF0Y2hsaW5nXzEuNi4wLmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuNy4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhhdGNobGluZ18xLjYuMC5i
YiA9PiBweXRob24zLWhhdGNobGluZ18xLjcuMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuNi4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjcuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuNy4xLmJiCmluZGV4IGUwNmJkZjAyZWMuLjgz
YzFjZTFhYzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1oYXRjaGxpbmdfMS42LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWhhdGNobGluZ18xLjcuMS5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2ZSBweXRob24z
LXRvbWxpLW5hdGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1u
YXRpdmUgcHl0aG9uMy1lZGl0YWJsZXMtbmF0aXZlIgogREVQRU5EUzpyZW1vdmU6Y2xhc3MtbmF0
aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImJkNmU4NTA1ZGU1MTFhYzQyMTdmZjUwOTI3ZjZkMTg0NTQ5NDYwOGU0MDFlNjNhNjJiODMwYzMx
ZmI2MTM1NDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGFlZjBjZjU1NWEzMGYyZTk4Y2IyOTVj
MGFjMzI0YzY2ZmM2NmYzM2M5NWVhMDNjYjc5ZTE1MzZiMWUxZjQ5MiIKIAogZG9fY29tcGlsZTpw
cmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNyYwotLSAKMi4zMS4xCgo=

--===============4767283098487154585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 436650 to 518236 (+19%)
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info/licenses -> /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info/licenses, directory renamed /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info -> /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info, added "/usr/lib/python3.10/site-packages/hatchling/metadata/__pycache__/classifiers.cpython-310.pyc /usr/lib/python3.10/site-packages/hatchling/metadata/classifiers.py"
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info
  /usr/lib/python3.10/site-packages/hatchling/metadata/classifiers.py was added
  /usr/lib/python3.10/site-packages/hatchling/metadata/__pycache__/classifiers.cpython-310.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.6.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.7.1.dist-info
  /usr/lib/python3.10/site-packages/hatchling/metadata/classifiers.py was added
  /usr/lib/python3.10/site-packages/hatchling/metadata/__pycache__/classifiers.cpython-310.pyc was added

--===============4767283098487154585==--


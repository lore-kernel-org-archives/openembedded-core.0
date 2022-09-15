Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DCDC6FA96
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10628.1663251514666329470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b4BQz/Uh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010183418402ce-6a2211fb-483d-4418-8ceb-b6fdbdb33822-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vxKlToRSsP4oo3vR6B5ZnSByJGac2DEeqeOA23Kin1Y=;
	b=b4BQz/Uh17UMCHXichelzvOSUI+xnm4t6bTLvjKvv9zBza4sOeFZNNEZHAAzSXdZ
	KLL3mZ3vC9SL0nh8vL2anLqeW9MeHX64LyDbNwovRovSdhpIDuZZeAb4RG8pc4bxAWR
	+MZS3wK/vZvUl/A3cdzQSCPl/BwS96/U7m/2nqwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vxKlToRSsP4oo3vR6B5ZnSByJGac2DEeqeOA23Kin1Y=;
	b=Cfj59BemPxSmgDgfz1zaKYxrmVfbI37TwTuwH3QMR54JvIe9vSQ8izLl22aROe1G
	TyzQ2dykFw2JGuUZknTCz7sbsqyz4XVJJRaDnm6Bi/R/dCjnHdhw7+v/G3LRTXt21S1
	2elwTvGoqcUAYJmJlB3D6OihZHN7PD1dgI8KIGn4=
Content-Type: multipart/mixed; boundary="===============3131237656985801002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 221 SUCCEEDED
Message-ID: 
 <01010183418402ce-6a2211fb-483d-4418-8ceb-b6fdbdb33822-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170761

--===============3131237656985801002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *221* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-220-221.patch
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
--===============3131237656985801002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-220.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-221.dist-info

--===============3131237656985801002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1060074 to 1060658 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "220" to "221"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-220.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-221.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 220 [default] to 221 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "220" to "221"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-220.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-221.dist-info

--===============3131237656985801002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-220-221.patch"

RnJvbSA4OGM1MGM2MGZiMzg5M2U5ZmU5M2I0NzVjYzUxMjkzZjMwMmFlOTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTM6MzA6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIyMCAtPiAyMjEKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjIwLmJiID0+IGRpZmZvc2NvcGVfMjIxLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMjAuYmIgPT4gZGlmZm9zY29wZV8y
MjEuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yMjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyMS5iYgppbmRleCBkYzU1NjQ3
N2ZhLi5jODAxMjAwZDdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjIwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNzg3M2UxM2FjOGIxMWI2MzRlZTM0OTBiNzBiMDU2YzZhNmJhZTljZmI3OTRkNmJhN2Ni
NDNlNzc5N2IyYTgyOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3YjE3MjRlOWIxZTVhYzY1OTdj
YWMwN2QwYWNkMjY2MWRiMWJjZjBkNmE5YjJlODdiZTIxYjVlMzgwNmJlOWY4IgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzEuMQoK

--===============3131237656985801002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 113 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3131237656985801002==--


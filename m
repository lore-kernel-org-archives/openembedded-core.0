Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E0FC4167B
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.24222.1665871393260707658
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jV+e1+2X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac3fb4-e0102853-b2f6-427e-b2d0-e8153bebdce1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CLQPXrlnqevsWyV+1vfcGTI5WsQ+SEUCnp8as2pvGZw=;
	b=jV+e1+2XE31g/hkjhwUwUfSfx02W/7udpYOrvvGyzO53AE2qhXWf0vGQJa9rZiUj
	gWH1uWf6ez21uoHgSscmBF+qOHNKPNO2jlMzj6k8Ucg9R9S14GM4NDpGcdZWbqrOQQx
	GZcoNcrqVM/RTaGMcmL0H9ropaUcr6ey+sL8a8sY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CLQPXrlnqevsWyV+1vfcGTI5WsQ+SEUCnp8as2pvGZw=;
	b=D67a4GrwFoXkvOeMojPMn6tqK17m6BihLXJ3NmHJGDecbB0sbNb7NuY8lOZ+bHK7
	sb5Ol/5ZFH611t+T/jOdTCalpiiP8T8Whfp11ipHieF7VcWu7gsQz17XSzgrXgsaXGR
	wyB0h0whmoOBNhzqhGxagsRyeybkQyAjm1RtG3g4=
Content-Type: multipart/mixed; boundary="===============4534412654644896197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 224 SUCCEEDED
Message-ID: <01010183ddac3fb4-e0102853-b2f6-427e-b2d0-e8153bebdce1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171858

--===============4534412654644896197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *224* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-221-224.patch
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
--===============4534412654644896197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-221.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-224.dist-info

--===============4534412654644896197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-221-224.patch"

RnJvbSAwZGNiZjA2ZTFhMTA0MzNlZGI5MDI1YmM5YzE5Yjk5YWY4YTcxYzZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTk6NTA6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIyMSAtPiAyMjQKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjIxLmJiID0+IGRpZmZvc2NvcGVfMjI0LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMjEuYmIgPT4gZGlmZm9zY29wZV8y
MjQuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yMjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIyNC5iYgppbmRleCBjODAxMjAw
ZDdjLi41ZDYzNGI4MDczIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjIxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjQuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiN2IxNzI0ZTliMWU1YWM2NTk3Y2FjMDdkMGFjZDI2NjFkYjFiY2YwZDZhOWIyZTg3YmUy
MWI1ZTM4MDZiZTlmOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxOTIwZWJkY2E0MGU4NWYwMTlh
ODRlMDIyMGU0YTc5ZjAwZmZkYWZjMGY3OGUxZjFlMjIxOTEyM2Q1YzA4ZGZiIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzEuMQoK

--===============4534412654644896197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============4534412654644896197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1060658 to 1060814 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-221.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-224.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "221" to "224"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-221.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-224.dist-info

--===============4534412654644896197==--


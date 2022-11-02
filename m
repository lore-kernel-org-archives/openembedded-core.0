Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9224C64ED3
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.858.1667349632528139790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CDwljVPL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c8571e-51219b56-6d28-4a44-afbd-b4681a1e2883-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xgzAVkbumk++edrDgd9mnbLjxcxa4ILKFiHBx/ZTHEI=;
	b=CDwljVPLk3/tO60KkhIvFp4av7n6vUYqrf8KeJbCBjQQmcrsJ0ks26XEPwGVtqzI
	BSpFbUL5zsQ5KaZv6l54S4h62H2IHopqSE3HQFRvXIchc4MpWQYhVNEhZP5WhF+nWcS
	/7nOtycM+j9BONq5r0zxoOA6t5Vlp/sl82Va3FIQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xgzAVkbumk++edrDgd9mnbLjxcxa4ILKFiHBx/ZTHEI=;
	b=Ri/SiycNvIM4uuEm+eXjeTY+Gnjm9c3jslpjPLsE3ki4aCwFNxZDu6lKjiFVEgtC
	xFdyFxEagyeXaetZRHsp7BAsTuYw7mjTnN2nvngV9TRzgfe5J34qq2X2YI8IQv+TpNz
	5nmaJEm/3RAT8n2Iy11/rwZNiDfw+XS6gFkLLIiY=
Content-Type: multipart/mixed; boundary="===============6511871964886667267=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.11.1 SUCCEEDED
Message-ID: <0101018435c8571e-51219b56-6d28-4a44-afbd-b4681a1e2883-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172421

--===============6511871964886667267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.11.0-1.11.1.patch
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
--===============6511871964886667267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.11.1.tar.gz"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 681718 to 682591 (+0%)
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info

--===============6511871964886667267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info

--===============6511871964886667267==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.11.0-1.11.1.patch"

RnJvbSAyMmVmMGY2MDAyMjYzYjgxZDk5ZGNhZjUyNzY0ODUyNGQwZmUyMGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwOTo1OToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMTEuMCAtPiAxLjExLjEKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMTEuMC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjExLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4xMS4w
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMS4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMS5iYgppbmRleCAwMGM0YzU5
OGI1Li5kOThkODc0NjA2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMS5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXRvbWxpLW5hdGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBh
Y2thZ2luZy1uYXRpdmUgcHl0aG9uMy1lZGl0YWJsZXMtbmF0aXZlIgogREVQRU5EUzpyZW1vdmU6
Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImEyNjNhOGM1MDgxN2NkMmRmY2Q0ZGQ2ZDBkNTVhNWViY2IwNzhlZWVjOTg1OGNj
M2QwNTYzMTRiMzQzOGVjOGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWY4NDM2MWY3MGNmM2E3
YWI5NTQzYjBjM2VjYzY0MjExZWQyYmE4YTYwNmE3MWViNmE0NzNjMWM5YjA4ZTFkMCIKIAogZG9f
Y29tcGlsZTpwcmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNyYwotLSAKMi4zMS4x
Cgo=

--===============6511871964886667267==--


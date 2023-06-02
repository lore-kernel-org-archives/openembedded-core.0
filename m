Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440C1CCA465
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.7522.1685693431123642157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZSGwQ3UR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101887b287ef8-c5484c79-316c-470b-8dc3-51d385773098-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IJ+E2iPWccMvKGCUXEvdBIf3v+vGwmrjJwV5VpI/NXo=;
	b=ZSGwQ3URf+998cvXrbbWgey+YJFRh5FG3TLHKt5z7iB5t7nqIWEiwHc8t5XiBFoE
	UsBI2zbz6VF331rxWuudve+jdJbqXqNmGvuBPiF17Sf2eWNxM2N099OFXpACPrZGggt
	kW4LNiQxbJyNN+rwUZivYoEM2XcNlVu+XXKOuEAo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IJ+E2iPWccMvKGCUXEvdBIf3v+vGwmrjJwV5VpI/NXo=;
	b=qBFDYTIn9rgtvGkg0dP7DvSI9jhWvcqn/gUolsi2a4QS6hreZGh3Uv032/560I0P
	A56fV831Udr2/ujfuDfQT7aSgt2ivAu6SqfPpY1qJhG9pY5aRxlBNaFThhkR9ldZzoD
	sGq7ztn97ePletn/7HYELEr3ZNfAuu8fvSOEh27Y=
Content-Type: multipart/mixed; boundary="===============4533355513198733925=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.1.1 SUCCEEDED
Message-ID: <010101887b287ef8-c5484c79-316c-470b-8dc3-51d385773098-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182172

--===============4533355513198733925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.1.0-1.1.1.patch
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
--===============4533355513198733925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.1.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info

--===============4533355513198733925==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.1.0-1.1.1.patch"

RnJvbSA2ZmEzMGRiMzYzOTBjZDJkOGYwOTE1MjNmNjE4Y2E2NTBhZjQyMDNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMzowOToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuMS4wIC0+IDEuMS4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi97bWVzb25fMS4xLjAuYmIgPT4gbWVzb25fMS4xLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL3ttZXNvbl8xLjEuMC5iYiA9PiBtZXNvbl8xLjEuMS5iYn0gKDk4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xLjEuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEu
MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xLjEu
YmIKaW5kZXggMTE5MGQ1YzM0ZC4uNTAwZTEzNzc1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL21lc29uXzEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbl8xLjEuMS5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiR7R0lU
SFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0ke1BWfS50YXIuZ3ogXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1h
Z2Fpbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOTYxNmM0
NGNkNmM1MzY4OWZmOGYwNWZjNjk1OGE2OTNmMmUxN2MzNDcyYThkYWY4M2NlZTU1ZGFiZmY4Mjlm
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQwNGI1NDFmOTdjYTQzOWZiODJmYWI3ZDBkNDgwOTg4
YmU0YmQ0ZTYyNTYzYTVjYTM1ZmFkYjU0MDA3MjdiMWMiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi4zOS4yCgo=

--===============4533355513198733925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.1.0/meson-1.1.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.1.1/meson-1.1.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 5354 (-0%)
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 7964390 to 7977816 (+0%)
packages/core2-32-poky-linux/meson/meson: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.1.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info

--===============4533355513198733925==--


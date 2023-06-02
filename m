Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7C5C88CB1
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7537.1685693433978752036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WJeMEPvh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b288d44-7f78b47a-b8e3-47b0-a791-41ed309b1385-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ge6+klLp3cR166BKn03BjdEXyy6bS7GQgyVB1OoTLiE=;
	b=WJeMEPvhn4HbYdR7VZVJjT/iTGgoY2JAFADSX26/M6Bb0HI69Hw9S+bLdcCXgxHX
	bULDKcewo5qVPEO3yjua/XjY/4EasFV2z7fqF7yKDlhAOHNfB79QrlwaKNsmf0C9wtc
	+sTUv0DVTnddF0bdsjSqV5x2BDKVQewK2s6cZb/Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ge6+klLp3cR166BKn03BjdEXyy6bS7GQgyVB1OoTLiE=;
	b=a1lVGcdxDcowOYOVkxS8kainWbVOwT64CNU0Png4UFWIzCdOg7hKKQRxWO+kZnmS
	jqpLLnOeeviwWaSpRL1zXtIY0FRRJmXLzf6Q9X4Qbxyq8/JR744eLvxd0ZOa8a1aecY
	cvPPA012Nm1GlSdueARoEC0UzNSNYSCwBOHwFkzE=
Content-Type: multipart/mixed; boundary="===============7283603844715979198=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxpm: upgrading to 3.5.16 SUCCEEDED
Message-ID: <010101887b288d44-7f78b47a-b8e3-47b0-a791-41ed309b1385-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182250

--===============7283603844715979198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxpm* to *3.5.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxpm-upgrade-3.5.15-3.5.16.patch
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
--===============7283603844715979198==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxpm-upgrade-3.5.15-3.5.16.patch"

RnJvbSA4YmYyZTNhMzI3MTMwZWQ1NmIwNGEwYWZkYjMxYjAxY2RjODViZmUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMjozNjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhwbTogdXBncmFkZSAzLjUuMTUgLT4gMy41LjE2CgotLS0KIC4uLi94b3JnLWxpYi97bGlieHBt
XzMuNS4xNS5iYiA9PiBsaWJ4cG1fMy41LjE2LmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieHBtXzMuNS4xNS5iYiA9PiBsaWJ4cG1fMy41LjE2
LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4cG1fMy41LjE1LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhwbV8z
LjUuMTYuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL2xpYnhwbV8zLjUuMTUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjE2LmJiCmluZGV4IDMyYTJiMzUzNTYuLmMzZDAx
ZjFiYjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1f
My41LjE1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41
LjE2LmJiCkBAIC0yMiw2ICsyMiw2IEBAIFBBQ0tBR0VTID0rICJzeHBtIGN4cG0iCiBGSUxFUzpj
eHBtID0gIiR7YmluZGlyfS9jeHBtIgogRklMRVM6c3hwbSA9ICIke2JpbmRpcn0vc3hwbSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjYwYmI5MDZjNWMzMTdhNmRiODYzZTM5YjY5YzRhODNmZGJk
MmFlMjE1NGZjZjQ3NjQwZjhmZWZjOWZkZmQxYzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTZi
YzVkYTdhNjlkYmQ5YmNjNjdlODdjOTNkNDkwNGZlMmY1MTc3YTA3MTFjNTZlNzFmYTJmNmVmZjY0
OWY1MSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCi0tIAoyLjM5LjIKCg==

--===============7283603844715979198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxpm/cxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/cxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXpm-3.5.15.tar.xz" to "https://www.x.org/releases//individual/lib/libXpm-3.5.16.tar.xz"
packages/core2-32-poky-linux/libxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PKGSIZE changed from 321732 to 321952 (+0%)
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-dev: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-dev: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-doc: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-doc: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-locale: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-locale: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-src: PKGSIZE changed from 298355 to 298184 (-0%)
packages/core2-32-poky-linux/libxpm/libxpm-src: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-src: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-staticdev: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-staticdev: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/sxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/sxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]

--===============7283603844715979198==--


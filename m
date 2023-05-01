Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF60CA9EC4
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107890.1682976350243657667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JhH8AcIl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9352a9c-518f3de2-e73c-48f4-9408-eb309c95fab8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=pse5KdMIleNQx8Q00SHk2Q3F8ZymXy+v0KquBtS+c3Q=;
	b=JhH8AcIl2rRkBNlYPYIIl3kV12SY56UKa3nAPP0Cco/m2iapE472UXh21StH15sw
	KfLVYy0JZdc2bg3/OdzWdFVW/6Eahy1FTTP82OwQoxmzc4qQRTFl+jSFNHFdUphLuf6
	6cokxQcX2cnQPvrhC+v3mYTxhLFnkJ6Ad8AqSEE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=pse5KdMIleNQx8Q00SHk2Q3F8ZymXy+v0KquBtS+c3Q=;
	b=q+XGsnSBHgrYd+G0ezcDogpH25FBmdOFuq/Y/cx8+bOb7kY1o2iPnm+rIX99sUMo
	ozpHFpRyKt51veBlOIqYVJvbHabaTnRjipnfZYmw/u4o6srjArxft1KUPf3DSFAJYyY
	ahTsnysWwR25gpOmkBrjTwXqlPdUcPiZGPAHyNKs=
Content-Type: multipart/mixed; boundary="===============5685362371010342293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxpm: upgrading to 3.5.16 SUCCEEDED
Message-ID: <01010187d9352a9c-518f3de2-e73c-48f4-9408-eb309c95fab8-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180668

--===============5685362371010342293==
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
--===============5685362371010342293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxpm-upgrade-3.5.15-3.5.16.patch"

RnJvbSA5ZTJmYjZmODdkNjcyODliN2RhMDBlOThhOTNlNTQzYWY1MGVjMTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxOTowNTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
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

--===============5685362371010342293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxpm/cxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/cxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXpm-3.5.15.tar.xz" to "https://www.x.org/releases//individual/lib/libXpm-3.5.16.tar.xz"
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PKGSIZE changed from 315612 to 315784 (+0%)
packages/core2-32-poky-linux/libxpm/libxpm-dev: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-dev: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-doc: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-doc: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-locale: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-locale: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-src: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-src: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-src: PKGSIZE changed from 298355 to 298184 (-0%)
packages/core2-32-poky-linux/libxpm/libxpm-staticdev: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-staticdev: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/sxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/sxpm: PV changed from "3.5.15" to "3.5.16"

--===============5685362371010342293==--


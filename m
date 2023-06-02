Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D33CCA464
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.7523.1685693431199444746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GZwiLEnU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101887b28800f-ac05fcda-25a8-4ee1-8348-addb73c013ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YG2ykdwLep+Cxhtz+icSggEZwnWSlhh0zwbnDNodb3c=;
	b=GZwiLEnU3serQnLRdNHcuolmEZ+F1ffcl85GVyo+dUJ7uUyIDhYVAwPu0fNe26y5
	PwV1+V3zHA0I4Q4XL1IGsjmw9CUKv6nawKjLcjAfW4U8dP6+2yPIzx39LeJdVXvuKu5
	82FGtCwxUE2yLTwmW43RH933WUa8T51Vox78tgII=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YG2ykdwLep+Cxhtz+icSggEZwnWSlhh0zwbnDNodb3c=;
	b=K4hLtQdixw4QlK/B611ng+QQFR3Ac5zohWLViW7UEl8s+Z4ndsMrLAgeBR/LJbwl
	f9eAIO16nzKsdJyEV0SSbVwxkhFxCGljvxFo0Iw2ZbRfvmILni0gSKn8uvEj75G8Vrl
	btDDVMdFzJvuUMXawiCttNvAqAdsqjR3mbctfN/A=
Content-Type: multipart/mixed; boundary="===============0179327467072585547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 1.9.5 SUCCEEDED
Message-ID: <010101887b28800f-ac05fcda-25a8-4ee1-8348-addb73c013ea-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182177

--===============0179327467072585547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *1.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-1.9.4-1.9.5.patch
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
--===============0179327467072585547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-1.9.4-1.9.5.patch"

RnJvbSA3NzEyNDFiNDMwOTNiZmE0YTA2NzhiOTA0NjIxZTU3ODYzZTE4M2Q4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMzoyMTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMS45LjQgLT4gMS45LjUKCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZf
MS45LjQuYmIgPT4gcGtnY29uZl8xLjkuNS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BrZ2NvbmYve3BrZ2NvbmZfMS45LjQuYmIgPT4gcGtnY29uZl8xLjkuNS5i
Yn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzEuOS40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8xLjku
NS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzEuOS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzEuOS41LmJiCmluZGV4IGFiMGYzNzEwOTMuLjRiZGYwM2M1NzQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMS45LjQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8xLjkuNS5iYgpA
QCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRp
dmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImRhY2NmMWJiZTVhMzBkMTQ5YjU1NmM3ZDJmZmZmZWFmZDc2ZDdiNTE0ZTI0OTI3
MWFiZGQ1MDE1MzNjMWQ4YWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWFjMTY1NmRlYmIyNzQ5
NzU2MzAzNmY3YmZmYzI4MTQ5MGY4M2Y5Yjg0NTdjMGQ2MGJjZmI2MzhmYjZiNjE3MSIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMKIAotLSAKMi4zOS4yCgo=

--===============0179327467072585547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.9.4.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.9.5.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-32-poky-linux/pkgconf: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 257412 to 257372 (-0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24018 to 24019 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 268613 to 268524 (-0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf: PV changed from "1.9.4" to "1.9.5"

--===============0179327467072585547==--


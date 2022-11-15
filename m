Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB90AC47089
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.5320.1668517535777508053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=C61TNniy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101847b651d59-a9da0e34-bd7a-4eed-b9cc-c4949ae87b46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8phlgKGcDuHVFDWTkXh0eNvr2gFjh1189Z9TtPxB/Js=;
	b=C61TNniyQPhLMo2nQqT08TpYWlNw78+X3u0fLW4rgaySr090qy6UqQPoKEEjVolx
	/i1M+kNhdsm+P/mYFKPbiJns2go3AqLuBcgYSxwJz9/Kg7/ivtwxZG2ho6V5wqnUlJ8
	rEByHvhJ8L57GICayemltho8Bz+51RfAbPNUDHlM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8phlgKGcDuHVFDWTkXh0eNvr2gFjh1189Z9TtPxB/Js=;
	b=Srsz+Xcpp+NC0QfrUQpuf6kHhEnx9JPvGJOaAKHMN0lPp4GfylOy+Euggft1dc6Z
	uQjhKRUIrJxtsrEjmFDwQBhS9/Byz/k+iBS2GvvGsZhirjVjF/SbKpIwnrxqLgsmvGe
	Fy3UtxGNKWBmKdsRO6Y+CsUUCGFq215sbIAe/sKU=
Content-Type: multipart/mixed; boundary="===============5771050568261082759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.7.3 SUCCEEDED
Message-ID: <010101847b651d59-a9da0e34-bd7a-4eed-b9cc-c4949ae87b46-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173286

--===============5771050568261082759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.7.2-4.7.3.patch
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
--===============5771050568261082759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.7.2-4.7.3.patch"

RnJvbSBkY2QzNzU1OWEzMDg0Mjg3ZTM1YWNjODkzYzczN2VmZDMxM2I0MTIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDc6MjM6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC43LjIgLT4gNC43LjMKCi0tLQogLi4uL2NjYWNoZS97Y2NhY2hlXzQu
Ny4yLmJiID0+IGNjYWNoZV80LjcuMy5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuNy4yLmJiID0+IGNjYWNoZV80LjcuMy5iYn0g
KDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80
LjcuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuNy4zLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2Fj
aGUvY2NhY2hlXzQuNy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hl
L2NjYWNoZV80LjcuMy5iYgppbmRleCBiODU5OGFmNjM5Li5kMWE2OGJiNTc1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjcuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjcuMy5iYgpAQCAtMTQsNyArMTQsNyBA
QCBERVBFTkRTID0gInpzdGQiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9h
ZC92JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEteHhoYXNoLmgt
Rml4LWJ1aWxkLXdpdGgtZ2NjLTEyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjZiMzQ2ZjQ0MTM0MmEyNWE2YzFkN2UwMTA5NTdhNTkzZjQxNmU5NGI1ZDY2ZmRm
MmUyOTkyOTUzYjM4NjBiOWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTc3ODQxZGY5ZTlkOTY1
OWQ1OGEyZjRlMGY2ZWFjZWI3ZTI5ODE2OTg4ZmZiMmIxMjM5MGUxN2IxMDliNGFjNCIKIAogaW5o
ZXJpdCBjbWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi4zMS4xCgo=

--===============5771050568261082759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 24714764 to 24674728 (-0%)
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1866320 to 1867352 (+0%)
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1587236 to 1583140 (-0%)
packages/core2-32-poky-linux/ccache: PKGV changed from 4.7.2 [default] to 4.7.3 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.7.2" to "4.7.3"
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.7.2/ccache-4.7.2.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.7.3/ccache-4.7.3.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"

--===============5771050568261082759==--


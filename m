Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F79C64EC2
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.46818.1669908626291012531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AWLnsKIQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010184ce4f7862-4f2d16b0-f1f0-4052-8078-70ccb274770f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p9uxttmcGaYrC7eu5dCLwM606zFlQo9xTbayztEHNNs=;
	b=AWLnsKIQ36KJgQFvLSufB9EFx9HZGUR2TtnaUfFyiZsITpG/MMfFPAF4IrhNBbhd
	4Qs02t+m9us9Dhlf3YsEUxiMzePNMe7kZJ6zRgugUin7r3/TKia96ZGuYMn/iXsemfM
	WOcR45cuTnwOkVXpNhJSn7hpYUrMfzgSQg7dClwo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p9uxttmcGaYrC7eu5dCLwM606zFlQo9xTbayztEHNNs=;
	b=afZequSaVJYSCBJcEcyUNi8NYxYZap97S098ugfHbsepIw//rrVvluYlobGIPVwg
	85f/l5zds5R5GNBZcaVWgmkwYjaq4tgkFWJPlrcZLVKHqAzMjErkvikk4axGO5z7xZ4
	8RDCNwU1kRM0CXctrOopCj30/iCtyw4anY7Y8Co8=
Content-Type: multipart/mixed; boundary="===============3189340379777279307=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.64.1 SUCCEEDED
Message-ID: <01010184ce4f7862-4f2d16b0-f1f0-4052-8078-70ccb274770f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174134

--===============3189340379777279307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.64.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.64.0-0.64.1.patch
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
--===============3189340379777279307==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.64.0-0.64.1.patch"

RnJvbSA5ZDEzN2I0ZmYyMDY3ZDQ1YjBiNmQzYTIyMDYxODM5YmQxYWE5NjdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwODozNTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDAuNjQuMCAtPiAwLjY0LjEKCi0tLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24ve21lc29uXzAuNjQuMC5iYiA9PiBtZXNvbl8wLjY0LjEuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL3ttZXNvbl8wLjY0LjAuYmIgPT4gbWVzb25fMC42NC4xLmJifSAo
OTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8wLjY0
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMC42NC4xLmJiCnNpbWls
YXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbl8wLjY0LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNv
bl8wLjY0LjEuYmIKaW5kZXggODRjM2M4NDUxNS4uMWVlY2I5NTc2YyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzAuNjQuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMC42NC4xLmJiCkBAIC0xOCw3ICsxOCw3IEBAIFNSQ19V
UkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21lc29uLSR7UFZ9LnRhci5n
eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWlzX2RlYmlhbmxpa2UtYWx3YXlzLXJldHVybi1G
YWxzZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNoZWNrLWZvci1jbGFuZy1iZWZv
cmUtZ3Vlc3NpbmctZ2NjLW9yLWxjYy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJjNWUyN2UwOTFjMmEzNWI5MDQ5ZTE1MmE2NTM1MDQ1ZWJiZDA1NzI1M2FlYjY3
ODU2ZGU2ZWNiYjdiOTE3YmFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhOGUwMzBjMjMzNGY3
ODIwODVmODE2MjcwNjJjYzZkNGE2NzcxZWRmMzFlMDU1ZmZlMzc0ZjllNmIwODlhYjkiCiAKIGlu
aGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKIAotLSAK
Mi4zMS4xCgo=

--===============3189340379777279307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/0.64.0/meson-0.64.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch" to "https://github.com/mesonbuild/meson/releases//download/0.64.1/meson-0.64.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch"
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "0.64.0" to "0.64.1"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 7869687 to 7874621 (+0%)
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.64.0 [default] to 0.64.1 [default]
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-0.64.1.dist-info

--===============3189340379777279307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-0.64.1.dist-info

--===============3189340379777279307==--


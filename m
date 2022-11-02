Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C95C636F9
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.854.1667349634052922150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AJWyNNCF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c85fd9-6d43d4c0-f865-4720-8a01-af4c0d241bc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k1Q1pIVLB0h1R86VHLoj0M76fBv7Nu+KBGTvycWyvws=;
	b=AJWyNNCFCBURWhy1RX++cgel37z1/nXdt5lKPzhAVtQFf0ymalLdlw2X7HqXbLs8
	1ZL45THBojtLOQVAApWNaBpK9L6PLwFx9SyHI4gqtQuIoYvu4mYGMlNwgD3UuYNoSNA
	rDzDUWqU30W2Fh8Pc1CMXqNndjfqQfwfo3uyhGeI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k1Q1pIVLB0h1R86VHLoj0M76fBv7Nu+KBGTvycWyvws=;
	b=drphQHU+FL2rtNxNoSiJ+g/UiXNVPrhHdTEMwmHVSpX93ldF8zJ7/CmXZtVdpAvD
	QCDhCXZinoGi3GH1B0ikMhH8mPR85/TAWMalju74y3NgECstIRy48XAwA3UTc6NDcMe
	CrZRGUD84ttUqWFZha3LXKFX0ZwQUokg5SlfpNj0=
Content-Type: multipart/mixed; boundary="===============5195927331552758986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.231.1 SUCCEEDED
Message-ID: <0101018435c85fd9-6d43d4c0-f865-4720-8a01-af4c0d241bc3-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172480

--===============5195927331552758986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.231.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.224.1-1.3.231.1.patch
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
--===============5195927331552758986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_static_assertions.hpp was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 10781473 to 11881200 (+10%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_static_assertions.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 6859827 to 7973328 (+16%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]

--===============5195927331552758986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_static_assertions.hpp was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_static_assertions.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 10781473 to 11881200 (+10%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 6859827 to 7973328 (+16%)

--===============5195927331552758986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.224.1-1.3.231.1.patch"

RnJvbSA1ZWY3NmJmYjMzOTUxYjRiNDNhZjMyZjE0ZjgwN2JjN2FlNGQxMzMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNjo1MzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yMjQuMSAtPiAxLjMuMjMxLjEKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yMjQuMS5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjMxLjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjIy
NC4xLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yMzEuMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMjQuMS5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjIzMS4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjIyNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzEuMS5iYgppbmRleCA4ZDM0
NzM4YWQ3Li5iNDFiODJhZjlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzEuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gImM4OTZlMmY5MjAyNzNiZmVlODUyZGE5Y2Nh
MmEzNTZiYzFjMjAzMWUiCitTUkNSRVYgPSAiOThmNDQwY2U2ODY4Yzk0ZjVlYzZlMTk4Y2MxYWRk
YTQ3NjBlODg0OSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zMS4xCgo=

--===============5195927331552758986==--


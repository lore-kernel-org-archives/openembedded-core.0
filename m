Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE10ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.12461.1662040785214139173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hp2TR4xP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182f959c682-42b334fd-5736-480b-9a7d-3d5a228f1f51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hO5WjaRksq0++CbJOL9EyS4tnS1QxB/vNtfx8hc3lms=;
	b=Hp2TR4xPESRrOoFMQvKJTMeb+XCh7k1pMGFNSqGC+zXRZ452bn/acTTSK308KmWm
	EFzsB2LGZ96cKzSgLm1EXQM0wmHYRIAL2Ra3YDWJjsoDT9UKQQu93UzaapNYrSSr/ql
	Jl27fV3w6x+f7P14zoxg4NtFb4+qxo3hOgmw/ezk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hO5WjaRksq0++CbJOL9EyS4tnS1QxB/vNtfx8hc3lms=;
	b=HIBgs2ph5EAWC11L8ciruIB8k7RVI7UZxeKlWFLeXIDPFPaMQgoUoDpFgymHeg3C
	SNl3VtCWK+AlDabjXN/staUfaqPFkwjsdv87I753Bp2zGNt5+QMAbz1pli8V1/OJ/6+
	w657FHXTPKQrJEQdf2+aL7v65vnxK6zH+NQ4pxQ4=
Content-Type: multipart/mixed; boundary="===============4952063696282970240=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.224.1 SUCCEEDED
Message-ID: 
 <01010182f959c682-42b334fd-5736-480b-9a7d-3d5a228f1f51-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170192

--===============4952063696282970240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.224.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.216.0-1.3.224.1.patch
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
--===============4952063696282970240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_to_string.hpp was added
  /usr/share/vulkan/registry/spec_tools/conventions.py was added
  /usr/share/vulkan/registry/conventions.py was removed
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 11054975 to 10781473 (-2%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_to_string.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 6519647 to 6859827 (+5%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: removed "/usr/share/vulkan/registry/conventions.py", added "/usr/share/vulkan/registry/spec_tools/conventions.py"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]

--===============4952063696282970240==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.216.0-1.3.224.1.patch"

RnJvbSA4Y2U4NzUzMTk0ODliNTgwYjkwOTgwMjhhYjIzMmRlZGU1MmRhYzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMDo0MToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yMTYuMCAtPiAxLjMuMjI0LjEKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yMTYuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjI0LjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjIx
Ni4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yMjQuMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMTYuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjIyNC4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjIxNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMjQuMS5iYgppbmRleCA1Zjc5
MTdhZTgyLi44ZDM0NzM4YWQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMTYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMjQuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjNlZjRjOTdmZDZlYTAwMWQ3NWE4ZTlkYTQw
OGVlNDczYzE4MGU0NTYiCitTUkNSRVYgPSAiYzg5NmUyZjkyMDI3M2JmZWU4NTJkYTljY2EyYTM1
NmJjMWMyMDMxZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zMS4xCgo=

--===============4952063696282970240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_to_string.hpp was added
  /usr/share/vulkan/registry/spec_tools/conventions.py was added
  /usr/share/vulkan/registry/conventions.py was removed
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_to_string.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: removed "/usr/share/vulkan/registry/conventions.py", added "/usr/share/vulkan/registry/spec_tools/conventions.py"

--===============4952063696282970240==--


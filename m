Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C29CCA9EBE
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.107429.1682976350436536020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SfMAM/mN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9352901-05bdc0d9-9a22-4f7c-991a-64dcb845854e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eSJwQxBlnoW5PbHbRA3zYfd4CgFHghjuUEngnk0aHHI=;
	b=SfMAM/mNgkRPJB0T0edDdC0HrDzrOlulgDJXFP5m7WsIfdlL859gExNSu3GOoSZ3
	kTlFbRnS2ImPfsdR/VT168SZS8ZnBYIk15H8o1jH+bzTOztt3jzPJci3MB9NmHFaDPZ
	omePacjFVyAEpTx8ILikHksiRvlmelXb5Nlo2RZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eSJwQxBlnoW5PbHbRA3zYfd4CgFHghjuUEngnk0aHHI=;
	b=E11PNWZyEMFlu2TE96+4DSNYsOOzXvUJ+b9Kp2nTNDDaXWlc0QRG9il1Ww4ZSFyO
	4Tmwa0uXzZAyKhJcpGwUH5R2uyavEJML9ZVaxSSJDh9wUMGHCN3T+KYvEAuH1bnfsKf
	fircxEhbUWwYEjtRLSryJjmqisTjH/l6rph9bSA8=
Content-Type: multipart/mixed; boundary="===============2975896012923022496=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.243.0 SUCCEEDED
Message-ID: <01010187d9352901-05bdc0d9-9a22-4f7c-991a-64dcb845854e-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180657

--===============2975896012923022496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.243.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.239.0-1.3.243.0.patch
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
--===============2975896012923022496==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.239.0-1.3.243.0.patch"

RnJvbSBmYWE5YzJiMjdkMWJkNjE0YTA4OTViMmM2NmNhOWJjMTMwN2RhMTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxODozMTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yMzkuMCAtPiAxLjMuMjQzLjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yMzkuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjQzLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjIz
OS4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yNDMuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzkuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI0My4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjIzOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNDMuMC5iYgppbmRleCBhNmIz
MGZhODMxLi42YzhhODdiMzJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNDMuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjJiYjBhMjMxMDRjZWZmZDlhMjhkNWI3NDAx
ZjJjZWU3ZGFlMzViYjgiCitTUkNSRVYgPSAiNjVhZDc2OGQ4NjAzNjcxZmMxMDg1ZmUxMTUwMTll
NzJhNTk1Y2VkOCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============2975896012923022496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/parse_dependency.py was added
  /usr/include/vulkan/vk_sdk_platform.h was removed
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 12282072 to 12318487 (+0%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: removed "/usr/include/vulkan/vk_sdk_platform.h"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 8887350 to 9337642 (+5%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/parse_dependency.py"

--===============2975896012923022496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/parse_dependency.py was added
  /usr/include/vulkan/vk_sdk_platform.h was removed
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: removed "/usr/include/vulkan/vk_sdk_platform.h"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/parse_dependency.py"

--===============2975896012923022496==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824DDC88C96
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.7532.1685693432763827582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RuFVKWgS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101887b288bed-355b5169-e934-44cd-a857-41eb2735fb0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=05sE9FjdGsJdTI/S0SVmyTlH8H3R9V34k1PUtihTJu4=;
	b=RuFVKWgS4RGPVKlJp8eNQtoc6ZjowpE9Xdi7EUaBtzoDl5XV8XYY5K/tsr4ErS2L
	dhg1mquNsL3ZoxI5tfC+NoYTbH7lPF7SrGwCLsf7zB6te091OOSTsXGn9zOm9Y8iELC
	DdqKwRci83YRkLJoAZIfsks2I29VPIsbEE/ZDkHU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=05sE9FjdGsJdTI/S0SVmyTlH8H3R9V34k1PUtihTJu4=;
	b=Pxh9otqnylshMFsejQnqRXjMDpkqv+aK7/SGOvU1wK7xgVckPvJFD0Qp1l2WzX4j
	AQf64WsjOhygmrnS8LAGJR3bxx9+qvg/Is7AYJ3jaiElPciBe5ghr0wRyZjATF3xduQ
	jyuB9uCaV46mUJ6c2rMBwgxEGurNbTUvEXijvf6M=
Content-Type: multipart/mixed; boundary="===============2888169513941588696=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.250.0 SUCCEEDED
Message-ID: <010101887b288bed-355b5169-e934-44cd-a857-41eb2735fb0f-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182257

--===============2888169513941588696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.250.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.243.0-1.3.250.0.patch
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
--===============2888169513941588696==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.243.0-1.3.250.0.patch"

RnJvbSAyYmIzZjg0MGZiNjljNjc2ZjkzOTliMjYxZWRhM2FhNDI1Njg4NGJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMTo0NTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yNDMuMCAtPiAxLjMuMjUwLjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yNDMuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjUwLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjI0
My4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yNTAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNDMuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI1MC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI0My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNTAuMC5iYgppbmRleCA2ZGRj
MzVlNWQ4Li4yOTcwNzY3ZmYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNDMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNTAuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjY1YWQ3NjhkODYwMzY3MWZjMTA4NWZlMTE1
MDE5ZTcyYTU5NWNlZDgiCitTUkNSRVYgPSAiOWU2MTg3MGVjYmQzMjUxNDExM2I0NjdlMGEwYzQ2
ZjYwZWQyMjJjNyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============2888169513941588696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_extension_inspection.hpp was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_extension_inspection.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 9337642 to 10786504 (+16%)

--===============2888169513941588696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.243.0" to "1.3.250.0"
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_extension_inspection.hpp was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_extension_inspection.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 12317913 to 12593898 (+2%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 9337642 to 10786504 (+16%)

--===============2888169513941588696==--


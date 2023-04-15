Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045CEC87FE7
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13803.1681581684927022451
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RykGRq1+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018786143ce9-876f282e-618f-41a9-b8af-ba2df2b4a4f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mDDI87gZZRnTx8kLHyc98RcC4fNXaONOhSpscXkA6jg=;
	b=RykGRq1+F0PILS/ZGe5FrDegTVmBtQL6wlUG6nxE9UFR3W+FqJ+5T+9Ki8ZJAB92
	qCkV3gLPWllyTW9J2xY6RoLDoNgPTQH71ZoJGykf/bDefSH3GWLCEAh/A3iRcn8i/C5
	YO5STyg4lqe345Zcosg0HnYp7W7dbePZaCdAzrk4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mDDI87gZZRnTx8kLHyc98RcC4fNXaONOhSpscXkA6jg=;
	b=XunQyeSZLjL0dZx0kIffbjG+eP0dRGq8skWYglcNnmfSn8FtrL8leD/aQuZ1lss9
	RqBQStgij9m5eDZ2h7EJ3tzmRk7Dok2bEtx/qg1qLcKA5uc41nkzyIiuMHrmK6EmxD6
	mdLvCM8ON/WcjwSYxlhkGSejkeXv96SoGpakB7QQ=
Content-Type: multipart/mixed; boundary="===============2023219635929432506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.243.0 SUCCEEDED
Message-ID: <0101018786143ce9-876f282e-618f-41a9-b8af-ba2df2b4a4f5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180069

--===============2023219635929432506==
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
--===============2023219635929432506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.239.0-1.3.243.0.patch"

RnJvbSA2MmVjZTIwZWYwYzZhNDM4NzY4NzI5OTBhNTdhMGE2MDhjYWM2N2M3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTU6MDY6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjM5LjAgLT4gMS4zLjI0My4wCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjM5LjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS4zLjI0My4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
MzkuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjQzLjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjM5LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNDMu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjQzLjAuYmIKaW5kZXggYTZi
MzBmYTgzMS4uNmM4YTg3YjMyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjM5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjQzLjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS50eHQ7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tSGVhZGVycy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCiAKLVNSQ1JFViA9ICIyYmIwYTIzMTA0Y2VmZmQ5YTI4ZDViNzQw
MWYyY2VlN2RhZTM1YmI4IgorU1JDUkVWID0gIjY1YWQ3NjhkODYwMzY3MWZjMTA4NWZlMTE1MDE5
ZTcyYTU5NWNlZDgiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============2023219635929432506==
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
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 12282072 to 12318487 (+0%)
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
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 8887350 to 9337642 (+5%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/parse_dependency.py"

--===============2023219635929432506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/parse_dependency.py was added
  /usr/include/vulkan/vk_sdk_platform.h was removed
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: removed "/usr/include/vulkan/vk_sdk_platform.h"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/parse_dependency.py"

--===============2023219635929432506==--


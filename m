Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3019C6FD3D
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.10530.1663251514098898199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MDKBHvIG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101018341840122-f0d90dc1-6aab-46b4-9eca-5e47e2eeedc5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ttaCm7EConGi89L0HTLN0IX0V/01iU9vA0Y1GcnX/xU=;
	b=MDKBHvIGpXOln7I9X36gFQxjuxq4f7cpT4GQCAJskfuA9cBNLSCOtwWXGKk22bh9
	5wkUzgD45GaWRbXmhcnFytk7uWiZAnNgGKp71fo0AabwEre6iXcZ3YgSO+/qnQJSH1v
	HIybXVMl6RwvH4vFjJQzTeiw51wEp5NwZ4Bmtk8k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ttaCm7EConGi89L0HTLN0IX0V/01iU9vA0Y1GcnX/xU=;
	b=fyZig+KPHhefhj6iOQpwtstQP9rszb+OjAWGt8pd12FBVu6sAKz/SQMD+o84fZ9Z
	RVGKdG5ySnni0DjUKeBiTpvhFmBURkr9C+BbrowkczpgZqTJnvh2Qq0sBs3rgBeDEyv
	PVI60rYStFMTz7Md0ZuYQ4BmdZ1vl0QWr8yqAkEw=
Content-Type: multipart/mixed; boundary="===============3513089661519335969=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.224.1 SUCCEEDED
Message-ID: 
 <0101018341840122-f0d90dc1-6aab-46b4-9eca-5e47e2eeedc5-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170746

--===============3513089661519335969==
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
--===============3513089661519335969==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.216.0-1.3.224.1.patch"

RnJvbSA3NzU5NDBkOWZhMmNiMGY2NjJmNDM2ZDEzOGQ4NWQ5YWJhZDY2MmJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTI6MjE6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjE2LjAgLT4gMS4zLjIyNC4xCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjE2LjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS4zLjIyNC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
MTYuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjI0LjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjE2LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMjQu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjI0LjEuYmIKaW5kZXggNWY3
OTE3YWU4Mi4uOGQzNDczOGFkNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjE2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjI0LjEuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS50eHQ7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tSGVhZGVycy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCiAKLVNSQ1JFViA9ICIzZWY0Yzk3ZmQ2ZWEwMDFkNzVhOGU5ZGE0
MDhlZTQ3M2MxODBlNDU2IgorU1JDUkVWID0gImM4OTZlMmY5MjAyNzNiZmVlODUyZGE5Y2NhMmEz
NTZiYzFjMjAzMWUiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzEuMQoK

--===============3513089661519335969==
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

--===============3513089661519335969==
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
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_to_string.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 11054975 to 10781473 (-2%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: removed "/usr/share/vulkan/registry/conventions.py", added "/usr/share/vulkan/registry/spec_tools/conventions.py"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 6519647 to 6859827 (+5%)

--===============3513089661519335969==--


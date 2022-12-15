Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55D2C77B7A
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.144517.1671136353675322482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A1eB3wpg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185177d1a9a-1411781c-5856-492d-b44a-5a74a36e2e8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MU2bb8PpgyPcewF9kgtb2UPuSMW3yOv4Lhm5p6QV8RQ=;
	b=A1eB3wpgo1RBkB7s2mz+k8/6R50qnFJ6fyGbvAqwDVkYOZAtqxQb2fxx3biL8LQl
	3616M9sJQ3q2pKRX0l5Wf9c/jEMG4LnOBlPwI+BIySW7inOjL5S9YjKjjeI0jzS48k9
	sJwLXp1YA3Ausollrlj7zMvLFJnzNtlIdVbhMKuw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MU2bb8PpgyPcewF9kgtb2UPuSMW3yOv4Lhm5p6QV8RQ=;
	b=b83n7JZAvvmDC08pQIaf4Pa5MZoCLgi8CtUwi61QIWqIbYj83N2jewguQ6CiURPr
	NXyMzek3rn5ptWsufn+0CZlD8woUU70JMXdkOV5KbOVqwgbgYUvUmYY0DSQdrIYGSNE
	onLwEIL0Q2WdAlH1c/7/MWkGu6b7tARAHwow0tmQ=
Content-Type: multipart/mixed; boundary="===============3309546226970624539=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.236.0 SUCCEEDED
Message-ID: <01010185177d1a9a-1411781c-5856-492d-b44a-5a74a36e2e8d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174701

--===============3309546226970624539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.236.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.231.1-1.3.236.0.patch
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
--===============3309546226970624539==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.231.1-1.3.236.0.patch"

RnJvbSBkOWExZjMwNGYyNTJiZDZkZTE5OTkzZDQzYWMxZjk3MTc5NzdjMzkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTY6MTI6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjMxLjEgLT4gMS4zLjIzNi4wCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjMxLjEuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS4zLjIzNi4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
MzEuMS5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjM2LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjMxLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzYu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjM2LjAuYmIKaW5kZXggYjQx
YjgyYWY5ZC4uODcxNjM3NmZjMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjMxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjM2LjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS50eHQ7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tSGVhZGVycy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCiAKLVNSQ1JFViA9ICI5OGY0NDBjZTY4NjhjOTRmNWVjNmUxOThj
YzFhZGRhNDc2MGU4ODQ5IgorU1JDUkVWID0gImI3NWU1YTAyYjY5MzNjYWY4NmM1ODIyZDAxOTA2
N2IzMzU0OTJjODUiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzcuMwoK

--===============3309546226970624539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/share/cmake was added
  /usr/share/cmake/VulkanHeaders was added
  /usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake was added
  /usr/share/cmake/VulkanHeaders/VulkanHeadersConfigVersion.cmake was added
  /usr/share/vulkan/registry/profiles was added
  /usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake /usr/share/cmake/VulkanHeaders/VulkanHeadersConfigVersion.cmake"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 11881200 to 12202137 (+3%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 7973328 to 8510862 (+7%)

--===============3309546226970624539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/share/cmake was added
  /usr/share/cmake/VulkanHeaders was added
  /usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake was added
  /usr/share/cmake/VulkanHeaders/VulkanHeadersConfigVersion.cmake was added
  /usr/share/vulkan/registry/profiles was added
  /usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake /usr/share/cmake/VulkanHeaders/VulkanHeadersConfigVersion.cmake"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json"

--===============3309546226970624539==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2217BC27C44
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.812.1686887482022817994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vqj2gro+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c2544bc2-c5919147-1d3b-4859-b8a6-97564f9db7a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dS9A6qZtzWTMBnUZtEnde5yud0kaGJ1YFXS6EIx4mzk=;
	b=Vqj2gro+ZlU8hAe1evxzZ75pEphnm0hkEkV7rU4RmYgwTAKakOulmrzxU7l8ovoY
	73TRDjAXwkYbfvMR9MzSopJ+Hm31PH+51dNagz+czsTGAyHGlqG6zJQeWLktxs6gckD
	hABqsZB1gDzNsE8gyKw5IR5GaDB14Gm+4jYkyhic=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dS9A6qZtzWTMBnUZtEnde5yud0kaGJ1YFXS6EIx4mzk=;
	b=L4+1eNWhmwBkBTjUtLieGB4UrLfNLUxcZNd4AvdR/bqS+YTgqA+CmXPJkBMSdIlc
	skVgBMAF0VOSZnrqpZvRj1k9Y8TewE+jfyqvL5xCINj6ymIaIecRFy0IwsMROJ8z47n
	N6vSWKsXwVCMpHxKpADLVdahqLbq0mU7tg1A+w8g=
Content-Type: multipart/mixed; boundary="===============6990158706168649282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.250.0 SUCCEEDED
Message-ID: <01010188c2544bc2-c5919147-1d3b-4859-b8a6-97564f9db7a2-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182962

--===============6990158706168649282==
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

-- >8 --
From e8aac157c554bcfac54c91c2307b4b35c26cf7a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 21:01:26 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.243.0 -> 1.3.250.0

---
 ...{vulkan-headers_1.3.243.0.bb => vulkan-headers_1.3.250.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.243.0.bb => vulkan-headers_1.3.250.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
index 6ddc35e5d8..2970767ff3 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "65ad768d8603671fc1085fe115019e72a595ced8"
+SRCREV = "9e61870ecbd32514113b467e0a0c46f60ed222c7"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============6990158706168649282==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.243.0-1.3.250.0.patch"

RnJvbSBlOGFhYzE1N2M1NTRiY2ZhYzU0YzkxYzIzMDdiNGIzNWMyNmNmN2E1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjE6MDE6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjQzLjAgLT4gMS4zLjI1MC4wCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjQzLjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS4zLjI1MC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
NDMuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjUwLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjQzLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNTAu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNDMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjUwLjAuYmIKaW5kZXggNmRk
YzM1ZTVkOC4uMjk3MDc2N2ZmMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjQzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjUwLjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS50eHQ7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tSGVhZGVycy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCiAKLVNSQ1JFViA9ICI2NWFkNzY4ZDg2MDM2NzFmYzEwODVmZTEx
NTAxOWU3MmE1OTVjZWQ4IgorU1JDUkVWID0gIjllNjE4NzBlY2JkMzI1MTQxMTNiNDY3ZTBhMGM0
NmY2MGVkMjIyYzciCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============6990158706168649282==
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
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 12317913 to 12593898 (+2%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_extension_inspection.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 9337642 to 10786504 (+16%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.243.0" to "1.3.250.0"

--===============6990158706168649282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_extension_inspection.hpp was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_extension_inspection.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 9337642 to 10786504 (+16%)

--===============6990158706168649282==--


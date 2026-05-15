Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7A8CD5BCC
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34832.1778851233021692824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CDxpFofd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IdZszqm+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e2bcbd1bc-263d2eee-1a01-437a-b9a9-49283de74d53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851238;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xl35xQy+waY+jmdXg5C/PnP1Xwm//ZYJdG0iqBMD+4o=;
	b=CDxpFofd6bOAxIdvCwzUMwXLBdv2c9OpJXVQDdnrKTqJyzd9ARvYMuZYsumRdOPq
	FpBLcqTtK5y3v5aZvfG+Hl34K7r5mKYj63oS9DyaKTHvCiSt53HgqFMpN19wC13Tl/J
	BonLIluJ8pu2H2Fo0K9neZ8WYfHD+gB+hzL5EbJo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851238;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xl35xQy+waY+jmdXg5C/PnP1Xwm//ZYJdG0iqBMD+4o=;
	b=IdZszqm+89kr6wwSp9C/7uCHHJguzJwoht5KUmt9fIML4/n46ZM0SKbal7LwjHMw
	Q+OYf1FJ2k4nqHUlU3kk08XPzev3bstKzo0vuIgLLYx71XtKnreTnBiHVuj0yAHeG7y
	Or2NQZdlZCQ1uHId6roBj3U5vEYfFObmiFKb7PqI=
Content-Type: multipart/mixed; boundary="===============8585552857844159289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-headers: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019e2bcbd1bc-263d2eee-1a01-437a-b9a9-49283de74d53-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237144

--===============8585552857844159289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.4.350.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.4.341.0-1.4.350.0.patch
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
From 55eefd722fd438b01d9a97bd2520551e75a620d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 10:16:47 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.4.341.0 -> 1.4.350.0

---
 ...{vulkan-headers_1.4.341.0.bb => vulkan-headers_1.4.350.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.341.0.bb => vulkan-headers_1.4.350.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
index 6dbb069325..ff5108e013 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
-SRCREV = "b5c8f996196ba4aa6d8f97e52b5d3b6e70f7e4e2"
+SRCREV = "8864cdc896bbc2a9b6eb36b3218fc9ef57908d77"
 
 inherit cmake
 
-- 
2.47.1


--===============8585552857844159289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSA1NWVlZmQ3MjJmZDQzOGIwMWQ5YTk3YmQyNTIwNTUxZTc1YTYyMGQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTA6MTY6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjQuMzQxLjAgLT4gMS40LjM1MC4wCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjQuMzQxLjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS40LjM1MC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuNC4z
NDEuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjQuMzUwLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzQxLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNTAu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNDEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzUwLjAuYmIKaW5kZXggNmRi
YjA2OTMyNS4uZmY1MTA4ZTAxMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzQxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzUwLjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS5tZDttZDU9MWJjMzU1ZDhjNDE5NmY3NzRjOGI4N2VkMWE4ZGQ2MjUiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFu
Y2g9bWFpbjtwcm90b2NvbD1odHRwczt0YWc9dnVsa2FuLXNkay0ke1BWfSIKIAotU1JDUkVWID0g
ImI1YzhmOTk2MTk2YmE0YWE2ZDhmOTdlNTJiNWQzYjZlNzBmN2U0ZTIiCitTUkNSRVYgPSAiODg2
NGNkYzg5NmJiYzJhOWI2ZWIzNmIzMjE4ZmM5ZWY1NzkwOGQ3NyIKIAogaW5oZXJpdCBjbWFrZQog
Ci0tIAoyLjQ3LjEKCg==

--===============8585552857844159289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.341.0" to "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.0"
Changes to packages/x86-64-v3-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 21288612 to 21577077 (+1%)
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 16585152 to 19134140 (+15%)
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]

--===============8585552857844159289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 16585152 to 19134140 (+15%)

--===============8585552857844159289==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CE4CD98C8
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1579.1780328146861494073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qo5qleUf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=x5CQ31hC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d3b55c-70855107-d2a5-4b8b-959f-7f18f87490f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9ZDM5AyNwGrvqpc2ZCPAAPsX5ZjVTnednfCbKoRgRTo=;
	b=qo5qleUfwWCoJclhEpVneGLuIDX8n49dAq15N8hP5p/XgI3qEjb6MXPTxBQw+ZcV
	XZRLgfbwlJxcRDWMeV3W+vVohMUb/oztx5S+pGZKoY4HwnZc2RDydLNZ3d8yrZhLy5w
	z6ZdPnwEkrFzlnVN+S1Vsd25vllmjh7dCymBUWiI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9ZDM5AyNwGrvqpc2ZCPAAPsX5ZjVTnednfCbKoRgRTo=;
	b=x5CQ31hCQJIa+L7QnR26WygO9jswCdi35WXgSTqQy9Ebb7SXp7iqEzTX2gvHKzJu
	nLseTW3aDK7loTESQn+fvLniiyrpT0PrlR7HtE/d1Jx1CY5q0YC1HL/WRPfm6/semgo
	tqDeJa1SHdNgk9AcDfDG7WZ14v3v1V9q+U6WnMK8=
Content-Type: multipart/mixed; boundary="===============2403800288386505482=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-headers: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019e83d3b55c-70855107-d2a5-4b8b-959f-7f18f87490f5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237925

--===============2403800288386505482==
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
From 4baa8e94ad19e30700e2479653e81f22a337fa64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:41:52 +0000
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


--===============2403800288386505482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 16585152 to 19134140 (+15%)

--===============2403800288386505482==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSA0YmFhOGU5NGFkMTllMzA3MDBlMjQ3OTY1M2U4MWYyMmEzMzdmYTY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMTo0MTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuNC4zNDEuMCAtPiAxLjQuMzUwLjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuNC4zNDEuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjQuMzUwLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS40LjM0
MS4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuNC4zNTAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNDEuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjM1MC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjM0MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNTAuMC5iYgppbmRleCA2ZGJi
MDY5MzI1Li5mZjUxMDhlMDEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNDEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNTAuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUhlYWRlcnMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzO3RhZz12dWxrYW4tc2RrLSR7UFZ9IgogCi1TUkNSRVYgPSAi
YjVjOGY5OTYxOTZiYTRhYTZkOGY5N2U1MmI1ZDNiNmU3MGY3ZTRlMiIKK1NSQ1JFViA9ICI4ODY0
Y2RjODk2YmJjMmE5YjZlYjM2YjMyMThmYzllZjU3OTA4ZDc3IgogCiBpbmhlcml0IGNtYWtlCiAK
LS0gCjIuNDcuMQoK

--===============2403800288386505482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.341.0" to "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.0"
Changes to packages/x86-64-v3-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 21288612 to 21577077 (+1%)
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 16585152 to 19134140 (+15%)

--===============2403800288386505482==--


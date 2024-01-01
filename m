Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFACC47DBE
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4579.1704114718986679490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PT1ATI9i;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jOBdbDnZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018cc5270e97-959dc0f0-2f28-4fc6-95bb-8a36b68f0e59-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sjXnnO/c1uw+StiwCSIOx+FbmvncLLK+t3isx1+pZwY=;
	b=PT1ATI9isIgjUbzZkiZ8vski9aKwew++X1IavRVwoPaJ6Yjc1eDgwoApQGfykfPu
	GaSpyHU5Y0FUArwjwzJK1CgBqq1br8wLQirL1Svfv/y1EGmBRY4kZIk6Vl3qUzCNRvx
	T3dIhPdvQxeAXmBRy7lSbQ51ahXPeyTs9NuDnQ1A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sjXnnO/c1uw+StiwCSIOx+FbmvncLLK+t3isx1+pZwY=;
	b=jOBdbDnZWZ9kQqm55sB+mQRoKZIbPDjNVHrFweYuEwAt9Rg3YoKZ2FHDhP4CyYEz
	v3RRzZKDQAcSPTaRzbq6L1COiIJ0DpudIskH6c7vkpolni6y07lryYiam0krSRbSZ3/
	WT46gpz2mebJVdsI2D/hcsO6i7lYmPtC3iKbVrcI=
Content-Type: multipart/mixed; boundary="===============8736789614830975810=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 6.1.1 SUCCEEDED
Message-ID: <0101018cc5270e97-959dc0f0-2f28-4fc6-95bb-8a36b68f0e59-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193166

--===============8736789614830975810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *6.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-6.1-6.1.1.patch
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
From 5f2c1bd884a8b6dacfcb528cd043b38c85311d2d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 10:29:28 +0000
Subject: [PATCH] ffmpeg: upgrade 6.1 -> 6.1.1

---
 .../ffmpeg/{ffmpeg_6.1.bb => ffmpeg_6.1.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.bb => ffmpeg_6.1.1.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 162eb414b1..aa59755034 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "488c76e57dd9b3bee901f71d5c95eaf1db4a5a31fe46a28654e837144207c270"
+SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.42.0


--===============8736789614830975810==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-6.1-6.1.1.patch"

RnJvbSA1ZjJjMWJkODg0YThiNmRhY2ZjYjUyOGNkMDQzYjM4Yzg1MzExZDJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMDoyOToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZm
bXBlZzogdXBncmFkZSA2LjEgLT4gNi4xLjEKCi0tLQogLi4uL2ZmbXBlZy97ZmZtcGVnXzYuMS5i
YiA9PiBmZm1wZWdfNi4xLjEuYmJ9ICAgICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZmZtcGVnL3tmZm1wZWdfNi4xLmJiID0+IGZmbXBlZ182LjEuMS5iYn0gKDk5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzYu
MS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfNi4xLjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZt
cGVnL2ZmbXBlZ182LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBl
Zy9mZm1wZWdfNi4xLjEuYmIKaW5kZXggMTYyZWI0MTRiMS4uYWE1OTc1NTAzNCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ182LjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ182LjEuMS5iYgpAQCAtMjQsNyArMjQs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkdQTHYyO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuZmZt
cGVnLm9yZy9yZWxlYXNlcy8ke0JQfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0
ODhjNzZlNTdkZDliM2JlZTkwMWY3MWQ1Yzk1ZWFmMWRiNGE1YTMxZmU0NmEyODY1NGU4MzcxNDQy
MDdjMjcwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg2ODRmNGIwMGY5NGI4NTQ2MTg4NGMzNzE5
MzgyZjEyNjFmMGQ5ZWIzZDU5NjQwYTFmNGFjMDg3MzYxNmY5NjgiCiAKICMgaHR0cHM6Ly9udmQu
bmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtMzkwMTgKICMgaHR0cHM6Ly9naXRodWIuY29t
L2JyYW1wL2ZmbXBlZy1jbGktd3JhcHBlci9pc3N1ZXMvMjkxCi0tIAoyLjQyLjAKCg==

--===============8736789614830975810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 87672728 to 87676672 (+0%)
packages/core2-64-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/ffmpeg-dev: PKGSIZE changed from 1209101 to 1209103 (+0%)
packages/core2-64-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 45119218 to 45123731 (+0%)
packages/core2-64-poky-linux/ffmpeg/ffmpeg-src: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/ffmpeg: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/ffmpeg: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-6.1.tar.xz" to "https://www.ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz"
packages/core2-64-poky-linux/ffmpeg: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libavcodec: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libavcodec: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libavdevice: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libavdevice: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libavfilter: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libavfilter: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libavformat: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libavformat: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libavutil: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libavutil: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libpostproc: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libpostproc: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libswresample: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libswresample: PV changed from "6.1" to "6.1.1"
packages/core2-64-poky-linux/ffmpeg/libswscale: PKGV changed from 6.1 [default] to 6.1.1 [default]
packages/core2-64-poky-linux/ffmpeg/libswscale: PV changed from "6.1" to "6.1.1"

--===============8736789614830975810==--


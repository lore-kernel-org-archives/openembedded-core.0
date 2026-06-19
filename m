Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDC4CDB469
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37026.1781849909237165531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OfxXWszO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DyoQn03F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ede87e2f4-a9e3c5d0-a6d4-44fa-8fc4-10eecc2b77e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3BA3u8qmPacbJmXKWZ8L/vDqU39L9FavN5uZVnf2Luo=;
	b=OfxXWszOfuwSHSyzsWSoyx4h+/zF0ic+Vi7EkqTaf4tgqaqNi4YI23EF0Wd4tM1i
	pPPqhyE8YINSxragaGPnR2zSnRBGqfLvKRPGgA+EfttN0yItQf0iwdgHkczhY7Yn9wI
	pPbc8viWEzOOPzrRa6wkwRttwX0gfns4E8Cfpfhc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3BA3u8qmPacbJmXKWZ8L/vDqU39L9FavN5uZVnf2Luo=;
	b=DyoQn03Fn/biIHkiZTaRcFNO/5eVsHOZ5f7OFcatlJNyJ55NI+uoph9xHSQIX2UY
	63e+8Eq5EeP/e1inUZxFkLY1zrN9iUQty5uDQ1G9K48LY6kZssrW71kSvN6+K3zZLWi
	ES1rtkUtQB/BbAAwL3EKUSMLi9H7foRj87f44eKo=
Content-Type: multipart/mixed; boundary="===============6286085071399927759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-headers: upgrading to 1.4.350.1 SUCCEEDED
Message-ID: <0101019ede87e2f4-a9e3c5d0-a6d4-44fa-8fc4-10eecc2b77e9-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239126

--===============6286085071399927759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.4.350.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.4.350.0-1.4.350.1.patch
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
From 3eb2f59fb2771751ba699c6239fd8af071c89d29 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 05:52:04 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.4.350.0 -> 1.4.350.1

---
 .../{vulkan-headers_1.4.350.0.bb => vulkan-headers_1.4.350.1.bb}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.350.0.bb => vulkan-headers_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
-- 
2.47.1


--===============6286085071399927759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.4.350.0-1.4.350.1.patch"

RnJvbSAzZWIyZjU5ZmIyNzcxNzUxYmE2OTljNjIzOWZkOGFmMDcxYzg5ZDI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDU6NTI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjQuMzUwLjAgLT4gMS40LjM1MC4xCgotLS0KIC4uLi97
dnVsa2FuLWhlYWRlcnNfMS40LjM1MC4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuNC4zNTAuMS5i
Yn0gIHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4taGVhZGVyc18xLjQu
MzUwLjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS40LjM1MC4xLmJifSAoMTAwJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNTAu
MC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjM1
MC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zNTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzUwLjEuYmIKLS0gCjIu
NDcuMQoK

--===============6286085071399927759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-headers: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.0" to "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.4.350.0" to "1.4.350.1"

--===============6286085071399927759==--


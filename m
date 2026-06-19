Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0759CDB46D
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37025.1781849908942595371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WpC6Wx7P;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ltJf8TJS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ede87e351-d6b2b2c0-8150-4d47-bc24-7dc23a774992-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z1hPzn/9xV5wvAmhZfui/Dly37MzGVvVGRARVFlet3g=;
	b=WpC6Wx7PgJGMLmFdObMScwvNVn3Z4BAaxcQcKzxipRro5oljrccFtf6spu0HJBfN
	Vju6K+hq0C+DgGbbIn0EoDBUx+pMoadi/O8ntZed+Nk85QEOI0p4E93RtwYFQyTPKZA
	2ovxbjLK9ougFuTv5KzoOZv05VeNM+MWrGLBuYBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z1hPzn/9xV5wvAmhZfui/Dly37MzGVvVGRARVFlet3g=;
	b=ltJf8TJShwmVOYSkp53FzV92QOLonK+JvjOfBoIeKIRjeYk8qha8NyHySK3ymdBm
	00fcu+aVpzel78BrQlDS+BSHsucTPbzybOwgKMKINXy2Qm5uzIuADEQQFjEh6xLh+Jg
	fe00pffRTSr3owXOhsz8zetmjKQxkW9+yv4nt+QM=
Content-Type: multipart/mixed; boundary="===============8966150203980032291=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.4.350.1 SUCCEEDED
Message-ID: <0101019ede87e351-d6b2b2c0-8150-4d47-bc24-7dc23a774992-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239124

--===============8966150203980032291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-utility-libraries* to *1.4.350.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.4.350.0-1.4.350.1.patch
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
From 6432b7a5b0fa69dcddefb456aea958e692a6e948 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 06:06:01 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.4.350.0 -> 1.4.350.1

---
 ...braries_1.4.350.0.bb => vulkan-utility-libraries_1.4.350.1.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.350.0.bb => vulkan-utility-libraries_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
-- 
2.47.1


--===============8966150203980032291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-utility-libraries: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-utility-libraries: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.0" to "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-doc: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-doc: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-locale: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-locale: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: FILELIST: directory renamed /usr/src/debug/vulkan-utility-libraries/1.4.350.0/src/vulkan -> /usr/src/debug/vulkan-utility-libraries/1.4.350.1/src/vulkan, directory renamed /usr/src/debug/vulkan-utility-libraries/1.4.350.0/include/vulkan/utility -> /usr/src/debug/vulkan-utility-libraries/1.4.350.1/include/vulkan/utility, directory renamed /usr/src/debug/vulkan-utility-libraries/1.4.350.0/include/vulkan/layer -> /usr/src/debug/vulkan-utility-libraries/1.4.350.1/include/vulkan/layer, directory renamed /usr/src/debug/vulkan-utility-libraries/1.4.350.0/src/layer -> /usr/src/debug/vulkan-utility-libraries/1.4.350.1/src/layer
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PKGSIZE changed from 17298022 to 17298054 (+0%)
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]

--===============8966150203980032291==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.4.350.0-1.4.350.1.patch"

RnJvbSA2NDMyYjdhNWIwZmE2OWRjZGRlZmI0NTZhZWE5NThlNjkyYTZlOTQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDY6MDY6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS40LjM1MC4wIC0+IDEuNC4zNTAuMQoK
LS0tCiAuLi5icmFyaWVzXzEuNC4zNTAuMC5iYiA9PiB2dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNf
MS40LjM1MC4xLmJifSB8IDAKIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXV0
aWxpdHktbGlicmFyaWVzXzEuNC4zNTAuMC5iYiA9PiB2dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNf
MS40LjM1MC4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzUwLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzUwLjEuYmIK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNTAuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM1
MC4xLmJiCi0tIAoyLjQ3LjEKCg==

--===============8966150203980032291==--


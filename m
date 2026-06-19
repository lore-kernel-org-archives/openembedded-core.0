Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A66CDB467
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:41 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37027.1781849911270243292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GwvXBCOB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZmxqxRu9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ede87ecfb-0b6d95b2-4072-42d5-a5a1-a7de9b8e02a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849910;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=57muRm+SuBCNejz95EK5ZTJlZxaJ+Ob+iZOnxglqUWM=;
	b=GwvXBCOBtTwYhf1vMrHe58NihH+A9U5gEoyjYHdCOz+wseVJusAFVGOvw+5wCf4I
	Q79awH71j3mHHYDmDmtlMvQlkTqLOpkSS1hunbiU/OOb0hWSw15P5xBQrxnfcupIKUg
	ohcnGMUGY8tAZMFepjc1nVmbsRYmGlZe1hQjE2QM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849910;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=57muRm+SuBCNejz95EK5ZTJlZxaJ+Ob+iZOnxglqUWM=;
	b=ZmxqxRu9ueYCIqj6vLUGckoYAXD+/mEH+/BMogp3gD4xVsU+o2P8FTnzULBPr8rM
	Y9zphT1WXYrrLGJEO973pwhZ17bmO4i5twK1YQ9GoGOn2/MY5yhIO9gzYr6wjZzxI6O
	q9qJCDn4EKifTNTASdkMX2WLla3dAm5+HSfaCt6Q=
Content-Type: multipart/mixed; boundary="===============1385668511195070639=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-volk: upgrading to 1.4.350.1 SUCCEEDED
Message-ID: <0101019ede87ecfb-0b6d95b2-4072-42d5-a5a1-a7de9b8e02a7-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239127

--===============1385668511195070639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.350.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.4.350.0-1.4.350.1.patch
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
From 7300f0a48c73fefcbdf885e6be4a796622478ed3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 06:15:38 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.4.350.0 -> 1.4.350.1

---
 .../vulkan/{vulkan-volk_1.4.350.0.bb => vulkan-volk_1.4.350.1.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.350.0.bb => vulkan-volk_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
-- 
2.47.1


--===============1385668511195070639==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.4.350.0-1.4.350.1.patch"

RnJvbSA3MzAwZjBhNDhjNzNmZWZjYmRmODg1ZTZiZTRhNzk2NjIyNDc4ZWQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDY6MTU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjQuMzUwLjAgLT4gMS40LjM1MC4xCgotLS0KIC4uLi92dWxr
YW4ve3Z1bGthbi12b2xrXzEuNC4zNTAuMC5iYiA9PiB2dWxrYW4tdm9sa18xLjQuMzUwLjEuYmJ9
IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdm9sa18xLjQuMzUwLjAu
YmIgPT4gdnVsa2FuLXZvbGtfMS40LjM1MC4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4zNTAuMC5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjM1MC4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1
bGthbi12b2xrXzEuNC4zNTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdm9sa18xLjQuMzUwLjEuYmIKLS0gCjIuNDcuMQoK

--===============1385668511195070639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-volk: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-volk: SRC_URI changed from "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.350.0" to "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: FILELIST: directory renamed /usr/src/debug/vulkan-volk/1.4.350.0 -> /usr/src/debug/vulkan-volk/1.4.350.1
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]

--===============1385668511195070639==--


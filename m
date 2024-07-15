Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689ADC531DC
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1311.1721071147675544138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jvmCVMfU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UI1Jhwdb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010190b7d59c2d-c791d9ec-0f82-4f3f-a8b6-ecec88227a4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OKiX4s1M5u7Rn1IHuv/Y5bsJk8QytXbwKpOtpUXGMhw=;
	b=jvmCVMfUhRdZV7fGij2b52Dq7jbXRftW52PH2FSUtyRWdGjacER0i2Qt8Q3DKtQx
	LLHVIQcgEAeKxJmg7jHSqhA9vBwxlcdoSLfHAn20RIHdZfrIUwY5DMjhCtlFXQ0S69n
	feCh0qRDSjCDI39N0txXvC7/Aopfdi7aetWq7/vM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OKiX4s1M5u7Rn1IHuv/Y5bsJk8QytXbwKpOtpUXGMhw=;
	b=UI1JhwdbkIqkicg+ntVgb+rWfycB5f5UIsC+76ZHUD0KKRAMiRJdoaq1ilpDjWs8
	ur4zV6euc1T1yK5Cbm40DgUvkvvab8n3azIUFtIFSAiDssMq12JrKTSohyKvc6nKvcy
	DJFNpwkSoZEFvL6hNJgPCjHYGscNLvXlFXAJE7oY=
Content-Type: multipart/mixed; boundary="===============1638263684095314614=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2024.07.04 SUCCEEDED
Message-ID: <01010190b7d59c2d-c791d9ec-0f82-4f3f-a8b6-ecec88227a4d-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202025

--===============1638263684095314614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2024.07.04* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2024.05.08-2024.07.04.patch
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
From 76b51445db71ae07e851dbd510fd8dd26a296f25 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 15:55:11 +0000
Subject: [PATCH] wireless-regdb: upgrade 2024.05.08 -> 2024.07.04

---
 ...ireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
index 95e33d9fb1..daf5e6dfcd 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
+SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
 
 inherit bin_package allarch
 
-- 
2.44.0


--===============1638263684095314614==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2024.05.08-2024.07.04.patch"

RnJvbSA3NmI1MTQ0NWRiNzFhZTA3ZTg1MWRiZDUxMGZkOGRkMjZhMjk2ZjI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTU6NTU6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDI0LjA1LjA4IC0+IDIwMjQuMDcuMDQKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDI0LjA1LjA4LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjQuMDcuMDQu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyNC4wNS4wOC5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDI0LjA3LjA0LmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNC4wNS4wOC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNC4wNy4wNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjQuMDUuMDguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNC4wNy4wNC5iYgppbmRleCA5NWUzM2Q5ZmIxLi5kYWY1ZTZkZmNk
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjQuMDUuMDguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDI0LjA3LjA0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI5YWVlMWQ4NmViZWJiMzYzYjcxNGJlYzk0MWIyODIwZjMxZTNiN2YxYTQ4
NWRkYzlmY2JkOTk4NWM3ZDNlN2M0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk4MzJhMTRlMWJl
MjRhYmZmN2JlMzBkZWUzYzlhMWFmYjVmZGZjZjQ3NWEwZDkxYWFmZWYwMzlmOGQ4NWY1ZWIiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjQ0LjAKCg==

--===============1638263684095314614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.05.08.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.07.04.tar.xz"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2024.05.08 [default] to 2024.07.04 [default]
packages/all-poky-linux/wireless-regdb: PV changed from "2024.05.08" to "2024.07.04"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2024.05.08 [default] to 2024.07.04 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2024.05.08" to "2024.07.04"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2024.05.08 [default] to 2024.07.04 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 6021 to 6525 (+8%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2024.05.08" to "2024.07.04"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2024.05.08 [default] to 2024.07.04 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 7175 to 7747 (+8%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2024.05.08" to "2024.07.04"

--===============1638263684095314614==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F699CDE00E
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50436.1781195519897056371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pKzIPvYu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dfH4oXJR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb786b5a9-d612a9aa-d15e-467e-9a64-f5620ffcfc4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O9QUCTaSGNzTLQPJDtglXQkZVW6IboY5fDgxBq5gB0k=;
	b=pKzIPvYuDKXPw5SQJOmQwaYqoJpyuGdo0rizAB+J924QUyCtZ8sFOz+9ibvgaXXO
	PSB7wDE+gGmdh70RP3O3JbATrcwIQq9HgkeNS0SZBYJk1fUbHF6gREugbKdaSB36k0s
	8HVQrLKML+lQxVWZNvFluExAsFrekoJBk97FGXYM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O9QUCTaSGNzTLQPJDtglXQkZVW6IboY5fDgxBq5gB0k=;
	b=dfH4oXJRlV1EMJ3d1qNd9LES9COWwmcN+kXNkk2tyaaEnrYM2XMxFBZYTwbsscCr
	n7U6VV/VLACKcWDDo46ww8KoVFp4qYINVR6jJ2SjvdH+vaGXUIiIbyUPd1RY4ZX2snm
	RFWdeX3aCm4JTZaXLFcjNSiMfKVqGaMAzRi65iwg=
Content-Type: multipart/mixed; boundary="===============5432380740750284168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2026.05.30 SUCCEEDED
Message-ID: <0101019eb786b5a9-d612a9aa-d15e-467e-9a64-f5620ffcfc4b-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238549

--===============5432380740750284168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2026.05.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2026.03.18-2026.05.30.patch
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
From 79046a76b5699ec603102f4d797fde4a2a625ea1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:31:18 +0000
Subject: [PATCH] wireless-regdb: upgrade 2026.03.18 -> 2026.05.30

---
 ...ireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
index 18d7de7102..69dd761ca6 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
+SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
 
 inherit bin_package allarch
 
-- 
2.47.1


--===============5432380740750284168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PKGV changed from 2026.03.18 [default] to 2026.05.30 [default]
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2026.03.18.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2026.05.30.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2026.03.18" to "2026.05.30"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2026.03.18 [default] to 2026.05.30 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2026.03.18" to "2026.05.30"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2026.03.18 [default] to 2026.05.30 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 7393 to 7465 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2026.03.18" to "2026.05.30"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8755 to 8847 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2026.03.18 [default] to 2026.05.30 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2026.03.18" to "2026.05.30"

--===============5432380740750284168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2026.03.18-2026.05.30.patch"

RnJvbSA3OTA0NmE3NmI1Njk5ZWM2MDMxMDJmNGQ3OTdmZGU0YTJhNjI1ZWExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6MzE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDI2LjAzLjE4IC0+IDIwMjYuMDUuMzAKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDI2LjAzLjE4LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjYuMDUuMzAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyNi4wMy4xOC5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDI2LjA1LjMwLmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNi4wMy4xOC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNi4wNS4zMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjYuMDMuMTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNi4wNS4zMC5iYgppbmRleCAxOGQ3ZGU3MTAyLi42OWRkNzYxY2E2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjYuMDMuMTguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDI2LjA1LjMwLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI1ZmMwMDAwNDc1ZDhjNTM2OGNjYzUyMjI4MjdjMTZhZWY5OGIxZWI2YTY5
YzliNWEzZTdiN2U5ODUyODk0NWFjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhMjdiZmMwODFi
YWZlZDhjMjRkZDcwZmFiMGQ5NmYwOThlNWEwYmZjZDA4ZDNkYTY3MjU5NWYyMjVhYjg5OTMiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============5432380740750284168==--


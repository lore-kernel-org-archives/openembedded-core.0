Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E794BD4920E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.4642.1731964601359175614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CTRlY3s5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wPmAoxMb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101934122b671-b57b5b59-25de-44b6-8330-6aeceb3f958c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964614;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VeuKXMyf90Cvslr3dB+0qs+jDWlVYVZD+K97MNy5AHg=;
	b=CTRlY3s5nyEKU2gEvXqk8HAfHuQZpsvgLpdCt9QraGAvs86pnIBf77LC/4JQetDK
	jwsr8s3TbQiFsu6+rkGQlq6roRjQEvjJxZXA2YmGC73hugI5dFyMbrb3RmPsB1n/jAa
	cUT8cmNX5Gvei7iw2IWe7zAzjCUwfWqrCR8nOTeM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964614;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VeuKXMyf90Cvslr3dB+0qs+jDWlVYVZD+K97MNy5AHg=;
	b=wPmAoxMbHARulGuzKc9NkocW71dcZ+hagtF1q2KmR8LsrdT7SpJRDhwXepLx9s7u
	TFE8ysweWuM8tmStLjnwmf5BfoQ1w0bM/1wakttowJjshDPKdX94heOl/XW0+mfUekQ
	l58TNtUHmHa4QH5ay2BeHSz2dP0O0Dy5jOQr6HdQ=
Content-Type: multipart/mixed; boundary="===============1724070790893523885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] desktop-file-utils: upgrading to 0.28 SUCCEEDED
Message-ID: <010101934122b671-b57b5b59-25de-44b6-8330-6aeceb3f958c-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207259

--===============1724070790893523885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *desktop-file-utils* to *0.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-desktop-file-utils-upgrade-0.27-0.28.patch
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
From bb01e36b154eef851671a866fc078fb9a48f6cdd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 08:45:40 +0000
Subject: [PATCH] desktop-file-utils: upgrade 0.27 -> 0.28

---
 .../{desktop-file-utils_0.27.bb => desktop-file-utils_0.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.27.bb => desktop-file-utils_0.28.bb} (88%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
similarity index 88%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
index 5285a6c6ea..35537572fe 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a0817df39ce385b6621880407c56f1f298168c040c2032cedf88d5b76affe836"
+SRC_URI[sha256sum] = "4401d4e231d842c2de8242395a74a395ca468cd96f5f610d822df33594898a70"
 
 DEPENDS = "glib-2.0"
 
-- 
2.44.1


--===============1724070790893523885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PV changed from "0.27" to "0.28"
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PKGSIZE changed from 269784 to 275624 (+2%)
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-dev: PV changed from "0.27" to "0.28"
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-dev: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-doc: PV changed from "0.27" to "0.28"
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-doc: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-locale: PV changed from "0.27" to "0.28"
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-locale: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-src: PV changed from "0.27" to "0.28"
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-src: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-src: PKGSIZE changed from 180467 to 182436 (+1%)
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-staticdev: PV changed from "0.27" to "0.28"
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-staticdev: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils: PV changed from "0.27" to "0.28"
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils: SRC_URI changed from "http://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.27.tar.xz" to "http://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.28.tar.xz"
packages/core2-64-poky-linux/desktop-file-utils: PKGV changed from 0.27 [default] to 0.28 [default]
packages/core2-64-poky-linux/desktop-file-utils: PV changed from "0.27" to "0.28"

--===============1724070790893523885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-desktop-file-utils-upgrade-0.27-0.28.patch"

RnJvbSBiYjAxZTM2YjE1NGVlZjg1MTY3MWE4NjZmYzA3OGZiOWE0OGY2Y2RkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDg6NDU6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZXNrdG9wLWZpbGUtdXRpbHM6IHVwZ3JhZGUgMC4yNyAtPiAwLjI4CgotLS0KIC4uLi97ZGVza3Rv
cC1maWxlLXV0aWxzXzAuMjcuYmIgPT4gZGVza3RvcC1maWxlLXV0aWxzXzAuMjguYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMve2Rlc2t0b3AtZmlsZS11
dGlsc18wLjI3LmJiID0+IGRlc2t0b3AtZmlsZS11dGlsc18wLjI4LmJifSAoODglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMvZGVza3RvcC1m
aWxlLXV0aWxzXzAuMjcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0
aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI4LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMvZGVza3RvcC1m
aWxlLXV0aWxzXzAuMjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9w
LWZpbGUtdXRpbHMvZGVza3RvcC1maWxlLXV0aWxzXzAuMjguYmIKaW5kZXggNTI4NWE2YzZlYS4u
MzU1Mzc1NzJmZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3AtZmls
ZS11dGlscy9kZXNrdG9wLWZpbGUtdXRpbHNfMC4yNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI4LmJiCkBAIC04
LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9z
cmMvdmFsaWRhdG9yLmM7YmVnaW5saW5lPTQ7ZW5kbGluZT0yNzttZDU9MjgxZTExMTRlZTZjNDg2
YTFhMGE0Mjk1OTg2Yjk0MTYiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5mcmVlZGVza3RvcC5v
cmcvc29mdHdhcmUvJHtCUE59L3JlbGVhc2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJhMDgxN2RmMzljZTM4NWI2NjIxODgwNDA3YzU2ZjFmMjk4MTY4YzA0MGMyMDMyY2Vk
Zjg4ZDViNzZhZmZlODM2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0MDFkNGUyMzFkODQyYzJk
ZTgyNDIzOTVhNzRhMzk1Y2E0NjhjZDk2ZjVmNjEwZDgyMmRmMzM1OTQ4OThhNzAiCiAKIERFUEVO
RFMgPSAiZ2xpYi0yLjAiCiAKLS0gCjIuNDQuMQoK

--===============1724070790893523885==--


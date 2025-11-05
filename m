Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78B9CD4F25
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2368.1762384583580536215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oC63qNKK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=i/370OBe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564ee184-08e0d2b8-7b7e-494b-8cdc-3d25f16f4ad9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aYxnbSt6bh5iBefhSkMQ9/aeZfU9fx5L8ltbtxs7Clg=;
	b=oC63qNKKNyojpoA/+j5bOQjc8DLFBFyPIwRnNmx41IzIoiD/9lXNzPuJXVNitUZA
	9QuOfe1KpZXlZQoX8wi0xA4xMePHgvQzzNLEvj6jyXKuES37Gyi961jx8TP51RZK8kX
	qxvRIn6FKIKnEGWee6T+IBWWT433DxhM/CBzGQKY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aYxnbSt6bh5iBefhSkMQ9/aeZfU9fx5L8ltbtxs7Clg=;
	b=i/370OBeH9bkxGR+l9oR0JDcdrGgk8+9hbfcb1Dbze3JZaBEhKh3vmSZr7pWXtgX
	S/1A5ZCE/tHDQiltLE8yVOe7IhBepp9Mv20H/IbIGjiWNBT42R4WeC7dc3ghptV72Tb
	7S8KTPQxMkiXroift/7E98mHE9ouYMdNfuphWMgo=
Content-Type: multipart/mixed; boundary="===============3058006225131224182=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2025.10.07 SUCCEEDED
Message-ID: <0101019a564ee184-08e0d2b8-7b7e-494b-8cdc-3d25f16f4ad9-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225895

--===============3058006225131224182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2025.10.07* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2025.07.10-2025.10.07.patch
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
From de1a44e3f696280e47dd62136decfe9027105ea5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 21:33:30 +0000
Subject: [PATCH] wireless-regdb: upgrade 2025.07.10 -> 2025.10.07

---
 ...ireless-regdb_2025.07.10.bb => wireless-regdb_2025.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.07.10.bb => wireless-regdb_2025.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
index decccad05a..68ae3b0464 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a8340bcdcd1b5db6c79149879d122b170f3bb075381718d4f429ad831a6fa28d"
+SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
 
 inherit bin_package allarch
 
-- 
2.47.1


--===============3058006225131224182==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2025.07.10-2025.10.07.patch"

RnJvbSBkZTFhNDRlM2Y2OTYyODBlNDdkZDYyMTM2ZGVjZmU5MDI3MTA1ZWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMTozMzozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdp
cmVsZXNzLXJlZ2RiOiB1cGdyYWRlIDIwMjUuMDcuMTAgLT4gMjAyNS4xMC4wNwoKLS0tCiAuLi5p
cmVsZXNzLXJlZ2RiXzIwMjUuMDcuMTAuYmIgPT4gd2lyZWxlc3MtcmVnZGJfMjAyNS4xMC4wNy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3t3aXJlbGVzcy1yZWdk
Yl8yMDI1LjA3LjEwLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjUuMTAuMDcuYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93aXJlbGVzcy1y
ZWdkYl8yMDI1LjA3LjEwLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI1LjEwLjA3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3MtcmVnZGJfMjAy
NS4wNy4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI1LjEwLjA3LmJiCmluZGV4IGRlY2NjYWQwNWEuLjY4YWUzYjA0NjQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNS4wNy4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJl
Z2RiL3dpcmVsZXNzLXJlZ2RiXzIwMjUuMTAuMDcuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiSVNDIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDdjNGY2ZGVh
Mzg0NWIwMmExOGRjMDBjOGM4NzY5OWMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImE4MzQwYmNkY2QxYjVkYjZjNzkxNDk4NzlkMTIyYjE3MGYzYmIwNzUzODE3
MThkNGY0MjlhZDgzMWE2ZmEyOGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDRjODcyYTQ0MTU0
NjA0Yzg2OWY1ODUxZjdkMjFkODE4ZDQ5MjgzNWQzNzBhZjdmNThkZTg4NDc5NzM4MDFjMyIKIAog
aW5oZXJpdCBiaW5fcGFja2FnZSBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============3058006225131224182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2025.07.10.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2025.10.07.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2025.07.10" to "2025.10.07"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2025.07.10 [default] to 2025.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2025.07.10" to "2025.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2025.07.10 [default] to 2025.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 7333 to 7413 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2025.07.10" to "2025.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2025.07.10 [default] to 2025.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8655 to 8755 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2025.07.10" to "2025.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2025.07.10 [default] to 2025.10.07 [default]

--===============3058006225131224182==--


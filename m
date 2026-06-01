Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CAACD98E0
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:04 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1585.1780328152657640365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QKk+/1hZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Zq5CjXX8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3bc5a-a74e97a3-eba0-45c8-989e-a18e851b53a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4ZBk4YwXDN1Ehv1kuUgXcnFGv3EYfiENv2XZCFNBTeY=;
	b=QKk+/1hZbOQ2xoFswfFj/n2N9OTx+JCJ0t1LKmLiz8LNx/yNr2fbDdaRLVhWyB7A
	n8VbmxhMRjy2oyev+8T6x65ELmjB8dLZc4vxvgbxgXMPfJR+yK9/A7iyIQzAXYsWrfd
	4+/IOZAK2Ni/M/OckgxKX1qyN9tw/GFtmnopiZ1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4ZBk4YwXDN1Ehv1kuUgXcnFGv3EYfiENv2XZCFNBTeY=;
	b=Zq5CjXX83YC4kYrjXT+3V1yhMVApWodSICW8M475CNjPcTiEd3aXlViQXqEjmBZe
	CyT2LoTkBRSpVaowRljSZ8UwL1uRh0/0na4j58g0o7Xh4F1FoqaACTrTQaUY+SSaDW9
	YnUF75odU7ZzreEiKweuRLSmRAybb2GcUDKOyGks=
Content-Type: multipart/mixed; boundary="===============3148107730130083636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2026.05.30 SUCCEEDED
Message-ID: <0101019e83d3bc5a-a74e97a3-eba0-45c8-989e-a18e851b53a4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237937

--===============3148107730130083636==
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
From fe4debf871c7a3adf66290f06126f881625c8046 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 12:23:55 +0000
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


--===============3148107730130083636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2026.03.18-2026.05.30.patch"

RnJvbSBmZTRkZWJmODcxYzdhM2FkZjY2MjkwZjA2MTI2Zjg4MTYyNWM4MDQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMjoyMzo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdp
cmVsZXNzLXJlZ2RiOiB1cGdyYWRlIDIwMjYuMDMuMTggLT4gMjAyNi4wNS4zMAoKLS0tCiAuLi5p
cmVsZXNzLXJlZ2RiXzIwMjYuMDMuMTguYmIgPT4gd2lyZWxlc3MtcmVnZGJfMjAyNi4wNS4zMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3t3aXJlbGVzcy1yZWdk
Yl8yMDI2LjAzLjE4LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjYuMDUuMzAuYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93aXJlbGVzcy1y
ZWdkYl8yMDI2LjAzLjE4LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI2LjA1LjMwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3MtcmVnZGJfMjAy
Ni4wMy4xOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI2LjA1LjMwLmJiCmluZGV4IDE4ZDdkZTcxMDIuLjY5ZGQ3NjFjYTYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNi4wMy4xOC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJl
Z2RiL3dpcmVsZXNzLXJlZ2RiXzIwMjYuMDUuMzAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiSVNDIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDdjNGY2ZGVh
Mzg0NWIwMmExOGRjMDBjOGM4NzY5OWMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjVmYzAwMDA0NzVkOGM1MzY4Y2NjNTIyMjgyN2MxNmFlZjk4YjFlYjZhNjlj
OWI1YTNlN2I3ZTk4NTI4OTQ1YWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGEyN2JmYzA4MWJh
ZmVkOGMyNGRkNzBmYWIwZDk2ZjA5OGU1YTBiZmNkMDhkM2RhNjcyNTk1ZjIyNWFiODk5MyIKIAog
aW5oZXJpdCBiaW5fcGFja2FnZSBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============3148107730130083636==
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
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2026.03.18" to "2026.05.30"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 7393 to 7465 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2026.03.18 [default] to 2026.05.30 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2026.03.18" to "2026.05.30"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8755 to 8847 (+1%)

--===============3148107730130083636==--


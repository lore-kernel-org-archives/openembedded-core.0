Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1ECCD4F20
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15620.1777645536402545244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=u5gk/9y1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q/mkLdvD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee8483-53691bba-e403-4813-ba4d-4a58bff7c4c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/GhSVtvGqbM6tz3W8jD/rCwTmNYQoJdAJITNggoozrI=;
	b=u5gk/9y1j2vFfxHMoYXGJEUOzovVxJKcJAprrHG/n5TUwUGubdUajlLYPDZAv0Le
	m7I+T4F0ZB4oJOfuDir0dY87Zv6UJB9h+ZQTmSJ6datNOdF+3hfZxpJGUz6OE2doYl/
	HXR68GypUifcDTQUdomHVm9JsND0CnrfjN8bU3JM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/GhSVtvGqbM6tz3W8jD/rCwTmNYQoJdAJITNggoozrI=;
	b=Q/mkLdvD+iyinj+l5lZFSMfff0js3GZuq/CGqbZtq6uUtRtWgv4y7STG+GLlHccH
	1zlCZUntGIUUofNuiG/xN5qXL5RIVAtqBNRc4UXq3U+37iiZ2EZs6Hif9egypCDOWkc
	V32Kg6b6O8slR1pypONclLT1AFOfDTfhBHXhrg/g=
Content-Type: multipart/mixed; boundary="===============3587472330549626289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2026.03.18 SUCCEEDED
Message-ID: <0101019de3ee8483-53691bba-e403-4813-ba4d-4a58bff7c4c8-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236282

--===============3587472330549626289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2026.03.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2026.02.04-2026.03.18.patch
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
From 02359b63cbb60f8aa0152810b9644a2635dc538c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:51:53 +0000
Subject: [PATCH] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18

---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c816043..a70e9dd0da 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 
-- 
2.47.1


--===============3587472330549626289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2026.02.04-2026.03.18.patch"

RnJvbSAwMjM1OWI2M2NiYjYwZjhhYTAxNTI4MTBiOTY0NGEyNjM1ZGM1MzhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjo1MTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdp
cmVsZXNzLXJlZ2RiOiB1cGdyYWRlIDIwMjYuMDIuMDQgLT4gMjAyNi4wMy4xOAoKLS0tCiAuLi5p
cmVsZXNzLXJlZ2RiXzIwMjYuMDIuMDQuYmIgPT4gd2lyZWxlc3MtcmVnZGJfMjAyNi4wMy4xOC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3t3aXJlbGVzcy1yZWdk
Yl8yMDI2LjAyLjA0LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjYuMDMuMTguYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93aXJlbGVzcy1y
ZWdkYl8yMDI2LjAyLjA0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI2LjAzLjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3MtcmVnZGJfMjAy
Ni4wMi4wNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI2LjAzLjE4LmJiCmluZGV4IDJmN2M4MTYwNDMuLmE3MGU5ZGQwZGEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNi4wMi4wNC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJl
Z2RiL3dpcmVsZXNzLXJlZ2RiXzIwMjYuMDMuMTguYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiSVNDIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDdjNGY2ZGVh
Mzg0NWIwMmExOGRjMDBjOGM4NzY5OWMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjBmZjQ4YTVjZDllOWNmZThlODE1YTI0ZTAyMzczNDkxOWU5YTNiN2FkMmYw
MzkyNDNhZDEyMWNmNWFhYmY2YzYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWZjMDAwMDQ3NWQ4
YzUzNjhjY2M1MjIyODI3YzE2YWVmOThiMWViNmE2OWM5YjVhM2U3YjdlOTg1Mjg5NDVhYyIKIAog
aW5oZXJpdCBiaW5fcGFja2FnZSBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============3587472330549626289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PV changed from "2026.02.04" to "2026.03.18"
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2026.02.04.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2026.03.18.tar.xz"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2026.02.04 [default] to 2026.03.18 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2026.02.04" to "2026.03.18"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2026.02.04 [default] to 2026.03.18 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2026.02.04" to "2026.03.18"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2026.02.04 [default] to 2026.03.18 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8751 to 8755 (+0%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2026.02.04" to "2026.03.18"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2026.02.04 [default] to 2026.03.18 [default]

--===============3587472330549626289==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685E1C61DD3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 05:38:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7585.1788500298064891113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 22:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rTXZlDbf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EKTu4266;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a06aecc606-ff3538a2-81e4-480c-949f-d6e314f5766e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788500297;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=HQZK/kTemURmnT2h5Qo9uSBYZBO2z/Bmqv5ThgCuqew=;
	b=rTXZlDbfpi3MeeM65Q+Ss7YTYp/JlnYFV78zu+TZp71UtWV1uDxtvhNxJ9bdqB2/
	tHXGZh6QSA0b2OFxvgHdSx3raZCwpz3YcAZdkD4UpBYs1f3Zb6qUs21MxvSnOrtplTL
	Td63iUnQEa6Cou1JvAA+O6t71PBPKBcBY5t192HY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788500297;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=HQZK/kTemURmnT2h5Qo9uSBYZBO2z/Bmqv5ThgCuqew=;
	b=EKTu4266zP+UB8PDjyugNM3jiRrDCCas/e6mXH+TPLkghN2Wou8NkNdSKTj/p67U
	+KnEBNDwhCNt5P5keFHqThLn1+qdK3HXoWyjAkTUD5hFvMELTyDjdoNJzMfoRbJL6TA
	srbMj02iRfDXWBYc6C9V7sQ1C+d5a2txtI3pHYOs=
Content-Type: multipart/mixed; boundary="===============0454699720885444563=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2026.09.03 SUCCEEDED
Message-ID: <010101a06aecc606-ff3538a2-81e4-480c-949f-d6e314f5766e-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2026 05:38:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.04-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245057

--===============0454699720885444563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2026.09.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2026.05.30-2026.09.03.patch
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
From c79fc024018479f6550821bbf60f13ba3ad9d0b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 4 Sep 2026 05:30:51 +0000
Subject: [PATCH] wireless-regdb: upgrade 2026.05.30 -> 2026.09.03

---
 ...ireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
index 69dd761ca6..18cb4bf353 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
+SRC_URI[sha256sum] = "b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d"
 
 inherit bin_package allarch
 
-- 
2.47.1


--===============0454699720885444563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PV changed from "2026.05.30" to "2026.09.03"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2026.05.30 [default] to 2026.09.03 [default]
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2026.05.30.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2026.09.03.tar.xz"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2026.05.30" to "2026.09.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2026.05.30 [default] to 2026.09.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2026.05.30" to "2026.09.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2026.05.30 [default] to 2026.09.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 7465 to 7433 (-0%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2026.05.30" to "2026.09.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2026.05.30 [default] to 2026.09.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8847 to 8815 (-0%)

--===============0454699720885444563==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2026.05.30-2026.09.03.patch"

RnJvbSBjNzlmYzAyNDAxODQ3OWY2NTUwODIxYmJmNjBmMTNiYTNhZDlkMGIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNCBTZXAgMjAyNiAwNTozMDo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdp
cmVsZXNzLXJlZ2RiOiB1cGdyYWRlIDIwMjYuMDUuMzAgLT4gMjAyNi4wOS4wMwoKLS0tCiAuLi5p
cmVsZXNzLXJlZ2RiXzIwMjYuMDUuMzAuYmIgPT4gd2lyZWxlc3MtcmVnZGJfMjAyNi4wOS4wMy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3t3aXJlbGVzcy1yZWdk
Yl8yMDI2LjA1LjMwLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjYuMDkuMDMuYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93aXJlbGVzcy1y
ZWdkYl8yMDI2LjA1LjMwLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI2LjA5LjAzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3MtcmVnZGJfMjAy
Ni4wNS4zMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI2LjA5LjAzLmJiCmluZGV4IDY5ZGQ3NjFjYTYuLjE4Y2I0YmYzNTMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNi4wNS4zMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJl
Z2RiL3dpcmVsZXNzLXJlZ2RiXzIwMjYuMDkuMDMuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiSVNDIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDdjNGY2ZGVh
Mzg0NWIwMmExOGRjMDBjOGM4NzY5OWMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjhhMjdiZmMwODFiYWZlZDhjMjRkZDcwZmFiMGQ5NmYwOThlNWEwYmZjZDA4
ZDNkYTY3MjU5NWYyMjVhYjg5OTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjIyZTA5MDEyMjdi
ODIwY2QxYzI4MGFiZTY4MWExNWI3NzNhNTEwM2E1ZTEwZGM0NDJlOTRlYmIzNGNiZjU4ZCIKIAog
aW5oZXJpdCBiaW5fcGFja2FnZSBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============0454699720885444563==--


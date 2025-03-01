Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2351DC282C6
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.7066.1740828338932856618
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=E1rTDF1h;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MGBlrPss;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019551746925-5f940146-341d-4921-b373-abe738096d8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TA8jgJHgpPBrJnPd8M2jYrPquhGI1HeqBMFPGlqWf5I=;
	b=E1rTDF1hdPSvVkO7WVm+H6gbKoDt+5Xo+JzGpMWE9NN1VEPytHtrZ26zKNTzJcwX
	pu+EBCr0nmyiZyipm8pi2XZAPqxoyVarvVVe53mxd+BRnKRCGIVYK0PzO7ukOnK4NKp
	UGDYoAqkb/rFNvu1nkg6sGbWirASrmrIwBzjibDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TA8jgJHgpPBrJnPd8M2jYrPquhGI1HeqBMFPGlqWf5I=;
	b=MGBlrPssfTITJPvGNmv855JFvqjRPs+GjzmTs7VFus4TAn3eE17X+lcO5IZEVhlt
	Tcq48b7Y/hYVR48QR0yVGNRuh/BG3FG8APEl7NbQ+Bv7A+4rNHjIqRmkhCJIm4zvvdX
	BPbmPcvTzvoJ0eOuxE56RthmPGOjWFIn/MuioozA=
Content-Type: multipart/mixed; boundary="===============0466714100873370677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2025.02.20 SUCCEEDED
Message-ID: <0101019551746925-5f940146-341d-4921-b373-abe738096d8f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212170

--===============0466714100873370677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2025.02.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2024.10.07-2025.02.20.patch
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
From 0e683f1881241accae1692442bb7069fbda9cedd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 10:59:30 +0000
Subject: [PATCH] wireless-regdb: upgrade 2024.10.07 -> 2025.02.20

---
 ...ireless-regdb_2024.10.07.bb => wireless-regdb_2025.02.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.10.07.bb => wireless-regdb_2025.02.20.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
index 0e4100fba7..09fff768c4 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
+SRC_URI[sha256sum] = "57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456"
 
 inherit bin_package allarch
 
-- 
2.44.1


--===============0466714100873370677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.10.07.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2025.02.20.tar.xz"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2024.10.07 [default] to 2025.02.20 [default]
packages/all-poky-linux/wireless-regdb: PV changed from "2024.10.07" to "2025.02.20"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2024.10.07 [default] to 2025.02.20 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2024.10.07" to "2025.02.20"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2024.10.07 [default] to 2025.02.20 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 7065 to 7277 (+3%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2024.10.07" to "2025.02.20"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2024.10.07 [default] to 2025.02.20 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8351 to 8563 (+3%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2024.10.07" to "2025.02.20"

--===============0466714100873370677==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2024.10.07-2025.02.20.patch"

RnJvbSAwZTY4M2YxODgxMjQxYWNjYWUxNjkyNDQyYmI3MDY5ZmJkYTljZWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMDo1OTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdp
cmVsZXNzLXJlZ2RiOiB1cGdyYWRlIDIwMjQuMTAuMDcgLT4gMjAyNS4wMi4yMAoKLS0tCiAuLi5p
cmVsZXNzLXJlZ2RiXzIwMjQuMTAuMDcuYmIgPT4gd2lyZWxlc3MtcmVnZGJfMjAyNS4wMi4yMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3t3aXJlbGVzcy1yZWdk
Yl8yMDI0LjEwLjA3LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjUuMDIuMjAuYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93aXJlbGVzcy1y
ZWdkYl8yMDI0LjEwLjA3LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI1LjAyLjIwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3MtcmVnZGJfMjAy
NC4xMC4wNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDI1LjAyLjIwLmJiCmluZGV4IDBlNDEwMGZiYTcuLjA5ZmZmNzY4YzQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNC4xMC4wNy5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJl
Z2RiL3dpcmVsZXNzLXJlZ2RiXzIwMjUuMDIuMjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiSVNDIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDdjNGY2ZGVh
Mzg0NWIwMmExOGRjMDBjOGM4NzY5OWMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImY3NmYyYmQ3OWE2NTNlOWY5ZGQ1MDU0OGQ5OWQwM2E0YTRlYjE1N2RhMDU2
ZGZkNTg5MmY0MDNlYzI4ZmIzZDUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTdmOGU3NzIxY2Y1
YTg4MGMxM2FlMGMyMDJlZGJiMjEwOTJhMDYwZDQ1ZjllOWM1OWJjZDJhODI3MmJmYTQ1NiIKIAog
aW5oZXJpdCBiaW5fcGFja2FnZSBhbGxhcmNoCiAKLS0gCjIuNDQuMQoK

--===============0466714100873370677==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACFAC54EDC
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1277.1710522012517623170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M0OKcnFv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AfxbpkcC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e430e9183-7d794ffa-27d5-41be-9084-81d63259fc81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BdTJH++yaz3AcK2okM2eei7UnUUgZn+TJDqeVbnMxRI=;
	b=M0OKcnFvajQVEETqi+z21VlKtGVYUaVhnJHVjIEGK91qEoXDTDtflooBUVGyd6T4
	ofiBPXxLJXObu8Cf/1QA9Hf4krolSLlyqr3sFJAcOz4UoNvmiReeJYyhurh4Wkdop41
	d+3JrWGsEAF2NlY6NdGSqVVvUijHBkCJX4CQ0Xr4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BdTJH++yaz3AcK2okM2eei7UnUUgZn+TJDqeVbnMxRI=;
	b=AfxbpkcCpafQOAgcBAEXXbbqpab3IXkXEBo6M2T/0xSHOUTyr39jLXJ/g7KPHVE9
	pjLZOP7mn157Gmf4RtQcKshoeFyPxFA+1EPa9ePlb4RmjfG2I0EzQ5GfwZaYWdDP8CM
	5Dcz0VAPZFuAzztNwuxEHSLy/2a3rGob4cA8MPfc=
Content-Type: multipart/mixed; boundary="===============8674010580885247390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.16 SUCCEEDED
Message-ID: <0101018e430e9183-7d794ffa-27d5-41be-9084-81d63259fc81-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197186

--===============8674010580885247390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.15-0.56.16.patch
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
From 805cb961c5ef172d45b7f0e3394de9ff803012e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 10:18:48 +0000
Subject: [PATCH] vala: upgrade 0.56.15 -> 0.56.16

---
 meta/recipes-devtools/vala/{vala_0.56.15.bb => vala_0.56.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.15.bb => vala_0.56.16.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-devtools/vala/vala_0.56.16.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.15.bb
rename to meta/recipes-devtools/vala/vala_0.56.16.bb
index dc483b12ba..f19c794201 100644
--- a/meta/recipes-devtools/vala/vala_0.56.15.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.16.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff3173741ec2cb3f2b"
+SRC_URI[sha256sum] = "05487b5600f5d2f09e66a753cccd8f39c1bff9f148aea1b7774d505b9c8bca9b"
-- 
2.42.0


--===============8674010580885247390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vala: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.15.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.16.tar.xz"
packages/core2-64-poky-linux/vala: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-dbg: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-dbg: PKGSIZE changed from 18915760 to 18916824 (+0%)
packages/core2-64-poky-linux/vala/vala-dbg: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-dev: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-dev: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-doc: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-doc: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-locale: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-locale: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-src: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-src: PKGSIZE changed from 15918697 to 15919441 (+0%)
packages/core2-64-poky-linux/vala/vala-src: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-staticdev: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala: PKGSIZE changed from 12388101 to 12388322 (+0%)
packages/core2-64-poky-linux/vala/vala: PKGV changed from 0.56.15 [default] to 0.56.16 [default]

--===============8674010580885247390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.15-0.56.16.patch"

RnJvbSA4MDVjYjk2MWM1ZWYxNzJkNDViN2YwZTMzOTRkZTlmZjgwMzAxMmUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTA6MTg6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxhOiB1cGdyYWRlIDAuNTYuMTUgLT4gMC41Ni4xNgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsYS97dmFsYV8wLjU2LjE1LmJiID0+IHZhbGFfMC41Ni4xNi5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsYS97dmFsYV8wLjU2LjE1LmJiID0+IHZhbGFfMC41Ni4xNi5iYn0g
KDE4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYu
MTUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTYuYmIKc2ltaWxh
cml0eSBpbmRleCAxOCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFs
YV8wLjU2LjE1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAu
NTYuMTYuYmIKaW5kZXggZGM0ODNiMTJiYS4uZjE5Yzc5NDIwMSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xNi5iYgpAQCAtMSwzICsxLDMgQEAKIHJlcXVpcmUgJHtC
UE59LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTM1YjY0NTJlZDMxMGZkNWZiNWM3ZGQ2
Nzk0YjYyMTNkYWMzYjQ4ZTY0NWU1YmZmMzE3Mzc0MWVjMmNiM2YyYiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwNTQ4N2I1NjAwZjVkMmYwOWU2NmE3NTNjY2NkOGYzOWMxYmZmOWYxNDhhZWExYjc3
NzRkNTA1YjljOGJjYTliIgotLSAKMi40Mi4wCgo=

--===============8674010580885247390==--


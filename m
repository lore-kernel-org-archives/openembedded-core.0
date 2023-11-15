Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79512C54FD7
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.14634.1700059032035752778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F09AsuHZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NBTSZQOA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018bd36a25b0-3cd730d2-3502-4af6-bd6a-68f9bc09a3a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lnKxMizJSop9WGU26YNxxNAWIszDJP5QXMKgg6GfJDc=;
	b=F09AsuHZXoKYBd3icFPIPLw9SQP3aIKQ1kMw+PSyutqyBlAAgCX5o5Iw9slqqHUE
	aB8q8nWR4kAxNSfVeYxXY5Uyho7n1Bpf959CZ6Buu6Ix15JduXuDgEToOU/7xRcaod8
	Xxb+dv7C1FSj/FtvNuWTCXP6ojuQtSKqQPQ9uObI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lnKxMizJSop9WGU26YNxxNAWIszDJP5QXMKgg6GfJDc=;
	b=NBTSZQOAkMOpn7CzhE8CtX5surOAUUWeoY4H+ZkxGIAbCnFHZmPdHc6dnhB2NXCA
	U+LSU4ppMqX5DRXGPcZiExIsg6FGOJR47QUVDpLuWuxp3sN76tjCaHD5A83MGDioHBr
	Xg3T0OjB41yOrgKXzoeGYEbUZ9NtEJ9vlXPR22cQ=
Content-Type: multipart/mixed; boundary="===============2643204354448552933=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.14 SUCCEEDED
Message-ID: <0101018bd36a25b0-3cd730d2-3502-4af6-bd6a-68f9bc09a3a4-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190673

--===============2643204354448552933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.13-0.56.14.patch
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
From ed2adc5143801cc446b36903861d4135dec8c5c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 08:45:25 +0000
Subject: [PATCH] vala: upgrade 0.56.13 -> 0.56.14

---
 meta/recipes-devtools/vala/{vala_0.56.13.bb => vala_0.56.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.13.bb => vala_0.56.14.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.13.bb b/meta/recipes-devtools/vala/vala_0.56.14.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.13.bb
rename to meta/recipes-devtools/vala/vala_0.56.14.bb
index 0d43ac59a0..3240214bf8 100644
--- a/meta/recipes-devtools/vala/vala_0.56.13.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.14.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "4988223036c7e1e4874c476d0de8bd9cbe500ee25ef19a76e560dc0b6d56ae07"
+SRC_URI[sha256sum] = "9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557"
-- 
2.39.2


--===============2643204354448552933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vala: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.13.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.14.tar.xz"
packages/core2-64-poky-linux/vala: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-dbg: PKGSIZE changed from 18891712 to 18897176 (+0%)
packages/core2-64-poky-linux/vala/vala-dbg: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-dbg: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-dev: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-dev: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-doc: PKGSIZE changed from 10313 to 10319 (+0%)
packages/core2-64-poky-linux/vala/vala-doc: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-doc: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-locale: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-locale: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-src: PKGSIZE changed from 15804520 to 15810014 (+0%)
packages/core2-64-poky-linux/vala/vala-src: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-src: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-staticdev: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala: PKGSIZE changed from 12328510 to 12349072 (+0%)
packages/core2-64-poky-linux/vala/vala: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala: PKGV changed from 0.56.13 [default] to 0.56.14 [default]

--===============2643204354448552933==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.13-0.56.14.patch"

RnJvbSBlZDJhZGM1MTQzODAxY2M0NDZiMzY5MDM4NjFkNDEzNWRlYzhjNWM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDg6NDU6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxhOiB1cGdyYWRlIDAuNTYuMTMgLT4gMC41Ni4xNAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsYS97dmFsYV8wLjU2LjEzLmJiID0+IHZhbGFfMC41Ni4xNC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsYS97dmFsYV8wLjU2LjEzLmJiID0+IHZhbGFfMC41Ni4xNC5iYn0g
KDE4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYu
MTMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTQuYmIKc2ltaWxh
cml0eSBpbmRleCAxOCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFs
YV8wLjU2LjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAu
NTYuMTQuYmIKaW5kZXggMGQ0M2FjNTlhMC4uMzI0MDIxNGJmOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xNC5iYgpAQCAtMSwzICsxLDMgQEAKIHJlcXVpcmUgJHtC
UE59LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDk4ODIyMzAzNmM3ZTFlNDg3NGM0NzZk
MGRlOGJkOWNiZTUwMGVlMjVlZjE5YTc2ZTU2MGRjMGI2ZDU2YWUwNyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5MzgyYzI2OGNhOWJkYzAyYWFlZGM4MTUyYTk4MThiZjM5MzUyNzMwNDFmNjI5YzU2
ZGU0MTBlMzYwYTNmNTU3IgotLSAKMi4zOS4yCgo=

--===============2643204354448552933==--


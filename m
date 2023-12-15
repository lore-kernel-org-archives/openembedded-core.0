Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F6DC47DAF
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.63621.1702649867614148176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FNzH9iuD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gm07CIOd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd72ae6-76648cbe-e40f-4fb0-bab2-b8e9aa95a843-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nOUN9jqnR/VIuSTD10UWMUnQjBPVEFa7EEBF+Ij3MK0=;
	b=FNzH9iuD3WW37+YVSGh1z/ASKiF3wGG4UeJpLV9rjHeQFXQ30F/nsstiV5rE9giD
	6+Q/cZJfPm6tyl6vLPK3kfKbz9An3rgpnBGIuCLc04BUQjEsPQ8Gk5YUqE2GBlRwU+4
	bm1DufIxBuFXAqpqkyV/wqI4jc1UGzSQY9cnwk6o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nOUN9jqnR/VIuSTD10UWMUnQjBPVEFa7EEBF+Ij3MK0=;
	b=gm07CIOdY3J/q4ZK/rnY1t78OG12/CweSXVfcl9VYwn3PRxkvPf4wSK6OmmeXnNz
	dj4M7tYwyT6X/0GYDHGE4NVOMTqbMU2OATAa+D86K99H8lDyhkoGK6ztZhlnlT7g2TY
	iMR5Y/+2KrGVlzwGdSxTuoR/ugF54ygMMZq8erUQ=
Content-Type: multipart/mixed; boundary="===============8952416906394024740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.14 SUCCEEDED
Message-ID: <0101018c6dd72ae6-76648cbe-e40f-4fb0-bab2-b8e9aa95a843-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192490

--===============8952416906394024740==
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
From c884ece976694441b1e314ba7ec0c94908fdfc27 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 09:30:02 +0000
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
2.42.0


--===============8952416906394024740==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.13-0.56.14.patch"

RnJvbSBjODg0ZWNlOTc2Njk0NDQxYjFlMzE0YmE3ZWMwYzk0OTA4ZmRmYzI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDk6MzA6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
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
ZGU0MTBlMzYwYTNmNTU3IgotLSAKMi40Mi4wCgo=

--===============8952416906394024740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vala: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.13.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.14.tar.xz"
packages/core2-64-poky-linux/vala/vala-dbg: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-dbg: PKGSIZE changed from 18890736 to 18896200 (+0%)
packages/core2-64-poky-linux/vala/vala-dbg: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-dev: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-dev: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-doc: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-doc: PKGSIZE changed from 10313 to 10319 (+0%)
packages/core2-64-poky-linux/vala/vala-doc: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-locale: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-locale: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-src: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-src: PKGSIZE changed from 15804520 to 15810014 (+0%)
packages/core2-64-poky-linux/vala/vala-src: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-staticdev: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala: PKGSIZE changed from 12324414 to 12344976 (+0%)
packages/core2-64-poky-linux/vala/vala: PKGV changed from 0.56.13 [default] to 0.56.14 [default]

--===============8952416906394024740==--


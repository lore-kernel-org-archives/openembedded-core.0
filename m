Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39831EEEC04
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.29473.1694804394522858603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dZA++O+Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Xc2SG2En;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a9a36bfa0-b138088a-3a80-41a1-9058-5570e547a545-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TlCgW6znDILGfHJJZmc62ctAhJBGWkL9n6uz6bofE2M=;
	b=dZA++O+QcZXckr3oknxOK3Br57/K7gxezR/V5fCTFC8j+dywLulIHioFzpsd85LD
	fgKj/Kxo0eZNlQRWvuqYZrExBArevSSM6MbM+21g3jloSqxn4zHDSlF9LRC8mN4YQIE
	Ni96aunPyiilr17jq0RDK5g4vcjfrojlpF92btE8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TlCgW6znDILGfHJJZmc62ctAhJBGWkL9n6uz6bofE2M=;
	b=Xc2SG2EnV7xyxjGM0YGP23QIpvDucBsF1L09oLGRxIIDyihnoZW774A4W6Wnbe35
	CjUUv1j4cpS12LJodxvnMHaAe3kPTeKB8ycV+KA9XjnnbaNO1wsESHdw6EDqqcXQiBP
	/27mAiznDzrj5V8XGKufziOIV9JUa+N1isMm5sn0=
Content-Type: multipart/mixed; boundary="===============5902782209724918858=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.13 SUCCEEDED
Message-ID: <0101018a9a36bfa0-b138088a-3a80-41a1-9058-5570e547a545-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187722

--===============5902782209724918858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.8-0.56.13.patch
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
From b216df925be595241087832400604a1518f2754a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 12:17:13 +0000
Subject: [PATCH] vala: upgrade 0.56.8 -> 0.56.13

---
 meta/recipes-devtools/vala/{vala_0.56.8.bb => vala_0.56.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.8.bb => vala_0.56.13.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.8.bb b/meta/recipes-devtools/vala/vala_0.56.13.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.8.bb
rename to meta/recipes-devtools/vala/vala_0.56.13.bb
index f55fb41ad3..0d43ac59a0 100644
--- a/meta/recipes-devtools/vala/vala_0.56.8.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.13.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "93f81dcfc6a93b77baa271d65e6be981ee3238ad451ef380af118e295d904bde"
+SRC_URI[sha256sum] = "4988223036c7e1e4874c476d0de8bd9cbe500ee25ef19a76e560dc0b6d56ae07"
-- 
2.39.2


--===============5902782209724918858==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.8-0.56.13.patch"

RnJvbSBiMjE2ZGY5MjViZTU5NTI0MTA4NzgzMjQwMDYwNGExNTE4ZjI3NTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTI6MTc6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxhOiB1cGdyYWRlIDAuNTYuOCAtPiAwLjU2LjEzCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxhL3t2YWxhXzAuNTYuOC5iYiA9PiB2YWxhXzAuNTYuMTMuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGEve3ZhbGFfMC41Ni44LmJiID0+IHZhbGFfMC41Ni4xMy5iYn0gKDE4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuOC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDE4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAu
NTYuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjEz
LmJiCmluZGV4IGY1NWZiNDFhZDMuLjBkNDNhYzU5YTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxhL3ZhbGFfMC41Ni4xMy5iYgpAQCAtMSwzICsxLDMgQEAKIHJlcXVpcmUgJHtCUE59Lmlu
YwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTNmODFkY2ZjNmE5M2I3N2JhYTI3MWQ2NWU2YmU5
ODFlZTMyMzhhZDQ1MWVmMzgwYWYxMThlMjk1ZDkwNGJkZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI0OTg4MjIzMDM2YzdlMWU0ODc0YzQ3NmQwZGU4YmQ5Y2JlNTAwZWUyNWVmMTlhNzZlNTYwZGMw
YjZkNTZhZTA3IgotLSAKMi4zOS4yCgo=

--===============5902782209724918858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.8.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.13.tar.xz"
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 16368992 to 16378752 (+0%)
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-dev: PKGSIZE changed from 439364 to 439657 (+0%)
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 10301 to 10313 (+0%)
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15792695 to 15804520 (+0%)
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 13227550 to 13249826 (+0%)
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.56.8 [default] to 0.56.13 [default]

--===============5902782209724918858==--


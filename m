Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66783C54FB8
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.14630.1700059030929094964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IFc027OD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MmO2eX5c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd36a2b0e-ea297ac2-537c-4fb3-b732-45decedafddf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=JmJqtcSrXnWZy0W8/ngiAMhoMA4iLwvrJcGQjZdNEys=;
	b=IFc027ODQNKAUTEGR26C74mZfvj3XQbj98jLdzjcFeebvc1irVnXqQwva5IWjHgl
	dnFGg8jGMXfXljLRl+GwsDxrAsrN4kb2AoPWcnuJwnB64wtw9R+i51ptshreObVvhtn
	ohbg15sSTOLIBx6bYfoi+dpo7je0ZDIxIUg5dkzk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=JmJqtcSrXnWZy0W8/ngiAMhoMA4iLwvrJcGQjZdNEys=;
	b=MmO2eX5cKa6qD+GHuX3PvjOUd091J3R4eSkak9fZ1XNcUBa0rDL2fDWc5fUfhyIC
	EUZ/bdOqo1dxVgKb31v7KyrDwhK5IdzmIsNf+LPRdSTaOLqOdBcqfKztmI0cfFOXTIr
	X/Ihx5MeUL1YJYSLQvdYtNHP+fnLpJijFnHTYuOI=
Content-Type: multipart/mixed; boundary="===============8817542933229761199=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxrandr: upgrading to 1.5.4 SUCCEEDED
Message-ID: <0101018bd36a2b0e-ea297ac2-537c-4fb3-b732-45decedafddf-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190691

--===============8817542933229761199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxrandr* to *1.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxrandr-upgrade-1.5.3-1.5.4.patch
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
From 0b7950469625a3bd24aad12570ad8bc29b150a54 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 12:21:50 +0000
Subject: [PATCH] libxrandr: upgrade 1.5.3 -> 1.5.4

---
 .../xorg-lib/{libxrandr_1.5.3.bb => libxrandr_1.5.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.5.3.bb => libxrandr_1.5.4.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
index 98572bd969..3e2825b916 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
@@ -19,4 +19,4 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "897639014a78e1497704d669c5dd5682d721931a4452c89a7ba62676064eb428"
+SRC_URI[sha256sum] = "1ad5b065375f4a85915aa60611cc6407c060492a214d7f9daf214be752c3b4d3"
-- 
2.39.2


--===============8817542933229761199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXrandr-1.5.3.tar.xz" to "https://www.x.org/releases//individual/lib/libXrandr-1.5.4.tar.xz"
packages/core2-64-poky-linux/libxrandr/libxrandr-dbg: PKGSIZE changed from 351216 to 351184 (-0%)
packages/core2-64-poky-linux/libxrandr/libxrandr-dbg: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-dbg: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-dev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-dev: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-doc: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-doc: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-locale: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-locale: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-src: PKGSIZE changed from 116726 to 116731 (+0%)
packages/core2-64-poky-linux/libxrandr/libxrandr-src: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-src: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr-staticdev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr-staticdev: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/libxrandr/libxrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/libxrandr/libxrandr: PV changed from "1.5.3" to "1.5.4"

--===============8817542933229761199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxrandr-upgrade-1.5.3-1.5.4.patch"

RnJvbSAwYjc5NTA0Njk2MjVhM2JkMjRhYWQxMjU3MGFkOGJjMjliMTUwYTU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTI6MjE6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4cmFuZHI6IHVwZ3JhZGUgMS41LjMgLT4gMS41LjQKCi0tLQogLi4uL3hvcmctbGliL3tsaWJ4
cmFuZHJfMS41LjMuYmIgPT4gbGlieHJhbmRyXzEuNS40LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4cmFuZHJfMS41LjMuYmIgPT4gbGlieHJhbmRy
XzEuNS40LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWxpYi9saWJ4cmFuZHJfMS41LjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
bGlieHJhbmRyXzEuNS40LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cmFuZHJfMS41LjMuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cmFuZHJfMS41LjQuYmIKaW5kZXggOTg1
NzJiZDk2OS4uM2UyODI1YjkxNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL2xpYnhyYW5kcl8xLjUuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1saWIvbGlieHJhbmRyXzEuNS40LmJiCkBAIC0xOSw0ICsxOSw0IEBAIFhPUkdfUE4gPSAibGli
WHJhbmRyIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI4OTc2MzkwMTRhNzhlMTQ5NzcwNGQ2NjljNWRkNTY4MmQ3MjE5MzFhNDQ1
MmM4OWE3YmE2MjY3NjA2NGViNDI4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFhZDViMDY1Mzc1
ZjRhODU5MTVhYTYwNjExY2M2NDA3YzA2MDQ5MmEyMTRkN2Y5ZGFmMjE0YmU3NTJjM2I0ZDMiCi0t
IAoyLjM5LjIKCg==

--===============8817542933229761199==--


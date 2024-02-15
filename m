Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDFBC54793
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20187.1708018347444879224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EkaAj7ov;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g1py5vnv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd3a9d9-a603c6d0-14eb-48e9-a3d2-fe2b4e987aea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=avweamBDs72uhcofam0FSnDV74RdFSi8luYfIA1jDZY=;
	b=EkaAj7ovZBvRrnT/mYtfiml0UmcmZJXKNIEL5xeyP0GvphvoDmfSCFSJ9Pmesb6I
	9l0hXxNP4o6dp1kmzJU/GD5syV5wNlas+wBaIRg50S5wKuadzvKiO4eJuX+dL/acTbN
	edrbeYssPx5ALdi5V9lEyt+3bUWcbQeKlop2lqaY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=avweamBDs72uhcofam0FSnDV74RdFSi8luYfIA1jDZY=;
	b=g1py5vnveaA3UYghHGY4d5ibGnLP0u/teFizlT3vCbZw+4eaesIEu0LopcGstrJ1
	/LQupGhIKX8AyZfrLbcyD7tvN3HYinJQRUMtXQIgsVlqmIXMNUofx9MnZaQs7aclMr2
	7UhhvKqoxZshTcckVOaybKlszQ01GpnrPwBxufmk=
Content-Type: multipart/mixed; boundary="===============1675461249808850412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xkbcomp: upgrading to 1.4.7 SUCCEEDED
Message-ID: <0101018dadd3a9d9-a603c6d0-14eb-48e9-a3d2-fe2b4e987aea-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195662

--===============1675461249808850412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xkbcomp* to *1.4.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkbcomp-upgrade-1.4.6-1.4.7.patch
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
From bc3e08fb71000586d950dd15549ca5e64ec12dbe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:14:22 +0000
Subject: [PATCH] xkbcomp: upgrade 1.4.6 -> 1.4.7

---
 .../xorg-app/{xkbcomp_1.4.6.bb => xkbcomp_1.4.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.6.bb => xkbcomp_1.4.7.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
index 44f462f523..f259f33dd8 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
@@ -16,4 +16,4 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--disable-selective-werror"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "fa50d611ef41e034487af7bd8d8c718df53dd18002f591cca16b0384afc58e98"
+SRC_URI[sha256sum] = "0a288114e5f44e31987042c79aecff1ffad53a8154b8ec971c24a69a80f81f77"
-- 
2.42.0


--===============1675461249808850412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xkbcomp: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp: SRC_URI changed from "https://www.x.org/releases//individual/app/xkbcomp-1.4.6.tar.xz" to "https://www.x.org/releases//individual/app/xkbcomp-1.4.7.tar.xz"
packages/core2-64-poky-linux/xkbcomp: PKGV changed from 1.4.6 [default] to 1.4.7 [default]
packages/core2-64-poky-linux/xkbcomp/xkbcomp-dbg: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp/xkbcomp-dbg: PKGSIZE changed from 572512 to 564176 (-1%)
packages/core2-64-poky-linux/xkbcomp/xkbcomp-dbg: PKGV changed from 1.4.6 [default] to 1.4.7 [default]
packages/core2-64-poky-linux/xkbcomp/xkbcomp-dev: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp/xkbcomp-dev: PKGV changed from 1.4.6 [default] to 1.4.7 [default]
packages/core2-64-poky-linux/xkbcomp/xkbcomp-doc: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp/xkbcomp-doc: PKGV changed from 1.4.6 [default] to 1.4.7 [default]
packages/core2-64-poky-linux/xkbcomp/xkbcomp-locale: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp/xkbcomp-locale: PKGV changed from 1.4.6 [default] to 1.4.7 [default]
packages/core2-64-poky-linux/xkbcomp/xkbcomp-src: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp/xkbcomp-src: PKGSIZE changed from 702720 to 709044 (+1%)
packages/core2-64-poky-linux/xkbcomp/xkbcomp-src: PKGV changed from 1.4.6 [default] to 1.4.7 [default]
packages/core2-64-poky-linux/xkbcomp/xkbcomp-staticdev: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp/xkbcomp-staticdev: PKGV changed from 1.4.6 [default] to 1.4.7 [default]
packages/core2-64-poky-linux/xkbcomp/xkbcomp: PV changed from "1.4.6" to "1.4.7"
packages/core2-64-poky-linux/xkbcomp/xkbcomp: PKGSIZE changed from 216904 to 212800 (-2%)
packages/core2-64-poky-linux/xkbcomp/xkbcomp: PKGV changed from 1.4.6 [default] to 1.4.7 [default]

--===============1675461249808850412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xkbcomp-upgrade-1.4.6-1.4.7.patch"

RnJvbSBiYzNlMDhmYjcxMDAwNTg2ZDk1MGRkMTU1NDljYTVlNjRlYzEyZGJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6MTQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
a2Jjb21wOiB1cGdyYWRlIDEuNC42IC0+IDEuNC43CgotLS0KIC4uLi94b3JnLWFwcC97eGtiY29t
cF8xLjQuNi5iYiA9PiB4a2Jjb21wXzEuNC43LmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC97eGtiY29tcF8xLjQuNi5iYiA9PiB4a2Jjb21wXzEuNC43
LmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94
a2Jjb21wXzEuNC42LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hrYmNvbXBf
MS40LjcuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctYXBwL3hrYmNvbXBfMS40LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWFwcC94a2Jjb21wXzEuNC43LmJiCmluZGV4IDQ0ZjQ2MmY1MjMuLmYyNTlm
MzNkZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94a2Jjb21w
XzEuNC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94a2Jjb21wXzEu
NC43LmJiCkBAIC0xNiw0ICsxNiw0IEBAIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgogRVhUUkFf
T0VDT05GICs9ICItLWRpc2FibGUtc2VsZWN0aXZlLXdlcnJvciIKIAogU1JDX1VSSV9FWFQgPSAi
eHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE1MGQ2MTFlZjQxZTAzNDQ4N2FmN2JkOGQ4Yzcx
OGRmNTNkZDE4MDAyZjU5MWNjYTE2YjAzODRhZmM1OGU5OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIwYTI4ODExNGU1ZjQ0ZTMxOTg3MDQyYzc5YWVjZmYxZmZhZDUzYTgxNTRiOGVjOTcxYzI0YTY5
YTgwZjgxZjc3IgotLSAKMi40Mi4wCgo=

--===============1675461249808850412==--


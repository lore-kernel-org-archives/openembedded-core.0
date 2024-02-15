Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C97C54E55
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20157.1708018344555640532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Nc+em0JX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HcwdFcNk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd3aa35-7e5f6243-e122-4411-9fb2-98187db7823c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=EzeQBbyA94Yq7KVo1i1ehMXFOZBaNjiukVXa8J8NxsE=;
	b=Nc+em0JXH4PXJP0M/IBzDdbytGLYfPrvHwh4RwlFWPCRIRTCZ0lgXV6YPt4uDh5s
	vh120iFwZa9fuJ8nFKFHSF4JfTftMJX0vNx9Z2SBiX0YImskjmGHsQx8B3a6cEzAIVF
	6IHVYRm4n14mkhPIDDqdfiKSE9Wm+qPKZwHOFcmc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=EzeQBbyA94Yq7KVo1i1ehMXFOZBaNjiukVXa8J8NxsE=;
	b=HcwdFcNkbLZ4fyRRfv4voOAlT56QlZkYYku6/2kHOkC72r+Mb7qjTYxQWN009gdY
	AHZKJK4oKeal+luLfooUNbIH3VyGJzmV6DE2PZaua56RONa/Yx9LImCy8eOwfmF+mIk
	gEYcew6TeJeyrGey0zI1w5xgM/svTNSnJYsDESdk=
Content-Type: multipart/mixed; boundary="===============1950840626771247306=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxext: upgrading to 1.3.6 SUCCEEDED
Message-ID: <0101018dadd3aa35-7e5f6243-e122-4411-9fb2-98187db7823c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195650

--===============1950840626771247306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxext* to *1.3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxext-upgrade-1.3.5-1.3.6.patch
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
From 09370674ea3c75e4afc72ab91495d3276e43b5fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:20:55 +0000
Subject: [PATCH] libxext: upgrade 1.3.5 -> 1.3.6

---
 .../xorg-lib/{libxext_1.3.5.bb => libxext_1.3.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.5.bb => libxext_1.3.6.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
index 7d0597ef1d..275926a885 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
@@ -21,4 +21,4 @@ PE = "1"
 XORG_PN = "libXext"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca"
+SRC_URI[sha256sum] = "edb59fa23994e405fdc5b400afdf5820ae6160b94f35e3dc3da4457a16e89753"
-- 
2.42.0


--===============1950840626771247306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxext-upgrade-1.3.5-1.3.6.patch"

RnJvbSAwOTM3MDY3NGVhM2M3NWU0YWZjNzJhYjkxNDk1ZDMyNzZlNDNiNWZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6MjA6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4ZXh0OiB1cGdyYWRlIDEuMy41IC0+IDEuMy42CgotLS0KIC4uLi94b3JnLWxpYi97bGlieGV4
dF8xLjMuNS5iYiA9PiBsaWJ4ZXh0XzEuMy42LmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieGV4dF8xLjMuNS5iYiA9PiBsaWJ4ZXh0XzEuMy42
LmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4ZXh0XzEuMy41LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhleHRf
MS4zLjYuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL2xpYnhleHRfMS4zLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4ZXh0XzEuMy42LmJiCmluZGV4IDdkMDU5N2VmMWQuLjI3NTky
NmE4ODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4ZXh0
XzEuMy41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4ZXh0XzEu
My42LmJiCkBAIC0yMSw0ICsyMSw0IEBAIFBFID0gIjEiCiBYT1JHX1BOID0gImxpYlhleHQiCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJkYjE0YzBjODk1YzU3ZWEzM2E4NTU5ZGU4Y2IyYjkzZGM3NmM0MmVhNGEzOWUyOTRkMTc1OTM4
YTEzM2Q3YmNhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVkYjU5ZmEyMzk5NGU0MDVmZGM1YjQw
MGFmZGY1ODIwYWU2MTYwYjk0ZjM1ZTNkYzNkYTQ0NTdhMTZlODk3NTMiCi0tIAoyLjQyLjAKCg==

--===============1950840626771247306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxext: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext: PV changed from "1.3.5" to "1.3.6"
packages/core2-64-poky-linux/libxext: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXext-1.3.5.tar.xz" to "https://www.x.org/releases//individual/lib/libXext-1.3.6.tar.xz"
packages/core2-64-poky-linux/libxext/libxext-dbg: PKGSIZE changed from 545592 to 545304 (-0%)
packages/core2-64-poky-linux/libxext/libxext-dbg: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext/libxext-dbg: PV changed from "1.3.5" to "1.3.6"
packages/core2-64-poky-linux/libxext/libxext-dev: PKGSIZE changed from 55350 to 55438 (+0%)
packages/core2-64-poky-linux/libxext/libxext-dev: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext/libxext-dev: PV changed from "1.3.5" to "1.3.6"
packages/core2-64-poky-linux/libxext/libxext-doc: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext/libxext-doc: PV changed from "1.3.5" to "1.3.6"
packages/core2-64-poky-linux/libxext/libxext-locale: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext/libxext-locale: PV changed from "1.3.5" to "1.3.6"
packages/core2-64-poky-linux/libxext/libxext-src: PKGSIZE changed from 240214 to 240335 (+0%)
packages/core2-64-poky-linux/libxext/libxext-src: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext/libxext-src: PV changed from "1.3.5" to "1.3.6"
packages/core2-64-poky-linux/libxext/libxext-staticdev: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext/libxext-staticdev: PV changed from "1.3.5" to "1.3.6"
packages/core2-64-poky-linux/libxext/libxext: PKGV changed from 1.3.5 [default] to 1.3.6 [default]
packages/core2-64-poky-linux/libxext/libxext: PV changed from "1.3.5" to "1.3.6"

--===============1950840626771247306==--


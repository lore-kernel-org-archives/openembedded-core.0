Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2951FC54E5A
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20330.1708018344937596863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YX+pZzMy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Eu/JFaO2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd3aa8e-f5613ab3-b883-4137-9b4c-d967360ee574-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tzW879Z7HO9tJ4Z6aPOK4JWbrVbk6QS1DyI93kKWt9Q=;
	b=YX+pZzMyj87jcf0N6pUIFWx8719nMMnjbNLcAx8ZwCV6wW6rrOlA5d1WlfmP8gW8
	y7bkiXLdrxgEtoLC5NkbJPPaPqFw1VQ2fVneiEzX5Y/P+/RjdUBP3ccXdTZupYuoXvq
	dOoVTaRearmjE5nmAq6abwXY0QPFcwyRD4tLH0zI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tzW879Z7HO9tJ4Z6aPOK4JWbrVbk6QS1DyI93kKWt9Q=;
	b=Eu/JFaO2IqWj0Bkhn+5piKpl3jwjcFjjUliIuBoZoQXEPVqFTZK+Fn7s05fnzlXw
	2OvtsoUugnJ77Z/hPFNzvdCMX42XzPqiNbN+dG2liOheAllcVgXGYoPdDt1L+FqQktA
	CqfI+nJlEKNKnb/G5Puj3ACqDhT05wJ+daJBeBYU=
Content-Type: multipart/mixed; boundary="===============6220258619200754608=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedepend: upgrading to 1.0.9 SUCCEEDED
Message-ID: <0101018dadd3aa8e-f5613ab3-b883-4137-9b4c-d967360ee574-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195645

--===============6220258619200754608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *makedepend* to *1.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-makedepend-upgrade-1.0.8-1.0.9.patch
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
From 843fdc2033a3189d72dd7672b5819c6283ae3ff0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:30:27 +0000
Subject: [PATCH] makedepend: upgrade 1.0.8 -> 1.0.9

---
 .../xorg-util/{makedepend_1.0.8.bb => makedepend_1.0.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.8.bb => makedepend_1.0.9.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
index ad769de205..6db7d04079 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
@@ -17,4 +17,4 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[sha256sum] = "275f0d2b196bfdc740aab9f02bb48cb7a97e4dfea011a7b468ed5648d0019e54"
+SRC_URI[sha256sum] = "bc94ffda6cd4671603a69c39dbe8f96b317707b9185b2aaa3b54b5d134b41884"
-- 
2.42.0


--===============6220258619200754608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/makedepend: SRC_URI changed from "https://www.x.org/releases//individual/util/makedepend-1.0.8.tar.gz" to "https://www.x.org/releases//individual/util/makedepend-1.0.9.tar.gz"
packages/core2-64-poky-linux/makedepend: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend: PV changed from "1.0.8" to "1.0.9"
packages/core2-64-poky-linux/makedepend/makedepend-dbg: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend/makedepend-dbg: PV changed from "1.0.8" to "1.0.9"
packages/core2-64-poky-linux/makedepend/makedepend-dbg: PKGSIZE changed from 91528 to 93472 (+2%)
packages/core2-64-poky-linux/makedepend/makedepend-dev: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend/makedepend-dev: PV changed from "1.0.8" to "1.0.9"
packages/core2-64-poky-linux/makedepend/makedepend-doc: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend/makedepend-doc: PV changed from "1.0.8" to "1.0.9"
packages/core2-64-poky-linux/makedepend/makedepend-locale: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend/makedepend-locale: PV changed from "1.0.8" to "1.0.9"
packages/core2-64-poky-linux/makedepend/makedepend-src: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend/makedepend-src: PV changed from "1.0.8" to "1.0.9"
packages/core2-64-poky-linux/makedepend/makedepend-src: PKGSIZE changed from 80831 to 94763 (+17%)
packages/core2-64-poky-linux/makedepend/makedepend-staticdev: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend/makedepend-staticdev: PV changed from "1.0.8" to "1.0.9"
packages/core2-64-poky-linux/makedepend/makedepend: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/core2-64-poky-linux/makedepend/makedepend: PV changed from "1.0.8" to "1.0.9"

--===============6220258619200754608==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-makedepend-upgrade-1.0.8-1.0.9.patch"

RnJvbSA4NDNmZGMyMDMzYTMxODlkNzJkZDc2NzJiNTgxOWM2MjgzYWUzZmYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6MzA6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YWtlZGVwZW5kOiB1cGdyYWRlIDEuMC44IC0+IDEuMC45CgotLS0KIC4uLi94b3JnLXV0aWwve21h
a2VkZXBlbmRfMS4wLjguYmIgPT4gbWFrZWRlcGVuZF8xLjAuOS5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXV0aWwve21ha2VkZXBlbmRfMS4wLjguYmIgPT4gbWFrZWRl
cGVuZF8xLjAuOS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjguYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy11dGlsL21ha2VkZXBlbmRfMS4wLjkuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctdXRpbC9tYWtlZGVwZW5kXzEuMC44LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjku
YmIKaW5kZXggYWQ3NjlkZTIwNS4uNmRiN2QwNDA3OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctdXRpbC9tYWtlZGVwZW5kXzEuMC44LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXV0aWwvbWFrZWRlcGVuZF8xLjAuOS5iYgpAQCAtMTcsNCArMTcsNCBA
QCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9NDNhNmVkYTM0YjQ4ZWU4MjFiM2I2NmY0Zjc1M2NlNGYiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIyNzVmMGQyYjE5NmJmZGM3NDBhYWI5ZjAyYmI0OGNiN2E5N2U0ZGZlYTAx
MWE3YjQ2OGVkNTY0OGQwMDE5ZTU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJjOTRmZmRhNmNk
NDY3MTYwM2E2OWMzOWRiZThmOTZiMzE3NzA3YjkxODViMmFhYTNiNTRiNWQxMzRiNDE4ODQiCi0t
IAoyLjQyLjAKCg==

--===============6220258619200754608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/makedepend/makedepend-src: PKGSIZE changed from 80831 to 94763 (+17%)

--===============6220258619200754608==--


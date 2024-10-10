Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85213D1A45A
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.53260.1728588944661100897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SiVg+hCJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=spbISs4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019277eec7ed-414e4724-5a55-47ae-aec4-4511f46ec264-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0SIrsfvbpf9mljtHudV60ksjBf9Gk5lCORveKzddK6A=;
	b=SiVg+hCJ3+9x8vvdhbi5lUp8JcrW9GRGkwxiDwplvN0SUs3RF3F8KXT6Ef37I7WY
	/H2SSQ7/SbE7u9/UyByBXeRdbkw5vTYpDemthNRZUSClsIbbWdRNOwe2lwz2l4KFSwJ
	d1wkPlyzsAk3ihY18eO3YaCjguyd7W4xzdYgpEhg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0SIrsfvbpf9mljtHudV60ksjBf9Gk5lCORveKzddK6A=;
	b=spbISs4jlGcTYMJmwLq6SkI1gnuR+qEb7dzgFyxBKIXoMcyjUP1UONWeNU7NeR7i
	FnFjzS4Wv6mzH4YPaoJr2tnZUrs27UwJxGrvG+JF08ysQv7HShCFU1h61ksutYzxtAD
	K6vlO0rcSUVir8kjSRUoCNFwhXXiYra37HB3i/CY=
Content-Type: multipart/mixed; boundary="===============0380415061852687340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.3 SUCCEEDED
Message-ID: <0101019277eec7ed-414e4724-5a55-47ae-aec4-4511f46ec264-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205591

--===============0380415061852687340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.2-24.1.3.patch
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
From 93fd8b633007d31a5eb3e35ca29eed519bad7100 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:47:37 +0000
Subject: [PATCH] xwayland: upgrade 24.1.2 -> 24.1.3

---
 .../xwayland/{xwayland_24.1.2.bb => xwayland_24.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.2.bb => xwayland_24.1.3.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
index a3ece64348..7e817a7241 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "141eb76e7e422a3661c08782c70be40931084755042c04506e0d97dd463ef7d2"
+SRC_URI[sha256sum] = "dcdb57a66cc9b124c8f936760592628ac4e744a7d7b3179aa86189ad7ea4cb10"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.44.1


--===============0380415061852687340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.2.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.3.tar.xz"
packages/core2-64-poky-linux/xwayland: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland: PKGV changed from 24.1.2 [default] to 24.1.3 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 11874224 to 11875944 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.2 [default] to 24.1.3 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.2 [default] to 24.1.3 [default]
packages/core2-64-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.2 [default] to 24.1.3 [default]
packages/core2-64-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.2 [default] to 24.1.3 [default]
packages/core2-64-poky-linux/xwayland/xwayland-src: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8885524 to 8887475 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.2 [default] to 24.1.3 [default]
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.2 [default] to 24.1.3 [default]
packages/core2-64-poky-linux/xwayland/xwayland: PV changed from "24.1.2" to "24.1.3"
packages/core2-64-poky-linux/xwayland/xwayland: PKGV changed from 24.1.2 [default] to 24.1.3 [default]

--===============0380415061852687340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.2-24.1.3.patch"

RnJvbSA5M2ZkOGI2MzMwMDdkMzFhNWViM2UzNWNhMjllZWQ1MTliYWQ3MTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6NDc6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyNC4xLjIgLT4gMjQuMS4zCgotLS0KIC4uLi94d2F5bGFuZC97eHdh
eWxhbmRfMjQuMS4yLmJiID0+IHh3YXlsYW5kXzI0LjEuMy5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjQuMS4yLmJiID0+IHh3YXlsYW5k
XzI0LjEuMy5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5k
L3h3YXlsYW5kXzI0LjEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4zLmJiCmluZGV4IGEz
ZWNlNjQzNDguLjdlODE3YTcyNDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yNC4xLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzI0LjEuMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVkZjg3OTUwYWY1MWFj
MmM1ODIyMDk0NTUzZWExODgwIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hp
dmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIxNDFlYjc2ZTdlNDIyYTM2NjFjMDg3ODJjNzBiZTQwOTMxMDg0NzU1MDQyYzA0
NTA2ZTBkOTdkZDQ2M2VmN2QyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjZGI1N2E2NmNjOWIx
MjRjOGY5MzY3NjA1OTI2MjhhYzRlNzQ0YTdkN2IzMTc5YWE4NjE4OWFkN2VhNGNiMTAiCiAKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQr
KSspXC50YXIiCiAKLS0gCjIuNDQuMQoK

--===============0380415061852687340==--


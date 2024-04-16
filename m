Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E918C3DA58
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.13467.1713248050761227067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PY8jpwmM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=W3y7TXNi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a9c68-78317ee2-9aa0-48fd-9a9f-b386f6854d60-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=PjoSHnZ/xnWgeI4bHa8mejUe0IAwzrQooAON7eEo/Ec=;
	b=PY8jpwmM4q5xxPkV9nJ1oMS0MT5Jo7nq0403xaENCl2hJpym/Q9GEgZc9Rxi58UD
	mW5Rpod1rF1eme94w7EG4pEwLcti7X9U5FdWUQYcMgBsyfOTY8qQ/+2NdeV4K7uh4vS
	dm7HdCrkgqDRtcAHKhAHU8KJUVYib5VEoCIdapT8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=PjoSHnZ/xnWgeI4bHa8mejUe0IAwzrQooAON7eEo/Ec=;
	b=W3y7TXNikoJcclgNaFNys4WFLZKarRyp8ORYk44rQKF5vuZPLSSMnFFxVHJmAvKO
	T0D4okZ498ZtnsW2pTUcArHJ6mYs+MJHL6zcUwIB5JcA7/0XXggCr1TZYTx6bjPgOA+
	UaGoaaL3LWPFNZddzurwq07yh03vQfPSJopO/Yiw=
Content-Type: multipart/mixed; boundary="===============1171951715337608252=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 23.2.6 SUCCEEDED
Message-ID: <0101018ee58a9c68-78317ee2-9aa0-48fd-9a9f-b386f6854d60-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198379

--===============1171951715337608252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *23.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-23.2.5-23.2.6.patch
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
From 5b0404b2265a0aa8f928bb395a7d34f21da15380 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:57:19 +0000
Subject: [PATCH] xwayland: upgrade 23.2.5 -> 23.2.6

---
 .../xwayland/{xwayland_23.2.5.bb => xwayland_23.2.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.5.bb => xwayland_23.2.6.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
index b934a873d1..25c9c274c0 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
+SRC_URI[sha256sum] = "1c9a366b4e7ccadba0f9bd313c59eae12d23bd72543b22a26eaf8b20835cfc6d"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.42.0


--===============1171951715337608252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xwayland: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland: PKGV changed from 23.2.5 [default] to 23.2.6 [default]
packages/core2-64-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-23.2.5.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-23.2.6.tar.xz"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGV changed from 23.2.5 [default] to 23.2.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 11681392 to 11681256 (-0%)
packages/core2-64-poky-linux/xwayland/xwayland-dev: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGV changed from 23.2.5 [default] to 23.2.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-doc: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland/xwayland-doc: PKGV changed from 23.2.5 [default] to 23.2.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-locale: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland/xwayland-locale: PKGV changed from 23.2.5 [default] to 23.2.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-src: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGV changed from 23.2.5 [default] to 23.2.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8760288 to 8760188 (-0%)
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 23.2.5 [default] to 23.2.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland: PV changed from "23.2.5" to "23.2.6"
packages/core2-64-poky-linux/xwayland/xwayland: PKGV changed from 23.2.5 [default] to 23.2.6 [default]

--===============1171951715337608252==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-23.2.5-23.2.6.patch"

RnJvbSA1YjA0MDRiMjI2NWEwYWE4ZjkyOGJiMzk1YTdkMzRmMjFkYTE1MzgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6NTc6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyMy4yLjUgLT4gMjMuMi42CgotLS0KIC4uLi94d2F5bGFuZC97eHdh
eWxhbmRfMjMuMi41LmJiID0+IHh3YXlsYW5kXzIzLjIuNi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjMuMi41LmJiID0+IHh3YXlsYW5k
XzIzLjIuNi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjMuMi41LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5k
L3h3YXlsYW5kXzIzLjIuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjMuMi41LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjMuMi42LmJiCmluZGV4IGI5
MzRhODczZDEuLjI1YzljMjc0YzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yMy4yLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIzLjIuNi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVkZjg3OTUwYWY1MWFj
MmM1ODIyMDk0NTUzZWExODgwIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hp
dmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIzM2VjN2ZmMjY4N2E1OWZhYWE1MmI5YjA5YWE4Y2FmMTE4ZTdlY2I2YWVkODk1
M2Y1MjZhNjI1ZmY5ZjRiZDkwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjOWEzNjZiNGU3Y2Nh
ZGJhMGY5YmQzMTNjNTllYWUxMmQyM2JkNzI1NDNiMjJhMjZlYWY4YjIwODM1Y2ZjNmQiCiAKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQr
KSspXC50YXIiCiAKLS0gCjIuNDIuMAoK

--===============1171951715337608252==--


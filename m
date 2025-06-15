Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77601C83036
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8874.1749993301246768195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Bf28Z8QX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=h/DFW6CE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019773baa28e-a4840307-9b7c-473d-9e1d-67f176ace56e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O38HmDhSIaCHTh4on38IOpR+dVgxzh3YYaSS3TEa8Vo=;
	b=Bf28Z8QXjO1reaDHBVPyRluwjigltv9g9kzf3u5LuzLZ23tMkcbJ7dx0Q7QhiVaJ
	SlPkK9c6L7egflowZYyJUpLEy7POsrAtoGDdddoIt32xE3b7VtPFStYuBKlkAXzfAo5
	A49TjZ/U8E18M8HH+7bYjljUWF8xxOVUzEY68ang=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O38HmDhSIaCHTh4on38IOpR+dVgxzh3YYaSS3TEa8Vo=;
	b=h/DFW6CEEg4NFLUMddOx6L4dVnwhwJZO4xwlMznrbWXNOMED+ENuFDYtde1kDaaA
	C/EHAY+C0tmjajJe/ykp6s7xvWcj3/4FlBEzUi+ekukB0fVyKOhP+krvWaEMaGKNi9k
	sH1soNmfN3IZxMEekUfGRoTV/1F9+tOnFee2eHpw=
Content-Type: multipart/mixed; boundary="===============8153072200638145440=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pixman: upgrading to 0.46.2 SUCCEEDED
Message-ID: <0101019773baa28e-a4840307-9b7c-473d-9e1d-67f176ace56e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218727

--===============8153072200638145440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pixman* to *0.46.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pixman-upgrade-0.46.0-0.46.2.patch
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
From 1fee8f90e05730232d678c9a47bef2c1ae4cb18e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 11:58:37 +0000
Subject: [PATCH] pixman: upgrade 0.46.0 -> 0.46.2

---
 .../xorg-lib/{pixman_0.46.0.bb => pixman_0.46.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.46.0.bb => pixman_0.46.2.bb} (95%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
similarity index 95%
rename from meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
index c1c71fd420..71c7f9a98d 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
@@ -8,7 +8,7 @@ SECTION = "x11/libs"
 DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c51f1c1c7b00638050d"
+SRC_URI[sha256sum] = "3e0de5ba6e356916946a3d958192f15505dcab85134771bfeab4ce4e29bbd733"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.47.1


--===============8153072200638145440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pixman: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman: SRC_URI changed from "https://www.cairographics.org/releases/pixman-0.46.0.tar.gz" to "https://www.cairographics.org/releases/pixman-0.46.2.tar.gz"
packages/core2-64-poky-linux/pixman: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman-dbg: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman/pixman-dbg: FILELIST: removed "/usr/lib/.debug/libpixman-1.so.0.46.0", added "/usr/lib/.debug/libpixman-1.so.0.46.2"
packages/core2-64-poky-linux/pixman/pixman-dbg: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman-dbg: PKGSIZE changed from 5180472 to 5190120 (+0%)
packages/core2-64-poky-linux/pixman/pixman-dev: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman/pixman-dev: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman-dev: PKGSIZE changed from 57001 to 57399 (+1%)
packages/core2-64-poky-linux/pixman/pixman-doc: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman/pixman-doc: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman-locale: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman/pixman-locale: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman-src: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman/pixman-src: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman-staticdev: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman/pixman-staticdev: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman: PKGV changed from 0.46.0 [default] to 0.46.2 [default]
packages/core2-64-poky-linux/pixman/pixman: FILELIST: removed "/usr/lib/libpixman-1.so.0.46.0", added "/usr/lib/libpixman-1.so.0.46.2"
packages/core2-64-poky-linux/pixman/pixman: PV changed from "0.46.0" to "0.46.2"
packages/core2-64-poky-linux/pixman/pixman: PKGSIZE changed from 735325 to 739421 (+1%)
Changes to packages/core2-64-poky-linux/pixman (sysroot):
  /usr/lib/libpixman-1.so.0 changed symlink target from libpixman-1.so.0.46.0 to libpixman-1.so.0.46.2
  /usr/lib/libpixman-1.so.0.46.0 moved to /usr/lib/libpixman-1.so.0.46.2

--===============8153072200638145440==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pixman-upgrade-0.46.0-0.46.2.patch"

RnJvbSAxZmVlOGY5MGUwNTczMDIzMmQ2NzhjOWE0N2JlZjJjMWFlNGNiMThlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTE6NTg6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aXhtYW46IHVwZ3JhZGUgMC40Ni4wIC0+IDAuNDYuMgoKLS0tCiAuLi4veG9yZy1saWIve3BpeG1h
bl8wLjQ2LjAuYmIgPT4gcGl4bWFuXzAuNDYuMi5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3BpeG1hbl8wLjQ2LjAuYmIgPT4gcGl4bWFuXzAuNDYu
Mi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
cGl4bWFuXzAuNDYuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9waXhtYW5f
MC40Ni4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9waXhtYW5fMC40Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1saWIvcGl4bWFuXzAuNDYuMi5iYgppbmRleCBjMWM3MWZkNDIwLi43MWM3
ZjlhOThkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvcGl4bWFu
XzAuNDYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvcGl4bWFuXzAu
NDYuMi5iYgpAQCAtOCw3ICs4LDcgQEAgU0VDVElPTiA9ICJ4MTEvbGlicyIKIERFUEVORFMgPSAi
emxpYiIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5jYWlyb2dyYXBoaWNzLm9yZy9yZWxlYXNl
cy8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDJkOWZmN2I4NDU4ZWY2MTcz
MWMzZDM1NWY4NTRiYmY0NjFmZDBhNGQzNTYzYzUxZjFjMWM3YjAwNjM4MDUwZCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIzZTBkZTViYTZlMzU2OTE2OTQ2YTNkOTU4MTkyZjE1NTA1ZGNhYjg1MTM0
NzcxYmZlYWI0Y2U0ZTI5YmJkNzMzIgogCiAjIHNlZSBodHRwOi8vY2Fpcm9ncmFwaGljcy5vcmcv
cmVsZWFzZXMvIC0gb25seSBldmVuIG1pbm9yIHZlcnNpb25zIGFyZSBzdGFibGUKIFVQU1RSRUFN
X0NIRUNLX1JFR0VYID0gInBpeG1hbi0oP1A8cHZlcj5cZCtcLihcZCpbMDI0NjhdKSsoXC5cZCsp
KykiCi0tIAoyLjQ3LjEKCg==

--===============8153072200638145440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pixman/pixman: FILELIST: removed "/usr/lib/libpixman-1.so.0.46.0", added "/usr/lib/libpixman-1.so.0.46.2"
Changes to packages/core2-64-poky-linux/pixman (sysroot):
  /usr/lib/libpixman-1.so.0 changed symlink target from libpixman-1.so.0.46.0 to libpixman-1.so.0.46.2
  /usr/lib/libpixman-1.so.0.46.0 moved to /usr/lib/libpixman-1.so.0.46.2

--===============8153072200638145440==--


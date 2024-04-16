Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1367C3DA4C
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13465.1713248050422506311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OGqUzz6b;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nSWVmoPB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58aa009-78b243b2-1811-4e01-b530-f6403db87277-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vjx8hkjv9PIqt9XPhNCH11OFP5y9F08JgwgeI/BGMaE=;
	b=OGqUzz6b7qx1v/hKGrJxtam7QSmDRAl/8Hsj5L941OePTIkrTorMdscK6YtZwrg4
	HSZwGMDS+QdekICpNCwJZvFJrm0tMbGGfS0rfPhaU8X5dPW6C9qWyNOojKqgrRmiIkv
	EW720ytITVrHkz0VC5Wm11qInRqnZhZIgFqMzKfI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vjx8hkjv9PIqt9XPhNCH11OFP5y9F08JgwgeI/BGMaE=;
	b=nSWVmoPBRxxiRiJLmP1yBMOuAM6JRRvhB8FxD3Cd+YabUrxRCaOqW1ELXHacRWes
	ymN/uy6kbO1/UHR/qwz4/MlyWHmo1QES8ArqC1Dk+FsvJClhBT9/yR/Nwd8+wFLzQTt
	epbdQprA8Tt9opUC8pZPz/KHI5XXDaQyIuvXAs6Q=
Content-Type: multipart/mixed; boundary="===============3355803153965434222=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpng: upgrading to 1.6.43 SUCCEEDED
Message-ID: <0101018ee58aa009-78b243b2-1811-4e01-b530-f6403db87277-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198404

--===============3355803153965434222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpng* to *1.6.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.42-1.6.43.patch
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
From df908a94bcd32e65ff5d879c2c113e4ffd5cb466 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 02:06:09 +0000
Subject: [PATCH] libpng: upgrade 1.6.42 -> 1.6.43

---
 .../libpng/{libpng_1.6.42.bb => libpng_1.6.43.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.42.bb => libpng_1.6.43.bb} (93%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.43.bb
similarity index 93%
rename from meta/recipes-multimedia/libpng/libpng_1.6.42.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.43.bb
index cadbe957db..44869dce73 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.43.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
+SRC_URI[sha256sum] = "6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.42.0


--===============3355803153965434222==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.42-1.6.43.patch"

RnJvbSBkZjkwOGE5NGJjZDMyZTY1ZmY1ZDg3OWMyYzExM2U0ZmZkNWNiNDY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDI6MDY6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwbmc6IHVwZ3JhZGUgMS42LjQyIC0+IDEuNi40MwoKLS0tCiAuLi4vbGlicG5nL3tsaWJwbmdf
MS42LjQyLmJiID0+IGxpYnBuZ18xLjYuNDMuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9saWJwbmcve2xpYnBuZ18xLjYuNDIuYmIgPT4gbGlicG5nXzEuNi40
My5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcv
bGlicG5nXzEuNi40Mi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjQzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjQyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi40My5iYgppbmRleCBjYWRiZTk1N2RiLi40NDg2
OWRjZTczIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5n
XzEuNi40Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEu
Ni40My5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gInpsaWIiCiBMSUJWID0gIjE2Igog
CiBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS9wcm9qZWN0LyR7QlBOfS8ke0JQTn0k
e0xJQlZ9LyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjOTE5ZGJjMTFmNGMw
M2IwNWFiYTNmODg4NGQ4ZWI3YWRmZTM1NzJhZDIyOGFmOTcyYmI2MDA1N2JkYjQ4NDUwIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjZhNWNhMDY1MjM5MmEyZDdjOWRiMmFlNWI0MDIxMDg0M2MwYmJj
MDgxY2JkNDEwODI1YWIwMGNjNTlmMTRhNmMiCiAKIE1JUlJPUlMgKz0gIiR7U09VUkNFRk9SR0Vf
TUlSUk9SfS9wcm9qZWN0LyR7QlBOfS8ke0JQTn0ke0xJQlZ9LyAke1NPVVJDRUZPUkdFX01JUlJP
Un0vcHJvamVjdC8ke0JQTn0vJHtCUE59JHtMSUJWfS9vbGRlci1yZWxlYXNlcy8iCiAKLS0gCjIu
NDIuMAoK

--===============3355803153965434222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.41.0", added "/usr/lib/libpng16.so.16.43.0"
Changes to packages/core2-64-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so.16.41.0 moved to /usr/lib/libpng16.so.16.43.0

--===============3355803153965434222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/project/libpng/libpng16/libpng-1.6.42.tar.xz" to "https://downloads.sourceforge.net/project/libpng/libpng16/libpng-1.6.43.tar.xz"
packages/core2-64-poky-linux/libpng: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 789992 to 790432 (+0%)
packages/core2-64-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.41.0", added "/usr/lib/.debug/libpng16.so.16.43.0"
packages/core2-64-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-dbg: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-dev: PKGSIZE changed from 174169 to 174214 (+0%)
packages/core2-64-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-dev: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268658 to 268667 (+0%)
packages/core2-64-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-doc: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-locale: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-src: PKGSIZE changed from 1400483 to 1400624 (+0%)
packages/core2-64-poky-linux/libpng/libpng-src: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-src: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng-tools: PV changed from "1.6.42" to "1.6.43"
packages/core2-64-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.41.0", added "/usr/lib/libpng16.so.16.43.0"
packages/core2-64-poky-linux/libpng/libpng: PKGV changed from 1.6.42 [default] to 1.6.43 [default]
packages/core2-64-poky-linux/libpng/libpng: PV changed from "1.6.42" to "1.6.43"
Changes to packages/core2-64-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.41.0 to libpng16.so.16.43.0
  /usr/lib/libpng16.so.16.41.0 moved to /usr/lib/libpng16.so.16.43.0

--===============3355803153965434222==--


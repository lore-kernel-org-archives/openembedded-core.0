Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7F2EEE256
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.29681.1694804394224851634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XY/LXTAH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CCmEqQkK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a9a36c307-307c5f28-6453-49b6-aea0-d6f0f98bd14f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cJ9pJxvSK4w6DBCa1udHZ5Bu8nezClRM0/kuyAIGWYY=;
	b=XY/LXTAHetRond4WmY95uemc8jq46fJ538cSREGA2CJ4fcZ8N6ByZLAmuPmiXUOm
	s669I3EapuzMoMPK6B7gSyC3w6dVaKO7/YpCabSTrNvL9JxCTEiGPn7Qcklu8CRY7yr
	+Iea76WO7IrUE5kEQm8fE0oMTZS2PBwREn3/sw40=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cJ9pJxvSK4w6DBCa1udHZ5Bu8nezClRM0/kuyAIGWYY=;
	b=CCmEqQkKGbWTEmH5Fca38WQgK9/wks425NFAlXPvgyaWMqOS8sHJ6g1Y5sACf1Q4
	SDF7U/SzD1NEorZ4N//M0nOHV7mVqzKWicfxlSJ0T7wM9HncPXsqXtMu81hLDIPZvo4
	LcG3oQsyZ/quzn8+4Pvq+LtcLkp/4Dw7drMDXwhc=
Content-Type: multipart/mixed; boundary="===============0392661585223641459=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.28.3 SUCCEEDED
Message-ID: <0101018a9a36c307-307c5f28-6453-49b6-aea0-d6f0f98bd14f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187739

--===============0392661585223641459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.28.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.28.0-2.28.3.patch
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
From 5e5f2c18da3c72f1c643beaa05115acb68613114 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 15:09:44 +0000
Subject: [PATCH] libsdl2: upgrade 2.28.0 -> 2.28.3

---
 .../libsdl2/{libsdl2_2.28.0.bb => libsdl2_2.28.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.28.0.bb => libsdl2_2.28.3.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
index 1228217e8c..f866a3618f 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "d215ae4541e69d628953711496cd7b0e8b8d5c8d811d5b0f98fdc7fd1422998a"
+SRC_URI[sha256sum] = "7acb8679652701a2504d734e2ba7543ec1a83e310498ddd22fd44bf965eb5518"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.39.2


--===============0392661585223641459==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.28.0-2.28.3.patch"

RnJvbSA1ZTVmMmMxOGRhM2M3MmYxYzY0M2JlYWEwNTExNWFjYjY4NjEzMTE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTU6MDk6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZGwyOiB1cGdyYWRlIDIuMjguMCAtPiAyLjI4LjMKCi0tLQogLi4uL2xpYnNkbDIve2xpYnNk
bDJfMi4yOC4wLmJiID0+IGxpYnNkbDJfMi4yOC4zLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIve2xpYnNkbDJfMi4yOC4wLmJiID0+IGxpYnNkbDJfMi4y
OC4zLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwy
L2xpYnNkbDJfMi4yOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2Rs
Ml8yLjI4LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjI4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJfMi4yOC4zLmJiCmluZGV4IDEyMjgyMTdlOGMuLmY4
NjZhMzYxOGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNk
bDJfMi4yOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJf
Mi4yOC4zLmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5saWJzZGwu
b3JnL3JlbGVhc2UvU0RMMi0ke1BWfS50YXIuZ3oiCiAKIFMgPSAiJHtXT1JLRElSfS9TREwyLSR7
UFZ9IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDIxNWFlNDU0MWU2OWQ2Mjg5NTM3MTE0OTZj
ZDdiMGU4YjhkNWM4ZDgxMWQ1YjBmOThmZGM3ZmQxNDIyOTk4YSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3YWNiODY3OTY1MjcwMWEyNTA0ZDczNGUyYmE3NTQzZWMxYTgzZTMxMDQ5OGRkZDIyZmQ0
NGJmOTY1ZWI1NTE4IgogCiBpbmhlcml0IGNtYWtlIGxpYl9wYWNrYWdlIGJpbmNvbmZpZy1kaXNh
YmxlZCBwa2djb25maWcgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCiAKLS0gCjIuMzkuMgoK

--===============0392661585223641459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsdl2: SRC_URI changed from "http://www.libsdl.org/release/SDL2-2.28.0.tar.gz" to "http://www.libsdl.org/release/SDL2-2.28.3.tar.gz"
packages/core2-32-poky-linux/libsdl2: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 6299752 to 6322692 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.2800.0", added "/usr/lib/.debug/libSDL2-2.0.so.0.2800.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PKGSIZE changed from 2436052 to 2436927 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 10166286 to 10169900 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 9209666 to 9230400 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGV changed from 2.28.0 [default] to 2.28.3 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2: PV changed from "2.28.0" to "2.28.3"
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGSIZE changed from 2013287 to 2017383 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2800.0", added "/usr/lib/libSDL2-2.0.so.0.2800.3"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2800.0 to libSDL2-2.0.so.0.2800.3
  /usr/lib/libSDL2-2.0.so.0.2800.0 moved to /usr/lib/libSDL2-2.0.so.0.2800.3

--===============0392661585223641459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2800.0", added "/usr/lib/libSDL2-2.0.so.0.2800.3"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2800.0 to libSDL2-2.0.so.0.2800.3
  /usr/lib/libSDL2-2.0.so.0.2800.0 moved to /usr/lib/libSDL2-2.0.so.0.2800.3

--===============0392661585223641459==--


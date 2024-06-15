Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1634AC2BA2B
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18395.1718475801056921236
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Y80I82d3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bAjbNp6N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101901d23bf5c-ff3e3782-e6c6-4461-8bb9-8468151911a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+PFm/O4TJpjg9cBclfDkR7JgmECja4eosWqKFO/R+Mw=;
	b=Y80I82d3i7ixkkBolydTMUM8CKD28evRh/2/V6KnDE7ZOhN6KOOYtLuuOfRoQXzH
	qE/M/U1jXmI+4hi9v4MBLKVpDVfTJiWOuucuzFuNVo60cZupnjk7a1KEHQOvxB3Nbim
	NoKEBh0ran97IE+QoU74jUq9KXEbzlin6LaNLv40=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+PFm/O4TJpjg9cBclfDkR7JgmECja4eosWqKFO/R+Mw=;
	b=bAjbNp6NWK1t7JOnBBSggZi7LBY0iZfiikG/RFE6KXaL4bXQeLSa/wYaknmFbl8j
	358sjsNuE1LK6n2OVP3Cbkw+m/4FiUNDy3XMTNjSkE0uhEnQNVXuGENQtRC5LcfzPoN
	9GfIvjbu/uCY+nAnKoXzmHbRYvRjWf8ycl2Ks5r4=
Content-Type: multipart/mixed; boundary="===============4122060160982214814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.1 SUCCEEDED
Message-ID: <010101901d23bf5c-ff3e3782-e6c6-4461-8bb9-8468151911a8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200759

--===============4122060160982214814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.7.3-2.8.1.patch
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
From 19fa649e182839f6a500c0d4e4776c196447e6bc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 17:32:37 +0000
Subject: [PATCH] enchant2: upgrade 2.7.3 -> 2.8.1

---
 .../enchant/{enchant2_2.7.3.bb => enchant2_2.8.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.7.3.bb => enchant2_2.8.1.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.7.3.bb b/meta/recipes-support/enchant/enchant2_2.8.1.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.7.3.bb
rename to meta/recipes-support/enchant/enchant2_2.8.1.bb
index d5073b6f31..825cf2e388 100644
--- a/meta/recipes-support/enchant/enchant2_2.7.3.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fe6ad4cbe8c71b9384ffdef962be52d4d2bd5ebfb6351435bb390543d4f78b1e"
+SRC_URI[sha256sum] = "ff79de470b8eb16f53849dc49f2bce8ca4eb7decabfc1349716fe12616e52f4e"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.44.0


--===============4122060160982214814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.7.3-2.8.1.patch"

RnJvbSAxOWZhNjQ5ZTE4MjgzOWY2YTUwMGMwZDRlNDc3NmMxOTY0NDdlNmJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTc6MzI6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjcuMyAtPiAyLjguMQoKLS0tCiAuLi4vZW5jaGFudC97ZW5jaGFu
dDJfMi43LjMuYmIgPT4gZW5jaGFudDJfMi44LjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9lbmNoYW50L3tlbmNoYW50Ml8yLjcuMy5iYiA9PiBlbmNoYW50Ml8yLjgu
MS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2Vu
Y2hhbnQyXzIuNy4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8y
LjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNy4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xLmJiCmluZGV4IGQ1MDczYjZmMzEuLjgyNWNmMmUz
ODggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi43
LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjguMS5i
YgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5hdGl2ZSIKIGlu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0udGFyLmd6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImZlNmFkNGNiZThjNzFiOTM4NGZmZGVmOTYyYmU1MmQ0ZDJi
ZDVlYmZiNjM1MTQzNWJiMzkwNTQzZDRmNzhiMWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmY3
OWRlNDcwYjhlYjE2ZjUzODQ5ZGM0OWYyYmNlOGNhNGViN2RlY2FiZmMxMzQ5NzE2ZmUxMjYxNmU1
MmY0ZSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9BYmlXb3JkL2Vu
Y2hhbnQvcmVsZWFzZXMiCiAKLS0gCjIuNDQuMAoK

--===============4122060160982214814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 326576 to 364416 (+12%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 352394 to 400359 (+14%)
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.7.3", added "/usr/lib/libenchant-2.so.2.8.1"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.1
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.1
  /usr/lib/libenchant-2.so.2.7.3 moved to /usr/lib/libenchant-2.so.2.8.1

--===============4122060160982214814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 326576 to 364416 (+12%)
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.7.3", added "/usr/lib/.debug/libenchant-2.so.2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.7.3" to "2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGSIZE changed from 20827 to 20735 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.7.3" to "2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 22362 to 23346 (+4%)
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.7.3" to "2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.7.3" to "2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 352394 to 400359 (+14%)
packages/core2-64-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.7.3/providers -> /usr/src/debug/enchant2/2.8.1/providers, directory renamed /usr/src/debug/enchant2/2.7.3/src -> /usr/src/debug/enchant2/2.8.1/src, removed "/usr/src/debug/enchant2/2.7.3/lib/api.c /usr/src/debug/enchant2/2.7.3/lib/provider.c /usr/src/debug/enchant2/2.7.3/lib/broker.vala /usr/src/debug/enchant2/2.7.3/lib/enchant.h /usr/src/debug/enchant2/2.7.3/lib/gnu.vapi /usr/src/debug/enchant2/2.7.3/lib/pwl.c /usr/src/debug/enchant2/2.7.3/lib/session.c /usr/src/debug/enchant2/2.7.3/lib/util.vala /usr/src/debug/enchant2/2.7.3/lib/provider.vala /usr/src/debug/enchant2/2.7.3/lib/broker.c /usr/src/debug/enchant2/2.7.3/lib/dict.c /usr/src/debug/enchant2/2.7.3/lib/pwl.vala /usr/src/debug/enchant2/2.7.3/lib/util.c /usr/src/debug/enchant2/2.7.3/lib/dict.vala /usr/src/debug/enchant2/2.7.3/lib/session.vala /usr/src/debug/enchant2/2.7.3/lib/api.vala /usr/src/debug/enchant2/2.7.3/lib/encha
 nt-provider.h", added "/usr/src/debug/enchant2/2.8.1/lib/util.vala /usr/src/debug/enchant2/2.8.1/lib/pwl.c /usr/src/debug/enchant2/2.8.1/lib/gnu.vapi /usr/src/debug/enchant2/2.8.1/lib/dict.c /usr/src/debug/enchant2/2.8.1/lib/util.c /usr/src/debug/enchant2/2.8.1/lib/provider.vala /usr/src/debug/enchant2/2.8.1/lib/broker.c /usr/src/debug/enchant2/2.8.1/lib/api.c /usr/src/debug/enchant2/2.8.1/lib/broker.vala /usr/src/debug/enchant2/2.8.1/lib/enchant.h /usr/src/debug/enchant2/2.8.1/lib/composite.c /usr/src/debug/enchant2/2.8.1/lib/composite.vala /usr/src/debug/enchant2/2.8.1/lib/session.vala /usr/src/debug/enchant2/2.8.1/lib/pwl.vala /usr/src/debug/enchant2/2.8.1/lib/api.vala /usr/src/debug/enchant2/2.8.1/lib/enchant-provider.h /usr/src/debug/enchant2/2.8.1/lib/provider.c /usr/src/debug/enchant2/2.8.1/lib/session.c /usr/src/debug/enchant2/2.8.1/lib/dict.vala"
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.7.3" to "2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.7.3" to "2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PKGSIZE changed from 119234 to 123330 (+3%)
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.7.3", added "/usr/lib/libenchant-2.so.2.8.1"
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.7.3" to "2.8.1"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.7.3 [default] to 2.8.1 [default]
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.7.3/enchant-2.7.3.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.8.1/enchant-2.8.1.tar.gz"
packages/core2-64-poky-linux/enchant2: PV changed from "2.7.3" to "2.8.1"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.1
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.1
  /usr/lib/libenchant-2.so.2.7.3 moved to /usr/lib/libenchant-2.so.2.8.1

--===============4122060160982214814==--


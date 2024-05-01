Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17509C27C51
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1111.1714579214878288848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RjQ+Z2fj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BuOi6csT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f34e2987d-0646d37e-e006-4c7c-987d-50a567fa23c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hw2NV37lq8lyHRP8u8meRD/RtPw+OCwd/uwRCxH3mAo=;
	b=RjQ+Z2fjifKa+k/daxuupM12DOab9Kz44xqNriLhv1PQwUG3LBpce68DtewOe1N9
	+9aNUnYshK04CuYFR0Wwnfe1WERNIc37waMRPNDXLLXPOUkERoT3G3CxwfgKxH5rex8
	hracEHxXkcQBzIIu+FKUBactfu5Ac5NNBc9R4o68=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hw2NV37lq8lyHRP8u8meRD/RtPw+OCwd/uwRCxH3mAo=;
	b=BuOi6csTzEg9Aq0kAIaPZdl0ey8FLG/LYhyK4fPNEgS5nz7SJZP3B4Tu4Pq0+WdR
	HgUpq6NnVP72/O/z1QOwPJa6nTzTWwhVfTWIOAiVqGChL7mCk6ChiWNCTFiVs4n0Sne
	JqsJOSDeDpII6X2ofahdQP0o9CLBsTkKmLJ0OrGk=
Content-Type: multipart/mixed; boundary="===============7344219221731825337=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.7.2 SUCCEEDED
Message-ID: <0101018f34e2987d-0646d37e-e006-4c7c-987d-50a567fa23c0-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198860

--===============7344219221731825337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.6.9-2.7.2.patch
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
From b784949a22171ca59ce4e050942569d4fbbcfe95 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 14:42:11 +0000
Subject: [PATCH] enchant2: upgrade 2.6.9 -> 2.7.2

---
 .../enchant/{enchant2_2.6.9.bb => enchant2_2.7.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.9.bb => enchant2_2.7.2.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.9.bb b/meta/recipes-support/enchant/enchant2_2.7.2.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.9.bb
rename to meta/recipes-support/enchant/enchant2_2.7.2.bb
index aaf3525ad8..08998dd48f 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.9.bb
+++ b/meta/recipes-support/enchant/enchant2_2.7.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d9a5a10dc9b38a43b3a0fa22c76ed6ebb7e09eb535aff62954afcdbd40efff6b"
+SRC_URI[sha256sum] = "7cc3400a6657974a740b6e3c2568e2935c70e5302f07fadb2095366b75ecad6f"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.44.0


--===============7344219221731825337==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.6.9-2.7.2.patch"

RnJvbSBiNzg0OTQ5YTIyMTcxY2E1OWNlNGUwNTA5NDI1NjlkNGZiYmNmZTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxNDo0MjoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuNi45IC0+IDIuNy4yCgotLS0KIC4uLi9lbmNoYW50L3tlbmNoYW50
Ml8yLjYuOS5iYiA9PiBlbmNoYW50Ml8yLjcuMi5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuNi45LmJiID0+IGVuY2hhbnQyXzIuNy4y
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5j
aGFudDJfMi42LjkuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIu
Ny4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi42LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi43LjIuYmIKaW5kZXggYWFmMzUyNWFkOC4uMDg5OThkZDQ4
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjYu
OS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNy4yLmJi
CkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ3JvZmYtbmF0aXZlIgogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vZW5jaGFudC0ke1BWfS50YXIuZ3oiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZDlhNWExMGRjOWIzOGE0M2IzYTBmYTIyYzc2ZWQ2ZWJiN2Uw
OWViNTM1YWZmNjI5NTRhZmNkYmQ0MGVmZmY2YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3Y2Mz
NDAwYTY2NTc5NzRhNzQwYjZlM2MyNTY4ZTI5MzVjNzBlNTMwMmYwN2ZhZGIyMDk1MzY2Yjc1ZWNh
ZDZmIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL0FiaVdvcmQvZW5j
aGFudC9yZWxlYXNlcyIKIAotLSAKMi40NC4wCgo=

--===============7344219221731825337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 168456 to 331584 (+97%)
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGSIZE changed from 26668 to 20827 (-22%)
packages/core2-64-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/include/enchant-2/enchant-provider.h"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 168899 to 352494 (+109%)
packages/core2-64-poky-linux/enchant2/enchant2: PKGSIZE changed from 90410 to 119162 (+32%)
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.9", added "/usr/lib/libenchant-2.so.2.7.2"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.9 to libenchant-2.so.2.7.2
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.9 to libenchant-2.so.2.7.2
  /usr/lib/libenchant-2.so.2.6.9 moved to /usr/lib/libenchant-2.so.2.7.2
  /usr/include/enchant-2/enchant-provider.h was removed

--===============7344219221731825337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.6.9" to "2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 168456 to 331584 (+97%)
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.6.9", added "/usr/lib/.debug/libenchant-2.so.2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.6.9" to "2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGSIZE changed from 26668 to 20827 (-22%)
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/include/enchant-2/enchant-provider.h"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.6.9" to "2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.6.9" to "2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.6.9" to "2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 168899 to 352494 (+109%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.6.9/providers -> /usr/src/debug/enchant2/2.7.2/providers, removed "/usr/src/debug/enchant2/2.6.9/src/enchant-lsmod.c /usr/src/debug/enchant2/2.6.9/lib/string.h /usr/src/debug/enchant2/2.6.9/src/enchant-provider.h /usr/src/debug/enchant2/2.6.9/src/pwl.h /usr/src/debug/enchant2/2.6.9/src/enchant.h /usr/src/debug/enchant2/2.6.9/src/pwl.c /usr/src/debug/enchant2/2.6.9/src/enchant.c /usr/src/debug/enchant2/2.6.9/src/lib.c", added "/usr/src/debug/enchant2/2.7.2/src/enchant-lsmod.c /usr/src/debug/enchant2/2.7.2/lib/api.vala /usr/src/debug/enchant2/2.7.2/lib/pwl.vala /usr/src/debug/enchant2/2.7.2/lib/dict.vala /usr/src/debug/enchant2/2.7.2/lib/util.vala /usr/src/debug/enchant2/2.7.2/lib/util.c /usr/src/debug/enchant2/2.7.2/lib/broker.vala /usr/src/debug/enchant2/2.7.2/lib/gnu.vapi /usr/src/debug/enchant2/2.7.2/lib/session.vala /usr/src/debug/enchant2/2.7.2/lib/enchant.h /usr/src/debug/en
 chant2/2.7.2/lib/pwl.c /usr/src/debug/enchant2/2.7.2/lib/broker.c /usr/src/debug/enchant2/2.7.2/lib/enchant-provider.h /usr/src/debug/enchant2/2.7.2/lib/provider.vala /usr/src/debug/enchant2/2.7.2/lib/dict.c /usr/src/debug/enchant2/2.7.2/lib/api.c /usr/src/debug/enchant2/2.7.2/lib/session.c /usr/src/debug/enchant2/2.7.2/src/enchant.c /usr/src/debug/enchant2/2.7.2/lib/provider.c"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.6.9" to "2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.6.9" to "2.7.2"
packages/core2-64-poky-linux/enchant2/enchant2: PKGSIZE changed from 90410 to 119162 (+32%)
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.9", added "/usr/lib/libenchant-2.so.2.7.2"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.6.9 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.6.9/enchant-2.6.9.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.7.2/enchant-2.7.2.tar.gz"
packages/core2-64-poky-linux/enchant2: PV changed from "2.6.9" to "2.7.2"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.9 to libenchant-2.so.2.7.2
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.9 to libenchant-2.so.2.7.2
  /usr/lib/libenchant-2.so.2.6.9 moved to /usr/lib/libenchant-2.so.2.7.2
  /usr/include/enchant-2/enchant-provider.h was removed

--===============7344219221731825337==--


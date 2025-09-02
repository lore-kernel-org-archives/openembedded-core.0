Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CED4CA1018
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.89790.1756850183863308430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PC2om7SB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IrFwA0rL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101990c6e98b7-fec1aafe-cd69-4d90-bdc2-a05731af74ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mF3B3G+Kxw3SnnqdbwJOt586mFOYy4w9QegvQF8Z7Zc=;
	b=PC2om7SB4zZ1EDz4hKVoUpgm4j11SAmy6VL6L7KQIzvqZ/rwn6PK+9ZJMMoKcgiD
	jwxHI3Z8lqGJhQ9rS2pinxs/LL8UqnwlZoZdpaEoru0DLcD6TRNLy9CW0l91/N6F6hg
	PEfyiPz1ABOPjCcQVlSEcLDSKenVfzJWcg2aTGbw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mF3B3G+Kxw3SnnqdbwJOt586mFOYy4w9QegvQF8Z7Zc=;
	b=IrFwA0rLBP5nk9UpBz2F6GQ6caSzifuMka6Ax8FrwGebFJQTauCiuTAAFNflDdRu
	d+7cy3mPddYR7irQZo9oXJ+vzGVqUl7/Evt8oVTlUoyA6+QvvWzXTqyL8b7xX4reugd
	zmzLW5i0kiwXoz83x0H8GGZmLueBPGHt04iv5pQE=
Content-Type: multipart/mixed; boundary="===============2270956168623543214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 11.4.5 SUCCEEDED
Message-ID: <010101990c6e98b7-fec1aafe-cd69-4d90-bdc2-a05731af74ae-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222806

--===============2270956168623543214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *11.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-11.4.1-11.4.5.patch
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
From 9638be0bb4cf4d47f86b97981cca8f0aa410e2fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 19:53:38 +0000
Subject: [PATCH] harfbuzz: upgrade 11.4.1 -> 11.4.5

---
 .../harfbuzz/{harfbuzz_11.4.1.bb => harfbuzz_11.4.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.4.1.bb => harfbuzz_11.4.5.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
index a43d88fd89..9e0e42b717 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7aafab93115eb56cdc9a931ab7d19ff60d7f2937b599d140f17236f374e32698"
+SRC_URI[sha256sum] = "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============2270956168623543214==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-11.4.1-11.4.5.patch"

RnJvbSA5NjM4YmUwYmI0Y2Y0ZDQ3Zjg2Yjk3OTgxY2NhOGYwYWE0MTBlMmZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOTo1MzozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDExLjQuMSAtPiAxMS40LjUKCi0tLQogLi4uL2hhcmZidXp6L3toYXJm
YnV6el8xMS40LjEuYmIgPT4gaGFyZmJ1enpfMTEuNC41LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el8xMS40LjEuYmIgPT4gaGFyZmJ1enpf
MTEuNC41LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el8xMS40LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMTEuNC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMS40LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMS40LjUuYmIKaW5kZXggYTQz
ZDg4ZmQ4OS4uOWUwZTQyYjcxNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzExLjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTEuNC41LmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0v
ZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI3YWFmYWI5MzExNWViNTZjZGM5YTkzMWFiN2QxOWZmNjBkN2YyOTM3YjU5OWQxNDBmMTcyMzZm
Mzc0ZTMyNjk4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBmMDUyZWI0YWIwMWQ4YmFlOThiYTk3
MWM5NTRiZWNiMzJiZTU3ZDcyNTBmMThhZjM0M2IxZDI3ODkyZTAzZmEiCiAKIERFUEVORFMgKz0g
ImdsaWItMi4wLW5hdGl2ZSIKIAotLSAKMi40Ny4xCgo=

--===============2270956168623543214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 81908848 to 82409280 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-icu.so.0.61141.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61141.0 /usr/lib/.debug/libharfbuzz.so.0.61141.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61141.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61141.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.61145.0 /usr/lib/.debug/libharfbuzz.so.0.61145.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61145.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61145.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61145.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1803749 to 1803750 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61141.0", added "/usr/lib/libharfbuzz-icu.so.0.61145.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1046687 to 1050783 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61141.0", added "/usr/lib/libharfbuzz-subset.so.0.61145.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1225622 to 1229718 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61141.0 /usr/lib/libharfbuzz-cairo.so.0.61141.0 /usr/lib/libharfbuzz-gobject.so.0.61141.0", added "/usr/lib/libharfbuzz.so.0.61145.0 /usr/lib/libharfbuzz-gobject.so.0.61145.0 /usr/lib/libharfbuzz-cairo.so.0.61145.0"
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "11.4.1" to "11.4.5"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 11.4.1 [default] to 11.4.5 [default]
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/11.4.1/harfbuzz-11.4.1.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/11.4.5/harfbuzz-11.4.5.tar.xz"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61141.0 to libharfbuzz-cairo.so.0.61145.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61141.0 to libharfbuzz-gobject.so.0.61145.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61141.0 to libharfbuzz-icu.so.0.61145.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61141.0 to libharfbuzz.so.0.61145.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61141.0 to libharfbuzz-subset.so.0.61145.0
  /usr/lib/libharfbuzz-cairo.so.0.61141.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61145.0
  /usr/lib/libharfbuzz-gobject.so.0.61141.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61145.0
  /usr/lib/libharfbuzz-icu.so.0.61141.0 moved to /usr/lib/libharfbuzz-icu.so.0.61145.0
  /usr/lib/libharfbuzz.so.0.61141.0 moved to /usr/lib/libharfbuzz.so.0.61145.0
  /usr/lib/libharfbuzz-subset.so.0.61141.0 moved to /usr/lib/libharfbuzz-subset.so.0.61145.0

--===============2270956168623543214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61141.0", added "/usr/lib/libharfbuzz-icu.so.0.61145.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61141.0", added "/usr/lib/libharfbuzz-subset.so.0.61145.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61141.0 /usr/lib/libharfbuzz-gobject.so.0.61141.0 /usr/lib/libharfbuzz.so.0.61141.0", added "/usr/lib/libharfbuzz-gobject.so.0.61145.0 /usr/lib/libharfbuzz-cairo.so.0.61145.0 /usr/lib/libharfbuzz.so.0.61145.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61141.0 to libharfbuzz-cairo.so.0.61145.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61141.0 to libharfbuzz-gobject.so.0.61145.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61141.0 to libharfbuzz-icu.so.0.61145.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61141.0 to libharfbuzz.so.0.61145.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61141.0 to libharfbuzz-subset.so.0.61145.0
  /usr/lib/libharfbuzz-cairo.so.0.61141.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61145.0
  /usr/lib/libharfbuzz-gobject.so.0.61141.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61145.0
  /usr/lib/libharfbuzz-icu.so.0.61141.0 moved to /usr/lib/libharfbuzz-icu.so.0.61145.0
  /usr/lib/libharfbuzz.so.0.61141.0 moved to /usr/lib/libharfbuzz.so.0.61145.0
  /usr/lib/libharfbuzz-subset.so.0.61141.0 moved to /usr/lib/libharfbuzz-subset.so.0.61145.0

--===============2270956168623543214==--


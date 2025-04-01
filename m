Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3FEC369A5
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18040.1743511391276820323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TU9iYJrC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AFXPhX4V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195f160c7c7-1eef00e6-f2ef-4062-9c97-6ed560c725e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/A6dTKx2N0bhmi+VSDWSmaD5RBk3mUz4/alrUHF4/b4=;
	b=TU9iYJrCl3ULPPHI1R6T/7BE0UvBZdPxxt7iU00phO6AQoIUP4LeWiS4N2toxWLZ
	Qrds5D0Kwg1Gg85FopIgiK1+mldIYWEST9frstYslkkeizhqAakkndrOb2l6p/RHCM8
	2cRfaKWuYmbsOMoiyQi3cvDnlwRSt/M+uBclQvvo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/A6dTKx2N0bhmi+VSDWSmaD5RBk3mUz4/alrUHF4/b4=;
	b=AFXPhX4VHdM8fVdvC6mAGiidvkkIoKxVfuEJtxQ0dOvle7FbFwHucHBJP4qMteMq
	zY2JmIYJVupq4bh37bdK8ScZz8i6tB5hprQv054KAxXN0tzReqrq7q8ZWeg11/vlLGd
	MBIPc2Kxc6zvoeOJRHVRIXef4/6qPl/srQ0TEcBA=
Content-Type: multipart/mixed; boundary="===============1981597969252584365=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 11.0.0 SUCCEEDED
Message-ID: <01010195f160c7c7-1eef00e6-f2ef-4062-9c97-6ed560c725e5-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214097

--===============1981597969252584365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *11.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-10.4.0-11.0.0.patch
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
From d00fa51d6393f0384b25d08ea6f27eee708a2f1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 10:59:10 +0000
Subject: [PATCH] harfbuzz: upgrade 10.4.0 -> 11.0.0

---
 .../harfbuzz/{harfbuzz_10.4.0.bb => harfbuzz_11.0.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_10.4.0.bb => harfbuzz_11.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
index b41e55d706..ea0819af2b 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "480b6d25014169300669aa1fc39fb356c142d5028324ea52b3a27648b9beaad8"
+SRC_URI[sha256sum] = "f16351bafe214725fe2c1d5b59f0d93e49905a4b247899fb90d70cff953a2b9b"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============1981597969252584365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61040.0", added "/usr/lib/libharfbuzz-icu.so.0.61100.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61040.0", added "/usr/lib/libharfbuzz-subset.so.0.61100.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61040.0 /usr/lib/libharfbuzz.so.0.61040.0 /usr/lib/libharfbuzz-cairo.so.0.61040.0", added "/usr/lib/libharfbuzz-gobject.so.0.61100.0 /usr/lib/libharfbuzz.so.0.61100.0 /usr/lib/libharfbuzz-cairo.so.0.61100.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61040.0 to libharfbuzz-cairo.so.0.61100.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61040.0 to libharfbuzz-gobject.so.0.61100.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61040.0 to libharfbuzz-icu.so.0.61100.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61040.0 to libharfbuzz.so.0.61100.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61040.0 to libharfbuzz-subset.so.0.61100.0
  /usr/lib/libharfbuzz-cairo.so.0.61040.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61100.0
  /usr/lib/libharfbuzz-gobject.so.0.61040.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61100.0
  /usr/lib/libharfbuzz-icu.so.0.61040.0 moved to /usr/lib/libharfbuzz-icu.so.0.61100.0
  /usr/lib/libharfbuzz.so.0.61040.0 moved to /usr/lib/libharfbuzz.so.0.61100.0
  /usr/lib/libharfbuzz-subset.so.0.61040.0 moved to /usr/lib/libharfbuzz-subset.so.0.61100.0

--===============1981597969252584365==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-10.4.0-11.0.0.patch"

RnJvbSBkMDBmYTUxZDYzOTNmMDM4NGIyNWQwOGVhNmYyN2VlZTcwOGEyZjFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMDo1OToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDEwLjQuMCAtPiAxMS4wLjAKCi0tLQogLi4uL2hhcmZidXp6L3toYXJm
YnV6el8xMC40LjAuYmIgPT4gaGFyZmJ1enpfMTEuMC4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el8xMC40LjAuYmIgPT4gaGFyZmJ1enpf
MTEuMC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el8xMC40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMTEuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMC40LjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMS4wLjAuYmIKaW5kZXggYjQx
ZTU1ZDcwNi4uZWEwODE5YWYyYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzEwLjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTEuMC4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0v
ZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI0ODBiNmQyNTAxNDE2OTMwMDY2OWFhMWZjMzlmYjM1NmMxNDJkNTAyODMyNGVhNTJiM2EyNzY0
OGI5YmVhYWQ4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYxNjM1MWJhZmUyMTQ3MjVmZTJjMWQ1
YjU5ZjBkOTNlNDk5MDVhNGIyNDc4OTlmYjkwZDcwY2ZmOTUzYTJiOWIiCiAKIERFUEVORFMgKz0g
ImdsaWItMi4wLW5hdGl2ZSIKIAotLSAKMi40Ny4xCgo=

--===============1981597969252584365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGSIZE changed from 281888 to 277376 (-2%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 80581200 to 82501048 (+2%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz.so.0.61040.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61040.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61040.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61040.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61040.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.61100.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61100.0 /usr/lib/.debug/libharfbuzz.so.0.61100.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61100.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61100.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1736518 to 1760835 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61040.0", added "/usr/lib/libharfbuzz-icu.so.0.61100.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4992433 to 5018212 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1525999 to 1554671 (+2%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61040.0", added "/usr/lib/libharfbuzz-subset.so.0.61100.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1701142 to 1723114 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61040.0 /usr/lib/libharfbuzz-cairo.so.0.61040.0 /usr/lib/libharfbuzz.so.0.61040.0", added "/usr/lib/libharfbuzz-gobject.so.0.61100.0 /usr/lib/libharfbuzz-cairo.so.0.61100.0 /usr/lib/libharfbuzz.so.0.61100.0"
packages/core2-64-poky-linux/harfbuzz: PV changed from "10.4.0" to "11.0.0"
packages/core2-64-poky-linux/harfbuzz: PKGV changed from 10.4.0 [default] to 11.0.0 [default]
packages/core2-64-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/10.4.0/harfbuzz-10.4.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/11.0.0/harfbuzz-11.0.0.tar.xz"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61040.0 to libharfbuzz-cairo.so.0.61100.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61040.0 to libharfbuzz-gobject.so.0.61100.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61040.0 to libharfbuzz-icu.so.0.61100.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61040.0 to libharfbuzz.so.0.61100.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61040.0 to libharfbuzz-subset.so.0.61100.0
  /usr/lib/libharfbuzz-cairo.so.0.61040.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61100.0
  /usr/lib/libharfbuzz-gobject.so.0.61040.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61100.0
  /usr/lib/libharfbuzz-icu.so.0.61040.0 moved to /usr/lib/libharfbuzz-icu.so.0.61100.0
  /usr/lib/libharfbuzz.so.0.61040.0 moved to /usr/lib/libharfbuzz.so.0.61100.0
  /usr/lib/libharfbuzz-subset.so.0.61040.0 moved to /usr/lib/libharfbuzz-subset.so.0.61100.0

--===============1981597969252584365==--


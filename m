Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B586CDB486
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.102677.1697399115408745454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KuYy+2za;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mX0xE9CA;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b34df1050-412268fb-ee26-436f-b463-f07f0e2556e8-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=16NTl4r+iDpmZqnj9EgR3Y5w8NYP+gnD1WPkz8VGF6g=;
	b=KuYy+2zaQxj49YXA9awjkL6gGLcN3KX1VBifTjLfhO8bTllcSmAKO6Ou4NQ1xJ2U
	48XvuxutMqmyvqpNWl1MgZO1GFZCTEJk5yl8y0CrJI9lfvkhIJc+cQ9/DRzaV+5JT/F
	l4IFsEa2Dz8B+iF08/gFuh8+DDg1TwvnOVFVUQIs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=16NTl4r+iDpmZqnj9EgR3Y5w8NYP+gnD1WPkz8VGF6g=;
	b=mX0xE9CAom0pVceGa3jC8C0i0UuOMPbV4qhtLW5pb6YvOBPBoquD4ws1/8D7Cawn
	s4Wbb0rVuQkbHGrfL4Ir/xIWhYHT/B4Q7gUseAmXKKJ9quKFBX43ZgZZLFt5zMYSRaw
	79w6eA63Gt/WiqU8P0Hiff75GJ8fc1Vg6m3cWvI8=
Content-Type: multipart/mixed; boundary="===============6367203864911188122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 3.0.17 SUCCEEDED
Message-ID: <0101018b34df1050-412268fb-ee26-436f-b463-f07f0e2556e8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189246

--===============6367203864911188122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libical* to *3.0.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libical-upgrade-3.0.16-3.0.17.patch
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
From b669b80db5f0e1481553794e5d5e7ff5452cd9a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 18:48:28 +0000
Subject: [PATCH] libical: upgrade 3.0.16 -> 3.0.17

---
 .../libical/{libical_3.0.16.bb => libical_3.0.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.16.bb => libical_3.0.17.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.16.bb b/meta/recipes-support/libical/libical_3.0.17.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.16.bb
rename to meta/recipes-support/libical/libical_3.0.17.bb
index 61599b20dd..b91912b048 100644
--- a/meta/recipes-support/libical/libical_3.0.16.bb
+++ b/meta/recipes-support/libical/libical_3.0.17.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "b44705dd71ca4538c86fb16248483ab4b48978524fb1da5097bd76aa2e0f0c33"
+SRC_URI[sha256sum] = "bcda9a6db6870240328752854d1ea475af9bbc6356e6771018200e475e5f781b"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.39.2


--===============6367203864911188122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalvcal.so.3.0.16 /usr/lib/libicalss.so.3.0.16 /usr/lib/libical.so.3.0.16 /usr/lib/libicalss_cxx.so.3.0.16 /usr/lib/libical_cxx.so.3.0.16 /usr/lib/libical-glib.so.3.0.16", added "/usr/lib/libicalvcal.so.3.0.17 /usr/lib/libicalss.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libical.so.3.0.17 /usr/lib/libical_cxx.so.3.0.17 /usr/lib/libical-glib.so.3.0.17"
Changes to packages/core2-32-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.16 to libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.16 to libical-glib.so.3.0.17
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.16 to libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.16 to libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.16 to libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.16 to libicalvcal.so.3.0.17
  /usr/lib/libical_cxx.so.3.0.16 moved to /usr/lib/libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3.0.16 moved to /usr/lib/libical-glib.so.3.0.17
  /usr/lib/libical.so.3.0.16 moved to /usr/lib/libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3.0.16 moved to /usr/lib/libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3.0.16 moved to /usr/lib/libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3.0.16 moved to /usr/lib/libicalvcal.so.3.0.17
Changes to packages/x86_64-linux/libical-native (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.16 to libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.16 to libical-glib.so.3.0.17
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.16 to libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.16 to libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.16 to libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.16 to libicalvcal.so.3.0.17
  /usr/lib/libical_cxx.so.3.0.16 moved to /usr/lib/libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3.0.16 moved to /usr/lib/libical-glib.so.3.0.17
  /usr/lib/libical.so.3.0.16 moved to /usr/lib/libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3.0.16 moved to /usr/lib/libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3.0.16 moved to /usr/lib/libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3.0.16 moved to /usr/lib/libicalvcal.so.3.0.17

--===============6367203864911188122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-3.0.16-3.0.17.patch"

RnJvbSBiNjY5YjgwZGI1ZjBlMTQ4MTU1Mzc5NGU1ZDVlN2ZmNTQ1MmNkOWEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTg6NDg6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpY2FsOiB1cGdyYWRlIDMuMC4xNiAtPiAzLjAuMTcKCi0tLQogLi4uL2xpYmljYWwve2xpYmlj
YWxfMy4wLjE2LmJiID0+IGxpYmljYWxfMy4wLjE3LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliaWNhbC97bGliaWNhbF8zLjAuMTYuYmIgPT4gbGliaWNhbF8zLjAu
MTcuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9s
aWJpY2FsXzMuMC4xNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF8z
LjAuMTcuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xNy5iYgppbmRleCA2MTU5OWIyMGRkLi5iOTE5MTJi
MDQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfMy4w
LjE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF8zLjAuMTcu
YmIKQEAgLTE1LDcgKzE1LDcgQEAgU0VDVElPTiA9ICJsaWJzIgogU1JDX1VSSSA9ICIke0dJVEhV
Ql9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWNtYWtlLURvLW5vdC1leHBvcnQtQ0MtaW50by1naXItY29tcGlsZXIucGF0Y2gg
XAogICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNDQ3MDVkZDcxY2E0NTM4Yzg2
ZmIxNjI0ODQ4M2FiNGI0ODk3ODUyNGZiMWRhNTA5N2JkNzZhYTJlMGYwYzMzIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImJjZGE5YTZkYjY4NzAyNDAzMjg3NTI4NTRkMWVhNDc1YWY5YmJjNjM1NmU2
NzcxMDE4MjAwZTQ3NWU1Zjc4MWIiCiAKIGluaGVyaXQgY21ha2UgcGtnY29uZmlnIGdvYmplY3Qt
aW50cm9zcGVjdGlvbiB2YWxhIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjM5LjIKCg==

--===============6367203864911188122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libical: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v3.0.16/libical-3.0.16.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch" to "https://github.com/libical/libical/releases//download/v3.0.17/libical-3.0.17.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch"
packages/core2-32-poky-linux/libical: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical-dbg: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical/libical-dbg: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical-dbg: PKGSIZE changed from 2556188 to 2604080 (+2%)
packages/core2-32-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libical.so.3.0.16 /usr/lib/.debug/libicalvcal.so.3.0.16 /usr/lib/.debug/libical_cxx.so.3.0.16 /usr/lib/.debug/libicalss_cxx.so.3.0.16 /usr/lib/.debug/libical-glib.so.3.0.16 /usr/lib/.debug/libicalss.so.3.0.16", added "/usr/lib/.debug/libical.so.3.0.17 /usr/lib/.debug/libical_cxx.so.3.0.17 /usr/lib/.debug/libicalvcal.so.3.0.17 /usr/lib/.debug/libicalss_cxx.so.3.0.17 /usr/lib/.debug/libical-glib.so.3.0.17 /usr/lib/.debug/libicalss.so.3.0.17"
packages/core2-32-poky-linux/libical/libical-dev: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical/libical-dev: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical-dev: PKGSIZE changed from 2980655 to 2984259 (+0%)
packages/core2-32-poky-linux/libical/libical-doc: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical/libical-doc: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical-locale: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical/libical-locale: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical-src: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical/libical-src: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical-src: PKGSIZE changed from 3057925 to 3062458 (+0%)
packages/core2-32-poky-linux/libical/libical-staticdev: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical/libical-staticdev: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-32-poky-linux/libical/libical: PV changed from "3.0.16" to "3.0.17"
packages/core2-32-poky-linux/libical/libical: PKGSIZE changed from 1611627 to 1611927 (+0%)
packages/core2-32-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalss.so.3.0.16 /usr/lib/libical-glib.so.3.0.16 /usr/lib/libicalss_cxx.so.3.0.16 /usr/lib/libical_cxx.so.3.0.16 /usr/lib/libical.so.3.0.16 /usr/lib/libicalvcal.so.3.0.16", added "/usr/lib/libicalss.so.3.0.17 /usr/lib/libical-glib.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libical_cxx.so.3.0.17 /usr/lib/libical.so.3.0.17 /usr/lib/libicalvcal.so.3.0.17"
Changes to packages/core2-32-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.16 to libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.16 to libical-glib.so.3.0.17
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.16 to libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.16 to libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.16 to libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.16 to libicalvcal.so.3.0.17
  /usr/lib/libical_cxx.so.3.0.16 moved to /usr/lib/libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3.0.16 moved to /usr/lib/libical-glib.so.3.0.17
  /usr/lib/libical.so.3.0.16 moved to /usr/lib/libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3.0.16 moved to /usr/lib/libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3.0.16 moved to /usr/lib/libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3.0.16 moved to /usr/lib/libicalvcal.so.3.0.17
Changes to packages/x86_64-linux/libical-native (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.16 to libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.16 to libical-glib.so.3.0.17
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.16 to libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.16 to libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.16 to libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.16 to libicalvcal.so.3.0.17
  /usr/lib/libical_cxx.so.3.0.16 moved to /usr/lib/libical_cxx.so.3.0.17
  /usr/lib/libical-glib.so.3.0.16 moved to /usr/lib/libical-glib.so.3.0.17
  /usr/lib/libical.so.3.0.16 moved to /usr/lib/libical.so.3.0.17
  /usr/lib/libicalss_cxx.so.3.0.16 moved to /usr/lib/libicalss_cxx.so.3.0.17
  /usr/lib/libicalss.so.3.0.16 moved to /usr/lib/libicalss.so.3.0.17
  /usr/lib/libicalvcal.so.3.0.16 moved to /usr/lib/libicalvcal.so.3.0.17

--===============6367203864911188122==--


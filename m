Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42D9C04E85
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8663.1698848705063740353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SXGDk/GW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hVhXNY4l;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460f4c-66d25b8c-1002-4d38-9469-c62e09d0b573-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FihshAhWU8BKUoHY+ZrlLSA+zNRt0C5QVV/2xnke38w=;
	b=SXGDk/GW3kjEaF5+yGwAYyq+LOW/khf/5JxnKnVKkMPfrpIwG8TnNrnveZC+G1F4
	ohXvwqiMjgxj241bXP1jlbt8UhSBTgqbSqnnrvf/PFMZgCoGBWgAwIvfgg76ZwAcr2u
	SZVZSDGQ9o/YtsEc8u3mkoT5UxOX+CoVw4sZqlwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FihshAhWU8BKUoHY+ZrlLSA+zNRt0C5QVV/2xnke38w=;
	b=hVhXNY4l8hcwzPLNxLyke0Mdo9WkRUGTkkX2i9v+G5rxfNckG3Dc+OHdU+P9lNqy
	A+jwWQ02skDgv/vZ92fvcr0MaBjYe4ii6N8lxw9xdxrqPf87UgvDpbbEtqjUrukRvWG
	maDYvOZc90n+csibpNaIJJD0LRGaHYkuK6jtBBF8=
Content-Type: multipart/mixed; boundary="===============4937053031875926923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 3.0.17 SUCCEEDED
Message-ID: <0101018b8b460f4c-66d25b8c-1002-4d38-9469-c62e09d0b573-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190028

--===============4937053031875926923==
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
From e74adde868b555e090e943e6e6776fea94e767da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 14:12:39 +0000
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


--===============4937053031875926923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libical: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v3.0.16/libical-3.0.16.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch" to "https://github.com/libical/libical/releases//download/v3.0.17/libical-3.0.17.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch"
packages/core2-64-poky-linux/libical: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-64-poky-linux/libical/libical-dbg: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical/libical-dbg: PKGSIZE changed from 3102560 to 3152128 (+2%)
packages/core2-64-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libicalvcal.so.3.0.16 /usr/lib/.debug/libical-glib.so.3.0.16 /usr/lib/.debug/libicalss_cxx.so.3.0.16 /usr/lib/.debug/libical_cxx.so.3.0.16 /usr/lib/.debug/libical.so.3.0.16 /usr/lib/.debug/libicalss.so.3.0.16", added "/usr/lib/.debug/libicalvcal.so.3.0.17 /usr/lib/.debug/libical-glib.so.3.0.17 /usr/lib/.debug/libicalss_cxx.so.3.0.17 /usr/lib/.debug/libical_cxx.so.3.0.17 /usr/lib/.debug/libical.so.3.0.17 /usr/lib/.debug/libicalss.so.3.0.17"
packages/core2-64-poky-linux/libical/libical-dbg: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-64-poky-linux/libical/libical-dev: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical/libical-dev: PKGSIZE changed from 2980655 to 2984259 (+0%)
packages/core2-64-poky-linux/libical/libical-dev: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-64-poky-linux/libical/libical-doc: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical/libical-doc: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-64-poky-linux/libical/libical-locale: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical/libical-locale: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-64-poky-linux/libical/libical-src: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical/libical-src: PKGSIZE changed from 3057925 to 3062458 (+0%)
packages/core2-64-poky-linux/libical/libical-src: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-64-poky-linux/libical/libical-staticdev: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical/libical-staticdev: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
packages/core2-64-poky-linux/libical/libical: PV changed from "3.0.16" to "3.0.17"
packages/core2-64-poky-linux/libical/libical: PKGSIZE changed from 1589219 to 1589519 (+0%)
packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalvcal.so.3.0.16 /usr/lib/libicalss.so.3.0.16 /usr/lib/libicalss_cxx.so.3.0.16 /usr/lib/libical.so.3.0.16 /usr/lib/libical_cxx.so.3.0.16 /usr/lib/libical-glib.so.3.0.16", added "/usr/lib/libicalvcal.so.3.0.17 /usr/lib/libicalss.so.3.0.17 /usr/lib/libical.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libical_cxx.so.3.0.17 /usr/lib/libical-glib.so.3.0.17"
packages/core2-64-poky-linux/libical/libical: PKGV changed from 3.0.16 [default] to 3.0.17 [default]
Changes to packages/core2-64-poky-linux/libical (sysroot):
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

--===============4937053031875926923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-3.0.16-3.0.17.patch"

RnJvbSBlNzRhZGRlODY4YjU1NWUwOTBlOTQzZTZlNjc3NmZlYTk0ZTc2N2RhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxNDoxMjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmljYWw6IHVwZ3JhZGUgMy4wLjE2IC0+IDMuMC4xNwoKLS0tCiAuLi4vbGliaWNhbC97bGliaWNh
bF8zLjAuMTYuYmIgPT4gbGliaWNhbF8zLjAuMTcuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJpY2FsL3tsaWJpY2FsXzMuMC4xNi5iYiA9PiBsaWJpY2FsXzMuMC4x
Ny5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xp
YmljYWxfMy4wLjE2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzMu
MC4xNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE3LmJiCmluZGV4IDYxNTk5YjIwZGQuLmI5MTkxMmIw
NDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF8zLjAu
MTYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xNy5i
YgpAQCAtMTUsNyArMTUsNyBAQCBTRUNUSU9OID0gImxpYnMiCiBTUkNfVVJJID0gIiR7R0lUSFVC
X0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtY21ha2UtRG8tbm90LWV4cG9ydC1DQy1pbnRvLWdpci1jb21waWxlci5wYXRjaCBc
CiAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI0NDcwNWRkNzFjYTQ1MzhjODZm
YjE2MjQ4NDgzYWI0YjQ4OTc4NTI0ZmIxZGE1MDk3YmQ3NmFhMmUwZjBjMzMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYmNkYTlhNmRiNjg3MDI0MDMyODc1Mjg1NGQxZWE0NzVhZjliYmM2MzU2ZTY3
NzEwMTgyMDBlNDc1ZTVmNzgxYiIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcgZ29iamVjdC1p
bnRyb3NwZWN0aW9uIHZhbGEgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuMzkuMgoK

--===============4937053031875926923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical.so.3.0.16 /usr/lib/libicalvcal.so.3.0.16 /usr/lib/libical_cxx.so.3.0.16 /usr/lib/libicalss_cxx.so.3.0.16 /usr/lib/libical-glib.so.3.0.16 /usr/lib/libicalss.so.3.0.16", added "/usr/lib/libicalvcal.so.3.0.17 /usr/lib/libical.so.3.0.17 /usr/lib/libical_cxx.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libical-glib.so.3.0.17 /usr/lib/libicalss.so.3.0.17"
Changes to packages/core2-64-poky-linux/libical (sysroot):
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

--===============4937053031875926923==--


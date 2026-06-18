Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1038FCD98DE
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 05:53:42 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13128.1781762008736868526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 22:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KSshcofa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LciKYPwP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ed94ab16a-a42940cd-4d0e-4312-9f5c-6dc72995cfb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781762011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SgAC/ocYNnrf8hO9AJ8hKoM/C99hm9HViZO0OPcoirU=;
	b=KSshcofabL55vvDy7+Kba7dH8HzjQ2ytSxwy+j8QrfSbPN6FBJvUf94leZFbE3Re
	9SZmssRi2ZbQK9jNQNrkSRqQyfRrSVeH4RM9qTvBh8zNojwSgRxuw8OYmVd/RXEE+Fv
	XxY/kbYxq4xYVobYj0Djd7ptZrB/ljkkFhLKI3TE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781762011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SgAC/ocYNnrf8hO9AJ8hKoM/C99hm9HViZO0OPcoirU=;
	b=LciKYPwPSlxIcuvw7vEx0DguJRF4VmuTi+IxX9oolpb0uNvtmXOMF8gQZXRLN913
	1YyhzJ0jeleF2Gf4ZAjQn09Q/v891JZFme2bYnDyVKyGsLaYZxK8WlelTyfA2fzOuo9
	iRQa0bND6ozWgeFXvRVHkYHkQzfj7A8xwkalGqME=
Content-Type: multipart/mixed; boundary="===============3660131302666792170=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libportal: upgrading to 0.10.0 SUCCEEDED
Message-ID: <0101019ed94ab16a-a42940cd-4d0e-4312-9f5c-6dc72995cfb5-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 05:53:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 05:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239051

--===============3660131302666792170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libportal* to *0.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libportal-upgrade-0.9.1-0.10.0.patch
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
From 390d036085dcd48eb12c1ab352c7e1529a3aaadc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 18 Jun 2026 05:53:24 +0000
Subject: [PATCH] libportal: upgrade 0.9.1 -> 0.10.0

---
 .../libportal/{libportal_0.9.1.bb => libportal_0.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.9.1.bb => libportal_0.10.0.bb} (96%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.9.1.bb b/meta/recipes-gnome/libportal/libportal_0.10.0.bb
similarity index 96%
rename from meta/recipes-gnome/libportal/libportal_0.9.1.bb
rename to meta/recipes-gnome/libportal/libportal_0.10.0.bb
index 59252e2a67..4ba56dd44f 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.10.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "8f5dc8d192f6e31dafe69e35219e3b707bde71ce"
+SRCREV = "c23024018c8eb076549a1517fcb2d7f80d3e2ed5"
 
 inherit meson gi-docgen gobject-introspection vala pkgconfig
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.1


--===============3660131302666792170==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libportal-upgrade-0.9.1-0.10.0.patch"

RnJvbSAzOTBkMDM2MDg1ZGNkNDhlYjEyYzFhYjM1MmM3ZTE1MjlhM2FhYWRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTggSnVuIDIwMjYgMDU6NTM6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwb3J0YWw6IHVwZ3JhZGUgMC45LjEgLT4gMC4xMC4wCgotLS0KIC4uLi9saWJwb3J0YWwve2xp
YnBvcnRhbF8wLjkuMS5iYiA9PiBsaWJwb3J0YWxfMC4xMC4wLmJifSAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJwb3J0YWwve2xpYnBvcnRhbF8wLjkuMS5iYiA9PiBsaWJwb3J0YWxf
MC4xMC4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0
YWwvbGlicG9ydGFsXzAuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnBvcnRhbC9saWJw
b3J0YWxfMC4xMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1nbm9tZS9saWJwb3J0YWwvbGlicG9ydGFsXzAuOS4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBvcnRhbF8wLjEwLjAuYmIKaW5kZXggNTkyNTJlMmE2
Ny4uNGJhNTZkZDQ0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnBvcnRhbC9s
aWJwb3J0YWxfMC45LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnBvcnRhbC9saWJw
b3J0YWxfMC4xMC4wLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIkxHUEwtMy4wLW9ubHki
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0zMDAwMjA4ZDUzOWVjMDYx
Yjg5OWJjZTFkOWNlOTQwNCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2ZsYXRwYWsv
JHtCUE59LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKLVNSQ1JFViA9ICI4ZjVkYzhk
MTkyZjZlMzFkYWZlNjllMzUyMTllM2I3MDdiZGU3MWNlIgorU1JDUkVWID0gImMyMzAyNDAxOGM4
ZWIwNzY1NDlhMTUxN2ZjYjJkN2Y4MGQzZTJlZDUiCiAKIGluaGVyaXQgbWVzb24gZ2ktZG9jZ2Vu
IGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIHBrZ2NvbmZpZwogR0lET0NHRU5fTUVTT05fT1BU
SU9OID0gJ2RvY3MnCi0tIAoyLjQ3LjEKCg==

--===============3660131302666792170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libportal: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-dbg: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-dbg: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-dbg: PKGSIZE changed from 737472 to 782536 (+6%)
packages/x86-64-v3-poky-linux/libportal/libportal-dev: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-dev: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-dev: PKGSIZE changed from 394863 to 432120 (+9%)
packages/x86-64-v3-poky-linux/libportal/libportal-dev: FILELIST: removed "/usr/include/libportal/glib-backports.h", added "/usr/include/libportal/clipboard.h"
packages/x86-64-v3-poky-linux/libportal/libportal-doc: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-doc: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-gtk3: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-gtk3: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-gtk4: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-gtk4: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-locale: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-locale: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-src: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-src: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-src: PKGSIZE changed from 483868 to 525595 (+9%)
packages/x86-64-v3-poky-linux/libportal/libportal-src: FILELIST: removed "/usr/src/debug/libportal/0.9.1/libportal/account.h /usr/src/debug/libportal/0.9.1/libportal/inhibit.h /usr/src/debug/libportal/0.9.1/libportal/updates.h /usr/src/debug/libportal/0.9.1/libportal/openuri.h /usr/src/debug/libportal/0.9.1/libportal/session.h /usr/src/debug/libportal/0.9.1/libportal/types.h /usr/src/debug/libportal/0.9.1/libportal/session-private.h /usr/src/debug/libportal/0.9.1/libportal/account.c /usr/src/debug/libportal/0.9.1/libportal/inhibit.c /usr/src/debug/libportal/0.9.1/libportal/openuri.c /usr/src/debug/libportal/0.9.1/libportal/session.c /usr/src/debug/libportal/0.9.1/libportal/updates.c /usr/src/debug/libportal/0.9.1/libportal/print.c /usr/src/debug/libportal/0.9.1/libportal/email.c /usr/src/debug/libportal/0.9.1/libportal/settings.c /usr/src/debug/libportal/0.9.1/libportal/portal-private.h /usr/src/debug/libportal/0.9.1/libportal/parent-private.h /usr/src/debug/libportal/0.9.1/libportal
 /email.h /usr/src/debug/libportal/0.9.1/libportal/print.h /usr/src/debug/libportal/0.9.1/libportal/settings-private.h /usr/src/debug/libportal/0.9.1/libportal/settings.h /usr/src/debug/libportal/0.9.1/libportal/screenshot.c /usr/src/debug/libportal/0.9.1/libportal/camera.c /usr/src/debug/libportal/0.9.1/libportal/parent.c /usr/src/debug/libportal/0.9.1/libportal/portal.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture-zone.h /usr/src/debug/libportal/0.9.1/libportal/remote.c /usr/src/debug/libportal/0.9.1/libportal/trash.c /usr/src/debug/libportal/0.9.1/libportal/camera.h /usr/src/debug/libportal/0.9.1/libportal/parent.h /usr/src/debug/libportal/0.9.1/libportal/remote.h /usr/src/debug/libportal/0.9.1/libportal/screenshot.h /usr/src/debug/libportal/0.9.1/libportal/inputcapture-zone.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture.c /usr/src/debug/libportal/0.9.1/libportal/dynamic-launcher.c /usr/src/debug/libportal/0.9.1/libportal/location.c /usr/src/debug/libportal/0.9.1
 /libportal/wallpaper.c /usr/src/debug/libportal/0.9.1/libportal/dynamic-launcher.h /usr/src/debug/libportal/0.9.1/libportal/inputcapture.h /usr/src/debug/libportal/0.9.1/libportal/location.h /usr/src/debug/libportal/0.9.1/libportal/portal-gtk3.c /usr/src/debug/libportal/0.9.1/libportal/portal-helpers.h /usr/src/debug/libportal/0.9.1/libportal/wallpaper.h /usr/src/debug/libportal/0.9.1/libportal/filechooser.h /usr/src/debug/libportal/0.9.1/libportal/filechooser.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture-private.h /usr/src/debug/libportal/0.9.1/libportal/inputcapture-pointerbarrier.h /usr/src/debug/libportal/0.9.1/libportal/portal-enums.h /usr/src/debug/libportal/0.9.1/libportal/inputcapture-pointerbarrier.c /usr/src/debug/libportal/0.9.1/libportal/portal-enums.c /usr/src/debug/libportal/0.9.1/libportal/spawn.h /usr/src/debug/libportal/0.9.1/libportal/notification.h /usr/src/debug/libportal/0.9.1/libportal/background.c /usr/src/debug/libportal/0.9.1/libportal/spawn.c /usr
 /src/debug/libportal/0.9.1/libportal/portal-gtk4.c /usr/src/debug/libportal/0.9.1/libportal/background.h /usr/src/debug/libportal/0.9.1/libportal/notification.c", added "/usr/src/debug/libportal/0.10.0/libportal/openuri.h /usr/src/debug/libportal/0.10.0/libportal/filechooser.h /usr/src/debug/libportal/0.10.0/libportal/openuri.c /usr/src/debug/libportal/0.10.0/libportal/filechooser.c /usr/src/debug/libportal/0.10.0/libportal/screenshot.h /usr/src/debug/libportal/0.10.0/libportal/wallpaper.h /usr/src/debug/libportal/0.10.0/libportal/clipboard.c /usr/src/debug/libportal/0.10.0/libportal/portal-gtk3.c /usr/src/debug/libportal/0.10.0/libportal/wallpaper.c /usr/src/debug/libportal/0.10.0/libportal/screenshot.c /usr/src/debug/libportal/0.10.0/libportal/settings-private.h /usr/src/debug/libportal/0.10.0/libportal/inputcapture-zone.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture-zone.h /usr/src/debug/libportal/0.10.0/libportal/parent-private.h /usr/src/debug/libportal/0.10.0/libport
 al/portal-helpers.h /usr/src/debug/libportal/0.10.0/libportal/portal-private.h /usr/src/debug/libportal/0.10.0/libportal/inputcapture-pointerbarrier.c /usr/src/debug/libportal/0.10.0/libportal/session.h /usr/src/debug/libportal/0.10.0/libportal/portal-enums.c /usr/src/debug/libportal/0.10.0/libportal/session.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture-pointerbarrier.h /usr/src/debug/libportal/0.10.0/libportal/portal-enums.h /usr/src/debug/libportal/0.10.0/libportal/inputcapture.c /usr/src/debug/libportal/0.10.0/libportal/background.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture.h /usr/src/debug/libportal/0.10.0/libportal/background.h /usr/src/debug/libportal/0.10.0/libportal/camera.h /usr/src/debug/libportal/0.10.0/libportal/parent.h /usr/src/debug/libportal/0.10.0/libportal/location.c /usr/src/debug/libportal/0.10.0/libportal/remote.h /usr/src/debug/libportal/0.10.0/libportal/settings.c /usr/src/debug/libportal/0.10.0/libportal/settings.h /usr/src/debug/libpo
 rtal/0.10.0/libportal/location.h /usr/src/debug/libportal/0.10.0/libportal/inputcapture-private.h /usr/src/debug/libportal/0.10.0/libportal/camera.c /usr/src/debug/libportal/0.10.0/libportal/parent.c /usr/src/debug/libportal/0.10.0/libportal/portal.c /usr/src/debug/libportal/0.10.0/libportal/account.c /usr/src/debug/libportal/0.10.0/libportal/inhibit.c /usr/src/debug/libportal/0.10.0/libportal/remote.c /usr/src/debug/libportal/0.10.0/libportal/email.c /usr/src/debug/libportal/0.10.0/libportal/portal-gtk4.c /usr/src/debug/libportal/0.10.0/libportal/print.c /usr/src/debug/libportal/0.10.0/libportal/account.h /usr/src/debug/libportal/0.10.0/libportal/inhibit.h /usr/src/debug/libportal/0.10.0/libportal/spawn.c /usr/src/debug/libportal/0.10.0/libportal/trash.c /usr/src/debug/libportal/0.10.0/libportal/email.h /usr/src/debug/libportal/0.10.0/libportal/print.h /usr/src/debug/libportal/0.10.0/libportal/session-private.h /usr/src/debug/libportal/0.10.0/libportal/notification.h /usr/src/debug
 /libportal/0.10.0/libportal/spawn.h /usr/src/debug/libportal/0.10.0/libportal/types.h /usr/src/debug/libportal/0.10.0/libportal/updates.c /usr/src/debug/libportal/0.10.0/libportal/dynamic-launcher.h /usr/src/debug/libportal/0.10.0/libportal/updates.h /usr/src/debug/libportal/0.10.0/libportal/notification.c /usr/src/debug/libportal/0.10.0/libportal/dynamic-launcher.c"
packages/x86-64-v3-poky-linux/libportal/libportal-staticdev: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal-staticdev: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/libportal/libportal: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal: PKGSIZE changed from 204646 to 219686 (+7%)
Changes to packages/x86-64-v3-poky-linux/libportal (sysroot):
  /usr/include/libportal/clipboard.h was added
  /usr/include/libportal/glib-backports.h was removed

--===============3660131302666792170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libportal/libportal-dev: FILELIST: removed "/usr/include/libportal/glib-backports.h", added "/usr/include/libportal/clipboard.h"
Changes to packages/x86-64-v3-poky-linux/libportal (sysroot):
  /usr/include/libportal/clipboard.h was added
  /usr/include/libportal/glib-backports.h was removed

--===============3660131302666792170==--


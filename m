Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF145C88E56
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 05:20:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20488.1789276850992752187
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 22:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EOn9/y5+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nTdpSUgA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a09936084d-f9734d57-14e4-4d83-a24d-49f9c46b4ff7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789276850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OQ92OaWZCaaO5e9EU6nDvohcWwLVNYG0UVh5kZDmtEY=;
	b=EOn9/y5++f5m4viQVXpSCGtGiFn9E0BPwKLLOjIW0CrBp7XnlG7o5vMyU8diI4Cv
	0jU3YxEpaADN4oUKomUFPVSKbmTshHronS3gJBDqqbMoQSiMBhOgI8RtI5P5XI57gfG
	Kk1CzDhF3tdTiBXDBIE6IKiuuS5o+piVz/QACw8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789276850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OQ92OaWZCaaO5e9EU6nDvohcWwLVNYG0UVh5kZDmtEY=;
	b=nTdpSUgA72xCzKxPMuf1F5+fakhSbSjN/9MlWuYrfY8SXfCjW4Xul5fTEJpCZTut
	3b+tLf8gnBtsXiv9hI0oq+nrJfCBZFBHvvLqZrikz7uLkDMM9/rXIRnoTOY/tx/u+wk
	Or2SnInSk2bBY5h24ud7JKTfEbK0KepXXBsqjkis=
Content-Type: multipart/mixed; boundary="===============0027464323792504266=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libportal: upgrading to 0.11.0 SUCCEEDED
Message-ID: <010101a09936084d-f9734d57-14e4-4d83-a24d-49f9c46b4ff7-000000@us-west-2.amazonses.com>
Date: Sun, 13 Sep 2026 05:20:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.13-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 05:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245710

--===============0027464323792504266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libportal* to *0.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libportal-upgrade-0.10.0-0.11.0.patch
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
From 3ec8a19a1ddc53dd5865f10e93d42b6195afcb03 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 13 Sep 2026 05:18:28 +0000
Subject: [PATCH] libportal: upgrade 0.10.0 -> 0.11.0

Source: NEWS

Changes in 0.11.0, 2026-09-12
=============================

Features:

- Support globalshortcuts (#226)

Bug fixes:

- Various Meson cleanups (#232)
- Document XDP_OPEN_FILE_FLAG_DIRECTORY flag separately so that since annotation lands in the introspection (#230)
- Remove erroneous CLOSED signal from inputcapture (#229)
- Add G_{BEGIN,END}_DECLS macros (#228)
- Remove CONST annotation from get_type methods (#227)
---
 .../libportal/{libportal_0.10.0.bb => libportal_0.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.10.0.bb => libportal_0.11.0.bb} (96%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.10.0.bb b/meta/recipes-gnome/libportal/libportal_0.11.0.bb
similarity index 96%
rename from meta/recipes-gnome/libportal/libportal_0.10.0.bb
rename to meta/recipes-gnome/libportal/libportal_0.11.0.bb
index 4ba56dd44f..fb2cc4c9f3 100644
--- a/meta/recipes-gnome/libportal/libportal_0.10.0.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.11.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "c23024018c8eb076549a1517fcb2d7f80d3e2ed5"
+SRCREV = "fc4d62cfe131e8494c82f597f92b2234d584c367"
 
 inherit meson gi-docgen gobject-introspection vala pkgconfig
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.1


--===============0027464323792504266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libportal: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-dbg: PKGSIZE changed from 782152 to 847216 (+8%)
packages/x86-64-v3-poky-linux/libportal/libportal-dbg: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-dbg: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-dev: FILELIST: added "/usr/include/libportal/globalshortcuts.h"
packages/x86-64-v3-poky-linux/libportal/libportal-dev: PKGSIZE changed from 432120 to 474565 (+10%)
packages/x86-64-v3-poky-linux/libportal/libportal-dev: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-dev: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-doc: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-doc: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-gtk3: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-gtk3: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-gtk4: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-gtk4: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-locale: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-locale: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-src: FILELIST: removed "/usr/src/debug/libportal/0.10.0/libportal/dynamic-launcher.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture-private.h /usr/src/debug/libportal/0.10.0/libportal/dynamic-launcher.h /usr/src/debug/libportal/0.10.0/libportal/email.c /usr/src/debug/libportal/0.10.0/libportal/notification.c /usr/src/debug/libportal/0.10.0/libportal/print.c /usr/src/debug/libportal/0.10.0/libportal/spawn.c /usr/src/debug/libportal/0.10.0/libportal/trash.c /usr/src/debug/libportal/0.10.0/libportal/notification.h /usr/src/debug/libportal/0.10.0/libportal/print.h /usr/src/debug/libportal/0.10.0/libportal/spawn.h /usr/src/debug/libportal/0.10.0/libportal/types.h /usr/src/debug/libportal/0.10.0/libportal/email.h /usr/src/debug/libportal/0.10.0/libportal/portal-gtk3.c /usr/src/debug/libportal/0.10.0/libportal/parent-private.h /usr/src/debug/libportal/0.10.0/libportal/portal-helpers.h /usr/src/debug/libportal/0.10.0/libportal/portal-
 private.h /usr/src/debug/libportal/0.10.0/libportal/updates.h /usr/src/debug/libportal/0.10.0/libportal/screenshot.h /usr/src/debug/libportal/0.10.0/libportal/inputcapture.c /usr/src/debug/libportal/0.10.0/libportal/background.h /usr/src/debug/libportal/0.10.0/libportal/screenshot.c /usr/src/debug/libportal/0.10.0/libportal/updates.c /usr/src/debug/libportal/0.10.0/libportal/background.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture.h /usr/src/debug/libportal/0.10.0/libportal/account.c /usr/src/debug/libportal/0.10.0/libportal/inhibit.c /usr/src/debug/libportal/0.10.0/libportal/portal-enums.c /usr/src/debug/libportal/0.10.0/libportal/wallpaper.h /usr/src/debug/libportal/0.10.0/libportal/account.h /usr/src/debug/libportal/0.10.0/libportal/inhibit.h /usr/src/debug/libportal/0.10.0/libportal/portal-enums.h /usr/src/debug/libportal/0.10.0/libportal/wallpaper.c /usr/src/debug/libportal/0.10.0/libportal/openuri.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture-pointerbarri
 er.h /usr/src/debug/libportal/0.10.0/libportal/location.c /usr/src/debug/libportal/0.10.0/libportal/session-private.h /usr/src/debug/libportal/0.10.0/libportal/camera.h /usr/src/debug/libportal/0.10.0/libportal/parent.h /usr/src/debug/libportal/0.10.0/libportal/remote.h /usr/src/debug/libportal/0.10.0/libportal/location.h /usr/src/debug/libportal/0.10.0/libportal/settings.h /usr/src/debug/libportal/0.10.0/libportal/inputcapture-pointerbarrier.c /usr/src/debug/libportal/0.10.0/libportal/settings.c /usr/src/debug/libportal/0.10.0/libportal/openuri.h /usr/src/debug/libportal/0.10.0/libportal/clipboard.c /usr/src/debug/libportal/0.10.0/libportal/portal-gtk4.c /usr/src/debug/libportal/0.10.0/libportal/camera.c /usr/src/debug/libportal/0.10.0/libportal/parent.c /usr/src/debug/libportal/0.10.0/libportal/portal.c /usr/src/debug/libportal/0.10.0/libportal/remote.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture-zone.c /usr/src/debug/libportal/0.10.0/libportal/inputcapture-zone.h /usr/
 src/debug/libportal/0.10.0/libportal/session.h /usr/src/debug/libportal/0.10.0/libportal/filechooser.c /usr/src/debug/libportal/0.10.0/libportal/settings-private.h /usr/src/debug/libportal/0.10.0/libportal/filechooser.h /usr/src/debug/libportal/0.10.0/libportal/session.c", added "/usr/src/debug/libportal/0.11.0/libportal/dynamic-launcher.c /usr/src/debug/libportal/0.11.0/libportal/inputcapture-private.h /usr/src/debug/libportal/0.11.0/libportal/dynamic-launcher.h /usr/src/debug/libportal/0.11.0/libportal/email.c /usr/src/debug/libportal/0.11.0/libportal/notification.c /usr/src/debug/libportal/0.11.0/libportal/print.c /usr/src/debug/libportal/0.11.0/libportal/spawn.c /usr/src/debug/libportal/0.11.0/libportal/trash.c /usr/src/debug/libportal/0.11.0/libportal/notification.h /usr/src/debug/libportal/0.11.0/libportal/print.h /usr/src/debug/libportal/0.11.0/libportal/spawn.h /usr/src/debug/libportal/0.11.0/libportal/types.h /usr/src/debug/libportal/0.11.0/libportal/email.h /usr/src/debug/
 libportal/0.11.0/libportal/portal-gtk3.c /usr/src/debug/libportal/0.11.0/libportal/portal-private.h /usr/src/debug/libportal/0.11.0/libportal/parent-private.h /usr/src/debug/libportal/0.11.0/libportal/portal-helpers.h /usr/src/debug/libportal/0.11.0/libportal/screenshot.h /usr/src/debug/libportal/0.11.0/libportal/updates.h /usr/src/debug/libportal/0.11.0/libportal/inputcapture.c /usr/src/debug/libportal/0.11.0/libportal/background.h /usr/src/debug/libportal/0.11.0/libportal/screenshot.c /usr/src/debug/libportal/0.11.0/libportal/updates.c /usr/src/debug/libportal/0.11.0/libportal/background.c /usr/src/debug/libportal/0.11.0/libportal/inputcapture.h /usr/src/debug/libportal/0.11.0/libportal/account.c /usr/src/debug/libportal/0.11.0/libportal/inhibit.c /usr/src/debug/libportal/0.11.0/libportal/portal-enums.c /usr/src/debug/libportal/0.11.0/libportal/wallpaper.h /usr/src/debug/libportal/0.11.0/libportal/account.h /usr/src/debug/libportal/0.11.0/libportal/inhibit.h /usr/src/debug/libport
 al/0.11.0/libportal/portal-enums.h /usr/src/debug/libportal/0.11.0/libportal/wallpaper.c /usr/src/debug/libportal/0.11.0/libportal/openuri.c /usr/src/debug/libportal/0.11.0/libportal/settings.c /usr/src/debug/libportal/0.11.0/libportal/session-private.h /usr/src/debug/libportal/0.11.0/libportal/globalshortcuts.h /usr/src/debug/libportal/0.11.0/libportal/inputcapture-pointerbarrier.h /usr/src/debug/libportal/0.11.0/libportal/location.c /usr/src/debug/libportal/0.11.0/libportal/camera.h /usr/src/debug/libportal/0.11.0/libportal/parent.h /usr/src/debug/libportal/0.11.0/libportal/settings.h /usr/src/debug/libportal/0.11.0/libportal/remote.h /usr/src/debug/libportal/0.11.0/libportal/location.h /usr/src/debug/libportal/0.11.0/libportal/inputcapture-pointerbarrier.c /usr/src/debug/libportal/0.11.0/libportal/globalshortcuts.c /usr/src/debug/libportal/0.11.0/libportal/openuri.h /usr/src/debug/libportal/0.11.0/libportal/clipboard.c /usr/src/debug/libportal/0.11.0/libportal/portal-gtk4.c /usr/
 src/debug/libportal/0.11.0/libportal/camera.c /usr/src/debug/libportal/0.11.0/libportal/parent.c /usr/src/debug/libportal/0.11.0/libportal/portal.c /usr/src/debug/libportal/0.11.0/libportal/remote.c /usr/src/debug/libportal/0.11.0/libportal/inputcapture-zone.c /usr/src/debug/libportal/0.11.0/libportal/inputcapture-zone.h /usr/src/debug/libportal/0.11.0/libportal/session.h /usr/src/debug/libportal/0.11.0/libportal/filechooser.c /usr/src/debug/libportal/0.11.0/libportal/settings-private.h /usr/src/debug/libportal/0.11.0/libportal/filechooser.h /usr/src/debug/libportal/0.11.0/libportal/session.c"
packages/x86-64-v3-poky-linux/libportal/libportal-src: PKGSIZE changed from 525595 to 574692 (+9%)
packages/x86-64-v3-poky-linux/libportal/libportal-src: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-src: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal-staticdev: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal-staticdev: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/libportal/libportal: PKGSIZE changed from 219686 to 239306 (+9%)
packages/x86-64-v3-poky-linux/libportal/libportal: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/libportal/libportal: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
Changes to packages/x86-64-v3-poky-linux/libportal (sysroot):
  /usr/include/libportal/globalshortcuts.h was added

--===============0027464323792504266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libportal/libportal-dev: FILELIST: added "/usr/include/libportal/globalshortcuts.h"
Changes to packages/x86-64-v3-poky-linux/libportal (sysroot):
  /usr/include/libportal/globalshortcuts.h was added

--===============0027464323792504266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libportal-changelog.txt"

Changelog for libportal: 0.10.0 -> 0.11.0
Source: NEWS

Changes in 0.11.0, 2026-09-12
=============================

Features:

- Support globalshortcuts (#226)

Bug fixes:

- Various Meson cleanups (#232)
- Document XDP_OPEN_FILE_FLAG_DIRECTORY flag separately so that since annotation lands in the introspection (#230)
- Remove erroneous CLOSED signal from inputcapture (#229)
- Add G_{BEGIN,END}_DECLS macros (#228)
- Remove CONST annotation from get_type methods (#227)

--===============0027464323792504266==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libportal-upgrade-0.10.0-0.11.0.patch"

RnJvbSAzZWM4YTE5YTFkZGM1M2RkNTg2NWYxMGU5M2Q0MmI2MTk1YWZjYjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTMgU2VwIDIwMjYgMDU6MTg6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwb3J0YWw6IHVwZ3JhZGUgMC4xMC4wIC0+IDAuMTEuMAoKU291cmNlOiBORVdTCgpDaGFuZ2Vz
IGluIDAuMTEuMCwgMjAyNi0wOS0xMgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKRmVh
dHVyZXM6CgotIFN1cHBvcnQgZ2xvYmFsc2hvcnRjdXRzICgjMjI2KQoKQnVnIGZpeGVzOgoKLSBW
YXJpb3VzIE1lc29uIGNsZWFudXBzICgjMjMyKQotIERvY3VtZW50IFhEUF9PUEVOX0ZJTEVfRkxB
R19ESVJFQ1RPUlkgZmxhZyBzZXBhcmF0ZWx5IHNvIHRoYXQgc2luY2UgYW5ub3RhdGlvbiBsYW5k
cyBpbiB0aGUgaW50cm9zcGVjdGlvbiAoIzIzMCkKLSBSZW1vdmUgZXJyb25lb3VzIENMT1NFRCBz
aWduYWwgZnJvbSBpbnB1dGNhcHR1cmUgKCMyMjkpCi0gQWRkIEdfe0JFR0lOLEVORH1fREVDTFMg
bWFjcm9zICgjMjI4KQotIFJlbW92ZSBDT05TVCBhbm5vdGF0aW9uIGZyb20gZ2V0X3R5cGUgbWV0
aG9kcyAoIzIyNykKLS0tCiAuLi4vbGlicG9ydGFsL3tsaWJwb3J0YWxfMC4xMC4wLmJiID0+IGxp
YnBvcnRhbF8wLjExLjAuYmJ9ICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFs
L3tsaWJwb3J0YWxfMC4xMC4wLmJiID0+IGxpYnBvcnRhbF8wLjExLjAuYmJ9ICg5NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnBvcnRhbC9saWJwb3J0YWxfMC4xMC4wLmJi
IGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnBvcnRhbC9saWJwb3J0YWxfMC4xMS4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0YWwv
bGlicG9ydGFsXzAuMTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnBvcnRh
bC9saWJwb3J0YWxfMC4xMS4wLmJiCmluZGV4IDRiYTU2ZGQ0NGYuLmZiMmNjNGM5ZjMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0YWwvbGlicG9ydGFsXzAuMTAuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBvcnRhbF8wLjExLjAuYmIKQEAg
LTcsNyArNyw3IEBAIExJQ0VOU0UgPSAiTEdQTC0zLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTMwMDAyMDhkNTM5ZWMwNjFiODk5YmNlMWQ5Y2U5NDA0Igog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmxhdHBhay8ke0JQTn0uZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYWluIgotU1JDUkVWID0gImMyMzAyNDAxOGM4ZWIwNzY1NDlhMTUxN2Zj
YjJkN2Y4MGQzZTJlZDUiCitTUkNSRVYgPSAiZmM0ZDYyY2ZlMTMxZTg0OTRjODJmNTk3ZjkyYjIy
MzRkNTg0YzM2NyIKIAogaW5oZXJpdCBtZXNvbiBnaS1kb2NnZW4gZ29iamVjdC1pbnRyb3NwZWN0
aW9uIHZhbGEgcGtnY29uZmlnCiBHSURPQ0dFTl9NRVNPTl9PUFRJT04gPSAnZG9jcycKLS0gCjIu
NDcuMQoK

--===============0027464323792504266==--


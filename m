Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45C8D489AD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1483.1768526753666339127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gq8Bxk38;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=g1ZFpdw4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc468abe5-9823f628-ece4-4db8-a420-38ce41b746b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=omfT9AXcyVitF2DUhRT0vijsnx0cLa3W5z1ny0Z2QSM=;
	b=gq8Bxk38G4OtGOpQMJfEtDDwAYNyrZ4caSto2Gv42bWuYwhzokwDiamr2U7dewaz
	wJYGkNjbhvOTp9KzVAI5HSvG0P+76d/XGyVCRBs3KTr85FZbuFqXlgd8UTp+SDt6Zeo
	e3sWyS9il4fMDbtOVPtkvBAXPFcjtjiVq8HEDEjo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=omfT9AXcyVitF2DUhRT0vijsnx0cLa3W5z1ny0Z2QSM=;
	b=g1ZFpdw4ntUorHOiGo2NQoMvPM4/6lP0vPO5xhBlIdB5AH5WPl8jxI/ArYWAwppP
	U4b5o+AAb+xz7IR5xHaElECV0cMS3ejJH5YXNIPwMvWpquxRCBBPfxYr7EG4o7+sqsV
	R9Qs30n4Yk3bwWNpCGx9mASX2fX+/SCw9q7+iME8=
Content-Type: multipart/mixed; boundary="===============7513415401915619520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libnotify: upgrading to 0.8.8 SUCCEEDED
Message-ID: <0101019bc468abe5-9823f628-ece4-4db8-a420-38ce41b746b7-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229488

--===============7513415401915619520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnotify* to *0.8.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.7-0.8.8.patch
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
From cf78c56cd466372c3badc862241908286d782692 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 23:33:39 +0000
Subject: [PATCH] libnotify: upgrade 0.8.7 -> 0.8.8

---
 .../libnotify/{libnotify_0.8.7.bb => libnotify_0.8.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.7.bb => libnotify_0.8.8.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
index 1bea8ae319..c3f71dec4a 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "4be15202ec4184fce1ac15997ece5530d2be32fe9573875aeb10e3b573858748"
+SRC_URI[archive.sha256sum] = "23420ef619dc2cb5aebad613f4823a2fa41c07e5a1d05628d40f6ec4b35bfddd"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.47.1


--===============7513415401915619520==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.7-0.8.8.patch"

RnJvbSBjZjc4YzU2Y2Q0NjYzNzJjM2JhZGM4NjIyNDE5MDgyODZkNzgyNjkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjM6MzM6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJub3RpZnk6IHVwZ3JhZGUgMC44LjcgLT4gMC44LjgKCi0tLQogLi4uL2xpYm5vdGlmeS97bGli
bm90aWZ5XzAuOC43LmJiID0+IGxpYm5vdGlmeV8wLjguOC5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYm5vdGlmeS97bGlibm90aWZ5XzAuOC43LmJiID0+IGxpYm5vdGlmeV8w
LjguOC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlibm90aWZ5
L2xpYm5vdGlmeV8wLjguNy5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90
aWZ5XzAuOC44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5XzAuOC43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ25vbWUvbGlibm90aWZ5L2xpYm5vdGlmeV8wLjguOC5iYgppbmRleCAxYmVhOGFlMzE5Li5j
M2Y3MWRlYzRhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlibm90aWZ5L2xpYm5v
dGlmeV8wLjguNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlibm90aWZ5L2xpYm5vdGlm
eV8wLjguOC5iYgpAQCAtMjAsNyArMjAsNyBAQCBpbmhlcml0IGdub21lYmFzZSBnaS1kb2NnZW4g
ZmVhdHVyZXNfY2hlY2sgZ29iamVjdC1pbnRyb3NwZWN0aW9uCiAjIGRlcGVuZHMgb24gZ3RrKzMg
aWYgdGVzdHMgYXJlIGVuYWJsZWQKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAndGVzdHMnLCAnJHtHVEszRElTVFJPRkVBVFVS
RVN9JywgJycsIGQpfSIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNGJlMTUyMDJl
YzQxODRmY2UxYWMxNTk5N2VjZTU1MzBkMmJlMzJmZTk1NzM4NzVhZWIxMGUzYjU3Mzg1ODc0OCIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjIzNDIwZWY2MTlkYzJjYjVhZWJhZDYxM2Y0
ODIzYTJmYTQxYzA3ZTVhMWQwNTYyOGQ0MGY2ZWM0YjM1YmZkZGQiCiAKIEVYVFJBX09FTUVTT04g
PSAiLURtYW49ZmFsc2UiCiAKLS0gCjIuNDcuMQoK

--===============7513415401915619520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: FILELIST: added "/usr/include/libnotify/notification-hints.h"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGSIZE changed from 72549 to 89911 (+24%)
Changes to packages/x86-64-v3-poky-linux/libnotify (sysroot):
  /usr/include/libnotify/notification-hints.h was added

--===============7513415401915619520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libnotify: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify: PV changed from "0.8.7" to "0.8.8"
packages/x86-64-v3-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.7.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.8.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 170928 to 175336 (+3%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.7" to "0.8.8"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGSIZE changed from 72549 to 89911 (+24%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: FILELIST: added "/usr/include/libnotify/notification-hints.h"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.7" to "0.8.8"
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.7" to "0.8.8"
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.7" to "0.8.8"
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PKGSIZE changed from 135456 to 134278 (-1%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: FILELIST: directory renamed /usr/src/debug/libnotify/0.8.7/tools -> /usr/src/debug/libnotify/0.8.8/tools, removed "/usr/src/debug/libnotify/0.8.7/libnotify/internal.h /usr/src/debug/libnotify/0.8.7/libnotify/notify-marshal.c /usr/src/debug/libnotify/0.8.7/libnotify/launch-context.h /usr/src/debug/libnotify/0.8.7/libnotify/notification.c /usr/src/debug/libnotify/0.8.7/libnotify/launch-context.c /usr/src/debug/libnotify/0.8.7/libnotify/notify-enum-types.c /usr/src/debug/libnotify/0.8.7/libnotify/notification.h /usr/src/debug/libnotify/0.8.7/libnotify/notify.c /usr/src/debug/libnotify/0.8.7/libnotify/notify.h", added "/usr/src/debug/libnotify/0.8.8/libnotify/internal.h /usr/src/debug/libnotify/0.8.8/libnotify/launch-context.h /usr/src/debug/libnotify/0.8.8/libnotify/notification.c /usr/src/debug/libnotify/0.8.8/libnotify/launch-context.c /usr/src/debug/libnotify/0.8.8/libnotify/notify-enum-types.c /usr/src/debug/libnotify/0.8.8/libn
 otify/notification.h /usr/src/debug/libnotify/0.8.8/libnotify/notify.c /usr/src/debug/libnotify/0.8.8/libnotify/notify.h"
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PV changed from "0.8.7" to "0.8.8"
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.7" to "0.8.8"
packages/x86-64-v3-poky-linux/libnotify/libnotify: PKGSIZE changed from 83502 to 84778 (+2%)
packages/x86-64-v3-poky-linux/libnotify/libnotify: PKGV changed from 0.8.7 [default] to 0.8.8 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify: PV changed from "0.8.7" to "0.8.8"
Changes to packages/x86-64-v3-poky-linux/libnotify (sysroot):
  /usr/include/libnotify/notification-hints.h was added

--===============7513415401915619520==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB1BCDE015
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50423.1781195505087963816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qcvk9X+w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yzhFvrK0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb786b3ec-91f5aae5-8300-4d85-9255-547ea3b167b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eKyMnpXs3wPrjhrhQlrJGP67I0MbzrszcZYQLAtBE7U=;
	b=qcvk9X+wlYY3xD4EGonL4WgibRut7nE9Uq96JE/G77U7rzY+0KFmvC0bGs8IpIML
	fpLz6QIfJxk8bkR8WoX+jzbFrAYUOeap3furHPIr0yWqLJ5B3jLX5xM+++SzxOnoylU
	Ogs3Vfio7R2ca5uUjmgll//J0ydnw+ub9W6Kht24=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eKyMnpXs3wPrjhrhQlrJGP67I0MbzrszcZYQLAtBE7U=;
	b=yzhFvrK0vcKWImIA5lvULIMbhP6ob8BAQzKskTXhnOURcqYMhFg+cEDbw7B7Jsjo
	kFjZwFA4HiBRTCDNJwAPX7uti6fIo/RMbEpR+9xwDCrupxUQEje3h/PISuhhxQRKmjJ
	WjhDOzTK+lHq4qxHjpgmpFidWH/bVNtxERy1nLGg=
Content-Type: multipart/mixed; boundary="===============5832116048028598766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxkbcommon: upgrading to 1.13.2 SUCCEEDED
Message-ID: <0101019eb786b3ec-91f5aae5-8300-4d85-9255-547ea3b167b4-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238550

--===============5832116048028598766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxkbcommon* to *1.13.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.13.1-1.13.2.patch
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
From e2b692746891d634e3b94fc41ed43a279ff83ec8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:16:38 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.13.1 -> 1.13.2

---
 .../xorg-lib/{libxkbcommon_1.13.1.bb => libxkbcommon_1.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.13.1.bb => libxkbcommon_1.13.2.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
index 42e6458090..651c6119ea 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-${PV}"
 
-SRCREV = "6f76d19db72b5d450e927b41e1e96cbe3252aba8"
+SRCREV = "d1442aaa6b635551182e83c3b55037f4c118c962"
 
 inherit meson pkgconfig bash-completion
 
-- 
2.47.1


--===============5832116048028598766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxkbcommon: SRC_URI changed from "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-1.13.1" to "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=releases/v1.13;tag=xkbcommon-1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 2556960 to 2637328 (+3%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dbg: FILELIST: removed "/usr/lib/.debug/libxkbregistry.so.0.13.1 /usr/lib/.debug/libxkbcommon-x11.so.0.13.1 /usr/lib/.debug/libxkbcommon.so.0.13.1", added "/usr/lib/.debug/libxkbregistry.so.0.13.2 /usr/lib/.debug/libxkbcommon.so.0.13.2 /usr/libexec/xkbcommon/.debug/xkbcli-info /usr/lib/.debug/libxkbcommon-x11.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 411390 to 413482 (+1%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 16563 to 17005 (+3%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: FILELIST: added "/usr/share/man/man1/xkbcli-info.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 2070430 to 2077398 (+0%)
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-src: FILELIST: directory renamed /usr/src/debug/libxkbcommon/1.13.1/src/compose -> /usr/src/debug/libxkbcommon/1.13.2/src/compose, directory renamed /usr/src/debug/libxkbcommon/1.13.1/xkbcli-dump-keymap-wayland.p -> /usr/src/debug/libxkbcommon/1.13.2/xkbcli-dump-keymap-wayland.p, directory renamed /usr/src/debug/libxkbcommon/1.13.1/libxkbcommon.so.0.13.1.p -> /usr/src/debug/libxkbcommon/1.13.2/libxkbcommon.so.0.13.2.p, directory renamed /usr/src/debug/libxkbcommon/1.13.1/src -> /usr/src/debug/libxkbcommon/1.13.2/src, directory renamed /usr/src/debug/libxkbcommon/1.13.1/src/xkbcomp -> /usr/src/debug/libxkbcommon/1.13.2/src/xkbcomp, directory renamed /usr/src/debug/libxkbcommon/1.13.1/xkbcli-interactive-wayland.p -> /usr/src/debug/libxkbcommon/1.13.2/xkbcli-interactive-wayland.p, directory renamed /usr/src/debug/libxkbcommon/1.13.1/include/xkbcommon -> /usr/src/debug/libxkbcommon/1.13.2/include/xkbcommon, directory renamed /usr/sr
 c/debug/libxkbcommon/1.13.1/src/x11 -> /usr/src/debug/libxkbcommon/1.13.2/src/x11, removed "/usr/src/debug/libxkbcommon/1.13.1/tools/interactive-wayland.c /usr/src/debug/libxkbcommon/1.13.1/tools/tools-common.h /usr/src/debug/libxkbcommon/1.13.1/tools/tools-common.c /usr/src/debug/libxkbcommon/1.13.1/tools/how-to-type.c /usr/src/debug/libxkbcommon/1.13.1/tools/registry-list.c /usr/src/debug/libxkbcommon/1.13.1/tools/compile-keymap.c /usr/src/debug/libxkbcommon/1.13.1/tools/xkbcli.c /usr/src/debug/libxkbcommon/1.13.1/tools/interactive-x11.c /usr/src/debug/libxkbcommon/1.13.1/tools/compile-compose.c /usr/src/debug/libxkbcommon/1.13.1/tools/interactive-evdev.c /usr/src/debug/libxkbcommon/1.13.1/tools/interactive.c", added "/usr/src/debug/libxkbcommon/1.13.2/tools/interactive-wayland.c /usr/src/debug/libxkbcommon/1.13.2/tools/tools-common.h /usr/src/debug/libxkbcommon/1.13.2/tools/tools-common.c /usr/src/debug/libxkbcommon/1.13.2/tools/how-to-type.c /usr/src/debug/libxkbcommon/1.13.2/to
 ols/registry-list.c /usr/src/debug/libxkbcommon/1.13.2/tools/compile-keymap.c /usr/src/debug/libxkbcommon/1.13.2/tools/xkbcli.c /usr/src/debug/libxkbcommon/1.13.2/tools/interactive-x11.c /usr/src/debug/libxkbcommon/1.13.2/tools/info.c /usr/src/debug/libxkbcommon/1.13.2/tools/compile-compose.c /usr/src/debug/libxkbcommon/1.13.2/tools/interactive-evdev.c /usr/src/debug/libxkbcommon/1.13.2/tools/interactive.c"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILES: removed "/usr/lib/libxkbcommon-x11.so.0.13.1", added "/usr/lib/libxkbcommon-x11.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.13.1", added "/usr/lib/libxkbcommon-x11.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILES: removed "/usr/lib/libxkbcommon.so.0.13.1", added "/usr/lib/libxkbcommon.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.13.1", added "/usr/lib/libxkbcommon.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILES: removed "/usr/lib/libxkbregistry.so.0.13.1", added "/usr/lib/libxkbregistry.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.13.1", added "/usr/lib/libxkbregistry.so.0.13.2"
Changes to packages/x86-64-v3-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.13.1 to libxkbcommon.so.0.13.2
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.13.1 to libxkbcommon-x11.so.0.13.2
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.13.1 to libxkbregistry.so.0.13.2
  /usr/lib/libxkbcommon.so.0.13.1 moved to /usr/lib/libxkbcommon.so.0.13.2
  /usr/lib/libxkbcommon-x11.so.0.13.1 moved to /usr/lib/libxkbcommon-x11.so.0.13.2
  /usr/lib/libxkbregistry.so.0.13.1 moved to /usr/lib/libxkbregistry.so.0.13.2
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PKGSIZE changed from 431312 to 462232 (+7%)
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-info"

--===============5832116048028598766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-doc: FILELIST: added "/usr/share/man/man1/xkbcli-info.1"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.13.1", added "/usr/lib/libxkbcommon-x11.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.13.1", added "/usr/lib/libxkbcommon.so.0.13.2"
packages/x86-64-v3-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.13.1", added "/usr/lib/libxkbregistry.so.0.13.2"
Changes to packages/x86-64-v3-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.13.1 to libxkbcommon.so.0.13.2
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.13.1 to libxkbcommon-x11.so.0.13.2
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.13.1 to libxkbregistry.so.0.13.2
  /usr/lib/libxkbcommon.so.0.13.1 moved to /usr/lib/libxkbcommon.so.0.13.2
  /usr/lib/libxkbcommon-x11.so.0.13.1 moved to /usr/lib/libxkbcommon-x11.so.0.13.2
  /usr/lib/libxkbregistry.so.0.13.1 moved to /usr/lib/libxkbregistry.so.0.13.2
packages/x86-64-v3-poky-linux/libxkbcommon/xkbcli: FILELIST: added "/usr/libexec/xkbcommon/xkbcli-info"

--===============5832116048028598766==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.13.1-1.13.2.patch"

RnJvbSBlMmI2OTI3NDY4OTFkNjM0ZTNiOTRmYzQxZWQ0M2EyNzlmZjgzZWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6MTY6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4a2Jjb21tb246IHVwZ3JhZGUgMS4xMy4xIC0+IDEuMTMuMgoKLS0tCiAuLi4veG9yZy1saWIv
e2xpYnhrYmNvbW1vbl8xLjEzLjEuYmIgPT4gbGlieGtiY29tbW9uXzEuMTMuMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhrYmNvbW1vbl8xLjEzLjEuYmIgPT4g
bGlieGtiY29tbW9uXzEuMTMuMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuMTMuMS5iYiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4xMy4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21t
b25fMS4xMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGli
eGtiY29tbW9uXzEuMTMuMi5iYgppbmRleCA0MmU2NDU4MDkwLi42NTFjNjExOWVhIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuMTMuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuMTMu
Mi5iYgpAQCAtOSw3ICs5LDcgQEAgREVQRU5EUyA9ICJmbGV4LW5hdGl2ZSBiaXNvbi1uYXRpdmUi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS94a2Jjb21tb24vbGlieGtiY29tbW9uO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1yZWxlYXNlcy92MS4xMzt0YWc9eGtiY29tbW9uLSR7UFZ9Igog
Ci1TUkNSRVYgPSAiNmY3NmQxOWRiNzJiNWQ0NTBlOTI3YjQxZTFlOTZjYmUzMjUyYWJhOCIKK1NS
Q1JFViA9ICJkMTQ0MmFhYTZiNjM1NTUxMTgyZTgzYzNiNTUwMzdmNGMxMThjOTYyIgogCiBpbmhl
cml0IG1lc29uIHBrZ2NvbmZpZyBiYXNoLWNvbXBsZXRpb24KIAotLSAKMi40Ny4xCgo=

--===============5832116048028598766==--


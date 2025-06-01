Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC00DC7113C
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.27778.1748786131770467952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M4v8aAdW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=h2vIgRMW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101972bc6f4a0-09af5e5f-c8cf-4a0b-b404-8d8f766fa098-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pm2GzE9cEu1IxGj0qgLyzgYm6dxftBNRZeBGyyQwLx0=;
	b=M4v8aAdWoMpl2DK/yZLbPbAesfJTRMW84BbLsLgPNRZHOYwcQ7J8s7Flwkf5BNs/
	0yZ82s6S7Qbs09je58Wwt5RLI1HDikvScn982XrXYki3KEnTHEAw7pI6CUjBvTbXOIq
	CRU4wi2UO8pXB3cg8W5UVPLYOjZ94nDBXXB4gxp8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pm2GzE9cEu1IxGj0qgLyzgYm6dxftBNRZeBGyyQwLx0=;
	b=h2vIgRMWuVwx4VUW9L4m6LKqeVezv2Va5kKadBFaBv0Dx5iWjEE2q95gedRYPKXe
	cxH4uGVRexnelN3xVOQNb17a66pzFZQqfWG/fTovavmnDIjDgPBhrRRhj0GKC7oulod
	FeyjKiqDDeXwFxjBl8k1NaT8F8ZmOJiLfu34mCdw=
Content-Type: multipart/mixed; boundary="===============7484668289103000330=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxkbcommon: upgrading to 1.10.0 SUCCEEDED
Message-ID: <010101972bc6f4a0-09af5e5f-c8cf-4a0b-b404-8d8f766fa098-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217650

--===============7484668289103000330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxkbcommon* to *1.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.9.2-1.10.0.patch
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
From 5734a21eab0d974725b8081f35c76b17e0cd37e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 12:24:12 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.9.2 -> 1.10.0

---
 .../xorg-lib/{libxkbcommon_1.9.2.bb => libxkbcommon_1.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.9.2.bb => libxkbcommon_1.10.0.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
index 77ee8ce500..e10bbf7af0 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
 
-SRCREV = "dd642359f8d43c09968e34ca7f1eb1121b2dfd70"
+SRCREV = "7888474d0296dcad50c9ba4adfdfdf2be02d35e1"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion
-- 
2.47.1


--===============7484668289103000330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxkbcommon: SRC_URI changed from "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-1.9.2" to "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-1.10.0"
packages/core2-64-poky-linux/libxkbcommon: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: FILELIST: removed "/usr/lib/.debug/libxkbregistry.so.0.9.2 /usr/lib/.debug/libxkbcommon.so.0.9.2 /usr/lib/.debug/libxkbcommon-x11.so.0.9.2", added "/usr/lib/.debug/libxkbcommon-x11.so.0.10.0 /usr/lib/.debug/libxkbcommon.so.0.10.0 /usr/lib/.debug/libxkbregistry.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 1582040 to 1742200 (+10%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 378127 to 382968 (+1%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 12582 to 12813 (+2%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 341669 to 350279 (+3%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: FILES: removed "/usr/lib/libxkbcommon-x11.so.0.9.2", added "/usr/lib/libxkbcommon-x11.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.9.2", added "/usr/lib/libxkbcommon-x11.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: PKGSIZE changed from 38993 to 38994 (+0%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: FILES: removed "/usr/lib/libxkbcommon.so.0.9.2", added "/usr/lib/libxkbcommon.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.9.2", added "/usr/lib/libxkbcommon.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 337997 to 350422 (+4%)
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: FILES: removed "/usr/lib/libxkbregistry.so.0.9.2", added "/usr/lib/libxkbregistry.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.9.2", added "/usr/lib/libxkbregistry.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: PKGSIZE changed from 34815 to 34816 (+0%)
Changes to packages/core2-64-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.9.2 to libxkbcommon.so.0.10.0
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.9.2 to libxkbcommon-x11.so.0.10.0
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.9.2 to libxkbregistry.so.0.10.0
  /usr/lib/libxkbcommon.so.0.10.0 was added
  /usr/lib/libxkbcommon-x11.so.0.10.0 was added
  /usr/lib/libxkbregistry.so.0.10.0 was added
  /usr/lib/libxkbcommon.so.0.9.2 was removed
  /usr/lib/libxkbcommon-x11.so.0.9.2 was removed
  /usr/lib/libxkbregistry.so.0.9.2 was removed
packages/core2-64-poky-linux/libxkbcommon/xkbcli: PV changed from "1.9.2" to "1.10.0"
packages/core2-64-poky-linux/libxkbcommon/xkbcli: PKGV changed from 1.9.2 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/libxkbcommon/xkbcli: PKGSIZE changed from 269544 to 277768 (+3%)

--===============7484668289103000330==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.9.2-1.10.0.patch"

RnJvbSA1NzM0YTIxZWFiMGQ5NzQ3MjViODA4MWYzNWM3NmIxN2UwY2QzN2UwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMjoyNDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhrYmNvbW1vbjogdXBncmFkZSAxLjkuMiAtPiAxLjEwLjAKCi0tLQogLi4uL3hvcmctbGliL3ts
aWJ4a2Jjb21tb25fMS45LjIuYmIgPT4gbGlieGtiY29tbW9uXzEuMTAuMC5iYn0gIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4a2Jjb21tb25fMS45LjIuYmIgPT4gbGli
eGtiY29tbW9uXzEuMTAuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuOS4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjEwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8x
LjkuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNv
bW1vbl8xLjEwLjAuYmIKaW5kZXggNzdlZThjZTUwMC4uZTEwYmJmN2FmMCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjkuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuMTAuMC5iYgpA
QCAtOSw3ICs5LDcgQEAgREVQRU5EUyA9ICJmbGV4LW5hdGl2ZSBiaXNvbi1uYXRpdmUiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS94a2Jjb21tb24vbGlieGtiY29tbW9uO3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXhrYmNvbW1vbi0ke1BWfSIKIAotU1JDUkVWID0gImRk
NjQyMzU5ZjhkNDNjMDk5NjhlMzRjYTdmMWViMTEyMWIyZGZkNzAiCitTUkNSRVYgPSAiNzg4ODQ3
NGQwMjk2ZGNhZDUwYzliYTRhZGZkZmRmMmJlMDJkMzVlMSIKIFMgPSAiJHtXT1JLRElSfS9naXQi
CiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmlnIGJhc2gtY29tcGxldGlvbgotLSAKMi40Ny4xCgo=

--===============7484668289103000330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 1582040 to 1742200 (+10%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.9.2", added "/usr/lib/libxkbcommon-x11.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.9.2", added "/usr/lib/libxkbcommon.so.0.10.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.9.2", added "/usr/lib/libxkbregistry.so.0.10.0"
Changes to packages/core2-64-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.9.2 to libxkbcommon.so.0.10.0
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.9.2 to libxkbcommon-x11.so.0.10.0
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.9.2 to libxkbregistry.so.0.10.0
  /usr/lib/libxkbcommon.so.0.10.0 was added
  /usr/lib/libxkbcommon-x11.so.0.10.0 was added
  /usr/lib/libxkbregistry.so.0.10.0 was added
  /usr/lib/libxkbcommon.so.0.9.2 was removed
  /usr/lib/libxkbcommon-x11.so.0.9.2 was removed
  /usr/lib/libxkbregistry.so.0.9.2 was removed

--===============7484668289103000330==--


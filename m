Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C99C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:52:37 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14771.1782798750916685774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nAFT7XhO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2XhQSn6s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f17161151-24e56d66-faaf-413a-b23d-4152ed73b43a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bneV+ApQg0JecTv7qIA6U/hhnXOKa81tLRwu6ZV6XgU=;
	b=nAFT7XhOeDhMEkB5DawNfZybg9ogt95DR8EBqBg+iQksDvTniUcGn2oQ3PzkeejK
	28ys6FE1gsVBq+vxAI+1k/YGlOvR+j0XfBmgfmloffi18PfnPmHhGf8CRwitRMmFCoT
	bhQd6RcTVT77iijgUL9HEMyI1DHimZv/RQbyD/pQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bneV+ApQg0JecTv7qIA6U/hhnXOKa81tLRwu6ZV6XgU=;
	b=2XhQSn6ssiPoPc9/zrVYvdgXuazOS36G61kI6Per3I6VLYGHeZqgG4iyONRA0cR3
	95h7af62ZFqny90dUEZRAzvRgXSZ2Sf+tJ67PTlJyutrzp+/rDJp9WDn+GuLnLs/cgl
	nzwm2D6bPA1VDy3IA8OI8t1MdGQsC3HSM/n8Qygs=
Content-Type: multipart/mixed; boundary="===============5817224854644587726=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.8.3 SUCCEEDED
Message-ID: <0101019f17161151-24e56d66-faaf-413a-b23d-4152ed73b43a-000000@us-west-2.amazonses.com>
Date: Tue, 30 Jun 2026 05:52:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.30-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239843

--===============5817224854644587726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *waffle* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-waffle-upgrade-1.8.2-1.8.3.patch
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
From 663b97971015449edf2173fe3283734c2ee7f9f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 30 Jun 2026 05:30:32 +0000
Subject: [PATCH] waffle: upgrade 1.8.2 -> 1.8.3

---
 .../waffle/{waffle_1.8.2.bb => waffle_1.8.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/waffle/{waffle_1.8.2.bb => waffle_1.8.3.bb} (97%)

diff --git a/meta/recipes-graphics/waffle/waffle_1.8.2.bb b/meta/recipes-graphics/waffle/waffle_1.8.3.bb
similarity index 97%
rename from meta/recipes-graphics/waffle/waffle_1.8.2.bb
rename to meta/recipes-graphics/waffle/waffle_1.8.3.bb
index dd31d4057d..377187b499 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.8"
-SRCREV = "70dd251e0390401ab9dc4f768ee9665863f4c268"
+SRCREV = "920b709036d7313b59007435786fc3da61af31ab"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-- 
2.47.1


--===============5817224854644587726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/waffle: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
Changes to packages/x86-64-v3-poky-linux/waffle (sysroot):
  /usr/lib/libwaffle-1.so.0 changed symlink target from libwaffle-1.so.0.8.2 to libwaffle-1.so.0.8.3
  /usr/lib/libwaffle-1.so.0.8.2 moved to /usr/lib/libwaffle-1.so.0.8.3
  /usr/lib/cmake was added
  /usr/lib/cmake/Waffle was added
  /usr/lib/cmake/Waffle/WaffleConfig.cmake was added
  /usr/lib/cmake/Waffle/WaffleConfigVersion.cmake was added
packages/x86-64-v3-poky-linux/waffle/waffle-bash-completion: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-bash-completion: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle-bin: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-bin: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle-dbg: FILELIST: removed "/usr/lib/.debug/libwaffle-1.so.0.8.2", added "/usr/lib/.debug/libwaffle-1.so.0.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-dbg: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle-dev: FILELIST: added "/usr/lib/cmake/Waffle/WaffleConfig.cmake /usr/lib/cmake/Waffle/WaffleConfigVersion.cmake"
packages/x86-64-v3-poky-linux/waffle/waffle-dev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle-dev: PKGSIZE changed from 24917 to 28913 (+16%)
packages/x86-64-v3-poky-linux/waffle/waffle-doc: FILELIST: added "/usr/share/doc/waffle1/release-notes/waffle-1.8.3.md"
packages/x86-64-v3-poky-linux/waffle/waffle-doc: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle-doc: PKGSIZE changed from 122845 to 123405 (+0%)
packages/x86-64-v3-poky-linux/waffle/waffle-locale: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-locale: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle-src: FILELIST: directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/gbm -> /usr/src/debug/waffle/1.8.3/src/waffle/gbm, directory renamed /usr/src/debug/waffle/1.8.2/src/utils -> /usr/src/debug/waffle/1.8.3/src/utils, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/glx -> /usr/src/debug/waffle/1.8.3/src/waffle/glx, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/xegl -> /usr/src/debug/waffle/1.8.3/src/waffle/xegl, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/linux -> /usr/src/debug/waffle/1.8.3/src/waffle/linux, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/api -> /usr/src/debug/waffle/1.8.3/src/waffle/api, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/egl -> /usr/src/debug/waffle/1.8.3/src/waffle/egl, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/surfaceless_egl -> /usr/src/debug/waffle/1.8.3/src/waffle/surfaceless_egl, directory renamed /usr/src/debug/waffle/1.8.2/src/waffl
 e/wayland -> /usr/src/debug/waffle/1.8.3/src/waffle/wayland, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/x11 -> /usr/src/debug/waffle/1.8.3/src/waffle/x11, directory renamed /usr/src/debug/waffle/1.8.2/include/waffle-1 -> /usr/src/debug/waffle/1.8.3/include/waffle-1, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle -> /usr/src/debug/waffle/1.8.3/src/waffle, directory renamed /usr/src/debug/waffle/1.8.2/third_party/threads -> /usr/src/debug/waffle/1.8.3/third_party/threads, directory renamed /usr/src/debug/waffle/1.8.2/src/waffle/core -> /usr/src/debug/waffle/1.8.3/src/waffle/core
packages/x86-64-v3-poky-linux/waffle/waffle-src: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/waffle/waffle: FILELIST: removed "/usr/lib/libwaffle-1.so.0.8.2", added "/usr/lib/libwaffle-1.so.0.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/waffle/waffle: PKGV changed from 1.8.2 [default] to 1.8.3 [default]

--===============5817224854644587726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/waffle (sysroot):
  /usr/lib/libwaffle-1.so.0 changed symlink target from libwaffle-1.so.0.8.2 to libwaffle-1.so.0.8.3
  /usr/lib/libwaffle-1.so.0.8.2 moved to /usr/lib/libwaffle-1.so.0.8.3
  /usr/lib/cmake was added
  /usr/lib/cmake/Waffle was added
  /usr/lib/cmake/Waffle/WaffleConfig.cmake was added
  /usr/lib/cmake/Waffle/WaffleConfigVersion.cmake was added
packages/x86-64-v3-poky-linux/waffle/waffle-dev: PKGSIZE changed from 24917 to 28913 (+16%)
packages/x86-64-v3-poky-linux/waffle/waffle-dev: FILELIST: added "/usr/lib/cmake/Waffle/WaffleConfig.cmake /usr/lib/cmake/Waffle/WaffleConfigVersion.cmake"
packages/x86-64-v3-poky-linux/waffle/waffle-doc: FILELIST: added "/usr/share/doc/waffle1/release-notes/waffle-1.8.3.md"
packages/x86-64-v3-poky-linux/waffle/waffle: FILELIST: removed "/usr/lib/libwaffle-1.so.0.8.2", added "/usr/lib/libwaffle-1.so.0.8.3"

--===============5817224854644587726==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-waffle-upgrade-1.8.2-1.8.3.patch"

RnJvbSA2NjNiOTc5NzEwMTU0NDllZGYyMTczZmUzMjgzNzM0YzJlZTdmOWY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMzAgSnVuIDIwMjYgMDU6MzA6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YWZmbGU6IHVwZ3JhZGUgMS44LjIgLT4gMS44LjMKCi0tLQogLi4uL3dhZmZsZS97d2FmZmxlXzEu
OC4yLmJiID0+IHdhZmZsZV8xLjguMy5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3dhZmZsZS97d2FmZmxlXzEuOC4yLmJiID0+IHdhZmZsZV8xLjguMy5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8x
LjguMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlXzEuOC4zLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZm
bGUvd2FmZmxlXzEuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxl
L3dhZmZsZV8xLjguMy5iYgppbmRleCBkZDMxZDQwNTdkLi4zNzcxODdiNDk5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjguMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjguMy5iYgpAQCAtMTAsNyArMTAsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NGM1MTU0NDA3YzI0
OTA3NTBkZDQ2MWM1MGFkOTQ3OTcgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vaW5jbHVk
ZS93YWZmbGUtMS93YWZmbGUuaDtlbmRsaW5lPTI0O21kNT02MWRiZjg2OTdmNjFjNzg2NDVlNzVh
OTNjNTg1YjFiZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21l
c2Evd2FmZmxlLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbnQtMS44IgotU1JDUkVWID0g
IjcwZGQyNTFlMDM5MDQwMWFiOWRjNGY3NjhlZTk2NjU4NjNmNGMyNjgiCitTUkNSRVYgPSAiOTIw
YjcwOTAzNmQ3MzEzYjU5MDA3NDM1Nzg2ZmMzZGE2MWFmMzFhYiIKIAogaW5oZXJpdCBtZXNvbiBm
ZWF0dXJlc19jaGVjayBsaWJfcGFja2FnZSBiYXNoLWNvbXBsZXRpb24gcGtnY29uZmlnCiAKLS0g
CjIuNDcuMQoK

--===============5817224854644587726==--


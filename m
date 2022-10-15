Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968C2C3A5A7
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.24561.1665871393771325708
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BdUVQyAM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010183ddac3a7c-53ad77eb-c431-484c-a1b9-69c261b41444-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fjS3ifWrH+2ZhHi20ywlo72JxtYtZ0tCi9nZmctNLfw=;
	b=BdUVQyAMWqDvXeesBvq28dkE13RuZ0S81jgjIX2s8g6suHLjOmJOAUq1fwdV4pPS
	LFM4hBClPtgy6VnqvODW93FCFYiDT++RPTJTXsFuXqckNDQV6Nco+ZrTJxcuBY1R6ak
	b3+Y/6p6gStSQjpV0oJKISfsXFPBdd1xs/iYQBZQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fjS3ifWrH+2ZhHi20ywlo72JxtYtZ0tCi9nZmctNLfw=;
	b=j7jlRmkMeSYRgBDYIb1RkN/1MlJ8L91t/0JqOFe4oPjkAzFjIFHyS0IywdYIq5YF
	oedN/chgsP0OIpFobSTEav8UZ9h8pQEHJNF/BdriRy4Of91wkz4f7UeaeK3mxUg08Ic
	kU14bPTvOuI/21+TQxE6AmnVUkqVo4J00pNxB/l0=
Content-Type: multipart/mixed; boundary="===============3075193470643624233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.16.0 SUCCEEDED
Message-ID: <01010183ddac3a7c-53ad77eb-c431-484c-a1b9-69c261b41444-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171830

--===============3075193470643624233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.15.0-2.16.0.patch
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
--===============3075193470643624233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1500.0", added "/usr/lib/libva-glx.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1500.0", added "/usr/lib/libva-wayland.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1500.0", added "/usr/lib/libva-x11.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.1500.0 /usr/lib/libva-drm.so.2.1500.0", added "/usr/lib/libva-drm.so.2.1600.0 /usr/lib/libva.so.2.1600.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1500.0 to libva-drm.so.2.1600.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1500.0 to libva-glx.so.2.1600.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1500.0 to libva.so.2.1600.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1500.0 to libva-wayland.so.2.1600.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1500.0 to libva-x11.so.2.1600.0
  /usr/lib/libva-drm.so.2.1500.0 moved to /usr/lib/libva-drm.so.2.1600.0
  /usr/lib/libva-glx.so.2.1500.0 moved to /usr/lib/libva-glx.so.2.1600.0
  /usr/lib/libva.so.2.1500.0 moved to /usr/lib/libva.so.2.1600.0
  /usr/lib/libva-wayland.so.2.1500.0 moved to /usr/lib/libva-wayland.so.2.1600.0
  /usr/lib/libva-x11.so.2.1500.0 moved to /usr/lib/libva-x11.so.2.1600.0

--===============3075193470643624233==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.15.0-2.16.0.patch"

RnJvbSBlN2Y0MGE4Y2ZmOTA3OTBlOGQ3MGEyOGM4ZDBhMTA0NDBmODEwZTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTU6NTc6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YTogdXBncmFkZSAyLjE1LjAgLT4gMi4xNi4wCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjE1LjAuYmIgPT4gbGlidmFfMi4xNi4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTUuMC5iYiA9PiBsaWJ2
YV8yLjE2LjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmlu
ZGV4IDczNWYyZmNhNWIuLjBmMTZkYWNjOTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xp
YnZhLmluYwpAQCAtMTgsNyArMTgsNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbGlidmEtJHtQVn0udGFyLmJ6MiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJl
NWVmMDM1Mzc4MDBmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1OGVkNDA5NDU4ZDNlN2EwMDBl
MTkwOGJjODUyNjE5NjE1ZWU2YTkzMzM1OWM3NDVmY2Q5M2ViM2U0NjFlY2EiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMTE1ZmFjYTBkYjJjNDE3YTM3ZGE0OTgzMDg3MGUyNjA0NTBmYTEzMDY2ZjVl
MjRlMjUyYTIwYzM2ZDkyMGExYyIKIAogUyA9ICIke1dPUktESVJ9L2xpYnZhLSR7UFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xNS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTYuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIu
MTUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTYu
MC5iYgotLSAKMi4zMS4xCgo=

--===============3075193470643624233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.15.0/libva-2.15.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.16.0/libva-2.16.0.tar.bz2"
packages/core2-32-poky-linux/libva: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 722248 to 730380 (+1%)
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva.so.2.1500.0 /usr/lib/.debug/libva-drm.so.2.1500.0 /usr/lib/.debug/libva-x11.so.2.1500.0 /usr/lib/.debug/libva-glx.so.2.1500.0 /usr/lib/.debug/libva-wayland.so.2.1500.0", added "/usr/lib/.debug/libva-x11.so.2.1600.0 /usr/lib/.debug/libva.so.2.1600.0 /usr/lib/.debug/libva-glx.so.2.1600.0 /usr/lib/.debug/libva-wayland.so.2.1600.0 /usr/lib/.debug/libva-drm.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 648841 to 649531 (+0%)
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1500.0", added "/usr/lib/libva-glx.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 1105831 to 1124659 (+2%)
packages/core2-32-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.15.0-r0/va/wayland -> /usr/src/debug/libva/2.16.0-r0/va/wayland, directory renamed /usr/src/debug/libva/2.15.0-r0/va -> /usr/src/debug/libva/2.16.0-r0/va, directory renamed /usr/src/debug/libva/2.15.0-r0/va/glx -> /usr/src/debug/libva/2.16.0-r0/va/glx, directory renamed /usr/src/debug/libva/2.15.0-r0/va/x11 -> /usr/src/debug/libva/2.16.0-r0/va/x11, removed "/usr/src/debug/libva/2.15.0-r0/va/drm/va_drm_utils.c /usr/src/debug/libva/2.15.0-r0/va/drm/va_drm_auth.c /usr/src/debug/libva/2.15.0-r0/va/drm/va_drm_utils.h /usr/src/debug/libva/2.15.0-r0/va/drm/va_drm_auth.h /usr/src/debug/libva/2.15.0-r0/va/drm/va_drm.c /usr/src/debug/libva/2.15.0-r0/va/drm/va_drm_auth_x11.c", added "/usr/src/debug/libva/2.16.0-r0/va/drm/va_drm_auth_x11.c /usr/src/debug/libva/2.16.0-r0/va/drm/va_drm_auth.h /usr/src/debug/libva/2.16.0-r0/va/drm/va_drm_utils.c /usr/src/debug/libva/2.16.0-r0/va/drm/va_drm_auth.c /usr/s
 rc/debug/libva/2.16.0-r0/va/drm/va_drm_utils.h /usr/src/debug/libva/2.16.0-r0/va/drm/va_drm_auth_x11.h /usr/src/debug/libva/2.16.0-r0/va/drm/va_drm.c"
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1500.0", added "/usr/lib/libva-wayland.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1500.0", added "/usr/lib/libva-x11.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.15.0" to "2.16.0"
packages/core2-32-poky-linux/libva/libva: PKGSIZE changed from 232146 to 236242 (+2%)
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.1500.0 /usr/lib/libva.so.2.1500.0", added "/usr/lib/libva.so.2.1600.0 /usr/lib/libva-drm.so.2.1600.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-32-poky-linux/libva/libva: PV changed from "2.15.0" to "2.16.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1500.0 to libva-drm.so.2.1600.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1500.0 to libva-glx.so.2.1600.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1500.0 to libva.so.2.1600.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1500.0 to libva-wayland.so.2.1600.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1500.0 to libva-x11.so.2.1600.0
  /usr/lib/libva-drm.so.2.1500.0 moved to /usr/lib/libva-drm.so.2.1600.0
  /usr/lib/libva-glx.so.2.1500.0 moved to /usr/lib/libva-glx.so.2.1600.0
  /usr/lib/libva.so.2.1500.0 moved to /usr/lib/libva.so.2.1600.0
  /usr/lib/libva-wayland.so.2.1500.0 moved to /usr/lib/libva-wayland.so.2.1600.0
  /usr/lib/libva-x11.so.2.1500.0 moved to /usr/lib/libva-x11.so.2.1600.0

--===============3075193470643624233==--


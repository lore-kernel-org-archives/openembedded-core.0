Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7EAD609A1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17392.1765872135156596590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jL2qKcRV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=axYYDfbi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262ef44b-5f900442-9bdd-4633-9e23-f91c14491f7a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JVFV3XFm8nGHentzZk6CUIpgf+r8k4IcuLcsSh84m1Y=;
	b=jL2qKcRVdBWq8BlgziE/4fiUC2lVi8dz03tgshWdLIWETVtsFrisgGaQQ9Iu+PQf
	mk7nPc9A3Bks+nvj57PssaAoqYrkTFeTfPxNKdgh4N80hRwBpUNvtVpzS8+TxAAxESS
	taBN2e46cp4obW3sFmkLPzVW5rpW/GVzO9Er44Kw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JVFV3XFm8nGHentzZk6CUIpgf+r8k4IcuLcsSh84m1Y=;
	b=axYYDfbiTSENTvHQcvtoIt30LRfWw1CE2gLNTxuF4+H9BCi/U832ZJ6c2eG507qj
	DsK/GCtFAp2KpcWaYGaOUCThXHs/QRCOIC1fi6UOxubFFamOUAZZdQPozdlBYxbc01v
	xLpKgAjI7DNRKHfDXiEmXFL+TVm8NjtJr3C6B/3Y=
Content-Type: multipart/mixed; boundary="===============2908198928683400897=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libproxy: upgrading to 0.5.12 SUCCEEDED
Message-ID: <0101019b262ef44b-5f900442-9bdd-4633-9e23-f91c14491f7a-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227919

--===============2908198928683400897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.11-0.5.12.patch
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
From 2c41b5e8c7658903409d1529813a207855bddffc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:42:23 +0000
Subject: [PATCH] libproxy: upgrade 0.5.11 -> 0.5.12

---
 .../libproxy/{libproxy_0.5.11.bb => libproxy_0.5.12.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.11.bb => libproxy_0.5.12.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.11.bb b/meta/recipes-support/libproxy/libproxy_0.5.12.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.11.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.12.bb
index 1efa3cdc0e..c3b3b6ef56 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.12.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
+SRCREV = "99da01926b1b1e303a4d2331bbd74bed424863e7"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.1


--===============2908198928683400897==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.11-0.5.12.patch"

RnJvbSAyYzQxYjVlOGM3NjU4OTAzNDA5ZDE1Mjk4MTNhMjA3ODU1YmRkZmZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6NDI6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwcm94eTogdXBncmFkZSAwLjUuMTEgLT4gMC41LjEyCgotLS0KIC4uLi9saWJwcm94eS97bGli
cHJveHlfMC41LjExLmJiID0+IGxpYnByb3h5XzAuNS4xMi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L3tsaWJwcm94eV8wLjUuMTEuYmIgPT4gbGlicHJveHlf
MC41LjEyLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBy
b3h5L2xpYnByb3h5XzAuNS4xMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xp
YnByb3h5XzAuNS4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuMTEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS4xMi5iYgppbmRleCAxZWZhM2Nk
YzBlLi5jM2IzYjZlZjU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94
eS9saWJwcm94eV8wLjUuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkv
bGlicHJveHlfMC41LjEyLmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIERF
UEVORFMgPSAiZ2xpYi0yLjAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJwcm94
eS9saWJwcm94eTtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9JHtQVn0iCi1TUkNSRVYg
PSAiM2ZkM2E2ZTg0NWMwMzg2ZDkxYWJjNzQyNDUzZDBmMjliZjI4YzQwNCIKK1NSQ1JFViA9ICI5
OWRhMDE5MjZiMWIxZTMwM2E0ZDIzMzFiYmQ3NGJlZDQyNDg2M2U3IgogCiBpbmhlcml0IG1lc29u
IHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3BlY3Rpb24gdmFsYSBnaS1kb2NnZW4KIEdJRE9DR0VO
X01FU09OX09QVElPTiA9ICdkb2NzJwotLSAKMi40Ny4xCgo=

--===============2908198928683400897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: FILELIST: added "/usr/lib/libproxy.a"
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PKGSIZE changed from 0 to 11418 (+100%)
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.11", added "/usr/lib/libproxy.so.0.5.12"
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.11 to libproxy.so.0.5.12
  /usr/lib/libproxy.so.0.5.11 moved to /usr/lib/libproxy.so.0.5.12
  /usr/lib/libproxy.a was added

--===============2908198928683400897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libproxy: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy: SRC_URI changed from "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.11" to "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.12"
packages/x86-64-v3-poky-linux/libproxy: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.11", added "/usr/lib/.debug/libproxy.so.0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 154128 to 154344 (+0%)
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: FILELIST: directory renamed /usr/src/debug/libproxy/0.5.11/src/backend/plugins/config-env -> /usr/src/debug/libproxy/0.5.12/src/backend/plugins/config-env, directory renamed /usr/src/debug/libproxy/0.5.11/src/backend -> /usr/src/debug/libproxy/0.5.12/src/backend, directory renamed /usr/src/debug/libproxy/0.5.11/src/tools -> /usr/src/debug/libproxy/0.5.12/src/tools, directory renamed /usr/src/debug/libproxy/0.5.11/src/libproxy -> /usr/src/debug/libproxy/0.5.12/src/libproxy, directory renamed /usr/src/debug/libproxy/0.5.11/src/backend/plugins/config-sysconfig -> /usr/src/debug/libproxy/0.5.12/src/backend/plugins/config-sysconfig, directory renamed /usr/src/debug/libproxy/0.5.11/src/backend/plugins/config-xdp -> /usr/src/debug/libproxy/0.5.12/src/backend/plugins/config-xdp, directory renamed /usr/src/debug/libproxy/0.5.11/src/backend/plugins/config-kde -> /usr/src/debug/libproxy/0.5.12/src/backend/plugins/config-kde
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 69232 to 69296 (+0%)
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: FILELIST: added "/usr/lib/libproxy.a"
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PKGSIZE changed from 0 to 11418 (+100%)
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.11/modules", added "/usr/lib/libproxy/0.5.12/modules"
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.11", added "/usr/lib/libproxy.so.0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy: PV changed from "0.5.11" to "0.5.12"
packages/x86-64-v3-poky-linux/libproxy/libproxy: PKGV changed from 0.5.11 [default] to 0.5.12 [default]
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.11 to libproxy.so.0.5.12
  /usr/lib/libproxy.so.0.5.11 moved to /usr/lib/libproxy.so.0.5.12
  /usr/lib/libproxy.a was added

--===============2908198928683400897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-ac87a5712545f916a2516f8b5033747873a92289"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:ac87a5712545f916a2516f8b5033747873a92289"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 254 Local 245 Mirrors 0 Missed 9 Current 255 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 269 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_populate_lic_setscene)
NOTE: Running setscene task 312 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 935 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_write_config)
NOTE: recipe libproxy-0.5.12-r0: task do_populate_lic_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libproxy-0.5.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libproxy-0.5.12-r0: task do_write_config: Started
NOTE: recipe libproxy-0.5.12-r0: task do_write_config: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 330 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libproxy-0.5.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libproxy-0.5.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 971 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 338 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_packagedata_setscene)
NOTE: recipe libproxy-0.5.12-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 360 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libproxy-0.5.12-r0: task do_fetch: Succeeded
NOTE: Running task 977 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 362 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libproxy-0.5.12-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 372 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libpcre2/10.46/temp/log.do_packagedata_setscene.329453
NOTE: recipe libproxy-0.5.12-r0: task do_unpack: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 377 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running task 991 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libproxy-0.5.12-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 389 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 400 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 406 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 407 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 411 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 413 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 437 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 450 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 452 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 507 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1397 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata)
NOTE: Running task 1433 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata: Started
NOTE: recipe libproxy-0.5.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata: Succeeded
NOTE: Running task 1455 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_collect_spdx_deps)
NOTE: recipe libproxy-0.5.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libproxy-0.5.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1456 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_configure)
NOTE: recipe libproxy-0.5.12-r0: task do_configure: Started
NOTE: recipe libproxy-0.5.12-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_compile)
NOTE: recipe libproxy-0.5.12-r0: task do_compile: Started
NOTE: recipe libproxy-0.5.12-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_install)
NOTE: recipe libproxy-0.5.12-r0: task do_install: Started
NOTE: recipe libproxy-0.5.12-r0: task do_install: Succeeded
NOTE: Running task 1459 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_package)
NOTE: Running task 1460 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_populate_sysroot)
NOTE: recipe libproxy-0.5.12-r0: task do_populate_sysroot: Started
NOTE: recipe libproxy-0.5.12-r0: task do_package: Started
NOTE: recipe libproxy-0.5.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_package: Succeeded
NOTE: Running task 1461 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_packagedata)
NOTE: recipe libproxy-0.5.12-r0: task do_packagedata: Started
NOTE: recipe libproxy-0.5.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_packagedata unihash changed to cc4acffdb9f9c69aa30c7707f731b6048c08adb019efeae63a47dc53426c6add
NOTE: Setscene tasks completed
NOTE: Running task 1462 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_create_spdx)
NOTE: Running task 1463 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_package_write_ipk)
NOTE: Running task 1464 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_package_write_deb)
NOTE: Running task 1465 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_package_write_rpm)
NOTE: Running task 1466 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_package_qa)
NOTE: recipe libproxy-0.5.12-r0: task do_create_spdx: Started
NOTE: recipe libproxy-0.5.12-r0: task do_package_write_ipk: Started
NOTE: recipe libproxy-0.5.12-r0: task do_package_write_deb: Started
NOTE: recipe libproxy-0.5.12-r0: task do_package_write_rpm: Started
NOTE: recipe libproxy-0.5.12-r0: task do_package_qa: Started
NOTE: recipe libproxy-0.5.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 1467 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_create_package_spdx)
NOTE: recipe libproxy-0.5.12-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_package_qa: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_create_package_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_package_qa unihash changed to 11115d48a528dd4526afa35e2344635a0871e1a84e74b5dfff6cc22ea2d16508
NOTE: recipe libproxy-0.5.12-r0: task do_package_write_deb: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libproxy-0.5.12-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1468 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.12.bb:do_build)
NOTE: Tasks Summary: Attempted 1468 tasks of which 1448 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 14 ERROR messages, returning a non-zero exit code.
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-src went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-dbg went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-16 went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-32 went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2grep went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2grep-doc went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2test went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2test-doc went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-staticdev went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-dev went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-doc went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-locale went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2 went backwards which would break package feeds (from 0:10.47-r0 to 0:10.46-r0) [version-going-backwards]
ERROR: libpcre2-10.46-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2908198928683400897==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA95CEDD92
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11928.1763224711617854114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uWYFgTAI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=diyPKXhX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a88629735-0c3c21cc-0708-4e20-882c-82107fd8aa8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P/JjuHNHO1HiBRQdPAZWR+TJ8fifrebnbVII6DrV9yo=;
	b=uWYFgTAI85+jcWBXH5aOJ8YGPSnmrIVZlQAdySwfmLSXL2uVDmfn1Y6bXAGczMg4
	+yoToVSwB2S/7jOk4z1G+oNcR/Qe67UoF7AGKQ73gPsg6JBK1PcnwvOXfA94m26bD8T
	e6QEbmXZKKiykztek2pM63SpaTIpEKm1/IebpWko=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P/JjuHNHO1HiBRQdPAZWR+TJ8fifrebnbVII6DrV9yo=;
	b=diyPKXhXh3UpPzqX9lZ/IzqCT5mAM+ZQ8F6u+/I5DbHOMsgjV4EHGvdrHBIweOy8
	LnX7wj9ouBCDh0Am5ETUSMXVv0nJUUZGiyFVrZ5T62sgAADfgBQBZA60vdkytAEzrd+
	9TvpbBL7Aa5JieNmXxf92+2I6ivlU7DpK5pcj+jo=
Content-Type: multipart/mixed; boundary="===============4331717747180643528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libproxy: upgrading to 0.5.11 SUCCEEDED
Message-ID: <0101019a88629735-0c3c21cc-0708-4e20-882c-82107fd8aa8e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226453

--===============4331717747180643528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.10-0.5.11.patch
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
From f1b1799c3108b81d7d87745759dfd3ae22f64b55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 16:18:47 +0000
Subject: [PATCH] libproxy: upgrade 0.5.10 -> 0.5.11

---
 .../libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.10.bb b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.10.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.11.bb
index 21930ada00..1efa3cdc0e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.10.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
+SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.47.1


--===============4331717747180643528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libproxy: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy: SRC_URI changed from "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.10" to "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.10", added "/usr/lib/.debug/libproxy.so.0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
packages/x86-64-v3-poky-linux/libproxy/libproxy: PV changed from "0.5.10" to "0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.10/modules", added "/usr/lib/libproxy/0.5.11/modules"
packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.10", added "/usr/lib/libproxy.so.0.5.11"
packages/x86-64-v3-poky-linux/libproxy/libproxy: PKGV changed from 0.5.10 [default] to 0.5.11 [default]
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.10 to libproxy.so.0.5.11
  /usr/lib/libproxy.so.0.5.10 moved to /usr/lib/libproxy.so.0.5.11

--===============4331717747180643528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.10-0.5.11.patch"

RnJvbSBmMWIxNzk5YzMxMDhiODFkN2Q4Nzc0NTc1OWRmZDNhZTIyZjY0YjU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTY6MTg6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwcm94eTogdXBncmFkZSAwLjUuMTAgLT4gMC41LjExCgotLS0KIC4uLi9saWJwcm94eS97bGli
cHJveHlfMC41LjEwLmJiID0+IGxpYnByb3h5XzAuNS4xMS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L3tsaWJwcm94eV8wLjUuMTAuYmIgPT4gbGlicHJveHlf
MC41LjExLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBy
b3h5L2xpYnByb3h5XzAuNS4xMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xp
YnByb3h5XzAuNS4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuMTAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS4xMS5iYgppbmRleCAyMTkzMGFk
YTAwLi4xZWZhM2NkYzBlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94
eS9saWJwcm94eV8wLjUuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkv
bGlicHJveHlfMC41LjExLmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIERF
UEVORFMgPSAiZ2xpYi0yLjAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJwcm94
eS9saWJwcm94eTtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9JHtQVn0iCi1TUkNSRVYg
PSAiN2U0ODUyZjk2NTgwODRjNjFhOTU5NzNiOGExZDcyMGIxNzYzNDM3YSIKK1NSQ1JFViA9ICIz
ZmQzYTZlODQ1YzAzODZkOTFhYmM3NDI0NTNkMGYyOWJmMjhjNDA0IgogCiBpbmhlcml0IG1lc29u
IHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3BlY3Rpb24gdmFsYSBnaS1kb2NnZW4KIEdJRE9DR0VO
X01FU09OX09QVElPTiA9ICdkb2NzJwotLSAKMi40Ny4xCgo=

--===============4331717747180643528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (0 cached, 947 parsed). 1945 targets, 54 skipped, 0 masked, 0 errors.
Removing 28 recipes from the qemux86_64 sysroot...done.
Removing 28 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6b3002ef0f48ccb02a32fdd8ea726491c85746b2"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:6b3002ef0f48ccb02a32fdd8ea726491c85746b2"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 263 Local 254 Mirrors 0 Missed 9 Current 246 (96% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 261 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_populate_lic_setscene)
NOTE: Running setscene task 315 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 905 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_write_config)
NOTE: recipe libproxy-0.5.11-r0: task do_populate_lic_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libproxy-0.5.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libproxy-0.5.11-r0: task do_write_config: Started
NOTE: recipe libproxy-0.5.11-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_write_config: Succeeded
NOTE: Running setscene task 320 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libproxy-0.5.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libproxy-0.5.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 941 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 325 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata_setscene)
NOTE: recipe libproxy-0.5.11-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 351 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 947 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 362 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libpcre2/10.46/temp/log.do_packagedata_setscene.1839867
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 372 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_package_setscene)
NOTE: recipe libproxy-0.5.11-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 379 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running task 979 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_patch)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libproxy-0.5.11-r0: task do_patch: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 391 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 401 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/bash-completion/2.16.0/temp/log.do_packagedata_setscene.1840205
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 404 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 418 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 427 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 432 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 441 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 447 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 450 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 452 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 455 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 465 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 499 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 508 of 509 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1386 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata)
NOTE: Running task 1397 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata)
NOTE: Running task 1430 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata: Started
NOTE: recipe libproxy-0.5.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata: Succeeded
NOTE: Running task 1455 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_collect_spdx_deps)
NOTE: recipe libproxy-0.5.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libproxy-0.5.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1456 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_configure)
NOTE: recipe libproxy-0.5.11-r0: task do_configure: Started
NOTE: recipe libproxy-0.5.11-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_compile)
NOTE: recipe libproxy-0.5.11-r0: task do_compile: Started
NOTE: recipe libproxy-0.5.11-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_install)
NOTE: recipe libproxy-0.5.11-r0: task do_install: Started
NOTE: recipe libproxy-0.5.11-r0: task do_install: Succeeded
NOTE: Running task 1459 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package)
NOTE: Running task 1460 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_populate_sysroot)
NOTE: recipe libproxy-0.5.11-r0: task do_populate_sysroot: Started
NOTE: recipe libproxy-0.5.11-r0: task do_package: Started
NOTE: recipe libproxy-0.5.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_package: Succeeded
NOTE: Running task 1461 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_packagedata)
NOTE: recipe libproxy-0.5.11-r0: task do_packagedata: Started
NOTE: recipe libproxy-0.5.11-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_packagedata unihash changed to 25ed8db43cec2640416d3b4cfd9bd29ec3b82c45a73c986cda1cb31fcc45094c
NOTE: Setscene tasks completed
NOTE: Running task 1462 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_create_spdx)
NOTE: Running task 1463 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_write_ipk)
NOTE: Running task 1464 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_write_deb)
NOTE: Running task 1465 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_write_rpm)
NOTE: Running task 1466 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_qa)
NOTE: recipe libproxy-0.5.11-r0: task do_create_spdx: Started
NOTE: recipe libproxy-0.5.11-r0: task do_package_write_ipk: Started
NOTE: recipe libproxy-0.5.11-r0: task do_package_write_deb: Started
NOTE: recipe libproxy-0.5.11-r0: task do_package_write_rpm: Started
NOTE: recipe libproxy-0.5.11-r0: task do_package_qa: Started
NOTE: recipe libproxy-0.5.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1467 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_create_package_spdx)
NOTE: recipe libproxy-0.5.11-r0: task do_package_qa: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_create_package_spdx: Started
NOTE: recipe libproxy-0.5.11-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_qa unihash changed to 7ff79fcf1883359a214878df7de32de317b684c831823db12904f95e1e0f90e3
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_write_ipk unihash changed to 4ab1825526ee454cc5d7bd094b9314825e8e18b87eee5ab02f41d8dbe5e45fc9
NOTE: recipe libproxy-0.5.11-r0: task do_package_write_deb: Succeeded
NOTE: recipe libproxy-0.5.11-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_write_deb unihash changed to 8f854d01fec56df32e27173d3d9c927efe2ee9e53629e044423fe7ad4f51493b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_package_write_rpm unihash changed to 882263e8eafc6e7b7028ae81140f996e502515cd02c9b6cd7bc59de15b184c32
NOTE: recipe libproxy-0.5.11-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1468 of 1468 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libproxy/libproxy_0.5.11.bb:do_build)
NOTE: Tasks Summary: Attempted 1468 tasks of which 1447 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 23 ERROR messages, returning a non-zero exit code.
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
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-src went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dbg went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-extra went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-staticdev went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dev went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-doc went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-locale went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion went backwards which would break package feeds (from 0:2.17.0-r0 to 0:2.16.0-r0) [version-going-backwards]
ERROR: bash-completion-2.16.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4331717747180643528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.10", added "/usr/lib/libproxy.so.0.5.11"
Changes to packages/x86-64-v3-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.10 to libproxy.so.0.5.11
  /usr/lib/libproxy.so.0.5.10 moved to /usr/lib/libproxy.so.0.5.11

--===============4331717747180643528==--


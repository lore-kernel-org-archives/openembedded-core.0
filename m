Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74272D5E36C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17416.1765872165780540433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S0RKiHGY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BK+L+3Xq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262ee18a-b3a030d2-1f56-42c8-8ed8-285878e762db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QBVxQIBM8hh89aYAQBiBj4cS+7Oa/zYXTV7mCASvhjc=;
	b=S0RKiHGYmf9+UcCQYFJ0aYLd+jI45nYApxUAnAn0Am4KJm0vyIkFw2MMHkymnnj/
	NT7UPa4ygztoYDFE+vIh8RBiSjcs5u1HhgBkNLubRJ1YB8HLeJ+6lcBeadmoAemtX8i
	psnC3OrGoebIOEpWZ6Bb2zZlBZhhHO7boFxqMfrk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QBVxQIBM8hh89aYAQBiBj4cS+7Oa/zYXTV7mCASvhjc=;
	b=BK+L+3XqdvnAXVTLDhbHkVgwb5z4P7QVKq69e5oRhWZze3hPNzxTuL+T/iG0OkRQ
	RkAZnwg/1a1J8/+H/uyCpKYxL8hLC2NiEZ4I12MyhFaoVIyifi70LbY3w1JMy7lwMhl
	RaA1vLQO6u0/uJt7jHJOfIZlivte12f98t0p4tiY=
Content-Type: multipart/mixed; boundary="===============2202935805386080349=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.15 FAILED
Message-ID: <0101019b262ee18a-b3a030d2-1f56-42c8-8ed8-285878e762db-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227895

--===============2202935805386080349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-utils* to *1.2.15* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.14-1.2.15.patch
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
From a943f881e9a746e8c4d9bd88514a04579b10e233 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:56:04 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.14 -> 1.2.15

---
 .../alsa/{alsa-utils_1.2.14.bb => alsa-utils_1.2.15.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.14.bb => alsa-utils_1.2.15.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 3cbb9b464b..0ddaf63f60 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741"
+SRC_URI[sha256sum] = "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc6863f17b1f0b568e"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.47.1


--===============2202935805386080349==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.14-1.2.15.patch"

RnJvbSBhOTQzZjg4MWU5YTc0NmU4YzRkOWJkODg1MTRhMDQ1NzliMTBlMjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6NTY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXV0aWxzOiB1cGdyYWRlIDEuMi4xNCAtPiAxLjIuMTUKCi0tLQogLi4uL2Fsc2Eve2Fsc2Et
dXRpbHNfMS4yLjE0LmJiID0+IGFsc2EtdXRpbHNfMS4yLjE1LmJifSAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11dGlsc18xLjIuMTQuYmIgPT4gYWxzYS11
dGlsc18xLjIuMTUuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fs
c2EvYWxzYS11dGlsc18xLjIuMTUuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNS5iYgppbmRl
eCAzY2JiOWI0NjRiLi4wZGRhZjYzZjYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTUuYmIKQEAgLTI1LDcgKzI1LDcgQEAgUEFDS0FHRUNP
TkZJR1ttYW5wYWdlc10gPSAiLS1lbmFibGUteG1sdG8sIC0tZGlzYWJsZS14bWx0bywgeG1sdG8t
bmF0aXZlIGRvY2Jvb2sKIAogIyBhbHNhLXV0aWxzIHNwZWNpZmllZCBpbiBTUkNfVVJJIGR1ZSB0
byBhbHNhLXV0aWxzLXNjcmlwdHMgcmVjaXBlCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmFsc2Et
cHJvamVjdC5vcmcvZmlsZXMvcHViL3V0aWxzL2Fsc2EtdXRpbHMtJHtQVn0udGFyLmJ6MiIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIwNzk0Yzc0ZDMzZmVkOTQzZTdjNTA2MDljMTMwODllNDA5MzEy
YjZjNDAzZDZhZTg5ODRmYzQyOWMwOTYwNzQxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQzMTgz
ZDJlZDJkNjllOTE0M2M1YmViOTcwMzYyNjdjM2ZkYWJmZThiZmJlYThiYzY4NjNmMTdiMWYwYjU2
OGUiCiAKICMgT24gYnVpbGQgbWFjaGluZXMgd2l0aCBweXRob24tZG9jdXRpbHMgKG5vdCBweXRo
b24zLWRvY3V0aWxzICEhKSBpbnN0YWxsZWQKICMgcnN0Mm1hbiAobm90IHJzdDJtYW4ucHkpIGlz
IGRldGVjdGVkIGFuZCBjb21waWxlIGZhaWxzIHdpdGgKLS0gCjIuNDcuMQoK

--===============2202935805386080349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d86f7590e4b378e58d999ba5b426a8fb3e0ffcc3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:d86f7590e4b378e58d999ba5b426a8fb3e0ffcc3"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 173 Local 159 Mirrors 0 Missed 14 Current 619 (91% match, 98% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 717 of 792 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_populate_lic_setscene)
NOTE: Running setscene task 791 of 792 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-utils-1.2.15-r0: task do_populate_lic_setscene: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.15-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 792 of 792 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-utils-1.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1977 of 2199 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.15-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 2177 of 2199 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_unpack)
NOTE: Running task 2178 of 2199 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.15-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 2179 of 2199 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_patch)
NOTE: Running task 2180 of 2199 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_collect_spdx_deps)
NOTE: recipe alsa-utils-1.2.15-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.15-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2183 of 2199 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_configure)
NOTE: recipe alsa-utils-1.2.15-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.15-r0: task do_configure: Succeeded
NOTE: Running task 2184 of 2199 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_compile)
NOTE: recipe alsa-utils-1.2.15-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| Making all in include
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/include'
| make  all-am
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/include'
| Updating version.h
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/include'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/include'
| Making all in alsactl
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/alsactl'
| Making all in init
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/alsactl/init'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/alsactl/init'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/alsactl'
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-alsactl.o `test -f 'alsactl.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`alsactl.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-state.o `test -f 'state.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`state.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-lock.o `test -f 'lock.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`lock.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-utils.o `test -f 'utils.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`utils.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-wait.o `test -f 'wait.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`wait.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-init_parse.o `test -f 'init_parse.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`init_parse.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-init_ucm.o `test -f 'init_ucm.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`init_ucm.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-boot_params.o `test -f 'boot_params.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`boot_params.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-daemon.o `test -f 'daemon.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`daemon.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-monitor.o `test -f 'monitor.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`monitor.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-clean.o `test -f 'clean.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`clean.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-info.o `test -f 'info.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`info.c
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../sources/alsa-utils-1.2.15/alsactl -I../include  -I../../sources/alsa-utils-1.2.15/include  -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/sources/alsa-utils-1.2.15=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build=/usr/src/debug/alsa-utils/1.2.15  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linu
 x/alsa-utils/1.2.15/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/recipe-sysroot-native=  -pipe -c -o alsactl-export.o `test -f 'export.c' || echo '../../sources/alsa-utils-1.2.15/alsactl/'`export.c
| extratest=$(echo ' TEST=="/usr/sbin", TEST=="/usr/share/alsa",' | sed -e 's/__/ /g' -e 's/^ $//'); args=$(echo ' ' | sed -e 's/__/ /g' -e 's/^ $//'); sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' -e "s;@extratest\@;${extratest};g" -e "s;@args\@;${args};g" < ../../sources/alsa-utils-1.2.15/alsactl/conf/alsa-state.service.in > conf/alsa-state.service || rm conf/alsa-state.service
| extratest=$(echo ' TEST=="/usr/sbin", TEST=="/usr/share/alsa",' | sed -e 's/__/ /g' -e 's/^ $//'); args=$(echo ' ' | sed -e 's/__/ /g' -e 's/^ $//'); sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' -e "s;@extratest\@;${extratest};g" -e "s;@args\@;${args};g" < ../../sources/alsa-utils-1.2.15/alsactl/conf/alsa-restore.service.in > conf/alsa-restore.service || rm conf/alsa-restore.service
| extratest=$(echo ' TEST=="/usr/sbin", TEST=="/usr/share/alsa",' | sed -e 's/__/ /g' -e 's/^ $//'); args=$(echo ' ' | sed -e 's/__/ /g' -e 's/^ $//'); sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' -e "s;@extratest\@;${extratest};g" -e "s;@args\@;${args};g" < ../../sources/alsa-utils-1.2.15/alsactl/conf/alsa-card-wait@.service.in > conf/alsa-card-wait@.service || rm conf/alsa-card-wait@.service
| /bin/bash: conf/alsa-card-wait@.service: No such file or directory
| /bin/bash: conf/alsa-restore.service: No such file or directory
| /bin/bash: conf/alsa-state.service: No such file or directory
| rm: cannot remove 'conf/alsa-restore.service': No such file or directory
| rm: cannot remove 'conf/alsa-card-wait@.service': No such file or directory
| make[2]: *** [Makefile:1284: conf/alsa-restore.service] Error 1
| rm: cannot remove 'conf/alsa-state.service'make[2]: *** Waiting for unfinished jobs....
| make[2]: *** [Makefile:1287: conf/alsa-card-wait@.service] Error 1
| : No such file or directory
| make[2]: *** [Makefile:1281: conf/alsa-state.service] Error 1
| ../../sources/alsa-utils-1.2.15/alsactl/alsactl.c: In function 'main':
| ../../sources/alsa-utils-1.2.15/alsactl/alsactl.c:465:9: error: implicit declaration of function 'snd_lib_log_set_handler'; did you mean 'snd_lib_error_set_handler'? [-Wimplicit-function-declaration]
|   465 |         snd_lib_log_set_handler(log_handler);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
|       |         snd_lib_error_set_handler
| make[2]: *** [Makefile:638: alsactl-alsactl.o] Error 1
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c: In function 'log_handler':
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:202:14: error: implicit declaration of function 'snd_lib_log_filter' [-Wimplicit-function-declaration]
|   202 |         if (!snd_lib_log_filter(prio, interface, NULL))
|       |              ^~~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:205:17: error: implicit declaration of function 'snd_lib_log_priority' [-Wimplicit-function-declaration]
|   205 |         text1 = snd_lib_log_priority(prio);
|       |                 ^~~~~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:205:15: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
|   205 |         text1 = snd_lib_log_priority(prio);
|       |               ^
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:206:17: error: implicit declaration of function 'snd_lib_log_interface' [-Wimplicit-function-declaration]
|   206 |         text2 = snd_lib_log_interface(interface);
|       |                 ^~~~~~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:206:15: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
|   206 |         text2 = snd_lib_log_interface(interface);
|       |               ^
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c: In function 'initfailed':
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:94:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    94 |         (void)write(fp, str, strlen(str));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:95:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    95 |         (void)write(fp, ":", 1);
|       |               ^~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:96:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    96 |         (void)write(fp, reason, strlen(reason));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:97:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    97 |         (void)write(fp, ":", 1);
|       |               ^~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:98:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    98 |         (void)write(fp, sexitcode, strlen(sexitcode));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../sources/alsa-utils-1.2.15/alsactl/utils.c:99:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    99 |         (void)write(fp, "\n", 1);
|       |               ^~~~~~~~~~~~~~~~~~
| make[2]: *** [Makefile:680: alsactl-utils.o] Error 1
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/alsactl'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/build/alsactl'
| make[1]: *** [Makefile:956: all-recursive] Error 1
| make: *** [Makefile:474: all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440, line 182
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440, line 166
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440, line 161
| 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440, line 156
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440, line 151
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440, line 195
NOTE: recipe alsa-utils-1.2.15-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2184 tasks of which 2177 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216055542.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216055542.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/log.do_compile.2989440
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: alsa-utils-1.2.15-r0 do_compile: oe_runmake failed
ERROR: alsa-utils-1.2.15-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/run.do_compile.2989440' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/alsa-utils/1.2.15/temp/log.do_compile.2989440
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb:do_compile) failed with exit code '1'

--===============2202935805386080349==--


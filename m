Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F9BE77364
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.65012.1696183989899449159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QNlddezc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j8ov9Bwg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018aec71bd2f-54512cca-ede6-4239-89d8-ef940cfb52b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FulX6KcXX0h3NZ96hezmA6YqCfXmUPhl2aR98F9eeiE=;
	b=QNlddezcCieeKcyMsmSE8VkziTv6wsy7R/WvCMiCy3yJFWyFuoFXxoHv1kv8rBTd
	EgRSNWkeSZ4mDccGUIVXaJbptXSzQtVUOOF/9u+HGv45oDpgURkgtXkTQj5dHXd+SxQ
	MtCZLFDf6uZf+38OtUFP/RltgkL9GGOaXHRpMJYU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FulX6KcXX0h3NZ96hezmA6YqCfXmUPhl2aR98F9eeiE=;
	b=j8ov9BwgCvhBW0mF036Dl1kp4ItoQhHLy3aQqU28IMtwSmELbkuPAMZ3g27xbvtr
	isP5MWXK+ToWNwLBsGIz6dmZyj3YCRiLcRWdF/is+w3DrscYKj+1+Qz9gxH8GKDDNIE
	+TrTQR0tk+NZgXD465dmw7gHLMQz4R98ZOSHofrQ=
Content-Type: multipart/mixed; boundary="===============9168426779307735423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.22.6 SUCCEEDED
Message-ID: <0101018aec71bd2f-54512cca-ede6-4239-89d8-ef940cfb52b3-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188568

--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.22.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.22.5-1.22.6.patch
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
From 54a7644583227852c9cfc75579655137ab31213a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 16:29:11 +0000
Subject: [PATCH] gst-devtools: upgrade 1.22.5 -> 1.22.6

---
 .../{gst-devtools_1.22.5.bb => gst-devtools_1.22.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.5.bb => gst-devtools_1.22.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
index 3e029396a6..90bbd9c733 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "2add1519aa6eeb01d544cb94293688ee3bc2079f6bca6075bf5c23d00a0921be"
+SRC_URI[sha256sum] = "8928560efaf16137c30285e718708e5d0bab0777eb4ef8127e0274e120d3d86b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.39.2


--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2205.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2205.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2206.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2206.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 907753 to 907829 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0 /usr/lib/libgstvalidate-1.0.so.0.2205.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2206.0 /usr/lib/libgstvalidate-1.0.so.0.2206.0"
packages/core2-32-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.5.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.6.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-32-poky-linux/gst-devtools: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gst-devtools: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2205.0 to libgstvalidate-1.0.so.0.2206.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2205.0 to libgstvalidate-default-overrides-1.0.so.0.2206.0
  /usr/lib/libgstvalidate-1.0.so.0.2205.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2206.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2206.0

--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-945bb4be8a9588c58f65d4de17c391569ac8a556"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:945bb4be8a9588c58f65d4de17c391569ac8a556"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 32 Mirrors 0 Missed 28 Current 812 (53% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_recipe_qa)
NOTE: Running task 1893 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Started
NOTE: Running task 1934 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 2124 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2167 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_package)
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2168 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 2169 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_fetch)
NOTE: Running task 2229 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_write_config)
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Started
NOTE: Running task 2322 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 2323 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 2324 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2325 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 2326 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_patch)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 2327 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 2328 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2329 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2330 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_populate_lic)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 2331 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2333 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2335 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2337 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2339 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile)
NOTE: recipe pango-1.51.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2340 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2342 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2344 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: Running task 2345 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2346 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Failed
NOTE: recipe pango-1.51.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2346 tasks of which 2313 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata
Summary: There were 66 ERROR messages, returning a non-zero exit code.
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-src went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dbg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-ptest went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-staticdev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-doc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-bin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-as went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-be went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bn-in went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-cs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-da went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-de went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-el went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-en-gb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eo went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-es went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-et went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fur went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-gl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-he went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-id went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-it went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ja went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ko went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ky went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ml went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ms went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ne went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-oc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-or went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pa went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt-br went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ro went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ru went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-te went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ug went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-uk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-vi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/json-glib/1.6.6/temp/log.do_packagedata.589182
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata) failed with exit code '1'

--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-945bb4be8a9588c58f65d4de17c391569ac8a556"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:945bb4be8a9588c58f65d4de17c391569ac8a556"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 32 Mirrors 0 Missed 24 Current 816 (57% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_recipe_qa)
NOTE: Running task 1936 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 2030 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile_ptest_base)
NOTE: Running task 2129 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2233 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe pango-1.51.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Started
NOTE: recipe pango-1.51.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2328 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_install)
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2329 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 2330 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_fetch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2331 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_unpack)
NOTE: recipe pango-1.51.0-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 2332 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 2333 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 2334 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 2335 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 2336 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 2337 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2338 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_populate_lic)
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2340 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe pango-1.51.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2342 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot)
NOTE: Running task 2343 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_package)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_package: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2344 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2345 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2347 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe pango-1.51.0-r0: task do_package: Succeeded
NOTE: Running task 2348 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata)
NOTE: recipe pango-1.51.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2349 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2350 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2352 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: Running task 2356 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2357 of 2376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2357 tasks of which 2322 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata
Summary: There were 66 ERROR messages, returning a non-zero exit code.
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-src went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dbg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-ptest went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-staticdev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-doc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-bin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-as went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-be went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bn-in went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-cs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-da went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-de went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-el went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-en-gb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eo went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-es went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-et went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fur went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-gl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-he went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-id went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-it went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ja went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ko went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ky went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ml went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ms went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ne went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-oc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-or went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pa went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt-br went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ro went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ru went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-te went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ug went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-uk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-vi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/json-glib/1.6.6/temp/log.do_packagedata.569276
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata) failed with exit code '1'

--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-945bb4be8a9588c58f65d4de17c391569ac8a556"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:945bb4be8a9588c58f65d4de17c391569ac8a556"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 34 Mirrors 0 Missed 28 Current 818 (54% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 842 of 880 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 852 of 880 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_recipe_qa)
NOTE: Running task 1885 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1886 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1934 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 2144 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2246 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 2343 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 2344 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2345 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_fetch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2346 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 2347 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 2348 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 2349 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_patch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 2350 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2351 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_populate_lic)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 2352 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 2354 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_package)
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2355 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2356 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2359 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2361 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_configure: Succeeded
NOTE: Running task 2362 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2363 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile)
NOTE: recipe pango-1.51.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2364 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2366 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2368 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: Running task 2369 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Failed
NOTE: recipe pango-1.51.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2370 tasks of which 2336 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata
Summary: There were 66 ERROR messages, returning a non-zero exit code.
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-src went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dbg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-ptest went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-staticdev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-doc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-bin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-as went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-be went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bn-in went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-cs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-da went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-de went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-el went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-en-gb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eo went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-es went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-et went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fur went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-gl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-he went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-id went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-it went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ja went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ko went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ky went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ml went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ms went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ne went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-oc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-or went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pa went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt-br went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ro went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ru went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-te went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ug went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-uk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-vi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/json-glib/1.6.6/temp/log.do_packagedata.557265
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata) failed with exit code '1'

--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 77 recipes from the core2-32 sysroot...done.
Removing 82 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-945bb4be8a9588c58f65d4de17c391569ac8a556"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:945bb4be8a9588c58f65d4de17c391569ac8a556"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 547 Local 523 Mirrors 0 Missed 24 Current 334 (95% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 337 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.42.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.42.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 361 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 380 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.42.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.42.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe git-2.42.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 414 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 418 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.42.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1003 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_recipe_qa)
NOTE: Running task 1004 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_write_config)
NOTE: Running setscene task 432 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: Running task 1007 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1035 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_recipe_qa)
NOTE: Running task 1047 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 1052 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_write_config)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 435 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe git-2.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1070 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1072 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 454 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Started
NOTE: Running setscene task 468 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: Running setscene task 469 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 472 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1077 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_unpack)
NOTE: recipe mesa-2_23.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 477 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1087 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1089 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1095 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_unpack: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: Running setscene task 494 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_unpack)
NOTE: Running task 1144 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 521 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 522 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 531 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1160 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_patch)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 1161 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_patch)
NOTE: Running task 1162 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running task 1174 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe pango-1.51.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 586 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 1195 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1197 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 598 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running task 1202 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 604 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 606 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 609 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 629 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 633 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 635 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 636 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_populate_lic unihash changed to e033f8a7bb27866e578bbd0713ce65e92107740a942ef35dd17ef8f5fffbfc0c
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 646 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 666 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 672 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 757 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 762 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 771 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 779 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 799 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 805 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 876 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2057 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2088 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2332 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: Running task 2344 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2360 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2361 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe pango-1.51.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2362 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2363 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe pango-1.51.0-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2365 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile)
NOTE: recipe pango-1.51.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2367 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2369 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: Running task 2370 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2371 of 2401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Failed
NOTE: recipe pango-1.51.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2371 tasks of which 2334 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata
Summary: There were 66 ERROR messages, returning a non-zero exit code.
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-src went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dbg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-ptest went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-staticdev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-doc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-bin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-as went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-be went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bn-in went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-cs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-da went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-de went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-el went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-en-gb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eo went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-es went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-et went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fur went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-gl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-he went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-id went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-it went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ja went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ko went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ky went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ml went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ms went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ne went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-oc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-or went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pa went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt-br went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ro went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ru went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-te went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ug went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-uk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-vi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/json-glib/1.6.6/temp/log.do_packagedata.616063
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata) failed with exit code '1'

--===============9168426779307735423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.22.5-1.22.6.patch"

RnJvbSA1NGE3NjQ0NTgzMjI3ODUyYzljZmM3NTU3OTY1NTEzN2FiMzEyMTNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNjoyOToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjIyLjUgLT4gMS4yMi42CgotLS0KIC4uLi97Z3N0LWRldnRv
b2xzXzEuMjIuNS5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yMi42LmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWRldnRvb2xzXzEuMjIuNS5iYiA9
PiBnc3QtZGV2dG9vbHNfMS4yMi42LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi41LmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjIyLjYuYmIKc2ltaWxhcml0
eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29sc18xLjIyLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi42LmJiCmluZGV4IDNlMDI5Mzk2YTYuLjkwYmJk
OWM3MzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Qt
ZGV2dG9vbHNfMS4yMi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yMi42LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRv
b2xzLSR7UFZ9CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50
LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMmFkZDE1MTlhYTZlZWIwMWQ1NDRjYjk0MjkzNjg4ZWUzYmMyMDc5ZjZiY2E2MDc1
YmY1YzIzZDAwYTA5MjFiZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4OTI4NTYwZWZhZjE2MTM3
YzMwMjg1ZTcxODcwOGU1ZDBiYWIwNzc3ZWI0ZWY4MTI3ZTAyNzRlMTIwZDNkODZiIgogCiBERVBF
TkRTID0gImpzb24tZ2xpYiBnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoy
LjM5LjIKCg==

--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-945bb4be8a9588c58f65d4de17c391569ac8a556"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:945bb4be8a9588c58f65d4de17c391569ac8a556"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 32 Mirrors 0 Missed 28 Current 802 (53% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_recipe_qa)
NOTE: Running task 1885 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.6.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1886 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1934 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 2110 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2202 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 2291 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 2292 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: Running task 2293 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_fetch)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2294 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 2295 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 2296 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 2297 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_patch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 2298 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2300 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb:do_populate_lic)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2303 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe gst-devtools-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2304 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2305 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2307 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2309 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_configure: Succeeded
NOTE: Running task 2310 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2311 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile)
NOTE: recipe pango-1.51.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2312 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2314 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2316 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: Running task 2317 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2348 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Failed
NOTE: recipe pango-1.51.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2318 tasks of which 2284 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata
Summary: There were 66 ERROR messages, returning a non-zero exit code.
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-src went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dbg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-ptest went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-staticdev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-doc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-bin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-as went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-be went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bn-in went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-cs went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-da went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-de went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-el went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-en-gb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eo went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-es went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-et went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fur went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-gl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-he went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hu went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-id went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-it went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ja went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ko went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ky went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ml went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ms went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nb went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ne went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-oc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-or went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pa went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt-br went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ro went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ru went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sl went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sv went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-te went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tr went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ug went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-uk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-vi went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.6.6-r0) [version-going-backwards]
ERROR: json-glib-1.6.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/json-glib/1.6.6/temp/log.do_packagedata.579286
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata) failed with exit code '1'

--===============9168426779307735423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2205.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2206.0 /usr/lib/libgstvalidate-1.0.so.0.2206.0"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2205.0 to libgstvalidate-1.0.so.0.2206.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2205.0 to libgstvalidate-default-overrides-1.0.so.0.2206.0
  /usr/lib/libgstvalidate-1.0.so.0.2205.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2206.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2206.0

--===============9168426779307735423==--


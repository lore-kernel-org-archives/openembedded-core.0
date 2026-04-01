Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E17A10FCACE
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14656.1775054163475985309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CGAj1XIB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y0+Fd7pI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d497909aa-6313136b-2cca-4174-894c-85fdeb3ebaa2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3hqOAR5FJSjrYEevdHAkMs0EeegA2b6lNUI0y98U17c=;
	b=CGAj1XIB/ajTvnGDWAzO4iSeNHCsPNz5LBMMX2lSMFdXI/ISgVpsO6vDdNjKdqj8
	lwcxK3qkBDvfveJmOE6ilMn6J2aUiV3AovtCAdTTG/64rMYT1N5kbiG/FAO4JWjpMEA
	qIPHMVEPqCXDr9Mp9gkDoIaxAsVVdJApQXrUKdXc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3hqOAR5FJSjrYEevdHAkMs0EeegA2b6lNUI0y98U17c=;
	b=Y0+Fd7pIz3y9C8/Y72OXoQpslsch4jvQZterrkkVjS+tMPhN+vKw14HbNgpbqqMl
	dbEpK15aobSbgVlAEEgrOtfofh0N+qDnzgi/xj4qsERKlcC0gd8AjdlkVLlVXWyoUWf
	Q37aHVwa30aUUavuJpMq2Aq7KKCV9BKxte10yf0w=
Content-Type: multipart/mixed; boundary="===============7390706199798557728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.4.4 SUCCEEDED
Message-ID: <0101019d497909aa-6313136b-2cca-4174-894c-85fdeb3ebaa2-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234385

--===============7390706199798557728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.4.3-2.4.4.patch
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
From 3ca154e2f809b500ebc711a1eafa952dac857391 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:03:58 +0000
Subject: [PATCH] python3-numpy: upgrade 2.4.3 -> 2.4.4

---
 ...Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/0001-python-sysroot.patch            | 4 ++--
 .../python/python3-numpy/fix_reproducibility.patch            | 2 +-
 .../python/{python3-numpy_2.4.3.bb => python3-numpy_2.4.4.bb} | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.4.3.bb => python3-numpy_2.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3a77ffa4e0..22404757fe 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 5cb7316128845e3da1ce1618a42b2e3222b59ba9 Mon Sep 17 00:00:00 2001
+From 372ec5d5fb94fa029ee015152491b8b88b099b2a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
index b22c123493..df6853c81d 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
@@ -1,11 +1,11 @@
-From c40218577305f5953ef63d943c26a27c5a931770 Mon Sep 17 00:00:00 2001
+From 2635c925d507d5a6c3b0af10a564ca8f9252981c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 21 Jan 2026 14:12:36 +0000
 Subject: [PATCH] Add sysroot to pkgconfig libdir
 
 When Meson uses pkg-config to introspect the Python install it resets PKG_CONFIG_PATH
 and PKG_CONFIG_LIBDIR. However, when it writes to PKG_CONFIG_LIBDIR it uses the
-_target_ library directory without prefixing this with the sysroot, which breaks 
+_target_ library directory without prefixing this with the sysroot, which breaks
 the build if _LIBDIR is the primary search path.
 
 This has been fixed in Meson since 1.10.0[1] but numpy has a vendored fork of Meson
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 71b3634b77..4a8bb1015c 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 6fd79cbe7ae9f0a7a5fc4e5cd6c5c3da9ea09815 Mon Sep 17 00:00:00 2001
+From 8aca0d4aa45561bea3d86bc252d642c9c02e5d70 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb b/meta/recipes-devtools/python/python3-numpy_2.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.4.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.4.bb
index 7521a93f99..a8995b08df 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
+SRC_URI[sha256sum] = "2d390634c5182175533585cc89f3608a4682ccb173cc9bb940b2881c8d6f8fa0"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============7390706199798557728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses
 /numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/s
 rc/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-pack
 ages/numpy-2.4.4.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed

--===============7390706199798557728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-78d1913738173610ad8e645ad8b7f01ef7f28be2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:78d1913738173610ad8e645ad8b7f01ef7f28be2"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 579 Local 535 Mirrors 0 Missed 44 Current 324 (92% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 325 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 326 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 337 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 354 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 363 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 368 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 371 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 374 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 380 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 386 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 397 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 402 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 407 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 413 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 415 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_populate_lic_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 418 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 425 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 448 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 451 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 452 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 453 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_package_write_deb_setscene)
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 469 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 475 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 497 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 498 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 504 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 539 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.151.9/temp/log.do_packagedata_setscene.3522482
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 574 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_package_setscene)
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 595 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 603 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 605 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 629 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 631 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 836 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 903 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_write_config)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1003 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1005 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_recipe_qa: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1013 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_write_config: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.10.2-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1095 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1108 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1109 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-2.4.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 702 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 713 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1208 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_unpack)
NOTE: Running task 1209 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1298 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1302 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Started
NOTE: Running task 1344 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_create_recipe_spdx)
NOTE: Running task 1353 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_recipe_spdx)
NOTE: Running task 1355 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-numpy-2.4.4-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1358 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_patch)
NOTE: recipe python3-numpy-2.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1359 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_unpack)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe meson-1.10.2-r0: task do_fetch: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe meson-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1375 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_unpack)
NOTE: recipe python3-numpy-2.4.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1377 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 742 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 747 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe meson-1.10.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 754 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_package_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 768 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe meson-1.10.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1398 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1399 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 780 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 787 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running task 1435 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch unihash changed to 14c3da509de6ca7f88b4235abf770193bc9f8e914abf35976c8102245136ed78
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-1.10.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 808 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-2.4.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 809 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 825 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running task 1453 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_patch)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1454 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.4.4-r0: task do_patch: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 861 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1466 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe meson-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 874 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_package_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1539 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 884 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 887 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 06a429fce6a95c0bf16b34a3762c6a2a28b10d81a3fc81207189b55aa79cf101 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b408cfe686e8f1a7d251b2dc45e4d95e906526a12de757dbfe2ba2451e5fecc4', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '06a429fce6a95c0bf16b34a3762c6a2a28b10d81a3fc81207189b55aa79cf101'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b408cfe686e8f1a7d251b2dc45e4d95e906526a12de757dbfe2ba2451e5fecc4 -> 06a429fce6a95c0bf16b34a3762c6a2a28b10d81a3fc81207189b55aa79cf101 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 1553 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 894 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 903 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1868 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1998 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1999 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2023 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb:do_packagedata)
NOTE: Running task 2074 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2181 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk)
NOTE: recipe python3-numpy-2.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2182 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_deb)
NOTE: Running task 2183 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: Running task 2184 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe meson-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_ipk: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_deb: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_rpm: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_qa: Started
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 2185 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_patch)
NOTE: recipe ninja-1.13.2-r0: task do_patch: Started
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.151.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2186 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2192 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_configure)
NOTE: Running task 2193 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_configure)
NOTE: recipe python3-numpy-2.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_configure)
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_deploy_source_date_epoch unihash changed to 70ac6b7a48a890b33adaa8fc9fdd10546d7b9ab5ba4a1edc8b3becae48504738
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running noexec task 2195 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_configure)
NOTE: Running task 2196 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_compile)
NOTE: recipe python3-numpy-2.4.4-r0: task do_configure: Started
NOTE: recipe meson-1.10.2-r0: task do_configure: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_compile)
NOTE: Running task 2198 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_compile)
NOTE: recipe python3-numpy-2.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2199 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_configure_ptest_base)
NOTE: recipe meson-1.10.2-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2200 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_compile)
NOTE: recipe python3-numpy-2.4.4-r0: task do_compile: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 2202 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package)
NOTE: Running task 2203 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2204 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_install: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa unihash changed to 193ffa13a7e8f3c7142ef8fbadee3f6c5938873bcb82fc4cfc9a834ea51c89e0
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2205 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Succeeded
NOTE: Running task 2206 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata)
NOTE: recipe ninja-1.13.2-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata unihash changed to 48e5fcf70d5b5fbfb08a2b52072e6efa47ef07c0707814a0d70cc979e7bd3dd0
NOTE: Setscene tasks completed
NOTE: Running task 2208 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx)
NOTE: Running task 2209 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk)
NOTE: Running task 2210 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb)
NOTE: Running task 2211 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm)
NOTE: Running task 2212 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa unihash changed to 941403d83423f0772317c15c76c2b9e51121922ad6aaccffb488925ef0a2ab82
NOTE: Running task 2213 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_package)
NOTE: Running task 2214 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk unihash changed to fff890992c13ac0ea260cf84da0a737f6324788cc634b674c2a6353dd4281c6b
NOTE: recipe meson-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe meson-1.10.2-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb unihash changed to 8a42541d07a430bff641917a1f3fdd74f6b3075e536937fac87fd0c872b8d9ef
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm unihash changed to 2504db1f9879d2aa20291401f8848378fdf89a3b04e3834379ff3e8ac9cba252
NOTE: recipe meson-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_package: Succeeded
NOTE: Running task 2215 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_packagedata)
NOTE: recipe ninja-1.13.2-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 2216 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_packagedata)
NOTE: recipe meson-1.10.2-r0: task do_packagedata: Started
NOTE: recipe meson-1.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2217 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_create_spdx)
NOTE: Running task 2218 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_package_write_ipk)
NOTE: Running task 2219 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_package_write_deb)
NOTE: Running task 2220 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_package_write_rpm)
NOTE: Running task 2221 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_package_qa)
NOTE: recipe meson-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe meson-1.10.2-r0: task do_package_write_ipk: Started
NOTE: recipe meson-1.10.2-r0: task do_package_write_deb: Started
NOTE: recipe meson-1.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe meson-1.10.2-r0: task do_package_qa: Started
NOTE: recipe meson-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_package_qa: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe meson-1.10.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-2.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2223 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_install)
NOTE: recipe python3-numpy-2.4.4-r0: task do_install: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-2.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2225 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_package)
NOTE: Running task 2226 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-2.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_package: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_packagedata)
NOTE: recipe python3-numpy-2.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2228 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_create_spdx)
NOTE: Running task 2229 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_package_write_ipk)
NOTE: Running task 2230 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_package_write_deb)
NOTE: Running task 2231 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_package_write_rpm)
NOTE: Running task 2232 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_package_qa)
NOTE: recipe python3-numpy-2.4.4-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2233 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_create_package_spdx)
NOTE: recipe python3-numpy-2.4.4-r0: task do_create_package_spdx: Started
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-numpy-2.4.4-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2234 of 2234 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2234 tasks of which 2151 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.151.10-r0 to 0:6.151.9-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.151.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7390706199798557728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.4.3/numpy-2.4.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest file://0001-python-sysroot.patch" to "https://github.com/numpy/numpy/releases/download/v2.4.4/numpy-2.4.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest file://0001-python-sysroot.patch"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 96510704 to 96510832 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 25247654 to 25248714 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/_common.cpython-314-x86_64-li
 nux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.4.4/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/mt19937 -> /usr/src/debug/
 python3-numpy/2.4.4/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/common, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/include -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/multiarray -> 
 /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/_b
 ounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/fft -> /usr/src/debug/python3-numpy/2.4.4/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/linalg -> /usr/src/debug/python3-numpy/2.4.4/n
 umpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/_pcg64.c
 python-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.4/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.4.4/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.4.3/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.4.4/numpy/_core/src/multiarray/textreading
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 356222 to 356214 (-0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.4.3" to "2.4.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40281288 to 40291188 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/s
 ite-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages
 /numpy-2.4.4.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licens
 es/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info/licenses/numpy/random/src/pcg64
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.4.3 [default] to 2.4.4 [default]
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.4.3.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.4.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed

--===============7390706199798557728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.4.3-2.4.4.patch"

RnJvbSAzY2ExNTRlMmY4MDliNTAwZWJjNzExYTFlYWZhOTUyZGFjODU3MzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDowMzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMi40LjMgLT4gMi40LjQKCi0tLQogLi4uRG9uLXQtc2VhcmNo
LXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCB8IDIgKy0KIC4u
Li9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLXB5dGhvbi1zeXNyb290LnBhdGNoICAgICAgICAg
ICAgfCA0ICsrLS0KIC4uLi9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5
LnBhdGNoICAgICAgICAgICAgfCAyICstCiAuLi4vcHl0aG9uL3tweXRob24zLW51bXB5XzIuNC4z
LmJiID0+IHB5dGhvbjMtbnVtcHlfMi40LjQuYmJ9IHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8yLjQuMy5iYiA9PiBweXRob24zLW51bXB5XzIuNC40
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMt
YnktZGVmYXVsdC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRl
ZmF1bHQtLnBhdGNoCmluZGV4IDNhNzdmZmE0ZTAuLjIyNDA0NzU3ZmUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJj
aC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNo
LXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNWNiNzMxNjEyODg0NWUzZGExY2UxNjE4YTQyYjJlMzIyMmI1OWJhOSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzcyZWM1ZDVmYjk0ZmEwMjllZTAxNTE1MjQ5MWI4
Yjg4YjA5OWIyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMCBEZWMgMjAxNSAxMzoy
MDozMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBzZWFyY2ggL3VzciBhbmQgc28gb24g
Zm9yIGxpYnJhcmllcyBieSBkZWZhdWx0IHRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1weXRob24tc3lzcm9vdC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLXB5dGhvbi1zeXNy
b290LnBhdGNoCmluZGV4IGIyMmMxMjM0OTMuLmRmNjg1M2M4MWQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLXB5dGhvbi1zeXNyb290
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8w
MDAxLXB5dGhvbi1zeXNyb290LnBhdGNoCkBAIC0xLDExICsxLDExIEBACi1Gcm9tIGM0MDIxODU3
NzMwNWY1OTUzZWY2M2Q5NDNjMjZhMjdjNWE5MzE3NzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDI2MzVjOTI1ZDUwN2Q1YTZjM2IwYWYxMGE1NjRjYThmOTI1Mjk4MWMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4K
IERhdGU6IFdlZCwgMjEgSmFuIDIwMjYgMTQ6MTI6MzYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
QWRkIHN5c3Jvb3QgdG8gcGtnY29uZmlnIGxpYmRpcgogCiBXaGVuIE1lc29uIHVzZXMgcGtnLWNv
bmZpZyB0byBpbnRyb3NwZWN0IHRoZSBQeXRob24gaW5zdGFsbCBpdCByZXNldHMgUEtHX0NPTkZJ
R19QQVRICiBhbmQgUEtHX0NPTkZJR19MSUJESVIuIEhvd2V2ZXIsIHdoZW4gaXQgd3JpdGVzIHRv
IFBLR19DT05GSUdfTElCRElSIGl0IHVzZXMgdGhlCi1fdGFyZ2V0XyBsaWJyYXJ5IGRpcmVjdG9y
eSB3aXRob3V0IHByZWZpeGluZyB0aGlzIHdpdGggdGhlIHN5c3Jvb3QsIHdoaWNoIGJyZWFrcyAK
K190YXJnZXRfIGxpYnJhcnkgZGlyZWN0b3J5IHdpdGhvdXQgcHJlZml4aW5nIHRoaXMgd2l0aCB0
aGUgc3lzcm9vdCwgd2hpY2ggYnJlYWtzCiB0aGUgYnVpbGQgaWYgX0xJQkRJUiBpcyB0aGUgcHJp
bWFyeSBzZWFyY2ggcGF0aC4KIAogVGhpcyBoYXMgYmVlbiBmaXhlZCBpbiBNZXNvbiBzaW5jZSAx
LjEwLjBbMV0gYnV0IG51bXB5IGhhcyBhIHZlbmRvcmVkIGZvcmsgb2YgTWVzb24KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9k
dWNpYmlsaXR5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51
bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2gKaW5kZXggNzFiMzYzNGI3Ny4uNGE4YmIxMDE1
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDZmZDc5Y2JlN2FlOWYwYTdhNWZjNGU1Y2Q2YzVjM2RhOWVhMDk4MTUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhhY2EwZDRhYTQ1NTYxYmVhM2Q4NmJjMjUyZDY0MmM5
YzAyZTVkNzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8
cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjkgU2VwIDIw
MjMgMjI6NTM6MjQgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gVGhpcyByZWdleCBkZWNpZGVzIHdo
ZXRoZXIgdG8gdXNlIE8zIG9waW1pc2F0aW9uIG9uIG51bXB5IG9yCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi40LjMuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi40LjQuYmIKc2ltaWxhcml0eSBp
bmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzIuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbnVtcHlfMi40LjQuYmIKaW5kZXggNzUyMWE5M2Y5OS4uYTg5OTViMDhkZiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNC4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjQuNC5i
YgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9h
ZC92JHtQVn0vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVu
LXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uLXN5c3Jvb3QucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDgzYTIwMTIwMmI3MzQ5NWYwMGRi
YzgzNzk2YzZhZTYzMTM3YTliZGFkZTA3NGY3NjQ4YjNlMzI2MTM0MTJkZCIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIyZDM5MDYzNGM1MTgyMTc1NTMzNTg1Y2M4OWYzNjA4YTQ2ODJjY2IxNzNjYzli
Yjk0MGIyODgxYzhkNmY4ZmEwIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIu
Y29tL251bXB5L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFz
ZXMvdGFnL3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIuNDcuMQoK

--===============7390706199798557728==--


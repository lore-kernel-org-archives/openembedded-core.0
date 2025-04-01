Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9316DC369AB
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18037.1743511387671847570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=c3hQy+Eo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JoVhUsM6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010195f160a1af-0381dcfb-5da6-423d-826f-2de712b2b0fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tb6sRbtnC+cXXgWs5WPQUBliizyFqkiAbYYtS80cdsU=;
	b=c3hQy+EoNED2bGSwvCBOwaGTp0GJ2xQYUm06IHVA5dQo03l8lQv/wCtJVhx+cdvE
	8zkmcy5P7hbWSWS3olT0Nu+wDV9ElkuvWuAgnJLfFHslOsEOZ/F6TGAaYJqBNmq4QRN
	7pGIL4GHjHQS1IjC5VHIJ/0EvK+hJg+kQH56xNvU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tb6sRbtnC+cXXgWs5WPQUBliizyFqkiAbYYtS80cdsU=;
	b=JoVhUsM6iMRXoBhhla/g9bjFIjDXeFcod0rVePhLCl0BluttgrFzJSwiGqPiBTeu
	6WxHHDda82zYjI9CobDRI2jOsoCALryvB7sUMKcPzoitRfAYYXuUzKdGENKvW3tHfLw
	/UnNNMhpMk3j/n0cCBiqnc8snTO+HnN5gqeGZY2E=
Content-Type: multipart/mixed; boundary="===============2986276387124505881=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.2.4 SUCCEEDED
Message-ID: <01010195f160a1af-0381dcfb-5da6-423d-826f-2de712b2b0fd-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214060

--===============2986276387124505881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.2.3-2.2.4.patch
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
From 0b3d7b99a6c1b411628a1e661b07460c81d54866 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:02:47 +0000
Subject: [PATCH] python3-numpy: upgrade 2.2.3 -> 2.2.4

---
 ...1-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/fix_reproducibility.patch              | 2 +-
 .../python/{python3-numpy_2.2.3.bb => python3-numpy_2.2.4.bb}   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.3.bb => python3-numpy_2.2.4.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 437bafb54f..3e08b43587 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From ad6c0196e4c97ca37368610c010e46c90a4749b4 Mon Sep 17 00:00:00 2001
+From b036c984b019d941ead2efd5a05d1588c4bc193a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 514073d94e..8b39b7bcfe 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 061a8ae1d1d000892d6dba89a444922e7a28804b Mon Sep 17 00:00:00 2001
+From 45d76002bc989a9098141f2bfcd2d2fabc5a04d5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.3.bb b/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.4.bb
index db9a99946c..a2ee2b48d4 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "dbdc15f0c81611925f382dfa97b3bd0bc2c1ce19d4fe50482cb0ddc12ba30020"
+SRC_URI[sha256sum] = "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530c378fb8331d4f"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============2986276387124505881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.2.3.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.2.4.dist-info, added "/usr/lib/python3.13/site-packages/numpy/linalg/lapack_lite.pyi /usr/lib/python3.13/site-packages/numpy/_utils/_inspect.pyi /usr/lib/python3.13/site-packages/numpy/_core/_dtype_ctypes.pyi /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi /usr/lib/python3.13/site-packages/numpy/_core/_dtype.pyi /usr/lib/python3.13/site-packages/numpy/_pyinstaller/hook-numpy.pyi /usr/lib/python3.13/site-packages/numpy/_utils/_convertions.pyi /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi /usr/lib/python3.13/site-packages/numpy/core/overrides.pyi /usr/lib/python3.13/site-packages/numpy/_core/_string_helpers.pyi /usr/lib/python3.13/site-packages/numpy/random/_pickle.pyi /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs
 _scalars.pyi /usr/lib/python3.13/site-packages/numpy/_pyinstaller/__init__.pyi /usr/lib/python3.13/site-packages/numpy/_core/printoptions.pyi /usr/lib/python3.13/site-packages/numpy/_core/_exceptions.pyi /usr/lib/python3.13/site-packages/numpy/_utils/__init__.pyi /usr/lib/python3.13/site-packages/numpy/core/_dtype_ctypes.pyi /usr/lib/python3.13/site-packages/numpy/_utils/_pep440.pyi /usr/lib/python3.13/site-packages/numpy/_core/_methods.pyi /usr/lib/python3.13/site-packages/numpy/core/_dtype.pyi /usr/lib/python3.13/site-packages/numpy/linalg/_umath_linalg.pyi /usr/lib/python3.13/site-packages/numpy/_core/umath.pyi /usr/lib/python3.13/site-packages/numpy/_core/overrides.pyi /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs.pyi /usr/lib/python3.13/site-packages/numpy/_core/_simd.pyi"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.2.3.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.2.4.dist-info
  /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs_scalars.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_dtype_ctypes.pyi was added
  /usr/lib/python3.13/site-packages/numpy/core/_dtype_ctypes.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_dtype.pyi was added
  /usr/lib/python3.13/site-packages/numpy/core/_dtype.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_exceptions.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_methods.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/overrides.pyi was added
  /usr/lib/python3.13/site-packages/numpy/core/overrides.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/printoptions.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_simd.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_string_helpers.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/umath.pyi was added
  /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi was added
  /usr/lib/python3.13/site-packages/numpy/linalg/lapack_lite.pyi was added
  /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi was added
  /usr/lib/python3.13/site-packages/numpy/linalg/_umath_linalg.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_pyinstaller/hook-numpy.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_pyinstaller/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/random/_pickle.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/_convertions.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/_inspect.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/_pep440.pyi was added

--===============2986276387124505881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (0 cached, 924 parsed). 1887 targets, 50 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 65 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4934e5989e9a77e9904c6d3a5a36ec1a2a73855a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 519 Local 509 Mirrors 0 Missed 10 Current 287 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 289 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 306 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 307 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 312 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 316 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 317 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 320 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 321 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 322 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 323 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 325 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 350 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_populate_lic_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 351 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 353 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 360 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 361 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 368 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 373 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 374 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 397 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 399 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 401 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 416 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 417 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 418 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 419 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-iniconfig/2.0.0/temp/log.do_packagedata_setscene.3638907
NOTE: Running setscene task 427 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 428 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 535 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.129.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 550 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 615 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 625 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 735 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1079 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.4-r0: task do_fetch: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1208 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_unpack)
NOTE: Running task 1224 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_write_config)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.2.4-r0: task do_unpack: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_write_config: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1539 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.2.4-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-2.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_deploy_source_date_epoch unihash changed to 364b72cd828492dac70ebb78b3cdec93809fbb782e7e8370758207f76f3f0fe7
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1890 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-2.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2177 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: Running task 2188 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-2.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2241 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_configure)
NOTE: recipe python3-numpy-2.2.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-2.2.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2243 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_compile)
NOTE: recipe python3-numpy-2.2.4-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-2.2.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2245 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_install)
NOTE: recipe python3-numpy-2.2.4-r0: task do_install: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_install: Succeeded
NOTE: Running task 2246 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-2.2.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2247 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package)
NOTE: Running task 2248 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-2.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_package: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_populate_sysroot unihash changed to 36a97c2e4bc93fd7986f844162963a0e0741a5057880d874d8e78c8c15ae0afb
NOTE: Setscene tasks completed
NOTE: recipe python3-numpy-2.2.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package unihash changed to bcf6726cb8b1603c0aece13577177fb878c2c9d129f52b3f96c71fc037e1f732
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_packagedata became valid
NOTE: Running setscene task 806 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2250 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_create_spdx)
NOTE: Running task 2251 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_write_ipk)
NOTE: Running task 2252 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_write_deb)
NOTE: Running task 2253 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_write_rpm)
NOTE: Running task 2254 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_qa)
NOTE: recipe python3-numpy-2.2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_write_ipk unihash changed to e9fdfedaa3ac72dc1f206dcaf56047a26c7e0548502b8c4297ea7c1e848a8d0f
NOTE: recipe python3-numpy-2.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2255 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_create_package_spdx)
NOTE: recipe python3-numpy-2.2.4-r0: task do_create_package_spdx: Started
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_qa unihash changed to 2e857a846bd39346f5ca89f604d24256f93dd8653fb23b78aa50290428961617
NOTE: recipe python3-numpy-2.2.4-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_write_rpm unihash changed to f7de7b46ec276d1069b1fc3d21c53c7e4aa7b7c403e9f097433b7621a8e2744e
NOTE: recipe python3-numpy-2.2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_package_write_deb unihash changed to 8956fcb9f8a5f98a7eebd4e2ea177af3b0faa232ded21e54d4de1fe28a83d9f7
NOTE: Running noexec task 2256 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2256 tasks of which 2233 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-src went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-dbg went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-staticdev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-dev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-doc went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-locale went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2986276387124505881==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.2.3-2.2.4.patch"

RnJvbSAwYjNkN2I5OWE2YzFiNDExNjI4YTFlNjYxYjA3NDYwYzgxZDU0ODY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOTowMjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMi4yLjMgLT4gMi4yLjQKCi0tLQogLi4uMS1Eb24tdC1zZWFy
Y2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoIHwgMiArLQog
Li4uL3B5dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggICAgICAg
ICAgICAgIHwgMiArLQogLi4uL3B5dGhvbi97cHl0aG9uMy1udW1weV8yLjIuMy5iYiA9PiBweXRo
b24zLW51bXB5XzIuMi40LmJifSAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1udW1weV8yLjIuMy5iYiA9PiBweXRob24zLW51bXB5XzIuMi40LmJifSAoOTYl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVs
dC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAw
MS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBh
dGNoCmluZGV4IDQzN2JhZmI1NGYuLjNlMDhiNDM1ODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5k
LXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQt
c28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYWQ2YzAxOTZlNGM5N2NhMzczNjg2MTBjMDEwZTQ2YzkwYTQ3NDliNCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYjAzNmM5ODRiMDE5ZDk0MWVhZDJlZmQ1YTA1ZDE1ODhjNGJjMTkz
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMCBEZWMgMjAxNSAxMzoyMDozMCArMDIw
MAogU3ViamVjdDogW1BBVENIXSBEb24ndCBzZWFyY2ggL3VzciBhbmQgc28gb24gZm9yIGxpYnJh
cmllcyBieSBkZWZhdWx0IHRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNo
CmluZGV4IDUxNDA3M2Q5NGUuLjhiMzliN2JjZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9k
dWNpYmlsaXR5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwNjFhOGFlMWQxZDAwMDg5MmQ2
ZGJhODlhNDQ0OTIyZTdhMjg4MDRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NWQ3
NjAwMmJjOTg5YTkwOTgxNDFmMmJmY2QyZDJmYWJjNWEwNGQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CiBEYXRlOiBGcmksIDI5IFNlcCAyMDIzIDIyOjUzOjI0ICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIFRoaXMgcmVnZXggZGVjaWRlcyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBv
biBudW1weSBvcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW51bXB5XzIuMi4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzIuMi40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjIuMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuMi40LmJiCmluZGV4IGRi
OWE5OTk0NmMuLmEyZWUyYjQ4ZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1udW1weV8yLjIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4yLjQuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9
ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFy
Lmd6IFwKICAgICAgICAgICAgZmlsZTovL2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImRiZGMxNWYwYzgxNjExOTI1ZjM4MmRmYTk3YjNiZDBiYzJjMWNlMTlkNGZlNTA0ODJj
YjBkZGMxMmJhMzAwMjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWJhMDM2OTJhNDVkM2VlZjY2
NTU5ZWZlMWQxMDk2YzRiOWI3NWMwOTg2YjVkZmY1NTMwYzM3OGZiODMzMWQ0ZiIKIAogR0lUSFVC
X0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9yZWxlYXNlcyIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykr
KSQiCi0tIAoyLjQ3LjEKCg==

--===============2986276387124505881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.2.3/numpy-2.2.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.2.4/numpy-2.2.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-64-poky-linux/python3-numpy: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 119568760 to 119569656 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 24363980 to 24364938 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 361118 to 361142 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 41765668 to 41822090 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PV changed from "2.2.3" to "2.2.4"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.2.3.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.2.4.dist-info, added "/usr/lib/python3.13/site-packages/numpy/core/_dtype_ctypes.pyi /usr/lib/python3.13/site-packages/numpy/_utils/__init__.pyi /usr/lib/python3.13/site-packages/numpy/_core/_simd.pyi /usr/lib/python3.13/site-packages/numpy/_core/overrides.pyi /usr/lib/python3.13/site-packages/numpy/_pyinstaller/__init__.pyi /usr/lib/python3.13/site-packages/numpy/_core/_string_helpers.pyi /usr/lib/python3.13/site-packages/numpy/core/overrides.pyi /usr/lib/python3.13/site-packages/numpy/_utils/_pep440.pyi /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi /usr/lib/python3.13/site-packages/numpy/_core/_methods.pyi /usr/lib/python3.13/site-packages/numpy/_core/_dtype.pyi /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs.pyi /usr/lib/python3.13/site-packages/numpy/linalg/lapack_lite.pyi 
 /usr/lib/python3.13/site-packages/numpy/_core/_dtype_ctypes.pyi /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs_scalars.pyi /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi /usr/lib/python3.13/site-packages/numpy/_core/umath.pyi /usr/lib/python3.13/site-packages/numpy/_utils/_convertions.pyi /usr/lib/python3.13/site-packages/numpy/_utils/_inspect.pyi /usr/lib/python3.13/site-packages/numpy/linalg/_umath_linalg.pyi /usr/lib/python3.13/site-packages/numpy/core/_dtype.pyi /usr/lib/python3.13/site-packages/numpy/_core/_exceptions.pyi /usr/lib/python3.13/site-packages/numpy/_pyinstaller/hook-numpy.pyi /usr/lib/python3.13/site-packages/numpy/_core/printoptions.pyi /usr/lib/python3.13/site-packages/numpy/random/_pickle.pyi"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.2.3.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.2.4.dist-info
  /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_add_newdocs_scalars.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_dtype_ctypes.pyi was added
  /usr/lib/python3.13/site-packages/numpy/core/_dtype_ctypes.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_dtype.pyi was added
  /usr/lib/python3.13/site-packages/numpy/core/_dtype.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_exceptions.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_machar.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_methods.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/overrides.pyi was added
  /usr/lib/python3.13/site-packages/numpy/core/overrides.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/printoptions.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_simd.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/_string_helpers.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_core/umath.pyi was added
  /usr/lib/python3.13/site-packages/numpy/fft/helper.pyi was added
  /usr/lib/python3.13/site-packages/numpy/linalg/lapack_lite.pyi was added
  /usr/lib/python3.13/site-packages/numpy/linalg/linalg.pyi was added
  /usr/lib/python3.13/site-packages/numpy/linalg/_umath_linalg.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_pyinstaller/hook-numpy.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_pyinstaller/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/random/_pickle.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/_convertions.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/_inspect.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_utils/_pep440.pyi was added

--===============2986276387124505881==--


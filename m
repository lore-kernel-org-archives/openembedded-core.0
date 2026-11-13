Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5925.1794551757026845379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B2xtAUSt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pUA5wDoP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1d39eb518-267abb80-993e-4e20-a1d2-dc3372e926ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794551756;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=EAm4+XsVVLdp2qNkpDqizmO65zbz17ICf34eayvd6Hk=;
	b=B2xtAUStGLpxMdy3cHY3O1oVIOQuSJAotV+r+UhR9qmoYhS8f5Tm6SL+N+x/2JOj
	K5gTKRpUNQKmnpz8W2o5iO5+IN4EMEdp7SMeUO4DDkTLkxe3YPFpsDA/BBDyOuhUOzG
	AMwERC5KvGiuQIjXHSU4Ap/kdEVwxgl+rJZ2VAvc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794551756;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=EAm4+XsVVLdp2qNkpDqizmO65zbz17ICf34eayvd6Hk=;
	b=pUA5wDoP00aMjHh6wwk8bPKdAFTJ28mdoJmFkurJ4uxvOzpdBa37ZHA2x9orlRjW
	zd94w3HRTVsooAffz1+31tck5yQX4n1ZPA2RD2fyRxlV+DrUrOrkTWN1emiO0BnL1zB
	t9wtMXMJliLWoaxU6TGzADvVJuWh1qFIuyA5kwDA=
Content-Type: multipart/mixed; boundary="===============5421632010097109146=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake,cmake-native: upgrading to 4.5.0 FAILED
Message-ID: <010101a1d39eb518-267abb80-993e-4e20-a1d2-dc3372e926ec-000000@us-west-2.amazonses.com>
Date: Fri, 13 Nov 2026 06:35:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.13-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250142

--===============5421632010097109146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.5.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-4.4.5-4.5.0.patch
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
From acb4b195876411730d3c8a0d0adb950aa4a3bc16 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 13 Nov 2026 05:11:16 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 4.4.5 -> 4.5.0

---
 .../cmake/{cmake-native_4.4.5.bb => cmake-native_4.5.0.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.5.bb => cmake_4.5.0.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.5.bb => cmake-native_4.5.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.5.bb => cmake_4.5.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.5.bb b/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 30294fd9b8..01fe71c119 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309910288886e04e2"
+SRC_URI[sha256sum] = "424352d6133e8455e020da787008e8dc67abb18820af3532572ab35657e49213"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.5.bb b/meta/recipes-devtools/cmake/cmake_4.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.5.bb
rename to meta/recipes-devtools/cmake/cmake_4.5.0.bb
-- 
2.47.1


--===============5421632010097109146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-native-changelog.txt"

CMake 3.18 Release Notes
************************

.. only:: html
  .. contents::
Changes made since CMake 3.17 include the following.

New Features
============

Languages
---------

Command-Line
------------

Commands
--------

Variables
---------

Properties
----------

Modules
-------

Generator Expressions
---------------------

CTest
-----

CPack
-----

Other
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 3.18.0 include the following.

3.18.1
------

3.18.2
------

3.18.3
------

CMake 3.6 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 3.5 include the following.

New Features
============

Generators
----------

Commands
--------

Variables
---------

Properties
----------

Modules
-------

Platforms
---------

CTest
-----

CPack
-----

<PackageName>_<VersionNumber>-<DebianRevisionNumber>_<DebianArchitecture>.deb

  For backward compatibility this feature is disabled by default. See
  :variable:`CPACK_DEBIAN_FILE_NAME` and
  :variable:`CPACK_DEBIAN_<COMPONENT>_FILE_NAME`.

Other
-----

Deprecated and Removed Features
===============================

Other Changes
=============

CMake 4.0 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 3.31 include the following.

New Features
============

File-Based API
--------------

Command-Line
------------

Commands
--------

Variables
---------

  See policy :policy:`CMP0181`.

Properties
----------

Modules
-------

Generator Expressions
---------------------

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

  Notes:

Updates
=======

Changes made since CMake 4.0.0 include the following.

4.0.1
-----

4.0.2
-----

4.0.3, 4.0.4
------------

4.0.5
-----

4.0.6, 4.0.7
------------

CMake 4.2 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.1 include the following.

New Features
============

File-Based API
--------------

Generators
----------

Platforms
---------

Command-Line
------------

Commands
--------

Variables
---------

Properties
----------

Modules
-------

Generator Expressions
---------------------

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.2.0 include the following.

4.2.1
-----

4.2.2
-----

4.2.3, 4.2.4, 4.2.5, 4.2.6, 4.2.7, 4.2.8
----------------------------------------

CMake 4.5 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.4 include the following.

New Features
============

Diagnostics
-----------

Presets
-------

File-Based API
--------------

Instrumentation
---------------

Generators
----------

Languages
---------

Compilers
---------

Command-Line
------------

Commands
--------

File Sets
---------

Variables
---------

Environment Variables
---------------------

Properties
----------

Modules
-------

Generator Expressions
---------------------

Autogen
-------

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

.. |CPS| replace:: Common Package Specification

--===============5421632010097109146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-34991d0ce3cc5f38dd29e824af7579512d2b917e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:34991d0ce3cc5f38dd29e824af7579512d2b917e"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 304 Local 155 Mirrors 0 Missed 149 Current 256 (50% match, 73% complete)
done.
Removing 37 stale sstate objects for arch x86_64...done.
Removing 22 stale sstate objects for arch qemux86_64...done.
Removing 36 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 362 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 368 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/libuv/libuv_1.53.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 392 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 413 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 419 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 420 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libuv-1.53.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 422 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libuv-1.53.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 424 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 430 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-native-11.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 437 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_stash_locale_setscene)
NOTE: Running setscene task 459 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 466 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 472 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Started
NOTE: Running setscene task 473 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 474 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-native-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-native-11.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-native-0.197-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 477 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 483 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-native-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 487 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.197-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 491 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-native-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 495 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 496 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 498 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-native-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 501 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 505 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 506 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 507 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 509 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 512 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: recipe meson-native-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 514 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 516 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 517 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 518 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 520 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 522 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 525 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 526 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 530 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-native-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-native-3.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 531 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 534 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-native-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 537 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 224 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 246 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_fetch)
NOTE: Running setscene task 544 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: Running task 257 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_recipe_qa)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 269 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_fetch)
NOTE: Running setscene task 546 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-installer-native-1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 362 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_fetch)
NOTE: Running task 366 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_fetch)
NOTE: recipe cmake-native-4.5.0-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-native-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 376 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_fetch)
NOTE: Running setscene task 551 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: Running task 378 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_fetch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Succeeded
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe re2c-native-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 379 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_unpack)
NOTE: recipe expat-native-2.10.0-r0: task do_fetch: Started
NOTE: Running task 384 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-native-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 385 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_unpack)
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_fetch: Started
NOTE: Running task 401 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe python3-native-3.14.10-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 405 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_unpack)
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Succeeded
NOTE: Running task 414 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_fetch)
NOTE: Running task 423 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_unpack)
NOTE: Running task 430 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_unpack)
NOTE: Running task 431 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_fetch)
NOTE: Running task 433 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 434 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_unpack)
NOTE: recipe libxml2-native-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-native-2.10.0-r0: task do_unpack: Started
NOTE: Running task 440 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 449 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_fetch)
NOTE: Running task 463 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_write_config)
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_fetch: Started
NOTE: recipe re2c-native-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Started
NOTE: Running setscene task 553 of 560 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_fetch: Started
NOTE: recipe meson-native-1.12.1-r0: task do_fetch: Started
NOTE: Running task 464 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: recipe expat-native-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 465 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_patch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 466 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_unpack)
NOTE: Running task 467 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_patch)
NOTE: recipe python3-installer-native-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 468 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_patch)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 469 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_patch)
NOTE: Running task 470 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_unpack)
NOTE: recipe meson-native-1.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 471 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 472 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_unpack)
NOTE: Running task 473 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_unpack)
NOTE: recipe cmake-native-4.5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_write_config: Started
NOTE: recipe re2c-native-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 474 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.3-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Started
NOTE: recipe expat-native-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_patch: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 480 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.3-r0: task do_unpack: Succeeded
NOTE: Running task 481 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_patch)
NOTE: recipe meson-native-1.12.1-r0: task do_unpack: Started
NOTE: Running task 482 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe re2c-native-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cmake-native-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Succeeded
NOTE: recipe expat-native-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 506 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_fetch)
NOTE: Running task 508 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 510 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_generate_toolchain_file)
NOTE: Running task 513 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_fetch)
NOTE: recipe cmake-native-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 514 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 515 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-installer-native-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 517 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_patch)
NOTE: recipe cmake-native-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.10-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_patch: Started
NOTE: recipe cmake-native-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.10.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libarchive-native-3.8.11-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: Running task 519 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 520 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_patch)
NOTE: recipe util-linux-native-2.42.4-r0: task do_fetch: Started
NOTE: recipe expat-native-2.10.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_patch: Started
NOTE: Running task 523 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe python3-build-native-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_patch: Succeeded
NOTE: Running noexec task 528 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_fetch)
NOTE: Running task 530 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: Running task 542 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libarchive-native-3.8.11-r0: task do_fetch: Succeeded
NOTE: Running task 544 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_fetch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 545 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_patch: Succeeded
NOTE: recipe json-c-native-0.19-r0: task do_fetch: Started
NOTE: Running task 548 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 549 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe json-c-native-0.19-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 551 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: Running task 552 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe cmake-native-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-native-0.26.5-r0: task do_fetch: Started
NOTE: recipe meson-native-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 553 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_patch)
NOTE: Running task 554 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: Running task 556 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_fetch)
NOTE: recipe util-linux-native-2.42.4-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.11-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_patch: Succeeded
NOTE: Running task 559 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe meson-native-1.12.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe json-c-native-0.19-r0: task do_unpack: Started
NOTE: Running task 563 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe elfutils-native-0.197-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 564 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe json-c-native-0.19-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 565 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 570 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 571 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe elfutils-native-0.197-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe meson-native-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 583 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.11-r0: task do_unpack: Succeeded
NOTE: recipe json-c-native-0.19-r0: task do_patch: Started
NOTE: Running task 584 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_patch)
NOTE: recipe rpm-native-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 585 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Started
NOTE: recipe json-c-native-0.19-r0: task do_patch: Succeeded
NOTE: Running task 592 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.11-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 593 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe elfutils-native-0.197-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 594 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 595 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.8.11-r0: task do_patch: Succeeded
NOTE: Running task 601 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 654 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_write_config)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 660 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 661 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_write_config: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_write_config: Succeeded
NOTE: recipe json-c-native-0.19-r0: task do_generate_toolchain_file: Started
NOTE: Running task 674 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_fetch)
NOTE: recipe json-c-native-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-linux-native-2.42.4-r0: task do_unpack: Succeeded
NOTE: Running task 684 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_patch)
NOTE: Running task 734 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_fetch)
NOTE: recipe zlib-1.4-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 736 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 741 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_fetch)
NOTE: recipe zlib-1.4-r0: task do_fetch: Succeeded
NOTE: Running task 742 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-4.1.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_patch: Started
NOTE: recipe zlib-1.4-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 743 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe zlib-1.4-r0: task do_unpack: Succeeded
NOTE: Running task 744 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_patch)
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 745 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 746 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe zlib-1.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 747 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe zlib-1.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 752 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_unpack)
NOTE: Running task 753 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_patch)
NOTE: recipe python3-native-3.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 754 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_patch)
NOTE: recipe cmake-native-4.5.0-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Started
NOTE: recipe cmake-native-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 758 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: Running task 759 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-native-0.197-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 760 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_patch)
NOTE: Running task 761 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_patch)
NOTE: recipe util-linux-native-2.42.4-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.14.10-r0: task do_patch: Started
NOTE: Running task 765 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_create_recipe_spdx)
NOTE: recipe openssl-4.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_unpack)
NOTE: recipe cmake-native-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe cmake-native-4.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.4-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 767 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: Running task 776 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_fetch)
NOTE: recipe openssl-4.1.0-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.197-r0: task do_patch: Started
NOTE: recipe libunistring-1.5-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_patch: Succeeded
NOTE: Running task 786 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libunistring-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 787 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 799 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_fetch)
NOTE: Running task 800 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libunistring-1.5-r0: task do_unpack: Started
NOTE: recipe expat-2.10.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe expat-2.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 802 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_fetch)
NOTE: recipe cmake-native-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 803 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_configure)
NOTE: recipe cmake-native-4.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 804 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx)
NOTE: recipe cmake-native-4.5.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 805 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 806 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_patch)
NOTE: recipe expat-native-2.10.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 555 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: Running setscene task 556 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-native-0.197-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_patch: Started
NOTE: Running task 818 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 819 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe qemu-native-11.1.3-r0: task do_fetch: Started
NOTE: Running task 821 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_patch: Succeeded
NOTE: Running task 831 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: Running task 833 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe expat-native-2.10.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 834 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_fetch: Succeeded
NOTE: Running task 835 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_unpack)
NOTE: recipe curl-8.23.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.11-r0: task do_fetch: Started
NOTE: recipe python3-native-3.14.10-r0: task do_patch: Succeeded
NOTE: Running task 837 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_unpack)
NOTE: recipe libarchive-3.8.11-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_unpack)
NOTE: recipe curl-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 842 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe expat-2.10.0-r0: task do_unpack: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 560 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe python3-native-3.14.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.23.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_unpack: Started
NOTE: recipe expat-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 843 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 855 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_unpack)
NOTE: recipe expat-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-native-3.14.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_unpack: Started
NOTE: Running task 856 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx)
NOTE: recipe expat-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 867 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_write_config)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: Running task 868 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 869 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe curl-8.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: recipe openssl-4.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_write_config: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: Running task 873 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.11-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: Running task 874 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_patch)
NOTE: recipe curl-8.23.0-r0: task do_patch: Started
NOTE: recipe openssl-4.1.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 875 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_create_recipe_spdx)
NOTE: recipe libarchive-3.8.11-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: Running task 876 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: Running task 879 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe curl-8.23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 886 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: recipe expat-2.10.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 889 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/libuv/libuv_1.53.0.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_patch: Started
NOTE: recipe expat-2.10.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: Running task 891 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe libuv-1.53.0-r0: task do_fetch: Started
NOTE: recipe openssl-4.1.0-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_recipe_qa)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_patch: Succeeded
NOTE: Running task 898 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_create_recipe_spdx)
NOTE: recipe cmake-4.5.0-r0: task do_recipe_qa: Started
NOTE: Running task 927 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx)
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 928 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-11.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: Running task 930 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_unpack)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 954 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_populate_lic)
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_patch)
NOTE: recipe cmake-4.5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe cmake-native-4.5.0-r0: task do_populate_lic: Started
NOTE: Running task 956 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe cmake-4.5.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_patch: Started
NOTE: Running task 957 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_recipe_spdx)
NOTE: recipe cmake-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 958 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: recipe cmake-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 960 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe cmake-native-4.5.0-r0: task do_populate_lic: Succeeded
NOTE: recipe p11-kit-native-0.26.5-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: Running task 962 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe p11-kit-native-0.26.5-r0: task do_patch: Succeeded
NOTE: Running task 963 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 966 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_recipe_spdx)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.12.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe meson-native-1.12.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 969 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_create_recipe_spdx)
NOTE: Running task 970 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx)
NOTE: recipe glibc-2.44+git-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 972 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: Running task 973 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 974 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_create_recipe_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe qemu-native-11.1.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 975 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe cmake-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 977 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe cmake-4.5.0-r0: task do_patch: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 978 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx)
NOTE: recipe cmake-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 979 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 980 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 981 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_populate_lic)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 983 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_create_recipe_spdx)
NOTE: recipe cmake-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-4.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-4.5.0-r0: task do_populate_lic: Started
NOTE: recipe cmake-4.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 984 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx)
NOTE: recipe cmake-4.5.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libuv-1.53.0-r0: task do_fetch: Succeeded
NOTE: recipe cmake-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 985 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/libuv/libuv_1.53.0.bb:do_unpack)
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libuv-1.53.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 986 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake_4.5.0.bb:do_create_recipe_spdx)
NOTE: recipe cmake-4.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe cmake-4.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libuv-1.53.0-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/libuv/libuv_1.53.0.bb:do_patch)
NOTE: recipe libuv-1.53.0-r0: task do_patch: Started
NOTE: recipe libuv-1.53.0-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 989 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_unpack)
NOTE: recipe rpm-native-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 990 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_patch)
NOTE: recipe rpm-native-1_6.0.2-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Succeeded
NOTE: Running noexec task 994 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_configure)
NOTE: Running noexec task 995 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_compile)
NOTE: Running task 996 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_install)
NOTE: recipe qemu-native-11.1.3-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 997 of 1381 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_generate_toolchain_file)
NOTE: Running task 999 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_patch)
NOTE: recipe qemu-native-11.1.3-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_install: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_install: Succeeded
NOTE: Running task 1017 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_configure)
NOTE: recipe glibc-2.44+git-r0: task do_configure: Started
NOTE: recipe glibc-2.44+git-r0: task do_configure: Succeeded
NOTE: Running task 1019 of 1381 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_compile)
NOTE: recipe glibc-2.44+git-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.b
 b:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'ncurses-native', 'zlib-native', 'make-native', 'perl-native', 'bzip2-native', 'xz-native', 'zstd-native', 'gdbm-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| ---------------------------------------------
| Source directory: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0
| Binary directory: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build
| Prefix directory: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr
| System:           Linux
| Generator:        Unix Makefiles
| Doing parallel make: 16
| 
| ---------------------------------------------
| CMake 4.5.0, Copyright 2000-2026 Kitware, Inc. and Contributors
| C compiler on this system is: gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe
| C++ compiler on this system is: g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden
| Makefile processor on this system is: make
| g++  has setenv
| g++  has unsetenv
| g++  does not have environ in stdlib.h
| g++  has <ext/stdio_filebuf.h>
| ---------------------------------------------
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddCompileDefinitionsCommand.cxx -o cmAddCompileDefinitionsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddCustomCommandCommand.cxx -o cmAddCustomCommandCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddCustomRuleCommand.cxx -o cmAddCustomRuleCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddCustomTargetCommand.cxx -o cmAddCustomTargetCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddDefinitionsCommand.cxx -o cmAddDefinitionsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddDependenciesCommand.cxx -o cmAddDependenciesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddExecutableCommand.cxx -o cmAddExecutableCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddLibraryCommand.cxx -o cmAddLibraryCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddSubDirectoryCommand.cxx -o cmAddSubDirectoryCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmAddTestCommand.cxx -o cmAddTestCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmArgumentParser.cxx -o cmArgumentParser.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsLinker.cxx -o cmBinUtilsLinker.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsLinuxELFGetRuntimeDependenciesTool.cxx -o cmBinUtilsLinuxELFGetRuntimeDependenciesTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsLinuxELFLinker.cxx -o cmBinUtilsLinuxELFLinker.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsLinuxELFObjdumpGetRuntimeDependenciesTool.cxx -o cmBinUtilsLinuxELFObjdumpGetRuntimeDependenciesTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsMacOSMachOGetRuntimeDependenciesTool.cxx -o cmBinUtilsMacOSMachOGetRuntimeDependenciesTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsMacOSMachOLinker.cxx -o cmBinUtilsMacOSMachOLinker.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsMacOSMachOOToolGetRuntimeDependenciesTool.cxx -o cmBinUtilsMacOSMachOOToolGetRuntimeDependenciesTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsWindowsPEGetRuntimeDependenciesTool.cxx -o cmBinUtilsWindowsPEGetRuntimeDependenciesTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsWindowsPEDumpbinGetRuntimeDependenciesTool.cxx -o cmBinUtilsWindowsPEDumpbinGetRuntimeDependenciesTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsWindowsPELinker.cxx -o cmBinUtilsWindowsPELinker.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBinUtilsWindowsPEObjdumpGetRuntimeDependenciesTool.cxx -o cmBinUtilsWindowsPEObjdumpGetRuntimeDependenciesTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBlockCommand.cxx -o cmBlockCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBreakCommand.cxx -o cmBreakCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBuildCommand.cxx -o cmBuildCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmBuildDatabase.cxx -o cmBuildDatabase.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCMakeLanguageCommand.cxx -o cmCMakeLanguageCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCMakeMinimumRequired.cxx -o cmCMakeMinimumRequired.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmList.cxx -o cmList.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCMakeDiagnosticCommand.cxx -o cmCMakeDiagnosticCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCMakePath.cxx -o cmCMakePath.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCMakePathCommand.cxx -o cmCMakePathCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCMakePolicyCommand.cxx -o cmCMakePolicyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCMakeString.cxx -o cmCMakeString.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCPackPropertiesGenerator.cxx -o cmCPackPropertiesGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCacheDocumentationTable.cxx -o cmCacheDocumentationTable.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCacheManager.cxx -o cmCacheManager.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCachePatternTable.cxx -o cmCachePatternTable.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCommands.cxx -o cmCommands.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCommonTargetGenerator.cxx -o cmCommonTargetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmComputeComponentGraph.cxx -o cmComputeComponentGraph.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmComputeLinkDepends.cxx -o cmComputeLinkDepends.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmComputeLinkInformation.cxx -o cmComputeLinkInformation.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmComputeTargetDepends.cxx -o cmComputeTargetDepends.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmConditionEvaluator.cxx -o cmConditionEvaluator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmConfigureFileCommand.cxx -o cmConfigureFileCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmContinueCommand.cxx -o cmContinueCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCoreTryCompile.cxx -o cmCoreTryCompile.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCreateTestSourceList.cxx -o cmCreateTestSourceList.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCryptoHash.cxx -o cmCryptoHash.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCustomCommand.cxx -o cmCustomCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCustomCommandGenerator.cxx -o cmCustomCommandGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCustomCommandLines.cxx -o cmCustomCommandLines.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCustomRule.cxx -o cmCustomRule.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCxxModuleMapper.cxx -o cmCxxModuleMapper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmCxxModuleUsageEffects.cxx -o cmCxxModuleUsageEffects.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDefinePropertyCommand.cxx -o cmDefinePropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDefinitions.cxx -o cmDefinitions.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDiagnostics.cxx -o cmDiagnostics.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDiagnosticContext.cxx -o cmDiagnosticContext.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDirectoryPropertyHelper.cxx -o cmDirectoryPropertyHelper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDiscoverTestsCommand.cxx -o cmDiscoverTestsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDocumentationFormatter.cxx -o cmDocumentationFormatter.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmELF.cxx -o cmELF.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmEnableLanguageCommand.cxx -o cmEnableLanguageCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmEnableTestingCommand.cxx -o cmEnableTestingCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmEnvironment.cxx -o cmEnvironment.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmEvaluatedTargetProperty.cxx -o cmEvaluatedTargetProperty.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExecProgramCommand.cxx -o cmExecProgramCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExecuteProcessCommand.cxx -o cmExecuteProcessCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExpandedCommandArgument.cxx -o cmExpandedCommandArgument.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExperimental.cxx -o cmExperimental.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportBuildCMakeConfigGenerator.cxx -o cmExportBuildCMakeConfigGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportBuildFileGenerator.cxx -o cmExportBuildFileGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportCMakeConfigGenerator.cxx -o cmExportCMakeConfigGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportFileGenerator.cxx -o cmExportFileGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportInstallCMakeConfigGenerator.cxx -o cmExportInstallCMakeConfigGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportInstallFileGenerator.cxx -o cmExportInstallFileGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportSet.cxx -o cmExportSet.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExportTryCompileFileGenerator.cxx -o cmExportTryCompileFileGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExprParserHelper.cxx -o cmExprParserHelper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmExternalMakefileProjectGenerator.cxx -o cmExternalMakefileProjectGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileCommand.cxx -o cmFileCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileCommand_ReadMacho.cxx -o cmFileCommand_ReadMacho.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileCopier.cxx -o cmFileCopier.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileInstaller.cxx -o cmFileInstaller.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileSet.cxx -o cmFileSet.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileSetMetadata.cxx -o cmFileSetMetadata.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileTime.cxx -o cmFileTime.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileTimeCache.cxx -o cmFileTimeCache.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFileTimes.cxx -o cmFileTimes.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindBase.cxx -o cmFindBase.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindCommon.cxx -o cmFindCommon.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindFileCommand.cxx -o cmFindFileCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindLibraryCommand.cxx -o cmFindLibraryCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindPackageCommand.cxx -o cmFindPackageCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindPackageStack.cxx -o cmFindPackageStack.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindPathCommand.cxx -o cmFindPathCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFindProgramCommand.cxx -o cmFindProgramCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmForEachCommand.cxx -o cmForEachCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFunctionBlocker.cxx -o cmFunctionBlocker.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFunctionCommand.cxx -o cmFunctionCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmFSPermissions.cxx -o cmFSPermissions.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratedFileStream.cxx -o cmGeneratedFileStream.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGenExContext.cxx -o cmGenExContext.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGenExEvaluation.cxx -o cmGenExEvaluation.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorExpression.cxx -o cmGeneratorExpression.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorExpressionDAGChecker.cxx -o cmGeneratorExpressionDAGChecker.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorExpressionEvaluationFile.cxx -o cmGeneratorExpressionEvaluationFile.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorExpressionEvaluator.cxx -o cmGeneratorExpressionEvaluator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorExpressionLexer.cxx -o cmGeneratorExpressionLexer.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorExpressionNode.cxx -o cmGeneratorExpressionNode.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorExpressionParser.cxx -o cmGeneratorExpressionParser.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorFileSet.cxx -o cmGeneratorFileSet.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorFileSets.cxx -o cmGeneratorFileSets.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorRule.cxx -o cmGeneratorRule.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget.cxx -o cmGeneratorTarget.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_CompatibleInterface.cxx -o cmGeneratorTarget_CompatibleInterface.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_HeaderSetVerification.cxx -o cmGeneratorTarget_HeaderSetVerification.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_IncludeDirectories.cxx -o cmGeneratorTarget_IncludeDirectories.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_Link.cxx -o cmGeneratorTarget_Link.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_LinkDirectories.cxx -o cmGeneratorTarget_LinkDirectories.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_Options.cxx -o cmGeneratorTarget_Options.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_Sources.cxx -o cmGeneratorTarget_Sources.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_TransitiveProperty.cxx -o cmGeneratorTarget_TransitiveProperty.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGeneratorTarget_Wrappers.cxx -o cmGeneratorTarget_Wrappers.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetCMakePropertyCommand.cxx -o cmGetCMakePropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetDirectoryPropertyCommand.cxx -o cmGetDirectoryPropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetFilenameComponentCommand.cxx -o cmGetFilenameComponentCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetPipes.cxx -o cmGetPipes.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetPropertyCommand.cxx -o cmGetPropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetSourceFilePropertyCommand.cxx -o cmGetSourceFilePropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetTargetPropertyCommand.cxx -o cmGetTargetPropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGetTestPropertyCommand.cxx -o cmGetTestPropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGlobalCommonGenerator.cxx -o cmGlobalCommonGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGlobalGenerator.cxx -o cmGlobalGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGlobVerificationManager.cxx -o cmGlobVerificationManager.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmHexFileConverter.cxx -o cmHexFileConverter.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmIfCommand.cxx -o cmIfCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmImportedCxxModuleInfo.cxx -o cmImportedCxxModuleInfo.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmIncludeCommand.cxx -o cmIncludeCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmIncludeGuardCommand.cxx -o cmIncludeGuardCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmIncludeDirectoryCommand.cxx -o cmIncludeDirectoryCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmIncludeRegularExpressionCommand.cxx -o cmIncludeRegularExpressionCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallCMakeConfigExportGenerator.cxx -o cmInstallCMakeConfigExportGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallCommand.cxx -o cmInstallCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallCommandArguments.cxx -o cmInstallCommandArguments.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallCxxModuleBmiGenerator.cxx -o cmInstallCxxModuleBmiGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallDirectoryGenerator.cxx -o cmInstallDirectoryGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallExportGenerator.cxx -o cmInstallExportGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallFileSetGenerator.cxx -o cmInstallFileSetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallFilesGenerator.cxx -o cmInstallFilesGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallGenerator.cxx -o cmInstallGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallGetRuntimeDependenciesGenerator.cxx -o cmInstallGetRuntimeDependenciesGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallImportedRuntimeArtifactsGenerator.cxx -o cmInstallImportedRuntimeArtifactsGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallDirs.cxx -o cmInstallDirs.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallRuntimeDependencySet.cxx -o cmInstallRuntimeDependencySet.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallRuntimeDependencySetGenerator.cxx -o cmInstallRuntimeDependencySetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallScriptGenerator.cxx -o cmInstallScriptGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallSubdirectoryGenerator.cxx -o cmInstallSubdirectoryGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstallTargetGenerator.cxx -o cmInstallTargetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmInstalledFile.cxx -o cmInstalledFile.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmJSONHelpers.cxx -o cmJSONHelpers.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmJSONState.cxx -o cmJSONState.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLDConfigLDConfigTool.cxx -o cmLDConfigLDConfigTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLDConfigTool.cxx -o cmLDConfigTool.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLinkDirectoriesCommand.cxx -o cmLinkDirectoriesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLinkItem.cxx -o cmLinkItem.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLinkItemGraphVisitor.cxx -o cmLinkItemGraphVisitor.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLinkLineComputer.cxx -o cmLinkLineComputer.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLinkLineDeviceComputer.cxx -o cmLinkLineDeviceComputer.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmListCommand.cxx -o cmListCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmListFileCache.cxx -o cmListFileCache.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLocalCommonGenerator.cxx -o cmLocalCommonGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLocalGenerator.cxx -o cmLocalGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMSVC60LinkLineComputer.cxx -o cmMSVC60LinkLineComputer.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMacroCommand.cxx -o cmMacroCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMakefile.cxx -o cmMakefile.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMarkAsAdvancedCommand.cxx -o cmMarkAsAdvancedCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMathCommand.cxx -o cmMathCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMessageCommand.cxx -o cmMessageCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMessenger.cxx -o cmMessenger.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmNewLineStyle.cxx -o cmNewLineStyle.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmOSXBundleGenerator.cxx -o cmOSXBundleGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmOptionCommand.cxx -o cmOptionCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmOrderDirectories.cxx -o cmOrderDirectories.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmObjectLocation.cxx -o cmObjectLocation.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmOutputConverter.cxx -o cmOutputConverter.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmParseArgumentsCommand.cxx -o cmParseArgumentsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPathLabel.cxx -o cmPathLabel.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPathResolver.cxx -o cmPathResolver.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPolicies.cxx -o cmPolicies.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmProcessOutput.cxx -o cmProcessOutput.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmProjectCommand.cxx -o cmProjectCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmValue.cxx -o cmValue.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPropertyDefinition.cxx -o cmPropertyDefinition.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPropertyMap.cxx -o cmPropertyMap.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGccDepfileLexerHelper.cxx -o cmGccDepfileLexerHelper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGccDepfileReader.cxx -o cmGccDepfileReader.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmReturnCommand.cxx -o cmReturnCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPackageInfoReader.cxx -o cmPackageInfoReader.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPlaceholderExpander.cxx -o cmPlaceholderExpander.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmPlistParser.cxx -o cmPlistParser.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmRule.cxx -o cmRule.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmRulePlaceholderExpander.cxx -o cmRulePlaceholderExpander.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmRuntimeDependencyArchive.cxx -o cmRuntimeDependencyArchive.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmScriptGenerator.cxx -o cmScriptGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSearchPath.cxx -o cmSearchPath.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSeparateArgumentsCommand.cxx -o cmSeparateArgumentsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSetCommand.cxx -o cmSetCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSetDirectoryPropertiesCommand.cxx -o cmSetDirectoryPropertiesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSetPropertyCommand.cxx -o cmSetPropertyCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSetSourceFilesPropertiesCommand.cxx -o cmSetSourceFilesPropertiesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSetTargetPropertiesCommand.cxx -o cmSetTargetPropertiesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSetTestsPropertiesCommand.cxx -o cmSetTestsPropertiesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSiteNameCommand.cxx -o cmSiteNameCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSourceFile.cxx -o cmSourceFile.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSourceFileLocation.cxx -o cmSourceFileLocation.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSourceFilePropertyHelper.cxx -o cmSourceFilePropertyHelper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSpecializedRule.cxx -o cmSpecializedRule.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStandardLevelResolver.cxx -o cmStandardLevelResolver.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmState.cxx -o cmState.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStateDirectory.cxx -o cmStateDirectory.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStateSnapshot.cxx -o cmStateSnapshot.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStdIoConsole.cxx -o cmStdIoConsole.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStdIoInit.cxx -o cmStdIoInit.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStdIoStream.cxx -o cmStdIoStream.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStdIoTerminal.cxx -o cmStdIoTerminal.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmString.cxx -o cmString.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStringAlgorithms.cxx -o cmStringAlgorithms.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStringReplaceHelper.cxx -o cmStringReplaceHelper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmStringCommand.cxx -o cmStringCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSubcommandTable.cxx -o cmSubcommandTable.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmSystemTools.cxx -o cmSystemTools.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTarget.cxx -o cmTarget.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetCompileDefinitionsCommand.cxx -o cmTargetCompileDefinitionsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetCompileFeaturesCommand.cxx -o cmTargetCompileFeaturesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetCompileOptionsCommand.cxx -o cmTargetCompileOptionsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetIncludeDirectoriesCommand.cxx -o cmTargetIncludeDirectoriesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetLinkLibrariesCommand.cxx -o cmTargetLinkLibrariesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetLinkOptionsCommand.cxx -o cmTargetLinkOptionsCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetPrecompileHeadersCommand.cxx -o cmTargetPrecompileHeadersCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetPropCommandBase.cxx -o cmTargetPropCommandBase.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetPropertyComputer.cxx -o cmTargetPropertyComputer.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetPropertyEntry.cxx -o cmTargetPropertyEntry.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetPropertyHelper.cxx -o cmTargetPropertyHelper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetSourcesCommand.cxx -o cmTargetSourcesCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTargetTraceDependencies.cxx -o cmTargetTraceDependencies.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTest.cxx -o cmTest.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTestGenerator.cxx -o cmTestGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTestPropertyHelper.cxx -o cmTestPropertyHelper.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTimestamp.cxx -o cmTimestamp.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTransformDepfile.cxx -o cmTransformDepfile.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTryCompileCommand.cxx -o cmTryCompileCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmTryRunCommand.cxx -o cmTryRunCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmUnsetCommand.cxx -o cmUnsetCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmUVHandlePtr.cxx -o cmUVHandlePtr.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmUVProcessChain.cxx -o cmUVProcessChain.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmVersion.cxx -o cmVersion.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmWhileCommand.cxx -o cmWhileCommand.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmWindowsRegistry.cxx -o cmWindowsRegistry.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmWorkingDirectory.cxx -o cmWorkingDirectory.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmXcFramework.cxx -o cmXcFramework.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmake.cxx -o cmake.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmakemain.cxx -o cmakemain.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmcmd.cxx -o cmcmd.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cm_fileno.cxx -o cm_fileno.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDepends.cxx -o cmDepends.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDependsC.cxx -o cmDependsC.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmDependsCompiler.cxx -o cmDependsCompiler.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmGlobalUnixMakefileGenerator3.cxx -o cmGlobalUnixMakefileGenerator3.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmLocalUnixMakefileGenerator3.cxx -o cmLocalUnixMakefileGenerator3.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMakefileExecutableTargetGenerator.cxx -o cmMakefileExecutableTargetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMakefileLibraryTargetGenerator.cxx -o cmMakefileLibraryTargetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMakefileTargetGenerator.cxx -o cmMakefileTargetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmMakefileUtilityTargetGenerator.cxx -o cmMakefileUtilityTargetGenerator.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/cmProcessTools.cxx -o cmProcessTools.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/cm_utf8.c -o cm_utf8.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Utilities/std/cm/bits/fs_path.cxx -o fs_path.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Utilities/std/cm/bits/string_view.cxx -o string_view.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/LexerParser/cmExprLexer.cxx -o cmExprLexer.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/LexerParser/cmExprParser.cxx -o cmExprParser.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4
 .5.0/Source/LexerParser/cmGccDepfileLexer.cxx -o cmGccDepfileLexer.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser/cmListFileLexer.c -o cmListFileLexer.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-nati
 ve/4.5.0/sources/cmake-4.5.0/Source/kwsys/Directory.cxx -o Directory.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-nati
 ve/4.5.0/sources/cmake-4.5.0/Source/kwsys/EncodingCXX.cxx -o EncodingCXX.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-nati
 ve/4.5.0/sources/cmake-4.5.0/Source/kwsys/FStream.cxx -o FStream.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-nati
 ve/4.5.0/sources/cmake-4.5.0/Source/kwsys/Glob.cxx -o Glob.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-nati
 ve/4.5.0/sources/cmake-4.5.0/Source/kwsys/RegularExpression.cxx -o RegularExpression.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-nati
 ve/4.5.0/sources/cmake-4.5.0/Source/kwsys/Status.cxx -o Status.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DKWSYS_CXX_HAS_SETENV=1 -DKWSYS_CXX_HAS_UNSETENV=1 -DKWSYS_CXX_HAS_ENVIRON_IN_STDLIB_H=0 -DKWSYS_CXX_HA
 S_UTIMENSAT=0 -DKWSYS_CXX_HAS_UTIMES=0 -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/kwsys/SystemTools.cxx -o SystemTools.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/kwsys/EncodingC.c -o EncodingC.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/kwsys/ProcessUNIX.c -o ProcessUNIX.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DKWSYS_STRING_C -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/kwsys/String.c -o String.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -DKWSYS_NAMESPACE=cmsys -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/kwsys/System.c -o System.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/strscpy.c -o uv-src-strscpy.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/strtok.c -o uv-src-strtok.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/timer.c -o uv-src-timer.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/uv-common.c -o uv-src-uv-common.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/cmake-bootstrap.c -o uv-src-unix-cmake-bootstrap.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/core.c -o uv-src-unix-core.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/fs.c -o uv-src-unix-fs.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/loop.c -o uv-src-unix-loop.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/loop-watcher.c -o uv-src-unix-loop-watcher.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/no-fsevents.c -o uv-src-unix-no-fsevents.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/pipe.c -o uv-src-unix-pipe.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/poll.c -o uv-src-unix-poll.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/posix-hrtime.c -o uv-src-unix-posix-hrtime.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/posix-poll.c -o uv-src-unix-posix-poll.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/process.c -o uv-src-unix-process.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/signal.c -o uv-src-unix-signal.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/stream.c -o uv-src-unix-stream.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/tcp.c -o uv-src-unix-tcp.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -D_GNU_SOURCE -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix -I/srv/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibuv/src/unix/tty.c -o uv-src-unix-tty.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/algorithms.c -o rhash-librhash-algorithms.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/byte_order.c -o rhash-librhash-byte_order.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/hex.c -o rhash-librhash-hex.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/md5.c -o rhash-librhash-md5.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/rhash.c -o rhash-librhash-rhash.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/sha1.c -o rhash-librhash-sha1.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/sha256.c -o rhash-librhash-sha256.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/sha3.c -o rhash-librhash-sha3.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/sha512.c -o rhash-librhash-sha512.c.o
| gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe   -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities -DNO_IMPORT_EXPORT -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmlibrhash/librhash/util.c -o rhash-librhash-util.c.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.
 5.0/Utilities/cmjsoncpp/include -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmjsoncpp/src/lib_json/json_reader.cpp -o jsoncpp-src-lib_json-json_reader.cpp.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.
 5.0/Utilities/cmjsoncpp/include -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmjsoncpp/src/lib_json/json_value.cpp -o jsoncpp-src-lib_json-json_value.cpp.o
| g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.
 5.0/Utilities/cmjsoncpp/include -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/cmjsoncpp/src/lib_json/json_writer.cpp -o jsoncpp-src-lib_json-json_writer.cpp.o
| g++  -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/lib                         -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/srv/po
 kybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden    -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64    -DCMAKE_BOOTSTRAP    -DCMake_HAVE_CXX_MAKE_UNIQUE=1 -DCMake_HAVE_CXX_FILESYSTEM=1   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Source/LexerParser   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities/std   -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/Utilities  cm
 AddCompileDefinitionsCommand.o cmAddCustomCommandCommand.o cmAddCustomRuleCommand.o cmAddCustomTargetCommand.o cmAddDefinitionsCommand.o cmAddDependenciesCommand.o cmAddExecutableCommand.o cmAddLibraryCommand.o cmAddSubDirectoryCommand.o cmAddTestCommand.o cmArgumentParser.o cmBinUtilsLinker.o cmBinUtilsLinuxELFGetRuntimeDependenciesTool.o cmBinUtilsLinuxELFLinker.o cmBinUtilsLinuxELFObjdumpGetRuntimeDependenciesTool.o cmBinUtilsMacOSMachOGetRuntimeDependenciesTool.o cmBinUtilsMacOSMachOLinker.o cmBinUtilsMacOSMachOOToolGetRuntimeDependenciesTool.o cmBinUtilsWindowsPEGetRuntimeDependenciesTool.o cmBinUtilsWindowsPEDumpbinGetRuntimeDependenciesTool.o cmBinUtilsWindowsPELinker.o cmBinUtilsWindowsPEObjdumpGetRuntimeDependenciesTool.o cmBlockCommand.o cmBreakCommand.o cmBuildCommand.o cmBuildDatabase.o cmCMakeLanguageCommand.o cmCMakeMinimumRequired.o cmList.o cmCMakeDiagnosticCommand.o cmCMakePath.o cmCMakePathCommand.o cmCMakePolicyCommand.o cmCMakeString.o cmCPackPropertiesGenerator.
 o cmCacheDocumentationTable.o cmCacheManager.o cmCachePatternTable.o cmCommands.o cmCommonTargetGenerator.o cmComputeComponentGraph.o cmComputeLinkDepends.o cmComputeLinkInformation.o cmComputeTargetDepends.o cmConditionEvaluator.o cmConfigureFileCommand.o cmContinueCommand.o cmCoreTryCompile.o cmCreateTestSourceList.o cmCryptoHash.o cmCustomCommand.o cmCustomCommandGenerator.o cmCustomCommandLines.o cmCustomRule.o cmCxxModuleMapper.o cmCxxModuleUsageEffects.o cmDefinePropertyCommand.o cmDefinitions.o cmDiagnostics.o cmDiagnosticContext.o cmDirectoryPropertyHelper.o cmDiscoverTestsCommand.o cmDocumentationFormatter.o cmELF.o cmEnableLanguageCommand.o cmEnableTestingCommand.o cmEnvironment.o cmEvaluatedTargetProperty.o cmExecProgramCommand.o cmExecuteProcessCommand.o cmExpandedCommandArgument.o cmExperimental.o cmExportBuildCMakeConfigGenerator.o cmExportBuildFileGenerator.o cmExportCMakeConfigGenerator.o cmExportFileGenerator.o cmExportInstallCMakeConfigGenerator.o cmExportInstallFi
 leGenerator.o cmExportSet.o cmExportTryCompileFileGenerator.o cmExprParserHelper.o cmExternalMakefileProjectGenerator.o cmFileCommand.o cmFileCommand_ReadMacho.o cmFileCopier.o cmFileInstaller.o cmFileSet.o cmFileSetMetadata.o cmFileTime.o cmFileTimeCache.o cmFileTimes.o cmFindBase.o cmFindCommon.o cmFindFileCommand.o cmFindLibraryCommand.o cmFindPackageCommand.o cmFindPackageStack.o cmFindPathCommand.o cmFindProgramCommand.o cmForEachCommand.o cmFunctionBlocker.o cmFunctionCommand.o cmFSPermissions.o cmGeneratedFileStream.o cmGenExContext.o cmGenExEvaluation.o cmGeneratorExpression.o cmGeneratorExpressionDAGChecker.o cmGeneratorExpressionEvaluationFile.o cmGeneratorExpressionEvaluator.o cmGeneratorExpressionLexer.o cmGeneratorExpressionNode.o cmGeneratorExpressionParser.o cmGeneratorFileSet.o cmGeneratorFileSets.o cmGeneratorRule.o cmGeneratorTarget.o cmGeneratorTarget_CompatibleInterface.o cmGeneratorTarget_HeaderSetVerification.o cmGeneratorTarget_IncludeDirectories.o cmGenerator
 Target_Link.o cmGeneratorTarget_LinkDirectories.o cmGeneratorTarget_Options.o cmGeneratorTarget_Sources.o cmGeneratorTarget_TransitiveProperty.o cmGeneratorTarget_Wrappers.o cmGetCMakePropertyCommand.o cmGetDirectoryPropertyCommand.o cmGetFilenameComponentCommand.o cmGetPipes.o cmGetPropertyCommand.o cmGetSourceFilePropertyCommand.o cmGetTargetPropertyCommand.o cmGetTestPropertyCommand.o cmGlobalCommonGenerator.o cmGlobalGenerator.o cmGlobVerificationManager.o cmHexFileConverter.o cmIfCommand.o cmImportedCxxModuleInfo.o cmIncludeCommand.o cmIncludeGuardCommand.o cmIncludeDirectoryCommand.o cmIncludeRegularExpressionCommand.o cmInstallCMakeConfigExportGenerator.o cmInstallCommand.o cmInstallCommandArguments.o cmInstallCxxModuleBmiGenerator.o cmInstallDirectoryGenerator.o cmInstallExportGenerator.o cmInstallFileSetGenerator.o cmInstallFilesGenerator.o cmInstallGenerator.o cmInstallGetRuntimeDependenciesGenerator.o cmInstallImportedRuntimeArtifactsGenerator.o cmInstallDirs.o cmInstallR
 untimeDependencySet.o cmInstallRuntimeDependencySetGenerator.o cmInstallScriptGenerator.o cmInstallSubdirectoryGenerator.o cmInstallTargetGenerator.o cmInstalledFile.o cmJSONHelpers.o cmJSONState.o cmLDConfigLDConfigTool.o cmLDConfigTool.o cmLinkDirectoriesCommand.o cmLinkItem.o cmLinkItemGraphVisitor.o cmLinkLineComputer.o cmLinkLineDeviceComputer.o cmListCommand.o cmListFileCache.o cmLocalCommonGenerator.o cmLocalGenerator.o cmMSVC60LinkLineComputer.o cmMacroCommand.o cmMakefile.o cmMarkAsAdvancedCommand.o cmMathCommand.o cmMessageCommand.o cmMessenger.o cmNewLineStyle.o cmOSXBundleGenerator.o cmOptionCommand.o cmOrderDirectories.o cmObjectLocation.o cmOutputConverter.o cmParseArgumentsCommand.o cmPathLabel.o cmPathResolver.o cmPolicies.o cmProcessOutput.o cmProjectCommand.o cmValue.o cmPropertyDefinition.o cmPropertyMap.o cmGccDepfileLexerHelper.o cmGccDepfileReader.o cmReturnCommand.o cmPackageInfoReader.o cmPlaceholderExpander.o cmPlistParser.o cmRule.o cmRulePlaceholderExpande
 r.o cmRuntimeDependencyArchive.o cmScriptGenerator.o cmSearchPath.o cmSeparateArgumentsCommand.o cmSetCommand.o cmSetDirectoryPropertiesCommand.o cmSetPropertyCommand.o cmSetSourceFilesPropertiesCommand.o cmSetTargetPropertiesCommand.o cmSetTestsPropertiesCommand.o cmSiteNameCommand.o cmSourceFile.o cmSourceFileLocation.o cmSourceFilePropertyHelper.o cmSpecializedRule.o cmStandardLevelResolver.o cmState.o cmStateDirectory.o cmStateSnapshot.o cmStdIoConsole.o cmStdIoInit.o cmStdIoStream.o cmStdIoTerminal.o cmString.o cmStringAlgorithms.o cmStringReplaceHelper.o cmStringCommand.o cmSubcommandTable.o cmSystemTools.o cmTarget.o cmTargetCompileDefinitionsCommand.o cmTargetCompileFeaturesCommand.o cmTargetCompileOptionsCommand.o cmTargetIncludeDirectoriesCommand.o cmTargetLinkLibrariesCommand.o cmTargetLinkOptionsCommand.o cmTargetPrecompileHeadersCommand.o cmTargetPropCommandBase.o cmTargetPropertyComputer.o cmTargetPropertyEntry.o cmTargetPropertyHelper.o cmTargetSourcesCommand.o cmTarg
 etTraceDependencies.o cmTest.o cmTestGenerator.o cmTestPropertyHelper.o cmTimestamp.o cmTransformDepfile.o cmTryCompileCommand.o cmTryRunCommand.o cmUnsetCommand.o cmUVHandlePtr.o cmUVProcessChain.o cmVersion.o cmWhileCommand.o cmWindowsRegistry.o cmWorkingDirectory.o cmXcFramework.o cmake.o cmakemain.o cmcmd.o cm_fileno.o cmDepends.o cmDependsC.o cmDependsCompiler.o cmGlobalUnixMakefileGenerator3.o cmLocalUnixMakefileGenerator3.o cmMakefileExecutableTargetGenerator.o cmMakefileLibraryTargetGenerator.o cmMakefileTargetGenerator.o cmMakefileUtilityTargetGenerator.o cmProcessTools.o cm_utf8.o fs_path.o string_view.o cmExprLexer.o cmExprParser.o cmGccDepfileLexer.o cmListFileLexer.o Directory.o EncodingCXX.o FStream.o Glob.o RegularExpression.o Status.o SystemTools.o EncodingC.o ProcessUNIX.o String.o System.o uv-src-strscpy.c.o uv-src-strtok.c.o uv-src-timer.c.o uv-src-uv-common.c.o uv-src-unix-cmake-bootstrap.c.o uv-src-unix-core.c.o uv-src-unix-fs.c.o uv-src-unix-loop.c.o uv-src-uni
 x-loop-watcher.c.o uv-src-unix-no-fsevents.c.o uv-src-unix-pipe.c.o uv-src-unix-poll.c.o uv-src-unix-posix-hrtime.c.o uv-src-unix-posix-poll.c.o uv-src-unix-process.c.o uv-src-unix-signal.c.o uv-src-unix-stream.c.o uv-src-unix-tcp.c.o uv-src-unix-tty.c.o rhash-librhash-algorithms.c.o rhash-librhash-byte_order.c.o rhash-librhash-hex.c.o rhash-librhash-md5.c.o rhash-librhash-rhash.c.o rhash-librhash-sha1.c.o rhash-librhash-sha256.c.o rhash-librhash-sha3.c.o rhash-librhash-sha512.c.o rhash-librhash-util.c.o jsoncpp-src-lib_json-json_reader.cpp.o jsoncpp-src-lib_json-json_value.cpp.o jsoncpp-src-lib_json-json_writer.cpp.o  -ldl -lrt -o cmake
| loading initial cache file /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/build/Bootstrap.cmk/InitialCacheFlags.cmake
| -- The C compiler identification is GNU 14.2.0
| -- The CXX compiler identification is GNU 14.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Using system-installed: BZIP2 FORM LIBLZMA ZLIB ZSTD
| -- Using bundled: CPPDAP CURL EXPAT JSONCPP LIBARCHIVE LIBRHASH LIBUV NGHTTP2 KWIML
| -- Checking if compiler supports C11 _Thread_local
| -- Checking if compiler supports C11 _Thread_local - yes
| -- Checking if compiler supports needed C++17 constructs
| -- Checking if compiler supports needed C++17 constructs - yes
| -- Checking if compiler supports C++ make_unique
| -- Checking if compiler supports C++ make_unique - yes
| -- Checking if compiler supports C++ filesystem
| -- Checking if compiler supports C++ filesystem - yes
| -- Looking for unsetenv
| -- Looking for unsetenv - found
| -- Looking for environ
| -- Looking for environ - not found
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
| -- Found Threads: TRUE
| -- Checking whether C compiler has ptrdiff_t in stddef.h
| -- Checking whether C compiler has ptrdiff_t in stddef.h - yes
| -- Checking whether C compiler has ssize_t in unistd.h
| -- Checking whether C compiler has ssize_t in unistd.h - yes
| -- Checking whether C compiler has clock_gettime
| -- Checking whether C compiler has clock_gettime - yes
| -- Checking whether CXX compiler has setenv
| -- Checking whether CXX compiler has setenv - yes
| -- Checking whether CXX compiler has unsetenv
| -- Checking whether CXX compiler has unsetenv - yes
| -- Checking whether CXX compiler has environ in stdlib.h
| -- Checking whether CXX compiler has environ in stdlib.h - no
| -- Checking whether CXX compiler has utimes
| -- Checking whether CXX compiler has utimes - yes
| -- Checking whether CXX compiler has utimensat
| -- Checking whether CXX compiler has utimensat - yes
| -- Checking whether CXX compiler struct stat has st_mtim member
| -- Checking whether CXX compiler struct stat has st_mtim member - yes
| -- Checking whether CXX compiler struct stat has st_mtimespec member
| -- Checking whether CXX compiler struct stat has st_mtimespec member - no
| -- Looking for include files sys/types.h, ifaddrs.h
| -- Looking for include files sys/types.h, ifaddrs.h - found
| -- Checking whether CXX compiler has rlimit64
| -- Checking whether CXX compiler has rlimit64 - yes
| -- Looking for C++ include execinfo.h
| -- Looking for C++ include execinfo.h - found
| -- Checking whether backtrace works with this C++ compiler
| -- Checking whether backtrace works with this C++ compiler - yes
| -- Looking for C++ include dlfcn.h
| -- Looking for C++ include dlfcn.h - found
| -- Checking whether dladdr works with this C++ compiler
| -- Checking whether dladdr works with this C++ compiler - yes
| -- Looking for C++ include cxxabi.h
| -- Looking for C++ include cxxabi.h - found
| -- Checking whether cxxabi works with this C++ compiler
| -- Checking whether cxxabi works with this C++ compiler - yes
| -- Checking whether CXX compiler has getloadavg
| -- Checking whether CXX compiler has getloadavg - yes
| -- Checking whether <ext/stdio_filebuf.h> is available
| -- Checking whether <ext/stdio_filebuf.h> is available - yes
| -- Found ZLIB: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/lib/libz.so (found version "1.2.11")
| -- Found OpenSSL: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/lib/libcrypto.so (found version "1.1.1k")
| -- Looking for connect in socket
| -- Looking for connect in socket - not found
| -- Performing Test HAVE_SOCKADDR_IN6_SIN6_SCOPE_ID
| -- Performing Test HAVE_SOCKADDR_IN6_SIN6_SCOPE_ID - Success
| -- Performing Test HAVE_SOCKADDR_IN6_SIN6_ADDR
| -- Performing Test HAVE_SOCKADDR_IN6_SIN6_ADDR - Success
| -- Looking for OPENSSL_IS_AWSLC
| -- Looking for OPENSSL_IS_AWSLC - not found
| -- Looking for OPENSSL_IS_BORINGSSL
| -- Looking for OPENSSL_IS_BORINGSSL - not found
| -- Looking for LIBRESSL_VERSION_NUMBER
| -- Looking for LIBRESSL_VERSION_NUMBER - not found
| CMake Error at Utilities/cmcurl/CMakeLists.txt:1040 (message):
|   Found OpenSSL version 1.1.1k.  When building CMake with vendored curl, at
|   least version 3.0.0 is required, or configure CMake with
|   -DCMAKE_USE_OPENSSL=OFF to build without OpenSSL.
| 
| 
| -- Configuring incomplete, errors occurred!
| ---------------------------------------------
| Error when bootstrapping CMake:
| Problem while running initial CMake
| ---------------------------------------------
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/temp/run.do_configure.847231:137 exit 11 from '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/sources/cmake-4.5.0/bootstrap --verbose --prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr --parallel=16 -- -DCMAKE_USE_SYSTEM_LIBRARIES=1 -DCMAKE_LIBRARY_PATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/recipe-sysroot-native/usr/lib -DBUILD_CursesDialog=1 -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 -DCMAKE_USE_SYSTEM_LIBRARY_CURL=0 -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=ON -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 -DHAVE_SYS_ACL_H=0 -DCMAKE_USE_SYSTEM_LIBRARY_NGHTTP2=0 -DHAVE_EXT2FS_E
 XT2_FS_H=0 -DHAVE_WORKING_EXT2_IOC_GETFLAGS=0'
| WARNING: Backtrace (BB generated script):
| 	#1: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/temp/run.do_configure.847231, line 137
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/temp/run.do_configure.847231, line 144
NOTE: recipe cmake-native-4.5.0-r0: task do_configure: Failed
NOTE: recipe glibc-2.44+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1019 tasks of which 835 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261113051000.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261113051000.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/temp/log.do_configure.847231
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: cmake-native-4.5.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/temp/run.do_configure.847231' failed with exit code 11
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0/temp/log.do_configure.847231
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb:do_configure) failed with exit code '1'

--===============5421632010097109146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-changelog.txt"

CMake 3.18 Release Notes
************************

.. only:: html
  .. contents::
Changes made since CMake 3.17 include the following.

New Features
============

Languages
---------

Command-Line
------------

Commands
--------

Variables
---------

Properties
----------

Modules
-------

Generator Expressions
---------------------

CTest
-----

CPack
-----

Other
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 3.18.0 include the following.

3.18.1
------

3.18.2
------

3.18.3
------

CMake 3.6 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 3.5 include the following.

New Features
============

Generators
----------

Commands
--------

Variables
---------

Properties
----------

Modules
-------

Platforms
---------

CTest
-----

CPack
-----

<PackageName>_<VersionNumber>-<DebianRevisionNumber>_<DebianArchitecture>.deb

  For backward compatibility this feature is disabled by default. See
  :variable:`CPACK_DEBIAN_FILE_NAME` and
  :variable:`CPACK_DEBIAN_<COMPONENT>_FILE_NAME`.

Other
-----

Deprecated and Removed Features
===============================

Other Changes
=============

CMake 4.0 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 3.31 include the following.

New Features
============

File-Based API
--------------

Command-Line
------------

Commands
--------

Variables
---------

  See policy :policy:`CMP0181`.

Properties
----------

Modules
-------

Generator Expressions
---------------------

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

  Notes:

Updates
=======

Changes made since CMake 4.0.0 include the following.

4.0.1
-----

4.0.2
-----

4.0.3, 4.0.4
------------

4.0.5
-----

4.0.6, 4.0.7
------------

CMake 4.2 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.1 include the following.

New Features
============

File-Based API
--------------

Generators
----------

Platforms
---------

Command-Line
------------

Commands
--------

Variables
---------

Properties
----------

Modules
-------

Generator Expressions
---------------------

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.2.0 include the following.

4.2.1
-----

4.2.2
-----

4.2.3, 4.2.4, 4.2.5, 4.2.6, 4.2.7, 4.2.8
----------------------------------------

CMake 4.5 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.4 include the following.

New Features
============

Diagnostics
-----------

Presets
-------

File-Based API
--------------

Instrumentation
---------------

Generators
----------

Languages
---------

Compilers
---------

Command-Line
------------

Commands
--------

File Sets
---------

Variables
---------

Environment Variables
---------------------

Properties
----------

Modules
-------

Generator Expressions
---------------------

Autogen
-------

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

.. |CPS| replace:: Common Package Specification

--===============5421632010097109146==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-4.4.5-4.5.0.patch"

RnJvbSBhY2I0YjE5NTg3NjQxMTczMGQzYzhhMGQwYWRiOTUwYWE0YTNiYzE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTMgTm92IDIwMjYgMDU6MTE6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZSxjbWFrZS1uYXRpdmU6IHVwZ3JhZGUgNC40LjUgLT4gNC41LjAKCi0tLQogLi4uL2NtYWtl
L3tjbWFrZS1uYXRpdmVfNC40LjUuYmIgPT4gY21ha2UtbmF0aXZlXzQuNS4wLmJifSAgICAgIHwg
MAogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV80LjQu
NS5iYiA9PiBjbWFrZV80LjUuMC5iYn0gIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97
Y21ha2UtbmF0aXZlXzQuNC41LmJiID0+IGNtYWtlLW5hdGl2ZV80LjUuMC5iYn0gKDEwMCUpCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV80LjQuNS5iYiA9PiBjbWFr
ZV80LjUuMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLW5hdGl2ZV80LjQuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS1uYXRpdmVfNC41LjAuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC40LjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC41LjAuYmIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmluZGV4IDMwMjk0ZmQ5YjguLjAxZmU3MWMxMTkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBD
TUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcu
JylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9N
QUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhMGM1NGM4OGFiYjgwNzhkZDhlY2NhZGI3MTdmYzZiYjE5NGJmMThl
N2Q0NGM4NjMwOTkxMDI4ODg4NmUwNGUyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQyNDM1MmQ2
MTMzZTg0NTVlMDIwZGE3ODcwMDhlOGRjNjdhYmIxODgyMGFmMzUzMjU3MmFiMzU2NTdlNDkyMTMi
CiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVyPlxkKyhcLlxkKykrKVwu
dGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC40
LjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC41LjAuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZV80LjQuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
XzQuNS4wLmJiCi0tIAoyLjQ3LjEKCg==

--===============5421632010097109146==--

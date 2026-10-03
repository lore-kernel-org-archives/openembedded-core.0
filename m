Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D3ACA5FE7
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 06:22:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1160.1791008546425900987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 23:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bd98h64K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1EGRmbHu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1006d9a6a-1cfe6890-d38b-4f77-af16-665dd68d6524-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791008545;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=U5av+mMO2/moluvPx7NnrPFSpI6BuZkOcq/hK90RcEE=;
	b=Bd98h64KnQM5jR6/E8jjSna16CG/WgaBkx0zACVpcmGaTg80H7ZUGI4mhqmsslQf
	K3aZEAc8dYglcDTR2h/mm6taFkP4xImrKLDLybjdwcjEOoYr7rfaDEE9hA9Sl8+nTs4
	cijqI98LoL6en+iUDLDH/X64Z0FuL++gvaTer1C8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791008545;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=U5av+mMO2/moluvPx7NnrPFSpI6BuZkOcq/hK90RcEE=;
	b=1EGRmbHu2d+DWbbs4a438iOgChAACXKYLkeA3XavtDencplqo8JUXzS8cQsYfL7T
	59XvmbNw3oW/la6hHPeL6F9fxXw+87bRDqHdws1dMbistHDVibPAPg2aJCU7BPaCezL
	fOmmlCC4vWSvAYRINquJSWLSHzeMpfSovr/F9FPU=
Content-Type: multipart/mixed; boundary="===============4245740771963916757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake-native,cmake: upgrading to 4.4.4 SUCCEEDED
Message-ID: <010101a1006d9a6a-1cfe6890-d38b-4f77-af16-665dd68d6524-000000@us-west-2.amazonses.com>
Date: Sat, 3 Oct 2026 06:22:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.03-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 06:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247141

--===============4245740771963916757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-4.4.3-4.4.4.patch
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
From d4628552121243859bbab469822909fbe8f8d119 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 3 Oct 2026 05:23:47 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 4.4.3 -> 4.4.4

CMake 4.1 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.0 include the following.

New Features
============

File-Based API
--------------

Generators
----------

Command-Line
------------

Configure Log
-------------

Compilers
---------

Commands
--------

Variables
---------

Environment Variables
---------------------

Properties
----------

Modules
-------

Regular Expressions
-------------------

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.1.0 include the following.

4.1.1
-----

4.1.2
-----

4.1.3
-----

4.1.4, 4.1.5, 4.1.6
-------------------

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

CMake 4.3 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.2 include the following.

New Features
============

Common Package Specification
----------------------------

.. |CPS| replace:: Common Package Specification

Instrumentation
---------------

Presets
-------

File-Based API
--------------

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

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.3.0 include the following.

4.3.1, 4.3.2
------------

4.3.3
-----

4.3.4
-----

4.3.5
-----

CMake 4.4 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.3 include the following.

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

  The ``ASM_POASM`` language was added to support the Pelles Macro Assembler.

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

Swift
-----

CTest
-----

  The :variable:`CTEST_CONFIGURE_PRESET`, :variable:`CTEST_BUILD_PRESET`,
  :variable:`CTEST_TEST_PRESET`, :variable:`CTEST_PRESET`, and
  :variable:`CTEST_PRESETS_FILE` variables may be used to specify preset
  arguments to the above commands in a :ref:`Dashboard Client` script or
  on the :program:`ctest` command line via the
  :ctest-dashboard-option:`-D` option.

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.4.0 include the following.

4.4.1
-----

4.4.2
-----

4.4.3
-----

4.4.4
-----
---
 .../cmake/{cmake-native_4.4.3.bb => cmake-native_4.4.4.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.3.bb => cmake_4.4.4.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.3.bb => cmake-native_4.4.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.3.bb => cmake_4.4.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.3.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b6b10371ce..4c73d99fcf 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0"
+SRC_URI[sha256sum] = "bd24c30d80a7744ae84b845ff080cc8453b06c622ef01066564108e9cefc44cf"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.3.bb b/meta/recipes-devtools/cmake/cmake_4.4.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.3.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.4.bb
-- 
2.47.1


--===============4245740771963916757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-native-changelog.txt"

CMake 4.1 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.0 include the following.

New Features
============

File-Based API
--------------

Generators
----------

Command-Line
------------

Configure Log
-------------

Compilers
---------

Commands
--------

Variables
---------

Environment Variables
---------------------

Properties
----------

Modules
-------

Regular Expressions
-------------------

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.1.0 include the following.

4.1.1
-----

4.1.2
-----

4.1.3
-----

4.1.4, 4.1.5, 4.1.6
-------------------

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

CMake 4.3 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.2 include the following.

New Features
============

Common Package Specification
----------------------------

.. |CPS| replace:: Common Package Specification

Instrumentation
---------------

Presets
-------

File-Based API
--------------

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

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.3.0 include the following.

4.3.1, 4.3.2
------------

4.3.3
-----

4.3.4
-----

4.3.5
-----

CMake 4.4 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.3 include the following.

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

  The ``ASM_POASM`` language was added to support the Pelles Macro Assembler.

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

Swift
-----

CTest
-----

  The :variable:`CTEST_CONFIGURE_PRESET`, :variable:`CTEST_BUILD_PRESET`,
  :variable:`CTEST_TEST_PRESET`, :variable:`CTEST_PRESET`, and
  :variable:`CTEST_PRESETS_FILE` variables may be used to specify preset
  arguments to the above commands in a :ref:`Dashboard Client` script or
  on the :program:`ctest` command line via the
  :ctest-dashboard-option:`-D` option.

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.4.0 include the following.

4.4.1
-----

4.4.2
-----

4.4.3
-----

4.4.4
-----

--===============4245740771963916757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-changelog.txt"

CMake 4.1 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.0 include the following.

New Features
============

File-Based API
--------------

Generators
----------

Command-Line
------------

Configure Log
-------------

Compilers
---------

Commands
--------

Variables
---------

Environment Variables
---------------------

Properties
----------

Modules
-------

Regular Expressions
-------------------

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.1.0 include the following.

4.1.1
-----

4.1.2
-----

4.1.3
-----

4.1.4, 4.1.5, 4.1.6
-------------------

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

CMake 4.3 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.2 include the following.

New Features
============

Common Package Specification
----------------------------

.. |CPS| replace:: Common Package Specification

Instrumentation
---------------

Presets
-------

File-Based API
--------------

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

CTest
-----

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.3.0 include the following.

4.3.1, 4.3.2
------------

4.3.3
-----

4.3.4
-----

4.3.5
-----

CMake 4.4 Release Notes
***********************

.. only:: html
  .. contents::
Changes made since CMake 4.3 include the following.

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

  The ``ASM_POASM`` language was added to support the Pelles Macro Assembler.

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

Swift
-----

CTest
-----

  The :variable:`CTEST_CONFIGURE_PRESET`, :variable:`CTEST_BUILD_PRESET`,
  :variable:`CTEST_TEST_PRESET`, :variable:`CTEST_PRESET`, and
  :variable:`CTEST_PRESETS_FILE` variables may be used to specify preset
  arguments to the above commands in a :ref:`Dashboard Client` script or
  on the :program:`ctest` command line via the
  :ctest-dashboard-option:`-D` option.

CPack
-----

Deprecated and Removed Features
===============================

Other Changes
=============

Updates
=======

Changes made since CMake 4.4.0 include the following.

4.4.1
-----

4.4.2
-----

4.4.3
-----

4.4.4
-----

--===============4245740771963916757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/cmake/cmake: FILELIST: removed "/usr/share/cmake-4.4/Modules/Compiler/IBMLLVMFlang-Fortran.cmake /usr/share/cmake-4.4/Modules/Platform/AIX-IBMLLVMFlang-Fortran.cmake /usr/share/cmake-4.4/Modules/GoogleTest/DiscoverTests.cmake /usr/share/cmake-4.4/Modules/GoogleTest/LaunchTest.cmake", added "/usr/share/cmake-4.4/Modules/Compiler/IBMFlang-Fortran.cmake /usr/share/cmake-4.4/Modules/Platform/AIX-IBMFlang-Fortran.cmake"
Changes to packages/x86-64-v3-poky-linux/cmake (sysroot):
  /usr/share/cmake-4.4/Modules/Compiler/IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Compiler/IBMLLVMFlang-Fortran.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/DiscoverTests.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/LaunchTest.cmake was removed
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMLLVMFlang-Fortran.cmake was removed
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-4.4/Modules/Compiler/IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Compiler/IBMLLVMFlang-Fortran.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/DiscoverTests.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/LaunchTest.cmake was removed
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMLLVMFlang-Fortran.cmake was removed

--===============4245740771963916757==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-4.4.3-4.4.4.patch"

RnJvbSBkNDYyODU1MjEyMTI0Mzg1OWJiYWI0Njk4MjI5MDlmYmU4ZjhkMTE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMyBPY3QgMjAyNiAwNToyMzo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLW5hdGl2ZSxjbWFrZTogdXBncmFkZSA0LjQuMyAtPiA0LjQuNAoKQ01ha2UgNC4xIFJlbGVh
c2UgTm90ZXMKKioqKioqKioqKioqKioqKioqKioqKioKCi4uIG9ubHk6OiBodG1sCiAgLi4gY29u
dGVudHM6OgpDaGFuZ2VzIG1hZGUgc2luY2UgQ01ha2UgNC4wIGluY2x1ZGUgdGhlIGZvbGxvd2lu
Zy4KCk5ldyBGZWF0dXJlcwo9PT09PT09PT09PT0KCkZpbGUtQmFzZWQgQVBJCi0tLS0tLS0tLS0t
LS0tCgpHZW5lcmF0b3JzCi0tLS0tLS0tLS0KCkNvbW1hbmQtTGluZQotLS0tLS0tLS0tLS0KCkNv
bmZpZ3VyZSBMb2cKLS0tLS0tLS0tLS0tLQoKQ29tcGlsZXJzCi0tLS0tLS0tLQoKQ29tbWFuZHMK
LS0tLS0tLS0KClZhcmlhYmxlcwotLS0tLS0tLS0KCkVudmlyb25tZW50IFZhcmlhYmxlcwotLS0t
LS0tLS0tLS0tLS0tLS0tLS0KClByb3BlcnRpZXMKLS0tLS0tLS0tLQoKTW9kdWxlcwotLS0tLS0t
CgpSZWd1bGFyIEV4cHJlc3Npb25zCi0tLS0tLS0tLS0tLS0tLS0tLS0KCkNUZXN0Ci0tLS0tCgpD
UGFjawotLS0tLQoKRGVwcmVjYXRlZCBhbmQgUmVtb3ZlZCBGZWF0dXJlcwo9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09CgpPdGhlciBDaGFuZ2VzCj09PT09PT09PT09PT0KClVwZGF0ZXMK
PT09PT09PQoKQ2hhbmdlcyBtYWRlIHNpbmNlIENNYWtlIDQuMS4wIGluY2x1ZGUgdGhlIGZvbGxv
d2luZy4KCjQuMS4xCi0tLS0tCgo0LjEuMgotLS0tLQoKNC4xLjMKLS0tLS0KCjQuMS40LCA0LjEu
NSwgNC4xLjYKLS0tLS0tLS0tLS0tLS0tLS0tLQoKQ01ha2UgNC4yIFJlbGVhc2UgTm90ZXMKKioq
KioqKioqKioqKioqKioqKioqKioKCi4uIG9ubHk6OiBodG1sCiAgLi4gY29udGVudHM6OgpDaGFu
Z2VzIG1hZGUgc2luY2UgQ01ha2UgNC4xIGluY2x1ZGUgdGhlIGZvbGxvd2luZy4KCk5ldyBGZWF0
dXJlcwo9PT09PT09PT09PT0KCkZpbGUtQmFzZWQgQVBJCi0tLS0tLS0tLS0tLS0tCgpHZW5lcmF0
b3JzCi0tLS0tLS0tLS0KClBsYXRmb3JtcwotLS0tLS0tLS0KCkNvbW1hbmQtTGluZQotLS0tLS0t
LS0tLS0KCkNvbW1hbmRzCi0tLS0tLS0tCgpWYXJpYWJsZXMKLS0tLS0tLS0tCgpQcm9wZXJ0aWVz
Ci0tLS0tLS0tLS0KCk1vZHVsZXMKLS0tLS0tLQoKR2VuZXJhdG9yIEV4cHJlc3Npb25zCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLQoKQ1BhY2sKLS0tLS0KCkRlcHJlY2F0ZWQgYW5kIFJlbW92ZWQgRmVh
dHVyZXMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKT3RoZXIgQ2hhbmdlcwo9PT09
PT09PT09PT09CgpVcGRhdGVzCj09PT09PT0KCkNoYW5nZXMgbWFkZSBzaW5jZSBDTWFrZSA0LjIu
MCBpbmNsdWRlIHRoZSBmb2xsb3dpbmcuCgo0LjIuMQotLS0tLQoKNC4yLjIKLS0tLS0KCjQuMi4z
LCA0LjIuNCwgNC4yLjUsIDQuMi42LCA0LjIuNywgNC4yLjgKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQoKQ01ha2UgNC4zIFJlbGVhc2UgTm90ZXMKKioqKioqKioqKioq
KioqKioqKioqKioKCi4uIG9ubHk6OiBodG1sCiAgLi4gY29udGVudHM6OgpDaGFuZ2VzIG1hZGUg
c2luY2UgQ01ha2UgNC4yIGluY2x1ZGUgdGhlIGZvbGxvd2luZy4KCk5ldyBGZWF0dXJlcwo9PT09
PT09PT09PT0KCkNvbW1vbiBQYWNrYWdlIFNwZWNpZmljYXRpb24KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQoKLi4gfENQU3wgcmVwbGFjZTo6IENvbW1vbiBQYWNrYWdlIFNwZWNpZmljYXRp
b24KCkluc3RydW1lbnRhdGlvbgotLS0tLS0tLS0tLS0tLS0KClByZXNldHMKLS0tLS0tLQoKRmls
ZS1CYXNlZCBBUEkKLS0tLS0tLS0tLS0tLS0KClBsYXRmb3JtcwotLS0tLS0tLS0KCkNvbW1hbmQt
TGluZQotLS0tLS0tLS0tLS0KCkNvbW1hbmRzCi0tLS0tLS0tCgpWYXJpYWJsZXMKLS0tLS0tLS0t
CgpQcm9wZXJ0aWVzCi0tLS0tLS0tLS0KCk1vZHVsZXMKLS0tLS0tLQoKR2VuZXJhdG9yIEV4cHJl
c3Npb25zCi0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKQ1Rlc3QKLS0tLS0KCkNQYWNrCi0tLS0tCgpE
ZXByZWNhdGVkIGFuZCBSZW1vdmVkIEZlYXR1cmVzCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KCk90aGVyIENoYW5nZXMKPT09PT09PT09PT09PQoKVXBkYXRlcwo9PT09PT09CgpDaGFu
Z2VzIG1hZGUgc2luY2UgQ01ha2UgNC4zLjAgaW5jbHVkZSB0aGUgZm9sbG93aW5nLgoKNC4zLjEs
IDQuMy4yCi0tLS0tLS0tLS0tLQoKNC4zLjMKLS0tLS0KCjQuMy40Ci0tLS0tCgo0LjMuNQotLS0t
LQoKQ01ha2UgNC40IFJlbGVhc2UgTm90ZXMKKioqKioqKioqKioqKioqKioqKioqKioKCi4uIG9u
bHk6OiBodG1sCiAgLi4gY29udGVudHM6OgpDaGFuZ2VzIG1hZGUgc2luY2UgQ01ha2UgNC4zIGlu
Y2x1ZGUgdGhlIGZvbGxvd2luZy4KCk5ldyBGZWF0dXJlcwo9PT09PT09PT09PT0KCkRpYWdub3N0
aWNzCi0tLS0tLS0tLS0tCgpQcmVzZXRzCi0tLS0tLS0KCkZpbGUtQmFzZWQgQVBJCi0tLS0tLS0t
LS0tLS0tCgpJbnN0cnVtZW50YXRpb24KLS0tLS0tLS0tLS0tLS0tCgpHZW5lcmF0b3JzCi0tLS0t
LS0tLS0KCkxhbmd1YWdlcwotLS0tLS0tLS0KCkNvbXBpbGVycwotLS0tLS0tLS0KCiAgVGhlIGBg
QVNNX1BPQVNNYGAgbGFuZ3VhZ2Ugd2FzIGFkZGVkIHRvIHN1cHBvcnQgdGhlIFBlbGxlcyBNYWNy
byBBc3NlbWJsZXIuCgpDb21tYW5kLUxpbmUKLS0tLS0tLS0tLS0tCgpDb21tYW5kcwotLS0tLS0t
LQoKRmlsZSBTZXRzCi0tLS0tLS0tLQoKVmFyaWFibGVzCi0tLS0tLS0tLQoKRW52aXJvbm1lbnQg
VmFyaWFibGVzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKUHJvcGVydGllcwotLS0tLS0tLS0tCgpN
b2R1bGVzCi0tLS0tLS0KCkdlbmVyYXRvciBFeHByZXNzaW9ucwotLS0tLS0tLS0tLS0tLS0tLS0t
LS0KClN3aWZ0Ci0tLS0tCgpDVGVzdAotLS0tLQoKICBUaGUgOnZhcmlhYmxlOmBDVEVTVF9DT05G
SUdVUkVfUFJFU0VUYCwgOnZhcmlhYmxlOmBDVEVTVF9CVUlMRF9QUkVTRVRgLAogIDp2YXJpYWJs
ZTpgQ1RFU1RfVEVTVF9QUkVTRVRgLCA6dmFyaWFibGU6YENURVNUX1BSRVNFVGAsIGFuZAogIDp2
YXJpYWJsZTpgQ1RFU1RfUFJFU0VUU19GSUxFYCB2YXJpYWJsZXMgbWF5IGJlIHVzZWQgdG8gc3Bl
Y2lmeSBwcmVzZXQKICBhcmd1bWVudHMgdG8gdGhlIGFib3ZlIGNvbW1hbmRzIGluIGEgOnJlZjpg
RGFzaGJvYXJkIENsaWVudGAgc2NyaXB0IG9yCiAgb24gdGhlIDpwcm9ncmFtOmBjdGVzdGAgY29t
bWFuZCBsaW5lIHZpYSB0aGUKICA6Y3Rlc3QtZGFzaGJvYXJkLW9wdGlvbjpgLURgIG9wdGlvbi4K
CkNQYWNrCi0tLS0tCgpEZXByZWNhdGVkIGFuZCBSZW1vdmVkIEZlYXR1cmVzCj09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCk90aGVyIENoYW5nZXMKPT09PT09PT09PT09PQoKVXBkYXRl
cwo9PT09PT09CgpDaGFuZ2VzIG1hZGUgc2luY2UgQ01ha2UgNC40LjAgaW5jbHVkZSB0aGUgZm9s
bG93aW5nLgoKNC40LjEKLS0tLS0KCjQuNC4yCi0tLS0tCgo0LjQuMwotLS0tLQoKNC40LjQKLS0t
LS0KLS0tCiAuLi4vY21ha2Uve2NtYWtlLW5hdGl2ZV80LjQuMy5iYiA9PiBjbWFrZS1uYXRpdmVf
NC40LjQuYmJ9ICAgICAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2Uve2NtYWtlXzQuNC4zLmJiID0+IGNtYWtlXzQuNC40LmJifSAgfCAwCiAzIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC40LjMuYmIgPT4gY21ha2UtbmF0aXZlXzQu
NC40LmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtl
XzQuNC4zLmJiID0+IGNtYWtlXzQuNC40LmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuNC4zLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEw
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80
LjQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2
ZV80LjQuNC5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggYjZiMTAz
NzFjZS4uNGM3M2Q5OWZjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBA
IC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRW
YXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3Jn
L2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM0NjQwMDYxOGI0ZjFmMmI0MzUwN2Yy
NGZiMjJmM2FlODMwYzM0MTZjZjIzYjc3NmUxNmUxZDQxM2FhODkyZjAiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYmQyNGMzMGQ4MGE3NzQ0YWU4NGI4NDVmZjA4MGNjODQ1M2IwNmM2MjJlZjAxMDY2
NTY0MTA4ZTljZWZjNDRjZiIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiY21ha2UtKD9QPHB2
ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZV80LjQuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV80LjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2VfNC40LjQuYmIKLS0gCjIuNDcuMQoK

--===============4245740771963916757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1376924192 to 1377599784 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10912545 to 10916078 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.4.3/Source/cmsys -> /usr/src/debug/cmake/4.4.4/Source/cmsys, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/std/cm -> /usr/src/debug/cmake/4.4.4/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.4.4/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/cmelf -> /usr/src/debug/cmake/4.4.4/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.4.4/Utilities/cmlibrhash/librhash, directory renamed /usr/src/debug/cmake/4.4.3/Source/CPack/IFW -> /usr/src/debug/cmake/4.4.4/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.4.3/Source/LexerParser -> /usr/src/debug/cmake/4.4.4/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.4.3/Source -> /usr/src/debug/cmake/4.4.4/Source, directory renamed /usr/src/debug/cmake/4.4.3/Source/CTest
  -> /usr/src/debug/cmake/4.4.4/Source/CTest, directory renamed /usr/src/debug/cmake/4.4.3/Source/kwsys -> /usr/src/debug/cmake/4.4.4/Source/kwsys, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.4.4/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.4.4/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.4.4/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.4.4/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.4.3/Source/CPack -> /usr/src/debug/cmake/4.4.4/Source/CPack, directory renamed /usr/src/debug/cmake/4.4.3/Utilities/std/cmext -> /usr/src/debug/cmake/4.4.4/Utilities/std/cmext
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 54628004 to 54636473 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: FILELIST: removed "/usr/share/cmake-4.4/Modules/Platform/AIX-IBMLLVMFlang-Fortran.cmake /usr/share/cmake-4.4/Modules/GoogleTest/DiscoverTests.cmake /usr/share/cmake-4.4/Modules/Compiler/IBMLLVMFlang-Fortran.cmake /usr/share/cmake-4.4/Modules/GoogleTest/LaunchTest.cmake", added "/usr/share/cmake-4.4/Modules/Compiler/IBMFlang-Fortran.cmake /usr/share/cmake-4.4/Modules/Platform/AIX-IBMFlang-Fortran.cmake"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.4.3" to "4.4.4"
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.4/cmake-4.4.3.tar.gz" to "https://cmake.org/files/v4.4/cmake-4.4.4.tar.gz"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.4.3 [default] to 4.4.4 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.4.3" to "4.4.4"
Changes to packages/x86-64-v3-poky-linux/cmake (sysroot):
  /usr/share/cmake-4.4/Modules/Compiler/IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Compiler/IBMLLVMFlang-Fortran.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/DiscoverTests.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/LaunchTest.cmake was removed
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMLLVMFlang-Fortran.cmake was removed
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-4.4/Modules/Compiler/IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMFlang-Fortran.cmake was added
  /usr/share/cmake-4.4/Modules/Compiler/IBMLLVMFlang-Fortran.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/DiscoverTests.cmake was removed
  /usr/share/cmake-4.4/Modules/GoogleTest/LaunchTest.cmake was removed
  /usr/share/cmake-4.4/Modules/Platform/AIX-IBMLLVMFlang-Fortran.cmake was removed

--===============4245740771963916757==--


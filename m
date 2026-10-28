Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36890.1793167559249730037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f/85oN6B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N0LlDcXL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1811d85df-ead7a583-a9c5-4d28-9570-9185f60ba7e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167558;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=JoRmDhI1zQ/VP/1jZLKAv4ESctm5tLnoCV1D4ghDRnQ=;
	b=f/85oN6BrCi6dx1Q4TSOpgKJp+my45ErlTT5aZTx4CNyVD4AFaB/7+IdnY6y7z+Q
	k3csJoCJPHuZoh141ErCRl3RCs7GQp3dhuwhn1oMglFZ8gLp4wNlNlMKjaFzrvq/TEy
	R69Qs5EuyX3tEENo9rsYngONwsxOPlWT07kOAudU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167558;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=JoRmDhI1zQ/VP/1jZLKAv4ESctm5tLnoCV1D4ghDRnQ=;
	b=N0LlDcXL0GuCcy7L9HfyP5szZ/ubDfbOyem3l7Qz86NLsYp9X4oRkDLS44wM0liF
	ucZdyI2P+amL4EASrC/mknrAIzvOkku88YpCdPKUOAxNByGusplKEa3bRROKrwSDrzM
	qtscPQB28KpNSBvFi7kwzHs93rVv9tE9Z5uihg3I=
Content-Type: multipart/mixed; boundary="===============0462791816514872795=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake-native,cmake: upgrading to 4.4.5 SUCCEEDED
Message-ID: <010101a1811d85df-ead7a583-a9c5-4d28-9570-9185f60ba7e2-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:05:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248776

--===============0462791816514872795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-4.4.4-4.4.5.patch
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
From 71ad9a3a351931c84763fc41e9186db649f22fca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 28 Oct 2026 05:24:02 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 4.4.4 -> 4.4.5

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

4.3.5, 4.3.6
------------

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

4.4.4, 4.4.5
------------
---
 .../cmake/{cmake-native_4.4.4.bb => cmake-native_4.4.5.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.4.bb => cmake_4.4.5.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.4.bb => cmake-native_4.4.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.4.bb => cmake_4.4.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.4.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4c73d99fcf..30294fd9b8 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "bd24c30d80a7744ae84b845ff080cc8453b06c622ef01066564108e9cefc44cf"
+SRC_URI[sha256sum] = "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309910288886e04e2"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.4.bb b/meta/recipes-devtools/cmake/cmake_4.4.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.4.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.5.bb
-- 
2.47.1


--===============0462791816514872795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1377599776 to 1377605416 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10916078 to 10916643 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.4.4/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.4.5/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.4.4/Source/CPack/IFW -> /usr/src/debug/cmake/4.4.5/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/std/cm -> /usr/src/debug/cmake/4.4.5/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.4.5/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.4.5/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/std/cmext -> /usr/src/debug/cmake/4.4.5/Utilities/std/cmext, directory renamed /usr/src/debug/cmake/4.4.4/Source/CTest -> /usr/src/debug/cmake/4.4.5/Source/CTest, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/cmelf -> /usr/src/de
 bug/cmake/4.4.5/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.4.5/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.4.4/Source/kwsys -> /usr/src/debug/cmake/4.4.5/Source/kwsys, directory renamed /usr/src/debug/cmake/4.4.4/Source/cmsys -> /usr/src/debug/cmake/4.4.5/Source/cmsys, directory renamed /usr/src/debug/cmake/4.4.4/Source/LexerParser -> /usr/src/debug/cmake/4.4.5/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.4.5/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.4.4/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.4.5/Utilities/cmlibrhash/librhash, directory renamed /usr/src/debug/cmake/4.4.4/Source/CPack -> /usr/src/debug/cmake/4.4.5/Source/CPack, directory renamed /usr/src/debug/cmake/4.4.4/Source -> /usr/src/debug/cmake/4.4.5/Source
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 54636473 to 54636621 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.4.4" to "4.4.5"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.4.4 [default] to 4.4.5 [default]
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.4/cmake-4.4.4.tar.gz" to "https://cmake.org/files/v4.4/cmake-4.4.5.tar.gz"

--===============0462791816514872795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-native-changelog.txt"

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

4.3.5, 4.3.6
------------

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

4.4.4, 4.4.5
------------

--===============0462791816514872795==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-4.4.4-4.4.5.patch"

RnJvbSA3MWFkOWEzYTM1MTkzMWM4NDc2M2ZjNDFlOTE4NmRiNjQ5ZjIyZmNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjggT2N0IDIwMjYgMDU6MjQ6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZS1uYXRpdmUsY21ha2U6IHVwZ3JhZGUgNC40LjQgLT4gNC40LjUKCkNNYWtlIDQuMyBSZWxl
YXNlIE5vdGVzCioqKioqKioqKioqKioqKioqKioqKioqCgouLiBvbmx5OjogaHRtbAogIC4uIGNv
bnRlbnRzOjoKQ2hhbmdlcyBtYWRlIHNpbmNlIENNYWtlIDQuMiBpbmNsdWRlIHRoZSBmb2xsb3dp
bmcuCgpOZXcgRmVhdHVyZXMKPT09PT09PT09PT09CgpDb21tb24gUGFja2FnZSBTcGVjaWZpY2F0
aW9uCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi4uIHxDUFN8IHJlcGxhY2U6OiBDb21t
b24gUGFja2FnZSBTcGVjaWZpY2F0aW9uCgpJbnN0cnVtZW50YXRpb24KLS0tLS0tLS0tLS0tLS0t
CgpQcmVzZXRzCi0tLS0tLS0KCkZpbGUtQmFzZWQgQVBJCi0tLS0tLS0tLS0tLS0tCgpQbGF0Zm9y
bXMKLS0tLS0tLS0tCgpDb21tYW5kLUxpbmUKLS0tLS0tLS0tLS0tCgpDb21tYW5kcwotLS0tLS0t
LQoKVmFyaWFibGVzCi0tLS0tLS0tLQoKUHJvcGVydGllcwotLS0tLS0tLS0tCgpNb2R1bGVzCi0t
LS0tLS0KCkdlbmVyYXRvciBFeHByZXNzaW9ucwotLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkNUZXN0
Ci0tLS0tCgpDUGFjawotLS0tLQoKRGVwcmVjYXRlZCBhbmQgUmVtb3ZlZCBGZWF0dXJlcwo9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpPdGhlciBDaGFuZ2VzCj09PT09PT09PT09PT0K
ClVwZGF0ZXMKPT09PT09PQoKQ2hhbmdlcyBtYWRlIHNpbmNlIENNYWtlIDQuMy4wIGluY2x1ZGUg
dGhlIGZvbGxvd2luZy4KCjQuMy4xLCA0LjMuMgotLS0tLS0tLS0tLS0KCjQuMy4zCi0tLS0tCgo0
LjMuNAotLS0tLQoKNC4zLjUsIDQuMy42Ci0tLS0tLS0tLS0tLQoKQ01ha2UgNC40IFJlbGVhc2Ug
Tm90ZXMKKioqKioqKioqKioqKioqKioqKioqKioKCi4uIG9ubHk6OiBodG1sCiAgLi4gY29udGVu
dHM6OgpDaGFuZ2VzIG1hZGUgc2luY2UgQ01ha2UgNC4zIGluY2x1ZGUgdGhlIGZvbGxvd2luZy4K
Ck5ldyBGZWF0dXJlcwo9PT09PT09PT09PT0KCkRpYWdub3N0aWNzCi0tLS0tLS0tLS0tCgpQcmVz
ZXRzCi0tLS0tLS0KCkZpbGUtQmFzZWQgQVBJCi0tLS0tLS0tLS0tLS0tCgpJbnN0cnVtZW50YXRp
b24KLS0tLS0tLS0tLS0tLS0tCgpHZW5lcmF0b3JzCi0tLS0tLS0tLS0KCkxhbmd1YWdlcwotLS0t
LS0tLS0KCkNvbXBpbGVycwotLS0tLS0tLS0KCiAgVGhlIGBgQVNNX1BPQVNNYGAgbGFuZ3VhZ2Ug
d2FzIGFkZGVkIHRvIHN1cHBvcnQgdGhlIFBlbGxlcyBNYWNybyBBc3NlbWJsZXIuCgpDb21tYW5k
LUxpbmUKLS0tLS0tLS0tLS0tCgpDb21tYW5kcwotLS0tLS0tLQoKRmlsZSBTZXRzCi0tLS0tLS0t
LQoKVmFyaWFibGVzCi0tLS0tLS0tLQoKRW52aXJvbm1lbnQgVmFyaWFibGVzCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLQoKUHJvcGVydGllcwotLS0tLS0tLS0tCgpNb2R1bGVzCi0tLS0tLS0KCkdlbmVy
YXRvciBFeHByZXNzaW9ucwotLS0tLS0tLS0tLS0tLS0tLS0tLS0KClN3aWZ0Ci0tLS0tCgpDVGVz
dAotLS0tLQoKICBUaGUgOnZhcmlhYmxlOmBDVEVTVF9DT05GSUdVUkVfUFJFU0VUYCwgOnZhcmlh
YmxlOmBDVEVTVF9CVUlMRF9QUkVTRVRgLAogIDp2YXJpYWJsZTpgQ1RFU1RfVEVTVF9QUkVTRVRg
LCA6dmFyaWFibGU6YENURVNUX1BSRVNFVGAsIGFuZAogIDp2YXJpYWJsZTpgQ1RFU1RfUFJFU0VU
U19GSUxFYCB2YXJpYWJsZXMgbWF5IGJlIHVzZWQgdG8gc3BlY2lmeSBwcmVzZXQKICBhcmd1bWVu
dHMgdG8gdGhlIGFib3ZlIGNvbW1hbmRzIGluIGEgOnJlZjpgRGFzaGJvYXJkIENsaWVudGAgc2Ny
aXB0IG9yCiAgb24gdGhlIDpwcm9ncmFtOmBjdGVzdGAgY29tbWFuZCBsaW5lIHZpYSB0aGUKICA6
Y3Rlc3QtZGFzaGJvYXJkLW9wdGlvbjpgLURgIG9wdGlvbi4KCkNQYWNrCi0tLS0tCgpEZXByZWNh
dGVkIGFuZCBSZW1vdmVkIEZlYXR1cmVzCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
Ck90aGVyIENoYW5nZXMKPT09PT09PT09PT09PQoKVXBkYXRlcwo9PT09PT09CgpDaGFuZ2VzIG1h
ZGUgc2luY2UgQ01ha2UgNC40LjAgaW5jbHVkZSB0aGUgZm9sbG93aW5nLgoKNC40LjEKLS0tLS0K
CjQuNC4yCi0tLS0tCgo0LjQuMwotLS0tLQoKNC40LjQsIDQuNC41Ci0tLS0tLS0tLS0tLQotLS0K
IC4uLi9jbWFrZS97Y21ha2UtbmF0aXZlXzQuNC40LmJiID0+IGNtYWtlLW5hdGl2ZV80LjQuNS5i
Yn0gICAgICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97
Y21ha2VfNC40LjQuYmIgPT4gY21ha2VfNC40LjUuYmJ9ICB8IDAKIDMgZmlsZXMgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2Uve2NtYWtlLW5hdGl2ZV80LjQuNC5iYiA9PiBjbWFrZS1uYXRpdmVfNC40LjUuYmJ9
ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfNC40LjQu
YmIgPT4gY21ha2VfNC40LjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC40LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2UtbmF0aXZlXzQuNC41LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuNC40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuNC41
LmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwppbmRleCA0YzczZDk5ZmNmLi4z
MDI5NGZkOWI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Uu
aW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAgLTE5LDcg
KzE5LDcgQEAgQ01BS0VfTUFKT1JfVkVSU0lPTiA9ICIke0AnLicuam9pbihkLmdldFZhcignUFYn
KS5zcGxpdCgnLicpWzA6Ml0pfSIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9jbWFrZS5vcmcvZmlsZXMv
diR7Q01BS0VfTUFKT1JfVkVSU0lPTn0vY21ha2UtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQyNGMzMGQ4MGE3NzQ0YWU4NGI4NDVmZjA4MGNj
ODQ1M2IwNmM2MjJlZjAxMDY2NTY0MTA4ZTljZWZjNDRjZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJhMGM1NGM4OGFiYjgwNzhkZDhlY2NhZGI3MTdmYzZiYjE5NGJmMThlN2Q0NGM4NjMwOTkxMDI4
ODg4NmUwNGUyIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZlcj5cZCso
XC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlXzQuNC40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuNC41
LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2VfNC40LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZV80LjQuNS5iYgotLSAKMi40Ny4xCgo=

--===============0462791816514872795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-changelog.txt"

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

4.3.5, 4.3.6
------------

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

4.4.4, 4.4.5
------------

--===============0462791816514872795==--

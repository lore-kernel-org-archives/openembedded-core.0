Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843F1C55166
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6065.1785309865988834851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fHwjFdot;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nqFPu+by;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019facc2a3d8-be34cc92-922f-4c94-84b3-66eadf66cbc9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309865;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=iVUkmpvsBg+BQHoUIBCu92o6UQ9Dj8hWNrRk3fPSC08=;
	b=fHwjFdotdPVq7A5Z2j3ZRoKgStTgy8s+ewxHM2/Fabqdq4sdCzF2AqqVBKtVOHCZ
	NPIFK6kt7mf+uDhEBVPKRNGDPa7AknJY745s+h4DPCZS8GI1WyN1YIMxg7IL/kq1JQp
	rpwnSoddJUHzdhXmpJMB5FqEJi9vbimsdxSXxoH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309865;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=iVUkmpvsBg+BQHoUIBCu92o6UQ9Dj8hWNrRk3fPSC08=;
	b=nqFPu+bybpM+PQWPBpSKHkPVl13QO/pL0TxXNMnqaUnhHG3q2lMkiSIBBoCRuKoj
	P4dOsgaYUirA7Fbsh6ehFNyvkxP2knAY1VqMkxmc1HwYJJmMGa71FKj/SODrJAPNnca
	Bs++ASHMWRq25LYzKA6A2d7QMzg0dRQhauAWLlwY=
Content-Type: multipart/mixed; boundary="===============2857210727937409674=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake,cmake-native: upgrading to 4.4.1,4.4.1 SUCCEEDED
Message-ID: <0101019facc2a3d8-be34cc92-922f-4c94-84b3-66eadf66cbc9-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242240

--===============2857210727937409674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.4.1,4.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-4.4.0-4.4.1-4.4.0-4.4.1.patch
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
From 3b36178139895ad972c8f3d231b4be128ea1c00b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 05:34:59 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 4.4.0 -> 4.4.1,4.4.0 -> 4.4.1

Source: Help/release/4.4.rst

CMake 4.4 Release Notes
***********************

.. only:: html

  .. contents::

Changes made since CMake 4.3 include the following.

New Features
============

Diagnostics
-----------

* CMake diagnostic actions are now tracked in a new state type managed by the
  :command:`cmake_diagnostic` command.  This replaces the old system which
  sometimes used variables to manage reporting actions and sometimes did not
  allow management beyond command-line options and presets.  The new system
  also introduces several new diagnostic categories and significantly reduces
  the cost of adding additional categories in the future.  See the
  :manual:`cmake-diagnostics(7)` manual for a list of available categories.

* The :diagnostic:`CMD_INSTALL_ABSOLUTE_DESTINATION` diagnostic category
  was added to diagnose :command:`install` commands that specify an
  absolute ``DESTINATION``.  This diagnostic may be controlled with the
  :option:`-Winstall-absolute-destination <cmake -W>` command-line option,
  the ``installAbsoluteDestination`` field in a
  :manual:`CMake Presets <cmake-presets(7)>`
  :preset:`configurePresets.warnings` object,
  or the :command:`cmake_diagnostic` command.

Presets
-------

* :manual:`cmake-presets(7)` files now support schema version 12.

* :manual:`cmake(1)`, :manual:`ctest(1)`, and :manual:`cpack(1)` gained
  ``--presets-file`` arguments to support loading
  :manual:`presets <cmake-presets(7)>` from the specified file instead of
  ``CMakePresets.json`` and/or ``CMakeUserPresets.json``. See
  :option:`cmake --presets-file`,
  :option:`cmake --build --presets-file <cmake--build --presets-file>`,
  :option:`cmake --workflow --presets-file <cmake--workflow --presets-file>`,
  :option:`ctest --presets-file`, and :option:`cpack --presets-file` for details.

* :manual:`cmake-presets(7)`, in schema version 12 and above, now expand the
  :ref:`${fileDir} <CMakePresets fileDir>` macro to the directory of the
  presets file containing the ``${fileDir}`` macro, regardless of whether
  it is inherited by another preset in a different directory.

* :manual:`cmake-presets(7)` gained support for a
  ``testPassthroughArguments`` field in the
  test preset ``execution`` object for
  forwarding arguments to test executables via presets.

File-Based API
--------------

* The :manual:`cmake-file-api(7)` "codemodel" version 2 object has been
  updated to 2.11.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" and "interfaceSources" objects gained new ``fileSetIndexes`` fields
  to support sources belonging to multiple file sets. The ``fileSetIndex``
  fields are maintained for backwards compatibility only, and users are advised
  to port to the new fields.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" object gained a new ``backtraces`` field to represent multiple
  command invocations which associate a single source for a given target with
  mult

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]

Source: Help/release/4.4.rst

CMake 4.4 Release Notes
***********************

.. only:: html

  .. contents::

Changes made since CMake 4.3 include the following.

New Features
============

Diagnostics
-----------

* CMake diagnostic actions are now tracked in a new state type managed by the
  :command:`cmake_diagnostic` command.  This replaces the old system which
  sometimes used variables to manage reporting actions and sometimes did not
  allow management beyond command-line options and presets.  The new system
  also introduces several new diagnostic categories and significantly reduces
  the cost of adding additional categories in the future.  See the
  :manual:`cmake-diagnostics(7)` manual for a list of available categories.

* The :diagnostic:`CMD_INSTALL_ABSOLUTE_DESTINATION` diagnostic category
  was added to diagnose :command:`install` commands that specify an
  absolute ``DESTINATION``.  This diagnostic may be controlled with the
  :option:`-Winstall-absolute-destination <cmake -W>` command-line option,
  the ``installAbsoluteDestination`` field in a
  :manual:`CMake Presets <cmake-presets(7)>`
  :preset:`configurePresets.warnings` object,
  or the :command:`cmake_diagnostic` command.

Presets
-------

* :manual:`cmake-presets(7)` files now support schema version 12.

* :manual:`cmake(1)`, :manual:`ctest(1)`, and :manual:`cpack(1)` gained
  ``--presets-file`` arguments to support loading
  :manual:`presets <cmake-presets(7)>` from the specified file instead of
  ``CMakePresets.json`` and/or ``CMakeUserPresets.json``. See
  :option:`cmake --presets-file`,
  :option:`cmake --build --presets-file <cmake--build --presets-file>`,
  :option:`cmake --workflow --presets-file <cmake--workflow --presets-file>`,
  :option:`ctest --presets-file`, and :option:`cpack --presets-file` for details.

* :manual:`cmake-presets(7)`, in schema version 12 and above, now expand the
  :ref:`${fileDir} <CMakePresets fileDir>` macro to the directory of the
  presets file containing the ``${fileDir}`` macro, regardless of whether
  it is inherited by another preset in a different directory.

* :manual:`cmake-presets(7)` gained support for a
  ``testPassthroughArguments`` field in the
  test preset ``execution`` object for
  forwarding arguments to test executables via presets.

File-Based API
--------------

* The :manual:`cmake-file-api(7)` "codemodel" version 2 object has been
  updated to 2.11.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" and "interfaceSources" objects gained new ``fileSetIndexes`` fields
  to support sources belonging to multiple file sets. The ``fileSetIndex``
  fields are maintained for backwards compatibility only, and users are advised
  to port to the new fields.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" object gained a new ``backtraces`` field to represent multiple
  command invocations which associate a single source for a given target with
  mult

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../cmake/{cmake-native_4.4.0.bb => cmake-native_4.4.1.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.0.bb => cmake_4.4.1.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.0.bb => cmake-native_4.4.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.0.bb => cmake_4.4.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 85b444d9f9..45172da729 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "65757f442fdd242e27f1728fc26dc0cba4164f7a0791a5c788631c00080369bc"
+SRC_URI[sha256sum] = "95d4721f3625fb0d9d6ca480dd59a46c84b4c157f7fadd2e9b179ef9c871174d"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.0.bb b/meta/recipes-devtools/cmake/cmake_4.4.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.1.bb
-- 
2.47.1


--===============2857210727937409674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-native-changelog.txt"

Changelog for cmake-native: 4.4.0 -> 4.4.1
Source: Help/release/4.4.rst

CMake 4.4 Release Notes
***********************

.. only:: html

  .. contents::

Changes made since CMake 4.3 include the following.

New Features
============

Diagnostics
-----------

* CMake diagnostic actions are now tracked in a new state type managed by the
  :command:`cmake_diagnostic` command.  This replaces the old system which
  sometimes used variables to manage reporting actions and sometimes did not
  allow management beyond command-line options and presets.  The new system
  also introduces several new diagnostic categories and significantly reduces
  the cost of adding additional categories in the future.  See the
  :manual:`cmake-diagnostics(7)` manual for a list of available categories.

* The :diagnostic:`CMD_INSTALL_ABSOLUTE_DESTINATION` diagnostic category
  was added to diagnose :command:`install` commands that specify an
  absolute ``DESTINATION``.  This diagnostic may be controlled with the
  :option:`-Winstall-absolute-destination <cmake -W>` command-line option,
  the ``installAbsoluteDestination`` field in a
  :manual:`CMake Presets <cmake-presets(7)>`
  :preset:`configurePresets.warnings` object,
  or the :command:`cmake_diagnostic` command.

Presets
-------

* :manual:`cmake-presets(7)` files now support schema version 12.

* :manual:`cmake(1)`, :manual:`ctest(1)`, and :manual:`cpack(1)` gained
  ``--presets-file`` arguments to support loading
  :manual:`presets <cmake-presets(7)>` from the specified file instead of
  ``CMakePresets.json`` and/or ``CMakeUserPresets.json``. See
  :option:`cmake --presets-file`,
  :option:`cmake --build --presets-file <cmake--build --presets-file>`,
  :option:`cmake --workflow --presets-file <cmake--workflow --presets-file>`,
  :option:`ctest --presets-file`, and :option:`cpack --presets-file` for details.

* :manual:`cmake-presets(7)`, in schema version 12 and above, now expand the
  :ref:`${fileDir} <CMakePresets fileDir>` macro to the directory of the
  presets file containing the ``${fileDir}`` macro, regardless of whether
  it is inherited by another preset in a different directory.

* :manual:`cmake-presets(7)` gained support for a
  ``testPassthroughArguments`` field in the
  test preset ``execution`` object for
  forwarding arguments to test executables via presets.

File-Based API
--------------

* The :manual:`cmake-file-api(7)` "codemodel" version 2 object has been
  updated to 2.11.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" and "interfaceSources" objects gained new ``fileSetIndexes`` fields
  to support sources belonging to multiple file sets. The ``fileSetIndex``
  fields are maintained for backwards compatibility only, and users are advised
  to port to the new fields.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" object gained a new ``backtraces`` field to represent multiple
  command invocations which associate a single source for a given target with
  multiple file sets. The ``backtrace`` field is maintained for backwards
  compatibility only, and users are advised to port to the new field.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "installers" object's
  optional ``fileSetType`` field gained a new ``SOURCES`` value to incorporate
  the new ``SOURCES`` :ref:`file set <file sets>` type in codemodel replies.

Instrumentation
---------------

* The :manual:`cmake-instrumentation(7)` data version has been updated to 1.1.
* :manual:`cmake-instrumentation(7)` gained a ``captureOutput`` option which
  collects the ``stdout`` and ``stderr`` of instrumented commands.
* :manual:`cmake-instrumentation(7)` gained a ``compileTrace`` option which
  records compiler-generated trace files (e.g., from Clang's ``-ftime-trace``
  flag).

Generators
----------

* The :ref:`Ninja Generators` now support generating a build target named
  ``test_prep/<test-name>`` for each test added by :command:`add_test`, which
  builds all dependencies for that test. Build dependencies are registered for
  an executable target invoked by the test, targets referenced in generator
  expressions in the test command, and explicit dependencies added using the
  new ``BUILD_DEPENDS`` option. This behavior is enabled by the new
  :variable:`CMAKE_TEST_BUILD_DEPENDS` variable. A ``test_prep/all``
  target is also generated to depend on every ``test_prep/<test-name>``
  target. Tests with names that are not valid target names are excluded from
  this behavior. If multiple tests in different directories share the same
  name, their dependencies are merged into one ``test_prep/<test-name>``
  target.

Languages
---------

* CUDA language level 23 (corresponding to C++ 23) is now supported with
  NVCC 13.3 and above.

Compilers
---------

* C++ 20 named modules are now supported with ``clang-cl``, except with the
  :ref:`Visual Studio Generators` (i.e., the ``ClangCl``
  :variable:`toolset <CMAKE_GENERATOR_TOOLSET>`).
  See :manual:`cmake-cxxmodules(7)`.

* The ``ibm-flang`` compiler is now supported with
  :variable:`compiler id <CMAKE_<LANG>_COMPILER_ID>` ``IBMFlang``.

* The `Pelles C`_ toolchain is now supported with
  :variable:`compiler id <CMAKE_<LANG>_COMPILER_ID>` ``PellesC``.

  The ``ASM_POASM`` language was added to support the Pelles Macro Assembler.

* The Open Watcom ``wlink`` linker is now identified with
  :variable:`CMAKE_<LANG>_COMPILER_LINKER_ID` ``OpenWatcom``.

* The `wild linker <https://github.com/wild-linker/wild>`_ is now
  supported with :variable:`CMAKE_<LANG>_COMPILER_LINKER_ID` ``WILD``.

Command-Line
------------

* :manual:`cmake(1)` now supports ``--build <dir> --preset <pre>``
  regardless of the current working directory.

* The :option:`cmake -D` command-line option now populates a
  default :prop_cache:`HELPSTRING` for variables known to CMake.

* :option:`cmake --install` now supports installing multiple components.

* :option:`cmake --install` now accepts ``-j<N>`` in addition to ``-j <N>``
  for specifying the number of parallel jobs.

* The :option:`cmake -E` commands
  :option:`copy_if_different <cmake-E copy_if_different>`,
  :option:`copy_if_newer <cmake-E copy_if_newer>`,
  :option:`copy_directory <cmake-E copy_directory>`,
  :option:`copy_directory_if_different <cmake-E copy_directory_if_different>`,
  and :option:`copy_directory_if_newer <cmake-E copy_directory_if_newer>`
  gained support for the ``-t`` argument.

* The :option:`cmake -E tar <cmake-E tar>` command-line tool gained the
  :option:`--cmake-tar-encoding <cmake-E_tar --cmake-tar-encoding>` flag
  to specify the pathname encoding used in archives.

Commands
--------

* The :command:`block` command can now create a ``DIAGNOSTICS`` scope.

* The :command:`cmake_diagnostic` command was added to manipulate CMake's
  diagnostic state.

* The :command:`cmake_parse_arguments` command gained a new ``PARSE_ARGN``
  signature that starts parsing after the last named argument of the calling
  function and works exactly like ``PARSE_ARGV`` with ``<N>`` being the number
  of parameters in the function definition.

* The :command:`discover_tests` command was added to support registering tests
  discovered at test time by :manual:`ctest(1)`. It runs a user-provided
  discovery command, parses its output, and generates test names, arguments,
  and properties from regular-expression captures.

* The :command:`execute_process` command gained
  ``ENVIRONMENT`` and ``ENVIRONMENT_MODIFICATION`` options to run child
  processes with a modified environment.

* The :command:`file(ARCHIVE_CREATE)` and :command:`file(ARCHIVE_EXTRACT)`
  commands gained an ``ENCODING`` option to specify the encoding of the
  archive pathnames.  The default is now ``UTF-8``.
  See policy :policy:`CMP0213`.

* The :command:`file(READ_SYMLINK)` command gained a ``RESULT``
  option to capture errors without failing.

* The :command:`if` command gained a new ``DIAGNOSTIC`` operator that evaluates
  to true if a given diagnostic category name is known to CMake.

* The :command:`include` command now has a ``NO_DIAGNOSTIC_SCOPE`` option.

* The :command:`list(FILTER)` command gained a new ``PREDICATE`` mode
  that invokes a user-defined :command:`function` to decide which elements are
  included or excluded, complementing the existing ``REGEX`` mode.

* The :command:`list(SORT)` command gained a new ``COMPARATOR`` keyword
  that invokes a user-defined :command:`function` to compare elements, complementing
  the built-in ``COMPARE`` methods.

* The :command:`list(TRANSFORM)` command gained a new ``APPLY`` action that
  invokes a user-defined :command:`function` for each element of the list,
  enabling arbitrary per-element transformations.

* The :command:`list(TRANSFORM)` command gained a new ``PREDICATE`` selector
  that invokes a user-defined :command:`function` to decide which elements are
  transformed.

* The :command:`string(JSON ... PARTIAL_EQUAL) <string(JSON-PARTIAL_EQUAL)>`
  command was added to compare two JSON values using *partial* equality.

File Sets
---------

* A ``SOURCES`` :ref:`file set <file sets>` type was added to specify
  a target's source files via file sets.

* The :prop_fs:`CXX_SCAN_FOR_MODULES` file set property was added to
  control whether a file set's sources are scanned for C++ modules.

* The :prop_fs:`INDEPENDENT_FILES` file set property was added to
  specify that a file set's sources do not depend on any generated files.

* The :prop_fs:`JOB_POOL_COMPILE` file set property was added to
  assign a file set's sources to a specific Ninja job pool.

* The :prop_fs:`SCOPE`, :prop_fs:`TYPE`, :prop_fs:`BASE_DIRS`,
  :prop_fs:`SOURCES`, and :prop_fs:`INTERFACE_SOURCES` file set
  properties were added to provide the declared details of a file set.

* The :prop_fs:`SKIP_LINTING` file set property was added to exclude
  a file set's sources from target-wide code checks.

* The :prop_fs:`SKIP_PRECOMPILE_HEADERS` file set property was added
  to avoid using precompiled headers for a file set's sources.

* The :prop_fs:`SKIP_UNITY_BUILD_INCLUSION` file set property was added
  to exclude a file set's sources from inclusion in unity builds.

Variables
---------

* The :variable:`CMAKE_INSTALL_DEFAULT_COMPONENT_NAME` variable gained
  support for a special ``<PROJECT_NAME>`` placeholder value.
  It tells each :command:`install` invocation to take a default component
  name from the current :variable:`PROJECT_NAME` variable value.

Environment Variables
---------------------

* The :envvar:`CMAKE_DISABLE_PRECOMPILE_HEADERS` environment variable
  was added to disable precompiled headers by default.

Properties
----------

* The :prop_tgt:`VERIFY_INTERFACE_HEADER_SETS` and
  :prop_tgt:`VERIFY_PRIVATE_HEADER_SETS` target properties now always
  create the per-target verification target and the aggregate
  ``all_verify_interface_header_sets``, ``all_verify_private_header_sets``,
  and ``all_verify_header_sets`` targets when the property is enabled,
  even if the target has no matching header sets.

* The :prop_tgt:`VERIFY_INTERFACE_HEADER_SETS` and
  :prop_tgt:`VERIFY_PRIVATE_HEADER_SETS` target properties now support
  ``OBJC`` and ``OBJCXX`` languages in addition to ``C`` and ``CXX``.

* The :prop_tgt:`VS_SOLUTION_DEPLOY` target property is now implemented
  for targets created by :command:`add_custom_target`.

Modules
-------

* The :module:`CMakePackageConfigHelpers` module's
  :command:`write_basic_package_version_file` command now supports
  ``SamePatchVersion``, ``SameFullVersion``, and ``SemanticVersion``
  compatibility modes. The older ``ExactVersion`` mode is now documented as
  deprecated in favor of the more explicit ``SamePatchVersion`` and
  ``SameFullVersion`` modes. The ``SemanticVersion`` mode treats ``0.y.z``
  versions more strictly than ``1.y.z`` and later versions.

* The :module:`ExternalData` module gained an
  :variable:`ExternalData_LINK_MODE` variable to select an ordered list
  of file materialization modes for hard links, symbolic links, and
  copies.

* The :module:`ExternalData` module gained an
  :variable:`ExternalData_STATE_ROOT` variable to store hash records outside
  :variable:`ExternalData_BINARY_ROOT`.

* The :module:`ExternalProject` and :module:`FetchContent` modules gained
  :variable:`CMAKE_EP_GIT_CLONE_RETRY_COUNT` and
  :variable:`CMAKE_EP_GIT_CLONE_RETRY_DELAY` variables to control
  ``git clone`` retries.

* The :module:`FindCUDAToolkit` module now creates a ``CUDA::sanitizer``
  target for the :ref:`compute-sanitizer <FindCUDAToolkit_sanitizer>`
  library.

* The :module:`FindCUDAToolkit` module now provides an imported target
  for ``cufilt`` in CUDA 11.4 and above.

* :module:`FindPython` and :module:`FindPython3` modules gained the support of
  the Stable ABI for Free Threaded Python (``SABIT``) as specified by
  :pep:`803`.

Generator Expressions
---------------------

* The :genex:`TARGET_OBJECTS` generator expression now has an optional
  ``SOURCE_FILES:...`` argument, which can take one or more source files as
  arguments, and will filter its output to only include objects built from
  those source files.

Swift
-----

* The :ref:`Ninja Generators` gained the
  :prop_tgt:`Swift_SEPARATE_MODULE_EMISSION` target property, initialized by
  the :variable:`CMAKE_Swift_SEPARATE_MODULE_EMISSION` variable, to control
  whether importable Swift targets emit ``.swiftmodule`` from a dedicated
  build edge.  Policy :policy:`CMP0215` enables this by default.

* The default :prop_tgt:`Swift_MODULE_NAME` now replaces hyphens with
  underscores, since hyphens are not valid in Swift module identifiers.

* Swift targets now have a package name by default.
  See policy :policy:`CMP0216`.

* The :prop_tgt:`Swift_PACKAGE_NAME` target property was added to
  specify a Swift package name.

* Swift targets on Windows now support the ``$<TARGET_PDB_FILE:...>``
  family of generator expressions.

CTest
-----

* :manual:`ctest(1)` gained support for forwarding extra arguments to test
  executables using a :option:`-- <ctest -->` separator.

* :manual:`ctest(1)` gained a :ref:`CoverageTool <ctest-CoverageTool>`
  option in :ref:`Dashboard Client` mode to configure tests for
  coverage collection by ``llvm-cov``.

* The :command:`ctest_configure`, :command:`ctest_build`,
  :command:`ctest_test`, and :command:`ctest_memcheck` commands gained
  ``PRESET`` and ``PRESETS_FILE`` arguments to support using
  :manual:`presets <cmake-presets(7)>` for their :ref:`Dashboard Client` steps.

  The :variable:`CTEST_CONFIGURE_PRESET`, :variable:`CTEST_BUILD_PRESET`,
  :variable:`CTEST_TEST_PRESET`, :variable:`CTEST_PRESET`, and
  :variable:`CTEST_PRESETS_FILE` variables may be used to specify preset
  arguments to the above commands in a :ref:`Dashboard Client` script or
  on the :program:`ctest` command line via the
  :ctest-dashboard-option:`-D` option.

* :manual:`ctest(1)` gained a :ctest-dashboard-option:`--source-dir` option
  to specify the source directory.  When combined with
  :ctest-option:`-T` Configure, this allows CTest to perform an
  initial configure step for an empty binary directory.

* :manual:`ctest(1)` gained support for a :variable:`CTEST_SUBMIT_PARTS`
  variable that restricts which parts are uploaded when operating in
  :ref:`Dashboard Client` mode.

* The :command:`ctest_update` command gained ``VERSION_ONLY`` and
  ``VERSION_OVERRIDE`` options to select or report a source revision
  without requiring the corresponding
  :variable:`CTEST_UPDATE_VERSION_ONLY` or
  :variable:`CTEST_UPDATE_VERSION_OVERRIDE` dashboard script variables.

CPack
-----

* The :cpack_gen:`CPack Archive Generator` gained the
  :variable:`CPACK_ARCHIVE_ENCODING` variable to specify the pathname
  encoding used in package archives.

* The :cpack_gen:`CPack NSIS Generator` gained a new variable
  :variable:`CPACK_NSIS_IGNORE_COMPONENTS_PAGE` to ignore the
  component selection page in the installer.

* The :variable:`CPACK_RPM_SPEC_MORE_DEFINE` variable now supports
  a list of definitions.

Deprecated and Removed Features
===============================

* The ``-W[no-][error=]dev`` command-line options are deprecated.  The new
  spelling is :option:`-W[no-][error=]author <cmake -W>`.

* The ``--warn-uninitialized`` command-line option is deprecated.  The new
  spelling is :option:`-Wuninitialized <cmake -W>`.

* The ``--no-warn-unused-cli`` command-line option is deprecated.  The new
  spelling is :option:`-Wno-unused-cli <cmake -Wno->`.

* The :variable:`CMAKE_WARN_DEPRECATED` and :variable:`CMAKE_ERROR_DEPRECATED`
  variables are deprecated.  The new :command:`cmake_diagnostic` command should
  be used instead.

* The :prop_dir:`MACROS` directory property does not exist anymore.
  See policy :policy:`CMP0217`.

Other Changes
=============

* A file may belong to at most one non-``HEADERS`` :ref:`file set <file sets>`
  in a target.  See policy :policy:`CMP0211`.

* :command:`macro` invocations now preserve backslashes in arguments.
  See policy :policy:`CMP0219`.

* :command:`variable_watch` callback command arguments preserve backslashes.
  See policy :policy:`CMP0219`.

* :manual:`ctest(1)` now exits with non-zero if invoked with no
  arguments and no test input file exists.

* Test drivers generated by the :command:`create_test_sourcelist` command now
  support the ``-N`` option to list all tests, one per line.  This is useful in
  combination with the new :command:`discover_tests` command.

* Names of executables given to the ``DEPENDS`` argument of
  :command:`add_custom_command` no longer have ``.exe`` suffixes stripped to
  establish target-level dependencies. See policy :policy:`CMP0212`.

* Targets which provide C++ modules may now be consumed by targets with
  different :prop_tgt:`compile features <COMPILE_FEATURES>` and
  :prop_tgt:`options <COMPILE_OPTIONS>` than the provider.

Updates
=======

Changes made since CMake 4.4.0 include the following.

4.4.1
-----

* The :module:`FindPython`, :module:`FindPython3` modules learned
  to manage, on ``Windows`` systems, the ``pydebug`` ABI flag.

--===============2857210727937409674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-4.4/Modules/Internal/CheckCommon.cmake"
Changes to packages/x86-64-v3-poky-linux/cmake (sysroot):
  /usr/share/cmake-4.4/Modules/Internal/CheckCommon.cmake was added
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-4.4/Modules/Internal/CheckCommon.cmake was added

--===============2857210727937409674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1374399208 to 1375803944 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10770653 to 10779048 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.4.0/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.4.1/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.4.1/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.4.0/Source/CPack/IFW -> /usr/src/debug/cmake/4.4.1/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/cmelf -> /usr/src/debug/cmake/4.4.1/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/std/cmext -> /usr/src/debug/cmake/4.4.1/Utilities/std/cmext, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.4.1/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/std/cm -> /usr/src/debug/cmake/4.4.1/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/cmjsoncpp/include/json -> /usr/src/debug/c
 make/4.4.1/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.4.0/Source/CTest -> /usr/src/debug/cmake/4.4.1/Source/CTest, directory renamed /usr/src/debug/cmake/4.4.0/Source/LexerParser -> /usr/src/debug/cmake/4.4.1/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.4.1/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.4.0/Source/kwsys -> /usr/src/debug/cmake/4.4.1/Source/kwsys, directory renamed /usr/src/debug/cmake/4.4.0/Source -> /usr/src/debug/cmake/4.4.1/Source, directory renamed /usr/src/debug/cmake/4.4.0/Source/cmsys -> /usr/src/debug/cmake/4.4.1/Source/cmsys, directory renamed /usr/src/debug/cmake/4.4.0/Source/CPack -> /usr/src/debug/cmake/4.4.1/Source/CPack, directory renamed /usr/src/debug/cmake/4.4.0/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.4.1/Utilities/cmlibrhash/librhash
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 54565220 to 54580751 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-4.4/Modules/Internal/CheckCommon.cmake"
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.4.0" to "4.4.1"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.4.0 [default] to 4.4.1 [default]
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.4/cmake-4.4.0.tar.gz" to "https://cmake.org/files/v4.4/cmake-4.4.1.tar.gz"
Changes to packages/x86-64-v3-poky-linux/cmake (sysroot):
  /usr/share/cmake-4.4/Modules/Internal/CheckCommon.cmake was added
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-4.4/Modules/Internal/CheckCommon.cmake was added

--===============2857210727937409674==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-4.4.0-4.4.1-4.4.0-4.4.1.patch"

RnJvbSAzYjM2MTc4MTM5ODk1YWQ5NzJjOGYzZDIzMWI0YmUxMjhlYTFjMDBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDU6MzQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZSxjbWFrZS1uYXRpdmU6IHVwZ3JhZGUgNC40LjAgLT4gNC40LjEsNC40LjAgLT4gNC40LjEK
ClNvdXJjZTogSGVscC9yZWxlYXNlLzQuNC5yc3QKCkNNYWtlIDQuNCBSZWxlYXNlIE5vdGVzCioq
KioqKioqKioqKioqKioqKioqKioqCgouLiBvbmx5OjogaHRtbAoKICAuLiBjb250ZW50czo6CgpD
aGFuZ2VzIG1hZGUgc2luY2UgQ01ha2UgNC4zIGluY2x1ZGUgdGhlIGZvbGxvd2luZy4KCk5ldyBG
ZWF0dXJlcwo9PT09PT09PT09PT0KCkRpYWdub3N0aWNzCi0tLS0tLS0tLS0tCgoqIENNYWtlIGRp
YWdub3N0aWMgYWN0aW9ucyBhcmUgbm93IHRyYWNrZWQgaW4gYSBuZXcgc3RhdGUgdHlwZSBtYW5h
Z2VkIGJ5IHRoZQogIDpjb21tYW5kOmBjbWFrZV9kaWFnbm9zdGljYCBjb21tYW5kLiAgVGhpcyBy
ZXBsYWNlcyB0aGUgb2xkIHN5c3RlbSB3aGljaAogIHNvbWV0aW1lcyB1c2VkIHZhcmlhYmxlcyB0
byBtYW5hZ2UgcmVwb3J0aW5nIGFjdGlvbnMgYW5kIHNvbWV0aW1lcyBkaWQgbm90CiAgYWxsb3cg
bWFuYWdlbWVudCBiZXlvbmQgY29tbWFuZC1saW5lIG9wdGlvbnMgYW5kIHByZXNldHMuICBUaGUg
bmV3IHN5c3RlbQogIGFsc28gaW50cm9kdWNlcyBzZXZlcmFsIG5ldyBkaWFnbm9zdGljIGNhdGVn
b3JpZXMgYW5kIHNpZ25pZmljYW50bHkgcmVkdWNlcwogIHRoZSBjb3N0IG9mIGFkZGluZyBhZGRp
dGlvbmFsIGNhdGVnb3JpZXMgaW4gdGhlIGZ1dHVyZS4gIFNlZSB0aGUKICA6bWFudWFsOmBjbWFr
ZS1kaWFnbm9zdGljcyg3KWAgbWFudWFsIGZvciBhIGxpc3Qgb2YgYXZhaWxhYmxlIGNhdGVnb3Jp
ZXMuCgoqIFRoZSA6ZGlhZ25vc3RpYzpgQ01EX0lOU1RBTExfQUJTT0xVVEVfREVTVElOQVRJT05g
IGRpYWdub3N0aWMgY2F0ZWdvcnkKICB3YXMgYWRkZWQgdG8gZGlhZ25vc2UgOmNvbW1hbmQ6YGlu
c3RhbGxgIGNvbW1hbmRzIHRoYXQgc3BlY2lmeSBhbgogIGFic29sdXRlIGBgREVTVElOQVRJT05g
YC4gIFRoaXMgZGlhZ25vc3RpYyBtYXkgYmUgY29udHJvbGxlZCB3aXRoIHRoZQogIDpvcHRpb246
YC1XaW5zdGFsbC1hYnNvbHV0ZS1kZXN0aW5hdGlvbiA8Y21ha2UgLVc+YCBjb21tYW5kLWxpbmUg
b3B0aW9uLAogIHRoZSBgYGluc3RhbGxBYnNvbHV0ZURlc3RpbmF0aW9uYGAgZmllbGQgaW4gYQog
IDptYW51YWw6YENNYWtlIFByZXNldHMgPGNtYWtlLXByZXNldHMoNyk+YAogIDpwcmVzZXQ6YGNv
bmZpZ3VyZVByZXNldHMud2FybmluZ3NgIG9iamVjdCwKICBvciB0aGUgOmNvbW1hbmQ6YGNtYWtl
X2RpYWdub3N0aWNgIGNvbW1hbmQuCgpQcmVzZXRzCi0tLS0tLS0KCiogOm1hbnVhbDpgY21ha2Ut
cHJlc2V0cyg3KWAgZmlsZXMgbm93IHN1cHBvcnQgc2NoZW1hIHZlcnNpb24gMTIuCgoqIDptYW51
YWw6YGNtYWtlKDEpYCwgOm1hbnVhbDpgY3Rlc3QoMSlgLCBhbmQgOm1hbnVhbDpgY3BhY2soMSlg
IGdhaW5lZAogIGBgLS1wcmVzZXRzLWZpbGVgYCBhcmd1bWVudHMgdG8gc3VwcG9ydCBsb2FkaW5n
CiAgOm1hbnVhbDpgcHJlc2V0cyA8Y21ha2UtcHJlc2V0cyg3KT5gIGZyb20gdGhlIHNwZWNpZmll
ZCBmaWxlIGluc3RlYWQgb2YKICBgYENNYWtlUHJlc2V0cy5qc29uYGAgYW5kL29yIGBgQ01ha2VV
c2VyUHJlc2V0cy5qc29uYGAuIFNlZQogIDpvcHRpb246YGNtYWtlIC0tcHJlc2V0cy1maWxlYCwK
ICA6b3B0aW9uOmBjbWFrZSAtLWJ1aWxkIC0tcHJlc2V0cy1maWxlIDxjbWFrZS0tYnVpbGQgLS1w
cmVzZXRzLWZpbGU+YCwKICA6b3B0aW9uOmBjbWFrZSAtLXdvcmtmbG93IC0tcHJlc2V0cy1maWxl
IDxjbWFrZS0td29ya2Zsb3cgLS1wcmVzZXRzLWZpbGU+YCwKICA6b3B0aW9uOmBjdGVzdCAtLXBy
ZXNldHMtZmlsZWAsIGFuZCA6b3B0aW9uOmBjcGFjayAtLXByZXNldHMtZmlsZWAgZm9yIGRldGFp
bHMuCgoqIDptYW51YWw6YGNtYWtlLXByZXNldHMoNylgLCBpbiBzY2hlbWEgdmVyc2lvbiAxMiBh
bmQgYWJvdmUsIG5vdyBleHBhbmQgdGhlCiAgOnJlZjpgJHtmaWxlRGlyfSA8Q01ha2VQcmVzZXRz
IGZpbGVEaXI+YCBtYWNybyB0byB0aGUgZGlyZWN0b3J5IG9mIHRoZQogIHByZXNldHMgZmlsZSBj
b250YWluaW5nIHRoZSBgYCR7ZmlsZURpcn1gYCBtYWNybywgcmVnYXJkbGVzcyBvZiB3aGV0aGVy
CiAgaXQgaXMgaW5oZXJpdGVkIGJ5IGFub3RoZXIgcHJlc2V0IGluIGEgZGlmZmVyZW50IGRpcmVj
dG9yeS4KCiogOm1hbnVhbDpgY21ha2UtcHJlc2V0cyg3KWAgZ2FpbmVkIHN1cHBvcnQgZm9yIGEK
ICBgYHRlc3RQYXNzdGhyb3VnaEFyZ3VtZW50c2BgIGZpZWxkIGluIHRoZQogIHRlc3QgcHJlc2V0
IGBgZXhlY3V0aW9uYGAgb2JqZWN0IGZvcgogIGZvcndhcmRpbmcgYXJndW1lbnRzIHRvIHRlc3Qg
ZXhlY3V0YWJsZXMgdmlhIHByZXNldHMuCgpGaWxlLUJhc2VkIEFQSQotLS0tLS0tLS0tLS0tLQoK
KiBUaGUgOm1hbnVhbDpgY21ha2UtZmlsZS1hcGkoNylgICJjb2RlbW9kZWwiIHZlcnNpb24gMiBv
YmplY3QgaGFzIGJlZW4KICB1cGRhdGVkIHRvIDIuMTEuCgoqIFRoZSA6bWFudWFsOmBjbWFrZS1m
aWxlLWFwaSg3KWAgImNvZGVtb2RlbCIgdmVyc2lvbiAyICJ0YXJnZXQiIG9iamVjdCdzCiAgInNv
dXJjZXMiIGFuZCAiaW50ZXJmYWNlU291cmNlcyIgb2JqZWN0cyBnYWluZWQgbmV3IGBgZmlsZVNl
dEluZGV4ZXNgYCBmaWVsZHMKICB0byBzdXBwb3J0IHNvdXJjZXMgYmVsb25naW5nIHRvIG11bHRp
cGxlIGZpbGUgc2V0cy4gVGhlIGBgZmlsZVNldEluZGV4YGAKICBmaWVsZHMgYXJlIG1haW50YWlu
ZWQgZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IG9ubHksIGFuZCB1c2VycyBhcmUgYWR2aXNl
ZAogIHRvIHBvcnQgdG8gdGhlIG5ldyBmaWVsZHMuCgoqIFRoZSA6bWFudWFsOmBjbWFrZS1maWxl
LWFwaSg3KWAgImNvZGVtb2RlbCIgdmVyc2lvbiAyICJ0YXJnZXQiIG9iamVjdCdzCiAgInNvdXJj
ZXMiIG9iamVjdCBnYWluZWQgYSBuZXcgYGBiYWNrdHJhY2VzYGAgZmllbGQgdG8gcmVwcmVzZW50
IG11bHRpcGxlCiAgY29tbWFuZCBpbnZvY2F0aW9ucyB3aGljaCBhc3NvY2lhdGUgYSBzaW5nbGUg
c291cmNlIGZvciBhIGdpdmVuIHRhcmdldCB3aXRoCiAgbXVsdAoKW0NoYW5nZWxvZyB0cnVuY2F0
ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4g
YmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQoKU291cmNlOiBIZWxw
L3JlbGVhc2UvNC40LnJzdAoKQ01ha2UgNC40IFJlbGVhc2UgTm90ZXMKKioqKioqKioqKioqKioq
KioqKioqKioKCi4uIG9ubHk6OiBodG1sCgogIC4uIGNvbnRlbnRzOjoKCkNoYW5nZXMgbWFkZSBz
aW5jZSBDTWFrZSA0LjMgaW5jbHVkZSB0aGUgZm9sbG93aW5nLgoKTmV3IEZlYXR1cmVzCj09PT09
PT09PT09PQoKRGlhZ25vc3RpY3MKLS0tLS0tLS0tLS0KCiogQ01ha2UgZGlhZ25vc3RpYyBhY3Rp
b25zIGFyZSBub3cgdHJhY2tlZCBpbiBhIG5ldyBzdGF0ZSB0eXBlIG1hbmFnZWQgYnkgdGhlCiAg
OmNvbW1hbmQ6YGNtYWtlX2RpYWdub3N0aWNgIGNvbW1hbmQuICBUaGlzIHJlcGxhY2VzIHRoZSBv
bGQgc3lzdGVtIHdoaWNoCiAgc29tZXRpbWVzIHVzZWQgdmFyaWFibGVzIHRvIG1hbmFnZSByZXBv
cnRpbmcgYWN0aW9ucyBhbmQgc29tZXRpbWVzIGRpZCBub3QKICBhbGxvdyBtYW5hZ2VtZW50IGJl
eW9uZCBjb21tYW5kLWxpbmUgb3B0aW9ucyBhbmQgcHJlc2V0cy4gIFRoZSBuZXcgc3lzdGVtCiAg
YWxzbyBpbnRyb2R1Y2VzIHNldmVyYWwgbmV3IGRpYWdub3N0aWMgY2F0ZWdvcmllcyBhbmQgc2ln
bmlmaWNhbnRseSByZWR1Y2VzCiAgdGhlIGNvc3Qgb2YgYWRkaW5nIGFkZGl0aW9uYWwgY2F0ZWdv
cmllcyBpbiB0aGUgZnV0dXJlLiAgU2VlIHRoZQogIDptYW51YWw6YGNtYWtlLWRpYWdub3N0aWNz
KDcpYCBtYW51YWwgZm9yIGEgbGlzdCBvZiBhdmFpbGFibGUgY2F0ZWdvcmllcy4KCiogVGhlIDpk
aWFnbm9zdGljOmBDTURfSU5TVEFMTF9BQlNPTFVURV9ERVNUSU5BVElPTmAgZGlhZ25vc3RpYyBj
YXRlZ29yeQogIHdhcyBhZGRlZCB0byBkaWFnbm9zZSA6Y29tbWFuZDpgaW5zdGFsbGAgY29tbWFu
ZHMgdGhhdCBzcGVjaWZ5IGFuCiAgYWJzb2x1dGUgYGBERVNUSU5BVElPTmBgLiAgVGhpcyBkaWFn
bm9zdGljIG1heSBiZSBjb250cm9sbGVkIHdpdGggdGhlCiAgOm9wdGlvbjpgLVdpbnN0YWxsLWFi
c29sdXRlLWRlc3RpbmF0aW9uIDxjbWFrZSAtVz5gIGNvbW1hbmQtbGluZSBvcHRpb24sCiAgdGhl
IGBgaW5zdGFsbEFic29sdXRlRGVzdGluYXRpb25gYCBmaWVsZCBpbiBhCiAgOm1hbnVhbDpgQ01h
a2UgUHJlc2V0cyA8Y21ha2UtcHJlc2V0cyg3KT5gCiAgOnByZXNldDpgY29uZmlndXJlUHJlc2V0
cy53YXJuaW5nc2Agb2JqZWN0LAogIG9yIHRoZSA6Y29tbWFuZDpgY21ha2VfZGlhZ25vc3RpY2Ag
Y29tbWFuZC4KClByZXNldHMKLS0tLS0tLQoKKiA6bWFudWFsOmBjbWFrZS1wcmVzZXRzKDcpYCBm
aWxlcyBub3cgc3VwcG9ydCBzY2hlbWEgdmVyc2lvbiAxMi4KCiogOm1hbnVhbDpgY21ha2UoMSlg
LCA6bWFudWFsOmBjdGVzdCgxKWAsIGFuZCA6bWFudWFsOmBjcGFjaygxKWAgZ2FpbmVkCiAgYGAt
LXByZXNldHMtZmlsZWBgIGFyZ3VtZW50cyB0byBzdXBwb3J0IGxvYWRpbmcKICA6bWFudWFsOmBw
cmVzZXRzIDxjbWFrZS1wcmVzZXRzKDcpPmAgZnJvbSB0aGUgc3BlY2lmaWVkIGZpbGUgaW5zdGVh
ZCBvZgogIGBgQ01ha2VQcmVzZXRzLmpzb25gYCBhbmQvb3IgYGBDTWFrZVVzZXJQcmVzZXRzLmpz
b25gYC4gU2VlCiAgOm9wdGlvbjpgY21ha2UgLS1wcmVzZXRzLWZpbGVgLAogIDpvcHRpb246YGNt
YWtlIC0tYnVpbGQgLS1wcmVzZXRzLWZpbGUgPGNtYWtlLS1idWlsZCAtLXByZXNldHMtZmlsZT5g
LAogIDpvcHRpb246YGNtYWtlIC0td29ya2Zsb3cgLS1wcmVzZXRzLWZpbGUgPGNtYWtlLS13b3Jr
ZmxvdyAtLXByZXNldHMtZmlsZT5gLAogIDpvcHRpb246YGN0ZXN0IC0tcHJlc2V0cy1maWxlYCwg
YW5kIDpvcHRpb246YGNwYWNrIC0tcHJlc2V0cy1maWxlYCBmb3IgZGV0YWlscy4KCiogOm1hbnVh
bDpgY21ha2UtcHJlc2V0cyg3KWAsIGluIHNjaGVtYSB2ZXJzaW9uIDEyIGFuZCBhYm92ZSwgbm93
IGV4cGFuZCB0aGUKICA6cmVmOmAke2ZpbGVEaXJ9IDxDTWFrZVByZXNldHMgZmlsZURpcj5gIG1h
Y3JvIHRvIHRoZSBkaXJlY3Rvcnkgb2YgdGhlCiAgcHJlc2V0cyBmaWxlIGNvbnRhaW5pbmcgdGhl
IGBgJHtmaWxlRGlyfWBgIG1hY3JvLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIKICBpdCBpcyBpbmhl
cml0ZWQgYnkgYW5vdGhlciBwcmVzZXQgaW4gYSBkaWZmZXJlbnQgZGlyZWN0b3J5LgoKKiA6bWFu
dWFsOmBjbWFrZS1wcmVzZXRzKDcpYCBnYWluZWQgc3VwcG9ydCBmb3IgYQogIGBgdGVzdFBhc3N0
aHJvdWdoQXJndW1lbnRzYGAgZmllbGQgaW4gdGhlCiAgdGVzdCBwcmVzZXQgYGBleGVjdXRpb25g
YCBvYmplY3QgZm9yCiAgZm9yd2FyZGluZyBhcmd1bWVudHMgdG8gdGVzdCBleGVjdXRhYmxlcyB2
aWEgcHJlc2V0cy4KCkZpbGUtQmFzZWQgQVBJCi0tLS0tLS0tLS0tLS0tCgoqIFRoZSA6bWFudWFs
OmBjbWFrZS1maWxlLWFwaSg3KWAgImNvZGVtb2RlbCIgdmVyc2lvbiAyIG9iamVjdCBoYXMgYmVl
bgogIHVwZGF0ZWQgdG8gMi4xMS4KCiogVGhlIDptYW51YWw6YGNtYWtlLWZpbGUtYXBpKDcpYCAi
Y29kZW1vZGVsIiB2ZXJzaW9uIDIgInRhcmdldCIgb2JqZWN0J3MKICAic291cmNlcyIgYW5kICJp
bnRlcmZhY2VTb3VyY2VzIiBvYmplY3RzIGdhaW5lZCBuZXcgYGBmaWxlU2V0SW5kZXhlc2BgIGZp
ZWxkcwogIHRvIHN1cHBvcnQgc291cmNlcyBiZWxvbmdpbmcgdG8gbXVsdGlwbGUgZmlsZSBzZXRz
LiBUaGUgYGBmaWxlU2V0SW5kZXhgYAogIGZpZWxkcyBhcmUgbWFpbnRhaW5lZCBmb3IgYmFja3dh
cmRzIGNvbXBhdGliaWxpdHkgb25seSwgYW5kIHVzZXJzIGFyZSBhZHZpc2VkCiAgdG8gcG9ydCB0
byB0aGUgbmV3IGZpZWxkcy4KCiogVGhlIDptYW51YWw6YGNtYWtlLWZpbGUtYXBpKDcpYCAiY29k
ZW1vZGVsIiB2ZXJzaW9uIDIgInRhcmdldCIgb2JqZWN0J3MKICAic291cmNlcyIgb2JqZWN0IGdh
aW5lZCBhIG5ldyBgYGJhY2t0cmFjZXNgYCBmaWVsZCB0byByZXByZXNlbnQgbXVsdGlwbGUKICBj
b21tYW5kIGludm9jYXRpb25zIHdoaWNoIGFzc29jaWF0ZSBhIHNpbmdsZSBzb3VyY2UgZm9yIGEg
Z2l2ZW4gdGFyZ2V0IHdpdGgKICBtdWx0CgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNl
ZWRzIDMwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBh
biBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRp
dmVfNC40LjAuYmIgPT4gY21ha2UtbmF0aXZlXzQuNC4xLmJifSAgICAgIHwgMAogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV80LjQuMC5iYiA9PiBjbWFr
ZV80LjQuMS5iYn0gIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2UtbmF0aXZl
XzQuNC4wLmJiID0+IGNtYWtlLW5hdGl2ZV80LjQuMS5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV80LjQuMC5iYiA9PiBjbWFrZV80LjQuMS5iYn0g
KDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5h
dGl2ZV80LjQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVf
NC40LjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC40LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC40LjEuYmIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UuaW5jCmluZGV4IDg1YjQ0NGQ5ZjkuLjQ1MTcyZGE3MjkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9W
RVJTSU9OID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9Igog
U1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9O
fS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI2NTc1N2Y0NDJmZGQyNDJlMjdmMTcyOGZjMjZkYzBjYmE0MTY0ZjdhMDc5MWE1Yzc4ODYz
MWMwMDA4MDM2OWJjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1ZDQ3MjFmMzYyNWZiMGQ5ZDZj
YTQ4MGRkNTlhNDZjODRiNGMxNTdmN2ZhZGQyZTliMTc5ZWY5Yzg3MTE3NGQiCiAKIFVQU1RSRUFN
X0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC40LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC40LjEuYmIKc2ltaWxhcml0eSBpbmRleCAx
MDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80LjQuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuNC4xLmJiCi0t
IAoyLjQ3LjEKCg==

--===============2857210727937409674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-changelog.txt"

Changelog for cmake: 4.4.0 -> 4.4.1
Source: Help/release/4.4.rst

CMake 4.4 Release Notes
***********************

.. only:: html

  .. contents::

Changes made since CMake 4.3 include the following.

New Features
============

Diagnostics
-----------

* CMake diagnostic actions are now tracked in a new state type managed by the
  :command:`cmake_diagnostic` command.  This replaces the old system which
  sometimes used variables to manage reporting actions and sometimes did not
  allow management beyond command-line options and presets.  The new system
  also introduces several new diagnostic categories and significantly reduces
  the cost of adding additional categories in the future.  See the
  :manual:`cmake-diagnostics(7)` manual for a list of available categories.

* The :diagnostic:`CMD_INSTALL_ABSOLUTE_DESTINATION` diagnostic category
  was added to diagnose :command:`install` commands that specify an
  absolute ``DESTINATION``.  This diagnostic may be controlled with the
  :option:`-Winstall-absolute-destination <cmake -W>` command-line option,
  the ``installAbsoluteDestination`` field in a
  :manual:`CMake Presets <cmake-presets(7)>`
  :preset:`configurePresets.warnings` object,
  or the :command:`cmake_diagnostic` command.

Presets
-------

* :manual:`cmake-presets(7)` files now support schema version 12.

* :manual:`cmake(1)`, :manual:`ctest(1)`, and :manual:`cpack(1)` gained
  ``--presets-file`` arguments to support loading
  :manual:`presets <cmake-presets(7)>` from the specified file instead of
  ``CMakePresets.json`` and/or ``CMakeUserPresets.json``. See
  :option:`cmake --presets-file`,
  :option:`cmake --build --presets-file <cmake--build --presets-file>`,
  :option:`cmake --workflow --presets-file <cmake--workflow --presets-file>`,
  :option:`ctest --presets-file`, and :option:`cpack --presets-file` for details.

* :manual:`cmake-presets(7)`, in schema version 12 and above, now expand the
  :ref:`${fileDir} <CMakePresets fileDir>` macro to the directory of the
  presets file containing the ``${fileDir}`` macro, regardless of whether
  it is inherited by another preset in a different directory.

* :manual:`cmake-presets(7)` gained support for a
  ``testPassthroughArguments`` field in the
  test preset ``execution`` object for
  forwarding arguments to test executables via presets.

File-Based API
--------------

* The :manual:`cmake-file-api(7)` "codemodel" version 2 object has been
  updated to 2.11.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" and "interfaceSources" objects gained new ``fileSetIndexes`` fields
  to support sources belonging to multiple file sets. The ``fileSetIndex``
  fields are maintained for backwards compatibility only, and users are advised
  to port to the new fields.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "target" object's
  "sources" object gained a new ``backtraces`` field to represent multiple
  command invocations which associate a single source for a given target with
  multiple file sets. The ``backtrace`` field is maintained for backwards
  compatibility only, and users are advised to port to the new field.

* The :manual:`cmake-file-api(7)` "codemodel" version 2 "installers" object's
  optional ``fileSetType`` field gained a new ``SOURCES`` value to incorporate
  the new ``SOURCES`` :ref:`file set <file sets>` type in codemodel replies.

Instrumentation
---------------

* The :manual:`cmake-instrumentation(7)` data version has been updated to 1.1.
* :manual:`cmake-instrumentation(7)` gained a ``captureOutput`` option which
  collects the ``stdout`` and ``stderr`` of instrumented commands.
* :manual:`cmake-instrumentation(7)` gained a ``compileTrace`` option which
  records compiler-generated trace files (e.g., from Clang's ``-ftime-trace``
  flag).

Generators
----------

* The :ref:`Ninja Generators` now support generating a build target named
  ``test_prep/<test-name>`` for each test added by :command:`add_test`, which
  builds all dependencies for that test. Build dependencies are registered for
  an executable target invoked by the test, targets referenced in generator
  expressions in the test command, and explicit dependencies added using the
  new ``BUILD_DEPENDS`` option. This behavior is enabled by the new
  :variable:`CMAKE_TEST_BUILD_DEPENDS` variable. A ``test_prep/all``
  target is also generated to depend on every ``test_prep/<test-name>``
  target. Tests with names that are not valid target names are excluded from
  this behavior. If multiple tests in different directories share the same
  name, their dependencies are merged into one ``test_prep/<test-name>``
  target.

Languages
---------

* CUDA language level 23 (corresponding to C++ 23) is now supported with
  NVCC 13.3 and above.

Compilers
---------

* C++ 20 named modules are now supported with ``clang-cl``, except with the
  :ref:`Visual Studio Generators` (i.e., the ``ClangCl``
  :variable:`toolset <CMAKE_GENERATOR_TOOLSET>`).
  See :manual:`cmake-cxxmodules(7)`.

* The ``ibm-flang`` compiler is now supported with
  :variable:`compiler id <CMAKE_<LANG>_COMPILER_ID>` ``IBMFlang``.

* The `Pelles C`_ toolchain is now supported with
  :variable:`compiler id <CMAKE_<LANG>_COMPILER_ID>` ``PellesC``.

  The ``ASM_POASM`` language was added to support the Pelles Macro Assembler.

* The Open Watcom ``wlink`` linker is now identified with
  :variable:`CMAKE_<LANG>_COMPILER_LINKER_ID` ``OpenWatcom``.

* The `wild linker <https://github.com/wild-linker/wild>`_ is now
  supported with :variable:`CMAKE_<LANG>_COMPILER_LINKER_ID` ``WILD``.

Command-Line
------------

* :manual:`cmake(1)` now supports ``--build <dir> --preset <pre>``
  regardless of the current working directory.

* The :option:`cmake -D` command-line option now populates a
  default :prop_cache:`HELPSTRING` for variables known to CMake.

* :option:`cmake --install` now supports installing multiple components.

* :option:`cmake --install` now accepts ``-j<N>`` in addition to ``-j <N>``
  for specifying the number of parallel jobs.

* The :option:`cmake -E` commands
  :option:`copy_if_different <cmake-E copy_if_different>`,
  :option:`copy_if_newer <cmake-E copy_if_newer>`,
  :option:`copy_directory <cmake-E copy_directory>`,
  :option:`copy_directory_if_different <cmake-E copy_directory_if_different>`,
  and :option:`copy_directory_if_newer <cmake-E copy_directory_if_newer>`
  gained support for the ``-t`` argument.

* The :option:`cmake -E tar <cmake-E tar>` command-line tool gained the
  :option:`--cmake-tar-encoding <cmake-E_tar --cmake-tar-encoding>` flag
  to specify the pathname encoding used in archives.

Commands
--------

* The :command:`block` command can now create a ``DIAGNOSTICS`` scope.

* The :command:`cmake_diagnostic` command was added to manipulate CMake's
  diagnostic state.

* The :command:`cmake_parse_arguments` command gained a new ``PARSE_ARGN``
  signature that starts parsing after the last named argument of the calling
  function and works exactly like ``PARSE_ARGV`` with ``<N>`` being the number
  of parameters in the function definition.

* The :command:`discover_tests` command was added to support registering tests
  discovered at test time by :manual:`ctest(1)`. It runs a user-provided
  discovery command, parses its output, and generates test names, arguments,
  and properties from regular-expression captures.

* The :command:`execute_process` command gained
  ``ENVIRONMENT`` and ``ENVIRONMENT_MODIFICATION`` options to run child
  processes with a modified environment.

* The :command:`file(ARCHIVE_CREATE)` and :command:`file(ARCHIVE_EXTRACT)`
  commands gained an ``ENCODING`` option to specify the encoding of the
  archive pathnames.  The default is now ``UTF-8``.
  See policy :policy:`CMP0213`.

* The :command:`file(READ_SYMLINK)` command gained a ``RESULT``
  option to capture errors without failing.

* The :command:`if` command gained a new ``DIAGNOSTIC`` operator that evaluates
  to true if a given diagnostic category name is known to CMake.

* The :command:`include` command now has a ``NO_DIAGNOSTIC_SCOPE`` option.

* The :command:`list(FILTER)` command gained a new ``PREDICATE`` mode
  that invokes a user-defined :command:`function` to decide which elements are
  included or excluded, complementing the existing ``REGEX`` mode.

* The :command:`list(SORT)` command gained a new ``COMPARATOR`` keyword
  that invokes a user-defined :command:`function` to compare elements, complementing
  the built-in ``COMPARE`` methods.

* The :command:`list(TRANSFORM)` command gained a new ``APPLY`` action that
  invokes a user-defined :command:`function` for each element of the list,
  enabling arbitrary per-element transformations.

* The :command:`list(TRANSFORM)` command gained a new ``PREDICATE`` selector
  that invokes a user-defined :command:`function` to decide which elements are
  transformed.

* The :command:`string(JSON ... PARTIAL_EQUAL) <string(JSON-PARTIAL_EQUAL)>`
  command was added to compare two JSON values using *partial* equality.

File Sets
---------

* A ``SOURCES`` :ref:`file set <file sets>` type was added to specify
  a target's source files via file sets.

* The :prop_fs:`CXX_SCAN_FOR_MODULES` file set property was added to
  control whether a file set's sources are scanned for C++ modules.

* The :prop_fs:`INDEPENDENT_FILES` file set property was added to
  specify that a file set's sources do not depend on any generated files.

* The :prop_fs:`JOB_POOL_COMPILE` file set property was added to
  assign a file set's sources to a specific Ninja job pool.

* The :prop_fs:`SCOPE`, :prop_fs:`TYPE`, :prop_fs:`BASE_DIRS`,
  :prop_fs:`SOURCES`, and :prop_fs:`INTERFACE_SOURCES` file set
  properties were added to provide the declared details of a file set.

* The :prop_fs:`SKIP_LINTING` file set property was added to exclude
  a file set's sources from target-wide code checks.

* The :prop_fs:`SKIP_PRECOMPILE_HEADERS` file set property was added
  to avoid using precompiled headers for a file set's sources.

* The :prop_fs:`SKIP_UNITY_BUILD_INCLUSION` file set property was added
  to exclude a file set's sources from inclusion in unity builds.

Variables
---------

* The :variable:`CMAKE_INSTALL_DEFAULT_COMPONENT_NAME` variable gained
  support for a special ``<PROJECT_NAME>`` placeholder value.
  It tells each :command:`install` invocation to take a default component
  name from the current :variable:`PROJECT_NAME` variable value.

Environment Variables
---------------------

* The :envvar:`CMAKE_DISABLE_PRECOMPILE_HEADERS` environment variable
  was added to disable precompiled headers by default.

Properties
----------

* The :prop_tgt:`VERIFY_INTERFACE_HEADER_SETS` and
  :prop_tgt:`VERIFY_PRIVATE_HEADER_SETS` target properties now always
  create the per-target verification target and the aggregate
  ``all_verify_interface_header_sets``, ``all_verify_private_header_sets``,
  and ``all_verify_header_sets`` targets when the property is enabled,
  even if the target has no matching header sets.

* The :prop_tgt:`VERIFY_INTERFACE_HEADER_SETS` and
  :prop_tgt:`VERIFY_PRIVATE_HEADER_SETS` target properties now support
  ``OBJC`` and ``OBJCXX`` languages in addition to ``C`` and ``CXX``.

* The :prop_tgt:`VS_SOLUTION_DEPLOY` target property is now implemented
  for targets created by :command:`add_custom_target`.

Modules
-------

* The :module:`CMakePackageConfigHelpers` module's
  :command:`write_basic_package_version_file` command now supports
  ``SamePatchVersion``, ``SameFullVersion``, and ``SemanticVersion``
  compatibility modes. The older ``ExactVersion`` mode is now documented as
  deprecated in favor of the more explicit ``SamePatchVersion`` and
  ``SameFullVersion`` modes. The ``SemanticVersion`` mode treats ``0.y.z``
  versions more strictly than ``1.y.z`` and later versions.

* The :module:`ExternalData` module gained an
  :variable:`ExternalData_LINK_MODE` variable to select an ordered list
  of file materialization modes for hard links, symbolic links, and
  copies.

* The :module:`ExternalData` module gained an
  :variable:`ExternalData_STATE_ROOT` variable to store hash records outside
  :variable:`ExternalData_BINARY_ROOT`.

* The :module:`ExternalProject` and :module:`FetchContent` modules gained
  :variable:`CMAKE_EP_GIT_CLONE_RETRY_COUNT` and
  :variable:`CMAKE_EP_GIT_CLONE_RETRY_DELAY` variables to control
  ``git clone`` retries.

* The :module:`FindCUDAToolkit` module now creates a ``CUDA::sanitizer``
  target for the :ref:`compute-sanitizer <FindCUDAToolkit_sanitizer>`
  library.

* The :module:`FindCUDAToolkit` module now provides an imported target
  for ``cufilt`` in CUDA 11.4 and above.

* :module:`FindPython` and :module:`FindPython3` modules gained the support of
  the Stable ABI for Free Threaded Python (``SABIT``) as specified by
  :pep:`803`.

Generator Expressions
---------------------

* The :genex:`TARGET_OBJECTS` generator expression now has an optional
  ``SOURCE_FILES:...`` argument, which can take one or more source files as
  arguments, and will filter its output to only include objects built from
  those source files.

Swift
-----

* The :ref:`Ninja Generators` gained the
  :prop_tgt:`Swift_SEPARATE_MODULE_EMISSION` target property, initialized by
  the :variable:`CMAKE_Swift_SEPARATE_MODULE_EMISSION` variable, to control
  whether importable Swift targets emit ``.swiftmodule`` from a dedicated
  build edge.  Policy :policy:`CMP0215` enables this by default.

* The default :prop_tgt:`Swift_MODULE_NAME` now replaces hyphens with
  underscores, since hyphens are not valid in Swift module identifiers.

* Swift targets now have a package name by default.
  See policy :policy:`CMP0216`.

* The :prop_tgt:`Swift_PACKAGE_NAME` target property was added to
  specify a Swift package name.

* Swift targets on Windows now support the ``$<TARGET_PDB_FILE:...>``
  family of generator expressions.

CTest
-----

* :manual:`ctest(1)` gained support for forwarding extra arguments to test
  executables using a :option:`-- <ctest -->` separator.

* :manual:`ctest(1)` gained a :ref:`CoverageTool <ctest-CoverageTool>`
  option in :ref:`Dashboard Client` mode to configure tests for
  coverage collection by ``llvm-cov``.

* The :command:`ctest_configure`, :command:`ctest_build`,
  :command:`ctest_test`, and :command:`ctest_memcheck` commands gained
  ``PRESET`` and ``PRESETS_FILE`` arguments to support using
  :manual:`presets <cmake-presets(7)>` for their :ref:`Dashboard Client` steps.

  The :variable:`CTEST_CONFIGURE_PRESET`, :variable:`CTEST_BUILD_PRESET`,
  :variable:`CTEST_TEST_PRESET`, :variable:`CTEST_PRESET`, and
  :variable:`CTEST_PRESETS_FILE` variables may be used to specify preset
  arguments to the above commands in a :ref:`Dashboard Client` script or
  on the :program:`ctest` command line via the
  :ctest-dashboard-option:`-D` option.

* :manual:`ctest(1)` gained a :ctest-dashboard-option:`--source-dir` option
  to specify the source directory.  When combined with
  :ctest-option:`-T` Configure, this allows CTest to perform an
  initial configure step for an empty binary directory.

* :manual:`ctest(1)` gained support for a :variable:`CTEST_SUBMIT_PARTS`
  variable that restricts which parts are uploaded when operating in
  :ref:`Dashboard Client` mode.

* The :command:`ctest_update` command gained ``VERSION_ONLY`` and
  ``VERSION_OVERRIDE`` options to select or report a source revision
  without requiring the corresponding
  :variable:`CTEST_UPDATE_VERSION_ONLY` or
  :variable:`CTEST_UPDATE_VERSION_OVERRIDE` dashboard script variables.

CPack
-----

* The :cpack_gen:`CPack Archive Generator` gained the
  :variable:`CPACK_ARCHIVE_ENCODING` variable to specify the pathname
  encoding used in package archives.

* The :cpack_gen:`CPack NSIS Generator` gained a new variable
  :variable:`CPACK_NSIS_IGNORE_COMPONENTS_PAGE` to ignore the
  component selection page in the installer.

* The :variable:`CPACK_RPM_SPEC_MORE_DEFINE` variable now supports
  a list of definitions.

Deprecated and Removed Features
===============================

* The ``-W[no-][error=]dev`` command-line options are deprecated.  The new
  spelling is :option:`-W[no-][error=]author <cmake -W>`.

* The ``--warn-uninitialized`` command-line option is deprecated.  The new
  spelling is :option:`-Wuninitialized <cmake -W>`.

* The ``--no-warn-unused-cli`` command-line option is deprecated.  The new
  spelling is :option:`-Wno-unused-cli <cmake -Wno->`.

* The :variable:`CMAKE_WARN_DEPRECATED` and :variable:`CMAKE_ERROR_DEPRECATED`
  variables are deprecated.  The new :command:`cmake_diagnostic` command should
  be used instead.

* The :prop_dir:`MACROS` directory property does not exist anymore.
  See policy :policy:`CMP0217`.

Other Changes
=============

* A file may belong to at most one non-``HEADERS`` :ref:`file set <file sets>`
  in a target.  See policy :policy:`CMP0211`.

* :command:`macro` invocations now preserve backslashes in arguments.
  See policy :policy:`CMP0219`.

* :command:`variable_watch` callback command arguments preserve backslashes.
  See policy :policy:`CMP0219`.

* :manual:`ctest(1)` now exits with non-zero if invoked with no
  arguments and no test input file exists.

* Test drivers generated by the :command:`create_test_sourcelist` command now
  support the ``-N`` option to list all tests, one per line.  This is useful in
  combination with the new :command:`discover_tests` command.

* Names of executables given to the ``DEPENDS`` argument of
  :command:`add_custom_command` no longer have ``.exe`` suffixes stripped to
  establish target-level dependencies. See policy :policy:`CMP0212`.

* Targets which provide C++ modules may now be consumed by targets with
  different :prop_tgt:`compile features <COMPILE_FEATURES>` and
  :prop_tgt:`options <COMPILE_OPTIONS>` than the provider.

Updates
=======

Changes made since CMake 4.4.0 include the following.

4.4.1
-----

* The :module:`FindPython`, :module:`FindPython3` modules learned
  to manage, on ``Windows`` systems, the ``pydebug`` ABI flag.

--===============2857210727937409674==--


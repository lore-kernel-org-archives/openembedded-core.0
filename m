Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1D7C55183
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:30 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.917.1785564319443441565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AxVFqMIX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=alHD+ap4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019fbbed4afe-eb62abe8-3944-4a3d-9692-5b9f283bdd4c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564318;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=QjxpyZYgRczAKl5MkpKI+6Ku9TxiZS98NXhZ1iyL8EU=;
	b=AxVFqMIXpEYAU9AbLULjgSzSQx4HMlfO70vq8W2QBRkaisrc16fls0TG2J/DeyGV
	1hXP+dHwHkVzpQv3dF6gDwZMJSDa7sDZySzolsWXu2mpzjDmdo410kXJENHxI1rucv5
	ylIt34/oXdvsZ87xjLGKzF5Y4LtZ6/3I01jAM5FM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564318;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=QjxpyZYgRczAKl5MkpKI+6Ku9TxiZS98NXhZ1iyL8EU=;
	b=alHD+ap4faLSapLJsAHc6oiAKL2RDuF33jrva/iwiMgG75xak8Xd8H3Rj0hyGW9M
	wF+gStcWYWrlxDWZI375qsSE8+7QUwNt179g3gBiGrioM4j9XuTu6BmjGyYatjAt07l
	1gFYc1nAJg8/7/i6AWeAQJoeOh4U5irrGoiT749A=
Content-Type: multipart/mixed; boundary="===============1871961461298168620=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake,cmake-native: upgrading to 4.4.2,4.4.2 SUCCEEDED
Message-ID: <0101019fbbed4afe-eb62abe8-3944-4a3d-9692-5b9f283bdd4c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242460

--===============1871961461298168620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.4.2,4.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-4.4.1-4.4.2-4.4.1-4.4.2.patch
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
From 1ed2d72931bc71dc6405b7d75d38ec55222a5807 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Aug 2026 05:24:26 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 4.4.1 -> 4.4.2,4.4.1 -> 4.4.2

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
 .../cmake/{cmake-native_4.4.1.bb => cmake-native_4.4.2.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.1.bb => cmake_4.4.2.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.1.bb => cmake-native_4.4.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.1.bb => cmake_4.4.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 45172da729..a51b25b864 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "95d4721f3625fb0d9d6ca480dd59a46c84b4c157f7fadd2e9b179ef9c871174d"
+SRC_URI[sha256sum] = "1db9e61e60b6e0874c86386340b910382f3c5e75b9fbfb44d122063129a2789d"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.1.bb b/meta/recipes-devtools/cmake/cmake_4.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.1.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.2.bb
-- 
2.47.1


--===============1871961461298168620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-native-changelog.txt"

Changelog for cmake-native: 4.4.1 -> 4.4.2
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

4.4.2
-----

* This version made no changes to documented features or interfaces.
  Some implementation updates were made to support ecosystem changes
  and/or fix regressions.

--===============1871961461298168620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1375803088 to 1375837344 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10779048 to 10779614 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.4.1/Source/CPack/IFW -> /usr/src/debug/cmake/4.4.2/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.4.1/Source/LexerParser -> /usr/src/debug/cmake/4.4.2/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.4.1/Source -> /usr/src/debug/cmake/4.4.2/Source, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/std/cm -> /usr/src/debug/cmake/4.4.2/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.4.1/Source/kwsys -> /usr/src/debug/cmake/4.4.2/Source/kwsys, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.4.2/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.4.2/Utilities/cmlibrhash/librhash, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/std/cmext -> /usr/src/debug/cmake/4.4.2/Utilities/std/cmext, directory renamed /
 usr/src/debug/cmake/4.4.1/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.4.2/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.4.2/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.4.1/Source/CTest -> /usr/src/debug/cmake/4.4.2/Source/CTest, directory renamed /usr/src/debug/cmake/4.4.1/Source/cmsys -> /usr/src/debug/cmake/4.4.2/Source/cmsys, directory renamed /usr/src/debug/cmake/4.4.1/Source/CPack -> /usr/src/debug/cmake/4.4.2/Source/CPack, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.4.2/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/cmelf -> /usr/src/debug/cmake/4.4.2/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.4.1/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.4.2/Utilities/std/cm/bits
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 54580751 to 54589555 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.4.1" to "4.4.2"
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.4/cmake-4.4.1.tar.gz" to "https://cmake.org/files/v4.4/cmake-4.4.2.tar.gz"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.4.1 [default] to 4.4.2 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.4.1" to "4.4.2"

--===============1871961461298168620==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-4.4.1-4.4.2-4.4.1-4.4.2.patch"

RnJvbSAxZWQyZDcyOTMxYmM3MWRjNjQwNWI3ZDc1ZDM4ZWM1NTIyMmE1ODA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBdWcgMjAyNiAwNToyNDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLGNtYWtlLW5hdGl2ZTogdXBncmFkZSA0LjQuMSAtPiA0LjQuMiw0LjQuMSAtPiA0LjQuMgoK
U291cmNlOiBIZWxwL3JlbGVhc2UvNC40LnJzdAoKQ01ha2UgNC40IFJlbGVhc2UgTm90ZXMKKioq
KioqKioqKioqKioqKioqKioqKioKCi4uIG9ubHk6OiBodG1sCgogIC4uIGNvbnRlbnRzOjoKCkNo
YW5nZXMgbWFkZSBzaW5jZSBDTWFrZSA0LjMgaW5jbHVkZSB0aGUgZm9sbG93aW5nLgoKTmV3IEZl
YXR1cmVzCj09PT09PT09PT09PQoKRGlhZ25vc3RpY3MKLS0tLS0tLS0tLS0KCiogQ01ha2UgZGlh
Z25vc3RpYyBhY3Rpb25zIGFyZSBub3cgdHJhY2tlZCBpbiBhIG5ldyBzdGF0ZSB0eXBlIG1hbmFn
ZWQgYnkgdGhlCiAgOmNvbW1hbmQ6YGNtYWtlX2RpYWdub3N0aWNgIGNvbW1hbmQuICBUaGlzIHJl
cGxhY2VzIHRoZSBvbGQgc3lzdGVtIHdoaWNoCiAgc29tZXRpbWVzIHVzZWQgdmFyaWFibGVzIHRv
IG1hbmFnZSByZXBvcnRpbmcgYWN0aW9ucyBhbmQgc29tZXRpbWVzIGRpZCBub3QKICBhbGxvdyBt
YW5hZ2VtZW50IGJleW9uZCBjb21tYW5kLWxpbmUgb3B0aW9ucyBhbmQgcHJlc2V0cy4gIFRoZSBu
ZXcgc3lzdGVtCiAgYWxzbyBpbnRyb2R1Y2VzIHNldmVyYWwgbmV3IGRpYWdub3N0aWMgY2F0ZWdv
cmllcyBhbmQgc2lnbmlmaWNhbnRseSByZWR1Y2VzCiAgdGhlIGNvc3Qgb2YgYWRkaW5nIGFkZGl0
aW9uYWwgY2F0ZWdvcmllcyBpbiB0aGUgZnV0dXJlLiAgU2VlIHRoZQogIDptYW51YWw6YGNtYWtl
LWRpYWdub3N0aWNzKDcpYCBtYW51YWwgZm9yIGEgbGlzdCBvZiBhdmFpbGFibGUgY2F0ZWdvcmll
cy4KCiogVGhlIDpkaWFnbm9zdGljOmBDTURfSU5TVEFMTF9BQlNPTFVURV9ERVNUSU5BVElPTmAg
ZGlhZ25vc3RpYyBjYXRlZ29yeQogIHdhcyBhZGRlZCB0byBkaWFnbm9zZSA6Y29tbWFuZDpgaW5z
dGFsbGAgY29tbWFuZHMgdGhhdCBzcGVjaWZ5IGFuCiAgYWJzb2x1dGUgYGBERVNUSU5BVElPTmBg
LiAgVGhpcyBkaWFnbm9zdGljIG1heSBiZSBjb250cm9sbGVkIHdpdGggdGhlCiAgOm9wdGlvbjpg
LVdpbnN0YWxsLWFic29sdXRlLWRlc3RpbmF0aW9uIDxjbWFrZSAtVz5gIGNvbW1hbmQtbGluZSBv
cHRpb24sCiAgdGhlIGBgaW5zdGFsbEFic29sdXRlRGVzdGluYXRpb25gYCBmaWVsZCBpbiBhCiAg
Om1hbnVhbDpgQ01ha2UgUHJlc2V0cyA8Y21ha2UtcHJlc2V0cyg3KT5gCiAgOnByZXNldDpgY29u
ZmlndXJlUHJlc2V0cy53YXJuaW5nc2Agb2JqZWN0LAogIG9yIHRoZSA6Y29tbWFuZDpgY21ha2Vf
ZGlhZ25vc3RpY2AgY29tbWFuZC4KClByZXNldHMKLS0tLS0tLQoKKiA6bWFudWFsOmBjbWFrZS1w
cmVzZXRzKDcpYCBmaWxlcyBub3cgc3VwcG9ydCBzY2hlbWEgdmVyc2lvbiAxMi4KCiogOm1hbnVh
bDpgY21ha2UoMSlgLCA6bWFudWFsOmBjdGVzdCgxKWAsIGFuZCA6bWFudWFsOmBjcGFjaygxKWAg
Z2FpbmVkCiAgYGAtLXByZXNldHMtZmlsZWBgIGFyZ3VtZW50cyB0byBzdXBwb3J0IGxvYWRpbmcK
ICA6bWFudWFsOmBwcmVzZXRzIDxjbWFrZS1wcmVzZXRzKDcpPmAgZnJvbSB0aGUgc3BlY2lmaWVk
IGZpbGUgaW5zdGVhZCBvZgogIGBgQ01ha2VQcmVzZXRzLmpzb25gYCBhbmQvb3IgYGBDTWFrZVVz
ZXJQcmVzZXRzLmpzb25gYC4gU2VlCiAgOm9wdGlvbjpgY21ha2UgLS1wcmVzZXRzLWZpbGVgLAog
IDpvcHRpb246YGNtYWtlIC0tYnVpbGQgLS1wcmVzZXRzLWZpbGUgPGNtYWtlLS1idWlsZCAtLXBy
ZXNldHMtZmlsZT5gLAogIDpvcHRpb246YGNtYWtlIC0td29ya2Zsb3cgLS1wcmVzZXRzLWZpbGUg
PGNtYWtlLS13b3JrZmxvdyAtLXByZXNldHMtZmlsZT5gLAogIDpvcHRpb246YGN0ZXN0IC0tcHJl
c2V0cy1maWxlYCwgYW5kIDpvcHRpb246YGNwYWNrIC0tcHJlc2V0cy1maWxlYCBmb3IgZGV0YWls
cy4KCiogOm1hbnVhbDpgY21ha2UtcHJlc2V0cyg3KWAsIGluIHNjaGVtYSB2ZXJzaW9uIDEyIGFu
ZCBhYm92ZSwgbm93IGV4cGFuZCB0aGUKICA6cmVmOmAke2ZpbGVEaXJ9IDxDTWFrZVByZXNldHMg
ZmlsZURpcj5gIG1hY3JvIHRvIHRoZSBkaXJlY3Rvcnkgb2YgdGhlCiAgcHJlc2V0cyBmaWxlIGNv
bnRhaW5pbmcgdGhlIGBgJHtmaWxlRGlyfWBgIG1hY3JvLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIK
ICBpdCBpcyBpbmhlcml0ZWQgYnkgYW5vdGhlciBwcmVzZXQgaW4gYSBkaWZmZXJlbnQgZGlyZWN0
b3J5LgoKKiA6bWFudWFsOmBjbWFrZS1wcmVzZXRzKDcpYCBnYWluZWQgc3VwcG9ydCBmb3IgYQog
IGBgdGVzdFBhc3N0aHJvdWdoQXJndW1lbnRzYGAgZmllbGQgaW4gdGhlCiAgdGVzdCBwcmVzZXQg
YGBleGVjdXRpb25gYCBvYmplY3QgZm9yCiAgZm9yd2FyZGluZyBhcmd1bWVudHMgdG8gdGVzdCBl
eGVjdXRhYmxlcyB2aWEgcHJlc2V0cy4KCkZpbGUtQmFzZWQgQVBJCi0tLS0tLS0tLS0tLS0tCgoq
IFRoZSA6bWFudWFsOmBjbWFrZS1maWxlLWFwaSg3KWAgImNvZGVtb2RlbCIgdmVyc2lvbiAyIG9i
amVjdCBoYXMgYmVlbgogIHVwZGF0ZWQgdG8gMi4xMS4KCiogVGhlIDptYW51YWw6YGNtYWtlLWZp
bGUtYXBpKDcpYCAiY29kZW1vZGVsIiB2ZXJzaW9uIDIgInRhcmdldCIgb2JqZWN0J3MKICAic291
cmNlcyIgYW5kICJpbnRlcmZhY2VTb3VyY2VzIiBvYmplY3RzIGdhaW5lZCBuZXcgYGBmaWxlU2V0
SW5kZXhlc2BgIGZpZWxkcwogIHRvIHN1cHBvcnQgc291cmNlcyBiZWxvbmdpbmcgdG8gbXVsdGlw
bGUgZmlsZSBzZXRzLiBUaGUgYGBmaWxlU2V0SW5kZXhgYAogIGZpZWxkcyBhcmUgbWFpbnRhaW5l
ZCBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgb25seSwgYW5kIHVzZXJzIGFyZSBhZHZpc2Vk
CiAgdG8gcG9ydCB0byB0aGUgbmV3IGZpZWxkcy4KCiogVGhlIDptYW51YWw6YGNtYWtlLWZpbGUt
YXBpKDcpYCAiY29kZW1vZGVsIiB2ZXJzaW9uIDIgInRhcmdldCIgb2JqZWN0J3MKICAic291cmNl
cyIgb2JqZWN0IGdhaW5lZCBhIG5ldyBgYGJhY2t0cmFjZXNgYCBmaWVsZCB0byByZXByZXNlbnQg
bXVsdGlwbGUKICBjb21tYW5kIGludm9jYXRpb25zIHdoaWNoIGFzc29jaWF0ZSBhIHNpbmdsZSBz
b3VyY2UgZm9yIGEgZ2l2ZW4gdGFyZ2V0IHdpdGgKICBtdWx0CgpbQ2hhbmdlbG9nIHRydW5jYXRl
ZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBi
ZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCgpTb3VyY2U6IEhlbHAv
cmVsZWFzZS80LjQucnN0CgpDTWFrZSA0LjQgUmVsZWFzZSBOb3RlcwoqKioqKioqKioqKioqKioq
KioqKioqKgoKLi4gb25seTo6IGh0bWwKCiAgLi4gY29udGVudHM6OgoKQ2hhbmdlcyBtYWRlIHNp
bmNlIENNYWtlIDQuMyBpbmNsdWRlIHRoZSBmb2xsb3dpbmcuCgpOZXcgRmVhdHVyZXMKPT09PT09
PT09PT09CgpEaWFnbm9zdGljcwotLS0tLS0tLS0tLQoKKiBDTWFrZSBkaWFnbm9zdGljIGFjdGlv
bnMgYXJlIG5vdyB0cmFja2VkIGluIGEgbmV3IHN0YXRlIHR5cGUgbWFuYWdlZCBieSB0aGUKICA6
Y29tbWFuZDpgY21ha2VfZGlhZ25vc3RpY2AgY29tbWFuZC4gIFRoaXMgcmVwbGFjZXMgdGhlIG9s
ZCBzeXN0ZW0gd2hpY2gKICBzb21ldGltZXMgdXNlZCB2YXJpYWJsZXMgdG8gbWFuYWdlIHJlcG9y
dGluZyBhY3Rpb25zIGFuZCBzb21ldGltZXMgZGlkIG5vdAogIGFsbG93IG1hbmFnZW1lbnQgYmV5
b25kIGNvbW1hbmQtbGluZSBvcHRpb25zIGFuZCBwcmVzZXRzLiAgVGhlIG5ldyBzeXN0ZW0KICBh
bHNvIGludHJvZHVjZXMgc2V2ZXJhbCBuZXcgZGlhZ25vc3RpYyBjYXRlZ29yaWVzIGFuZCBzaWdu
aWZpY2FudGx5IHJlZHVjZXMKICB0aGUgY29zdCBvZiBhZGRpbmcgYWRkaXRpb25hbCBjYXRlZ29y
aWVzIGluIHRoZSBmdXR1cmUuICBTZWUgdGhlCiAgOm1hbnVhbDpgY21ha2UtZGlhZ25vc3RpY3Mo
NylgIG1hbnVhbCBmb3IgYSBsaXN0IG9mIGF2YWlsYWJsZSBjYXRlZ29yaWVzLgoKKiBUaGUgOmRp
YWdub3N0aWM6YENNRF9JTlNUQUxMX0FCU09MVVRFX0RFU1RJTkFUSU9OYCBkaWFnbm9zdGljIGNh
dGVnb3J5CiAgd2FzIGFkZGVkIHRvIGRpYWdub3NlIDpjb21tYW5kOmBpbnN0YWxsYCBjb21tYW5k
cyB0aGF0IHNwZWNpZnkgYW4KICBhYnNvbHV0ZSBgYERFU1RJTkFUSU9OYGAuICBUaGlzIGRpYWdu
b3N0aWMgbWF5IGJlIGNvbnRyb2xsZWQgd2l0aCB0aGUKICA6b3B0aW9uOmAtV2luc3RhbGwtYWJz
b2x1dGUtZGVzdGluYXRpb24gPGNtYWtlIC1XPmAgY29tbWFuZC1saW5lIG9wdGlvbiwKICB0aGUg
YGBpbnN0YWxsQWJzb2x1dGVEZXN0aW5hdGlvbmBgIGZpZWxkIGluIGEKICA6bWFudWFsOmBDTWFr
ZSBQcmVzZXRzIDxjbWFrZS1wcmVzZXRzKDcpPmAKICA6cHJlc2V0OmBjb25maWd1cmVQcmVzZXRz
Lndhcm5pbmdzYCBvYmplY3QsCiAgb3IgdGhlIDpjb21tYW5kOmBjbWFrZV9kaWFnbm9zdGljYCBj
b21tYW5kLgoKUHJlc2V0cwotLS0tLS0tCgoqIDptYW51YWw6YGNtYWtlLXByZXNldHMoNylgIGZp
bGVzIG5vdyBzdXBwb3J0IHNjaGVtYSB2ZXJzaW9uIDEyLgoKKiA6bWFudWFsOmBjbWFrZSgxKWAs
IDptYW51YWw6YGN0ZXN0KDEpYCwgYW5kIDptYW51YWw6YGNwYWNrKDEpYCBnYWluZWQKICBgYC0t
cHJlc2V0cy1maWxlYGAgYXJndW1lbnRzIHRvIHN1cHBvcnQgbG9hZGluZwogIDptYW51YWw6YHBy
ZXNldHMgPGNtYWtlLXByZXNldHMoNyk+YCBmcm9tIHRoZSBzcGVjaWZpZWQgZmlsZSBpbnN0ZWFk
IG9mCiAgYGBDTWFrZVByZXNldHMuanNvbmBgIGFuZC9vciBgYENNYWtlVXNlclByZXNldHMuanNv
bmBgLiBTZWUKICA6b3B0aW9uOmBjbWFrZSAtLXByZXNldHMtZmlsZWAsCiAgOm9wdGlvbjpgY21h
a2UgLS1idWlsZCAtLXByZXNldHMtZmlsZSA8Y21ha2UtLWJ1aWxkIC0tcHJlc2V0cy1maWxlPmAs
CiAgOm9wdGlvbjpgY21ha2UgLS13b3JrZmxvdyAtLXByZXNldHMtZmlsZSA8Y21ha2UtLXdvcmtm
bG93IC0tcHJlc2V0cy1maWxlPmAsCiAgOm9wdGlvbjpgY3Rlc3QgLS1wcmVzZXRzLWZpbGVgLCBh
bmQgOm9wdGlvbjpgY3BhY2sgLS1wcmVzZXRzLWZpbGVgIGZvciBkZXRhaWxzLgoKKiA6bWFudWFs
OmBjbWFrZS1wcmVzZXRzKDcpYCwgaW4gc2NoZW1hIHZlcnNpb24gMTIgYW5kIGFib3ZlLCBub3cg
ZXhwYW5kIHRoZQogIDpyZWY6YCR7ZmlsZURpcn0gPENNYWtlUHJlc2V0cyBmaWxlRGlyPmAgbWFj
cm8gdG8gdGhlIGRpcmVjdG9yeSBvZiB0aGUKICBwcmVzZXRzIGZpbGUgY29udGFpbmluZyB0aGUg
YGAke2ZpbGVEaXJ9YGAgbWFjcm8sIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlcgogIGl0IGlzIGluaGVy
aXRlZCBieSBhbm90aGVyIHByZXNldCBpbiBhIGRpZmZlcmVudCBkaXJlY3RvcnkuCgoqIDptYW51
YWw6YGNtYWtlLXByZXNldHMoNylgIGdhaW5lZCBzdXBwb3J0IGZvciBhCiAgYGB0ZXN0UGFzc3Ro
cm91Z2hBcmd1bWVudHNgYCBmaWVsZCBpbiB0aGUKICB0ZXN0IHByZXNldCBgYGV4ZWN1dGlvbmBg
IG9iamVjdCBmb3IKICBmb3J3YXJkaW5nIGFyZ3VtZW50cyB0byB0ZXN0IGV4ZWN1dGFibGVzIHZp
YSBwcmVzZXRzLgoKRmlsZS1CYXNlZCBBUEkKLS0tLS0tLS0tLS0tLS0KCiogVGhlIDptYW51YWw6
YGNtYWtlLWZpbGUtYXBpKDcpYCAiY29kZW1vZGVsIiB2ZXJzaW9uIDIgb2JqZWN0IGhhcyBiZWVu
CiAgdXBkYXRlZCB0byAyLjExLgoKKiBUaGUgOm1hbnVhbDpgY21ha2UtZmlsZS1hcGkoNylgICJj
b2RlbW9kZWwiIHZlcnNpb24gMiAidGFyZ2V0IiBvYmplY3QncwogICJzb3VyY2VzIiBhbmQgImlu
dGVyZmFjZVNvdXJjZXMiIG9iamVjdHMgZ2FpbmVkIG5ldyBgYGZpbGVTZXRJbmRleGVzYGAgZmll
bGRzCiAgdG8gc3VwcG9ydCBzb3VyY2VzIGJlbG9uZ2luZyB0byBtdWx0aXBsZSBmaWxlIHNldHMu
IFRoZSBgYGZpbGVTZXRJbmRleGBgCiAgZmllbGRzIGFyZSBtYWludGFpbmVkIGZvciBiYWNrd2Fy
ZHMgY29tcGF0aWJpbGl0eSBvbmx5LCBhbmQgdXNlcnMgYXJlIGFkdmlzZWQKICB0byBwb3J0IHRv
IHRoZSBuZXcgZmllbGRzLgoKKiBUaGUgOm1hbnVhbDpgY21ha2UtZmlsZS1hcGkoNylgICJjb2Rl
bW9kZWwiIHZlcnNpb24gMiAidGFyZ2V0IiBvYmplY3QncwogICJzb3VyY2VzIiBvYmplY3QgZ2Fp
bmVkIGEgbmV3IGBgYmFja3RyYWNlc2BgIGZpZWxkIHRvIHJlcHJlc2VudCBtdWx0aXBsZQogIGNv
bW1hbmQgaW52b2NhdGlvbnMgd2hpY2ggYXNzb2NpYXRlIGEgc2luZ2xlIHNvdXJjZSBmb3IgYSBn
aXZlbiB0YXJnZXQgd2l0aAogIG11bHQKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2Vl
ZHMgMzAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFu
IGF0dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4vY21ha2Uve2NtYWtlLW5hdGl2
ZV80LjQuMS5iYiA9PiBjbWFrZS1uYXRpdmVfNC40LjIuYmJ9ICAgICAgfCAwCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzQuNC4xLmJiID0+IGNtYWtl
XzQuNC4yLmJifSAgfCAwCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZS1uYXRpdmVf
NC40LjEuYmIgPT4gY21ha2UtbmF0aXZlXzQuNC4yLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzQuNC4xLmJiID0+IGNtYWtlXzQuNC4yLmJifSAo
MTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0
aXZlXzQuNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80
LjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjQuMi5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMKaW5kZXggNDUxNzJkYTcyOS4uYTUxYjI1Yjg2NCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZF
UlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBT
UkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059
L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjk1ZDQ3MjFmMzYyNWZiMGQ5ZDZjYTQ4MGRkNTlhNDZjODRiNGMxNTdmN2ZhZGQyZTliMTc5
ZWY5Yzg3MTE3NGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWRiOWU2MWU2MGI2ZTA4NzRjODYz
ODYzNDBiOTEwMzgyZjNjNWU3NWI5ZmJmYjQ0ZDEyMjA2MzEyOWEyNzg5ZCIKIAogVVBTVFJFQU1f
Q0hFQ0tfUkVHRVggPSAiY21ha2UtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80LjQuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80LjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEw
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuNC4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC40LjIuYmIKLS0g
CjIuNDcuMQoK

--===============1871961461298168620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cmake-changelog.txt"

Changelog for cmake: 4.4.1 -> 4.4.2
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

4.4.2
-----

* This version made no changes to documented features or interfaces.
  Some implementation updates were made to support ecosystem changes
  and/or fix regressions.

--===============1871961461298168620==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF5CCA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 05:21:55 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22059.1791696106262577975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 22:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OyhF7uzA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QX910MlP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a12968ef3e-91d6bfd4-1a3a-4ae0-937f-c3fd6204d975-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791696105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TEGoscFEth6O5EMQjqRmlgXM0VgjxCY4EZ481PGG9OE=;
	b=OyhF7uzAdEo1Q8GyDHN25QGhPs/VwDWcf1f/dlM3UuOYGY1t7+YgDB5zXw0f3crd
	6YvH+ouv8UY5g1SIzamOv/sUogsczoF60lCt/v7m04B56zq650DeQoLIj8KSEIFfo36
	/LL65v9j37SevFiWUnur6OvyTbnVivdsCxcIL3XM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791696105;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TEGoscFEth6O5EMQjqRmlgXM0VgjxCY4EZ481PGG9OE=;
	b=QX910MlPA7uvz2Xdd8HhwJVy+mm0AEcRIDd90tOMt25Mky5qdts9m/J41zKSYQud
	JiNF12JMGl9BAQEkLacZj+tS+iJvwwdtua1VVrHqb4vuWuSED9BuHqrGckQygey4bYM
	HSUCJpoJ0cg9BxOJvG9Le+UE9dLFyVVJVnlNNFnc=
Content-Type: multipart/mixed; boundary="===============8584616282842845497=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.5.4 SUCCEEDED
Message-ID: <010101a12968ef3e-91d6bfd4-1a3a-4ae0-937f-c3fd6204d975-000000@us-west-2.amazonses.com>
Date: Sun, 11 Oct 2026 05:21:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 05:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247508

--===============8584616282842845497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.5.3-2.5.4.patch
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
From 51bae7cbe369a9f6a105f12218df181d6dbba9fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 11 Oct 2026 05:17:42 +0000
Subject: [PATCH] python3-numpy: upgrade 2.5.3 -> 2.5.4

Contributors
============

A total of 9 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 17 pull requests were merged for this release.
.. currentmodule:: numpy

=========================
NumPy 2.5.4 Release Notes
=========================

*Released on 2026-10-10.*

NumPy 2.5.4 is a patch release that fixes bugs discovered after the 2.5.3
release. Highlights are:

- Many typing fixes and improvements,
- A workaround for the MSVC 19.51 bug, see below.

This release supports Python versions 3.12-3.15.

Improvements
============

- ``numpy.linalg.svd`` and ``numpy.linalg.lstsq`` now raise for inputs
  containing
  infinities instead of returning garbage results.
- Fixed hangs in ``numpy.linalg.svd`` and ``numpy.linalg.lstsq`` for certain
  inputs
  containing infinities for recent versions of some LAPACK implementations.
- ``numpy.linalg.cond`` now handles non-finite inputs more consistently.

  (`gh-32593 < >`__)

StringDType hashing with NaN sentinels
--------------------------------------
``StringDType`` instances with equivalent floating-point NaN sentinels now
have equal hashes. Previously, distinct NaN objects could produce equal
dtype instances with different hashes, causing dictionary lookups and set
deduplication to fail.

(`gh-32563 < >`__)

Changes
=======

``MaskedArray`` resets a fill_value that cannot be represented in a new dtype
-----------------------------------------------------------------------------
A fill_value copied from a source array is now reset to the default fill_value
for the new dtype when it cannot be represented in that dtype.  Previously the
copied value could be stale: ufuncs that change dtype left the result holding a
fill_value typed for the old dtype, which raised a ``TypeError`` only when
something later validated it (such as ``.view()``), and a floating point
fill_value that overflows an integer dtype was kept as an out-of-range value
together with a ``RuntimeWarning``.  Both now fall back to the default,
including when a masked array is passed to ``MaskedArray`` with a different
``dtype``.  A fill_value given explicitly by the user is still validated and
raises as before.  This can now raise a ``ComplexWarning`` if the fill_value is
complex and the new dtype is real.

(`gh-32508 < >`__)
(`gh-32562 < >`__)

Contributors
============

A total of 9 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 17 pull requests were merged for this release.

---
title: Release 1.11.0
short-description: Release notes for 1.11.0
# New features

Meson 1.11.0 was released on 13 April 2026
## BuildTarget(install_dir) length > 1 replaced with keywords

Build targets previously supported (with limited documentation) passing an array
of more than one element to `install_dir:` (except in some wrappers), and
would map these additional `install_dir`s to extra outputs. This was only used
by
Vala, and separate explicit keyword arguments are now available that provide
the same functionality.

Code like this:
```meson
library(
  'foo',
  'foo.vala',
  install : true,
  install_dir : [true, get_option('includedir') / 'foo', true],
)
```

should now be written as the much clearer:

```meson
library(
  'foo',
  'foo.vala',
  install : true,
  install_vala_header : get_option('includedir') / 'foo',
  install_vala_vapi : true,
)
```

Note that the default is `false` for the Vala extra outputs.
## Cargo workspace object

Meson is now able to parse the toplevel `Cargo.toml` file of the
project when the `workspace()` method of the Rust module is called.
This guarantees that features are resolved according to what is
in the `Cargo.toml` file, and in fact enables configuration of
features for the build.

The returned object allows retrieving features and dependencies
for Cargo subprojects, and contains methods to build targets
declared in `Cargo.toml` files.

While Cargo subprojects remain experimental, the Meson project will
try to keep the workspace object reasonably backwards-compatible.

## Cython no longer requires explicitly enabling C or C++

This only provides these languages as an implementation detail of Cython, so
native C/C++ targets cannot be compiled.

## Deduplication of OpenMP linker arguments
Meson now deduplicates linker arguments `-fopenmp` and `-qopenmp`.
## `meson dist` now accepts `-j`/`--num-processes`

`meson dist` now supports a `-j`/`--num-processes` flag to control the number of
parallel processes used during the distribution check (compilation and testing
of
the generated package).  The `MESON_NUM_PROCESSES` environment variable is also
honored, consistent with other Meson commands.

## Deprecate `should_fail` and rename it to `expected_fail`, also introduce
`expected_exitcode`

In 1.11.0 `should_fail` has been renamed to `expected_fail`.

Before 1.11.0,

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../python/{python3-numpy_2.5.3.bb => python3-numpy_2.5.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.3.bb => python3-numpy_2.5.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb b/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.5.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.4.bb
index 338bdd2bbd..93aa356db1 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
@@ -10,7 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "df2d5874ff183595a4ba404edd04f6bd9b5505c1d7708573f6a6c17489a67563"
+SRC_URI[sha256sum] = "9a94cf751c9ad8ebaa835bcd3d40dacf8534ad086b88c38029b65123c7999d2a"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============8584616282842845497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/num
 py/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/philox, directory renamed /usr
 /lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/linalg/lapack_lite, directo
 ry renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/splitmix64
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info

--===============8584616282842845497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-numpy-changelog.txt"

Contributors
============

A total of 9 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 17 pull requests were merged for this release.
.. currentmodule:: numpy

=========================
NumPy 2.5.4 Release Notes
=========================

*Released on 2026-10-10.*

NumPy 2.5.4 is a patch release that fixes bugs discovered after the 2.5.3
release. Highlights are:

- Many typing fixes and improvements,
- A workaround for the MSVC 19.51 bug, see below.

This release supports Python versions 3.12-3.15.

Improvements
============

- ``numpy.linalg.svd`` and ``numpy.linalg.lstsq`` now raise for inputs
  containing
  infinities instead of returning garbage results.
- Fixed hangs in ``numpy.linalg.svd`` and ``numpy.linalg.lstsq`` for certain
  inputs
  containing infinities for recent versions of some LAPACK implementations.
- ``numpy.linalg.cond`` now handles non-finite inputs more consistently.

  (`gh-32593 < >`__)

StringDType hashing with NaN sentinels
--------------------------------------
``StringDType`` instances with equivalent floating-point NaN sentinels now
have equal hashes. Previously, distinct NaN objects could produce equal
dtype instances with different hashes, causing dictionary lookups and set
deduplication to fail.

(`gh-32563 < >`__)

Changes
=======

``MaskedArray`` resets a fill_value that cannot be represented in a new dtype
-----------------------------------------------------------------------------
A fill_value copied from a source array is now reset to the default fill_value
for the new dtype when it cannot be represented in that dtype.  Previously the
copied value could be stale: ufuncs that change dtype left the result holding a
fill_value typed for the old dtype, which raised a ``TypeError`` only when
something later validated it (such as ``.view()``), and a floating point
fill_value that overflows an integer dtype was kept as an out-of-range value
together with a ``RuntimeWarning``.  Both now fall back to the default,
including when a masked array is passed to ``MaskedArray`` with a different
``dtype``.  A fill_value given explicitly by the user is still validated and
raises as before.  This can now raise a ``ComplexWarning`` if the fill_value is
complex and the new dtype is real.

(`gh-32508 < >`__)
(`gh-32562 < >`__)

Contributors
============

A total of 9 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 17 pull requests were merged for this release.

---
title: Release 1.11.0
short-description: Release notes for 1.11.0
# New features

Meson 1.11.0 was released on 13 April 2026
## BuildTarget(install_dir) length > 1 replaced with keywords

Build targets previously supported (with limited documentation) passing an array
of more than one element to `install_dir:` (except in some wrappers), and
would map these additional `install_dir`s to extra outputs. This was only used
by
Vala, and separate explicit keyword arguments are now available that provide
the same functionality.

Code like this:
```meson
library(
  'foo',
  'foo.vala',
  install : true,
  install_dir : [true, get_option('includedir') / 'foo', true],
)
```

should now be written as the much clearer:

```meson
library(
  'foo',
  'foo.vala',
  install : true,
  install_vala_header : get_option('includedir') / 'foo',
  install_vala_vapi : true,
)
```

Note that the default is `false` for the Vala extra outputs.
## Cargo workspace object

Meson is now able to parse the toplevel `Cargo.toml` file of the
project when the `workspace()` method of the Rust module is called.
This guarantees that features are resolved according to what is
in the `Cargo.toml` file, and in fact enables configuration of
features for the build.

The returned object allows retrieving features and dependencies
for Cargo subprojects, and contains methods to build targets
declared in `Cargo.toml` files.

While Cargo subprojects remain experimental, the Meson project will
try to keep the workspace object reasonably backwards-compatible.

## Cython no longer requires explicitly enabling C or C++

This only provides these languages as an implementation detail of Cython, so
native C/C++ targets cannot be compiled.

## Deduplication of OpenMP linker arguments
Meson now deduplicates linker arguments `-fopenmp` and `-qopenmp`.
## `meson dist` now accepts `-j`/`--num-processes`

`meson dist` now supports a `-j`/`--num-processes` flag to control the number of
parallel processes used during the distribution check (compilation and testing
of
the generated package).  The `MESON_NUM_PROCESSES` environment variable is also
honored, consistent with other Meson commands.

## Deprecate `should_fail` and rename it to `expected_fail`, also introduce
`expected_exitcode`

In 1.11.0 `should_fail` has been renamed to `expected_fail`.

Before 1.11.0, there was no way to positively test a command/binary returning
error/non-zero exit code when the used protocol was set to exitcode, so
`expected_exitcode` has been introduced to achieve this. Do note that if the
exitcode does not match the expected value, GNU skip and exit codes are still
valid and the test result may be skip or error.

## The external_project module uses the cygpath command to convert paths

In previous versions, the external_project module on Windows used a Windows-
style path (e.g., `C:/path/to/configure`) to execute the configure file, and a
relative path from the drive root (e.g., `/path/to/prefix`) as the installation
prefix.
However, since configure scripts are typically intended to be run in a POSIX-
like environment (MSYS2, Cygwin, or GitBash), these paths were incompatible with
some configure scripts.

The external_project module now uses the `cygpath` command to convert the
configure command path and prefix to Unix-style paths (e.g.,
`/c/path/to/configure` for MSYS2 and `/cygdrive/c/path/to/configure` for
Cygwin).
If the `cygpath` command is not found in the PATH, it will fall back to the
previous behavior.

## install_man and install_headers: add support for install_tag kwarg

`install_man` and `install_headers` now support the `install_tag` keyword
argument,
allowing selection of installed files via `meson install --tags`. Previously,
`install_man` always used the `man` tag and `install_headers` always used the
`devel` tag, with no way to override them.

## Added `link_early_args` to targets performing linking

Options passed to the linker using the `link_args` keyword argument
get placed on the command line after all objects and libraries. Some
linker options, like `-u` or `--defsym`, are only useful if placed
before objects and libraries as they control how the linker
manipulates those.

The new `link_early_args` keyword argument passes linker options which
are inserted into the command line before any objects and libraries,
allowing applications to use these kinds of linker options with Meson.

This is currently only supported when using the `ninja` backend.
## Machine files now expand `~` as the user's home directory

A new constant `~` has been added which can be used in machine files (native
and cross files) to refer to the user's home directory. This is useful for
specifying paths to SDKs and toolchains that are commonly installed into `~`,
such as Qt, the Android SDK/NDK, or user-installed frameworks on macOS:

```ini
[constants]
toolchain = ~ /
'Android/sdk/ndk/27.1.12297006/toolchains/llvm/prebuilt/linux-x86_64'

[binaries]
c = toolchain / 'bin/clang'
cpp = toolchain / 'bin/clang++'
ar = toolchain / 'bin/llvm-ar'
```

Note that `~` can be used anywhere in the machine file. In the above example,
the purpose of defining a new constant called `toolchain` is to not have to
repeat yourself when using the path multiple times.

## `meson format` file sorting is now disabled by default and uses natural
sorting

The `sort_files` option to `meson format`, which sorts the arguments of
`files()` invocations, is now disabled by default.

If the `sort_files` option is enabled, `meson format` now sorts `files()`
arguments [naturally](Style-guide.md#sorting-source-paths) rather than
alphabetically.

## `-Db_lto` and `-Db_pgo` now supported for MSVC

`-Db_lto` is now supported for MSVC's `/LTCG`, as is `-Db_lto_mode=thin`
for `/LTCG:INCREMENTAL`. `-Db_pgo` is also supported, and should be used
alongside `-Db_lto=true`.

## Last major version supporting Python 3.7, 3.8, and 3.9

Python older than 3.10 is now EOL, and Meson will drop support for these
versions in the next major release, and will freely use features from 3.8, 3.9
and 3.10. Support for these versions will remain for the 1.11.x series.

## Python extension modules default to C ABI for Rust

`py.extension_module()` now defaults `rust_abi` to `'c'`, so that Rust
extension modules produce a `cdylib` instead of a `dylib`.  This is the
correct crate type for Python extension modules written in Rust, and
previously had to be specified manually via `rust_crate_type: 'cdylib'`
or `rust_abi: 'c'`.

## Meson now defines `QT_DEBUG` or `QT_NO_DEBUG` depending on build type

When using the `qt` Meson modules, the `QT_DEBUG` or `QT_NO_DEBUG` preprocessor
macro is now set depending on the value of the `debug` built-in Meson option.
This mimics the behavior of `qmake`, and is expected by the `<QtGlobal>` header.

## `compiler_target()` method in the Rust module

A `compiler_target()` method that returns the Rust target triple has been added
to
the `rust` module. This method can be useful when converting build scripts
making use of Cargo's `TARGET` and `HOST` environment variables to
Meson.

## Change to handling of linker arguments for Rust

Since the Rust compiler integrates the compiler and linker phase, previous
Meson versions did not obey `link_args`, `add_project_link_arguments`
or `add_global_link_arguments`.

Starting in this version, `add_project_link_arguments()`,
`add_global_link_arguments()`, and the `link_args` keyword argument are
supported for Rust.  They wrap the arguments with `-Clink-arg=` when
invoking rustc, and are only included when creating binary or shared
library crates.

Likewise, methods such as `has_link_argument()` now wrap the arguments
being tested with `-Clink-arg=`.

## XC32 support now aware of v5.00 features

XC32 features introduced in v5.00 can now be used. This includes
support for LTO auto and the C2x and CPP23 standards.

## windows.compile_resources now detects header changes with rc.exe

The `rc.exe` resource compiler neither provides *depfile* support nor
allows showing includes, as is possible with C or C++ compilers.
Therefore, changes to files included by the `.rc` file did not trigger
recompilation of the resource file.

A workaround was added to Meson by calling the preprocessor on the
`.rc` file to display the included headers and allow ninja to record them
as dependencies.

## Added `implicit_include_directories` argument to `windows.compile_resources`

[Windows](Windows-module.md) module [compile_resources](Windows-
module.md#compile_resources)
now has an `implicit_include_directories` keyword argument to automatically
add current build and source directories to the included paths when compiling
a resource.

---
title: Release 1.12.0
short-description: Release notes for 1.12.0
# New features

Meson 1.12.0 was released on 10 August 2026
## Custom dependency for atomic now works on MSVC

`dependency('atomic')` now works on MSVC >=19.35.32124.
It requires `c_std=c11` or later, otherwise the dependency will return not
found.

## Support for CACHEDIR.TAG specification

A CACHEDIR.TAG file (https://bford.info/cachedir/) is now created in the build
directory as part of the setup and regenerate phases, allowing backup software
to ignore the whole directory.

## New "clippy-json" Ninja Target For rust-analyzer
A new `clippy-json` ninja target will now be generated for rust projects.

rust-analyzer supports non-cargo based projects so long as you provide it with a
`rust-project.json` file and a custom "check command" to provide compiler
errors.  Meson already for some time has generated a `rust-project.json` file
for rust-analyzer, but had no way to hook up its rustc/clippy output to rust-
analyzer.

To use the new feature, you need to override the rust-analyzer check command as
shown [in the rust-analyzer documentation](https://rust-
analyzer.github.io/book/non_cargo_based_projects.html), and set it to a `ninja
invocation along the lines of `ninja clippy-json -C build`.

## Add a new `default()` function and object

This function and object allow setting a keyword argument to it's default value.
This is especially useful for cases when a non-default value is wanted in some
cases but not all.

For example:
```meson
library(
  ...
  name_prefix : host_machine.system() == 'windows' ? '' : default(),
)
```

## Delay install script errors to install time

Previously, `gnome.post_install` might've caused a configure to fail
due to tools such as `update-desktop-database` not being installed or
due to an `exe_wrapper` missing when cross-building glib. Those
errors will now be delayed to install time, or not emitted at all
if installing with `DESTDIR` set, since then they'll be skipped.

## find_program() now respects --force-fallback-for

If a subproject listed in --force-fallback-for provides a particular
program (via program_names in its wrapfile), find_program will use the
program from the subproject instead of looking it up from the system.

## `fs.copyfile()` now has a `build_subdir` argument

`fs.copyfile()`'s new `build_subdir` argument allows creating a file
inside a subdirectory of the current build directory.

## Added `depends` kwarg to `generator.process()`

The [[generator.process]] method now supports specifying `depends` as a kwarg
to extend the list of dependencies for generated files.

## Added `msgfmt_args` arg to `i18n.gettext`

`i18n.gettext` now supports the `msgfmt_args` argument.
This argument can be used to pass additional arguments to
`msgfmt` when building the translations.

```meson
i18n = import('i18n')
i18n.gettext('mycatalog',
             args : ['-k_', '-kN_'],
             msgfmt_args : ['--use-fuzzy'])
```

## include_directories object now have a to_list() method

The [[@inc]] object returned by [[include_directories]] now has a `to_list()`
method that
returns a list of strings of absolute paths. Unless the include path is a
system path, there will be a path for the source root and one for the build
root.

```
inc = include_directories('include')
include_paths = inc.to_list()
```

## Added integer base conversions to `str.to_int()` and `int.to_string()`

Meson strings can now be converted from hexadecimal, octal, and binary
integer literals with `str.to_int()`. Integers can also be formatted back to
strings in those bases with `int.to_string(format:)`.

```meson
assert('0xff'.to_int() == 255)
assert(255.to_string(format: 'hex') == '0xff')
```

## Multiple positional arguments for `meson wrap install`

Previously `meson wrap install` only accepted a single wrap name to install.
This limitation has now been lifted, and it is now possible to specify
multiple wrap names for installation. The exit code will be non-zero
if *any* of the wraps fail to install.

## `meson format` allows `--recursive` with `--check-diff`

Previously, the `--recursive` option to `meson format` required
either `--inplace` or `--output`.  With this version, `--check-diff`
is allowed to.

## New option `--subprojects` for `meson format`

A new option `--subprojects`, to be specified together with `--recursive`,
tells `meson format` to also recurse into subprojects.

## OpenHarmony (OHOS) is now recognized as an Android subsystem

Meson now recognizes OpenHarmony / HarmonyOS (OHOS). OHOS behaves like
Android -- applications are shared libraries, shared libraries are not
versioned, and so on -- but uses musl instead of Bionic. It is therefore
modelled as an Android subsystem rather than a separate system.

Machine files select it in the `[host_machine]` section with:

```ini
[host_machine]
system = 'android'
subsystem = 'ohos'
```

With this, `host_machine.system()` is `'android'` (so all Android handling
applies, including unversioned `libfoo.so` output) while
`host_machine.subsystem()` is `'ohos'`. When cross-compiling a CMake
subproject, the toolchain file generated by the CMake module sets
`CMAKE_SYSTEM_NAME = OHOS`.

## External programs as inputs and dependencies to custom targets

Custom targets now allow specifying an external program in
the `input` and `depends` keyword arguments.  This also applies
to several methods provided by modules, as they are lowered to
custom targets internally.

## External programs as dependencies to tests

Tests now allow specifying an external program in
the `depends` keyword argument.

## Support for Python 3.7, 3.8, and 3.9 dropped
Meson 1.12 is the first version to require Python version 3.10 or greater.

Support for older versions of Python is maintained with bug fixes only for
some LTS releases. See the [FAQ
entry](FAQ.md#Do-you-at-least-support-my-ancient-python-install) for more
information.

## More types of generated files allowed by `qt.preprocess`

`qt.preprocess` now allows custom target indexes or generators
in addition to custom targets for `ui_files`, `moc_sources`
and `moc_headers`.

## The Rust module includes a basic wrapper for cbindgen

This will correctly track the config.toml, and generate a rust source from the
marked C files. This handles structured_sources correctly, and also handles
depfile generation transparently.

## Non-default members of Cargo workspaces can now be built

The new keyword argument `extra_members` to the `workspace()` method
allows configuring non-default members of a Cargo workspace.  Previously,
non-default members were never used for dependency resolution and
could not be built.

## subproject() and meson.override_find_program() now support the native keyword
argument

Subprojects may now be built for the host or build machine (or both). Therefore,
in a cross compile setup, build-time dependencies can be built for the machine
running the build. When a subproject is run for the build machine it will act
just like a normal build == host setup, except that no targets will be
installed.

This necessarily means that `meson.override_find_program()` must differentiate
between programs for the host and those for the build machine, as you may need
two versions of the same program, which have different outputs based on the
machine they are for. For backwards compatibility reasons the default is for the
host machine. Inside a native subproject the host and build machine will both be
the build machine.

Cargo workspaces use this feature automatically when building procedural macro
crates and their dependencies.

## `meson test` now accepts `--exclude`

`meson test` has a new `--exclude` argument to allow skipping named
tests. It takes a full test name and can be specified repeatedly. This
should help distributions that need to skip tests irrelevant for them
or known to be buggy.

## Vala cross compilation changes

Traditionally Meson has used the same Vala compiler for cross and
native compilation. It turned out that even though the Vala compiler
generated C code, the output and its dependencies are platform
dependent. Now Meson uses Vala in the same way as all other cross
compilers and it can be defined in the cross file.

## `werror=true` now applies to the linker as well

When `werror=true` is set, Meson now passes the appropriate
fatal-warnings flag to the linker (for example `--fatal-warnings`
for GNU ld, `-fatal_warnings` for Apple ld, `/WX` for MSVC link).
Previously, `werror=true` only affected compiler warnings.

## Added `win_subsystem` to `shared_library()` and `shared_module()`
Synonym for the one found in `executable()`.

Mostly useful for setting the subsystem version in PE headers.
This can affects Windows's ShimEngine, but not SxS lookups. Usually you still
want to provide a manifest when targeting modern Windows.
Sometime also useful for targeting other subsystems.

Visual Studio backends now also properly supports setting subsystem versions.
## i18n.xgettext recursive option now includes "private" dependencies
Suppose we have:

```
libA.dll -> libB.dll -> libC.dll
```

Here, `libA` links with `libB`, and `libB` links with `libC`, but `libA` does
not link with `libC` directly. So, `libC` is a "private" dependency of `libB`.
If we collect strings to translate using:

```
i18n.xgettext(libC)
i18n.xgettext(libB)
pot_file = i18n.xgettext(libA, recursive: true)
```

Previously, strings from `libC` would not be included in `pot_file`, since
`libC` is not a direct link dependency of `libA`. This has been fixed: when
the `recursive: true` option is used, `xgettext` now recursively includes
translations from all dependencies, including those of dependencies. This is
more logical, as even if `libA` does not directly link with `libC`, it may
still need translated strings from `libC`.

--===============8584616282842845497==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.5.3-2.5.4.patch"

RnJvbSA1MWJhZTdjYmUzNjlhOWY2YTEwNWYxMjIxOGRmMTgxZDZkYmJhOWZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTEgT2N0IDIwMjYgMDU6MTc6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuNS4zIC0+IDIuNS40CgpDb250cmlidXRvcnMKPT09PT09
PT09PT09CgpBIHRvdGFsIG9mIDkgcGVvcGxlIGNvbnRyaWJ1dGVkIHRvIHRoaXMgcmVsZWFzZS4g
IFBlb3BsZSB3aXRoIGEgIisiIGJ5IHRoZWlyCm5hbWVzIGNvbnRyaWJ1dGVkIGEgcGF0Y2ggZm9y
IHRoZSBmaXJzdCB0aW1lLgoKUHVsbCByZXF1ZXN0cyBtZXJnZWQKPT09PT09PT09PT09PT09PT09
PT0KCkEgdG90YWwgb2YgMTcgcHVsbCByZXF1ZXN0cyB3ZXJlIG1lcmdlZCBmb3IgdGhpcyByZWxl
YXNlLgouLiBjdXJyZW50bW9kdWxlOjogbnVtcHkKCj09PT09PT09PT09PT09PT09PT09PT09PT0K
TnVtUHkgMi41LjQgUmVsZWFzZSBOb3Rlcwo9PT09PT09PT09PT09PT09PT09PT09PT09CgoqUmVs
ZWFzZWQgb24gMjAyNi0xMC0xMC4qCgpOdW1QeSAyLjUuNCBpcyBhIHBhdGNoIHJlbGVhc2UgdGhh
dCBmaXhlcyBidWdzIGRpc2NvdmVyZWQgYWZ0ZXIgdGhlIDIuNS4zCnJlbGVhc2UuIEhpZ2hsaWdo
dHMgYXJlOgoKLSBNYW55IHR5cGluZyBmaXhlcyBhbmQgaW1wcm92ZW1lbnRzLAotIEEgd29ya2Fy
b3VuZCBmb3IgdGhlIE1TVkMgMTkuNTEgYnVnLCBzZWUgYmVsb3cuCgpUaGlzIHJlbGVhc2Ugc3Vw
cG9ydHMgUHl0aG9uIHZlcnNpb25zIDMuMTItMy4xNS4KCkltcHJvdmVtZW50cwo9PT09PT09PT09
PT0KCi0gYGBudW1weS5saW5hbGcuc3ZkYGAgYW5kIGBgbnVtcHkubGluYWxnLmxzdHNxYGAgbm93
IHJhaXNlIGZvciBpbnB1dHMKICBjb250YWluaW5nCiAgaW5maW5pdGllcyBpbnN0ZWFkIG9mIHJl
dHVybmluZyBnYXJiYWdlIHJlc3VsdHMuCi0gRml4ZWQgaGFuZ3MgaW4gYGBudW1weS5saW5hbGcu
c3ZkYGAgYW5kIGBgbnVtcHkubGluYWxnLmxzdHNxYGAgZm9yIGNlcnRhaW4KICBpbnB1dHMKICBj
b250YWluaW5nIGluZmluaXRpZXMgZm9yIHJlY2VudCB2ZXJzaW9ucyBvZiBzb21lIExBUEFDSyBp
bXBsZW1lbnRhdGlvbnMuCi0gYGBudW1weS5saW5hbGcuY29uZGBgIG5vdyBoYW5kbGVzIG5vbi1m
aW5pdGUgaW5wdXRzIG1vcmUgY29uc2lzdGVudGx5LgoKICAoYGdoLTMyNTkzIDwgPmBfXykKClN0
cmluZ0RUeXBlIGhhc2hpbmcgd2l0aCBOYU4gc2VudGluZWxzCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmBgU3RyaW5nRFR5cGVgYCBpbnN0YW5jZXMgd2l0aCBlcXVpdmFs
ZW50IGZsb2F0aW5nLXBvaW50IE5hTiBzZW50aW5lbHMgbm93CmhhdmUgZXF1YWwgaGFzaGVzLiBQ
cmV2aW91c2x5LCBkaXN0aW5jdCBOYU4gb2JqZWN0cyBjb3VsZCBwcm9kdWNlIGVxdWFsCmR0eXBl
IGluc3RhbmNlcyB3aXRoIGRpZmZlcmVudCBoYXNoZXMsIGNhdXNpbmcgZGljdGlvbmFyeSBsb29r
dXBzIGFuZCBzZXQKZGVkdXBsaWNhdGlvbiB0byBmYWlsLgoKKGBnaC0zMjU2MyA8ID5gX18pCgpD
aGFuZ2VzCj09PT09PT0KCmBgTWFza2VkQXJyYXlgYCByZXNldHMgYSBmaWxsX3ZhbHVlIHRoYXQg
Y2Fubm90IGJlIHJlcHJlc2VudGVkIGluIGEgbmV3IGR0eXBlCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkEgZmlsbF92YWx1ZSBjb3BpZWQgZnJvbSBhIHNvdXJjZSBhcnJheSBpcyBub3cgcmVzZXQgdG8g
dGhlIGRlZmF1bHQgZmlsbF92YWx1ZQpmb3IgdGhlIG5ldyBkdHlwZSB3aGVuIGl0IGNhbm5vdCBi
ZSByZXByZXNlbnRlZCBpbiB0aGF0IGR0eXBlLiAgUHJldmlvdXNseSB0aGUKY29waWVkIHZhbHVl
IGNvdWxkIGJlIHN0YWxlOiB1ZnVuY3MgdGhhdCBjaGFuZ2UgZHR5cGUgbGVmdCB0aGUgcmVzdWx0
IGhvbGRpbmcgYQpmaWxsX3ZhbHVlIHR5cGVkIGZvciB0aGUgb2xkIGR0eXBlLCB3aGljaCByYWlz
ZWQgYSBgYFR5cGVFcnJvcmBgIG9ubHkgd2hlbgpzb21ldGhpbmcgbGF0ZXIgdmFsaWRhdGVkIGl0
IChzdWNoIGFzIGBgLnZpZXcoKWBgKSwgYW5kIGEgZmxvYXRpbmcgcG9pbnQKZmlsbF92YWx1ZSB0
aGF0IG92ZXJmbG93cyBhbiBpbnRlZ2VyIGR0eXBlIHdhcyBrZXB0IGFzIGFuIG91dC1vZi1yYW5n
ZSB2YWx1ZQp0b2dldGhlciB3aXRoIGEgYGBSdW50aW1lV2FybmluZ2BgLiAgQm90aCBub3cgZmFs
bCBiYWNrIHRvIHRoZSBkZWZhdWx0LAppbmNsdWRpbmcgd2hlbiBhIG1hc2tlZCBhcnJheSBpcyBw
YXNzZWQgdG8gYGBNYXNrZWRBcnJheWBgIHdpdGggYSBkaWZmZXJlbnQKYGBkdHlwZWBgLiAgQSBm
aWxsX3ZhbHVlIGdpdmVuIGV4cGxpY2l0bHkgYnkgdGhlIHVzZXIgaXMgc3RpbGwgdmFsaWRhdGVk
IGFuZApyYWlzZXMgYXMgYmVmb3JlLiAgVGhpcyBjYW4gbm93IHJhaXNlIGEgYGBDb21wbGV4V2Fy
bmluZ2BgIGlmIHRoZSBmaWxsX3ZhbHVlIGlzCmNvbXBsZXggYW5kIHRoZSBuZXcgZHR5cGUgaXMg
cmVhbC4KCihgZ2gtMzI1MDggPCA+YF9fKQooYGdoLTMyNTYyIDwgPmBfXykKCkNvbnRyaWJ1dG9y
cwo9PT09PT09PT09PT0KCkEgdG90YWwgb2YgOSBwZW9wbGUgY29udHJpYnV0ZWQgdG8gdGhpcyBy
ZWxlYXNlLiAgUGVvcGxlIHdpdGggYSAiKyIgYnkgdGhlaXIKbmFtZXMgY29udHJpYnV0ZWQgYSBw
YXRjaCBmb3IgdGhlIGZpcnN0IHRpbWUuCgpQdWxsIHJlcXVlc3RzIG1lcmdlZAo9PT09PT09PT09
PT09PT09PT09PQoKQSB0b3RhbCBvZiAxNyBwdWxsIHJlcXVlc3RzIHdlcmUgbWVyZ2VkIGZvciB0
aGlzIHJlbGVhc2UuCgotLS0KdGl0bGU6IFJlbGVhc2UgMS4xMS4wCnNob3J0LWRlc2NyaXB0aW9u
OiBSZWxlYXNlIG5vdGVzIGZvciAxLjExLjAKIyBOZXcgZmVhdHVyZXMKCk1lc29uIDEuMTEuMCB3
YXMgcmVsZWFzZWQgb24gMTMgQXByaWwgMjAyNgojIyBCdWlsZFRhcmdldChpbnN0YWxsX2Rpcikg
bGVuZ3RoID4gMSByZXBsYWNlZCB3aXRoIGtleXdvcmRzCgpCdWlsZCB0YXJnZXRzIHByZXZpb3Vz
bHkgc3VwcG9ydGVkICh3aXRoIGxpbWl0ZWQgZG9jdW1lbnRhdGlvbikgcGFzc2luZyBhbiBhcnJh
eQpvZiBtb3JlIHRoYW4gb25lIGVsZW1lbnQgdG8gYGluc3RhbGxfZGlyOmAgKGV4Y2VwdCBpbiBz
b21lIHdyYXBwZXJzKSwgYW5kCndvdWxkIG1hcCB0aGVzZSBhZGRpdGlvbmFsIGBpbnN0YWxsX2Rp
cmBzIHRvIGV4dHJhIG91dHB1dHMuIFRoaXMgd2FzIG9ubHkgdXNlZApieQpWYWxhLCBhbmQgc2Vw
YXJhdGUgZXhwbGljaXQga2V5d29yZCBhcmd1bWVudHMgYXJlIG5vdyBhdmFpbGFibGUgdGhhdCBw
cm92aWRlCnRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkuCgpDb2RlIGxpa2UgdGhpczoKYGBgbWVzb24K
bGlicmFyeSgKICAnZm9vJywKICAnZm9vLnZhbGEnLAogIGluc3RhbGwgOiB0cnVlLAogIGluc3Rh
bGxfZGlyIDogW3RydWUsIGdldF9vcHRpb24oJ2luY2x1ZGVkaXInKSAvICdmb28nLCB0cnVlXSwK
KQpgYGAKCnNob3VsZCBub3cgYmUgd3JpdHRlbiBhcyB0aGUgbXVjaCBjbGVhcmVyOgoKYGBgbWVz
b24KbGlicmFyeSgKICAnZm9vJywKICAnZm9vLnZhbGEnLAogIGluc3RhbGwgOiB0cnVlLAogIGlu
c3RhbGxfdmFsYV9oZWFkZXIgOiBnZXRfb3B0aW9uKCdpbmNsdWRlZGlyJykgLyAnZm9vJywKICBp
bnN0YWxsX3ZhbGFfdmFwaSA6IHRydWUsCikKYGBgCgpOb3RlIHRoYXQgdGhlIGRlZmF1bHQgaXMg
YGZhbHNlYCBmb3IgdGhlIFZhbGEgZXh0cmEgb3V0cHV0cy4KIyMgQ2FyZ28gd29ya3NwYWNlIG9i
amVjdAoKTWVzb24gaXMgbm93IGFibGUgdG8gcGFyc2UgdGhlIHRvcGxldmVsIGBDYXJnby50b21s
YCBmaWxlIG9mIHRoZQpwcm9qZWN0IHdoZW4gdGhlIGB3b3Jrc3BhY2UoKWAgbWV0aG9kIG9mIHRo
ZSBSdXN0IG1vZHVsZSBpcyBjYWxsZWQuClRoaXMgZ3VhcmFudGVlcyB0aGF0IGZlYXR1cmVzIGFy
ZSByZXNvbHZlZCBhY2NvcmRpbmcgdG8gd2hhdCBpcwppbiB0aGUgYENhcmdvLnRvbWxgIGZpbGUs
IGFuZCBpbiBmYWN0IGVuYWJsZXMgY29uZmlndXJhdGlvbiBvZgpmZWF0dXJlcyBmb3IgdGhlIGJ1
aWxkLgoKVGhlIHJldHVybmVkIG9iamVjdCBhbGxvd3MgcmV0cmlldmluZyBmZWF0dXJlcyBhbmQg
ZGVwZW5kZW5jaWVzCmZvciBDYXJnbyBzdWJwcm9qZWN0cywgYW5kIGNvbnRhaW5zIG1ldGhvZHMg
dG8gYnVpbGQgdGFyZ2V0cwpkZWNsYXJlZCBpbiBgQ2FyZ28udG9tbGAgZmlsZXMuCgpXaGlsZSBD
YXJnbyBzdWJwcm9qZWN0cyByZW1haW4gZXhwZXJpbWVudGFsLCB0aGUgTWVzb24gcHJvamVjdCB3
aWxsCnRyeSB0byBrZWVwIHRoZSB3b3Jrc3BhY2Ugb2JqZWN0IHJlYXNvbmFibHkgYmFja3dhcmRz
LWNvbXBhdGlibGUuCgojIyBDeXRob24gbm8gbG9uZ2VyIHJlcXVpcmVzIGV4cGxpY2l0bHkgZW5h
YmxpbmcgQyBvciBDKysKClRoaXMgb25seSBwcm92aWRlcyB0aGVzZSBsYW5ndWFnZXMgYXMgYW4g
aW1wbGVtZW50YXRpb24gZGV0YWlsIG9mIEN5dGhvbiwgc28KbmF0aXZlIEMvQysrIHRhcmdldHMg
Y2Fubm90IGJlIGNvbXBpbGVkLgoKIyMgRGVkdXBsaWNhdGlvbiBvZiBPcGVuTVAgbGlua2VyIGFy
Z3VtZW50cwpNZXNvbiBub3cgZGVkdXBsaWNhdGVzIGxpbmtlciBhcmd1bWVudHMgYC1mb3Blbm1w
YCBhbmQgYC1xb3Blbm1wYC4KIyMgYG1lc29uIGRpc3RgIG5vdyBhY2NlcHRzIGAtamAvYC0tbnVt
LXByb2Nlc3Nlc2AKCmBtZXNvbiBkaXN0YCBub3cgc3VwcG9ydHMgYSBgLWpgL2AtLW51bS1wcm9j
ZXNzZXNgIGZsYWcgdG8gY29udHJvbCB0aGUgbnVtYmVyIG9mCnBhcmFsbGVsIHByb2Nlc3NlcyB1
c2VkIGR1cmluZyB0aGUgZGlzdHJpYnV0aW9uIGNoZWNrIChjb21waWxhdGlvbiBhbmQgdGVzdGlu
ZwpvZgp0aGUgZ2VuZXJhdGVkIHBhY2thZ2UpLiAgVGhlIGBNRVNPTl9OVU1fUFJPQ0VTU0VTYCBl
bnZpcm9ubWVudCB2YXJpYWJsZSBpcyBhbHNvCmhvbm9yZWQsIGNvbnNpc3RlbnQgd2l0aCBvdGhl
ciBNZXNvbiBjb21tYW5kcy4KCiMjIERlcHJlY2F0ZSBgc2hvdWxkX2ZhaWxgIGFuZCByZW5hbWUg
aXQgdG8gYGV4cGVjdGVkX2ZhaWxgLCBhbHNvIGludHJvZHVjZQpgZXhwZWN0ZWRfZXhpdGNvZGVg
CgpJbiAxLjExLjAgYHNob3VsZF9mYWlsYCBoYXMgYmVlbiByZW5hbWVkIHRvIGBleHBlY3RlZF9m
YWlsYC4KCkJlZm9yZSAxLjExLjAsCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRz
IDUwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBh
dHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1udW1w
eV8yLjUuMy5iYiA9PiBweXRob24zLW51bXB5XzIuNS40LmJifSAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8yLjUuMy5iYiA9PiBweXRob24zLW51bXB5
XzIuNS40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1udW1weV8yLjUuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1udW1weV8yLjUuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjMuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjUuNC5iYgpp
bmRleCAzMzhiZGQyYmJkLi45M2FhMzU2ZGIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNS40LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNS
Q05BTUUgPSAibnVtcHkiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92
JHtQVn0vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0
ZXN0IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRmMmQ1ODc0ZmYxODM1
OTVhNGJhNDA0ZWRkMDRmNmJkOWI1NTA1YzFkNzcwODU3M2Y2YTZjMTc0ODlhNjc1NjMiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOWE5NGNmNzUxYzlhZDhlYmFhODM1YmNkM2Q0MGRhY2Y4NTM0YWQw
ODZiODhjMzgwMjliNjUxMjNjNzk5OWQyYSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8v
Z2l0aHViLmNvbS9udW1weS9udW1weS9yZWxlYXNlcyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
InJlbGVhc2VzL3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCi0tIAoyLjQ3LjEKCg==

--===============8584616282842845497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.5.3/numpy-2.5.3.tar.gz file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.5.4/numpy-2.5.4.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 101309008 to 101316648 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_exponent_log.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_exponent_log.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_exponent_log.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_exponent_log.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_arithm_fp.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithm_fp.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/include/numpy/random, directory r
 enamed /usr/src/debug/python3-numpy/2.5.3/numpy/fft -> /usr/src/debug/python3-numpy/2.5.4/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_exponent_log.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_exponent_log.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.5.4/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_unary_fp.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_fp.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/linalg -> /usr/src/debug/python3-numpy/2.5.4/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/include ->
  /usr/src/debug/python3-numpy/2.5.4/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/_umath_tests.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/_umath_tests.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/lib_simd.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/lib_simd.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_unary_fp_le.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_fp_le.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.5
 .4/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_unary.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.5.4/numpy/_c
 ore/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_umath_fp.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_umath_fp.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libargfunc.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libargfunc.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/multiarray/textrea
 ding -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libargfunc.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libargfunc.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_arithmetic.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithmetic.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_hyperbolic.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.5.
 4/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_autovec.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_autovec.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_autovec.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_autovec.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_una
 ry_complex.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_complex.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_unary_complex.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_complex.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_arithm_fp.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithm_fp.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_unary_complex.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/
 numpy/_core/libloops_unary_complex.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_comparison.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_comparison.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_half.dispatch.h_AVX512_SPR.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_half.dispatch.h_AVX512_SPR.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_hyperbolic.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_arithmetic.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithmetic.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_comparison.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-nu
 mpy/2.5.4/numpy/_core/libloops_comparison.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_umath_fp.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_umath_fp.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/_multiarray_umath.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/_multiarray_umath.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/_multiarray_tests.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/_multiarray_tests.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/pythoncapi-compat -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_unary.dispatch.h_X86_V3.a.p -> /usr/src/debug/
 python3-numpy/2.5.4/numpy/_core/libloops_unary.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_unary.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libnpymath.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libnpymath.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_half.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_half.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.5.4/numpy/fft/pock
 etfft, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/lib_simd.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/lib_simd.dispatch.h_baseline.a.p, directo
 ry renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_arithmetic.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithmetic.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_minmax.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_minmax.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_minmax.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_minmax.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_comparison.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_comparison.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p, dir
 ectory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_minmax.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_minmax.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_modulo.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_modulo.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/libloops_half.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_half.dispatch.h_baseline.a.p, directory renamed /usr/src/
 debug/python3-numpy/2.5.3/numpy/_core/libargfunc.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libargfunc.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/lib_simd.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/lib_simd.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/p
 ython3-numpy/2.5.4/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.3/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/legacy
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 57904648 to 57907738 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 357910 to 357918 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort,
  directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licen
 ses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/nump
 y-2.5.4.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 41643433 to 41686500 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.3.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info

--===============8584616282842845497==--


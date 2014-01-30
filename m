Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5C76E9BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 09:04:42 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id lx4so3142332iec.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 01:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=p9X/Laldm9/2hBmSRWkhPmDGnK3+j5sPrDh7XV/Xs78=;
	b=ji952B1UeCV3R4oi2ljKqZJyhGr/3TcVCoKB8fUDc895MffiiB8vTBQSayNjhguxqw
	LaHr/S7K6tBKZZPmj8WlZAThbU73zvjF4zR2YGUN7uSJuAZI9mVvC9XkuLBhSS3aA4kr
	KWG1BiZ26Y5MvHU5csWjTm5hNPJSDAR+vAhcTqgDyLP5kcvaiTg0EZng7nQBsJZ8uFf3
	mgjvdqhd7M5lyxlSK1FWZ2w/AzIMvxLwwH5sQbzwI/Ii9qYeLa99dV0gy8/NcHLdGsDC
	Y2zaWsq5Vf8tFsat5TOgX57idEsKvoaYISvu9qhOSFIBAPiXzUu7HzFPCeDvkF8z1nlF
	+Rxg==
X-Received: by 10.42.232.206 with SMTP id jv14mr309729icb.52.1391072682602;
	Thu, 30 Jan 2014 01:04:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Thu, 30 Jan 2014 01:04:12 -0800 (PST)
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jan 2014 01:04:12 -0800
Message-ID: <CAMKF1so2Cq9j5b5qGfaT8fO40r2yZQYj=_-ASqZeezhHhaA67g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Add python 3 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2014 09:04:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 29, 2014 at 8:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Post V5
>
> Upgrade to 3.3.3
>
> Fix the warnings like
>
> WARNING: The recipe python3 is trying to install files into a shared
> area when those files already exist. Those files and their manifest
> location are:
>
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/python3.3m/pyconfig.h
>
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so.1.0
>
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so
>
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python3.3/config/Makefile
>
> and
>
> WARNING: The recipe python-setuptools is trying to install files into a
> shared area when those files already exist. Those files and their
> manifest location are:
>
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/setuptools.pth
>     Matched in manifest-qemux86-64-python-distribute
>
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.pyc
>     Matched in manifest-qemux86-64-python-distribute
>
> /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.py
>     Matched in manifest-qemux86-64-python-distribute
>

I have fixed two more issues 1 where cross build failed on hosts which
had ncursesw installed
secondly the in tree python modules (.so) were not being built due to
wrong linker paths

I have updated the pull branch with these two fixes.

>
> The following changes since commit c3f3fed1b397b6ee6d44e7d39e63d084e4a88e30:
>
>   toaster.bbclass: save original package name (2014-01-29 17:40:29 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/python3
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/python3
>
> Khem Raj (15):
>   generate-manifest-3.3.py: Add script to generate python 3.3 manifests
>   python-3.3-manifest: Add python3 manifest file
>   python3native.bbclass: Add python3 abstraction class
>   package_rpm.bbclass: Trigger the regexp on exact keyword match
>   classes/distutils: Introduce PYTHON_PN
>   classes: Add distutils for python3
>   distutils: Introduce PYTHON_ABI variable
>   distutils3: Do build_ext as separate step during compile
>   python3: Add target and native recipes
>   python_2.7.3.bb: Inherit python-dir
>   python-distribute: Add recipes for python2 and python3
>   distutils3.bbclass: Fix typo and use proper values for target sysroot
>   distutils3.bbclass: Use MACHINE for sysroot when not building for
>     build host
>   python3: Fix staging warnings due to duplicate install
>   python-setuptools: Remove its provided by python-distribute
>
>  meta/classes/distutils-base.bbclass                |    5 +-
>  meta/classes/distutils-native-base.bbclass         |    4 +-
>  meta/classes/distutils-tools.bbclass               |   77 ++++
>  meta/classes/distutils.bbclass                     |   23 +-
>  meta/classes/distutils3-base.bbclass               |    8 +
>  meta/classes/distutils3-native-base.bbclass        |    4 +
>  meta/classes/distutils3.bbclass                    |   98 +++++
>  meta/classes/package_rpm.bbclass                   |    2 +-
>  meta/classes/python-dir.bbclass                    |    2 +
>  meta/classes/python3native.bbclass                 |    7 +
>  meta/classes/pythonnative.bbclass                  |    9 +-
>  meta/classes/setuptools.bbclass                    |    3 +-
>  meta/classes/setuptools3.bbclass                   |    8 +
>  .../python/python-3.3-manifest.inc                 |  260 ++++++++++++++
>  .../python/python-distribute_0.6.32.bb             |   50 +++
>  .../python/python-setuptools_1.4.bb                |   40 ---
>  .../python/python3-distribute_0.6.32.bb            |   49 +++
>  .../python/python3-native_3.3.3.bb                 |   70 ++++
>  .../python/python3/000-cross-compile.patch         |   83 +++++
>  ...sue-13032-where-it-fails-with-UnicodeDeco.patch |   37 ++
>  .../python3/020-dont-compile-python-files.patch    |   37 ++
>  .../python/python3/03-fix-tkinter-detection.patch  |   42 +++
>  .../python/python3/030-fixup-include-dirs.patch    |   33 ++
>  .../python/python3/04-default-is-optimized.patch   |   58 +++
>  .../python3/06-ctypes-libffi-fix-configure.patch   |   44 +++
>  .../python3/070-dont-clean-ipkg-install.patch      |   36 ++
>  .../python3/080-distutils-dont_adjust_files.patch  |   92 +++++
>  .../python/python3/110-enable-zlib.patch           |   21 ++
>  ...2-distutils-prefix-is-inside-staging-area.patch |   78 ++++
>  .../python/python3/130-readline-setup.patch        |   55 +++
>  .../python/python3/150-fix-setupterm.patch         |   17 +
>  .../python3/avoid_warning_about_tkinter.patch      |   25 ++
>  meta/recipes-devtools/python/python3/cgi_py.patch  |   23 ++
>  .../python3/fix_for_using_different_libdir.patch   |   54 +++
>  .../python3/host_include_contamination.patch       |   28 ++
>  .../python/python3/python-3.3-multilib.patch       |  336 +++++++++++++++++
>  .../python/python3/remove_sqlite_rpath.patch       |   19 +
>  .../python/python3/setuptweaks.patch               |   57 +++
>  .../python/python3/shutil-follow-symlink-fix.patch |   17 +
>  .../python/python3/sitecustomize.py                |   37 ++
>  .../sys_platform_is_now_always_linux2.patch        |   29 ++
>  .../python/python3/sysroot-include-headers.patch   |   35 ++
>  .../python/python3/unixccompiler.patch             |   33 ++
>  meta/recipes-devtools/python/python3_3.3.3.bb      |  197 ++++++++++
>  meta/recipes-devtools/python/python_2.7.3.bb       |    2 +-
>  .../packagegroups/packagegroup-toolset-native.bb   |    2 +-
>  scripts/contrib/python/generate-manifest-3.3.py    |  376 ++++++++++++++++++++
>  47 files changed, 2558 insertions(+), 64 deletions(-)
>  create mode 100644 meta/classes/distutils-tools.bbclass
>  create mode 100644 meta/classes/distutils3-base.bbclass
>  create mode 100644 meta/classes/distutils3-native-base.bbclass
>  create mode 100644 meta/classes/distutils3.bbclass
>  create mode 100644 meta/classes/python3native.bbclass
>  create mode 100644 meta/classes/setuptools3.bbclass
>  create mode 100644 meta/recipes-devtools/python/python-3.3-manifest.inc
>  create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
>  delete mode 100644 meta/recipes-devtools/python/python-setuptools_1.4.bb
>  create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.32.bb
>  create mode 100644 meta/recipes-devtools/python/python3-native_3.3.3.bb
>  create mode 100644 meta/recipes-devtools/python/python3/000-cross-compile.patch
>  create mode 100644 meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
>  create mode 100644 meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
>  create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
>  create mode 100644 meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
>  create mode 100644 meta/recipes-devtools/python/python3/04-default-is-optimized.patch
>  create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
>  create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
>  create mode 100644 meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
>  create mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch
>  create mode 100644 meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
>  create mode 100644 meta/recipes-devtools/python/python3/130-readline-setup.patch
>  create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
>  create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
>  create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
>  create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
>  create mode 100644 meta/recipes-devtools/python/python3/host_include_contamination.patch
>  create mode 100644 meta/recipes-devtools/python/python3/python-3.3-multilib.patch
>  create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
>  create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.patch
>  create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
>  create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.py
>  create mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
>  create mode 100644 meta/recipes-devtools/python/python3/sysroot-include-headers.patch
>  create mode 100644 meta/recipes-devtools/python/python3/unixccompiler.patch
>  create mode 100644 meta/recipes-devtools/python/python3_3.3.3.bb
>  create mode 100755 scripts/contrib/python/generate-manifest-3.3.py
>
> --
> 1.7.10.4
>


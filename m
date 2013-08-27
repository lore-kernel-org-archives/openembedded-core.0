Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 00C246BA1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 05:23:25 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so4377714pbb.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 22:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=7nOjCs2fBWbIrIyHMrUOwUHj8ezfohRzOsuS8sKVwnU=;
	b=bgjpkUNHaiWGyQwNk7hatiCVVqEx3hN9g23Tvt75lgRyD7EVXVZ7sfZABdSd4t9NFZ
	sRggK6be9W2ws9QwMUu3c18a3jwDDlBqJwlcVNqkG0Zt5U1lY1u+eVS1hEwkt83izYua
	rl8jGw4IhAJ0/wtvIXJEVPy4LPwkFELFsxASYZelJWERzQ9cy4llwfk4/wU5PUx2lvIs
	zd9MdZkBWRuYEqIVOfPEdfL4tiENZKOhxeI7sifAB5o+32rEI7JLfEAEHuQEwgY3y79l
	LbHVS2Bcfj9y/Uzi79ggX16KBiFKPJG2LICAPz0jF4BdWKy2l+Yr7bKyL6T6T8KLFDP/
	t8+g==
X-Received: by 10.68.230.106 with SMTP id sx10mr6668854pbc.170.1377581006539; 
	Mon, 26 Aug 2013 22:23:26 -0700 (PDT)
Received: from sa-nc-common2-240.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id uw6sm22094254pbc.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 22:23:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130826133254.GR3544@jama>
Date: Mon, 26 Aug 2013 22:23:22 -0700
Message-Id: <677CFE60-700A-4057-92B5-58E6BB906202@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
	<20130826133254.GR3544@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/24] python3: Add recipes
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
X-List-Received-Date: Tue, 27 Aug 2013 05:23:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 6:32 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Fri, Jun 28, 2013 at 03:03:57PM -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../python/python3/000-cross-compile.patch         |   76 +++++
>> .../python3/020-dont-compile-python-files.patch    |   31 ++
>> .../python/python3/03-fix-tkinter-detection.patch  |   42 +++
>> .../python/python3/030-fixup-include-dirs.patch    |   36 ++
>> .../python/python3/04-default-is-optimized.patch   |   58 ++++
>> .../python3/06-ctypes-libffi-fix-configure.patch   |   44 +++
>> .../python3/070-dont-clean-ipkg-install.patch      |   30 ++
>> .../python3/080-distutils-dont_adjust_files.patch  |   86 +++++
>> .../python/python3/110-enable-zlib.patch           |   15 +
>> .../python/python3/130-readline-setup.patch        |   49 +++
>> .../python/python3/140-verbose-sharedmods.patch    |   10 +
>> .../python/python3/150-fix-setupterm.patch         |   11 +
>> .../python3/avoid_warning_about_tkinter.patch      |   25 ++
>> meta/recipes-devtools/python/python3/cgi_py.patch  |   23 ++
>> .../python3/fix_for_using_different_libdir.patch   |   54 +++
>> .../python/python3/h2py-pr13032.patch              |  185 +++++++++++
>> .../python3/host_include_contamination.patch       |   28 ++
>> .../python/python3/python-3.3-multilib.patch       |  348 =
++++++++++++++++++++
>> .../python/python3/remove_sqlite_rpath.patch       |   19 ++
>> .../python/python3/setuptweaks.patch               |   57 ++++
>> .../python/python3/shutil-follow-symlink-fix.patch |   11 +
>> .../python/python3/sitecustomize.py                |   37 +++
>> .../sys_platform_is_now_always_linux2.patch        |   29 ++
>> meta/recipes-devtools/python/python3_3.3.0.bb      |  203 =
++++++++++++
>> 24 files changed, 1507 insertions(+)
>> create mode 100644 =
meta/recipes-devtools/python/python3/000-cross-compile.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/04-default-is-optimized.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch=

>> create mode 100644 =
meta/recipes-devtools/python/python3/110-enable-zlib.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/130-readline-setup.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/150-fix-setupterm.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
>> create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/h2py-pr13032.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/host_include_contamination.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/python-3.3-multilib.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/setuptweaks.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
>> create mode 100644 =
meta/recipes-devtools/python/python3/sitecustomize.py
>> create mode 100644 =
meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.pat=
ch
>> create mode 100644 meta/recipes-devtools/python/python3_3.3.0.bb
>=20
> When testing this on another host I got:
>=20
> ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
> Rerun configure task after fixing this. The path was
> =
'/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/Python-3.=
3.2'
> ERROR: Function failed: do_qa_configure
> ERROR: Logfile of failure stored in:
> =
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/temp/log.d=
o_configure.13003
> ERROR: Task 58
> =
(/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python3_3.3.2=
.bb,
> do_configure) failed with exit code '1'
>=20
>=20
> configure:6972: x86_64-oe-linux-gcc  -m64 -DNDEBUG -fno-inline
> --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -c -O2 -pipe =
-g
> -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
> cc1: warning: include location "/usr/include/ncursesw" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> conftest.c:63:19: fatal error: conio.h: No such file or directory
> #include <conio.h>
>                   ^
> compilation terminated.

I think you might have been testing older pull tree since. Try it with =
todays tree
I believe this issue was fixed some time ago already.


>=20
>=20
> and from test-dependencies.sh run there is undeterministic lzma
> dependency:
>=20
> WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest =
lost dependency on  liblzma
>=20

I have aded a patch on top of pull tree to fix it.

> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



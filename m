Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id C7CDE6BC1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 13:31:45 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so1631298eaj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ulgkye0bmIqmg83fnONJxmam1BrQjqmHgEA7t5KMsbs=;
	b=y7oZqXKTYqKxLA1JG+zluksnEmK0rMb+P3veSPO1Er3a0T6Hizz5dv2Xdl/IG3dapa
	Z9I+aQWNtOlCQPUGLhwJmiybZoWQmvrXZ4taKOtjKjfFm8p4e4aqEMP3W5J8VhCtbJhx
	cm9l5EcFDG8bxK+Gw3kBAToGLq+ERLkHErMWIph9AOeRerJ/4kZvuoIOYSg9bpPt6ELs
	8FudP/jgQIMOAQKTfUW86Xv8K4FQosWLt+hjzQyH1p6sPubDCFzoUzuRfsNV8QVqP3Vz
	myV4IP+rpeKd8Mwr10jDdhv9H+cMkARMy22Q9/Tc0vc2+AQij2Q1NtS9sn03cRZtvZxV
	HfRw==
X-Received: by 10.15.99.133 with SMTP id bl5mr34483eeb.92.1377523905644;
	Mon, 26 Aug 2013 06:31:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm21441023eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 06:31:45 -0700 (PDT)
Date: Mon, 26 Aug 2013 15:32:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130826133254.GR3544@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 26 Aug 2013 13:31:47 -0000
X-Groupsio-MsgNum: 44039
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YttKMwf6abDJOSyE"
Content-Disposition: inline

--YttKMwf6abDJOSyE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 03:03:57PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../python/python3/000-cross-compile.patch         |   76 +++++
>  .../python3/020-dont-compile-python-files.patch    |   31 ++
>  .../python/python3/03-fix-tkinter-detection.patch  |   42 +++
>  .../python/python3/030-fixup-include-dirs.patch    |   36 ++
>  .../python/python3/04-default-is-optimized.patch   |   58 ++++
>  .../python3/06-ctypes-libffi-fix-configure.patch   |   44 +++
>  .../python3/070-dont-clean-ipkg-install.patch      |   30 ++
>  .../python3/080-distutils-dont_adjust_files.patch  |   86 +++++
>  .../python/python3/110-enable-zlib.patch           |   15 +
>  .../python/python3/130-readline-setup.patch        |   49 +++
>  .../python/python3/140-verbose-sharedmods.patch    |   10 +
>  .../python/python3/150-fix-setupterm.patch         |   11 +
>  .../python3/avoid_warning_about_tkinter.patch      |   25 ++
>  meta/recipes-devtools/python/python3/cgi_py.patch  |   23 ++
>  .../python3/fix_for_using_different_libdir.patch   |   54 +++
>  .../python/python3/h2py-pr13032.patch              |  185 +++++++++++
>  .../python3/host_include_contamination.patch       |   28 ++
>  .../python/python3/python-3.3-multilib.patch       |  348 ++++++++++++++=
++++++
>  .../python/python3/remove_sqlite_rpath.patch       |   19 ++
>  .../python/python3/setuptweaks.patch               |   57 ++++
>  .../python/python3/shutil-follow-symlink-fix.patch |   11 +
>  .../python/python3/sitecustomize.py                |   37 +++
>  .../sys_platform_is_now_always_linux2.patch        |   29 ++
>  meta/recipes-devtools/python/python3_3.3.0.bb      |  203 ++++++++++++
>  24 files changed, 1507 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/000-cross-compil=
e.patch
>  create mode 100644 meta/recipes-devtools/python/python3/020-dont-compile=
-python-files.patch
>  create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter-d=
etection.patch
>  create mode 100644 meta/recipes-devtools/python/python3/030-fixup-includ=
e-dirs.patch
>  create mode 100644 meta/recipes-devtools/python/python3/04-default-is-op=
timized.patch
>  create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi=
-fix-configure.patch
>  create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-i=
pkg-install.patch
>  create mode 100644 meta/recipes-devtools/python/python3/080-distutils-do=
nt_adjust_files.patch
>  create mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.=
patch
>  create mode 100644 meta/recipes-devtools/python/python3/130-readline-set=
up.patch
>  create mode 100644 meta/recipes-devtools/python/python3/140-verbose-shar=
edmods.patch
>  create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupter=
m.patch
>  create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_ab=
out_tkinter.patch
>  create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
>  create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_di=
fferent_libdir.patch
>  create mode 100644 meta/recipes-devtools/python/python3/h2py-pr13032.pat=
ch
>  create mode 100644 meta/recipes-devtools/python/python3/host_include_con=
tamination.patch
>  create mode 100644 meta/recipes-devtools/python/python3/python-3.3-multi=
lib.patch
>  create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rp=
ath.patch
>  create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.patch
>  create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-sy=
mlink-fix.patch
>  create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.py
>  create mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_=
now_always_linux2.patch
>  create mode 100644 meta/recipes-devtools/python/python3_3.3.0.bb

When testing this on another host I got:

ERROR: This autoconf log indicates errors, it looked at host include
and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was
'/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/Python-3.3=
=2E2'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in:
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/temp/log.do=
_configure.13003
ERROR: Task 58
(/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python3_3.3.2.=
bb,
do_configure) failed with exit code '1'


configure:6972: x86_64-oe-linux-gcc  -m64 -DNDEBUG -fno-inline
--sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -c -O2 -pipe -g
-feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
cc1: warning: include location "/usr/include/ncursesw" is unsafe for
cross-compilation [-Wpoison-system-directories]
conftest.c:63:19: fatal error: conio.h: No such file or directory
 #include <conio.h>
                   ^
compilation terminated.


and from test-dependencies.sh run there is undeterministic lzma
dependency:

WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest lost de=
pendency on  liblzma

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YttKMwf6abDJOSyE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIbWQYACgkQN1Ujt2V2gBw5swCgsEBXu20UeDIvFiVPJil5Por2
/OkAnR5iSmExzT0mcDtcAHlro5Z+D0+6
=w9A9
-----END PGP SIGNATURE-----

--YttKMwf6abDJOSyE--

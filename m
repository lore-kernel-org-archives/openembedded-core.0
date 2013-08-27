Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id D0CBE6BA2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:44:21 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so2029756eak.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OxaLbr2vXWMz3WUjDvcaLgKQ7VkqtQbT9kZPZIzHGZQ=;
	b=fKVAsBYulSJs+PiUp34LXSA6Fku6gFzOf2QaPtOKAi91SVv8Q6KP4IY7NcBMy5fB0g
	IDt1Ht29jz/B6DiusteJwnmfEOWewZBnLw1uZYAm1UBhHGLgJFMLeP975xPLZOLOh+Ba
	QgdnJa9bhECF4TgQflJ/LcNy/fk5h8x6FMC5RSZpupM1CjXszn8d5+blU1suNtuTJcfh
	c0pzhScKXFkTHg0b8YmzNP/EYbaTNCU7xWaWkVXFqd/N/9olqeqKg2bVYxfWJv2WzYIN
	A51MMnGKniNOFsoqCOd6rcecxIVtMhXRKHImJmVb4BCEbzLeTCkJn/qK4tIvoSN+uHDD
	pzWw==
X-Received: by 10.14.122.132 with SMTP id t4mr32689878eeh.20.1377589461361;
	Tue, 27 Aug 2013 00:44:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm26983429eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 00:44:20 -0700 (PDT)
Date: Tue, 27 Aug 2013 09:45:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130827074531.GU3544@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
	<20130826133254.GR3544@jama>
	<677CFE60-700A-4057-92B5-58E6BB906202@gmail.com>
MIME-Version: 1.0
In-Reply-To: <677CFE60-700A-4057-92B5-58E6BB906202@gmail.com>
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
X-List-Received-Date: Tue, 27 Aug 2013 07:44:23 -0000
X-Groupsio-MsgNum: 44103
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oP9at/Ymg5VWhwKB"
Content-Disposition: inline

--oP9at/Ymg5VWhwKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 10:23:22PM -0700, Khem Raj wrote:
>=20
> On Aug 26, 2013, at 6:32 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Fri, Jun 28, 2013 at 03:03:57PM -0700, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> .../python/python3/000-cross-compile.patch         |   76 +++++
> >> .../python3/020-dont-compile-python-files.patch    |   31 ++
> >> .../python/python3/03-fix-tkinter-detection.patch  |   42 +++
> >> .../python/python3/030-fixup-include-dirs.patch    |   36 ++
> >> .../python/python3/04-default-is-optimized.patch   |   58 ++++
> >> .../python3/06-ctypes-libffi-fix-configure.patch   |   44 +++
> >> .../python3/070-dont-clean-ipkg-install.patch      |   30 ++
> >> .../python3/080-distutils-dont_adjust_files.patch  |   86 +++++
> >> .../python/python3/110-enable-zlib.patch           |   15 +
> >> .../python/python3/130-readline-setup.patch        |   49 +++
> >> .../python/python3/140-verbose-sharedmods.patch    |   10 +
> >> .../python/python3/150-fix-setupterm.patch         |   11 +
> >> .../python3/avoid_warning_about_tkinter.patch      |   25 ++
> >> meta/recipes-devtools/python/python3/cgi_py.patch  |   23 ++
> >> .../python3/fix_for_using_different_libdir.patch   |   54 +++
> >> .../python/python3/h2py-pr13032.patch              |  185 +++++++++++
> >> .../python3/host_include_contamination.patch       |   28 ++
> >> .../python/python3/python-3.3-multilib.patch       |  348 ++++++++++++=
++++++++
> >> .../python/python3/remove_sqlite_rpath.patch       |   19 ++
> >> .../python/python3/setuptweaks.patch               |   57 ++++
> >> .../python/python3/shutil-follow-symlink-fix.patch |   11 +
> >> .../python/python3/sitecustomize.py                |   37 +++
> >> .../sys_platform_is_now_always_linux2.patch        |   29 ++
> >> meta/recipes-devtools/python/python3_3.3.0.bb      |  203 ++++++++++++
> >> 24 files changed, 1507 insertions(+)
> >> create mode 100644 meta/recipes-devtools/python/python3/000-cross-comp=
ile.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/020-dont-compi=
le-python-files.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter=
-detection.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/030-fixup-incl=
ude-dirs.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/04-default-is-=
optimized.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libf=
fi-fix-configure.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean=
-ipkg-install.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/080-distutils-=
dont_adjust_files.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/110-enable-zli=
b.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/130-readline-s=
etup.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/140-verbose-sh=
aredmods.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupt=
erm.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_=
about_tkinter.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_=
different_libdir.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/h2py-pr13032.p=
atch
> >> create mode 100644 meta/recipes-devtools/python/python3/host_include_c=
ontamination.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/python-3.3-mul=
tilib.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_=
rpath.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.pa=
tch
> >> create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-=
symlink-fix.patch
> >> create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.=
py
> >> create mode 100644 meta/recipes-devtools/python/python3/sys_platform_i=
s_now_always_linux2.patch
> >> create mode 100644 meta/recipes-devtools/python/python3_3.3.0.bb
> >=20
> > When testing this on another host I got:
> >=20
> > ERROR: This autoconf log indicates errors, it looked at host include
> > and/or library paths while determining system capabilities.
> > Rerun configure task after fixing this. The path was
> > '/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/Python=
-3.3.2'
> > ERROR: Function failed: do_qa_configure
> > ERROR: Logfile of failure stored in:
> > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/temp/lo=
g.do_configure.13003
> > ERROR: Task 58
> > (/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python3_3.=
3.2.bb,
> > do_configure) failed with exit code '1'
> >=20
> >=20
> > configure:6972: x86_64-oe-linux-gcc  -m64 -DNDEBUG -fno-inline
> > --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -c -O2 -pipe -g
> > -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
> > cc1: warning: include location "/usr/include/ncursesw" is unsafe for
> > cross-compilation [-Wpoison-system-directories]
> > conftest.c:63:19: fatal error: conio.h: No such file or directory
> > #include <conio.h>
> >                   ^
> > compilation terminated.
>=20
> I think you might have been testing older pull tree since. Try it with to=
days tree
> I believe this issue was fixed some time ago already.

You're right I was missing that commit for some reason.

>=20
> >=20
> >=20
> > and from test-dependencies.sh run there is undeterministic lzma
> > dependency:
> >=20
> > WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest los=
t dependency on  liblzma
> >=20
>=20
> I have aded a patch on top of pull tree to fix it.

python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc

doesn't look like right fix, something in python3-misc is linked to
liblzma

DEBUG: calculating shlib requirements for python3-misc
DEBUG: python3-misc: Dependency libpython3.3m.so.1.0 requires package libpy=
thon3
DEBUG: python3-misc: Dependency libc.so.6 requires package eglibc
DEBUG: python3-misc: Dependency liblzma.so.5 requires package liblzma
DEBUG: python3-misc: Dependency libbz2.so.0 requires package libbz2
DEBUG: python3-misc: Dependency libcrypt.so.1 requires package eglibc

so you should add it to DEPENDS not RDEPENDS (Adding it to RDEPENDS
hides this message from test-dependencies.sh, but support for lzma in
python3-misc would stay nondeterministic).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oP9at/Ymg5VWhwKB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIcWRsACgkQN1Ujt2V2gBzOvwCgko1eePFZ6HCLJPIMaxO7hYfE
eJAAoJ0eNQvXpj2WYCA/zEaKXiitadjR
=QdJx
-----END PGP SIGNATURE-----

--oP9at/Ymg5VWhwKB--

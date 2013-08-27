Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2166010E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:47:07 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so2089246eae.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8oc2hJJE9Sw/d1c0X0DsUm61Kf3GziD9yNNuEhRGgBk=;
	b=H/R3cQVbNh5R4zguY9BFXGyvWKuLk/pNNcwYX9863bL7levwNQf6PfMyob9SZczYw+
	osDTiI+9c3cXeZU0y4nxN15m0SJiEm/3JF/3KigEE0HppXZQLj7xWd4RpP+lVr517DQ1
	otQ/l3d5eDJHDp+zr10rhcenDR9irHunak+CDCXq3PeMFrLFymEhmm+ntj9+QmRUrfy/
	o/QTSBV7U2oMXn4JJqhSWDjKUxmKxPC6hesPPFHh0dubEQfzBjEmAz2jQK1IDOH0h8LR
	V8GM0Zt1aK2FatnwT/30LhdRnB7uX9ocDKaKp+7uI0GTF1mGYsAyRmjJQ88eQJ7QGgQD
	2Qgg==
X-Received: by 10.14.200.201 with SMTP id z49mr1966303een.59.1377589628187;
	Tue, 27 Aug 2013 00:47:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm27030347eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 00:47:07 -0700 (PDT)
Date: Tue, 27 Aug 2013 09:48:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130827074818.GV3544@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
	<20130826133254.GR3544@jama>
	<677CFE60-700A-4057-92B5-58E6BB906202@gmail.com>
	<20130827074531.GU3544@jama>
MIME-Version: 1.0
In-Reply-To: <20130827074531.GU3544@jama>
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
X-List-Received-Date: Tue, 27 Aug 2013 07:47:08 -0000
X-Groupsio-MsgNum: 44104
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uzkapz4/HjIvV4VZ"
Content-Disposition: inline

--Uzkapz4/HjIvV4VZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 09:45:31AM +0200, Martin Jansa wrote:
> On Mon, Aug 26, 2013 at 10:23:22PM -0700, Khem Raj wrote:
> >=20
> > On Aug 26, 2013, at 6:32 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >=20
> > > On Fri, Jun 28, 2013 at 03:03:57PM -0700, Khem Raj wrote:
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> ---
> > >> .../python/python3/000-cross-compile.patch         |   76 +++++
> > >> .../python3/020-dont-compile-python-files.patch    |   31 ++
> > >> .../python/python3/03-fix-tkinter-detection.patch  |   42 +++
> > >> .../python/python3/030-fixup-include-dirs.patch    |   36 ++
> > >> .../python/python3/04-default-is-optimized.patch   |   58 ++++
> > >> .../python3/06-ctypes-libffi-fix-configure.patch   |   44 +++
> > >> .../python3/070-dont-clean-ipkg-install.patch      |   30 ++
> > >> .../python3/080-distutils-dont_adjust_files.patch  |   86 +++++
> > >> .../python/python3/110-enable-zlib.patch           |   15 +
> > >> .../python/python3/130-readline-setup.patch        |   49 +++
> > >> .../python/python3/140-verbose-sharedmods.patch    |   10 +
> > >> .../python/python3/150-fix-setupterm.patch         |   11 +
> > >> .../python3/avoid_warning_about_tkinter.patch      |   25 ++
> > >> meta/recipes-devtools/python/python3/cgi_py.patch  |   23 ++
> > >> .../python3/fix_for_using_different_libdir.patch   |   54 +++
> > >> .../python/python3/h2py-pr13032.patch              |  185 +++++++++++
> > >> .../python3/host_include_contamination.patch       |   28 ++
> > >> .../python/python3/python-3.3-multilib.patch       |  348 ++++++++++=
++++++++++
> > >> .../python/python3/remove_sqlite_rpath.patch       |   19 ++
> > >> .../python/python3/setuptweaks.patch               |   57 ++++
> > >> .../python/python3/shutil-follow-symlink-fix.patch |   11 +
> > >> .../python/python3/sitecustomize.py                |   37 +++
> > >> .../sys_platform_is_now_always_linux2.patch        |   29 ++
> > >> meta/recipes-devtools/python/python3_3.3.0.bb      |  203 ++++++++++=
++
> > >> 24 files changed, 1507 insertions(+)
> > >> create mode 100644 meta/recipes-devtools/python/python3/000-cross-co=
mpile.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/020-dont-com=
pile-python-files.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkint=
er-detection.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/030-fixup-in=
clude-dirs.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/04-default-i=
s-optimized.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-li=
bffi-fix-configure.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/070-dont-cle=
an-ipkg-install.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/080-distutil=
s-dont_adjust_files.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/110-enable-z=
lib.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/130-readline=
-setup.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/140-verbose-=
sharedmods.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/150-fix-setu=
pterm.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/avoid_warnin=
g_about_tkinter.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/fix_for_usin=
g_different_libdir.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/h2py-pr13032=
=2Epatch
> > >> create mode 100644 meta/recipes-devtools/python/python3/host_include=
_contamination.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/python-3.3-m=
ultilib.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/remove_sqlit=
e_rpath.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.=
patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/shutil-follo=
w-symlink-fix.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3/sitecustomiz=
e.py
> > >> create mode 100644 meta/recipes-devtools/python/python3/sys_platform=
_is_now_always_linux2.patch
> > >> create mode 100644 meta/recipes-devtools/python/python3_3.3.0.bb
> > >=20
> > > When testing this on another host I got:
> > >=20
> > > ERROR: This autoconf log indicates errors, it looked at host include
> > > and/or library paths while determining system capabilities.
> > > Rerun configure task after fixing this. The path was
> > > '/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/Pyth=
on-3.3.2'
> > > ERROR: Function failed: do_qa_configure
> > > ERROR: Logfile of failure stored in:
> > > /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/python3/3.3.2-r0.0/temp/=
log.do_configure.13003
> > > ERROR: Task 58
> > > (/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python3_=
3.3.2.bb,
> > > do_configure) failed with exit code '1'
> > >=20
> > >=20
> > > configure:6972: x86_64-oe-linux-gcc  -m64 -DNDEBUG -fno-inline
> > > --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -c -O2 -pipe =
-g
> > > -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
> > > cc1: warning: include location "/usr/include/ncursesw" is unsafe for
> > > cross-compilation [-Wpoison-system-directories]
> > > conftest.c:63:19: fatal error: conio.h: No such file or directory
> > > #include <conio.h>
> > >                   ^
> > > compilation terminated.
> >=20
> > I think you might have been testing older pull tree since. Try it with =
todays tree
> > I believe this issue was fixed some time ago already.
>=20
> You're right I was missing that commit for some reason.
>=20
> >=20
> > >=20
> > >=20
> > > and from test-dependencies.sh run there is undeterministic lzma
> > > dependency:
> > >=20
> > > WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest l=
ost dependency on  liblzma
> > >=20
> >=20
> > I have aded a patch on top of pull tree to fix it.
>=20
> python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc
>=20
> doesn't look like right fix, something in python3-misc is linked to
> liblzma
>=20
> DEBUG: calculating shlib requirements for python3-misc
> DEBUG: python3-misc: Dependency libpython3.3m.so.1.0 requires package lib=
python3
> DEBUG: python3-misc: Dependency libc.so.6 requires package eglibc
> DEBUG: python3-misc: Dependency liblzma.so.5 requires package liblzma
> DEBUG: python3-misc: Dependency libbz2.so.0 requires package libbz2
> DEBUG: python3-misc: Dependency libcrypt.so.1 requires package eglibc
>=20
> so you should add it to DEPENDS not RDEPENDS (Adding it to RDEPENDS
> hides this message from test-dependencies.sh, but support for lzma in
> python3-misc would stay nondeterministic).

That something is python lzmamodule packaged in python3-misc :)

setup.py:
        # LZMA compression support.
        if self.compiler.find_library_file(lib_dirs, 'lzma'):
            exts.append( Extension('_lzma', ['_lzmamodule.c'],
                                   libraries =3D ['lzma']) )
        else:
            missing.append('_lzma')

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Uzkapz4/HjIvV4VZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIcWcIACgkQN1Ujt2V2gBz6rACffDox1EMI+VscZRJImBmTeNxF
9HIAoJL10pkm4fNDLdI96Uo/UTx9Zphj
=2aca
-----END PGP SIGNATURE-----

--Uzkapz4/HjIvV4VZ--

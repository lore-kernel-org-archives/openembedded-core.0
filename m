Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Smskk-0005Qo-D8
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 22:34:18 +0200
Received: by wgbdr1 with SMTP id dr1so7942258wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5jK3UM7PYIVSnur4Bp1UmUNC0ye58fK200KJlM03aBk=;
	b=LegdT3nl7dioUqE2EKEMgi22FRRsbDKaZ7KcZhh87tlBvk3vXLhq2AYNsJxMZQg4O5
	6NnN+KdaSrNzR+A/IF8EGHD+5F0oJ7YLBQJ2uLX94V9bKCu2Y/WZaIwXdS6X6SDqjNVc
	p7y9ZnE3D9Ydz/CecqAGl9rYu/gfAHtAoMU5T0CBFK5kmQMv2sYyfDTnu7JWSTejpl9G
	DaKeHqI6q2r5ogWSDyV+EXAgXCfRnb7zhiG62e6odU36d0LIz2xWfN32B6EsK8HBpIBs
	8FPqUWMacMOFzW7AVbALz95iwxAUQzf/ELGfyhRRuIAtwTQMpuZhBxsMI+Qt4vSQvc6a
	0Jyw==
Received: by 10.180.107.103 with SMTP id hb7mr2125352wib.3.1341519793735;
	Thu, 05 Jul 2012 13:23:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm1854620wib.2.2012.07.05.13.23.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 13:23:12 -0700 (PDT)
Date: Thu, 5 Jul 2012 22:23:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120705202306.GD3708@jama.jama.net>
References: <cover.1341498745.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/14] eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 20:34:18 -0000
X-Groupsio-MsgNum: 24759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline

--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2012 at 07:35:19AM -0700, Khem Raj wrote:
> This patch adds eglibc 2.16 recipes. I was able to build world
> on x86 except perf which was failing with 2.15 as well.
>=20
> I have also build and run core-image-sato on all qemus
>=20
> I did not remove 2.15 to allow some soak in time.
>=20
> The following changes since commit 5beb7176d361d4bfa279bbfab5a17b8fe4fa3b=
73:
>=20
>   netbase: update to ver. 5.0 (2012-07-05 14:18:19 +0100)

Build and runtime tested on armv4t with bfd (om-gta02), but on armv7a=20
(where I have enabled gold) it fails in do_configure already.

*** These critical programs are missing or too old: ld

IIRC I've seen this with older eglibc too, but then it was working
again..

BTW: gold on armv4t is still unusable right?

Cheers,

>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dkraj/eglibc-2.16
>=20
> Khem Raj (14):
>   mirrors: Add debian archive snapshot mirrors to search list
>   gdb: Replace struct siginfo with proper siginfo_t
>   busybox: Include sys/resource.h for rusage definition
>   coreutils: Fix build with eglibc 2.16
>   diffutils: Fix build with eglibc 2.16
>   udev: Fix build with eglibc 2.16
>   gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16
>   bison: Fix for gets being removed from eglibc 2.16
>   grub,guile,cpio,tar,wget: Fix gnulib for absense of gets in eglibc
>   boost: Upgrade recipe to 1.50.0
>   puzzles: Fix checksums
>   valgrind: Fix build with eglibc 2.16
>   libpam: Fix build with eglibc 2.16
>   eglibc: Add recipes for 2.16 release
>=20
>  meta/classes/mirrors.bbclass                       |    4 +-
>  meta/recipes-bsp/grub/grub-1.99/remove-gets.patch  |   20 +
>  meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
>  .../busybox/busybox-1.19.4/sys_resource.patch      |   18 +
>  meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
>  .../coreutils/coreutils-8.14/remove-gets.patch     |   23 +
>  meta/recipes-core/coreutils/coreutils_8.14.bb      |    3 +-
>  .../eglibc/cross-localedef-native_2.16.bb          |   44 ++
>  .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 ++++
>  .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
>  .../eglibc_fix_findidx_parameters.patch            |   38 ++
>  .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
>  .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
>  .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 ++
>  .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
>  .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
>  .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 ++++++++++++++=
++++++
>  .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 ++++
>  .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 +++++
>  .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 +++
>  .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ++
>  meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
>  meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 ++++++
>  .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 +++
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
>  meta/recipes-core/udev/udev/include_resource.patch |   31 ++
>  meta/recipes-core/udev/udev_164.bb                 |    7 +-
>  .../recipes-devtools/bison/bison/remove-gets.patch |   20 +
>  meta/recipes-devtools/bison/bison_2.5.bb           |    6 +-
>  meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
>  meta/recipes-devtools/gdb/gdb.inc                  |    1 +
>  meta/recipes-devtools/gdb/gdb/siginfo_t.patch      |  403 +++++++++++++++
>  .../recipes-devtools/guile/files/remove-gets.patch |   23 +
>  meta/recipes-devtools/guile/guile_2.0.5.bb         |    3 +-
>  meta/recipes-devtools/m4/m4-1.4.16.inc             |    6 +-
>  meta/recipes-devtools/m4/m4/remove-gets.patch      |   21 +
>  .../valgrind-3.7.0/configure-with-glibc-2.16.patch |   32 ++
>  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    6 +-
>  .../augeas/augeas/remove-gets.patch                |   20 +
>  meta/recipes-extended/augeas/augeas_0.10.0.bb      |    4 +-
>  .../cpio/cpio-2.11/remove-gets.patch               |   20 +
>  meta/recipes-extended/cpio/cpio_2.11.bb            |    5 +-
>  .../diffutils/diffutils-3.2/remove-gets.patch      |   22 +
>  meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 +-
>  .../pam/libpam/include-sys-resource.patch          |   12 +
>  meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 +-
>  .../tar/tar-1.26/remove-gets.patch                 |   20 +
>  meta/recipes-extended/tar/tar_1.26.bb              |    5 +-
>  .../wget/wget-1.13.4/remove-gets.patch             |   23 +
>  meta/recipes-extended/wget/wget_1.13.4.bb          |    3 +-
>  meta/recipes-sato/puzzles/puzzles_r9561.bb         |    5 +-
>  .../boost/{boost_1.49.0.bb =3D> boost_1.50.0.bb}     |    5 +-
>  .../gnutls/gnutls/remove-gets.patch                |   41 ++
>  meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    3 +-
>  56 files changed, 2254 insertions(+), 31 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
>  create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/sys_resource=
=2Epatch
>  create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-get=
s.patch
>  create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.16.=
bb
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_ma=
sk.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-=
fix.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-l=
owlevellock-include-tls.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findi=
dx_parameters.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/generate-support=
ed.mk
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.=
patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.=
patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-che=
ck.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib=
=2Epatch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.=
patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754=
_sqrt.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.pa=
tch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-=
headers.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
>  create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
>  create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb
>  create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_get=
s.patch
>  create mode 100644 meta/recipes-core/udev/udev/include_resource.patch
>  create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
>  create mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch
>  create mode 100644 meta/recipes-devtools/guile/files/remove-gets.patch
>  create mode 100644 meta/recipes-devtools/m4/m4/remove-gets.patch
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configu=
re-with-glibc-2.16.patch
>  create mode 100644 meta/recipes-extended/augeas/augeas/remove-gets.patch
>  create mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
>  create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-=
gets.patch
>  create mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource=
=2Epatch
>  create mode 100644 meta/recipes-extended/tar/tar-1.26/remove-gets.patch
>  create mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.pa=
tch
>  rename meta/recipes-support/boost/{boost_1.49.0.bb =3D> boost_1.50.0.bb}=
 (53%)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch
>=20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/196oACgkQN1Ujt2V2gBwrDwCgkb7H9GQmoR5PjGHJR53SQIAH
0HIAn02ziAhPMURYMuSxA3ZWnZ5w19k5
=RGHH
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--

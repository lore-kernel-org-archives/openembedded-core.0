Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shxfi-0004Fh-Tl
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 08:48:46 +0200
Received: by wibhm11 with SMTP id hm11so274486wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xBQfE9QCrqaz2e2OS+IiWAaWqNLdlNvYFJYZBNl26DY=;
	b=J7abcDPmqVcxgQ+NqdiaED6xlI6c789MaQ7AR26qBktuqcfExtjbRuPvf5sO5qvJwB
	FWAF/4tJTg9hU9InzJ4oN3HzaItwX+QcQ57lFMzBFTw9ASNuFpU+SP7INPyuDUvsQLr6
	ZbV3pyQVf0UV5V4B8Fv/bXE5OVuUCHfuBNwJ+/PW4YgIjJ1vBeGsvzoQj6eVVv6KfL4c
	6rLi5xr5qWdueXlChCVt1k+ne/EpjWHDPQP9TSwTdi3YVQYDi6iqMHsysACulsciIWHl
	9Nlda3+kJGPRVrBaYeeQkL686qVb7raiWtLZERKrpHwq55fjM/NFcEFSTpu7OYzm4tTl
	pVPA==
Received: by 10.180.78.197 with SMTP id d5mr2211010wix.7.1340347080126;
	Thu, 21 Jun 2012 23:38:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm50349999wib.9.2012.06.21.23.37.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 23:37:58 -0700 (PDT)
Date: Fri, 22 Jun 2012 08:37:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120622063756.GK9352@jama.jama.net>
References: <cover.1340205163.git.raj.khem@gmail.com>
	<a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/5] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Fri, 22 Jun 2012 06:48:47 -0000
X-Groupsio-MsgNum: 23974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/+CTqSGWdiRg+8j"
Content-Disposition: inline

--W/+CTqSGWdiRg+8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 08:18:37AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtool=
s/gcc/gcc-4.7.inc
> index 34a73b1..25a1088 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -3,12 +3,12 @@ require gcc-common.inc
>  PR =3D "r2"
> =20
>  # Third digit in PV should be incremented after a minor release
> -# happens from this branch on gcc e.g. currently its 4.7.0
> -# when 4.7.1 is releases and we bump SRCREV beyond the release
> -# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
> +# happens from this branch on gcc e.g. currently its 4.7.1
> +# when 4.7.2 is releases and we bump SRCREV beyond the release
> +# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>  # to reflect that change
> =20
> -PV =3D "4.7.0+svnr${SRCPV}"
> +PV =3D "4.7.1+svnr${SRCPV}"
> =20
>  # BINV should be incremented after updating to a revision
>  # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
> @@ -16,9 +16,9 @@ PV =3D "4.7.0+svnr${SRCPV}"
>  # 4.7.1 then the value below will have 2 which will mean 4.7.2
>  # which will be next minor release and so on.
> =20
> -BINV =3D "4.7.1"
> +BINV =3D "4.7.2"
> =20
> -SRCREV =3D "186651"
> +SRCREV =3D "188658"
>  BRANCH =3D "gcc-4_7-branch"
>  FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"

I'm not sure if this one is new, but libgcc now reports unpackaged
file:

NOTE: package libgcc-4.7.1+svnr188658-r2: task do_package: Started
WARNING: For recipe libgcc, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h

And the problem with (sometimes) missing or corrupt header file is still th=
ere:
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branc=
h/gcc/dwarf2out.c:8383:6: warning: format not a string literal and no forma=
t arguments [-Wformat-security]
| gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings =
-Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attri=
bute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings =
-Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-cor=
e/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc -I/OE/s=
hr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/.=
 -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-bran=
ch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr18865=
8-r2/gcc-4_7-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/work-s=
hared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libdecnumber -I/OE/shr-=
core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../l=
ibdecnumber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work-shared/gc=
c-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/emit-rtl.c -o emit-rtl.o
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branc=
h/gcc/emit-rtl.c:42:17: fatal error: rtl.h: No such file or directory
| compilation terminated.
Restarting build helps again..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/+CTqSGWdiRg+8j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/kEsQACgkQN1Ujt2V2gByf2QCgu/PgHRIsfFVZ+BVfd0LS82hA
ByQAniitrbZFWymbT0/4uYUh9QVsR5c9
=58yJ
-----END PGP SIGNATURE-----

--W/+CTqSGWdiRg+8j--

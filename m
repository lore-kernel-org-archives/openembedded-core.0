Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sm2sf-0004vR-7n
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 15:11:06 +0200
Received: by bkcik5 with SMTP id ik5so2464620bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dipcz8YsLHu1LP+04rDsuN4oaEtAlriLgNPpX7qzj/c=;
	b=SAb9+zWur9IwYo+FFxQsciiy6h/vkrM1TCpdT9oUCeVl204ZHC9HGuPqZpejEAuODB
	geawhAUqxC2sLz3QuKz8EXFAYK1DfL8/1Sbu8dvGVAUlgjAgxcYJGU3R+WVxpudE66/o
	h5RXu2HtxwfZ1UTdt5GMecKA4EP0fN7F05tDTfnB86aH1bdYaQxkV/hrr+wxlpzmbKf2
	ih8itc3+HtlQUlaje1ZuXC0vzQM0yUzgtYShOvwA1kBJxD+WFifsQoJN85r/2uua119M
	poGsEYlOuYzrzSNSrKTtoh8zqbmePzg9lRqVLpaoooW7ObuV6AHJTZLiNTFrCyrmF1+0
	IxCw==
Received: by 10.204.151.211 with SMTP id d19mr9670021bkw.63.1341320399436;
	Tue, 03 Jul 2012 05:59:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm14250404bku.16.2012.07.03.05.59.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 05:59:57 -0700 (PDT)
Date: Tue, 3 Jul 2012 14:59:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120703125957.GB3771@jama.jama.net>
References: <cover.1341299168.git.sgw@linux.intel.com>
	<872c46b6907e0721457c2c451d6d5c42548915e5.1341299168.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <872c46b6907e0721457c2c451d6d5c42548915e5.1341299168.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 17/17] openjade-native: fix undefined Getopts error, use std namespace
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
X-List-Received-Date: Tue, 03 Jul 2012 13:11:06 -0000
X-Groupsio-MsgNum: 24552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 12:09:46AM -0700, Saul Wold wrote:
> From: Dennis Lan <dennis.yxun@gmail.com>
>=20
> Using Gentoo Linux as the build host, it fails without this patch
> Use Getopt::Std in place of getopts.pl.

This looks like older version (v2 instead of v3) without PR bump.

>=20
> https://bugs.gentoo.org/show_bug.cgi?id=3D420083
>=20
> which following error:
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [InterpreterMessages.h] Error 2
> make[2]: *** Waiting for unfinished jobs....
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [DssslAppMessages.h] Error 2
>=20
> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> ---
>  .../openjade/openjade-1.3.2/msggen.pl.patch        |   44 ++++++++++++++=
++++++
>  .../openjade/openjade-native_1.3.2.bb              |    1 +
>  2 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.=
pl.patch
>=20
> diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patc=
h b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
> new file mode 100644
> index 0000000..b47fd46
> --- /dev/null
> +++ b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
> @@ -0,0 +1,44 @@
> +commit fcc5b94f118495b1a467edcda6c6f631691c3f69
> +Author: Dennis Lan <dennis.yxun@gmail.com>
> +Date:   Tue Jul 3 09:25:42 2012 +0800
> +
> +    openjade: fix undefined Getopts error, use std namespace
> +   =20
> +    Using Gentoo Linux as the build host, it fails without this patch
> +    Use Getopt::Std in place of getopts.pl.
> +   =20
> +    Upstream-Status: Inappropriate [no upstream]
> +    Original-Author-By: Mike Gilbert <floppym@gentoo.org>
> +    Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> +
> +diff --git a/msggen.pl b/msggen.pl
> +index 0c33968..2ee3f66 100644
> +--- a/msggen.pl
> ++++ b/msggen.pl
> +@@ -4,6 +4,7 @@
> + # See the file COPYING for copying permission.
> +=20
> + use POSIX;
> ++use Getopt::Std;
> +=20
> + # Package and version.
> + $package =3D 'openjade';
> +@@ -18,8 +19,7 @@ $gen_c =3D 0;
> + undef $opt_l;
> + undef $opt_p;
> + undef $opt_t;
> +-do 'getopts.pl';
> +-&Getopts('l:p:t:');
> ++getopts('l:p:t:');
> + $module =3D $opt_l;
> + $pot_file =3D $opt_p;
> +=20
> +@@ -72,7 +72,7 @@ while (<DEF>) {
> +     else {
> + 	$field[0] =3D~ /^[IWQXE][0-9]$/ || &error("invalid first field");;
> + 	$type[$num] =3D substr($field[0], 0, 1);
> +-	$argc =3D int(substr($field[0], 1, 1));
> ++	$argc =3D substr($field[0], 1, 1);
> +     }
> +     $nargs[$num] =3D $argc;
> +     $field[1] =3D~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("invalid tag");
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/me=
ta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index 5b29c1f..efd1e11 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D "sgml-common-native"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
>             file://makefile.patch \
> +           file://msggen.pl.patch \
>             file://reautoconf.patch \
>  	   file://user-declared-default-constructor.patch"
> =20
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/y7M0ACgkQN1Ujt2V2gBxhuQCgib0W3cXR7zK5uyDOUHn+Q+fD
Ch0AoK+H1pGImHyDAg7+hL3VjXGFXHV6
=Rq4c
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--

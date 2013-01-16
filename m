Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvTuy-0003YE-Dw
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 15:24:49 +0100
Received: by mail-pb0-f52.google.com with SMTP id ro2so741585pbb.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 06:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mGNiibXyY73m8dMq3uXNHLtjgseww5gsqjKCqcfdOkM=;
	b=I88AwvdrpH6+ElU4pTwYALzsXznEVQIIffjvLN3yTewilIbQoOwLn6mJfR37+O8BI7
	7uX7tDpXXD2gtqhSEVSj0OmWFTHLdxFfS+1AdQzpqbSTLQakNXij64y0oIELHCmbtw0e
	vMFDt1qsf+hEJzWq1eBafbvk0sTMw6ap6S3YqQyIk0vhv7MGQOShnWScrd3gHulIAHRi
	woPu/zGrCzKM8MuNERL3UfzIoRgFpXp4RGfVig3NEm2fA0AY1y5TTDA+6O3OkqhzCv0N
	u9XWprgW7Q9aurc7SlYkpqmp+0M9hKqvceHgNo2qnPNBh4KEowMLdqBUPPW5C+2yfz/Y
	KEkg==
X-Received: by 10.68.254.195 with SMTP id ak3mr3146441pbd.37.1358345357897;
	Wed, 16 Jan 2013 06:09:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z10sm13044686pax.38.2013.01.16.06.09.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 06:09:16 -0800 (PST)
Date: Wed, 16 Jan 2013 15:09:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Tom Zanussi <tom.zanussi@intel.com>
Message-ID: <20130116140919.GD3002@jama>
References: <20130116115800.A69171034D@opal>
MIME-Version: 1.0
In-Reply-To: <20130116115800.A69171034D@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Tom Zanussi : lttng2-ust: rename to lttng-ust
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 14:24:49 -0000
X-Groupsio-MsgNum: 33875
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Content-Disposition: inline

--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 11:58:00AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3c927c39502061bdf3ef9fba1f0f6e7080f6c3cd
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3c927c39502061bdf3ef9fba1f0f6e7080f6c3cd
>=20
> Author: Tom Zanussi <tom.zanussi@intel.com>
> Date:   Fri Jan 11 17:28:47 2013 -0600
>=20
> lttng2-ust: rename to lttng-ust
>=20
> recipes-kernel/lttng/lttng-ust was removed by a previous patch, which
> also removed the naming conflict that caused the lttng-2.0 version of
> lttng-ust to be named lttng2-ust.  lttng2-ust was the only lttng-2.0
> recipe to be named in this way and since that was entirely due to the
> conflict, we can go back to the consistent naming for it.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

lttng-ust had PE=3D"1", bump PE to fix upgrade path:

ERROR: Package version for package lttng-ust-dbg went backwards which would=
 break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-staticdev went backwards which=
 would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-dev went backwards which would=
 break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-doc went backwards which would=
 break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-locale went backwards which wo=
uld break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust went backwards which would bre=
ak package feeds from (1:0.16-r1 to 0:2.1.0-r0)

>=20
> ---
>=20
>  .../packagegroup-core-tools-profile.bb             |    2 +-
>  meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb |    2 +-
>  .../{lttng2-ust_2.1.0.bb =3D> lttng-ust_2.1.0.bb}    |    5 +++++
>  3 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-prof=
ile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 591f33f..8f40c4e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -46,7 +46,7 @@ SYSTEMTAP_aarch64 =3D ""
>  # which means we can not use syscall() to call it. So we ignore
>  # it for x86_64/uclibc
> =20
> -LTTNGUST =3D "lttng2-ust"
> +LTTNGUST =3D "lttng-ust"
>  LTTNGUST_libc-uclibc =3D ""
>  LTTNGUST_mips =3D ""
>  LTTNGUST_aarch64 =3D ""
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb b/meta/re=
cipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
> index 482b9a6..16e1ccc 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D01d7fc4496aacf=
37d90df90b90b0cac1 \
>                      file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
>                      file://lgpl-2.1.txt;md5=3D0f0d71500e6a57fd24d825f332=
42b9ca"
> =20
> -DEPENDS =3D "liburcu popt lttng2-ust"
> +DEPENDS =3D "liburcu popt lttng-ust"
> =20
>  SRCREV =3D "917f768512b5d336d553b801f6c5308d90252a89"
>  PV =3D "v2.1.0"
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb b/meta/rec=
ipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
> similarity index 87%
> rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
> rename to meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
> index 439e006..1076bde 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
> @@ -12,6 +12,11 @@ inherit autotools
> =20
>  DEPENDS =3D "liburcu util-linux"
> =20
> +# For backwards compatibility after rename
> +RPROVIDES_${PN} =3D "lttng2-ust"
> +RREPLACES_${PN} =3D "lttng2-ust"
> +RCONFLICTS_${PN} =3D "lttng2-ust"
> +
>  SRCREV =3D "0c9ad44b7604040dfcd1e67b18afc3dc5d025b19"
>  PV =3D "2.1.0"
>  PR =3D "r0"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD2tI8ACgkQN1Ujt2V2gBwTMACgm7AjhIYfYFkSiVHvqEEJVHr8
pmYAoJw37d6CFMRvs8104wh8e1y5rqDl
=yawX
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--

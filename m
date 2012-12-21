Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tm2dY-0005rr-1s
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:27:41 +0100
Received: by mail-pb0-f52.google.com with SMTP id ro2so2734898pbb.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=W14pmsQ6576teUawW2Z3KN2L1DhtB64m0R+wefpTOi4=;
	b=0sx/uSMWvjgdc89meOkQ9g+ihMzAYXZJzxAFpj3utMtEey0oTiwwiRcW+nfRBfoCKu
	FWabKyRshgMq3PSMPLoHW3GZNriAKGbwtwwlYvV5sOqHeTzu2HuyWesEd/4Mg6Y4E4C2
	NI+xg11Ngxp0aS7I/xwfGkPs5ECrwqevJpYOH2VfcZzPKUVlr/BTEVcVbnQm9w+iOWYR
	urdsPpmElMhxLPqxfrCCFmTg0KBtIKS3ae5nPfJycje61qxD+PHIPMEBnY10RzK+DCHR
	Ozg4uVzlqWebVIFfnOhXwAhzlaYPK9vLjBrarSvbstoajAVwNiM37WST6WYne4bn0P3t
	cs3A==
X-Received: by 10.66.82.230 with SMTP id l6mr37144142pay.12.1356095573089;
	Fri, 21 Dec 2012 05:12:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id c2sm7377619pay.34.2012.12.21.05.12.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:12:51 -0800 (PST)
Date: Fri, 21 Dec 2012 14:12:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20121221131250.GR14543@jama.palm1.palmone.com>
References: <1356093547-21765-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1356093547-21765-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] vala-stub: add a stub for vala-native
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
X-List-Received-Date: Fri, 21 Dec 2012 13:27:42 -0000
X-Groupsio-MsgNum: 33006
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffBYM5qgR8HH9Mta"
Content-Disposition: inline

--ffBYM5qgR8HH9Mta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2012 at 12:39:07PM +0000, Ross Burton wrote:
> Some packages have optional support for Vala but require vala.m4 to provi=
de
> VALA_PROG_VAPIGEN so that autoreconf works.
>=20
> vala-stub provides a dummy VALA_PROG_VAPIGEN which doesn't do anything, s=
o the
> configure script runs and believes that vala isn't present.

Doesn't this conflict with real vala-native?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/vala/files/vala.m4 |    2 ++
>  meta/recipes-devtools/vala/vala-stub.bb  |   16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta/recipes-devtools/vala/files/vala.m4
>  create mode 100644 meta/recipes-devtools/vala/vala-stub.bb
>=20
> diff --git a/meta/recipes-devtools/vala/files/vala.m4 b/meta/recipes-devt=
ools/vala/files/vala.m4
> new file mode 100644
> index 0000000..1776c6d
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/files/vala.m4
> @@ -0,0 +1,2 @@
> +# A stub defintion that does nothing
> +AC_DEFUN([VALA_PROG_VAPIGEN],[])
> diff --git a/meta/recipes-devtools/vala/vala-stub.bb b/meta/recipes-devto=
ols/vala/vala-stub.bb
> new file mode 100644
> index 0000000..6d5ff08
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala-stub.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Stub vala.m4 for building without vala support"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://vala.m4;md5=3Df38dd167c10adc458a1bcbc96443c=
dfa"
> +PROVIDES =3D "vala"
> +
> +SRC_URI =3D "file://vala.m4"
> +inherit allarch
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +	install -d ${D}${datadir}/aclocal
> +	install -m 0644 ${WORKDIR}/vala.m4 ${D}${datadir}/aclocal/
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ffBYM5qgR8HH9Mta
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDUYFIACgkQN1Ujt2V2gBzXAgCfTzd/uOCnGgb3t6fFnab46H5b
Ik0AoIFi3CEf1BQ3NsBngBj4CD5fHEO1
=EEqI
-----END PGP SIGNATURE-----

--ffBYM5qgR8HH9Mta--

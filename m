Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrpBX-0002sl-N4
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 13:46:23 +0200
Received: by bkcik5 with SMTP id ik5so1887837bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 04:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Aon7m9ONgIco025Zz7KPYCsJYIUG1tZte9YGSqcZ/+Q=;
	b=gMHd4/cNq7VlCYMd8MSbHhSGTWI5vd2xK/MNDRHR53p/5jfqhbt4COSvV+7Qs+6Wgv
	Zxnu14Qh6TzBvPutgxLWIjbwTLlT+xY1/8ViL9+bIcxAPOmII2JKUR89behTIXzdhG/f
	E6LP0FJTqSwjB1p0mI5FXNcHI14+fQ3dOKK2y9DlE5d+cCv+KHLCEwUobWiSdyJiuIup
	9c2o2NI0H7tWOVack5vFkWe7D6f3LGpfmv0Cy/AtnDTdrnRAlik91hTg6+FOC7XMzUXn
	TCfi3wG+DHYGeIfYYJ6TgIJ7YiuwLwa9Ef9Lp/5FTYgtPwVH6IOhKaohd3CBMV15KJNW
	JSkA==
Received: by 10.204.129.14 with SMTP id m14mr723253bks.7.1342697701898;
	Thu, 19 Jul 2012 04:35:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm948049bkv.11.2012.07.19.04.35.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 04:35:01 -0700 (PDT)
Date: Thu, 19 Jul 2012 13:35:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120719113512.GK3331@jama.jama.net>
References: <1342696517-28149-1-git-send-email-mertsas@cisco.com>
MIME-Version: 1.0
In-Reply-To: <1342696517-28149-1-git-send-email-mertsas@cisco.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Changed SRC_URI for eglibc repo.
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
X-List-Received-Date: Thu, 19 Jul 2012 11:46:23 -0000
X-Groupsio-MsgNum: 25706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7Ke/meiCZutM6I/"
Content-Disposition: inline

--C7Ke/meiCZutM6I/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 01:15:17PM +0200, Martin Ertsaas wrote:
> The branches repo for eglibc is /branches, not /svn/branches.

Are you sure? wasn't this tested on broken bitbake where protocol param
was ignored and default svn:// protocol was used instead http://?

Cheers,

>=20
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
>  .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb b/me=
ta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> index 422e0bb..4301174 100644
> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> @@ -16,7 +16,7 @@ inherit autotools
>  PR =3D "r0"
>  SRCREV=3D"15225"
>  EGLIBC_BRANCH=3D"eglibc-2_14"
> -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH=
};protocol=3Dhttp "
> +SRC_URI =3D "svn://www.eglibc.org/branches/;module=3D${EGLIBC_BRANCH};pr=
otocol=3Dhttp "
>  S =3D "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
> =20
>  do_unpack_append() {
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/me=
ta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> index 47f0834..12f1d8b 100644
> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> @@ -16,7 +16,7 @@ inherit autotools
>  PR =3D "r0"
>  SRCREV=3D"19383"
>  EGLIBC_BRANCH=3D"eglibc-2_16"
> -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH=
};protocol=3Dhttp "
> +SRC_URI =3D "svn://www.eglibc.org/branches/;module=3D${EGLIBC_BRANCH};pr=
otocol=3Dhttp "
>  S =3D "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
> =20
>  do_unpack_append() {
> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/=
eglibc/eglibc_2.15.bb
> index 4d4d2cf..a72b076 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -7,7 +7,7 @@ PR =3D "r12"
>  PR_append =3D "+svnr${SRCPV}"
> =20
>  EGLIBC_BRANCH=3D"eglibc-2_15"
> -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH=
};protocol=3Dhttp \
> +SRC_URI =3D "svn://www.eglibc.org/branches/;module=3D${EGLIBC_BRANCH};pr=
otocol=3Dhttp \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>             file://IO-acquire-lock-fix.patch \
>             file://mips-rld-map-check.patch \
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/=
eglibc/eglibc_2.16.bb
> index 7e7d68b..d0cdd68 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -7,7 +7,7 @@ PR =3D "r1"
>  PR_append =3D "+svnr${SRCPV}"
> =20
>  EGLIBC_BRANCH=3D"eglibc-2_16"
> -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH=
};protocol=3Dhttp \
> +SRC_URI =3D "svn://www.eglibc.org/branches/;module=3D${EGLIBC_BRANCH};pr=
otocol=3Dhttp \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>             file://IO-acquire-lock-fix.patch \
>             file://mips-rld-map-check.patch \
> --=20
> 1.7.8.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7Ke/meiCZutM6I/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAH8PAACgkQN1Ujt2V2gBzSdgCfRlwJDr2mHb+5jw8C6Y+TkFRs
ce4AoISUBKdwIIgJa+Nazz9gjWBmVAHY
=XWIE
-----END PGP SIGNATURE-----

--C7Ke/meiCZutM6I/--

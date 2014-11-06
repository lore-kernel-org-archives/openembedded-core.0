Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 63F6272010;
	Thu,  6 Nov 2014 17:25:17 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so1738792wgh.25
	for <multiple recipients>; Thu, 06 Nov 2014 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=flfglRKPDawnZUM5h6ZTD9Q+NlEr5Ef7/q0YRBa+k1A=;
	b=M9fdgv9VYgI78I3CFl6XCSf/rqVMVpHjCqZvTQRK9dc5CsmcXtLfBFj8X+591Ve49J
	kglDiehShG4IbcAk+EE11JotDC/cRV8VU7nXGRSYUnhboxCTU78NpxrqFOdbYdhe1JhD
	ffdqEd4QXJJDSh+X0w1ZF7LIATcz3++b0Q+v899lCb0ohsPOzwGp8IT3Bw/NtqVbQefY
	7/0g61WeE5VhLMeU+JIVHQEGsj1HEGsNTUP9daG3V6ku5jJdQDL11/rJWeO1nqNscjSf
	HoM15b4RWXsePmWGIrFdju47UqBZZJro3MQHhbOFrWZWUludj9U210+MSc5LADmCGRZ+
	f+Ug==
X-Received: by 10.194.81.38 with SMTP id w6mr7720568wjx.17.1415294716817;
	Thu, 06 Nov 2014 09:25:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r2sm9054037wif.23.2014.11.06.09.25.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Nov 2014 09:25:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 6 Nov 2014 18:25:20 +0100
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Message-ID: <20141106172520.GB2455@jama>
References: <20141105232840.B115C50244@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20141105232840.B115C50244@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Saul Wold : pseudo.inc: Clean up backport of version update to 1.6.2
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
X-List-Received-Date: Thu, 06 Nov 2014 17:25:25 -0000
X-Groupsio-MsgNum: 59327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline

--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2014 at 11:28:40PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: daisy
> Commit: 606793e7b5c129654f317e5bec9ed7f083d3383d
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D606793e7b5c129654f317e5bec9ed7f083d3383d
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Wed Nov  5 13:36:33 2014 -0800
>=20
> pseudo.inc: Clean up backport of version update to 1.6.2
>=20
>   This uprevs pseudo to 1.6. This merges in all of the existing
>     fixes, and also adds partial support for extended attributes,
>     including storing arbitrary extended attributes in the database,
>     and also interpreting the posix permissions ACLs as chmod
>     requests.
>=20
>     The extended attribute support means we need xattr.h, the simplest
>     way to be sure of this is to build attr before pseudo, which doesn't
>     take long.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

You can also remove
=2E/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.=
patch
which is no longer used by pseudo versions in daisy


>=20
> ---
>=20
>  meta/recipes-devtools/pseudo/pseudo.inc | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
> index 42738ab..11a8514 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -7,11 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/=
pseudo"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad"
>  SECTION =3D "base"
>  LICENSE =3D "LGPL2.1"
> -DEPENDS =3D "sqlite3"
> -
> -SRC_URI_append_class-nativesdk =3D " file://symver.patch"
> -
> -SRC_URI_append_class-native =3D " file://symver.patch"
> +DEPENDS =3D "sqlite3 attr"
> =20
>  FILES_${PN} =3D "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${lo=
calstatedir}/pseudo ${prefix}/var/pseudo"
>  FILES_${PN}-dbg +=3D "${prefix}/lib/pseudo/lib*/.debug"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRbrwAACgkQN1Ujt2V2gBwIQgCfTVKSknE0rC9k6UnXkRiXI4Z1
U68AniBanrrPXU4ZFNEpJdposmRJCYAy
=/ANo
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--

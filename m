Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T28G9-0004aM-HF
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:09:45 +0200
Received: by wgbdr1 with SMTP id dr1so2517283wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=99KebGImfXlzw2Rd2hIq4eJau2uY1BdU5kteVscYFLI=;
	b=g7zlozkkf3WvVXqPnsfAZnqDfMBeZcgdobwUiQmQR08lbusJHf47tC7IIA0dbkX4k5
	2OnxDcMK0qoncL7k9UPplm14V766qYNQMKLj14CF3W1OormOCUZIhAxGejDoy9UuZgvv
	ZWP7EOQiW745bVP5m2shhP9EYJOjJAUkltHmp2nZ4Ri+ZIew/FikK/d21MUD/IDlv+hp
	GQxE6RMcAtu0IxB0On51xbgJfFbMsDTLoSP+lHeDJLDHxshN3ps1ZVuxelpAIRnaY+7U
	+L5AoL3YtKIU03PtYndc8tY4h+wXBYr30cvfHJg9OmZO2K/VXOu9B6fpkjSZ6upmChVX
	yFGw==
Received: by 10.180.19.169 with SMTP id g9mr9370320wie.9.1345154267697;
	Thu, 16 Aug 2012 14:57:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm9106881wiy.4.2012.08.16.14.57.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:57:46 -0700 (PDT)
Date: Thu, 16 Aug 2012 23:57:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120816215744.GB3625@jama.jama.net>
References: <cover.1345152235.git.andrei@gherzan.ro>
	<3f88694096116da408832aad9afd90df386e0a36.1345152235.git.andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <3f88694096116da408832aad9afd90df386e0a36.1345152235.git.andrei@gherzan.ro>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 5/7] subversion: Add gettext to DEPENDS as msgfmt is needed at compile time
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
X-List-Received-Date: Thu, 16 Aug 2012 22:09:45 -0000
X-Groupsio-MsgNum: 27643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 12:32:48AM +0300, Andrei Gherzan wrote:
> Avoid error:
> | /bin/bash: <path>/tmp/sysroots/i686-linux/usr/bin/msgfmt: No such file =
or
> directory

shouldn't this be gettext-native or inherit gettext then?

> | make: *** [subversion/po/de.mo] Error 127
> | make: *** Waiting for unfinished jobs....
> | ERROR: oe_runmake failed
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../subversion/subversion_1.7.2.bb                 |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.2.bb
> index 4f71de5..6b72e73 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> @@ -5,9 +5,11 @@ RDEPENDS_${PN} =3D "neon"
>  LICENSE =3D "Apache-2"
>  HOMEPAGE =3D "http://subversion.tigris.org"
> =20
> +DEPENDS =3D "gettext"
> +
>  BBCLASSEXTEND =3D "native"
> =20
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://libtool2.patch \
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

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAtbNgACgkQN1Ujt2V2gBy2SACgupa9La/jT9iLpivi0RTHnlbS
Vp8AoIp1mQS3xWMHsWWdPMVhLGUIAizS
=uy2n
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--

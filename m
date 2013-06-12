Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7E30B6A9FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:11:49 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so7055621eak.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wFQjwv6L0Ft6AzLj26vyAmjUiXsakdgwOP8IH7xnBLo=;
	b=vvGFT3XmW0H/UTgn5ADj1CVOg1hJP1/UYiyJxzuxLwtXy4Skbsz4Cx/xyloUdZX71S
	DYhCFaDajiVjC9O27/jh6DRv0kBLhkC1J+YKA9aKHKPXDVeFSCQGksNZEsResyXzovAx
	9zw9bQQg32XNZ6SA/nFNSon9RJWAt7BX9l0eGlrxKvQZQ6i6sW4ZPNRpmZZXjisc1xL3
	Ney9O3JTLMkA8qKSSASxXWdwuhGnfCNXcDAaiOCTTkQpXFhncjCX2/cMzMshi7ksyF6Z
	QLJnDwow6HnuMgmcTSK74VG1nBWLqfxamRPGuH8cYvIHR/QLq4HWX8888DCClKi2KEQ7
	MKYQ==
X-Received: by 10.15.98.203 with SMTP id bj51mr21868418eeb.22.1371042710225;
	Wed, 12 Jun 2013 06:11:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id 3sm36822552een.7.2013.06.12.06.11.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 06:11:49 -0700 (PDT)
Date: Wed, 12 Jun 2013 15:12:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130612131214.GP3233@jama>
References: <1371039493-21547-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1371039493-21547-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] at-spi2-core: add xtst dependency
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
X-List-Received-Date: Wed, 12 Jun 2013 13:11:49 -0000
X-Groupsio-MsgNum: 40525
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nLMor0SRtNCuLS/8"
Content-Disposition: inline

--nLMor0SRtNCuLS/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2013 at 01:18:13PM +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta/recipes-support/atk/at-spi2-core_2.8.0.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/recipe=
s-support/atk/at-spi2-core_2.8.0.bb
> index 29851bb..34cdcbb 100644
> --- a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> +++ b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${P=
V}.tar.xz"
>  SRC_URI[md5sum] =3D "93b57d5d56d15d1222ddf2386e2f869f"
>  SRC_URI[sha256sum] =3D "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f74=
03c96a10a481c458"
> =20
> -DEPENDS =3D "dbus glib-2.0 virtual/libx11 libxi"
> +DEPENDS =3D "dbus glib-2.0 virtual/libx11 libxi libxtst"
> =20
>  inherit autotools gtk-doc
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nLMor0SRtNCuLS/8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG4c64ACgkQN1Ujt2V2gBzICACfbHlOdMA6LpusX7gnxYex0gdv
9/UAoIU88dCIMR22Sgmk9jQT816Kq34s
=a6dt
-----END PGP SIGNATURE-----

--nLMor0SRtNCuLS/8--

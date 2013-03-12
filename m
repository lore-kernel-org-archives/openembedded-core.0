Received: from mail-ie0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFJa6-0006q5-Pw
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 08:25:08 +0100
Received: by mail-ie0-f179.google.com with SMTP id k11so5948896iea.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Ggvi8bTyF8ph3yx2ElmVH4zSyJgzjztj899tmvRC3KU=;
	b=dNDzWYIcb490Eel7n9neU/HWkU5WCMkDsAc8SA5iFnrIvbsXIj585Xy5NZEtQfQf92
	iTl2CfC9u7lZZg2r51V/nPYBvqQj1BhHVkLTA8TtV5aPkNI8vD0d+DPyjybGu8nT5Czi
	BvlG4vZxKQpwrVtGtiXNB9cJTBYO/Y/WC7z+Lc4ajjAiqmY/SC5oQeXyB6uMeoelmSd7
	070h6CCloRzd2sqi3+vth5eZzW/cdA6CuNwEJxbPzku1EQWrNQWo6Ys4MNTSjoIaY7Lq
	B2dxsreOJgbL8fO+9V1Gf//D4Z0TrdFzU9bMCrD4aw84D2acA8211RkWKAU7ytdaBWLE
	1bLw==
X-Received: by 10.50.7.242 with SMTP id m18mr10694110iga.53.1363072107498;
	Tue, 12 Mar 2013 00:08:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ew5sm19699980igc.2.2013.03.12.00.08.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 00:08:26 -0700 (PDT)
Date: Tue, 12 Mar 2013 08:08:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130312070827.GF9724@jama.dyndns-home.com>
References: <cover.1363025917.git.ross.burton@intel.com>
	<228e005f888afff7bd97f015e321a62071c09307.1363025917.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <228e005f888afff7bd97f015e321a62071c09307.1363025917.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/12] systemd-compat-units: add missing systemd-systemctl-native dependency
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
X-List-Received-Date: Tue, 12 Mar 2013 07:25:09 -0000
X-Groupsio-MsgNum: 36484
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline

--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2013 at 11:24:49AM -0700, Ross Burton wrote:
> This package has postinsts that run on the build host, but wasn't dependi=
ng on
> systemd-systemctl-native.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd-compat-units.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/rec=
ipes-core/systemd/systemd-compat-units.bb
> index a7bfee3..19a1ea1 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f=
40d7994397109285ec7b81fdeb3
> =20
>  PR =3D "r18"
> =20
> +DEPENDS =3D "systemd-systemctl-native"

Do you want RDEPENDS_${PN} here?

> +
>  inherit allarch
> =20
>  SRC_URI =3D "file://*.service"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE+1GsACgkQN1Ujt2V2gBw5UwCdHJdq74HJrtSlOfGmljsBUQC6
iSYAoKIJOJYF3x4WYOLNQcmQp7nnsi8c
=bf6M
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--

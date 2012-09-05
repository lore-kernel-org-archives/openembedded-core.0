Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9G7r-0006mv-B3
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 15:58:39 +0200
Received: by bkcik5 with SMTP id ik5so306621bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a7E/hn2xBv5tvni/M83FWVpdJC5rA9vmsXdnQzYWdDM=;
	b=XWitumKm0QLTL/gYWP62XnHpy6cpMvMCHCY7xbLWH2jfYJ9zPMVivWiQvcZ6kgbp8W
	vSHrjSZLW+pmVOMTsx2z/DX2Z20PQvBSy0PMyG069FXKA4e4vanfN5fszKgPgVgo/Kbn
	BSIg6CCoOs2JC65hPAWpLFEz93J7S5wCnfw0nQjFg9mFwm30N7WPrWK4n8+CQ2vTUcY+
	J2z5ws+DLtNzWrWoYdNBhNcFrBxCOxjqfrh/n41PPcLTDazKuuuqCk8z4dRaWsHCIE1X
	LE4tXUglv4msYFhkEMa2gdQDOPQTdKLZo1Mb4TvAkAolmEpoAdNJb1Z9dnyYaHHVWgoF
	2glQ==
Received: by 10.205.125.7 with SMTP id gq7mr9254279bkc.98.1346852776313;
	Wed, 05 Sep 2012 06:46:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm1205862bkc.3.2012.09.05.06.46.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 06:46:14 -0700 (PDT)
Date: Wed, 5 Sep 2012 15:46:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120905134644.GP3372@jama.jama.net>
References: <1346852521-22320-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1346852521-22320-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] pulseaudio: fix pulseaudio-server RDEPENDS
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
X-List-Received-Date: Wed, 05 Sep 2012 13:58:39 -0000
X-Groupsio-MsgNum: 28723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oCBD0SPT9UHZkBMO"
Content-Disposition: inline

--oCBD0SPT9UHZkBMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2012 at 03:42:01PM +0200, Martin Jansa wrote:
> * module-cork-music-on-phone was renamed to module-role-cork
>   http://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3D3c5cc345=
472302b9511c19244b3eceb4a3674d8c

To catch errors like this, there should be not only world as bitbake
target, but also world-image (to test if package manager can install
them all). I'm using *-all images to test my task-*-feed/packagegroup-*-feed
recipes.

Cheers,

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc    | 2 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index 22870ad..315d4dc 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -138,5 +138,5 @@ RDEPENDS_pulseaudio-server =3D " \
>      pulseaudio-module-suspend-on-idle \
>      pulseaudio-module-console-kit \
>      pulseaudio-module-position-event-sounds \
> -    pulseaudio-module-cork-music-on-phone "
> +    pulseaudio-module-role-cork "
> =20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/=
recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> index 5359146..97bd4d3 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> @@ -1,6 +1,6 @@
>  require pulseaudio.inc
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
> =20
> --=20
> 1.7.12
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oCBD0SPT9UHZkBMO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBHV8QACgkQN1Ujt2V2gBz7uwCgomx0iWa4K5R/DAE7djyDNLKp
MqgAn3S3zteu+c7QGzHcHhUTcGhG0T2f
=ydF/
-----END PGP SIGNATURE-----

--oCBD0SPT9UHZkBMO--

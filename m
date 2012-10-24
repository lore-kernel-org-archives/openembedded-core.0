Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TR5bV-0007X5-KH
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 20:22:57 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so4523850wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XftgOgxDWVpA6hYuY1aKSJzxXka1R0aGtS4qBmHVncw=;
	b=GU8i5OeyvJN6US5RoTVp7XDvrKfQHq1UXRypWBUYnSdhA984hF58ixEa95LNzY2RrO
	kl9Ylc95bkRsaY6yFOLGTHziVnVhORspt6a019r9fnnhQh++D3mmDmtquLsWVlZJc9dD
	vbuhQdQPZSv+t8s5mecVdrRRRxWXZJwLE9U0kKNyu1t9Nv/4RuahzQOj1y8fzWEu4+Pn
	oje+Rj+DRjF85IvXpJFkpuVz8xO+58MBv0pox4YdqIOKxrIXmnXqymZNy8axnlN1nCcY
	z+C7nUrkb8STdDuvjcVGKmN64feC3fYXp7sD4tINYlnDfDLqVTUQ8sz5LXLqIh7UdN6Z
	rZ5A==
Received: by 10.216.195.100 with SMTP id o78mr10733712wen.182.1351102169564;
	Wed, 24 Oct 2012 11:09:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fp6sm5540342wib.0.2012.10.24.11.09.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 11:09:28 -0700 (PDT)
Date: Wed, 24 Oct 2012 20:09:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20121024180946.GI3269@jama.jama.net>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
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
X-List-Received-Date: Wed, 24 Oct 2012 18:22:57 -0000
X-Groupsio-MsgNum: 30958
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kUr9BK2/TCCh1PYv"
Content-Disposition: inline

--kUr9BK2/TCCh1PYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 05:37:33PM +0100, Ross Burton wrote:
> Add explicit build-dependency on GConf as currently it's an implicit depe=
ndency
> and so vunerable to races at build time.

Isn't better to inherit gconf or the issue I had today with foxtrotgps
does not apply here?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    2 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index 463777d..ab70c7e 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://GPL;md5=3D4325afd396febcb6=
59c36b49533135d4 \
>  DEPENDS =3D "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libt=
ool \
>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 li=
bxtst libice libsm libxcb gtk+', '', d)}"
>  # optional
> -DEPENDS +=3D "udev alsa-lib glib-2.0 dbus \
> +DEPENDS +=3D "udev alsa-lib glib-2.0 dbus gconf \
>             ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', ''=
, d)}"
> =20
>  SRC_URI =3D "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-$=
{PV}.tar.gz \
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/=
recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> index a10b953..d25b424 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> @@ -1,6 +1,6 @@
>  require pulseaudio.inc
> =20
> -PR =3D "r7"
> +PR =3D "r8"
> =20
>  DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
> =20
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

--kUr9BK2/TCCh1PYv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCILuoACgkQN1Ujt2V2gBxYkQCfduA2jariugczNORhoc5QxOnN
7LsAn3jbrMCcZlBK9P6V1PgvUzkugOjr
=Z6vF
-----END PGP SIGNATURE-----

--kUr9BK2/TCCh1PYv--

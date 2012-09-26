Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGq91-0004wd-Jb
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 13:51:11 +0200
Received: by wibhn17 with SMTP id hn17so493241wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lbOO5jGpJPKgQ9JowiJQZwArJ9cR/d0ZL5Vjv/eizCc=;
	b=q1k1FXZNcJ7lBzN1mz86++kTIkVU2Re5i196vBC2aKVS37hjcuz4+7tAcKStM7X1m/
	UDnEoHXXrNxgsEFdTHtve2rxJPkVY+4SfxeA3L/9oLbEqbYvXkRfp45aikElXrVWPjEM
	LsI/qEOLeDtzkyJFt1r56MpnLbGmg/6uzETAfOMi2xCfqjy8KpCSksPq1LLHoTSiWB1+
	rBK8PF7TtCGT7HFNJf4vRqv8u4wscXo3L3PjhgLw9ErhfjPf+tqS1lZxikFxTYd5En6M
	OnHrEdlweL2eKDY2u6FWR9sZKEcOZS0rPoZdxgwPtnM/O+tcgeVpDgtuedPdgt63LRGR
	BpnQ==
Received: by 10.180.93.106 with SMTP id ct10mr859498wib.8.1348659492269;
	Wed, 26 Sep 2012 04:38:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm25178982wiy.3.2012.09.26.04.38.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 04:38:11 -0700 (PDT)
Date: Wed, 26 Sep 2012 13:38:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120926113818.GG3313@jama.jama.net>
References: <1348659245-14209-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1348659245-14209-1-git-send-email-paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: make pulseaudio support dependent on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 26 Sep 2012 11:51:11 -0000
X-Groupsio-MsgNum: 29902
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Content-Disposition: inline

--ulDeV4rPMk/y39in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 12:34:05PM +0100, Paul Eggleton wrote:
> This should be no change to the previous situation unless you
> explicitly have pulseaudio in DISTRO_FEATURES_BACKFILL_CONSIDERED
> (currently).

Why not use PACKAGECONFIG for this?


Cheers,

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../gstreamer/gst-plugins-good_0.10.31.bb          |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.b=
b b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> index 641de7c..07fda87 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> @@ -6,15 +6,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9=
b6cdffcea4f398e37343 \
>                      file://gst/replaygain/rganalysis.c;beginline=3D1;end=
line=3D23;md5=3Db60ebefd5b2f5a8e0cab6bfee391a5fe"
> =20
>  DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag fl=
ac \
> -	    speex libsoup-2.4 pulseaudio"
> -PR =3D "r5"
> +            speex libsoup-2.4 \
> +            ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudi=
o', '', d)}"
> +
> +PR =3D "r6"
> =20
>  inherit gettext gconf
> =20
>  SRC_URI +=3D "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_bu=
ffer-i.patch"
> =20
>  EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --disa=
ble-libcaca --disable-hal --without-check \
> -                 --disable-orc --disable-examples"
> +                 --disable-orc --disable-examples \
> +                 ${@base_contains('DISTRO_FEATURES', 'pulseaudio', '--en=
able-pulse', '--disable-pulse', d)}"
> =20
>  do_configure_prepend() {
>  	# This m4 file contains nastiness which conflicts with libtool 2.2.2
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

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBi6SoACgkQN1Ujt2V2gByU8ACgjO1rr77zQCBbVCcm3roYPZo8
L3wAniVej39A0YfubX/zFvFnM65ZvzTP
=3VPz
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--

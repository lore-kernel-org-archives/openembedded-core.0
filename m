Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D0A307280D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 14:10:18 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so6743129wgg.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 06:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+1i6zHWrfxQ9jDPUDdl7DuMQ0SBLQRlaCPk9y0kNDxA=;
	b=Pgm2cXfSEgnQpGqRswVW/UlB4yvsRmooRdAWIUhF4P+/TNowS/Yy95S8ueZ84tTaha
	PWVXT8xykGN0Z2+l4S3yq2mhOL/yE8YB3jEJE5ZUgqzMJmzoEd5iECr4d+k1+05dl2+4
	oxC3SAFsRpBRPZ8RndLgvsXAgGmgK0GO1By/J8u0aWd4cdfbeh4mP1nuQWcWZp1gITfL
	m1LkgAWm2I+Srwqs/2RXwlyrNXQl3bbgcLWp2Yt7H4f827iSena0ung0uI0gRe5Dwjtd
	hLwPSaV/uqpxf7MgbsXBldoFKQcWJywtDbD18rXNgngwFuppNK2GSQDggP7+uxl0OBMt
	tinQ==
X-Received: by 10.194.63.51 with SMTP id d19mr12701983wjs.77.1419257418612;
	Mon, 22 Dec 2014 06:10:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dc1sm8509922wib.18.2014.12.22.06.10.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Dec 2014 06:10:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Dec 2014 15:10:19 +0100
To: Awais Belal <awais_belal@mentor.com>
Message-ID: <20141222141019.GD2465@jama>
References: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer1.0-* use gitsm style SRC_URI for git recipes
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
X-List-Received-Date: Mon, 22 Dec 2014 14:10:28 -0000
X-Groupsio-MsgNum: 60764
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline

--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2014 at 06:53:00PM +0500, Awais Belal wrote:
> All gstreamer components when fetched through git have a git
> submodule type repo rather than a main repo style. This
> will make builds fail when there's no network connection
> while the source is already downloaded.
> We fix this by explicitly using the gitsm styled SRC_URI for
> these submodules.
>=20
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  .../gstreamer/gstreamer1.0-libav_git.bb            |    2 +-
>  .../gstreamer/gstreamer1.0-omx_git.bb              |    2 +-
>  .../gstreamer/gstreamer1.0-plugins.inc             |    2 +-
>  .../gstreamer/gstreamer1.0_git.bb                  |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

If this is work-around for "common" submodule being fetched from
do_configure, then it would be much safer (and more efficient) to
add common as 2nd git repo in SRC_URI and use normal git fetcher.

> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> index bf1b87e..376a7c4 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
>                      file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=3Dbd7=
a443320af8c812e4c18d1b79df004 \
>                      file://gst-libs/ext/libav/COPYING.LGPLv3;md5=3De6a60=
0fd5e1d9cbde2d983680233ad02"
> =20
> -SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=3D=
master"
> +SRC_URI =3D "gitsm://anongit.freedesktop.org/gstreamer/gst-libav;branch=
=3Dmaster"
>  S =3D "${WORKDIR}/git"
> =20
>  SRCREV =3D "127202d6f65584891dabf92be031f0d170b0e7f1"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
> index 931a7fc..df7c58c 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \
>                      file://omx/gstomx.h;beginline=3D1;endline=3D21;md5=
=3D5c8e1fca32704488e76d2ba9ddfa935f"
> =20
>  SRC_URI =3D " \
> -    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=3Dmaster \
> +    gitsm://anongit.freedesktop.org/gstreamer/gst-omx;branch=3Dmaster \
>      file://0001-omx-fixed-type-error-in-printf-call.patch \   =20
>      "
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b=
/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> index 687aa2f..d857a40 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> @@ -43,7 +43,7 @@ def get_gst_srcuri(d):
>      branch =3D d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
> =20
>      if pv =3D=3D "git":
> -        s =3D "git://anongit.freedesktop.org/gstreamer/%s;branch=3D%s" %=
 (gstpkg_basename, branch)
> +        s =3D "gitsm://anongit.freedesktop.org/gstreamer/%s;branch=3D%s"=
 % (gstpkg_basename, branch)
>      else:
>          s =3D "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (=
gstpkg_basename, gstpkg_basename, pv)
>      return s
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta=
/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> index cb00d31..a8d3731 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> @@ -5,7 +5,7 @@ include gstreamer1.0.inc
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d \
>                      file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De0=
59138481205ee2c6fc1c079c016d0d"
> =20
> -SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=3D=
master"
> +SRC_URI =3D "gitsm://anongit.freedesktop.org/gstreamer/gstreamer;branch=
=3Dmaster"
>  S =3D "${WORKDIR}/git"
> =20
>  SRCREV =3D "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSYJksACgkQN1Ujt2V2gBwViQCfemjYgokeJSdzIOEbfOB/F9F7
YdUAn1PouKLeMZ4+AuZTkDNitrJySmVY
=ntEd
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--

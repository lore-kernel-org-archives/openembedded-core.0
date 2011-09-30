Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9XIE-0005O5-1g
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:13:58 +0200
Received: by fxi1 with SMTP id 1so2787629fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y89h637WksL1Bq+emTIcJ67/fOJxQjgRgGhL0R4MulE=;
	b=ouB6OofaCBD2jYlubFZccNxMfWfFE6g7VMYLSa+9v/PsxmoXOIm/LKv8QjGUxW/RHK
	kT49RRs4lztHXvy3TyBb5gsRZ/bpEvkgkSkGPR4Fps6Klg31IijMkRPh/7YpbeVDKXFv
	59iDkxHUeksC7IgSF1Xflrs0X8untSwEnbyp8=
Received: by 10.223.32.9 with SMTP id a9mr2940675fad.134.1317366509163;
	Fri, 30 Sep 2011 00:08:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v17sm5462942fai.18.2011.09.30.00.08.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:08:27 -0700 (PDT)
Date: Fri, 30 Sep 2011 09:08:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930070826.GA2361@jama.jama.net>
References: <1317347777-10288-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1317347777-10288-1-git-send-email-msm@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Add bash as RDEPENDS for gstreamer
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
X-List-Received-Date: Fri, 30 Sep 2011 07:13:58 -0000
X-Groupsio-MsgNum: 10239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 08:56:17PM -0500, Matthew McClintock wrote:
> This fixes the following build issue:
>=20
> | error: Failed dependencies:
> | 	/bin/sh is needed by gstreamer-0.10.32-r1.ppce500v2
>=20
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> Not sure how to say we just depend on /bin/sh instead of requiring
> the full blown version of bash
>=20
>  .../gstreamer/gstreamer_0.10.32.bb                 |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
> index 1713755..63ed7cb 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
> @@ -8,8 +8,9 @@ LICENSE =3D "LGPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605 \
>                      file://gst/gst.h;beginline=3D1;endline=3D21;md5=3D8e=
5fe5e87d33a04479fde862e238eaa4"
>  DEPENDS =3D "glib-2.0 libxml2 bison-native flex-native"
> +RDEPENDS =3D "bash"

This should be RDEPENDS_${PN} at least, but are you sure it's needed by
target package? not just for build?

Regards,

> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${=
PV}.tar.bz2 \
>             file://check_fix.patch \
> --=20
> 1.7.6.1
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6FauoACgkQN1Ujt2V2gBzzAgCfQtvI8UX8dSJVGLCyW4gM+2/K
+k8AnRRbuTzK4l0L3uIVj3ODpBE1xGIL
=9JIf
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--

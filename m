Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3314073FF2;
	Sat, 20 Jun 2015 10:37:03 +0000 (UTC)
Received: by wiga1 with SMTP id a1so38478478wig.0;
	Sat, 20 Jun 2015 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ktLqFz/Usk01TQegdNSymRy9w4fCJ4/1ii1bdSRJCX0=;
	b=yGG7zNCFw1gGd7cZIqxCGX4fuejQgQFgRzyJ0o7icoFNc8FBPBbzxuSkofJJAVsFLl
	3zG5hmvGAca4FVYB75uu3hSXxE3KNp9um5AIrF3aYRewjvZ5OABMH8hdQIAMCWuQVjHZ
	J2aJKnyNoIVKIXgPV3LUXpsJAXtjxLhzKMpYSYWvQgmDUV1Cs5BWsaxW9DkfDBkGOZeJ
	gdCx2Ua0YtdeVuJF6NixAZWjbBv8NgqxFVm1H5SCrhxwtZhNYQHkuVTpZNwqBFxSByS4
	qnEjGco140RhmTD1YrfQ3MTkc7T+tURSzxAMxEeQyApu7WH31kZmAPhbKQKU609GqAlg
	5HSg==
X-Received: by 10.180.74.210 with SMTP id w18mr14433652wiv.77.1434796624069;
	Sat, 20 Jun 2015 03:37:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	pf4sm20910074wjb.23.2015.06.20.03.37.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Jun 2015 03:37:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 20 Jun 2015 12:37:30 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>, valentin.popa@intel.com
Message-ID: <20150620103730.GD2398@jama>
References: <20150514104421.2FCAA50539@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150514104421.2FCAA50539@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : mesa: fix do_install_append
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
X-List-Received-Date: Sat, 20 Jun 2015 10:37:07 -0000
X-Groupsio-MsgNum: 66989
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Content-Disposition: inline

--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 10:44:21AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3a464d67b60f70b865f7db768e7edc53e40ff450
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3a464d67b60f70b865f7db768e7edc53e40ff450
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Wed May  6 00:08:35 2015 -0700
>=20
> mesa: fix do_install_append
>=20
> "ifdef MESA_EGL_NO_X11_HEADERS" -> "if defined(MESA_EGL_NO_X11_HEADERS)"
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>=20
> ---
>=20
>  meta/recipes-graphics/mesa/mesa_10.5.4.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa_10.5.4.bb b/meta/recipes-gra=
phics/mesa/mesa_10.5.4.bb
> index 150c664..03c9ecf 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.5.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.5.4.bb
> @@ -9,6 +9,6 @@ SRC_URI[sha256sum] =3D "b51e723f3a20d842c88a92d809435b229=
fc4744ca0dbec0317d9d4a3ac
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
; then
> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.con=
tains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplat=
form.h
> +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.uti=
ls.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/e=
glplatform.h
>      fi
>  }
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphi=
cs/mesa/mesa_git.bb
> index 0260617..8f70f67 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -17,6 +17,6 @@ inherit pythonnative
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
; then
> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.con=
tains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplat=
form.h
> +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.uti=
ls.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/e=
glplatform.h
>      fi

BTW: this is still breaking qtdeclarative which is using "None" symbol
which conflicts with "None" defined in Xlib.h

I've suggested renaming "None" in qtdeclarative to something more
specific, but it was rejected upstream (understandably as it's already
part of public API and needs changes in 5 qt components, see patch here:
https://github.com/webOS-ports/meta-webos-ports/commit/31aa85787a7513e27916=
5a25f6f06ea72c576314)
and they suggested to undef None before qsgtexture.h is included.

Do you remember why we don't respect MESA_EGL_NO_X11_HEADERS here? If
it's to fix application not using pkg-config to pass
MESA_EGL_NO_X11_HEADERS shouldn't we respect both like this:
sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if defined(MESA_EGL_NO_=
X11_HEADERS) and ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}=
/' ${D}${includedir}/EGL/eglplatform.h

+Valentin as it was introduced first in this commit (without any
explanation in commit message)

commit a5ebdb6ad8e4f94ac819275d55575230e057e4ae
Author: Valentin Popa <valentin.popa@intel.com>
Date:   Tue Feb 18 13:32:16 2014 +0200

    mesa: upgrade to 9.2.5
   =20
?

>  }
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWFQmkACgkQN1Ujt2V2gBxBKwCbBy4xrFZlxs3kAZogoKDz3nDI
RsoAnAhR0Yvovp70fJeGvHy7uVlHGWw5
=GwNW
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 348E676497
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:54:24 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so32086430wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6pHBOVKSvXqMnmoYmQJ1d1HwT30xvPfx+ShsZ0VmBS4=;
	b=WflBM8Vfw9x8UgKHn/lv3HdpdhdRxso0AxkwUCuPni2oQdnuBMBm63T4HU0h8ePHmH
	Lmyx2BfXjbrXug6qxXY/xlXQcSNskgqwTnjv4fntN9qOiAazArFZSViF5oBiplD+vcuc
	Nayxug+FRgAJSDbm/FRQhKWtSsvsBB0vAr5tI5dFkrgVM/ZxZ7lo+as2AW+6se0RWv/l
	skrvUsH57NcXmR3TqU9QUh1Zi68lbmdu9iW9fEe+fIPBmh8TwxE2PP9KIu20g5ckFyBf
	A6h9S6+KZYvOn6ug0Fs97roNvO4VvqQXrAURdLfIHhbYuOPQiEKHNqd7JzR+7+g8LX28
	zg0Q==
X-Received: by 10.180.189.196 with SMTP id gk4mr8777308wic.45.1438282464766;
	Thu, 30 Jul 2015 11:54:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id bd9sm485889wib.18.2015.07.30.11.54.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 11:54:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 20:54:39 +0200
To: Tobias Olausson <tobias.olausson@pelagicore.com>
Message-ID: <20150730185439.GP2457@jama>
References: <1438280587-5379-1-git-send-email-tobias.olausson@pelagicore.com>
	<1438280587-5379-2-git-send-email-tobias.olausson@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1438280587-5379-2-git-send-email-tobias.olausson@pelagicore.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Backports 9c746017af381884cc20c7cd563fc429c2c66112 to fido
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
X-List-Received-Date: Thu, 30 Jul 2015 18:54:25 -0000
X-Groupsio-MsgNum: 68783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PT0wT86ZVVq2zanE"
Content-Disposition: inline

--PT0wT86ZVVq2zanE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 11:23:07AM -0700, Tobias Olausson wrote:
> Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>

You should use git cherry-pick from master branch commit (and only
resolve the conflicts), so that original commit message is preserved.

> ---
>  meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-gra=
phics/mesa/mesa_10.4.4.bb
> index 8140411..da2f5c6 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> @@ -11,6 +11,6 @@ S =3D "${WORKDIR}/Mesa-${PV}"
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
; then
> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.con=
tains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglpl=
atform.h
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS$/#ifdef MESA_EGL_NO=
_X11_HEADERS || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/=
' ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphi=
cs/mesa/mesa_git.bb
> index cbe8911..5c35159 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -13,6 +13,6 @@ S =3D "${WORKDIR}/git"
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
; then
> -        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.con=
tains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglpl=
atform.h
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS$/#ifdef MESA_EGL_NO=
_X11_HEADERS || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/=
' ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PT0wT86ZVVq2zanE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6cu8ACgkQN1Ujt2V2gBz54ACfayeEw1usXqIkAv+yeHnAtd/F
+pMAnR4DeYszV7D+Ljxalt3sDYgSKZjC
=DjHk
-----END PGP SIGNATURE-----

--PT0wT86ZVVq2zanE--

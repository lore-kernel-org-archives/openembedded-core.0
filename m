Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0fj3-0004gj-0I
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 21:57:17 +0100
Received: by eekd41 with SMTP id d41so769487eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 12:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.3.136 as permitted sender) client-ip=10.213.3.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.3.136 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.3.136])
	by 10.213.3.136 with SMTP id 8mr4657ebn.11.1330030135358 (num_hops = 1);
	Thu, 23 Feb 2012 12:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6z3xVmd6adyzz0jIVjK0HeFPu3dDwGbE+d1M/qLyIEQ=;
	b=hXz9nwWZ4IRytkRbKk4yCP+Cbk7VQUcukpW4T2ZIG7slueLrL5vv/6woHtGdhogoJ3
	tDtGlD5qdX75aaH6qF1dZI58BXtd9GFFq74o1s9eYfXinOothecycb5aGDHt5RR2Jn+t
	/y+VhvUmLABpp5NMVvYBlatDXP6TLTNsPI11c=
Received: by 10.213.3.136 with SMTP id 8mr3154ebn.11.1330030135162;
	Thu, 23 Feb 2012 12:48:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z47sm9353002eeh.9.2012.02.23.12.48.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 12:48:54 -0800 (PST)
Date: Thu, 23 Feb 2012 21:48:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120223204852.GA3769@jama.jama.net>
References: <1330018985-21603-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1330018985-21603-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl 1.2.14: regenerate patch so it applies with 'patch' as well as 'git apply'
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
X-List-Received-Date: Thu, 23 Feb 2012 20:57:17 -0000
X-Groupsio-MsgNum: 17851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrEcvySKR+fOA8iz"
Content-Disposition: inline

--yrEcvySKR+fOA8iz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 06:43:05PM +0100, Koen Kooi wrote:
> The '@@ -, +, @@' part upsets plain 'patch'

Sorry I haven't seen it myself.. it still works on all my builds.

Thanks for fixup!.

Cheers,

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../libsdl-1.2.14/add.XGetRequest.symbol.patch     |   27 +++++++++++++-=
-----
>  1 files changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.s=
ymbol.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.sy=
mbol.patch
> index 7bab177..33ba8ec 100644
> --- a/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.p=
atch
> +++ b/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.p=
atch
> @@ -1,5 +1,8 @@
> -_XGetRequest API was backported to libx11-1.4.4 in:
> -http://git.openembedded.org/openembedded-core/commit/?id=3De08604800fe1c=
b8f240f53c147ceb4ee08a29b91
> +From e49fe9e2d75764d2d7ef79ab4252a1f6b99adcd3 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <martin.jansa@gmail.com>
> +Date: Thu, 23 Feb 2012 18:38:19 +0100
> +Subject: [PATCH] _XGetRequest API was backported to libx11-1.4.4 in:
> + http://git.openembedded.org/openembedded-core/commit/?id=3De08604800fe1=
cb8f240f53c147ceb4ee08a29b91
> =20
>  This breaks e.g. libsdl-image build with:
>  | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libSDL.so: undefin=
ed reference to `_XGetRequest'
> @@ -7,14 +10,15 @@ This breaks e.g. libsdl-image build with:
>  For details see: https://bugzilla.redhat.com/show_bug.cgi?id=3D782251
> =20
>  Upstream-Status: Accepted
> -
> -@@ -, +, @@=20
> - added.
> +---
>   src/video/x11/SDL_x11dyn.c |   24 ++++++++++++++++++++++++
>   src/video/x11/SDL_x11sym.h |    6 ++++++
>   2 files changed, 30 insertions(+), 0 deletions(-)
> ---- a/src/video/x11/SDL_x11dyn.c=09
> -+++ a/src/video/x11/SDL_x11dyn.c=09
> +
> +diff --git a/src/video/x11/SDL_x11dyn.c b/src/video/x11/SDL_x11dyn.c
> +index 4e549b3..a7e800e 100644
> +--- a/src/video/x11/SDL_x11dyn.c
> ++++ b/src/video/x11/SDL_x11dyn.c
>  @@ -109,6 +109,21 @@ char *(*pXGetICValues)(XIC, ...) =3D NULL;
>   #undef SDL_X11_SYM
>  =20
> @@ -53,8 +57,10 @@ Upstream-Status: Accepted
>   		if (SDL_X11_HAVE_BASEXLIB) {  /* all required symbols loaded. */
>   			SDL_ClearError();
>   		} else {
> ---- a/src/video/x11/SDL_x11sym.h=09
> -+++ a/src/video/x11/SDL_x11sym.h=09
> +diff --git a/src/video/x11/SDL_x11sym.h b/src/video/x11/SDL_x11sym.h
> +index 3dfa146..f1e7841 100644
> +--- a/src/video/x11/SDL_x11sym.h
> ++++ b/src/video/x11/SDL_x11sym.h
>  @@ -170,6 +170,12 @@ SDL_X11_SYM(void,_XRead32,(Display *dpy,register lo=
ng *data,long len),(dpy,data,
>   #endif
>  =20
> @@ -68,3 +74,6 @@ Upstream-Status: Accepted
>    * These only show up on some variants of Unix.
>    */
>   #if defined(__osf__)
> +--=20
> +1.7.2.5
> +
> --=20
> 1.7.2.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yrEcvySKR+fOA8iz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GpjQACgkQN1Ujt2V2gBxZ7gCfZ3ywJBvRvFwIIsqP4WjQfaVA
lFwAoIYnlvPPOp9FOJgJ6yJiMRf+H6qm
=gVPh
-----END PGP SIGNATURE-----

--yrEcvySKR+fOA8iz--

Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T75Yq-0004Vd-7P
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 16:17:32 +0200
Received: by bkcik5 with SMTP id ik5so847372bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tXP1hUS3nQLtgrWU7fS6bKpHKZ7N3NuE1zgDicJszhM=;
	b=edCRShq6To5uaR3eE3+iVUtZIDgYeo290NUrXgkl9MBBtkWLAC591QhvuxtLjngjSP
	mGOHLpFi4S+aKu21Ii0CFC0QQBNRgRnDP950Y7nAPHQtEJetx5PPv81iB9fOrQM9X87M
	mzdxN9F2001iTTpsfF/6GKCH8W3ep2fRiZVE7qB+M2LvNyMDbV49UroKSI3gIX9IkmUP
	XohAySWNulmHZtLjstdGzpwf2jr6BlLXwPkXM/Ixx+urxWsWvRg6fEVdRH3meF4qKyJD
	mS7LwllyMUeuUt5PXgYZ2eRag0XPukAufrw9DYgy329tYBfFClG5GQ2RO/5BMeuloGy3
	ZQMw==
Received: by 10.204.130.151 with SMTP id t23mr2894695bks.94.1346335516780;
	Thu, 30 Aug 2012 07:05:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm1424245bkx.9.2012.08.30.07.05.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 07:05:15 -0700 (PDT)
Date: Thu, 30 Aug 2012 16:05:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Marc Ferland <ferlandm@sonatest.com>
Message-ID: <20120830140532.GC31247@jama.jama.net>
References: <1346334862-18868-1-git-send-email-ferlandm@sonatest.com>
MIME-Version: 1.0
In-Reply-To: <1346334862-18868-1-git-send-email-ferlandm@sonatest.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysstat: Explicitly disable sensors support.
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
X-List-Received-Date: Thu, 30 Aug 2012 14:17:32 -0000
X-Groupsio-MsgNum: 28423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline

--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2012 at 09:54:22AM -0400, Marc Ferland wrote:
> Since no lmsensors recipe exists by default in oe-core, explicitly disable
> support for it in sysstat. In my case sysstat would fail linking complain=
ing
> about undefined references when adding my own lmsensors recipe.

Missing PR bump

>=20
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
> ---
>  meta/recipes-extended/sysstat/sysstat.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-ext=
ended/sysstat/sysstat.inc
> index 9da40a7..76c9252 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -9,6 +9,7 @@ SRC_URI =3D "http://pagesperso-orange.fr/sebastien.godard=
/sysstat-${PV}.tar.gz \
> =20
>  inherit autotools gettext
> =20
> +EXTRA_OECONF +=3D "--disable-sensors"
>  EXTRA_OEMAKE +=3D 'LFLAGS=3D""'
> =20
>  do_install() {
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA/cywACgkQN1Ujt2V2gBwDFQCbBv27aVNVpto2/ZVrAFHCAlLn
ruYAnRmlXhAFDP8RJlDmH8e64DIdAP5i
=1JF/
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--

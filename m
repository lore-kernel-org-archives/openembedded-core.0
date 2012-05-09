Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SS3Z6-0004Ln-UI
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 11:52:12 +0200
Received: by bkcjm2 with SMTP id jm2so63724bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 02:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zu18u+/D5qtzjhIyPHCbX3Xx2PuJO5/mHlrE18THC/I=;
	b=kkkbruFl39o+jMF9JlGsecrKBOv6owVOB9mPc6UmLzZau/fAeRR+uFHTqw+9NUNw3n
	HRmOe3x++OSuHW/T6NEM2plIWSb52TW5bPhwVOt5N3SpLCzKEw1xGtBAwwH1oxLaOf2E
	dWwUQZS80GZutWiOahVuGFnRzTC2jt6/guxcbZuExADmC/3nhWnlILfa8suzUNh0DhCQ
	Y8r1VVXy1yBy1ATBdihc3EV0sXyFcagO/NWo/tIo51CZg8AgNUSAHWsZZPODBjJRNm+n
	/mUZNSKpo8CxsdlE61uCMAvqEDwfl2x9DfoCuSjHbZAQhzZM0np0I5jbkTbCE/fkZRkj
	7YQQ==
Received: by 10.205.127.140 with SMTP id ha12mr7992931bkc.105.1336556540326;
	Wed, 09 May 2012 02:42:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id zx16sm3642406bkb.13.2012.05.09.02.42.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 02:42:19 -0700 (PDT)
Date: Wed, 9 May 2012 11:42:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120509094220.GA12898@jama.jama.net>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
	<339076a9cf1ef906416bd850e5825c3bb8521983.1336517492.git.raj.khem@gmail.com>
	<73C72AB1-C5B4-40D1-BAA3-C349F4957C42@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <73C72AB1-C5B4-40D1-BAA3-C349F4957C42@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/3] kmod: Update to .8 release
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
X-List-Received-Date: Wed, 09 May 2012 09:52:13 -0000
X-Groupsio-MsgNum: 21890
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 09, 2012 at 07:31:52AM +0200, Koen Kooi wrote:
>=20
> Op 9 mei 2012, om 00:53 heeft Khem Raj het volgende geschreven:
>=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-kernel/kmod/kmod.inc |    4 ++--
> > 1 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/km=
od/kmod.inc
> > index 681e52b..70d376e 100644
> > --- a/meta/recipes-kernel/kmod/kmod.inc
> > +++ b/meta/recipes-kernel/kmod/kmod.inc
> > @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
> > LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
> > LICENSE_libkmod =3D "LGPL-2.1+"
> > SECTION =3D "base"
> > -PV =3D "7+git${SRCREV}"
> > +PV =3D "8+git${SRCREV}"
>=20
> Drop the +git$SRCREV, it's a release.

Agreed, this should be=20
8+git${SRCPV}
or no +git at all.

But other than that, this patchset looks good:
Tested-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+qO/wACgkQN1Ujt2V2gBymCgCcCx2sQrRpwBoqX5/zQhRzK8No
+6AAoLqhR9r0PLbiplBZ7AXIJoAHxSr+
=AdHJ
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--

Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SXAmu-00043J-Iv
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 14:35:37 +0200
Received: by wibhm14 with SMTP id hm14so3981940wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=++xGnvQqcieePP/lYwIfnw2T2U7ZYVDV/oCn/DrCUn8=;
	b=ocbr6gtjRaK+OZK3/MOoFqrztKBvqFKNmE+EQgPCPl5w2uqioslEtokpT6qt+Vtycb
	H3IBQGVyw/8NFTfkphZe7Rn5tw4cRLtbYhPeEa/W9lQPzRmqDblspe+Rrwz6NeX6BoMD
	Ow3AI6nsMkPx4zX8uhpw5VxKrFyar7g1Nl3XxCkVN11IEd79kFA/vvoTAcUo76jxcTFz
	w1/YBNqmsUwv9ar7O6ZL6DkIT98z3JGk7MrTuBceZfnKfsqRkxt9vcgzspS83AmF25st
	HlZC68Rd5qNzUEV5CBhNYuuOA32bLVyqxRbZ8V8MY4MJ04fqCi3djGejEaD1OEKW2Bmn
	TR/Q==
Received: by 10.180.95.136 with SMTP id dk8mr598688wib.0.1337775926905;
	Wed, 23 May 2012 05:25:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gb9sm39869503wib.8.2012.05.23.05.25.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 05:25:25 -0700 (PDT)
Date: Wed, 23 May 2012 14:25:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120523122526.GC3995@jama.jama.net>
References: <1337775586-32611-1-git-send-email-s.stirtzel@googlemail.com>
	<CAGiJk9eMgQFSbrzL8a+ZevxQy2Bpqo75Jx4H8rQ9ff-H7J338A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9eMgQFSbrzL8a+ZevxQy2Bpqo75Jx4H8rQ9ff-H7J338A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] valgrind: Enable valgrind for omap3
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
X-List-Received-Date: Wed, 23 May 2012 12:35:38 -0000
X-Groupsio-MsgNum: 22549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline

--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2012 at 02:23:19PM +0200, Samuel Stirtzel wrote:
> 2012/5/23 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> > Valgrind supports the armv7 architecture, this patch allows users of th=
e omap3 soc family to build and use valgrind
> >
> > This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
> > * The test consisted of running valgrinds memcheck (memory leakage dete=
ction),
> > * and callgrind (profiling) on a Qt 4 application
> >
> > Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> > ---
> > =A0meta/recipes-devtools/valgrind/valgrind_3.7.0.bb | =A0 =A05 ++++-
> > =A01 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/re=
cipes-devtools/valgrind/valgrind_3.7.0.bb
> > index d7c7b24..0311d75 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> > @@ -22,14 +22,17 @@ SRC_URI =3D "http://www.valgrind.org/downloads/valg=
rind-${PV}.tar.bz2 \
> > =A0SRC_URI[md5sum] =3D "a855fda56edf05614f099dca316d1775"
> > =A0SRC_URI[sha256sum] =3D "5d62c0330f1481fe2c593249192fa68ff454c19c3434=
3978cc9ce91aa324cbf6"
> >
> > -COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
> > +COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
>=20
> Oops forgot to change this line back, v2 coming soon.
>=20
> > +COMPATIBLE_HOST_omap3 =3D 'arm.*-linux'
> >
> > =A0inherit autotools
> >
> > =A0EXTRA_OECONF =3D "--enable-tls"
> > +EXTRA_OECONF_omap3 =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi"

Why not for all armv7 machines?

Cheers,

> > =A0EXTRA_OEMAKE =3D "-w"
> > =A0PARALLEL_MAKE =3D ""
> >
> > =A0FILES_${PN}-dbg +=3D "${libdir}/${PN}/*/.debug/*"
> > =A0RRECOMMENDS_${PN}_powerpc +=3D "${TCLIBC}-dbg"
> > =A0RRECOMMENDS_${PN}_powerpc64 +=3D "${TCLIBC}-dbg"
> > +RRECOMMENDS_${PN}_omap3 +=3D "libc6-dbg"
> > \ No newline at end of file
> > --
> > 1.7.5.4
> >
>=20
>=20
>=20
> --=20
> Regards
> Samuel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+81zYACgkQN1Ujt2V2gBw/7QCdEGFx5nq5h9OLX39LqkI8iTtl
kNIAn3J8uApM3i39YR0lbxUTpUu59iyL
=bOPE
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--

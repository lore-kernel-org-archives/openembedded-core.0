Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RIKbQ-0007Vt-Lg
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 15:30:08 +0200
Received: by bkat8 with SMTP id t8so8364970bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bU6zzyMn05qPO4Ml63rjxMFN+K/JMDRecxJ4o8NStUY=;
	b=w+cu/MWnvu4sfiI1TqbDt5HaCcjA389CgtWR5FPigPIdu/Nu+xFAFrc3Ew1lvRUp4s
	+hMWWkqbdX7V4kKFadLQM6dBwhPA6Fn5BGsdFK1ZD4agA8XL/zn1sm6tOvPs9HsU1x3Z
	weQbZaUjwM5qf3vs2D/ugMmB1OsZolCdpJW78=
Received: by 10.204.152.68 with SMTP id f4mr16112257bkw.59.1319462651944;
	Mon, 24 Oct 2011 06:24:11 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	rc12sm23736270bkb.10.2011.10.24.06.24.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 06:24:11 -0700 (PDT)
Date: Mon, 24 Oct 2011 15:24:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111024132405.GB3602@jama.jama.net>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<6038b7e0961ca4aec70cc6de8adbc79567500e2b.1319394187.git.sgw@linux.intel.com>
	<1319462157.25011.1.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1319462157.25011.1.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 11/27] pulseaudio-0.9.23: inherit perlnative to work around build on host without XML/Parser.pm
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
X-List-Received-Date: Mon, 24 Oct 2011 13:30:08 -0000
X-Groupsio-MsgNum: 11512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2011 at 02:15:57PM +0100, Richard Purdie wrote:
> On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
> > From: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/=
meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > index 33f5e15..4ac2418 100644
> > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > @@ -4,7 +4,7 @@ PR =3D "r5"
> > =20
> >  DEPENDS +=3D "gdbm speex"
> > =20
> > -inherit gettext
> > +inherit gettext perlnative
>=20
> This doesn't look right. If we need xmlparser, we should state that in
> DEPENDS. If that is added to DEPENDS, I'm not sure we still need the
> inherit of perlnative?

Yes I've forgot to put it in DEPENDS, khem sent version where he is
adding this inherit and DEPENDs..

but both are needed and only work arounds because build is calling perl
(not env perl) and perlnative helps to put perl from perl-native before
perl from host in PATH.

Reported here:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/011323.=
html

And I've sent this as work around before I'll fill oe-core bug report or
someone updates it to 1.1 and maybe fix it too.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6lZvUACgkQN1Ujt2V2gBw4HACeLbCqUsYI+dyWoDjHmn+Dte/5
AO0AoJCenHVoKns3+SdSyK4SCDiEL2Lg
=51ba
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--

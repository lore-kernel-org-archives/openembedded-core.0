Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4VbN-0006ih-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 12:24:57 +0200
Received: by bke11 with SMTP id 11so5119832bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N3cDd1kSzvVE2GyNbJt+bgAIggvz0yH/fse85SOARps=;
	b=kqurMbrYLZ48k1JHqyu8Fk1O5Yj4rHCTWKb4Gqguufc8hT4P65m8DxzPcrFSstnEn9
	+KGPVnRVtgWUdainhXPZM1q1seYPKh9M6ve8/KzxugCJt36ehmJCvc/hKLW7w1rKo20S
	988R7Qu7I3WVlZ1QPhokhWARIGiyFvkdRAZPs=
Received: by 10.204.146.154 with SMTP id h26mr1558190bkv.368.1316168384342;
	Fri, 16 Sep 2011 03:19:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm5961562bkt.5.2011.09.16.03.19.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 03:19:43 -0700 (PDT)
Date: Fri, 16 Sep 2011 12:19:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110916101935.GG7445@jama.jama.net>
References: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
	<1316167797.25993.70.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1316167797.25993.70.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC 1/2] gstreamer: sync packaging with OE .dev
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
X-List-Received-Date: Fri, 16 Sep 2011 10:24:57 -0000
X-Groupsio-MsgNum: 9519
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline

--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 11:09:49AM +0100, Richard Purdie wrote:
> On Fri, 2011-09-16 at 10:20 +0200, Koen Kooi wrote:
> > some text here
>=20
> It took all my restraint to not just reply with:
> """
> NAK
>=20
> <insert reason for NAK here, I can't be bothered to type it>
> """
>=20
> We've been around in a few circles with this. The problem is that if we
> apply this patch we have no clue which gst-plugin from the good, the bad
> and the ugly provides something you're after to include in an image.
> This results in bitbake being pretty clueless about whether a given
> build will succeed or not. In general I'm not a fan of having
> non-deterministic builds as they tend to annoy users.
>=20
> If this position isn't acceptable then we'll probably have to move to a
> situation where we list which plugins each of the packages builds and
> drop the dyanmic provides. That is a maintenance pain and I don't take
> that step lightly but I don't see any other options. I'm open to
> suggestions though.

Something like:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031739.h=
tml
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031740.h=
tml
?

Regards,

>=20
> Cheers,
>=20
> Richard
>=20
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >  .../gstreamer/gst-plugins-package.inc              |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc =
b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> > index 796df14..dae9416 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> > +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> > @@ -6,8 +6,8 @@ python populate_packages_prepend () {
> >  	glibdir =3D bb.data.expand('${libdir}', d)
> > =20
> >  	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer =
%s library', extra_depends=3D'', allow_links=3DTrue)
> > -	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('$=
{PN}-%s', d), 'GStreamer plugin for %s', postinst=3Dpostinst, extra_depends=
=3Dbb.data.expand('${PN}',d))
> > -	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', bb.data.expand('=
${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_dep=
ends=3Dbb.data.expand('${PN}-dev',d))
> > +	do_split_packages(d, gst_libdir, '^libgst(.*)\.so$', 'gst-plugin-%s',=
 'GStreamer plugin for %s', postinst=3Dpostinst, extra_depends=3D'')
> > +	do_split_packages(d, gst_libdir, '^libgst(.*)\.l?a$', 'gst-plugin-%s-=
dev', 'GStreamer plugin for %s (development files)', extra_depends=3D'')
> >  =09
> >  	pn =3D bb.data.getVar('PN', d, 1)
> >  	metapkg =3D  pn + '-meta'
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5zIrcACgkQN1Ujt2V2gBypIwCfXDC4wj/z8jRP8ZjsU3zDBM3o
Bg0An2WFWqxLY9dj/lYcr7b77Vv2uTfv
=e3Uk
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--

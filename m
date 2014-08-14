Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id E7CD660424
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:31:37 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pi18so897099lab.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iYTnod9sVtifS/RG5zfOhAzn8vFkb0R3dVc5/teNh+o=;
	b=hcX8jEqs+ah3Yc8tuZj5YJnkBENwyr0weudCig5YZSA6+WqOaCLD0UiJHDz1F+UKus
	ZdvbfwhA+AIujRR4YXLQRTpYjHrL5HknP3Ed469snjvVOgzraWf7Mw6SVf/PNzNwP8ok
	4ZONPBuDUHj+ouRg6SPoAHZdMd5ZrLl1LMHNdr404jp6kHUfkOMKikYVVXTQadGpsK+5
	qz0F9vhA+yOTL8CrVWcE2Lc5mgoLiRKzaC/Qtuqpagcj7iOA4P9/K/IcRIKD2tE3j3kH
	9XqsGJ8aO7G840uBjAnwXU1pt3+FcOB+q+JVNJKXKenH+bTCaPb1RvQ21NndC5Fzaxsh
	rJMA==
X-Received: by 10.112.119.142 with SMTP id ku14mr4206157lbb.34.1408015897486; 
	Thu, 14 Aug 2014 04:31:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ue8sm2952603lac.31.2014.08.14.04.31.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 04:31:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 13:32:13 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140814113213.GI14848@jama>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
	<d77cfaf8b63e3dd1d7b05ff4b547b6a4a4fc6b47.1408005909.git.Qi.Chen@windriver.com>
	<20140814085432.GG14848@jama> <1408009147.22187.87.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1408009147.22187.87.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] systemd: add libdw to RDEPENDS
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
X-List-Received-Date: Thu, 14 Aug 2014 11:31:39 -0000
X-Groupsio-MsgNum: 56492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HnUrGTC8cx3b8/Hq"
Content-Disposition: inline

--HnUrGTC8cx3b8/Hq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 10:39:07AM +0100, Richard Purdie wrote:
> On Thu, 2014-08-14 at 10:54 +0200, Martin Jansa wrote:
> > On Thu, Aug 14, 2014 at 04:46:01PM +0800, Chen Qi wrote:
> > > Add libdw to RDEPENDS of systemd to avoid build-deps QA warning.
> > >=20
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  meta/recipes-core/systemd/systemd_215.bb |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-=
core/systemd/systemd_215.bb
> > > index 770787b..a52a042 100644
> > > --- a/meta/recipes-core/systemd/systemd_215.bb
> > > +++ b/meta/recipes-core/systemd/systemd_215.bb
> > > @@ -244,7 +244,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
> > >  FILES_${PN}-dbg +=3D "${rootlibdir}/.debug ${systemd_unitdir}/.debug=
 ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
> > >  FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1=
/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> > > =20
> > > -RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount udev (=3D ${EXTENDPK=
GV})"
> > > +RDEPENDS_${PN} +=3D "libdw kmod dbus util-linux-mount udev (=3D ${EX=
TENDPKGV})"
> >=20
> > Shouldn't it be build-time dependency?
> >=20
> > If it's detected from sysroot in do_configure then it has to be in
> > DEPENDS to get deterministic results.
>=20
> Right. Secondly, what benefit does this library bring us?

BTW: does someone know why libdw got picked by many components recenly
(something changed in last 2 days).

today's world build failed in gst-plugins-good_0.10.31.bb because of
missing libdw and there are at least 20 components autodetecting libdw
now:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.20140813_204024.lo=
g/qa.log

elfutils weren't changed recently, so it has to be something else

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HnUrGTC8cx3b8/Hq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPsnj0ACgkQN1Ujt2V2gBxJLwCgqQPcxAnSbczn8DI2+xkSuT9N
TaQAnR+aSEJiPnTFlEqoYF3lVgtBUvNr
=TOqO
-----END PGP SIGNATURE-----

--HnUrGTC8cx3b8/Hq--

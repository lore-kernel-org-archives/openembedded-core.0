Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAf1T-00087c-JE
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 11:13:36 +0100
Received: by wera1 with SMTP id a1so1662023wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mf8Cp0g/rAZdLFzDiH3sYWWFKutysLu1iXv6OI2aq3Y=;
	b=PkewgtbIv64R3RAkeNi4NIVV/PB00b4MxVeWjc9v2OQlTk1NNjlgAVpZvEbbquKOt5
	i0XckBAyRHPHkbcD7ZC6kXoxSh4/Xe7I1kfNrK6doG0IJTI5K6T+uZMti/FF4aRMckkg
	m/BF4nfBoHvg7TdtHBTxaqPaPaOAyXbDQ8wxRgJvO6ebYgEX+JwYefRnb+Sc6Z4MgFAT
	uGqQZdOGZJPs4jNLlGpqWOgv2d2wLcMgMyJtgX5RF0NbYBg4rlmP6/EYMNoRK4IuiW/P
	DCISGfOhtekQDe6iBQUjeyVJHX2a9f8w3n/MU9ok8CDrAGNWlCqa7sa/ak4Blk58ATl0
	VnAg==
Received: by 10.216.139.229 with SMTP id c79mr5100434wej.16.1332410680874;
	Thu, 22 Mar 2012 03:04:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm7011963wib.0.2012.03.22.03.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 03:04:40 -0700 (PDT)
Date: Thu, 22 Mar 2012 11:04:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120322100439.GF4010@jama.jama.net>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
	<f21ffad75e377042ebb9d59a01d6b424c6bba711.1332365336.git.Martin.Jansa@gmail.com>
	<1332371476.9740.218.camel@ted>
	<20120321235049.GA4010@jama.jama.net>
	<1332374564.9740.228.camel@ted>
	<20120322065113.GB4010@jama.jama.net>
	<1332409922.9740.235.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332409922.9740.235.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 06/13] gtk+: import native support from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 10:13:36 -0000
X-Groupsio-MsgNum: 19400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline

--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 09:52:02AM +0000, Richard Purdie wrote:
> On Thu, 2012-03-22 at 07:51 +0100, Martin Jansa wrote:
> > On Thu, Mar 22, 2012 at 12:02:44AM +0000, Richard Purdie wrote:
> > > On Thu, 2012-03-22 at 00:50 +0100, Martin Jansa wrote:
> > > > On Wed, Mar 21, 2012 at 11:11:16PM +0000, Richard Purdie wrote:
> > > > > On Wed, 2012-03-21 at 22:36 +0100, Martin Jansa wrote:
> > > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > > ---
> > > > > >  meta/recipes-gnome/gtk+/gtk+.inc |    4 ++++
> > > > > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > > > >=20
> > > > > I really don't like the message having a gtk+-native around sends=
 out.
> > > > > Why do we need this?
> > > >=20
> > > > See cover letter if you haven't already.
> > >=20
> > > Sorry, I'd looked at it but I'd missed the key bit. I think I thought
> > > the URL was a pull URL and my eyes skimmed it.
> >=20
> > No problem,
> >=20
> > > To be honest I don't think the update-icon-cache is good enough reason
> > > to build a full gtk+-native. If we let these pieces in the dependenci=
es
> > > have a tendency to grow and people have no incentive to try and fix
> > > these issues.
> >=20
> > Well agreed, but most of those natives are needed for librsvg-native
> > which in turn is used in navit build to generate icons (which I can
> > hardly replace with something thiner then librsvg and using e.g.
> > autodetected ksvgtopng from host is even worse for reproducible builds).
>=20
> librsvg-native I don't mind as much, I'm ok with taking those patches.
>=20
> > So for minimal gtk+-native I only need libx11-native and
> > libxrander-native, but the problem is that PACKAGECONFIG without that
> > fix ignores all -native depends and with fix it correctly adds -native
> > to all non-native deps added by PACKAGECONFIG
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/01934=
8.html
>=20
> Right, I'm aware of that issue and sorry for not responding yet.
> Basically, I wanted to do some proper patch review and write a
> reasonable response to it and I've been lacking the time to do so.
>=20
> Firstly, I agree we need to fix it there is no question of that. The
> patch moving everything to base.bbclass concerns me though, not least as
> it undoes a lot of the work I've been trying to do with regard to
> abstracting the bbclassextend code into lib/oe/*.py. I therefore think
> an alternative approach is going to be needed but I've not managed to
> come up with that yet :(.

Ah I haven't noticed lib/oe/classextend.py, well because it's not used in
native/nativesdk handler only in multilib.

> > > I'd like to better understand why there is no other way to avoid this.
> >=20
> > I can look into gtk+3 build what else we need to provide to be able to
> > build without --enable-gtk2-dependency or how to disable
> > update-icon-cache during build so that people with gtk+ installed on
> > host and without get the same result package, but I'm not really
> > interested in gtk+3 so I was just fixing another build failure :/ so it=
=20
> > can take some time...
>=20
> This is one case I think we need to do the right thing and not take
> short cuts. I don't mind the extends for librsvg-native but I don't want
> to take gtk+-native or pango-native and any of the the dependencies only
> they need.
>=20
> I also agree we need to fix PACKAGECONFIG but I don't like the direction
> the patch takes and haven't had time to come up with an alternative. I
> wish I had more time and was able to give a better reply.

OK I'll keep this locally to keep gtk+-native building (it's nicer than
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dshr&id=3D=
91890091cabbfe40705838ac787be898bae37805
work around) till you come up with better alternative.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9q+TcACgkQN1Ujt2V2gBw1kQCdGJNI2Zt5Z0fR+J5FHa3xPUVr
t5MAoLK7EmzF+oVNjZAqwPdLh7nbJppn
=OUOl
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--

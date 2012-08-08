Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sz5gZ-0003MJ-QZ
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:48:27 +0200
Received: by weyr6 with SMTP id r6so396065wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wx2gL1SMx7OowsVMTjxdu+e6d2b/m/kP9eTqIuPBDzk=;
	b=sP5gC2R2H/xICeaT5fIQbPHUvUiCxFrhOY+mfJetFdqcdVt2YvvH5LXrnqMdayUWrt
	I5gb9u0RtHXwunHjKe6U5MNb5x3FnOhqFz+I33kiFBaJrNoCwAVyfRN597YDyPyR3R+b
	+J+IpVkTvoeYPCiVvS9XyA3703pgFAtXns7LrEs1MuleVZABuKfZPbtXPPuhBKyjRfH0
	qk9XWJ/To+qQmwiHgApMOWlxyWMhKC+tULVz6vJ6dTRH45+Oextdhtqskecr0D8xBuJ5
	lFyJMo8zip2rHtpE/tOk51B3fieG6sYksYK65QJcqe+IbZ4Fd22mCir+pStw92djRLP0
	68/w==
Received: by 10.180.91.1 with SMTP id ca1mr2413294wib.8.1344429400738;
	Wed, 08 Aug 2012 05:36:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm4937330wib.2.2012.08.08.05.36.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 05:36:39 -0700 (PDT)
Date: Wed, 8 Aug 2012 14:36:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120808123637.GA2854@jama.jama.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<5995DE95-9135-4B8E-82BA-F0938B2D755F@dominion.thruhere.net>
	<1344428588.9756.333.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1344428588.9756.333.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 12:48:27 -0000
X-Groupsio-MsgNum: 27179
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 01:23:08PM +0100, Richard Purdie wrote:
> On Wed, 2012-08-08 at 12:01 +0200, Koen Kooi wrote:
> > Op 8 aug. 2012, om 10:41 heeft "Burton, Ross" <ross.burton@intel.com> h=
et volgende geschreven:
> >=20
> > > Hi,
> > >=20
> > > As everyone who's used it can attest, Web (the optional browser in
> > > Sato) is pretty rough.  Part of my plans about replacing Sato with a
> > > leaner environment involves replacing it with Midori, and if there
> > > isn't any disagreements I'll work on a submission to merge Midori into
> > > Sato now for everyone who expects the Sato web browser to be useful.
> > >=20
> > > This will involve pulling a few projects from meta-oe to oe-core:
> > > ca-certificates, python-docutils and vala specifically (although its
> > > possible that we can drop the vala dependency).
> >=20
> > Adding more stuff to oe-core is a bad idea. You should take this
> > opportunity to split all the sato stuff into its own layer.
>=20
> I feel very strongly that having a core layer with no way of
> demonstrating and testing it is a very bad idea. I haven't changed my
> mind about this and am very unlikely to. "How do you know it works?" is
> the question you ask about package upgrades for example.

And does it need to be in the same layer?

Why not test webkit-gtk from oe-core with midori from meta-oe layer?=20
Or meta-browser layer if meta-oe is too big for testing webkit-gtk.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAiXVUACgkQN1Ujt2V2gByXdgCeL/3+GDfafNdiZk39KH1HDn0f
zpgAoJBZuEds0DYLkfCuH88rVoJXLEKl
=uZMI
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

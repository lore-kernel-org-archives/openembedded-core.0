Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SB6ri-0006tA-7f
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:57:22 +0100
Received: by obqv19 with SMTP id v19so2674704obq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=itaKKfLtanq6/KDHKj/zkphx2GR4WyQt4mAOWwV/DWo=;
	b=P97CZrYLp5x/anO+E7TPNx4P3PdX6ByMaCEpk9XzS0HhXL/xqFY0m7K27v7DYx52jS
	ByfX10H0/QsB4/b0WLGDzPNCp2gY1yWm7dJsjSNlojKAs4XuwxJX6K8OI2XxGjQMGm7s
	I0QNxBw7NcHjk15VJfEEnEQpb+SG60Vp3/aTxtlOUCs+aWz9le9ybl0cA8W2xd9MdWFA
	UEz4lISKgMwUh+mYg9t9UxWcy189nu6Z4wCYUD9W0dOLcc+hnM3dSZLM6gBb6BX4WBCo
	tYPKp4O3qrhwZl6HEhCaOBkAsWNUYNBCo3sXZAnt1bKJNc8CPl8aelWe5Z+o6RpmXwf5
	o51w==
Received: by 10.182.172.100 with SMTP id bb4mr15472274obc.28.1332517705617;
	Fri, 23 Mar 2012 08:48:25 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id 8sm8051789obv.19.2012.03.23.08.48.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 08:48:24 -0700 (PDT)
Date: Fri, 23 Mar 2012 08:48:26 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323154826.GC9551@bill-the-cat>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<1332458784.9740.371.camel@ted> <20120322235342.GC13495@denix.org>
	<1332465264.9740.380.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332465264.9740.380.camel@ted>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 15:57:22 -0000
X-Groupsio-MsgNum: 19573
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline

--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 01:14:24AM +0000, Richard Purdie wrote:
> On Thu, 2012-03-22 at 19:53 -0400, Denys Dmytriyenko wrote:
> > On Thu, Mar 22, 2012 at 11:26:24PM +0000, Richard Purdie wrote:
> > > On Fri, 2012-03-09 at 14:39 -0700, Tom Rini wrote:
> > > > Hey all,
> > > >=20
> > > > Over in meta-ti I kicked off a discussion
> > > > (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779=
=2Ehtml)
> > > > about if we should be using '?=3D' or '+=3D' with IMAGE_FSTYPES in =
the
> > > > machine conf files.  This has been discussed a little bit before
> > > > (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/206=
0/focus=3D2061).
> > > >  The problem is we have the following and I believe ultimately
> > > > conflicting use cases:
> > >=20
> > > I've been under the impression that we decided upon:
> > >=20
> > > > - The machine needs to say 'I need or support the following formats'
> > >=20
> > > so the machine starts and sets:
> > >=20
> > > IMAGE_FSTYPES =3D "xxxx"
> > >=20
> > > > - The distro needs to say 'I always want format X'
> > >=20
> > > so the distro can do:
> > >=20
> > > IMAGE_FSTYPES +=3D " yyy"
> > >=20
> > > > - The user needs to say 'I know best, give me only format X'
> > >=20
> > > So the user can do:
> > >=20
> > > IMAGE_FSTYPES =3D "X"
> >
> > Since local.conf gets parsed before machine.conf and distro.conf, the u=
ser=20
> > needs to do this override:
> >=20
> > IMAGE_FSTYPES_local =3D "X"
> >=20
> > Otherwise machine.conf will always overwrite it with "xxxx" with its=20
> > unconditional assignment.
>=20
> Right, I'd forgotten that little detail :/.
>=20
> It actually makes me wonder if our include order is the right one but
> now isn't the time to try changing that.
>=20
> I agree the neatest way to change it is probably something like
> MACHINE_FSTYPES. I do worry a lot about backwards compatibility though
> and I'd also point out where we're at in the release cycle (bug fix
> only).

Well, one problem that would make this a bugfix is that no one does what
you say we agreed on today.  oe-core has qemu.inc using ?=3D, meta-intel
is using +=3D and meta-ti is mixed (which is what got this started).

--=20
Tom

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9sm0oACgkQdZngf2G4WwPwAACfR3GGojWOoAikRjf1EAj049KI
+eMAnRX2yMmeYRx97dy/DGEtynnO+Fna
=77/r
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--

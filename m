Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6nsT-0007MY-Mt
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 20:56:57 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so2159662eek.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 11:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=C+BfzFR13VC5+ptMwkf+dvbyZ/tHENQVU8wq0K9+RFs=;
	b=UU9hVFYKCk4Rn6TNMbJWxe1DqUhJsv1tcZHxq/ffP1/xJxiyjFPHtT5M5a+477Tkv/
	+nVqz5CgO3MAX03NfrH/aZ1ikaj39kgjPMoH6D10B1i9KRXuHvs1EgMON98T83PBELYW
	xLWYYbzghy0wgCp5NszaF3pnUTe9f8jic8tzggcQWwYCFtYGVYkYsmqoQvbVEpiVcc+V
	Pf2HPdtuUGDvTKT5H2ikTgme85MrhiAlPiDOqduPLcyFTK7oB+pAKrDJWP3tlzutrqG1
	Sb27+b0cLDCCGh7P7jfgMbKAzxcoEThWNGv/5D7U1C8rvyAnkviTRGW1N3NgvPweYEzz
	ewHQ==
X-Received: by 10.14.175.129 with SMTP id z1mr24079436eel.7.1361043648346;
	Sat, 16 Feb 2013 11:40:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm89961951eel.0.2013.02.16.11.40.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 11:40:47 -0800 (PST)
Date: Sat, 16 Feb 2013 20:40:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130216194055.GB3300@jama>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<lyhalcmpxd.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361018098.31795.33.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1361018098.31795.33.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sat, 16 Feb 2013 19:56:58 -0000
X-Groupsio-MsgNum: 35521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nm48CqPeykZpOG4/"
Content-Disposition: inline

--Nm48CqPeykZpOG4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 16, 2013 at 12:34:58PM +0000, Richard Purdie wrote:
> On Sat, 2013-02-16 at 12:57 +0100, Enrico Scholz wrote:
> > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> > >> it would be nice when the decision to make the init manager a distri=
bution
> > >> feature will be reverted to the old oe-meta mechanism.
> > >
> > > The trouble is that by making it an "image feature", people will
> > > expect *everything* to work properly and to be able to have fully
> > > functional sysvinit and systemd variants of images.
> >=20
> > I do not see an obvious reason why fully functional sysvinit, systemd a=
nd
> > perhaps upstart image variants based on the same distribution/package s=
et
> > are impossible.
> >=20
> > Of course, not "everything" will work.  But initmgr being a distribution
> > feature makes some things completely impossible.
> >
> > > We already see this expectation.
> >=20
> > IMO, removal of features just to lower expectations is the completely
> > wrong way.
>=20
> meta-oe earned a *horrendous* reputation because of the way systemd was
> implemented there. I believe (as do a number of others) that it has
> damaged OE's reputation and usability and actively hurts new users. Yes,
> the people who use systemd and meta-oe were happy. People who didn't
> want systemd were not. There continues to be a fairly toxic mix of
> distro policy mingled in with the recipes in there although good
> progress is being made in fixing that and I'm grateful to the people
> who've noticed and taken on that work (and done previous work like the
> separation of meta-systemd).

I was using sysvinit images even with systemd in meta-oe, setting 2
VIRTUAL_RUNTIME variables and 1 .bbappend was enough to keep sysvinit
images working.

I agree that we were missing documentation for that and new users
weren't able to figure it out for themselves.
=20
> It was clear systemd needed to move into the core but also become more
> configurable to work for everyone. I don't want to remove features, I do
> want to talk about whether there is a better way we can fulfil certain
> uses cases, particularly with a focus on usability.

I was talking with Ross about systemd as DISTRO_FEATURE, I agreed that
it's fine to have it as DISTRO_FEATURE but I didn't expect that it also
means that he wants to move PN-systemd to PN without upgrade path and
possibility to create image without PN-systemd packages.

My expectation was that systemd in DISTRO_FEATURES will enable
systemd.bbclass functionality (same functionality as
meta-systemd/system.bbclass had), not that it will force systemd and
only systemd.

Like with "3g" in DISTRO_FEATURES we expect that DISTRO supports 3g but
not that every possible image and MACHINE will provide 3g functionality.

I can imagine distribution with sysvinit+upstart+systemd in
DISTRO_FEATURES if they are careful enough to prepare images with only
right packages.

> > > Trying to explain to people what the limitations are, what is expected
> > > to work and what isn't will be difficult.
> >=20
> > OpenEmbedded is not an end-user distribution but for people who are
> > willing to invest some learning effort.  Trying to limit ourself on the
> > lowest common ground is not desirable imo.
>=20
> I did not say we're not going to support your use case. I'm asking if we
> can summarise exactly what the problem is and whether there is another
> way we can get there which isn't going to surprise as many people and be
> easier to use.
>=20
> I'm actually moderately annoyed that throughout the various discussions
> about systemd and how we'd get it into OE-Core nobody actually mentioned
> these specific requirements until very late in the implementation.

I think we all replied on first patch to move from PN-systemd to PN.
=20
> At the bare minimum, we actually need to document the usecases people
> are using and require. Yes, you know your usecase but you need to take
> some responsibility for ensuring its documented and known about else it
> will continue to get broken time and time again.
>=20
> > > For that reason I'd rather see this done in a different way, for
> > > example blacklisting the problematic systemd dependencies at image
> > > generation time with some kind of stronger BAD_RECOMMENDS code.
> >=20
> > Assuming we are able to break the hard dependencies, what is with packa=
ge
> > scripts which require programs, files or directories from these deps?  =
Do
> > we need a way to differ between good and bad script failures then?
>=20
> At the technical level there is little difference from packaging these
> things separately to avoid specific dependencies and explicitly telling
> the package manager to avoid that dependency instead.
>=20
> Equally there are other cases where people do want to break specific
> dependencies so this could help us in that area too.
>=20
> Perhaps there is a dependency we need to drop to a Recommends level,
> then use BAD_RECOMMENDS to handy that. We do need to document why we do
> that and how it is expected to be used.

I think the problem Enrico describes is that systemctl calls were
contained to PN-systemd postinst/prerm scripts, now with systemd support
moved from PN-systemd to PN you have to move postinst/prerm too and if
you allow runtime dependency on systemd package to be broken, then you
need to wrap each postinst/prerm script with check to see if e.g. systemctl=
=20
exists on target image.

> > Sounds extremely hacky and fragile...
>=20
> It depends on the implementation.
>=20
> Having initscripts in individual packages and having to play tricks to
> ensure the right sets of packages get installed is rather hacky and
> fragile.

Automatic RRECOMMENDS from systemd.class was working fine, only other
place where you needed to make sure all bits are in place was
packagegroup-core-boot.

I wasn't even using automatic RRECOMMEND but small packagegroup recipe
to pull only systemd support for packages where I wanted it. It was more
flexible and allowed me for example to install only ntpdate without
systemd support:

ntpdate works fine for people who wants to occasionally sync their time
ntpdate-systemd is better for people who want to sync on every boot

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nm48CqPeykZpOG4/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEf4McACgkQN1Ujt2V2gBzcNACfZuOABBuOnLNR+igiFgyOuseL
VsMAoKqZgN5KAH3bwI7P+e9Qh+kZEP//
=8pbF
-----END PGP SIGNATURE-----

--Nm48CqPeykZpOG4/--

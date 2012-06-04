Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SbUrB-0001dV-2b
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 12:50:16 +0200
Received: by bkcjm2 with SMTP id jm2so3592303bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b7tkKQvQhVu+cJsUAq4gJU18lYV3pFC/f+ynuFP5leA=;
	b=VCHQRR7VisPL1sPi8Euks6u4BwbqH6drnig0B8Phe32e3/gddMoYGNQy9AMF+T4gMU
	e9t9507NPByOuSSQDimSQd3jCQl1wWCQhDSlP1IhzDMdJK6hidgmYTMg5O7Hs5+089if
	NH+kEsx64z3hgj+b5xN/TFBh9VM5FZumP9j5ruZGE//GRFTII3pofj0iHQMAkg0imsuD
	X4bbGKG1gkPQbMeJufJttH25kgg0zy3e410IgcavKLGEOkdHHSZ8poHt8xb+e/YR8RA5
	xJp1ChdDQ84BK+IOg+67JQmGMFv7F/PPYiXixjq3UN50OZ/H6JgCNLKfXdgg81rBc4Pa
	c2Ww==
Received: by 10.204.13.82 with SMTP id b18mr6289114bka.32.1338806368511;
	Mon, 04 Jun 2012 03:39:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e20sm9830658bkv.10.2012.06.04.03.39.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 03:39:27 -0700 (PDT)
Date: Mon, 4 Jun 2012 12:39:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120604103941.GY3138@jama.jama.net>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
	<1338538650.20169.261.camel@ted>
	<D2B2A161-3B9C-49F3-B124-DE6CC9B1FFE0@dominion.thruhere.net>
	<1338544960.20169.267.camel@ted>
	<F47EBC71-EC1C-4E13-ABCD-82E8E364E187@dominion.thruhere.net>
	<4FCC806E.5070606@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FCC806E.5070606@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Mon, 04 Jun 2012 10:51:11 -0000
X-Groupsio-MsgNum: 23122
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yYeq/WQYi/kuVVbm"
Content-Disposition: inline

--yYeq/WQYi/kuVVbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2012 at 05:31:26PM +0800, Robert Yang wrote:
>=20
>=20
> On 06/01/2012 06:35 PM, Koen Kooi wrote:
> >
> > Op 1 jun. 2012, om 12:02 heeft Richard Purdie het volgende geschreven:
> >
> >> On Fri, 2012-06-01 at 11:04 +0200, Koen Kooi wrote:
> >>> Op 1 jun. 2012, om 10:17 heeft Richard Purdie het volgende geschreven:
> >>>
> >>>> On Thu, 2012-05-31 at 17:01 +0200, Koen Kooi wrote:
> >>>>> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:
> >>>>>
> >>>>>> There is a bug if we:
> >>>>>> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
> >>>>>> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
> >>>>>>
> >>>>>> Then several pkgs in deploy/ipk/i586 would be installed to crownba=
y's
> >>>>>> image even if there is one in deploy/ipk/core2 and we have set the
> >>>>>> core2's priority higher than i586, when the version in deploy/ipk/=
i586 is
> >>>>>> higher. This doesn't work for us, for example, what the crownbay n=
eed is
> >>>>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
> >>>>>
> >>>>> And this is working exactly as intended. Don't break opkg because y=
our
> >>>>> hardware driver situation sucks.
> >>>>>
> >>>>> So: NAK on this patch.
> >>>>
> >>>> I think we do have a problem here. For example, the system is ignori=
ng a
> >>>> PREFERRED_VERSION directive here
> >>>
> >>> A PREFERRED_VERSION set in a machine.conf, which is the wrong place.
> >>
> >> Its strongly not recommended. You can do it and if things are setup
> >> correctly, we do support machine specific alterations however...
> >>
> >>> Let's change the above build sequence to this:
> >>>
> >>> 1) MACHINE=3Dqemux86 bitbake xserver-xorg
> >>> 2) MACHINE=3Dothercore2machine bitbake xserver-xorg
> >>> 3) MACHINE=3Dcrownbay bitbake xserver-xorg
> >>>
> >>> Oh look, I get 1.11.2 on crownbay regardless of this patch.
> >>
> >> I've been assuming this xserver is marked as machine specific. If its
> >> not, that is a bug and we can fix that.
> >
> > the X server not machine specific and that is NOT a bug. The recipe for=
 the DDX only works with a specific X version. The real problem here is tha=
t xf86-video-something (again, not machine specific, think pci cards) has a=
 strict requirement on the x server version. This is now purely a DISTRO pr=
oblem. A few possible solutions are:
> >
> > 1) Lock X to 1.9.3 for all compatible x86 archs in your DISTRO
> > 2) Lock X to 1.11.2 for all compatible x86 archs in your DISTRO, live w=
ith the crownbay breakage
> > 3) Only use a package manager with no notion of compatible archs (dpkg)=
 or with strong version pinning (rpm)
> > 4) Be really careful with the build sequence and structure your feed co=
nfigs to not have compatible archs in their feed URIs
> > 5) remove 'x11' from DISTRO_FEATURES
> >
> > This is a point where you cannot make everybody happy. But as you say b=
elow, let's decouple the above problem from the arch vs version discussion.
> >
> >>>> by building one thing and then
> >>>> installing another. We're also inconsistent between the dpkg/rpm and
> >>>> opkg backends. There is therefore definitely some kind of user
> >>>> experience issue at stake here since this behaviour is not obvious,
> >>>> expected or particularly correct.
> >>>>
> >>>> The fact the example is hardware related is not particularly relevan=
t,
> >>>> its the bigger picture I worry about
> >>>
> >>> I also worry about the bigger picture, especially about what Martin
> >>> said about this breaking feeds.
> >>
> >> As far as I understood Martin's comments, this actually helps avoid so=
me
> >> of the issues he's been experiencing with feeds?
> >
> > No, it allows you to add a package-of-death. Example:
> >
> > broken-app_1.0_machine.ipk is in the feeds, being machine specific
> > broken-apps author fixes the machine specific bits properly
> > broken-app_2.0_i586.ipk hits the feeds and is not picked up.
>=20
> I think that the broken-app_2.0_i586.ipk came unexpectedly,
> there was a broken-app_1.0_machine.ipk (maybe also broken-app_1.0_i586.ip=
k,
> but it didn't matter), if it has been fixed to version 2.0, then there sh=
ould
> be also a broken-app_2.0_machine.ipk (and it would be picked up).

If broken-app developers are now detecting machine capabilities (or
whatever) since 2.0 in runtime, then we don't need to build broken-app
for every single machine we support, so changing PACKAGE_ARCH from
MACHINE_ARCH to TUNE_PKGARCH is right thing to do to save compile time
and feed disk space.

Same use-case broken by this patch reported here:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/023154.html

Cheers,

>=20
> // Robert
>=20
> >
> >> Martin has a problem where machines are ending up with unoptimised
> >> versions of code on them and it would be good to fix opkg behaviour to
> >> do what people expect...
> >
> > Yes, feed updates are not atomic, but this patch breaks moving packages=
 between archs like the broken-app example above. In angstrom a machine doe=
sn't see feeds with compatible archs at runtime, e.g. beagleboard sees beag=
leboard, armv7a and noarch URIs. This reduces these kind of problems to ima=
ges built with OE. I must note that this setup for feed URIs was done out o=
f bandwidth, storage and ram concerns (good old ipkg), not to avoid Martins=
 problems :)
> >
> > regards,
> >
> > Koen
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yYeq/WQYi/kuVVbm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/MkG0ACgkQN1Ujt2V2gBx1qACeOM4LnYmvUJs4MfPBYaGjkNI+
BZAAnjHmxteQCP6JDpUk+rqowVOfo83Z
=qzvU
-----END PGP SIGNATURE-----

--yYeq/WQYi/kuVVbm--

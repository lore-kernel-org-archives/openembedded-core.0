Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R6eze-0007eR-1w
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 10:50:54 +0200
Received: by bke11 with SMTP id 11so2641329bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+EQhEu3a94ZckIgLTpsYRaaZnUdY31oUhsXidRWhO7A=;
	b=VlkajSoUWv/KBJrGWr8Tjw8O+9aDopidJ1TRqlDwqBUx1ghm6UR10ZSBWpf7viBQOI
	RbiO8Zqo7i0MoSVy5AhifkDJowm2FzrTZCP7ZBcSpqpUXhE2sKqWay52SPw4ge9Lj1HY
	3av6m4JYI2TUo9p/A0pGXRQplipWQoXX7Czuo=
Received: by 10.204.139.18 with SMTP id c18mr1355745bku.35.1316681134794;
	Thu, 22 Sep 2011 01:45:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t18sm7474877bkb.9.2011.09.22.01.45.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 01:45:33 -0700 (PDT)
Date: Thu, 22 Sep 2011 10:45:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110922084526.GC3477@jama.jama.net>
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
	<30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
	<1316651210.13622.0.camel@ted>
	<A769990C-E69F-4882-B3B5-66048C9B5268@dominion.thruhere.net>
	<1316675047.2029.10.camel@ted>
	<CC6D993E-0C5B-4D42-BCB8-2C4C6E62EC77@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <CC6D993E-0C5B-4D42-BCB8-2C4C6E62EC77@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Thu, 22 Sep 2011 08:50:54 -0000
X-Groupsio-MsgNum: 9825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2011 at 10:28:02AM +0200, Koen Kooi wrote:
>=20
> Op 22 sep. 2011, om 09:03 heeft Richard Purdie het volgende geschreven:
>=20
> > On Thu, 2011-09-22 at 08:40 +0200, Koen Kooi wrote:
> >> Op 22 sep. 2011, om 02:26 heeft Richard Purdie het volgende geschreven:
> >>=20
> >>> On Wed, 2011-09-21 at 21:49 +0200, Koen Kooi wrote:
> >>>> Op 21 sep. 2011, om 21:43 heeft Mark Hatle het volgende geschreven:
> >>>>=20
> >>>>> On 9/21/11 2:38 PM, Philip Balister wrote:
> >>>>>> I'm finally trying to get started with oe-core. I'm using a setup=
=20
> >>>>>> created with the setup-script created by Koen. Everything looks ok=
 until=20
> >>>>>> it tried to build cpufrequtils. The recipe tries to fetch the sour=
ce=20
> >>>>>> from a git repo at kernel.org. Obviously, the fetch fails.
> >>>>>>=20
> >>>>>> What is odd, in the "good old days" I would expect this config to =
fall=20
> >>>>>> back and use the Angstrom source mirror, but apparently this is no=
t the=20
> >>>>>> case with oe-core.
> >>>>>>=20
> >>>>>> Is this a bug or a feature? If this is a bug, is there a plan to f=
ix it?=20
> >>>>>> If it is a feature, how are we supposed to do builds if servers go=
 away?=20
> >>>>>> What do we do about GPL compliance?
> >>>>>=20
> >>>>> This is a feature, as people did not want oe-core tied to a given m=
irror.
> >>>>=20
> >>>> This is the "OE core doesn't generate versioned git tarballs" problem
> >>>> people keep talking about. I know I can edit each and every recipe to
> >>>> add ';rebasable=3Dtrue', but I'd like a global solution before the G=
PL
> >>>> police starts looking at the angstrom source mirrors.
> >>>=20
> >>> Is this a versioned tarball problem or just the tarballs not being
> >>> generated at all?
> >>=20
> >> versioned tarball problem, since the source mirror won't overwrite
> >> files with the same name, so unversioned ones are both useless and
> >> bandwidth wasting.
> >=20
> > They seem to be working perfectly well for Yocto...
> >=20
> > They're also not bandwidth wasting
>=20
> They are, since for the kernel you need to re-upload the 300MB tarball to=
 the source mirror for mirroring to work, even if there were no real change=
s but bitbake repacked it. I know that versioned tarballs aren't terribly e=
fficient either, but at least they are deterministic.
>=20
> The angstrom source mirror checks for duplicate filenames to avoid introd=
ucing checksum changes due to upstream stupidity or corrupted downloads.=20
>=20
> > since the fetcher is efficient and
> > will incrementally update something that is incomplete.
>=20
> Which won't work currently since kernel.org is down.
>=20
> > Anyhow, this is the first time someone has explained that the mirror
> > tarball improvements that were made to bitbake have not done everything
> > they desire. If you want someone on the Yocto team to look at this I'd
> > suggest a bug report or I'll take patches to bitbake (as always).
>=20
> But you do acknowledge the problem? FWIW, I've been arguing for a global =
method of enabled versioned tarballs since I first started using oe-core (c=
alled differently back then). I know linux-yocto stretches the fetcher to i=
ts limits, but I'd like this change for all the recipes using a single git =
tree with a single srcrev.

FWIW: I would also like to have versioned git checkouts in fetcher2 as
it was in old fetcher. It would be more consitent with svn versioned
checkouts which are still created.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk569aYACgkQN1Ujt2V2gBy7qACgtyJ1Tp7JD6mrF2VXdp15xk3n
tfgAoItTXTWRlIRuqAf92QlLgMSw/SDz
=aI4o
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

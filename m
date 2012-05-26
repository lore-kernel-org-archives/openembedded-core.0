Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SYCNu-0008UH-P3
	for openembedded-core@lists.openembedded.org;
	Sat, 26 May 2012 10:30:02 +0200
Received: by wibhm14 with SMTP id hm14so185979wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 May 2012 01:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AuRaWi6sMlpg9fBMDtiORkPrwIKRkr7qhYkmj0SdDnQ=;
	b=ynihKXrgd/vFK2tbcay5IIa6vStdgxxOWitxpOYDGKf9HZd4GqoujgrwBeBW/vT+R0
	6mfXFDJKjG2vD2vFsAkZxdjnETjwmdCfrCVtY68ZMWGqDLx/CAmG+mhG2ndhY5NUdHQl
	Fgxp7F3t5+iyjeiZ8wP0xXOetEyHPpAoiNMtaRV1e4sbPEMuFtSk9NixPuDe3CfJz9ZH
	gwDBuNKYuJiuo67FbNgnDwFGwVaRgLHhvwUQgGt0kKSqTqwZ2Uwhx98Y9AzOUOUcncAt
	RkS4Jw9hlAZ+clVx8nANqbLPlwKqCoZp2aJ6CVvxhURjXvnOHLw/muHwJAC+QcnDWSh6
	g6FA==
Received: by 10.216.50.80 with SMTP id y58mr868927web.106.1338020389381;
	Sat, 26 May 2012 01:19:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gb9sm2907013wib.8.2012.05.26.01.19.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 26 May 2012 01:19:48 -0700 (PDT)
Date: Sat, 26 May 2012 10:19:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120526081953.GG3138@jama.jama.net>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
	<6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
	<20120525113057.GD3138@jama.jama.net>
	<4FC04443.1090708@windriver.com>
	<20120526062847.GF3138@jama.jama.net>
	<4FC0910D.8000007@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FC0910D.8000007@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 26 May 2012 08:30:02 -0000
X-Groupsio-MsgNum: 22837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1XWsVB21DFCvn2e8"
Content-Disposition: inline

--1XWsVB21DFCvn2e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 26, 2012 at 04:15:09PM +0800, Robert Yang wrote:
>=20
>=20
> On 05/26/2012 02:28 PM, Martin Jansa wrote:
> > On Sat, May 26, 2012 at 10:47:31AM +0800, Robert Yang wrote:
> >>
> >>
> >> On 05/25/2012 07:30 PM, Martin Jansa wrote:
> >>> On Fri, May 25, 2012 at 01:19:55PM +0200, Koen Kooi wrote:
> >>>>
> >>>> Op 25 mei 2012, om 12:02 heeft Robert Yang het volgende geschreven:
> >>>>
> >>>>> There is a bug if we:
> >>>>> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
> >>>>> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
> >>>>>
> >>>>> Then several pkgs in deploy/ipk/i586 would be installed to crownbay=
's
> >>>>> image even if there is one in deploy/ipk/core2 and we have set the
> >>>>> core2's priority higher than i586, when the version in deploy/ipk/i=
586 is
> >>>>> higher. This doesn't work for us, for example, what the crownbay ne=
ed is
> >>>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
> >>>>>
> >>>>> This is caused by opkg's selecting mechanism, if there are more tha=
n one
> >>>>> candidates which have the same pkg name in the candidate list, for
> >>>>> example, the same pkg with different versions, then it will use the=
 last
> >>>>> one which is the highest version in the list, this doesn't work for=
 us,
> >>>>> it should respect to the arch priorities in such a case.
> >>>>
> >>>> This is a serious break with the current opkg behaviour and I don't =
think it's an improvement. Needing different versions for non machine speci=
fic packages indicates a more serious bug elsewhere.
> >>>
> >>> It's not the same use-case as those 2 above, but what I don't like on
> >>
> >> Hi Martin,
> >>
> >> They are the same cases:-), I think that this patch has also fixed you=
r problem,
> >
> > No, at least not completely the same.
> >
> > I would prefer to upgrade foo-1.0-r1_armv4t temporary until
>=20
> I think it can upgrade foo-1.0-r1_armv4t temporarily, if ipk/armv7a is re=
moved
> from the repository, then it would not appear in the opkg.conf, and the a=
rmv7a
> should be the lowest priority and an unknown arch, and foo-1.0-r1_armv4t =
will
> win, and it would be installed.
>=20
> I simulated your environment:(with core2 and i586, core2 has a higher ver=
sion)
>=20
> 1) The foo-1.0_r1.core2 installed
>=20
> 2) Remove the core2 related lines from core-image-sato-1.0-r0/opkg.conf a=
nd=20
> core-image-sato-1.0-r0/rootfs/etc/opkg/arch.conf
>=20
> 3) opkg update && opkg upgrade (foo-1.0_r1.i586 upgraded)
>=20
> 4) Add the core2 related lines back to core-image-sato-1.0-r0/opkg.conf a=
nd=20
> core-image-sato-1.0-r0/rootfs/etc/opkg/arch.conf
>=20
> 5) opkg update && opkg upgrade (foo-1.0_r1.core2 upgraded)

Heh, yes of course you can upgrade it with manual aproach on target, but
try to explain it to end users who don't care about OE/opkg and they
just assume that "opkg update && opkg upgrade" does right job and
upgrades their image to newer consistent set of packages.

Cheers,

>=20
> // Robert
>=20
> > foo-1.0-r1_armv7a gets available in feed and that won't happen with your
> > patch AFAIK.
> >
> > with your patch:
> > If you have bar-1.0 which has to be MACHINE_ARCH and in 2.0 bar
> > developers find way to detect and use all machine capabilities in
> > runtime, recipe maintainer will switch to TUNE_ARCH, then
> > foo-1.0_nokia900.ipk won't be ever upgraded to foo-2.0_armv7a.ipk
> > and that's bad.
> >
> > Cheers,
> >
> >> the foo-1.0_armv7a will be kept now.
> >>
> >> // Robert
> >>
> >>> current opkg behaviour is that it doesn't "reinstall" the package with
> >>> the same version when it gets available in arch with higher priority.
> >>>
> >>> e.g. I have armv7a device which has feed urls for armv4t and armv7a
> >>> (armv7a of course with higher priority).
> >>>
> >>> foo-1.0 in both feeds armv4t armv7a
> >>>
> >>> opkg update&&   opkg install foo ->   foo-1.0_armv7a
> >>>
> >>> distro builder publish foo-1.0-r1 sofar only in armv4t feed
> >>>
> >>> opkg update&&   opkg upgrade ->   foo-1.0_armv7a is upgraded to foo-1=
=2E0-r1_armv4t)
> >>>
> >>> distro builder publish foo-1.0-r1 also to armv7a feed
> >>>
> >>> opkg update&&   opkg upgrade ->   nothing, but "upgrading" to foo-1.0=
-r1_armv7a) would be better
> >>>
> >>>
> >>> On my distro builder I'm trying to prevent this scenario by rsyncing
> >>> feeds only after build for *all* supported machines is completed, but
> >>> that's still not really atomic operation. (And later I've also started
> >>> to filter feeds which gets available on target image).
> >>>
> >>> Cheers,
> >>>
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1XWsVB21DFCvn2e8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/AkikACgkQN1Ujt2V2gBwIxgCfV9fvdXk/SCiCy4XjGiJ1qvI8
M3kAn1MI+CjEyWDBmy45zu8iFa8N6E4+
=6YaO
-----END PGP SIGNATURE-----

--1XWsVB21DFCvn2e8--

Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQJe9-00082k-AG
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 15:05:57 +0100
Received: by wwp14 with SMTP id 14so5660170wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 05:59:34 -0800 (PST)
Received: by 10.180.18.165 with SMTP id x5mr30498831wid.24.1321365574182;
	Tue, 15 Nov 2011 05:59:34 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z5sm14406672wix.5.2011.11.15.05.59.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 05:59:33 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 15 Nov 2011 14:59:25 +0100
In-Reply-To: <1321364620.26881.211.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321307338.26881.83.camel@ted>
	<20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
	<1822275.d3xp7880vj@helios>
	<64A64AAB-6921-4A47-99FD-26BD1C58D15C@dominion.thruhere.net>
	<1321364620.26881.211.camel@ted>
Message-Id: <543166F7-0EA0-47B3-A7E1-4EE932979710@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Tue, 15 Nov 2011 14:05:57 -0000
X-Groupsio-MsgNum: 12482
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AEA66DE5-C237-40D5-AD65-2B4D22FB87F5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_AEA66DE5-C237-40D5-AD65-2B4D22FB87F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 15 nov. 2011, om 14:43 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-11-15 at 13:15 +0100, Koen Kooi wrote:
>> Op 15 nov. 2011, om 12:44 heeft Paul Eggleton het volgende =
geschreven:
>>=20
>>> On Tuesday 15 November 2011 08:58:00 Koen Kooi wrote:
>>>> Let's move this to the TSC and see if we can get this crap removed. =
There is
>>>> already an existing ruling that USEFLAGS should be a last resort. =
I'm tired
>>>> of yocto-marketing feel good patches making life harder for people =
actually
>>>> using oe-core and its output.
>>>=20
>>> Marketing has nothing to do with it. All I really want is to fix the =
problem=20
>>> that the build blows up if you try to build any image for any of the =
qemu*=20
>>> machines with x11 removed from DISTRO_FEATURES.
>>=20
>> Isn't a better question "Why are all images for qemu machines forcing =
distcc to get built?"?
>=20
> Both questions are valid:
>=20
> a) If I build distcc and I have x11 disabled, it shouldn't break.
>=20
> b) Should qemu include distcc?
>=20
> Traditionally, qemu-config does pull it in. Why? The qemu scripts =
allow
> pass through of compilation to the build system instead of doing it
> under emulation for a significant speed up in compile time. It was
> originally felt that it should therefore maximally autoconfigure that
> stuff transparently to the user.
>=20
> If we don't think that is useful we can drop it. That is a separate
> discussion to a) which seems to be the contentious problem and solving
> b) is just hiding from the issue.
>=20
>> Or just make a seperate recipe for distccmon-gnome, that would avoid
>> the need of any USEFLAGS. Should be just a matter of require distcc_
>> $PV.bb ; EXTRA_OEOCONF =3D foo
>=20
> and the rest (resolving the various packaging conflicts so that
> distcc-gnome only packages the gnome pieces and removes everything
> else).
>=20
> To put this quite simply, I think there is no good reason we shouldn't
> use the mechanism we've selected to handle this kind of problem. We
> should have defaults the reflect backwards compatibility. Other than
> that where is the problem other than a general objection to
> PACKAGECONFIG?

It forces a choice when there is a solution where things can coexist.

regards,

Koen=

--Apple-Mail=_AEA66DE5-C237-40D5-AD65-2B4D22FB87F5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7CcD8ACgkQMkyGM64RGpFv8QCfefo+AbpFzoKPWG+kCxk7NJGc
o/UAn3tbLXaioUT8AiGYWmRAZ+zBxRYs
=Qivk
-----END PGP SIGNATURE-----

--Apple-Mail=_AEA66DE5-C237-40D5-AD65-2B4D22FB87F5--

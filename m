Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQKx3-00020G-RW
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 16:29:33 +0100
Received: by wwp14 with SMTP id 14so5790371wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 07:23:11 -0800 (PST)
Received: by 10.180.19.9 with SMTP id a9mr30749019wie.32.1321370591323;
	Tue, 15 Nov 2011 07:23:11 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	bl10sm14544130wib.15.2011.11.15.07.23.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 07:23:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 15 Nov 2011 16:23:07 +0100
In-Reply-To: <1321369973.26881.225.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321307338.26881.83.camel@ted>
	<20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
	<1822275.d3xp7880vj@helios>
	<64A64AAB-6921-4A47-99FD-26BD1C58D15C@dominion.thruhere.net>
	<1321364620.26881.211.camel@ted>
	<543166F7-0EA0-47B3-A7E1-4EE932979710@dominion.thruhere.net>
	<1321368170.26881.221.camel@ted>
	<0B9C45DF-86DC-4D1C-8D66-C59EB17C9D8C@dominion.thruhere.net>
	<1321369973.26881.225.camel@ted>
Message-Id: <2D41B4A3-F3EB-4AAB-8A68-FA67EE79F52F@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 15 Nov 2011 15:29:33 -0000
X-Groupsio-MsgNum: 12487
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F0C80161-2EEC-4FC6-9981-770689B89101";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F0C80161-2EEC-4FC6-9981-770689B89101
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 15 nov. 2011, om 16:12 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-11-15 at 15:55 +0100, Koen Kooi wrote:
>> Op 15 nov. 2011, om 15:42 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Tue, 2011-11-15 at 14:59 +0100, Koen Kooi wrote:
>>>> Op 15 nov. 2011, om 14:43 heeft Richard Purdie het volgende =
geschreven:
>>>>> To put this quite simply, I think there is no good reason we =
shouldn't
>>>>> use the mechanism we've selected to handle this kind of problem. =
We
>>>>> should have defaults the reflect backwards compatibility. Other =
than
>>>>> that where is the problem other than a general objection to
>>>>> PACKAGECONFIG?
>>>>=20
>>>> It forces a choice when there is a solution where things can =
coexist.
>>>=20
>>> There are multiple ways of coexisting and the configuration changing
>>> based on DISTRO_FEATURES doesn't force a choice either.
>>=20
>> It does force a choice, since you don't want to change =
DISTRO_FEATURES
>> when distributing binaries. If changing it is safe, then it isn't a
>> DISTRO_FEATURE.
>=20
> I'd expect a given distro to be able to figure out in advance whether =
it
> intends to have X11 or not?
>=20
> If unsure you leave it present...
>=20
> I really don't see the problem here.

The patch here doesn't use 'x11', but 'gui' as PACKAGECONFIG. Triggering =
on x11 is fine in this case.

regards,

Koen=

--Apple-Mail=_F0C80161-2EEC-4FC6-9981-770689B89101
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7Cg9wACgkQMkyGM64RGpE4QgCff1frn4+wiSgdjlxuGSy4Y5i8
t28An0SU6gqANRzoSiE+lu98HtQli001
=4KqH
-----END PGP SIGNATURE-----

--Apple-Mail=_F0C80161-2EEC-4FC6-9981-770689B89101--

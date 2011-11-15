Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQI1A-000536-E4
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 13:21:36 +0100
Received: by wyg8 with SMTP id 8so2587042wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 04:15:14 -0800 (PST)
Received: by 10.180.105.102 with SMTP id gl6mr29996170wib.46.1321359313985;
	Tue, 15 Nov 2011 04:15:13 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id i8sm14218343wie.11.2011.11.15.04.15.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 04:15:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1822275.d3xp7880vj@helios>
Date: Tue, 15 Nov 2011 13:15:06 +0100
Message-Id: <64A64AAB-6921-4A47-99FD-26BD1C58D15C@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321307338.26881.83.camel@ted>
	<20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
	<1822275.d3xp7880vj@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 15 Nov 2011 12:21:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 nov. 2011, om 12:44 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 15 November 2011 08:58:00 Koen Kooi wrote:
>> Let's move this to the TSC and see if we can get this crap removed. =
There is
>> already an existing ruling that USEFLAGS should be a last resort. I'm =
tired
>> of yocto-marketing feel good patches making life harder for people =
actually
>> using oe-core and its output.
>=20
> Marketing has nothing to do with it. All I really want is to fix the =
problem=20
> that the build blows up if you try to build any image for any of the =
qemu*=20
> machines with x11 removed from DISTRO_FEATURES.

Isn't a better question "Why are all images for qemu machines forcing =
distcc to get built?"?

> I think it would have been=20
> nice to also be able to avoid having to build gtk+ and everything it =
depends=20
> upon for all such images regardless of whether or not it is really =
needed, but=20
> I can live without making that further cleanup if it's going to cause =
such an=20
> uproar.
>=20
> If PACKAGE_CONFIG is not an acceptable solution to this problem I'll =
accept=20
> checking for x11 in DISTRO_FEATURES alone, if that's what it takes to =
get the=20
> real problem fixed.

Or just make a seperate recipe for distccmon-gnome, that would avoid the =
need of any USEFLAGS. Should be just a matter of require distcc_$PV.bb ; =
EXTRA_OEOCONF =3D foo

regards,

Koen





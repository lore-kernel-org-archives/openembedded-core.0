Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW8nH-0002p7-92
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 16:43:27 +0100
Received: by eekc1 with SMTP id c1so1333691eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 07:36:45 -0800 (PST)
Received: by 10.14.14.73 with SMTP id c49mr526252eec.57.1322753805706;
	Thu, 01 Dec 2011 07:36:45 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 8sm18672009ees.2.2011.12.01.07.36.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 07:36:45 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 16:36:40 +0100
In-Reply-To: <20111201131337.GG19917@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<1322744558.17484.126.camel@ted>
	<20111201131337.GG19917@jama.jama.net>
Message-Id: <D4AB0008-1471-4985-A04B-0394F28EB3E7@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 15:43:27 -0000
X-Groupsio-MsgNum: 13449
Content-Type: multipart/signed;
	boundary="Apple-Mail=_05310E24-6101-447E-8834-9252133DFF12";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_05310E24-6101-447E-8834-9252133DFF12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 14:13 heeft Martin Jansa het volgende geschreven:

> On Thu, Dec 01, 2011 at 01:02:38PM +0000, Richard Purdie wrote:
>> On Thu, 2011-12-01 at 10:59 -0200, Otavio Salvador wrote:
>>> On Thu, Dec 1, 2011 at 10:37, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>        On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
>>>> A while back I've proposed to make .bbappend without
>>>        corresponding .bb
>>>> only big fat warning, but not fatal to parse. Now you cannot
>>>        even build
>>>> eglibc if there is libdrm bbappend you don't care at all
>>>        about..
>>>=20
>>>=20
>>>        You can do this by setting:
>>>=20
>>>        BB_DANGLINGAPPENDS_WARNONLY
>=20
> Good to know, thanks.
>=20
>>> This is even worse; you end up with a package without the changes =
done
>>> on the bbappend and as most bbappend files do not change PR, adding =
it
>>> later won't force a package update.
>>=20
>> Which is why its off by default. My point is you can do with Martin =
is
>> suggesting, its just not without its drawbacks.
>=20
> I think the main advantage of this is that you're allowed to build =
stuff
> which doesn't use those dangling appends. Ie start build of eglibc if
> you know that nothing is bbappending to eglibc and to its dependency
> tree. And when .bbaappends are fixed you can disable
> BB_DANGLINGAPPENDS_WARNONLY and build the rest.
>=20
> But waiting for _all_ recipes in _all_ layers to get their .bbappends
> right can sometimes a bit long..

Which is why I sent this proposal, to give slow layers like meta-intel =
time to fix their stuff without breaking everyones build for 2 days till =
RP gets fed up and fixes it himself.
I don't have the time to maintain forks of every layer like you do with =
SHR and frankly speaking, it shouldn't be needed. I understand that =
things like review cycles take some time which is why the proposal tries =
to workaround the delays in layers in OE-core itself instead of angrily =
demanding maintainers to act quicker.

regards,

Koen=

--Apple-Mail=_05310E24-6101-447E-8834-9252133DFF12
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XnwoACgkQMkyGM64RGpEEmACaAja9wkr/5QYK7K72j1RJyWXq
DC0AoKrMHuy8LWsA+KiUwt6xY4NcGcVN
=KRaM
-----END PGP SIGNATURE-----

--Apple-Mail=_05310E24-6101-447E-8834-9252133DFF12--

Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1RQE0P-0005mn-KW; Tue, 15 Nov 2011 09:04:33 +0100
Received: by wwp14 with SMTP id 14so5210913wwp.24
	for <multiple recipients>; Mon, 14 Nov 2011 23:58:11 -0800 (PST)
Received: by 10.216.177.134 with SMTP id d6mr1814915wem.16.1321343891213;
	Mon, 14 Nov 2011 23:58:11 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eu16sm27882337wbb.7.2011.11.14.23.58.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 23:58:10 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321307338.26881.83.camel@ted>
Date: Tue, 15 Nov 2011 08:58:00 +0100
Message-Id: <20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
	<E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
	<1321303197.26881.74.camel@ted>
	<22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
	<1321307338.26881.83.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: tsc@lists.openembedded.org
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
X-List-Received-Date: Tue, 15 Nov 2011 08:04:33 -0000
X-Groupsio-MsgNum: 12466
Content-Type: multipart/signed;
	boundary="Apple-Mail=_924FD739-A688-4EDE-A108-D84FD7F72ED4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_924FD739-A688-4EDE-A108-D84FD7F72ED4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 14 nov. 2011, om 22:48 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-11-14 at 21:55 +0100, Koen Kooi wrote:
>> Op 14 nov. 2011, om 21:39 heeft Richard Purdie het volgende =
geschreven:
>>> On Mon, 2011-11-14 at 20:17 +0100, Koen Kooi wrote:
>>>> I think splitting distccmon-gnome into a seperate recipe is a =
better idea.
>>>=20
>>> I think that makes sense in some cases but I'd hate for it to become =
the
>>> default approach for issues like this as the duplication of code,
>>> parsing and build time etc. grate on me. Do we really need separate
>>> recipes?
>>=20
>> I think for this case, yes. And I'll happily trade needing extra
>> buildtime for not needing USEFLAGS.
>>=20
> The proposals for alternative recipes for the different combinations =
got
> voted down and PACKAGECONFIG was the preferred solution. I can't say I
> personally like everything about the outcome. I do however understand
> why we've ended up in that position and don't intend to undermine the
> usefulness of it.
>=20
>>> I'll probably take this patch as it improves the situation IMO (and
>> is
>>> easy to change the configuration from a distro config if anyone does
>>> have an issue with it being disabled).
>>=20
>> This patch changes the default behaviour in a way that distros need =
to
>> update their configs in order to keep the status quo. I know I use
>> distccmon-gnome on my boards, but will I remember 2 months from now
>> that this patch went in? I asked this before in a different context,
>> but I'll ask again: do you expect distro maintainers to vet each and
>> every commit that goes into OE-core to find out when default got
>> (silently) changed?
>>=20
>> USEFLAGS should be a last resort when having seperate recipes doesn't
>> work out, not a default cure.=20
>=20
> The discussion and decision went against this, rightly or wrongly
> PACKAGECONFIG is here and we should start to use it. In some cases it
> will help you a lot, in others it will cause you a bit more work. Such
> is life.

Let's move this to the TSC and see if we can get this crap removed. =
There is already an existing ruling that USEFLAGS should be a last =
resort. I'm tired of yocto-marketing feel good patches making life =
harder for people actually using oe-core and its output.







--Apple-Mail=_924FD739-A688-4EDE-A108-D84FD7F72ED4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7CG48ACgkQMkyGM64RGpEecQCfbpVXYJpjdEO/pyKOlFiJfHEy
QsUAnA2n9z4PPiHrAoL6DqjqGvH1rzQy
=1sMo
-----END PGP SIGNATURE-----

--Apple-Mail=_924FD739-A688-4EDE-A108-D84FD7F72ED4--

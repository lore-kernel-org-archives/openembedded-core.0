Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW9DU-0004Co-Aj
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:10:33 +0100
Received: by eaad13 with SMTP id d13so2372676eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 08:03:50 -0800 (PST)
Received: by 10.213.22.65 with SMTP id m1mr591867ebb.121.1322755430286;
	Thu, 01 Dec 2011 08:03:50 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z54sm18876715eeh.5.2011.12.01.08.03.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 08:03:49 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 17:03:43 +0100
In-Reply-To: <20111201155647.GC32202@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<1322744558.17484.126.camel@ted>
	<20111201131337.GG19917@jama.jama.net>
	<D4AB0008-1471-4985-A04B-0394F28EB3E7@dominion.thruhere.net>
	<20111201155647.GC32202@jama.jama.net>
Message-Id: <FAF01080-A1DF-4862-AE4F-182BD2507D89@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 01 Dec 2011 16:10:33 -0000
X-Groupsio-MsgNum: 13456
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B2B39196-B532-4379-A25D-68186675CB1C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B2B39196-B532-4379-A25D-68186675CB1C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 16:56 heeft Martin Jansa het volgende geschreven:

> On Thu, Dec 01, 2011 at 04:36:40PM +0100, Koen Kooi wrote:
>>=20
>> Op 1 dec. 2011, om 14:13 heeft Martin Jansa het volgende geschreven:
>>=20
>>> On Thu, Dec 01, 2011 at 01:02:38PM +0000, Richard Purdie wrote:
>>>> On Thu, 2011-12-01 at 10:59 -0200, Otavio Salvador wrote:
>>>>> On Thu, Dec 1, 2011 at 10:37, Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>       On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
>>>>>> A while back I've proposed to make .bbappend without
>>>>>       corresponding .bb
>>>>>> only big fat warning, but not fatal to parse. Now you cannot
>>>>>       even build
>>>>>> eglibc if there is libdrm bbappend you don't care at all
>>>>>       about..
>>>>>=20
>>>>>=20
>>>>>       You can do this by setting:
>>>>>=20
>>>>>       BB_DANGLINGAPPENDS_WARNONLY
>>>=20
>>> Good to know, thanks.
>>>=20
>>>>> This is even worse; you end up with a package without the changes =
done
>>>>> on the bbappend and as most bbappend files do not change PR, =
adding it
>>>>> later won't force a package update.
>>>>=20
>>>> Which is why its off by default. My point is you can do with Martin =
is
>>>> suggesting, its just not without its drawbacks.
>>>=20
>>> I think the main advantage of this is that you're allowed to build =
stuff
>>> which doesn't use those dangling appends. Ie start build of eglibc =
if
>>> you know that nothing is bbappending to eglibc and to its dependency
>>> tree. And when .bbaappends are fixed you can disable
>>> BB_DANGLINGAPPENDS_WARNONLY and build the rest.
>>>=20
>>> But waiting for _all_ recipes in _all_ layers to get their =
.bbappends
>>> right can sometimes a bit long..
>>=20
>> Which is why I sent this proposal, to give slow layers like =
meta-intel time to fix their stuff without breaking everyones build for =
2 days till RP gets fed up and fixes it himself.
>> I don't have the time to maintain forks of every layer like you do =
with SHR and frankly speaking, it shouldn't be needed. I understand that =
things like review cycles take some time which is why the proposal tries =
to workaround the delays in layers in OE-core itself instead of angrily =
demanding maintainers to act quicker.
>=20
> But the problem is that we cannot even push newer .bbappend in =
advance,
> I would be happy to push libdrm-2.4.27.bbappend to master branch if it
> doesn't break my builds which were still on 2.4.26.

I thnk that either

a) becomes a matter of PREFERRED_VERSION of your distro
b) DEFAULT_PREFERENCE =3D -1 for the update in the grace period.

> Would be nice to be able to push danglings bbappends for stuff which =
is
> only sitting on ML for review just in case I'll be at daywork or on
> holidays or whatever when it gets applied to ie oe-core and someone =
just
> hits update button..

Which is where the grace period comes in :)

> I think the problem is not with *big* layers like oe-core and meta-oe
> where is only 1 main maintainer but at least having full time job
> related to maintaining it. But to maintain some hobbyist or community
> layer in general in free time is sometimes pretty demanding just to =
stay
> compatible with the rest of world (not breaking the rest of world if
> they just want some BSP layer available from it). I wouldn't be
> surprised if meta-smartphone BSP layers get disabled in layerman next
> time I leave for month long holiday...

That's an unfortunate side effect of having a low busfactor. I'll put =
that in the "shit happens" bin. The proposal won't fix every breakage, =
but it would make all our lives a lot easier for most upgrades.

Maybe after a while we'll realize that tracking OE-core is too painfull =
with a full set of slow layers, but I'd like to try this proposal first =
before giving up[1].

regards,

Koen

[1] Translation: I'm too lazy to add an automated 'lock layer' button to =
layerman right now=20=

--Apple-Mail=_B2B39196-B532-4379-A25D-68186675CB1C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XpWIACgkQMkyGM64RGpEPOgCfWSNhEnqZmfQacB3UILRqKDE/
dKoAn1DcleMlAVSuUIs/A4D/JOtPqeUx
=7XvW
-----END PGP SIGNATURE-----

--Apple-Mail=_B2B39196-B532-4379-A25D-68186675CB1C--

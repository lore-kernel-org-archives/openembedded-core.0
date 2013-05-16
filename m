Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ucrsv-0001lH-Ga
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 08:41:53 +0200
Received: by mail-ea0-f180.google.com with SMTP id g10so1484510eak.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 23:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=0J+TbfGjSdM6+m63rlyvlE1UiDzGpp6lURSgsBs1Eoo=;
	b=RjsuPrfO3pj/IebR0lMlGgasDp0L8ZqrATpASc7VuEwQho3ayN8K/AUZf+Vup4XQaq
	oPCvL3voqX/IrQI9yORY5qzQLevPMyJKE0tp6PiTQHko4z/aQ3LjPpmJ8To24tx9gjeg
	5NYaP9vNuHEB+/4e2P38x7XtNT9DFgnTB2M8uq8K4SRuAfPj55sFRyPxN6fiH8By616L
	gFasBO+pLsPAijKfgjgjFIAIVcoRjZ5O4z3uq85dvPk++D3un/F2+xGjPeWHF5bNxzoX
	0At1eJFLE/u//BO+xsa8yWPltpUhGg7wtgM78L2Hbi7Qa4BqTodrnXPmO5JrJyBVqagZ
	BX3g==
X-Received: by 10.15.23.133 with SMTP id h5mr112923489eeu.12.1368685419444;
	Wed, 15 May 2013 23:23:39 -0700 (PDT)
Received: from ?IPv6:2001:610:612::95c9:88e3:5cd0:95f8?
	([2001:610:612:0:95c9:88e3:5cd0:95f8])
	by mx.google.com with ESMTPSA id x41sm8380634eey.17.2013.05.15.23.23.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 23:23:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1368650024.18324.102.camel@ted>
Date: Thu, 16 May 2013 08:23:35 +0200
Message-Id: <E8F9ED28-58F5-422C-8B07-ACD8791202A1@dominion.thruhere.net>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmQbAzlxwuG5SV4g+KST3QL806WxdylANT6OnV+A7+kBhl6Ei4EQjcGFGSktWe6Jzfs01PE
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 06:41:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 mei 2013, om 22:33 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Tue, 2013-05-14 at 09:36 +0200, Koen Kooi wrote:
>> To avoid things like that in the future I have a few recommendations
>> I'd like to get feedback on:
>=20
> In future can we please discuss this on the oe-core list or at least
> give a heads up there as this is pretty key to the core of the project
> and we've implicitly agreed to discuss architecture there? I =
appreciate
> this affects oe-devel layer maintainers too.

I meant to send it to oe-core, but I didn't check autocomplete. Anyway, =
seems I reached the people I wanted to reach :)

>=20
>> 1) For a given BSP split it in multiple layers:
>> 	a) One 'core' BSP layer with only:
>> 		o Bootloader
>> 		o Kernel
>> 		o Tooling to build bootloader/kernel/image
>> 	b) One BSP layer with bbappends for shadow/netbase/xorg-conf/etc
>> 	c) One or more layers with bbappends for libav/clutter/etc[2]
>=20
> You're missing d) which would presumably be everything not in a-c) =
e.g.
> binary graphics libs which aren't bbappends.

I'd group those with c)

> I have a feeling this will break more than it solves so I'm not keen =
on
> this and I think we need to dig deeper into the problem and find a
> better solution.

>>=20
>> 2) *Never* use PRINC in type b) bbappends
>> 3) Avoid PRINC in general
>=20
> Could we undergo some mass purge of PRINC from master branches and =
then
> change the PR values once and for all in the core recipes? We could =
make
> PRINC throw a bb.fatal() from that point onwards.

That would be nice.

>=20
>> 4) make buildhistory.bbclass mandatory in OE-core
>=20
> and force enable the PR backwards check?

Yes

> Again, I think the people
> you're trying to target to fix these issues are also the people who'd
> probably not have the history around to see the issues that most =
bother
> you.

True, but they'd have less plausible deniability :)

> I agree there are some issues here but I think we're going to need a
> more creative fix.
>=20
> My personal view is we need to reduce the number of bbappends. One way
> to do this is to make a general/central bsp-files type recipe which
> generates all the standard packages (tscalibration data, xorg config =
and
> all the other single machine specific config files).
>=20
> Yes, this would be a disruptive change but it would significantly =
clean
> up the BSP layers and hopefully make maintenance easier. It is on the
> Yocto project proposed features list although we've only got the idea,
> we haven't discussed with the community etc. Now would see as good a
> time as any.
>=20
>> There's another use case that suffers from PRINC problems and that is
>> removing layers when they break parsing and the maintainer is slow to
>> push patches. With the current situation I have to choose between
>> "being able to do builds" and "having working feeds".
>=20
> We have talked about a version wildcard for bbappend. You are still at
> the mercy of what the bbappend does though (e.g. when I include
> meta-raspberrypi, it changes the psplash logo, regardless of whether =
I'm
> building for the pi).
>=20
> In many ways the bbappend is too easy and encourages anti-social
> behaviour.

The funny thing is that I've run into bb(appends) trying to be social =
and breaking things, e.g.

linux-yocto.bbappend:

SRC_URI =3D "git://foo"
SRCREV_mymachine =3D "1849032784092359023"
ANOTHER_VAR_mymachine =3D "meta"

And that breaks parsing for every machine that isn't named "mymachine".=20=


> I would recommend bouncing meta-rpi as being non yocto
> project compatible due to the psplash issue if it were to apply which =
it
> has not.
>=20
>> During the last TSC meeting we discussed that there is currently no
>> way to force maintainers to behave. I think the most we can do is =
have
>> clear guidelines on the OE side and enforce those during the "Yocto
>> Project Compatible" process.=20
>=20
> How many layers apply for that status though?

Ideally all of them.

regards,

Koen

>> And have the layer index orange/red flag layers that do stupid =
things.
>> Come to think of it, that would actually be the most visible way to
>> go, having wikipedia style warning banners on the offending layers.
>=20
> I think Paul had good feedback here.
>=20
>> [1] It always happens after editing bblayers.conf and dragging in
>> major update to layers. Since I tend to do both at the same time I
>> can't say which action triggers it or if it's the combination.
>> [2] I spent 3 days trying to figure out why mesa was so *$(*$(@ =
broken
>> before I finally located the bbappends in meta-ti that were causing
>> this breakage
>=20
> I do appreciate understanding where some of the problem arises from,
> thanks!
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




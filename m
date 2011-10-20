Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGvVg-00038U-Ar
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 18:30:24 +0200
Received: by eyd9 with SMTP id 9so3016500eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 09:24:28 -0700 (PDT)
Received: by 10.213.32.78 with SMTP id b14mr1500608ebd.41.1319127868571;
	Thu, 20 Oct 2011 09:24:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f16sm26969813eec.8.2011.10.20.09.24.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 09:24:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319126135.2410.51.camel@ted>
Date: Thu, 20 Oct 2011 18:24:20 +0200
Message-Id: <3201B6F2-5E3A-4087-A023-2A7C688452E6@dominion.thruhere.net>
References: <9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop>
	<4E9F018D.7030703@intel.com>
	<CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
	<4E9F0CCF.3070404@intel.com>
	<CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
	<CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
	<4E9F5E5A.6040002@intel.com> <1319120752.2410.34.camel@ted>
	<20111020143631.GJ3522@jama.jama.net>
	<1319126135.2410.51.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Thu, 20 Oct 2011 16:30:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 17:55 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-10-20 at 16:36 +0200, Martin Jansa wrote:
>> On Thu, Oct 20, 2011 at 03:25:52PM +0100, Richard Purdie wrote:
>>> On Wed, 2011-10-19 at 16:33 -0700, Saul Wold wrote:
>>>> On 10/19/2011 12:00 PM, Otavio Salvador wrote:
>>>>> On Wed, Oct 19, 2011 at 16:30, Khem Raj<raj.khem@gmail.com>  =
wrote:
>>>>> ...
>>>>>>>>> Many upstreams we can't track if updates are required =
automagically, so
>>>>>>>>> we
>>>>>>>>> need a place to record when the last manual check was, also =
possible
>>>>>>>>> reasons
>>>>>>>>> why we should not update to newer versions, ...
>>>>>>=20
>>>>>> hmm manual check means it has to be done manually is there any =
thing
>>>>>> that needs it ?
>>>>>>=20
>>>>>> I think unless they are distro specific which seems not since =
they are
>>>>>> in oe-core
>>>>>> they could exist in recipes  thats my opinion.
>>>>>=20
>>>>> I agree that this should be put into the recipes. Besides this =
allows
>>>>> for checking if it was updated when the version has been updated.
>>>>>=20
>>>>> If done right, when updating the version this data will be updated
>>>>> together. I see no change in the amount of changes.
>>>>>=20
>>>>> A plus of this choice is it will be more difficult to forget to =
update
>>>>> that info. This happened in last qt update for an example.
>>>>>=20
>>>>=20
>>>> This may need to be something that the TSC brings up, possibly we =
can=20
>>>> talk about it in Prague next week.
>>>=20
>>> So just to give some background here, the information in those files =
was
>>> added by Yocto people to give some idea of the update status of =
various
>>> recipes. This included when the version was last checked/updated for
>>> recipes which we can't automate that process for, when certain =
cleanup
>>> checks were made, what the general state of the recipe was and who =
on
>>> the Yocto team was specifically looking after given recipes.
>>>=20
>>> When it was discussed, some of it was Yocto specific, some of it =
wasn't
>>> and popular opinion was against it going into the recipes =
themselves. I
>>> was ok with that given we have the pn- overrides and can handle the
>>> problem that way just fine.
>>>=20
>>> OE-Core happened and we kept the data with OE-Core at least for now. =
We
>>> have several options:
>>>=20
>>> a) Keep the data where it is
>>> b) Merge the data into the recipes
>>> c) Move the data out of OE-Core
>>>=20
>>> Since a lot of that data is fairly Yocto process specific, it may =
make
>>> sense to move it over to meta-yocto...
>>=20
>> I don't like "global" files where many people should maintain their =
info
>> and it's so easy to forgot when it's somewhere else then real changes
>> (like it was with checksums.ini and sane-src*.ini).
>=20
> Some data does make sense to be maintained globally and I don't think =
we
> should automatically say its bad. It depends what the use case is and
> how its intended to be used.
>=20
>> So I vote for b) Merge the data into the recipes, only problem with =
this
>> is that if we have 2 versions of foo (foo_1.0.bb, foo_git.bb) without
>> any foo.inc, will we create foo.inc just for distro-tracking info? =
Maybe
>> we should and move at least DESCRIPTION and similar variables too.
>>=20
>> c) moving it to meta-yocto will probably make distro-tracking info =
even
>> more outdated as sometimes different people then who did upgrade in
>> oe-core will have to update distro-tracking info in this layer (this =
is
>> also the case now sometimes, but with distro-tracking info in recipe =
we
>> can try better to update it with upgrades).
>=20
> I'd actually like Saul's view on this since he generally looks after
> that data. There as been discussion about whether it is "internal" =
yocto
> tracking stuff or whether its more general OE focused and I don't know
> what the answer is there. I think there is a mixture of uses. I'm also
> wary of "pushing" Yocto policy into OE which I think this might amount
> to.
>=20
> As a specific example, we've moved away from wanting MAINTAINER info =
in
> the recipes in the past and this gets us back there again. I don't
> really want to loop over adding data and then removing it again
> repeatedly so this needs thought/discussion. Who gets their name in =
the
> MAINTAINER field exactly? What is the process for that and what
> responsibilities does that person have?

The problem wasn't with MAINTAINER being in the recipe, the problem was =
MAINTAINER ending up in the ipk data. The 'abiword crashes' bugs we had =
years ago illustrated the problem clearly. Abiword only crashed if you =
used code sourcery binutils, but not with stock binutils. Graeme =
couldn't get the message thru that he was indeed maintaining abi in OE =
but wasn't responsible for people using broken toolchains. The specific =
abiword issue was resolved when the distro in question stopped using CSL =
stuff (familiar or angstrom, I forget).

I'm in favour of having info in the recipe (or bbappend!) who is looking =
after it if it doesn't end up in the output package.=20

Regardless of where to put the info, I would like to propose to orphan =
every recipe in OE-core and ask for volunteers. There's a ton of stuff I =
want to look after (bluez, gstreamer, pulse, avahi, X) which already has =
a maintainer from its yocto/poky/whatever legacy, but I feel is not =
being looked after with much attention. And adding to the problem is =
that most yocto people aren't using OE-core, but poky.

regards,

Koen=



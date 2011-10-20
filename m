Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGu11-0000PH-7J
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 16:54:39 +0200
Received: by eyd9 with SMTP id 9so2878579eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 07:48:36 -0700 (PDT)
Received: by 10.213.4.79 with SMTP id 15mr1492634ebq.148.1319122115802;
	Thu, 20 Oct 2011 07:48:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t2sm26200268eef.10.2011.10.20.07.48.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 07:48:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111020143631.GJ3522@jama.jama.net>
Date: Thu, 20 Oct 2011 16:48:28 +0200
Message-Id: <73864790-7FE6-4607-9D8D-BA987B71E3FA@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 20 Oct 2011 14:54:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 16:36 heeft Martin Jansa het volgende geschreven:

> On Thu, Oct 20, 2011 at 03:25:52PM +0100, Richard Purdie wrote:
>> On Wed, 2011-10-19 at 16:33 -0700, Saul Wold wrote:
>>> On 10/19/2011 12:00 PM, Otavio Salvador wrote:
>>>> On Wed, Oct 19, 2011 at 16:30, Khem Raj<raj.khem@gmail.com>  wrote:
>>>> ...
>>>>>>>> Many upstreams we can't track if updates are required =
automagically, so
>>>>>>>> we
>>>>>>>> need a place to record when the last manual check was, also =
possible
>>>>>>>> reasons
>>>>>>>> why we should not update to newer versions, ...
>>>>>=20
>>>>> hmm manual check means it has to be done manually is there any =
thing
>>>>> that needs it ?
>>>>>=20
>>>>> I think unless they are distro specific which seems not since they =
are
>>>>> in oe-core
>>>>> they could exist in recipes  thats my opinion.
>>>>=20
>>>> I agree that this should be put into the recipes. Besides this =
allows
>>>> for checking if it was updated when the version has been updated.
>>>>=20
>>>> If done right, when updating the version this data will be updated
>>>> together. I see no change in the amount of changes.
>>>>=20
>>>> A plus of this choice is it will be more difficult to forget to =
update
>>>> that info. This happened in last qt update for an example.
>>>>=20
>>>=20
>>> This may need to be something that the TSC brings up, possibly we =
can=20
>>> talk about it in Prague next week.
>>=20
>> So just to give some background here, the information in those files =
was
>> added by Yocto people to give some idea of the update status of =
various
>> recipes. This included when the version was last checked/updated for
>> recipes which we can't automate that process for, when certain =
cleanup
>> checks were made, what the general state of the recipe was and who on
>> the Yocto team was specifically looking after given recipes.
>>=20
>> When it was discussed, some of it was Yocto specific, some of it =
wasn't
>> and popular opinion was against it going into the recipes themselves. =
I
>> was ok with that given we have the pn- overrides and can handle the
>> problem that way just fine.
>>=20
>> OE-Core happened and we kept the data with OE-Core at least for now. =
We
>> have several options:
>>=20
>> a) Keep the data where it is
>> b) Merge the data into the recipes
>> c) Move the data out of OE-Core
>>=20
>> Since a lot of that data is fairly Yocto process specific, it may =
make
>> sense to move it over to meta-yocto...
>=20
> I don't like "global" files where many people should maintain their =
info
> and it's so easy to forgot when it's somewhere else then real changes
> (like it was with checksums.ini and sane-src*.ini).
>=20
> So I vote for b) Merge the data into the recipes, only problem with =
this
> is that if we have 2 versions of foo (foo_1.0.bb, foo_git.bb) without
> any foo.inc, will we create foo.inc just for distro-tracking info? =
Maybe
> we should and move at least DESCRIPTION and similar variables too.
>=20
> c) moving it to meta-yocto will probably make distro-tracking info =
even
> more outdated as sometimes different people then who did upgrade in
> oe-core will have to update distro-tracking info in this layer (this =
is
> also the case now sometimes, but with distro-tracking info in recipe =
we
> can try better to update it with upgrades).

I agree completely with Martin.

regards,

Koen=



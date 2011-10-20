Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RH0Fn-0000l6-O6
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 23:34:20 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 14:28:25 -0700
Received: by wwn22 with SMTP id 22so80378wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:28:24 -0700 (PDT)
Received: by 10.227.166.2 with SMTP id k2mr4357147wby.113.1319146099813;
	Thu, 20 Oct 2011 14:28:19 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id q30sm17902586wbn.17.2011.10.20.14.28.16
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 14:28:18 -0700 (PDT)
Message-ID: <4EA0926E.2010705@intel.com>
Date: Thu, 20 Oct 2011 14:28:14 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
In-Reply-To: <1319126135.2410.51.camel@ted>
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
X-List-Received-Date: Thu, 20 Oct 2011 21:34:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2011 08:55 AM, Richard Purdie wrote:
> On Thu, 2011-10-20 at 16:36 +0200, Martin Jansa wrote:
>> On Thu, Oct 20, 2011 at 03:25:52PM +0100, Richard Purdie wrote:
>>> On Wed, 2011-10-19 at 16:33 -0700, Saul Wold wrote:
>>>> On 10/19/2011 12:00 PM, Otavio Salvador wrote:
>>>>> On Wed, Oct 19, 2011 at 16:30, Khem Raj<raj.khem@gmail.com>   wrote:
>>>>> ...
>>>>>>>>> Many upstreams we can't track if updates are required automagically, so
>>>>>>>>> we
>>>>>>>>> need a place to record when the last manual check was, also possible
>>>>>>>>> reasons
>>>>>>>>> why we should not update to newer versions, ...
>>>>>>
>>>>>> hmm manual check means it has to be done manually is there any thing
>>>>>> that needs it ?
>>>>>>
>>>>>> I think unless they are distro specific which seems not since they are
>>>>>> in oe-core
>>>>>> they could exist in recipes  thats my opinion.
>>>>>
>>>>> I agree that this should be put into the recipes. Besides this allows
>>>>> for checking if it was updated when the version has been updated.
>>>>>
>>>>> If done right, when updating the version this data will be updated
>>>>> together. I see no change in the amount of changes.
>>>>>
>>>>> A plus of this choice is it will be more difficult to forget to update
>>>>> that info. This happened in last qt update for an example.
>>>>>
>>>>
>>>> This may need to be something that the TSC brings up, possibly we can
>>>> talk about it in Prague next week.
>>>
>>> So just to give some background here, the information in those files was
>>> added by Yocto people to give some idea of the update status of various
>>> recipes. This included when the version was last checked/updated for
>>> recipes which we can't automate that process for, when certain cleanup
>>> checks were made, what the general state of the recipe was and who on
>>> the Yocto team was specifically looking after given recipes.
>>>
>>> When it was discussed, some of it was Yocto specific, some of it wasn't
>>> and popular opinion was against it going into the recipes themselves. I
>>> was ok with that given we have the pn- overrides and can handle the
>>> problem that way just fine.
>>>
>>> OE-Core happened and we kept the data with OE-Core at least for now. We
>>> have several options:
>>>
>>> a) Keep the data where it is
>>> b) Merge the data into the recipes
>>> c) Move the data out of OE-Core
>>>
>>> Since a lot of that data is fairly Yocto process specific, it may make
>>> sense to move it over to meta-yocto...
>>
>> I don't like "global" files where many people should maintain their info
>> and it's so easy to forgot when it's somewhere else then real changes
>> (like it was with checksums.ini and sane-src*.ini).
>
> Some data does make sense to be maintained globally and I don't think we
> should automatically say its bad. It depends what the use case is and
> how its intended to be used.
>
>> So I vote for b) Merge the data into the recipes, only problem with this
>> is that if we have 2 versions of foo (foo_1.0.bb, foo_git.bb) without
>> any foo.inc, will we create foo.inc just for distro-tracking info? Maybe
>> we should and move at least DESCRIPTION and similar variables too.
>>
>> c) moving it to meta-yocto will probably make distro-tracking info even
>> more outdated as sometimes different people then who did upgrade in
>> oe-core will have to update distro-tracking info in this layer (this is
>> also the case now sometimes, but with distro-tracking info in recipe we
>> can try better to update it with upgrades).
>
> I'd actually like Saul's view on this since he generally looks after
> that data. There as been discussion about whether it is "internal" yocto
> tracking stuff or whether its more general OE focused and I don't know
> what the answer is there. I think there is a mixture of uses. I'm also
> wary of "pushing" Yocto policy into OE which I think this might amount
> to.
>
> As a specific example, we've moved away from wanting MAINTAINER info in
> the recipes in the past and this gets us back there again. I don't
> really want to loop over adding data and then removing it again
> repeatedly so this needs thought/discussion. Who gets their name in the
> MAINTAINER field exactly? What is the process for that and what
> responsibilities does that person have?
>
I am working on a proposal that will be a mix of the above, move some of 
the Version tracking and Updating information into the recipes and keep 
the large distro tracking file, but move it to meta-yocto.

It's clear based on these emails (and the following ones), that there 
has been some history with maintainer-ship of the recipes, so we need to 
generate some policy and process around this.  As Josh already noted, 
this is a community project there for a having updates and input from 
the community is important.

Part of our original purpose of putting people's names in the 
distro_tracking_fields was to have those people do the updates, interact 
with the upstream community and work to address any issues with the 
recipes they where marked for.  This was all a starting point.

I plan to have a proposal by next week that will address the current 
distro_tracking_fields.inc file, I do not think I am going to tackle the 
maintainer-ship issue at this point, that will be the next steps.

I, of course, welcome people's constructive feedback

Thanks
	Sau!

> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




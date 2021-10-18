Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <74058fe34e8fcdff0337ec54674fbac5b02c559a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to install without explict dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Oct 2021 22:08:02 +0100
In-Reply-To: <AM9PR09MB46425E114838BDB1CB772C89A8BC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <16A68880435BB472.28512@lists.openembedded.org>
	 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
	 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
	 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
	 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
	 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
	 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
	 <CALbNGRTxs26=VO7DmHe41QOgy=acByprKzUSzenZpYSfdJ_z_A@mail.gmail.com>
	 <AM9PR09MB46425E114838BDB1CB772C89A8BC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>

On Mon, 2021-10-18 at 21:07 +0200, Konrad Weihmann wrote:
> Just as an idea: can those knowingly breaking changes be announced 
> upfront somehow? maybe in the architecture list?!? (and then applied on 
> a flag day)

This one was announced on the mailing list in patch form, in the weekly tech
calls and I think in the weekly status emails too. It was announced enough that
I had feedback saying "not in the release". I listened to the feedback and
deferred it until we started merging new development for the next release. So it
was actually pending for a while.

> I know we all got a bit of a high workload, so it might be better to 
> have breaking changes not hit "uncontrolled" into master.
> 
> I agree that master is a development branch, but the number of breaking 
> changes that hit me by surprise this year is astonishingly high.

I think the problem is that for a period, active development of these kinds of
changes stagnated. That is good and bad, it gave stability but it also meant we
didn't tackle and fix some of the hard issues we need to fix for the project to
move forward. 

For the record the bigger changes were discussed on the architecture list so
those shouldn't have surprised anyone yet they still did :(.

> That doesn't mean, that I don't appreciate the actual change made, but 
> that way it has been applied (and the breaking changes before) makes me 
> rethink the way I do integrate my non-core layer in the future, while I 
> personally would like to remain on this bleeding-edge model that worked 
> well for a long time.

I think the question is more how long these things are breaking for. If things
were broken and then spent weeks languishing in that state, there would be cause
for concern. I'm not aware of that happening and most things do seem to be
getting resolved quickly. Those that aren't are a warning sign as it means
they're not being actively maintained and you need to ask other questions in
that case.

There is a balance here between being able to move the project forward and
drowning under the shear weight of "before changing X you need to write a
proposal, wait X weeks, get TSC approval, ensure it was in X weekly status
reports, talked about in X weekly meetings" and so on. I actually keep asking
myself, "why do I bother trying to change anything as I generally just get
complaints about the work it causes people?". I get really depressed at the
complaints I see and if I feel like this, it must be a real barrier to others
too and it will stop things changing. I don't go out with the intent of making
things difficult, I actually want to see the project move forward technically
not stagnate which I think it is at serious risk of. Do we really want to put
high barriers in place to development?

I will raise this with the TSC as a concern so they can review things.

Cheers,

Richard


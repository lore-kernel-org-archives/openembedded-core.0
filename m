Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id ECDA4770B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 01:47:14 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so7987634igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 18:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LWBPsnERjKLUJ+GqCAL6wjeYJfG+6w/fCKMttxIDXow=;
	b=GxNHxtNi+t9vb7mmogUSshMbNRK3ITqKNWH5m3+/UZXniVCYBCcegRncxgJT4LhAwE
	NKB4egwlqQMI9/Ds5Oo/Wee2mHnKGcQyn5k5zRsFZwg7JOZIPxebkgbbwb1RUpFmu8tz
	YAvL0fJcd22/uF5Hkx+qpNjCka5AivWGnbJPm9hSdr4kNmHU4A1WY/uHsqYEe5LxcbwQ
	0Ejhy0czupuvqSjPbIHXbjU1wTg2UvZydTbNXKJRS63AbC1IWCS9EUmAn8REBv5WhtYU
	GvHR8bAMph7J2FS0UmznUJOwVUIbX8CiRknWmU47fiADmYdmDY3uu1FDD2Gvu6J+ksBY
	IqkA==
X-Received: by 10.50.55.3 with SMTP id n3mr1932985igp.11.1443750434114; Thu,
	01 Oct 2015 18:47:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 18:46:44 -0700 (PDT)
In-Reply-To: <1443734190.14733.62.camel@linuxfoundation.org>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<1443713835.14733.13.camel@linuxfoundation.org>
	<3712B443-8857-41CB-87F9-DFFC12FE69E9@gmail.com>
	<1443731146.14733.30.camel@linuxfoundation.org>
	<CAP9ODKp2of3-766hOc_=Naqsa12uk5FntfgeHXwPcxnrQR+u6Q@mail.gmail.com>
	<1443734190.14733.62.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 18:46:44 -0700
Message-ID: <CAMKF1sqcubvBXZJzj-UjqYfaAhSYhFKvwJHicx_KZsspMNF1ag@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2015 01:47:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 2:16 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-10-01 at 17:30 -0300, Otavio Salvador wrote:
>> I think what Khem means is that any time is time to discuss the
>> release process as this is a community driven project and we must to
>> be open for feedback and revisit our previous concepts.
>
> There is a time and a place for such discussions. I think its clear that
> right now, I'm personally finding the situation we're in rather
> stressful and even getting the release into a shape where it can ship is
> proving difficult.
>
> The last thing I need right now is to go through this discussion again.
> Particularly when people have not gone and read the things I wrote up
> last time this was discussed. I could ask why not, the answer is
> probably because its easier just to ask questions and be unhappy with
> what we have.
>
> I appreciate that what we have today does cause some issues. I also
> realised a while ago that regardless of what solution we pick, there are
> people who are not going to like it. I've talked about that in previous
> mailing list posts to try and explain why we end up where we are today.
> I also don't believe anything has materially changed since we last
> discussed this, some people are just still unhappy. Some people will be
> unhappy regardless.

>
> I'm actually at a pretty low point with OE and Yocto in general. It eats
> up a huge amount of my time, both work and personally and I have started
> wondering what I actually get out of it other than a shortened life
> expectancy. On the most part I see a lot of complaints about things and
> continual questioning of "why we do X and wouldn't Y be better". I do my
> best to deal with this patiently and each time try and explain why and
> then re-evaluate if a change makes sense or not. When the same things
> repeat time and again, my patience can wear thin though.

believe me you are doing a fine job :) infact I recognise that
maintainership is a thankless job.

>
> Now, I do realise that there probably are some happy users out there and
> that happier users tend to be quieter than the unhappy ones, at least I
> certainly hope so. As such, I tend to see the worst side of the projects
> all the time. Equally, it can get to you after a while.
>

No silence does not mean happiness and similarity bringing up issues
does not mean unhappiness, On the contrary It is that I am being
caring enough to help projects adoption in the areas where people
havent heard the name of OE, so its a different perspective and
vouch for the issues that gets a headwind in adoption.


> So, yes, I do believe there is a time and place for discussions and not
> everything should be questioned and discussed at any time. That doesn't
> mean its not a community driven project.
>
> Anyhow, I can't stop any discussion, however my point is I'd much prefer
> to spend my time trying to sort out the release. If others feel
> differently, I will indeed have to spend more time on this instead. I do
> also believe it is too late to change things for this release[1].
>
> [1] Since I will no doubt get asked to explain that, the consequences
> are quite significant when you consider bugzilla version fields,
> autobuilder scripts, release scripts, my own branching scripts and so
> on. The things I haven't thought of worry me even more. Yes, we can in
> theory change anything and we could change this, but its probably a week
> of work shaking out just those changes. Do I want to do that now? No, I
> don't. For example I'm attending ELC-E next week. Do we want me talking
> to people or sitting in a corner trying to un-break such a change?
>

I think you are right about timing. But on and off this discussion has
come up and incidentally its always during release
I guess because we all try to consume the changes and it comes to fore
anyhow I have opened a tracker bug to follow it up. Let everyone
record the
inputs there, so it can be then considered for next release.

> Cheers,
>
> Richard
>
>


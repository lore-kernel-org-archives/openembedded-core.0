Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <4ee7a6b0d8640e8df91ccde5ba9f74139b56ee18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 00/32] Python PEP-517: build wheels and install with pip
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 25 Feb 2022 13:16:03 +0000
In-Reply-To: <AM9PR09MB46421D2885F301ED19EF4338A83D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
	 <AM9PR09MB46421D2885F301ED19EF4338A83D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org

On Thu, 2022-02-24 at 16:52 +0100, Konrad Weihmann wrote:
> I got a kind of general question about this patch series and all the 
> followups: is this still considered to go into the next release?

It is still being considered, yes.

> I'm a bit worried about the fallout of this pretty invasive change - 
> even though I see that at some point it needs to be done.
> 
> My understanding is that the "classic" way will stop with Python 3.12, 
> which doesn't apply to next LTS release - as this will likely remain on 
> 3.10.
> Only downside will be that manual helper files for updates of packages 
> that are lacking a setup.py needs to be provided (there are already a 
> few examples how to do it) - not a big deal if you'd ask me.
> 
> So what's the stand of the project regarding this issue - also keeping 
> in mind that I think it's already past feature freeze?

This is a tough one to make a decision on and I am conflicted. The change was
flagged up a while ago and has been regularly talked about. It is also something
we all agree will have to happen at some point.

The change is late and has issues but there was a base patchset sent before the
freeze deadline.

This isn't the final release point, it is the point where we stop taking new
invasive changes and stabilise and I think it important to keep that in mind.

Stepping back and thinking about the big picture (and e.g. the ability to take
security fixes into the LTS), I'm leaning towards trying to get it in. One other
consideration is having large delta between the LTS and onging development and
I'd prefer to minimise this particular difference if it is practical to do so.

I believe we have identified and fixed the majority of the issues that have
shown up in automated testing.

I haven't made a final decision but I am keeping an open mind on it and would
really prefer to get it merged. There are other issues being worked in parallel
which also would block the M3 build which does give time to resolve this one.

Cheers,

Richard





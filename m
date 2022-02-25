Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a38966dc02938c37bd275bce79e56128b1d58c19.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 00/32] Python PEP-517: build wheels and install with pip
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 25 Feb 2022 15:13:27 +0000
In-Reply-To: <AM9PR09MB4642136C55DEE8C30DF913B9A83E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
	 <AM9PR09MB46421D2885F301ED19EF4338A83D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <4ee7a6b0d8640e8df91ccde5ba9f74139b56ee18.camel@linuxfoundation.org>
	 <AM9PR09MB4642136C55DEE8C30DF913B9A83E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Konrad Weihmann <kweihmann@outlook.com>, openembedded-core@lists.openembedded.org

On Fri, 2022-02-25 at 14:27 +0100, Konrad Weihmann wrote:
> 
> On 25.02.22 14:16, Richard Purdie wrote:
> > On Thu, 2022-02-24 at 16:52 +0100, Konrad Weihmann wrote:
> > > I got a kind of general question about this patch series and all the
> > > followups: is this still considered to go into the next release?
> > 
> > It is still being considered, yes.
> > 
> > > I'm a bit worried about the fallout of this pretty invasive change -
> > > even though I see that at some point it needs to be done.
> > > 
> > > My understanding is that the "classic" way will stop with Python 3.12,
> > > which doesn't apply to next LTS release - as this will likely remain on
> > > 3.10.
> > > Only downside will be that manual helper files for updates of packages
> > > that are lacking a setup.py needs to be provided (there are already a
> > > few examples how to do it) - not a big deal if you'd ask me.
> > > 
> > > So what's the stand of the project regarding this issue - also keeping
> > > in mind that I think it's already past feature freeze?
> > 
> > This is a tough one to make a decision on and I am conflicted. The change was
> > flagged up a while ago and has been regularly talked about. It is also something
> > we all agree will have to happen at some point.
> > 
> > The change is late and has issues but there was a base patchset sent before the
> > freeze deadline.
> > 
> > This isn't the final release point, it is the point where we stop taking new
> > invasive changes and stabilise and I think it important to keep that in mind.
> > 
> > Stepping back and thinking about the big picture (and e.g. the ability to take
> > security fixes into the LTS), I'm leaning towards trying to get it in. One other
> > consideration is having large delta between the LTS and onging development and
> > I'd prefer to minimise this particular difference if it is practical to do so.
> 
> Your argumentation does make sense, but I have to disagree on this 
> particular point.
> The using pip as the default installer and therefore wheels is something 
> that will never (hopefully) get backported, so bringing this change in 
> automatically builds up a huge delta to any other branch - thus here you 
> would create a situation that (I agree) should be avoided.
> 
> Also moving around a few classes and recipe between core and 
> meta-python, will either bind users to including meta-python in every 
> setup or will create situation were people will try to work around these 
> changes.
> 
> I see that this feature has been promised - and it might be bad for the 
> project's reputation to drop it - still if one would ask me, I would 
> prefer to delay it to the next release.
> One potential option would be to offer that one (once mature and tested 
> will a broad set of layers) as a mixin-layer, which then could be used 
> with kirkstone LTS

It is a tough call without a right answer and one I ultimately have to make
based on experience and judgement weighing up the pros and cons.

I did just merge the series as I do think it is now about as ready as things get
without merging and exposing to the wider userbase. We do have time before
release.

FWIW the distutils classes have been showing warnings for a while now so it
shouldn't surprise anyone that they've been removed, that was planned regardless
of the other changes.

Cheers,

Richard


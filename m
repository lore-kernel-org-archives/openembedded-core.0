Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a428d22285cc222b064cf837c00a3defd3b3770f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 04 Nov 2021 20:50:24 +0000
In-Reply-To: <f4a34ed5-320a-2ec6-ef57-4a1efc4871ee@gmail.com>
References: <20211027013050.137364-1-saul.wold@windriver.com>
	 <CANPvuRkxEFt7LHO_BAnQpEWU=T9ctFh45d+SzFfe=jBHUOH1aQ@mail.gmail.com>
	 <CAGDS+nkJ4en5JjLGSMuePSQUY+mvLiek4X67q5Go+LA8307ApQ@mail.gmail.com>
	 <5a8c05846279f160ee2d5fe7ef7502c29e1bfee1.camel@linuxfoundation.org>
	 <CANPvuRnT027cnayyR=2XO_VtjhKd27rhXG=ieX4KZmDFC2yuCQ@mail.gmail.com>
	 <2035d95566fd1cb0453186cc8034f234b9e9fc98.camel@linuxfoundation.org>
	 <f4a34ed5-320a-2ec6-ef57-4a1efc4871ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Joshua Watt <jpewhacker@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
Cc: Steve Sakoman <sakoman@gmail.com>, Saul Wold <Saul.Wold@windriver.com>, OE-core <openembedded-core@lists.openembedded.org>

On Thu, 2021-11-04 at 15:45 -0500, Joshua Watt wrote:
> On 11/4/21 3:43 PM, Richard Purdie wrote:
> > On Thu, 2021-11-04 at 20:00 +0000, Jose Quaresma wrote:
> > > 
> > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
> > > 28/10/2021 à(s) 21:58:
> > > > On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
> > > > > On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma <quaresma.jose@gmail.com>
> > > > wrote:
> > > > > > Hi all,
> > > > > > 
> > > > > > There are any plans or is it possible to backport the SBOM/SPDX to the
> > > > dunfell branch?
> > > > > I'm going to yield to Saul as to whether he thinks this is
> > > > > desirable/possible or not.
> > > > The packagedata changes are pretty invasive unfortunately and likely not
> > > > something you're going to want in dunfell sadly.
> > > > 
> > > 
> > > Thanks for the clarification.
> > > 
> > I have been thinking a bit more about this. I did wonder if we should consider a
> > mixin layer of some kind for it that could work with dunfell?
> > 
> > We could host it, it is just a question of writing the mixin layer and
> > maintaining it.
> 
> I don't think it's going to be possible with a pure mixin layer, since 
> it relies on the extended package data?

I suspect that could perhaps be patched in through a layer though? You might
choose to drop the compression piece or do it differently for the backport?

Cheers,

Richard


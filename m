Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <61881d47fe575c33b194fc099b9688788e33f1d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Drop fsqrt implementation patches for fsl ppc
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 06 Dec 2021 23:32:09 +0000
In-Reply-To: <CAMKF1sqK0Nxp3NBggH7br4K7Qyxx6voMk1rUXJpVhuxBTBSrUQ@mail.gmail.com>
References: <20211206221418.2281162-1-raj.khem@gmail.com>
	 <fafa300be74d5ab50be74489d5d7725d9863bcda.camel@linuxfoundation.org>
	 <CAMKF1sqK0Nxp3NBggH7br4K7Qyxx6voMk1rUXJpVhuxBTBSrUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org

On Mon, 2021-12-06 at 15:28 -0800, Khem Raj wrote:
> 
> 
> On Mon, Dec 6, 2021 at 2:51 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I did test such a patch today as well since we discussed it. I'd propose
> > this
> > commit message since we need to say why:
> > 
> > """
> > 
> > glibc: Drop ppc sqrt optimisations
> > 
> > OpenEmbedded isn't an upstream or a patch repository. These are
> > optimisations
> > which for reasons unknown were never merged into upstream glibc. We have no
> > active ppc maintainers and these patches are at an evolutionary dead end.
> > Since they are optimisations, there may be small performance regressions by
> > removing them but OE can't carry patches like this indefinitely and these
> > appear to have no future.
> > """
> > 
> 
> 
> This sounds good to me. I guess will add it to commit or do you want me to
> send v2. This passed my local testing on qemuppc 
> 

I can sort if you're ok with it, thanks.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <bb4c89f5568e84bbaff1a14984139bcfea0c8dc5.camel@linuxfoundation.org>
Subject: Re: [OE-core] The state of DKMS in the Yocto community
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 13 Dec 2021 14:06:44 +0000
In-Reply-To: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
References: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alex Stewart <alex.stewart@ni.com>, openembedded-core@lists.openembedded.org

On Fri, 2021-12-10 at 14:58 -0600, Alex Stewart wrote:
> Hey List,
> 
> I'm trying to work out the mysterious state of DKMS in OE-Core.
> 
> Our (NI) OE distributions rely heavily on DKMS to (un)install our 
> ecosystem of kernel drivers at runtime across our product lines. To 
> facilitate that, we authored a dkms_2.4.0.bb recipe [1] back in 2017, 
> which we have carried out-of-stream since.
> 
> We tried to upstream it, and the patched rev'ed a couple of times [2]; 
> but it seems to have never made it into a yocto release.
> 
> Though some other recipes mention DKMS passingly, I don't see anywhere 
> that OE-Core officially supports it. Nor does my googling reveal anyone 
> else who uses DKMS. I find that a little hard to believe, though I 
> understand that it's probably relatively rare in the embedded space.
> 
> 
> @all
> So does anyone else on the list use DKMS in their yocto distribution? 
> Are you maintaining a DKMS recipe out-of-stream as well?
> 
> 
> @maintainers
> If NI upgraded our DKMS recipe to a more recent version than 2.4.0 and 
> submitted it again to OE-Core, would you accept it? If not, we will move 
> it to our own meta layer and accept that we are unique in this regard.
> 
> 
> [1] 
> https://github.com/ni/openembedded-core/commit/5789a27b68d95f3840bb8c4cb0d7b28d538c9a50
> 
> [2] https://lists.openembedded.org/g/openembedded-core/message/100680

Speaking for OE-Core, I don't think DKMS belongs there. I must admit I'd
forgotten what it was at first but then the memories came back.

I realise why it exists but it doesn't really model best practises or encourages
the behaviour we ideally want to see so I don't think it is a good fit for core.

Whether it might be accepted or makes sense elsewhere isn't for me to say.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <fd4d3e333e61fcaa9c49c6abf6dc02053fbadf3d.camel@linuxfoundation.org>
Subject: Re: [OE-core] Git and pseudo
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Apr 2022 11:56:21 +0100
In-Reply-To: <CANPvuRkZ20058vkTg8EQsg7C0fbVczdguj+0AY9Q-eBGq59P=g@mail.gmail.com>
References: 
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
	 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
	 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
	 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
	 <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
	 <b14c0ed1-ebf3-3b25-54c7-dc6b9efdb4ce@denx.de>
	 <24e9cfaa101ed3c4f1eb227cfee43a14ee475ecf.camel@linuxfoundation.org>
	 <CANPvuRkZ20058vkTg8EQsg7C0fbVczdguj+0AY9Q-eBGq59P=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Stefano Babic <sbabic@denx.de>, Mike Looijmans <mike.looijmans@topic.nl>, OE-core <openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>

On Wed, 2022-04-27 at 11:37 +0100, Jose Quaresma wrote:
> Hi,
> 
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quarta,
> 27/04/2022 à(s) 11:22:
> > On Wed, 2022-04-27 at 08:47 +0200, Stefano Babic wrote:
> > 
> > 
> > 
> > https://git.yoctoproject.org/poky/commit/?id=5bca57859b280f73b23247aac7dec6b05f48fde8
> > 
> 
> 
> The change that introduces the intercept script [1] Is partially reversed with
> [2]
> With this approach using the environment we don't need the intercept script
> anymore or I am missing something?
> 
> [1]
> https://git.yoctoproject.org/poky/commit/?id=21559199516a31c7635c5f2d874eaa4a92fff0e5
> [2]
> https://git.yoctoproject.org/poky/commit/?id=5546a868b52400ed1487b2ac7149f3a9e7293bd2

The devshell experience is better with the intercept as it means things like the
user's HOMEDIR is used for their gitconfig for things like user and email when
writing commits. I've therefore chosen to leave that in master. We may or may
not backport those pieces, I don't have any strong preference.

The other commit from Ross solves the major issue we care about build wide
outside devshell.

Cheers,

Richard




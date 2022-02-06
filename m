Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a5d6e75cafe701420bb355392870ffd412ac7f1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if DISTRO_FEATURES contains systemd
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 06 Feb 2022 17:35:29 +0000
In-Reply-To: <CANNYZj_sSHo29iDkJTndnyuXu57z=V976WGH6ii_T9OEAmKGxg@mail.gmail.com>
References: 
	<20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
	 <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
	 <d59a9eeb-4d7a-3050-bcdf-9cbdb284bdb6@kernel.crashing.org>
	 <CANNYZj_sSHo29iDkJTndnyuXu57z=V976WGH6ii_T9OEAmKGxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>, Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, OE-core <openembedded-core@lists.openembedded.org>, Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

On Sun, 2022-02-06 at 18:31 +0100, Alexander Kanavin wrote:
> On Sun, 6 Feb 2022 at 18:27, Mark Hatle <mark.hatle@kernel.crashing.org>
> wrote:
> > It definitely works in Honister (I'm actively using it.)
> > 
> > We produce a single package set, then allow for multiple image recipes to
> > select 
> > which init manager to use.  This simplifies the eSDK, sstate-cache and
> > binary 
> > package feed -- while still giving the end user the ability to switch.
> > 
> 
> 
> Selection of init manager is a distro setting, it can be used by component
> recipes to make decisions, and overriding it from images is neither tested nor
> supported.

There is a hybrid where you can enable sysvinit and systemd at the same time and
use them in different situations. We do test that and it is that test which
showed issues on the autobuilder with this patch.

It isn't as easy as pick and chose either in a given image but handy for
initramfs and some other uses.

Cheers,

Richard




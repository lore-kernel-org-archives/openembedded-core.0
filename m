Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <33735f1a43ccc638e997e4a6575daa772dec1914.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] python3-cryptography: enforce identical version for -cryptography-vectors
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 08 Apr 2022 07:44:07 +0100
In-Reply-To: <CANx9H-B2vNFSEmsSO1+m5+UJfm9zGA=Nyrw0jJzpWcNVJcvNug@mail.gmail.com>
References: <20220317164434.387779-1-ross.burton@arm.com>
	 <20220317164434.387779-2-ross.burton@arm.com>
	 <16E1E04DCAF22D86.750@lists.openembedded.org>
	 <CA+chaQduTDhBx33DP0ChwQ0y+Foqt6Kx5cSZABqvRi3kriMtfA@mail.gmail.com>
	 <94115621dac10ec60dbb9e16ffc18688f7e0b32e.camel@linuxfoundation.org>
	 <CA+chaQdtP0GigmX+v=UjR+vgWvM8jvBCBDo99gmhbGKnXMBpxg@mail.gmail.com>
	 <CANx9H-B2vNFSEmsSO1+m5+UJfm9zGA=Nyrw0jJzpWcNVJcvNug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Tim Orling <ticotimo@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>, Alex Stewart <alex.stewart@ni.com>, Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org

On Thu, 2022-04-07 at 17:50 -0700, Tim Orling wrote:
> 
> 
> On Thu, Apr 7, 2022 at 5:37 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > On Thu, Apr 7, 2022 at 11:10 PM Richard Purdie <
> > 
> > For this specific case the cure is almost more horrible than the issue this
> > commit was trying to prevent, but I agree that being able to depend on
> > version might be useful elsewhere as well and your package*bbclass fix helps
> > with that.
> > 
> > Thanks for looking into this.
> > 
> 
> 
> If the pain (which is what I understand with limited investigation) is
> cryptography vs cryptography-vectors being in sync (already a painfully known
> problem) — I again propose merging the recipes. Now I think about PYPI_PACKAGE
> being extended to understanding lists…

As Martin says, the cure is almost more horrible than the original problem. The
deciding factor is that this can and will happen again somewhere else though, so
horrible as my "fix" is, it is probably worth having.

Whether we do something else with the python3-cypto recipes remains to be seen.

Cheers,

Richard





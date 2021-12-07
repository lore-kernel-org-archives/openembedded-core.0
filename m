Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3048831fe8ea94422dad40dad600a325742e7d90.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH 00/14] Backport mandatory dtschema handling for device trees built through the kernel.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 07 Dec 2021 10:27:59 +0000
In-Reply-To: <CAP71WjxMLE8CXMGDhdhU6Dgmkije7cKh7SW_bmpeDBSXPMVdpQ@mail.gmail.com>
References: <20211201203407.218692-1-bhupesh.sharma@linaro.org>
	 <CADkTA4NV0ix0S4rc8HqJuJJr=Os299bx5UZrQEBnx9MBW-DCzw@mail.gmail.com>
	 <d1a94fdcacca208555f96846beecb853c14dbc24.camel@linuxfoundation.org>
	 <CAP71WjxMLE8CXMGDhdhU6Dgmkije7cKh7SW_bmpeDBSXPMVdpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, bhupesh.linux@gmail.com

On Tue, 2021-12-07 at 10:49 +0100, Nicolas Dechesne wrote:
> 
> 
> On Wed, Dec 1, 2021 at 10:39 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2021-12-01 at 16:33 -0500, Bruce Ashfield wrote:
> > > On Wed, Dec 1, 2021 at 3:34 PM Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > wrote:
> > > > 
> > > > This is a backport request for dunfell, while picking up only the
> > > > skeletal support for allowing mandatory dtschema handling for
> > > > device trees built through the kernel, introduced from kernel
> > > > version 5.16 onwards.
> > > 
> > > The problem with adding this support to dunfell, is obvious in the
> > > number of patches involved.  We've also said/known that at some point
> > > that we won't be able to support all new kernel versions with the LTS
> > > release. This may be the start of drawing that line.
> > > 
> > > Also, we've had to do some license tweaks in master just today for one
> > > of the added packages (idna), so that would be needed as well.
> > > 
> > > The validation isn't absolutely critical, I'd suggest that just the
> > > wrappers and pkg-config fixes would be a smaller footprint to allow
> > > the kernel to build, without the new package/feature additions to the
> > > dunfell release. The new packages (and full validation) could still
> > > possibly be done through a secondary or mixin layer.
> > > 
> > > I'm not sure which way to go on this, but I thought I'd offer those
> > > points for discussion.
> > 
> > I think this needs to be done in a mixin layer for dunfell.
> > 
> 
> 
> ok.. what about honister? would you consider a backport of these patches for
> this more recent release?

To be honest, with such a large set of changes, no, I'd much prefer a mixin
layer there too.

It is rather sad the kernel is suddenly "growing" it's dependency list in such a
large way but it doesn't change our policy on feature backports. Whilst we've
worked to allow newer kernels on older releases where it is practical, this case
isn't even close to being similar in scope :(.

Cheers,

Richard


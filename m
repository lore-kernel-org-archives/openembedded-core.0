Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <064d80643beb1d723008816d7dea76497a8d0533.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xserver-xorg: add missing libtirpc dependency
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Nov 2021 15:23:09 +0000
In-Reply-To: <CAMKF1sq33pUGxV75AWgB20maqXeaJ-zbGykWFQSoLL+2HCVgzg@mail.gmail.com>
References: <20211111100531.3822580-1-alex@linutronix.de>
	 <CAMKF1sq33pUGxV75AWgB20maqXeaJ-zbGykWFQSoLL+2HCVgzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org

On Thu, 2021-11-11 at 06:58 -0800, Khem Raj wrote:
> 
> 
> On Thu, Nov 11, 2021 at 2:05 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> > This wasn't a problem in poky, but was exposed with a nodistro build.
> > 
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > index 4a7048aced..71c934ef38 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > @@ -28,7 +28,7 @@ inherit meson pkgconfig
> >  inherit features_check
> >  REQUIRED_DISTRO_FEATURES = "x11"
> > 
> > -LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> > libxkbfile
> > libpciaccess libxcvt"
> > +LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> > libxkbfile
> > libpciaccess libxcvt libtirpc"
> > 
> 
> 
> Interesting. Do we know what the difference is?
> Perhaps a distro feature gap ? We should try to get poky close to no distro as
> it’s reference distro
> Less work in maintaining nodistro would be beneficial 

The difference is enable/disable of opengl. They are already very close, that is
one of the few major differences and in some ways it is useful to test both.

Cheers,

Richard
> 



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a293ee7c3829c56572d618628a129ae4ef7a0de7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] gstreamer1.0-plugins-bad/ugly: use the GPL-2.0-or-later only when it is in use
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 07 Mar 2022 15:50:47 +0000
In-Reply-To: <d0ce368f42264868a8af1e4c390fbe58@axis.com>
References: <20220307085919.426627-1-quaresma.jose@gmail.com>
	 <d0ce368f42264868a8af1e4c390fbe58@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Jose Quaresma <quaresma.jose@gmail.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Mon, 2022-03-07 at 15:33 +0000, Peter Kjellerstedt wrote:
> > 
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
> > index 9b6f80aa89..577ba16af7 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
> > @@ -1,4 +1,5 @@
> >  require gstreamer1.0-plugins-common.inc
> > +require gstreamer1.0-plugins-license.inc
> > 
> >  DESCRIPTION = "'Ugly GStreamer plugins"
> >  HOMEPAGE = "https://gstreamer.freedesktop.org/"
> > @@ -8,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> > 
> > file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
> > 
> >  LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
> > -LICENSE_FLAGS = "commercial"
> 
> I still think this is wrong. I.e., the commercial flag is not 
> related to a plugin using GPL or not, but rather the fact that it 
> is in ugly. E.g., the reason may be patent considerations and 
> can apply to any of the plugins regardless of license.
> 
> 

Agreed, that flag should be independent of whether GPL is there or not.

Cheers,

Richard



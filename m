Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BE16B605BE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 07:20:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 451JQZ6ykGz3w;
	Sat, 11 May 2019 09:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557559255;
	bh=EL70IXD/aBZGOnnbFlrGXxztwSb+86iIcP7VYOC28nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJISP9DBMB9T4IsqvXt2pg0yFtqtrWMi/vdwi3Buq0XhA2zKxL0r9Mvmu1PCBWx1U
	Wn9sYz97WxDIEyIdZQmDAbtCXANkZLN038aq9L+uzE6nrZxPa+l/aJIYdhbFoXxfBV
	up4ipLniuAMnP2okz/Uvx1w9J6wlGfA9icrtQM2nngCg6zvYrBqPPR4FOx/nIoUrZa
	oAMS1pN2/b1c0G+T5b+VPCS8p/hdxu13GQjuiMMYgr3N5dUqJavHl9cy+d7q7wNYpL
	sp2/grx41oHaqvVoVztE8kYBDhOd+FVVa+G95U9l7xxXnFUCmsCxio2FzKEXmXnigu
	YnssVWMyZgYITqk+N/+qz8udQK9vjkhfxPPYJMxMyon5cibOuzkINY4alzPspkr9u9
	z5hf9Gm0+XvqJ2LFuINPcUkslJ6lxixOccHdor0wwIhnu5vYssRhJMxLLt2smeLfhz
	ZNSdfGiHv7tfCy5v62sIJZMxtChDtoezN6Lzoq9QyKHczRvVInxgSUd9oFu7Ki5E6u
	mWivQdmAIR1rops4h6hy/bZW8nCM7PVj//qEfvh5GQrsu6/AYPixJzi9hsWKIkeBsz
	lZn3DxG+bLR+yLjtgODd5NHuWBAXi7Q3UR1lSZTdZLgaQRZ0A9o8wYYbqNd3SZ5dAe
	I1/xoK0zsEFqOgm3tGI5h98g=
Date: Sat, 11 May 2019 10:20:48 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190511072048.GB24494@localhost>
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
	<5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
	<CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
	<3b7d605c-ac73-6edf-7b39-598d451a4453@gmail.com>
	<20190511010421.GA1523@jama>
	<CAJdd5GYVfHO8Hs21P0Ohun12nEEqcgwBeWdYtsUPdtLGLi6MXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5GYVfHO8Hs21P0Ohun12nEEqcgwBeWdYtsUPdtLGLi6MXQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 May 2019 07:20:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 10, 2019 at 08:17:50PM -0500, Joshua Watt wrote:
> On Fri, May 10, 2019, 8:04 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> > On Fri, May 10, 2019 at 04:54:57PM -0700, Khem Raj wrote:
> > >
> > >
> > > On 5/10/19 4:00 PM, Andre McCurdy wrote:
> > > > On Fri, May 10, 2019 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >>
> > > >> On 5/10/19 3:13 PM, akuster808 wrote:
> > > >>> should we change the default to openssl ?
> > > >>
> > > >> I dont think so. Since newer versions of gnuTLS works okay.
> > > >
> > > > Isn't one of the goals for OE 2.8 to replace dependencies on [L]GPLv3
> > > > components with non-[L]GPLv3 alternatives so that meta-gplv2 can be
> > > > deprecated? This would seem to fit that goal exactly.
> > >
> > > Is that stated somewhere ? while I like the goal probably I missed the
> > > memo, my suggestion was just to give openssl backend some time to mature
> > > since its relatively new, and maybe give it some soak time
> > >
> > > >
> > > > It wasn't possible to build glib-networking with openssl until very
> > > > recently but now that it's supported upstream I think we should
> > > > switch.
> > > >
> > > >    https://github.com/GNOME/glib-networking/blob/master/NEWS
> >
> > I don't have strong opinion either way.
> >
> > I didn't want to change the default, because my only motivation was the
> > license issue with the newer gnutls, with the PACKAGECONFIG available
> > it's easy to change the TLS backend and that's all I need.
> >
> > Will send v2 if there is some consensus from glib-networking users that
> > it should be changed and someone provides me the reasoning for the
> > commit message.
> >
> 
> FWIW, moving away from GPLv3 and/or meta-gplv2 has been discussed in the
> 2.8 planning meetings:
> https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/edit?usp=drivesdk
> 
> Not that it needs to be done right now. It is nice to at least have the
> option.

It doesn't read as if "replace dependencies on [L]GPLv3 components" or
"moving away from GPLv3" would charcterize it correctly.

It says to create a *configuration* for the small subset of Yocto users 
who do not want to have GPLv3 code on their target.

For these users it is clear that they want to use openssl if they use
glib-networking,[1] and that they want to stick with busybox applets
instead of bash and all the GNU utilities.

For everyone else nothing has to change.

cu
Adrian

[1] Which BTW creates its own licence headaches due to OpenSSL having
    a GPL-incompatible licence.

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4618.1599329518207217085
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2020 11:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BAFA40BAB;
	Sat,  5 Sep 2020 18:11:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5UepMkvAGgq; Sat,  5 Sep 2020 18:11:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7335B40AB7;
	Sat,  5 Sep 2020 18:11:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CE85B17446C; Sat,  5 Sep 2020 14:11:55 -0400 (EDT)
Date: Sat, 5 Sep 2020 14:11:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] weston: upgrade 8.0.0 -> 9.0.0
Message-ID: <20200905181155.GA17660@denix.org>
References: <1599291707-36225-1-git-send-email-denis@denix.org>
 <234ef013cc44a254c590e867df3e1317beb4d1b4.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <234ef013cc44a254c590e867df3e1317beb4d1b4.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 05, 2020 at 04:04:23PM +0100, Richard Purdie wrote:
> On Sat, 2020-09-05 at 03:41 -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Weston 9.0.0 is released! This release cycle has been pretty quiet,
> > with just a few new features:
> > 
> > - A new kiosk shell allows to display regular desktop apps in an
> >   always-fullscreen mode
> > - Improved testing infrastructure: the test harness has been
> >   redesigned, DRM tests are now supported, DRM and OpenGL tests are
> > now
> >   enabled in our CI
> > - DRM panel orientation property support
> > 
> > As always, a number of bug fixes are included as well.
> > https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Looks like it fails on musl:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2414

Thanks, I'll take a look.

-- 
Denys

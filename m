Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A935C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 23:04:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.28226.1639263863659388693
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 15:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6045640C2B;
	Sat, 11 Dec 2021 23:04:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QuKYy8X_soC; Sat, 11 Dec 2021 23:04:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4578B40B13;
	Sat, 11 Dec 2021 23:04:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9D4E9174710; Sat, 11 Dec 2021 18:04:20 -0500 (EST)
Date: Sat, 11 Dec 2021 18:04:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] wayland: upgrade 1.19.0 -> 1.20.0
Message-ID: <20211211230420.GK18191@denix.org>
References: <1639249951-9342-1-git-send-email-denis@denix.org>
 <1eb02e48ddd4178aae55cb18bc84151b6ffd56e2.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <1eb02e48ddd4178aae55cb18bc84151b6ffd56e2.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 23:04:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159576

On Sat, Dec 11, 2021 at 10:42:08PM +0000, Richard Purdie wrote:
> On Sat, 2021-12-11 at 14:12 -0500, Denys Dmytriyenko wrote:
> > Wayland 1.20.0 is released!
> > 
> > This release contains the following major changes:
> > 
> > - FreeBSD support has been entirely upstreamed and has been added to
> >   our continuous integration system.
> > - The autotools build system has been dropped. Meson has replaced it.
> > - A few protocol additions: wl_surface.offset allows clients to update
> >   a surface's buffer offset independently from the buffer,
> >   wl_output.name and description allow clients to identify outputs
> >   without depending on xdg-output-unstable-v1.
> > - In protocol definitions, events have a new "type" attribute and can
> >   now be marked as destructors.
> > - A number of bug fixes, including a race condition when destroying
> >   proxies in multi-threaded clients.
> > 
> > Drop patch to fix strndup detection on MinGW that no longer applies, as
> > meson claims to had that fixed since version 0.54.2
> > 
> > Also backport libsdl2 patch to fix building against wayland-1.20.0
> > 
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> > v2 - fix libsdl2 breakage
> 
> Thanks, does the v2 also address the mingw failure:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4469

So, meson's claim of fixing strndup detection is a lie!
Please wait for v3...

-- 
Denys


Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SV8DP-0006PQ-J8
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 23:26:31 +0200
Received: by pbbrq2 with SMTP id rq2so2747657pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 14:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=ianhHHv4GugloNJ1IDo6ujU7za3mzj4xpZZEzPwuct4=;
	b=nl0Bu4b3u4xSGzV8+mD5C8cxEueQQ1Izq1b3tJuVHggc1twqZ+kTpR59qgMJwP4Efm
	hBMVmt7736FGEhB2M9FZy1eRzleFlyviDoXzzZA5rBVZppEf2D469lZfQpc3RwgBdyqO
	TRkPQXAuj/Im3TwNYLVwRTYKKyaJ6M8bCLGu0aSNc6lKiZz7reDSIbbpPCobm3BpKrQv
	1GpJjq51XW+Rtm4cp+uj8ojH9QPeydW7nnR0HHbh169Zc+l6WwnrMl7DZKr6OLn0t7so
	WGwEBVLBWUr3YlEGEmJhm4MXjS6yH3AHKo6p+OoxRPQTggFlBRFCWnUUBPjlrtAWjtn0
	BBTA==
Received: by 10.68.203.40 with SMTP id kn8mr31102272pbc.162.1337289387536;
	Thu, 17 May 2012 14:16:27 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id sy3sm9208830pbc.0.2012.05.17.14.16.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 14:16:26 -0700 (PDT)
Date: Thu, 17 May 2012 14:16:37 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120517211637.GD23562@bill-the-cat>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
	<0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1337288563.7473.24.camel@ted>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 21:26:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 17, 2012 at 10:02:43PM +0100, Richard Purdie wrote:
> On Thu, 2012-05-17 at 22:44 +0200, Koen Kooi wrote:
> > Op 17 mei 2012 om 22:29 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> > 
> > > On Tue, 2012-05-15 at 13:54 -0700, Khem Raj wrote:
> > >> On Tue, May 15, 2012 at 2:32 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > >>> The commit breaks pkgconfig and after discussing it with the kmod and udev maintainers the conclusion was reached that putting the libraries in /lib instead of /usr/lib is not supported.
> > >>> 
> > >>> This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
> > >> 
> > >> while this is what I had initially it doesn't go well with kmod living in
> > >> /sbin and accessing libraries from /usr due to our QA checks although
> > >> I am all for simplifying it where we don't make this check at all.
> > > 
> > > I've had requests for it along with a commitment to fix it and patches.
> > > If we decide we don't want this, fine and that will be the case if
> > > patches are not forthcoming to fix the QA issues. I don't think we've
> > > reached that point at this with that yet.
> > > 
> > > I've decided to accept this patch and "unbreak" meta-oe/udev at the
> > > expense of screwing up OE-Core. I am however still deeply unhappy people
> > > are trying to bypass OE-Core this way and then "blackmail" OE-Core using
> > > breaking meta-oe as a reason. The whole systemd thing has been badly
> > > handled and needs to get fixed properly.
> > 
> > What does systemd have to do with this?
> 
> Why does meta-oe has its own udev recipe? Is systemd related to that at
> all?

I would imagine it's part of the tight coupling of parts here, yes.

> >  This is about a broken commit breaking udev 182 for over a week.
> 
> OE-Core worked fine and the commit fixes QA warnings which are now back.

Isn't the rule for QA errors supposed to be that you fix real problems
and tell the automated checks "we know what we're doing, be quiet" ?

All that's happened is that meta-oe has been working as intended and put
in a newer version of a recipe, before oe-core can move to it, and found
problems that need to be addressed.

-- 
Tom



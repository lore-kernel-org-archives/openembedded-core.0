Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF9E7CBDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:50:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x17so2395098wrl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ycts71hIgEWjY6qqRcRSYSLggYJSG0qWt5EUISE2mpI=;
	b=SKaC4GouAbFC44aVZ82UC34cwdSBbwSWFwlFVyyNfTXbss5wNcj2bH1ZMCLCyPieRL
	Y/FT4EDiuSJgX7RJdY6GBzGgbqSijN/C6B2D8UfaTFuHDciPWGabGLB4aYJCqJO8yM8a
	bs6yp4bgtg2TTfH93SJQIC+6y13l/515JZG6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ycts71hIgEWjY6qqRcRSYSLggYJSG0qWt5EUISE2mpI=;
	b=Fgqz+bcsOe6EJFScrHSLKR8KLA98AIFtiBLS/hLMEjcr4Z8dK7oLiAaW0P4E0Z0Mn2
	PPr+5g7Nm/ClItfAN15EbnLW20YN44TjmZm+KxhvaAFmZkxNwnn/4aYgu44XWmBosc36
	WtP2Ij91C+Yz3Dyhg1QplrWmIPZpWYlCJ7Cr1luOq4KT/2qnXsuDi7HvgJV9RiRXXeTc
	2P1z6IdG3uH+G8/GksXYZFkd+Ts+ec2EQwnSNHfba1zNN+G/MGZBHJ0827RG+IGQ0UrC
	n/y0mIYsXdS47w61j8wsYpNZJwaLgjdYYs6p5J1KGwqhBfOklF0Q72fEPafhMELIPH5y
	ifpA==
X-Gm-Message-State: APjAAAVhGmvJBfNSS9yPrr47k6BsRyd3r9C37tSGDw8vyhwnnY2wvj7t
	qtauyJvwWsewEy2aWgTWbCIXqw==
X-Google-Smtp-Source: APXvYqws1Ifj17kIxrvQ2UwpJS1AaMqGNPSxMsLJHSlARAaaeoo7FyRTq1JWCX7xUM9lr5/18dhE7Q==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr37918258wrn.94.1560516623693; 
	Fri, 14 Jun 2019 05:50:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s63sm2218346wme.17.2019.06.14.05.50.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 05:50:23 -0700 (PDT)
Message-ID: <f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 14 Jun 2019 13:50:21 +0100
In-Reply-To: <20190614123451.c5idgiizmqnlhob4@pengutronix.de>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: kernel@pengutronix.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 12:50:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-14 at 14:34 +0200, Marco Felsch wrote:
> On 19-06-14 13:11, richard.purdie@linuxfoundation.org wrote:
> > On Fri, 2019-06-14 at 14:04 +0200, Marco Felsch wrote:
> > >  Anyway thats
> > > interessting. IMHO it isn't a good solution to rely on that fact
> > > that
> > > the package have some 'random' default enabled drivers. Should we
> > > fix
> > > the qemu configs or should I add:
> > > 
> > > PACKAGECONFIG_append_qemuall = " swrast"
> > 
> > The assumption is that swrast makes a good fallback and would be
> > available in most cases.
> 
> No I don't think that it is a good fallback, following my patch
> description. If you are on a embedded device you want the hw-renderer
> and not the sw one. A good example: After I updated my kernel, my
> hw-renderer wasn't available anymore and my application didn't start.
> Thats a very good indication that something went bad. With the swrast
> enabled I wouldn't see that immediately.

Alternatively, if swrast is available the system is more usable and you
can then have a more usable system to track down the problem and fix
it?

My point is you can argue that both ways.

I did read your commit message.

> > I suspect qemuall might not fix beaglebone-yocto or some of the
> > hardware BSPs.
> 
> As I discribed in the patch description if you want that fallback you
> have to enable it. IMHO this is the better way instead of to be a
> 'smart' package.

As things stand this patch will likely break a significant number of
BSPs. This isn't acceptable.

> > Its also assumed these packages are shared amongst multiple
> > machines
> > which may need different drivers.
> > 
> > I suspect this means the defaults should be on but I am happy to
> > have
> > more PACKAGECONFIG options to control things for people who want to
> > customise/micro-optimise.
> 
> Optimising wasn't my main motivation. Avoiding 'random' performace
> issues after a upgrade (kernel, mesa) was my main motivation. Do you
> get me?

I understand why you're doing it however I don't like the implications
of the change which mean breakage for a significant number of BSPs, and
the fact it breaks the way distros would use this recipe from a
packaging perspective as its not marked as machine specific, nor should
it be.

Cheers,

Richard





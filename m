Return-Path: <scott.murray@konsulko.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5C28C782C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 20:17:56 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id v202so12853032itb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version;
	bh=1satxGMlaIXvGr+aVxpBf3p925z0rDAbtMUgp4fM8+Y=;
	b=pJhWGn94ByT4MaksJMulGOXVFnsWY6HaHO2RYSzXSWDy3AWPxskzT4jeD6DfwM/nkm
	4r9oKahbshrOoTWvjZlNlJUk2HE0NGQVGbBUSsBglT1JP5NdNdGb+jaIgO1xF9U1VyRR
	/ptUkXo3AVqkIZ1xM5HZjk4GU2IM2CEARG/58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
	:references:user-agent:mime-version;
	bh=1satxGMlaIXvGr+aVxpBf3p925z0rDAbtMUgp4fM8+Y=;
	b=A1HYVCfeUTgEg2B5EolJFH9T/rv2TM7cXjJHUZO2kJwG/R1ZYuZo8aNPA3bikV39V4
	ORzONUxc0KRhflfKNww1/MpHk1P0HZexav4Z5WUPZMhYx06gfhFNCd9DA2I1HYqu09DI
	0cJiaEKiiwY2mIpxO3veYY7Zp1yEOvsE7AdQHpbaVL0Wy3lpVOKrPM/0XcsostSOkhIk
	DY6m7ogUE/PN0eN4nRQfl4CCLH0IWcTdbLokhILW3oDjzJUe93SrqP/YjbMkRVWTYZKh
	/hEg/PBdM50zZYjo4kl8L7nVet1EY9C1G8B1XFlDCweWEdzm4ciWQ+cZlkO/ubfLXCut
	Y8wQ==
X-Gm-Message-State: AKS2vOw6x9xZ2XzHeigmRzZ0amquE8AbGAZKbtDH/6oziornsEByqA8A
	wusTt7qxEqthVHTw
X-Received: by 10.36.173.27 with SMTP id c27mr21313331itf.75.1498853878065;
	Fri, 30 Jun 2017 13:17:58 -0700 (PDT)
Received: from godzilla (69-165-244-87.cable.teksavvy.com. [69.165.244.87])
	by smtp.gmail.com with ESMTPSA id
	e34sm4779606ioj.62.2017.06.30.13.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 13:17:56 -0700 (PDT)
Date: Fri, 30 Jun 2017 16:17:55 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
X-X-Sender: scottm@godzilla.spiteful.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1498774123.9571.5.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1706301614290.8288@godzilla.spiteful.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1706281335150.8288@godzilla.spiteful.org>
	<1498774123.9571.5.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Fri, 30 Jun 2017 20:17:58 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jun 2017, Richard Purdie wrote:

> On Wed, 2017-06-28 at 13:38 -0400, Scott Murray wrote:
> > On Mon, 19 Jun 2017, Richard Purdie wrote:
> >
> > >
> > > I suspect this has been missed by some people so I want to spell it
> > > out. We have our first CVE in OE-Core itself.
> > >
> > > The issue is limited to binary ipks potentially exposing sensitive
> > > information through the "Source:" field which contained the full
> > > SRC_URI. Those urls could potentially contain sensitive information
> > > about servers and credentials.
> > >
> > > After discussion, I ended up changing the field to contain the
> > > recipe
> > > filename (no path). There was talk of filtering the urls however if
> > > you
> > > try, it becomes clear that sensitive elements can remain and no
> > > solution is likely 100% effective. The other package backends don't
> > > do
> > > this at all so this brings ipk more into line with them. Simply
> > > clearing the field doesn't work with the current opkg-utils. It can
> > > be
> > > changed but the change becomes more invasive.
> > >
> > > This fix has been merged to master.
> > >
> > > I also did take the decision to backport this change back to
> > > pyro/morty/krogoth too. I appreciate this can cause some disruption
> > > to
> > > people who rely on SRC_URI being in the Source: field however I
> > > couldn't see any other realistic way forward.
> >
> > I noticed that this wasn't CC'ed to the yocto-security mailing list.
> > Was that just an oversight, or should that mailing list be considered
> > defunct at this point?
>
> Sorry, it was oversight...

Okay, good to know.  IMO it might be worthwhile to post it there even if
it's a bit late, just to set a precedent of that list providing such
information, but it's your call.

Cheers,

Scott



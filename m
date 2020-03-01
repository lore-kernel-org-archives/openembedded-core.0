Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 177C460B65
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 08:14:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r17so8540154wrj.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 00:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=FRlqYv/ePbWKewhkZLvVyL0FGybe14kR7qKqOZv4yws=;
	b=O+GxL69wGNe+3J4uexZfeZR9CjYmH8EQ2tucwaQ8m8efmvSv5vuH4ghX6m3bXYxov4
	jTqrZaFcP1NVX9xxeeOpVBjFMT16Jkj6lXaZepwQXzQuNFe6xFD4DjaCKN19MPSWd+qD
	U4/pq0ZqpTMaG6Wr9nengJkR0xmu8o8bikSQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FRlqYv/ePbWKewhkZLvVyL0FGybe14kR7qKqOZv4yws=;
	b=Hb+0EoGGYdSlYnFCNiL41UqzyJIqf6Y5Vb+mCVJJeK/AfyyB3Y+jM4o9f8hjSbE2SU
	CbClpIN1IiZGWTJKliB7X5+SScPvUi+LZC6b72gVQel2Cm2yHgqRaxwPPppz12tBoT2w
	SRNjRDP/qBlbU3I2WkuCpe3R2PUwmGnCVDwyr3x7MRfbEsExFyDjIMAxYy1F55OYeHHN
	Aox5cFTa2ZgC5RqrQrjgwa762xJk3tJbnHv57Ia/Bk/2BwMufvp1to9d+l/4WNWDQgJR
	jYEdBjPx0rFcd8zmnofNP3weWuIzL6dO+15Eapdt+N99gRCOfH99TGSGjz3+k2pYG4VM
	1vxA==
X-Gm-Message-State: APjAAAVbHZgS9si/CidzeNhfqnP6JqPnKZAFUNWarnHnF4VpMRr2MMzh
	RcNfWEHq/z8uLXH/1g8o168aWw==
X-Google-Smtp-Source: APXvYqz7BcoUHX+EZJCmRiI29b0f/ZbWPPFP7GQ5X8l5cYEbpdpzIEGszcXvzj29cGU4BnaLm3PvWA==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr15107091wrr.322.1583050482824;
	Sun, 01 Mar 2020 00:14:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l17sm1141334wmi.10.2020.03.01.00.14.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Mar 2020 00:14:42 -0800 (PST)
Message-ID: <7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 01 Mar 2020 08:14:41 +0000
In-Reply-To: <CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
	<CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Sun, 01 Mar 2020 08:14:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-01 at 00:12 -0800, Khem Raj wrote:
> 
> 
> On Sat, Feb 29, 2020 at 11:57 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2020-02-29 at 17:42 -0800, Khem Raj wrote:
> > > Errors like below are fixed
> > > 
> > > bus/connection.h is owned by uid 1000, which is the same as t
> > > he user running bitbake. This may be due to host contamination
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Why aren't we seeing this everywhere? The autobuilders don't show
> > it
> > and no other reports. What is unique to your setup to reproduce
> > this?
> 
> These are QA warnings by default and in my distro I turned it into
> error so they were being reported before too 

The autobuilder would show any warnings or errors and we're not seeing
either.

> Secondly this is a Debian10 minimum container running in docker where
> the user id is 1000 for the build user other than that there is
> nothing special 

We run debian10 builders on the autobuilder.

I just don't understand why weren't not seeing this everywhere. We
really need to understand why this is :/.

Cheers,

Richard



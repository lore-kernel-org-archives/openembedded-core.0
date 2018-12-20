Return-Path: <ross.burton@intel.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id A08396C60B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 13:02:40 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id x85-v6so1492226ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GLlGoqpPR9BoModHxABLwMhupkWJ3gyAWoXaNFYd054=;
	b=cKNZjL0Qj7IE420FoWr2XhV8sVMqi+2xKhbKF3fTsCkFQ0oHwGbsm22ONsEek5Rsqs
	90pNHLmgPg/IsCMEfu/zErQKgIQ5bjWuWRNeDgqrv7enw89V8neLznNGS504T1EvAfDD
	pG0o/ve2/62z1E9nr9DnRwySqz7rEFTQo691pPBuDy9+wv4wD/Kvd4pJV9gAMNYNQAm+
	WM6ziTF8TChlCXNKW6SjfDEepdoXqem7sN+g0sQZqprr0GeyYiot1A5COPnxeixGGsto
	PMuUi4Ju5Y8Si+jHI1ueIu5ZUz9lKF/JodWhWMfKdFFrYVN+LEE1aG5rRkUtwW2ukqEb
	vRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GLlGoqpPR9BoModHxABLwMhupkWJ3gyAWoXaNFYd054=;
	b=dqM58aCO2FDbYZsR64M0sm8NyIMAT0yFjmnoWyFJ4cEsGOOD5kQybeq10e7yq/qPLG
	FT9Xp0brcTVYOZjR5oxt+mVQC7/bYOoe/q5UVlE5VEoB4mVrEd4MOQtFbW3g0A+WvDvK
	3km6kMaap0EhdpXn1cYr3bAHugeAYq72qvMXmOMg2VBSMF5dG4LRwNiZ9eKrIJoo3NVb
	XJ64Vl1o0HWY2Ap7M7CgPhEZsM1j8WOTEwvWWJGDiIhcsnLYlXJ6Xfl5DiIwxqj8CTPq
	vDUhmAe60RiKOWBugFhZHap/PKbkZhA8LH5f8p1yxrjhS2P4L1r8fBEkIpz419FzoEUY
	Ancw==
X-Gm-Message-State: AA+aEWbP6CZV9JyUrlq/jCc+sb/T4Z2u17uYb1cjG1H8Puq3ipPNQ9RB
	zxKz4gb9QsODRI7eWvRQQyxSMjMC6Tcox5L/gC1Jqg==
X-Google-Smtp-Source: AFSGD/WN2kyWVZuMuT+hDJFhbgz5jAp7IBIG2w4CxyUvZWEEbrrHsDySP3de0QCRdoDSve7X2m+RT+BA0cROvrRjVBE=
X-Received: by 2002:a2e:3509:: with SMTP id z9-v6mr2651929ljz.54.1545310961077;
	Thu, 20 Dec 2018 05:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
	<d796d8b521000f3fce1b514cedebe1476c57df1c.camel@linuxfoundation.org>
In-Reply-To: <d796d8b521000f3fce1b514cedebe1476c57df1c.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 13:02:29 +0000
Message-ID: <CAJTo0LYTwZ-srE+zO-Y2vnW_FhhoH-kPMDSLP78zkd=qbSHGNw@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] glibc: Remove site_config and glibc-initial
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
X-List-Received-Date: Thu, 20 Dec 2018 13:02:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 11:59, <richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2018-12-20 at 11:50 +0000, Burton, Ross wrote:
> > As the only users of siteconfig are now zlib and ncurses, should we
> > just rip it out entirely leaving a gap for a fresh implementation?
>
> I'm cc'ing Mark who has a lot of the history on this.
>
> I think we're at a point where we likely need to re-implement this in a
> different way...

I did some poking at this a few weeks ago, basically turned off
siteconfig by removing the 'inherit siteconfig' from
autotools.bbclass.

Interestingly, at the time for core-image-minimal this actually
resulted in the build being faster.  Some recipes were a little slower
to configure, specifically coreutils had the biggest slowdown as it
appears to probe for every syscall in the world (via gnulib) but that
only took seven seconds longer.  However, as the siteconfig generation
is done by writing a custom configure.ac and then doing the
autoconf/configure dance, these slowdowns were balanced out by glibc
taking an extra 30 seconds.

It appears that disabling siteconfig for glibc is an acceptable
compromise if we can not build glibc and gcc twice.

Ross


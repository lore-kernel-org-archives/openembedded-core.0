Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8903D6B2BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 11:25:19 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so6708529eek.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2014 03:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=t4AAPMk45pg73oLhL31yuK6gLcLZ5MpwoDhhl2DKVrs=;
	b=E9pX6jNk27k8mZ+thalqaEzXPLK65yLn2sthJy66KUmz6DZDtlR6MlL16Ip6o9Y2Dw
	T4YfMbvx6xLeUmbibCZDx8aocDiWNvRfFMiqCo0WIxT0NUCPkkK6CLX4wWkoe373c1Fk
	XTrIqNv0c4zUX+q/pQ3pw3F0GvNVYz7+YcehUVY1b2hpNCbEFNnlNkDGXIarllhCLpkw
	qAfg1ZVEOfhmsIIgwzEg9h+OkJAOTWlTjbOUXMBKXgl+zuOA0m4StkSCf89GO5Pw8fga
	jl+vVRaxubeDelhfcVPW+cM5dYisukEYM8DM7/B0tGwTaI6RMOMwq70XLGzasZaBh3wJ
	4VLQ==
X-Gm-Message-State: ALoCoQmRzk6KWNz07pmvPExdQVMr5p+cIKLDRkbp5iMC01bJScOvEiaW6xXA1NO66iJyfXsX76ro
X-Received: by 10.14.212.69 with SMTP id x45mr1786296eeo.69.1388748320035;
	Fri, 03 Jan 2014 03:25:20 -0800 (PST)
Received: from gmail.com (5-13-221-193.residential.rdsnet.ro. [5.13.221.193])
	by mx.google.com with ESMTPSA id
	m1sm144132535eeg.0.2014.01.03.03.25.19 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 Jan 2014 03:25:19 -0800 (PST)
Date: Fri, 3 Jan 2014 13:25:13 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20140103112512.GA30264@gmail.com>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<l9c5ar$2mb$1@ger.gmane.org> <1801103.RjHpRo2rCi@helios>
	<l9mqmg$oia$1@ger.gmane.org> <52BF51CC.4040300@balister.org>
	<l9pfvj$rqa$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <l9pfvj$rqa$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Fri, 03 Jan 2014 11:25:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 29, 2013 at 04:44:52PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Philip Balister schreef op 28-12-13 23:33:
> > On 12/28/2013 10:28 AM, Koen Kooi wrote:
> >> Paul Eggleton schreef op 28-12-13 12:48:
> >>> Hi Koen,
> >>
> >>> On Tuesday 24 December 2013 15:22:32 Koen Kooi wrote:
> >>>> Burton, Ross schreef op 23-12-13 19:01:
> >>>>> We'd like to integrate Piglit (an OpenGL test suite) into Poky
> >>>>> so that we can run automated QA on the GL stack.  Piglit is
> >>>>> currently residing in meta-oe, but as Poky is a self-contained
> >>>>> project we can't just add meta-oe to it:  apart from the size of
> >>>>> meta-oe, we can't ensure stability if meta-oe makes incompatible
> >>>>> changes that affect Poky.
> >>>>>
> >>>>> Piglit isn't a stand-alone package, there are the dependencies
> >>>>> of waffle, python-mako and python-numpy to consider too.  There
> >>>>> are two possibilities I can see:
> >>>>>
> >>>>> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes
> >>>>> only and pushes the boundaries of "core platform".  In a sense
> >>>>> this is a repeat of the discussion we had with Midori...  does
> >>>>> oe-core contain everything needed to sufficiently exercise the
> >>>>> core components it ships or not?
> >>>>>
> >>>>> 2) Add piglit and deps to meta-yocto.  Probably a new layer
> >>>>> called meta-yocto-qa (or similar) because the Yocto Compatible
> >>>>> guidelines forbid mixing distribution policy and recipes.
> >>>>
> >>>> Speaking of layers, can you *please* rename meta-yocto to
> >>>> meta-poky? It's what it's actually is and would remove a lot of
> >>>> confusion when trying to explain that yocto is not a distro, even
> >>>> if the distro layer is called 'meta-yocto'.
> >>
> >>> This is a tangent, but a couple of points:
> >>
> >>> 1) This rename would not come for free. We'd need to update people's
> >>> existing bblayers.conf files on the fly, as we did when
> >>> meta-yocto-bsp was split out of meta-yocto, and thus bump
> >>> LCONF_VERSION; however, doing this only in poky has resulted in
> >>> annoying problems when users remove poky from their configurations
> >>> (since LCONF_VERSION is out-of-step between Poky and OE-Core, leading
> >>> to confusing errors in this situation). Thus I think we'd want to
> >>> solve this once and for all by bumping the value in OE-Core as well
> >>> as Poky.
> >>
> >>> 2) If you propose this rename, perhaps you will also consider
> >>> renaming meta-oe, since that name within a similarly named
> >>> meta-openembedded repository leads to a similar level of
> >>> confusion...?
> >>
> >> I have no problems with renaming that layer since I get confused by
> >> this a few times a week myself :)
> >
> > What would we we rename it to?
>
> I'm very tempted to suggest 'meta-yocto'
>

I definitely find meta-yocto a better option here. It would save me from
some confusion when talking about yocto to other people.

Related to meta-oe, even if that would be a smaller problem, I think
meta-openembedded is a better name for that layer too.

--
Andrei Gherzan
m: +40.744.478.414 | f: +40.31.816.28.12


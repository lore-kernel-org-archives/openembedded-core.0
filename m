Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A288B7843F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 21:01:03 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 189so7658105wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BFopQy/cEAvRoapSXqh8JfX7WK+lBUimxAjQOeKKQpY=;
	b=VCc1X4AxkCx9Bg2XJRmA5mvNEmv7UCJs/p3rir+nXD7AXjuKEGcHhn5N/SPxOlROzu
	17eeged0NjmYXztjLq65mn2//e42sB/yHk+HyU7XpYy/XmErItwmCVjc6LaMss8DsFci
	HasryWnhrCoAt3VzL2IjximVYiBEjX1UwAc5X/yHpdewBASWHAr6lLJQk4+dEbHbeu33
	7BW2pktsf8nHZ4+C096qOgQDylci11GGnK5kugaUDRZAY7M85eWXDbcsza6ctr0gzhy7
	w0RNPuROIaSudgB2jvw24Pm3CDPCZb/MRlXaWJIu3jYekIN9UDXjEMtP0heB1cTqUqAJ
	UImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BFopQy/cEAvRoapSXqh8JfX7WK+lBUimxAjQOeKKQpY=;
	b=KsJTfXWaFcoJDXPI4u/NrQzSezk4rd/efE0DodmgTKNY0wM0E20KUNn/bi07p1LbNh
	nLIxL7xyB0gErivKwRt7Iw/AJ90X4Xb+JT5NGhnfp3Le3+PzrEjqFI3cmTEktLei4ML6
	GWIX27vgMT7q3S185y7WaRz5PVWkecozyTLBmJTKUhZ99ZE0sf8LzI0MznhhXNB52zVY
	eNViXKeHCJru7mOcSDWq3Xw7gavARaB89Brm4o4gSViQMhtoOSnHEJKL3pHrEconImZx
	LR8b4n4PGf60qQovYYkvBLntX/TjRivAGvyTZp/ZHERrVkHCktHA8cSQMcqjxwI/hCkb
	G4Fg==
X-Gm-Message-State: AHPjjUj96fxZpEyCc90sxTiE6+F603kqs45GR3NOVJWii8IJkm0V6G6Y
	nrQi61U1ptEC7ry4kyGhlaevaV2niFapI2Erk2o=
X-Google-Smtp-Source: AOwi7QA/VupTjILcNo7yAeLlHQbU7QnXCH+Uca3SqPLVODhxsM6wU0Xi6bl7s0sBA018phTBvkIWNOCSV9YAEb06mB4=
X-Received: by 10.28.130.130 with SMTP id e124mr928112wmd.75.1505422864286;
	Thu, 14 Sep 2017 14:01:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 14 Sep 2017 14:00:33 -0700 (PDT)
In-Reply-To: <1505337509.18640.84.camel@linuxfoundation.org>
References: <20170905150847.32681-1-ross.burton@intel.com>
	<CAKmqyKPiyBMAMDQZ6RG0envtnUto=n7jx0dxwgsqJaZvV=yMzQ@mail.gmail.com>
	<CAJTo0LbmEOd=9_W4ru7=1VUY1c0eyOmEzr3rFvwsXnC_ftA1-w@mail.gmail.com>
	<CAKmqyKN-kxvENCrxR1bQ5Z7YDe5wO57GRgYZVmmy8-0eUOOicA@mail.gmail.com>
	<1505336969.18640.82.camel@linuxfoundation.org>
	<CAKmqyKMoTxxiQJ5jsCP9bHdNinEHG5mfb=fWUCaS+_6C+ZFY9A@mail.gmail.com>
	<1505337509.18640.84.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Sep 2017 14:00:33 -0700
Message-ID: <CAKmqyKMNfMn0TMw2=yUSXX6Fv8OBG1md71DxmBTsg9QVbWXhDg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: recommend shared-mime-info
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
X-List-Received-Date: Thu, 14 Sep 2017 21:01:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 2:18 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2017-09-13 at 14:12 -0700, Alistair Francis wrote:
>> On Wed, Sep 13, 2017 at 2:09 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Wed, 2017-09-13 at 13:55 -0700, Alistair Francis wrote:
>> > >
>> > > On Wed, Sep 13, 2017 at 1:42 PM, Burton, Ross <ross.burton@intel.
>> > > com>
>> > > wrote:
>> > > >
>> > > >
>> > > > Can you share a log showing that?
>> > > This is the full log, so it's not just OpenSSL:
>> > I suspect the new dependency means other things get built on mingw
>> > which have never been needed until now. We may need to remove the
>> > dependency for mingw to avoid this..
>> Yeah, that is what I suspected. I tried the BAD_RECOMMENDATIONS in
>> the
>> mingw machine-sdk conf, but that didn't seem to work.
>
> You want something like:
>
> RRECOMMENDS_${PN}_remove_mingw32_pn-glib-2.0 = "shared-mime-info"
>
> (I don't remember the exact mingw override offhand)

Great! That fixes it.

I'll spin up a patch now, should the RRECOMMENDS remove go in the glib
recipe or in the meta-mingw machine-sdk conf?

Thanks,
Alistair

>
> Cheers,
>
> Richard
>


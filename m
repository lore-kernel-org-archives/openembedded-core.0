Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A746460602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 19:49:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v77so15035435wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4ydwvUk2Wxt3RxDYRDJD/7pne/ZBGwV6mpKrCca4geM=;
	b=QoSoyfTHHY0jy5/vu/pgc/FIDTNayEk/HopoIobPO+SPYWL3tn1bCMXZVlhDQawkv1
	JQdu/7tYaVZWARXU/RotEzNda2sJQ+1S1wgLEJLmgUmHS1FqJD9gHRoaYEHSNVFKfePU
	NdLZje3X4MZl7y32TZTusK1Y0ZL7sKo7xjUoOqvqmho82359vk5OsDMVQjVp/l86wXNr
	VHeU9mB3a0YfJ9o3RZINrFmogBXuyNTGcEFaMD+zKNVM8+DmPramoiDr9MTfNJs3LNcF
	sKeS8xqvpk5ZQFg9TZ1dlAgoa3+oxMgWz0rZ+LCnoEjOnN3EzjBNvS/KffnGgCHsR/Vc
	n4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4ydwvUk2Wxt3RxDYRDJD/7pne/ZBGwV6mpKrCca4geM=;
	b=kNE4meIlfGTLRAfxyf8EI7+qm99ZF5mP3/Dt585GCR3Ze+MRLh+VqsdJdu2uyOsEWf
	tjOYUUxbA5OqsLuLQtts9v76+tLW/MVwaxqsk8iBBtMiHn2vhM4Zpu0IJv+ZEmrPp3fc
	1DD2E9vvQqTQ4MsRr3xn7+53Y1q2HznH+bj/rVeiVBVs+1u0LUSOrUso7jSNAKCNBDol
	6HF8zqHfVekHFtS8yP5K8/0Lb/R22PwA5/reP9ny8Cs7gSQaWPwLIb1mTuzACl6YV2cC
	L8gTdVxQBYc0MFJZYDFCVHj9DtKiQanTnwANJGnduaggcHxf0ChIJDD/Ow56gVj1YHim
	PjmQ==
X-Gm-Message-State: AMke39lxv98B1DCzHmQiXe2x3MhcyAptYTawPntm0yw0qYI0mIi9k757xgWDpcVHaBMiKonAVpGrj5TRbdpP9g==
X-Received: by 10.28.229.78 with SMTP id c75mr9029355wmh.20.1488224986392;
	Mon, 27 Feb 2017 11:49:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Mon, 27 Feb 2017 11:49:45 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702271347110.6269@localhost.localdomain>
References: <alpine.LFD.2.20.1702270819550.25847@uk63952.mitel.com>
	<1488217806.8657.20.camel@pbcl.net>
	<alpine.LFD.2.20.1702271347110.6269@localhost.localdomain>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 27 Feb 2017 11:49:45 -0800
Message-ID: <CAJ86T=XY4k09EZayoUdLcXV3-WE9Ft4==W1oXioJq0ZZvDgMJg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a few more picky questions about COMPATIBLE_MACHINE usage
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
X-List-Received-Date: Mon, 27 Feb 2017 19:49:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 27, 2017 at 10:53 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> On Mon, 27 Feb 2017, Phil Blundell wrote:
>
>> On Mon, 2017-02-27 at 09:09 -0500, Robert P. J. Day wrote:
>> >  # webkit-efl isn't available for < armv7a
>> >  COMPATIBLE_MACHINE = "(-)"
>> >   COMPATIBLE_MACHINE_x86 = "(.*)"
>> >   COMPATIBLE_MACHINE_x86-64 = "(.*)"
>> >   COMPATIBLE_MACHINE_armv7a = "(.*)"
>> >
>> >   first, that comment seems out of date as it makes no mention of
>> > MIPS
>> > or ppc, but that's just being picky.
>> >
>> >   next, i assume the line:
>> >
>> >   COMPATIBLE_MACHINE = "(-)"
>> >
>> > is to initialize the set of compatible machines to the empty set,
>> > yes?
>>
>> I think the intent is to set it to a string that "can't possibly
>> ever match".
>
>   right, that's what i suspected.
>
>> >
>>   i next assume that lines of the form:
>> >
>> >   COMPATIBLE_MACHINE_x86 = "(.*)"
>> >
>> > are meant to indicate that if that MACHINE_OVERRIDES comparison
>> > succeeds, then all possible targets are compatible, is that right?
>> > however, given precisely those lines above, is it not equivalent to
>> > just write:
>> >
>> >   COMPATIBLE_MACHINE = "(x86|x86-64|armv7a)"
>>
>> No, because "armv7a" is not a MACHINE.  It would be more equivalent
>> to write
>>
>> COMPATIBLE_HOST = "armv7a-.*"
>>
>> but even this would not be quite the same because it would fail to
>> match "cortexa15-linux" for example.  Actually that's not a very
>> good example because cortexa15 is armv7ve not armv7a, but you get
>> the idea.
>
>   i'm going to disagree here, i never suggested "armv7a" was a
> "machine" (in the sense of having a defining armv7a.conf file). i said
> it was part of MACHINE_OVERRIDES, and therefore *would* be considered
> a matching "machine" for the purposes of COMPATIBLE_MACHINE.
>
>   as another example, there is no such machine as a "qoriq", but that
> is considered a valid choice for COMPATIBLE_MACHINE since several
> actual machine definition files do this:
>
>   MACHINEOVERRIDES =. "qoriq:"
>
> am i making sense?

I think so. However, note that ARM is somewhat of a special case in
that it includes over-rides derived from TUNE_FEATURES in
MACHINEOVERRIDES (although MIPS has recently started to do so too). In
the general case (and especially in the context of COMPATIBLE_MACHINE)
it's probably better to think of MACHINEOVERRIDES as containing just
the machine name and perhaps a SOC family.

(Maybe it would be clearer if over-rides derived from TUNE_FEATURES
were placed in a dedicated variable, e.g. TUNINGOVERRIDES, rather than
being crammed into MACHINEOVERRIDES?).

> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


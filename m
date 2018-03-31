Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 40ADC7458E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 15:58:04 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id o102-v6so15786885lfg.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bYU6+ZuXCc5emh1wFoPI/qhSvYlEEBprPNXnbc5XKnM=;
	b=Ol3i+GUM/32BPp+VinAT0A92lwRnkMpXlwjv5TVnsQZzpl9KPwnjT/eKgVOYiU9ayU
	nBmF4cI+thygdDvWkp6RHDHwrAnyRmv8jqpfQWKQDWoSl9Z/1imTh0zb4DI3CJVwaHDt
	oNw/GWwBubCoVZdcafbmDejljMfX6WqK0U7MRUSHroksfo+aYI4LjLCv0lBRBF9ZPKEm
	0YlimBnzjh07n292MqtDmpaAhZ6AO3kf98a0H0REPisKV2uIuTalPEhEsXP16CG3mFpt
	zjyQirOC/Ur9SdSkzbBfNPm+luFjdSQP1nmBMmoOFVr3vwH6+cbVz6U3AKdmLCiwgIlL
	ILwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bYU6+ZuXCc5emh1wFoPI/qhSvYlEEBprPNXnbc5XKnM=;
	b=bZLAHOTQRO1nnoNmQ10wtNHhYjix5LF+DBDtOwg0vWEh4FjhcuwuATHaPsySdPPBt2
	pPtUYtAp3hP9ie3FgxqyZNRgT3MztiiTGL5zpGPMXXm+8uig1azaRBJzOovIKEAhqGnz
	09ZTEYgwEcB5ezo+AIO8egOrNvefCs40EXFgmGtUmkSnLOa784NsfvkRdLemel5A9LEY
	tBeUqG3ErBIaVmSHW9tD9OESLWpHnMb9W9Wtas0dcRs3jcENpZuoBq92iBn0gua5TLV4
	aTmHPB28DYFE9m6eP2NWE1ohoxETeHy73W35Sh6dfWPkFPy0PtJ7B8mC+z+wAx9RYKM2
	HpSA==
X-Gm-Message-State: ALQs6tCD2gLrvN9yEUroMBJtbhsVLdowcfheLt1I8rX/mjXA7UW6EPy7
	qE3I8F5Y5yryLObMKF/QFQzsGcG4Lb0fnwcldvk=
X-Google-Smtp-Source: AIpwx49lBKx07W8gicOyuA2DIbPYbKpTkjoW9wWMuvhmuQHDXBqJE37eV53HJoJ/yjj14iu+wyCwcUdufGwq6zdnRiY=
X-Received: by 2002:a19:fe2:: with SMTP id 95-v6mr2041229lfp.13.1522511885067; 
	Sat, 31 Mar 2018 08:58:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Sat, 31 Mar 2018 08:58:04 -0700 (PDT)
In-Reply-To: <20180331103528.1e462033@seebsdell>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
	<CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
	<20180331000631.5f050451@seebsdell>
	<CAJ86T=UOuOWaOtQ8Y7bDc1170kckLvgg+FAfLx_sHT68r=mJRA@mail.gmail.com>
	<20180331103528.1e462033@seebsdell>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 31 Mar 2018 11:58:04 -0400
Message-ID: <CADkTA4PGysW5OU-ueDKTF4RRfZhUxEEN1akWVShWnADW3iRj8w@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Sat, 31 Mar 2018 15:58:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 31, 2018 at 11:35 AM, Seebs <seebs@seebs.net> wrote:
> On Fri, 30 Mar 2018 23:02:29 -0700
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> On Fri, Mar 30, 2018 at 10:06 PM, Seebs <seebs@seebs.net> wrote:
>> > That's the problem: There's no sane way to express "the size that
>> > you would have gotten for these arguments of unknown types"
>>
>> And there I think lies the key point that you still haven't grasped.
>
> I think you're right, but also you're being sorta rude about it. I

FWIW, I was thinking the same thing.

seebs is quite capable of working through this .. with all the bike shedding
here, it is taking up time that could actually be spent on the solution.

Cheers,

Bruce

> think you're missing the distinction between "broad enough experience
> with weird edge cases to be possibly-unduly cautious" and "has no idea
> which end of a compiler is up".
>
>> The arguments are not of unknown types - they are all of types which
>> are the same size as integer registers.
>
> It turns out, in C, "the same size" is *not enough information* to
> determine where an argument goes. It is probably enough information for
> the subset of arguments that syscall is using, on these architectures,
> but I say "probably" because I have no spec to point to that says it's
> necessarily the case.
>
>> The syscall manpage very
>> clearly documents the fact that all arguments to Linux syscalls are
>> passed to the kernel in registers. I think you even asked me why that
>> was important or useful.
>
> I'm still honestly not totally sure why it has to say *which*
> registers, specifically. Under what circumstances will my invocation of
> syscall(2) be changed by the knowledge that argument 5 to an OABI ARM
> system gets passed in v1? The information being present implies that I
> might need to know this to invoke syscall(2) correctly, but the only
> examples given are not actually specific to that information.
>
>> If there's any user space code out there which calls libc syscall()
>> and does not pass variables which libc syscall() (or a wrapper for it)
>> can unconditionally treat as a type which fits into integer registers
>> than it's a bug the caller. End of story.
>
> This raises an interesting point. The man page says that the dummy 0
> argument is needed for SYS_readahead because of an alignment issue, to
> force the value into r2/r3. It does not say that the manual split of the
> 64-bit value into two halves is needed, it just does that. Is that
> actually required anyway, or only because of the need to pad the
> argument list? (For instance, look at sync_file_range2(), which
> reorders the arguments to sync_file_range() for efficiency.
>
> ... Oh, wow. I went and checked on readahead():
>
>>> On some 32-bit architectures, the calling signature for this
>>> system call differs, for the reasons described in syscall(2).
>
> Note how they don't specify what the alternative calling signature is.
>
> -s
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


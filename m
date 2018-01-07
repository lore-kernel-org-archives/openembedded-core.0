Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 228DE787B5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 18:55:06 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v188so11777818qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 10:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GAb+z3EwWqkGQvRneAqEGUB0SzWeCNaid8bxK56YT7I=;
	b=neLs+PzquFBg9viatLvtQJY9MaclUr+8cV6Ln3jj6Jl0lExMYcUAv9udSpmEykBqjD
	vPgRL6dmcAcNe5cEhYaoaLreJeE/HlkP4Zc1QzPEo6bQfbpuRosEGmIQVOI6+nEc/K1a
	a4mGb8lU3irELq8sDSx+Dj1By/nC2UoZ9SBuXkPegbKrrPA5f/510kgmqByTDFNy048N
	1I6dwlIsrj0CdOrygprPx30WpbEJlgZPSlglapH9igjdUGyEo+jvxfLzEj2Xv7+C9zt5
	XiXB/hLRJkL4Fu8p1pELjotKzPfaVe3Esz4cL5M8oW06Xppwb/v9LQxncB1WAfQGbazj
	TjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GAb+z3EwWqkGQvRneAqEGUB0SzWeCNaid8bxK56YT7I=;
	b=kkyedT531tawtY7v9AMh1L+rqeL+DwL6zQMjbz2nDFBC1gEjSrupHcYWUwygA6Rmno
	3Mca1ET/iZDC8zfmzvffhAdS4hW8y+EEoRnLJuG5DDxdM5GEDSGV9pVy6y+YRcqrj+PN
	IHzdjXRWC3c267d1mCXM6R8GOACWaCH+9zbK+ykOOVPu0pV/iZJOaFyawleN6s3jfjUP
	1OIUKJEW7DD+U7bvmUoRebwbUwAGySf8xG/6tvkUaOJ1GFbfYIdKYEdx2SnxtRXeKMvX
	7gM2fXAowSa9ghzhpcLTw7F6+i46cg4E+4ORzDn1wZCxms9q8LhJvqVjxwafn1yt+i8h
	+xzQ==
X-Gm-Message-State: AKwxytcN7MmIwsFZXATdSguReuhMU7BSfUk+LChOkDjWvGMPy+qB0S0N
	04/3LnZ2yUSW2O5DF7WL8SY3udCiQQSgethdcxA=
X-Google-Smtp-Source: ACJfBotG0IKSCDeU0Sm1lxICyUt0lq7gzzUhyrqCH8DwXk5XKtxm+c8BERL3HVpVUnf12hvnYv87bcDCBtZg3MlKc5I=
X-Received: by 10.55.123.69 with SMTP id w66mr12116202qkc.94.1515351308041;
	Sun, 07 Jan 2018 10:55:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 7 Jan 2018 10:55:07 -0800 (PST)
In-Reply-To: <1999cffb-3890-2271-3938-ba2be97b135d@denx.de>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
	<CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
	<db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
	<CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
	<2c1c48a3-5355-b3eb-fab0-765a007b8475@denx.de>
	<CADkTA4NAvZVW_dNbOi_2OgyNxkQXDj9XJtbDpSztXSfaYRxP=Q@mail.gmail.com>
	<1999cffb-3890-2271-3938-ba2be97b135d@denx.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Jan 2018 13:55:07 -0500
Message-ID: <CADkTA4OQNJWyMn8tj7m8nEOjeH4M5V729uU+OBerKe5V+ns2VA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: Add optional patch_xenomai task
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
X-List-Received-Date: Sun, 07 Jan 2018 18:55:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 7, 2018 at 1:49 PM, Marek Vasut <marex@denx.de> wrote:
> On 01/07/2018 06:55 PM, Bruce Ashfield wrote:
>> On Sun, Jan 7, 2018 at 12:53 PM, Marek Vasut <marex@denx.de> wrote:
>>> On 01/07/2018 05:42 PM, Bruce Ashfield wrote:
>>>> On Sun, Jan 7, 2018 at 11:38 AM, Marek Vasut <marex@denx.de> wrote:
>>>>> On 01/07/2018 05:37 PM, Bruce Ashfield wrote:
>>>>>> On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wrote:
>>>>>>> Add additional task, do_patch_xenomai, inserted between do_patch and
>>>>>>> do_configure tasks. This task applies the cobalt patch to the kernel
>>>>>>> sources for a specific machine. This is disabled by default, so use
>>>>>>> PACKAGECONFIG[xenomai] of the kernel package to enable the patching.
>>>>>>>
>>>>>>> You will also need a kernel recipe for a kernel version with ipipe
>>>>>>> patch applied.
>>>>>>
>>>>>> This doesn't make any sense to me.
>>>>>>
>>>>>> Why on earth would this be in kernel.bbclass ? and part of a xenomai
>>>>>> recipe ?
>>>>> Do you have a better suggestion how to make this easily available for
>>>>> every kernel recipe ?
>>>>
>>>> There's no need to make it available for every kernel recipe. If someone
>>>> wants to build xenomai, they need to have a specific kernel recipe and
>>>> configuration to make it work. By providing that patch and allowing it to
>>>> be applied to any kernel doesn't mean it will actually work .. so you aren't
>>>> doing anyone any favours.
>>>>
>>>> The same thing could be said for the -rt patch, aufs, etc, any patch could
>>>> be made available for any kernel, but they aren't, since they will either fail
>>>> to patch, or won't work at runtime.
>>> We actually have a -rt patch available in the kernel recipes, so why not
>>> xenomai patch ?
>>
>> As a separate recipe, not as something in a common bbclass, which implies
>> that it applies and works everywhere.
>>
>> Anyone that is trying to apply -rt against a generic kernel .. is very mistaken.
>
> So I should pull this into linux-*-xenomai , just like the rt patch does?

Yep.

But how it is maintained is a RP question, oe-core has a set of reference kernel
versions, and those reference kernels have a similar set of functionality across
architectures, are actively maintained and all get the same fixes at
the same time.

(and I just realized that RP isn't copied on this thread anymore, so I'm adding
him).

If we introduce something like this, I'd argue that it needs to follow the same
kernel versions to be consistent with the other oe-core references.

That is a question for the steering committee and the architecture mailing list.

So while that happens, why not just put this in a meta-xenomai for the time
being and once all the details have been hammered out, it could merge.

Cheers,

Bruce

>
> --
> Best regards,
> Marek Vasut



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


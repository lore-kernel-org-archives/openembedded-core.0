Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2431571CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 02:07:25 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d3-v6so21339194qtp.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uhV+ryNPn2iMBP6mrUD/Ceab9lJFSJ5z4oPi5NKbVjs=;
	b=c66nlazWHO277TEEhnwNJytx2lQRCiZVQQoZn/RbT3im0vIUTQrL510GMbr3J4iD0U
	nJ0BxUWTJ+zyGxCDPYUQzO5/IPqgtSTFPRiCldprfYY+P2c7D24nKFWfS6tneo2bRdNv
	9BwkuUrRMlnXhCcFu5eEpQGbWvuabq3jZIc/d5eG+4yxChL/sVxrBuOadNHJL9oj/SQ5
	InwYH85lBAW6JsoUWXvrjCYOeCMprZzd17b1iyxUhi5uzAidv99JuulPhvqixxMUIhcD
	d6CLXN/e0yO3Tz3Qk2O3fvaRZjKeYQl/comC0cPuxein/fRksN6uQ9g2i18HYrVclJOJ
	O4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uhV+ryNPn2iMBP6mrUD/Ceab9lJFSJ5z4oPi5NKbVjs=;
	b=UpKQ5uQhqA7j/spq0SzRgwF/FTzmWbXjyReLM9SCkhu1ENp8tSi0gpyT6QYFBn+g5O
	dy0/madUMUff6sptAkLV8x1mIr0VTw3rIlStkmynwU+GWEkgzjV9SrUm5x/EEe/tE6+D
	6EaUqvjhWkvFAuTZxCj1DLmlkmn22r7Db8UQOMu2qkt22lwDYLt6o7Aw6DBzhh7qap7z
	k3dtxFIpN3u4Fa6MLMrZI1gjdTTN2ibihW/gPm5rf1AFO5cjJMlF13ryHx5gu6BLCceC
	L7U2kao7z//t0YIvX1ygP8SeA9CQtTOTKgqIxt6uJZnkYu0JKn/gQIov54xGtWI8VFPv
	n9uw==
X-Gm-Message-State: APt69E1yxMTGruBciCAJ7wkIhLyH1St/lPtN6nu0NaHPvji6NPTVTWSs
	6jovmpf2LhTd6IV+Yzp959pDhw9R9TKWQrqnfeQ=
X-Google-Smtp-Source: ADUXVKJV+5JFU3WmA/vrm5ZRl6xx5kiyLCa7RVcnBW4Y0/zdrK/1aZQSm1cZRiTzSl63WiqD+WxQaB99PcJBBCFyO6k=
X-Received: by 2002:ac8:26ea:: with SMTP id 39-v6mr816118qtp.128.1527646046787;
	Tue, 29 May 2018 19:07:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Tue, 29 May 2018 19:06:56
	-0700 (PDT)
In-Reply-To: <CAJ86T=WG9cQX8F_-WKQe05zGGap=Ey5hAKXaCaLAn9EbpS3p-w@mail.gmail.com>
References: <CAJ86T=VefDA6DSEEj06x5SbBvwDKW2mBfxfivPtFcM0kWPn0dA@mail.gmail.com>
	<CAMKF1sqSR7chwbVcTVVSqO9Fhg_N=fCqtFK20v=LM1cRe2mO2g@mail.gmail.com>
	<CAJ86T=WG9cQX8F_-WKQe05zGGap=Ey5hAKXaCaLAn9EbpS3p-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 19:06:56 -0700
Message-ID: <CAMKF1srWOaSaBHL_TWW3cYi7kAav_4L8n_2aLRWp+LSPC8DNDw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Wed, 30 May 2018 02:07:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 1:34 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, May 29, 2018 at 12:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, May 29, 2018 at 11:41 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> This change looks wrong (or at least incomplete and lacking a decent
>>> explanation):
>>
>> why do you think it is wrong ? I would be happy to make the
>> explanation more decent
>> if you have ideas please share.
>
> I would be happy to try... if I had any idea why you think you need it!
>
> What causes the conflict in flags and why hasn't it been seen before?
> Why do you only need to fix Cortex A7 and not when building for other
> armv7ve cores?
>

gcc-runtime is a bit special where it gets itself configured when
building cross compiler
but then we tame it to re-target itself for target using some shims
e.g. setting generic
arch values so it can plug itself amicably when we build gcc for
target and use it ondevice
because it needs to rely on right combination of options, and gcc for
target is also made
to target more common ISAs via doing things like below.

EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"

these options cause additional march values to be added.

If you are interested. Plug this patch out and use gcc8 patches I have
floating around
and you can see whats going on.

I am also interested in finding a solution where we do not need this patch.

>>>
>>>   http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=fbec01f01fdad23d95271db063ee0a4d0ab44568
>>>
>>> It was never posted to the list but seems to have made it as far as master-next.
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


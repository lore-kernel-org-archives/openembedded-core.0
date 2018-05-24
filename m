Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A89A6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 23:30:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a8-v6so9515801wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 16:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U9cdbDmjeUaU2RDbxEV7pbNaM1voCg1DV5GFU3kmPJ0=;
	b=CQ6DKLeJedJJ/Ft+mk8MwAy9Fyjeb8u+98X/ErERIkDO3CHy1a5rbo9xfN/fk8jNG3
	23PW5jcbyUCP1xCmDfGPnv4EsFDDKHqpD6zJmlecTgPXlyU+TwvavgMEgWgZy0dwzdaX
	5escbnhwWoLVZYTtC4t4nF1qX8XDL1geYnQFhIFONlJymkVKSEeceVskC4AobnLUVg/O
	QzdeNl/Gyt/v4Sz5m1PMrTGD/i2DXws4rcCQCJ/BGQhRDctPh/lyXrOH5YwISNkBToZP
	jGrTw8PmxJts4etmJp/92qmdhN6WDSB6NvCHCDzIQ76U/LHDRNPxfAHRmr1V/i6UKuf1
	TAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U9cdbDmjeUaU2RDbxEV7pbNaM1voCg1DV5GFU3kmPJ0=;
	b=GAawpU3Mv0XRjk2rZ287EXHVJHryXkcqz9VAl6D+pIGwoB6FxOW/VhiLY0nYmGULS0
	VtDYA61A8tEW1cynikPw20dYgioo5DRwcLBkQfvhpLngP8zMW+WxBWpYFjjvLpfjABx6
	Sey0wzwgLijZk0E1mVsmh8VS4o87PV7j+SLMcLHuh87miIAMd1MjiNAqOLFuwkWx9gUQ
	lpTBJpaO+NlrvsUkZOSX8/56lpSmFz0Hw8+ronSF1cjzlQGo23jHFTx7P5nJIiWJ3pf3
	dTX3MCQiE4+JTtywsFn90JSkO+z3jWSr+lj83BcB56dPZVOgLQGIoQ3AMkZrTAsVLBhR
	i8VA==
X-Gm-Message-State: ALKqPwcaUxpxpxdjanJAPiJbbmQEiiEZno0YBXVJDhy4s1zP+35PZIhr
	QezRgvZLpQ+kFIJkrp2nMo89OwRv9x1TWZJVWWQ=
X-Google-Smtp-Source: AB8JxZp0QIOmVdraFrQP6MZtaS4zhJzKcV59AvDZKhLC70JjJCPq/qvuy+mV2+nTU09w275KT0bKCVx1oKPybTLLhlI=
X-Received: by 2002:a2e:5559:: with SMTP id j86-v6mr4498ljb.147.1527204634510; 
	Thu, 24 May 2018 16:30:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:320a:0:0:0:0:0 with HTTP; Thu, 24 May 2018 16:30:03
	-0700 (PDT)
In-Reply-To: <CADkTA4OEpSL+grTWxPKomoA0s2S8V6KuNfu3+kJUmy1zHCaTTg@mail.gmail.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
	<53bbe673-b84c-e155-7edf-c497b90b7ad1@intel.com>
	<CADkTA4OEpSL+grTWxPKomoA0s2S8V6KuNfu3+kJUmy1zHCaTTg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 May 2018 16:30:04 -0700
Message-ID: <CAKmqyKP-zowK6tSQkRTZOwbic1xg-7cGQiayha2BXHZ2v1UO+g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Thu, 24 May 2018 23:30:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 5:27 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:
>>
>> On 05/03/2018 04:49 AM, Alistair Francis wrote:
>> > +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES',
>> > 'numa', 'features/numa/numa.scc', '', d)}"
>>
>> Isn't this enough to pull in the required configuration from
>>
>>
>> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/numa/numa.cfg
>>
>> If numa.cfg is missing something in yocto-kernel-cache that should be
>> applied to all machines, perhaps these configurations should be added
>> there?
>
>
> Correct.
>
> I wanted to run with this patch myself before sending feedback. In fact, I
> think that the kernel-cache
> numa config fragments are being used anyway. But since I'm traveling, I
> haven't gotten to that yet.
>
> Alistair: if you drop your fragment, are you actually getting a failure
> during the kernel meta data task ?

From memory I didn't see a failure, but I didn't see the NUMA support
in the kernel.

I'll run a test now.

Alistair

>
> I will resubmit my patches shortly that allow any kernel to leverage the
> shared config frags, so
> using the ones in the kernel cache definitely makes sense.
>
> Bruce
>
>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


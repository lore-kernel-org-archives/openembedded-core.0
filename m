Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2FF74D41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 00:21:01 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 94-v6so6157738wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lFFSA/L/WJzY+vy0xeLeC9q435IBciUVq4jX8ryUKkg=;
	b=GRw5Lgi3j3oGnsmOW816X3erV4AXZZkvry8jtioAfAqfGSjAf2p/znavKwIxqNRkmc
	TJ28jqyro2BtwXTGg3E6HHT6MUIKa5SVkaNbhGeJgoo5BCbabScVcuFfrEnz/+Cng6bL
	KI4SJa/VhyeKXOXROeojaN6Cw7Fc6AH9Lvp9gb0rbL2rTqItPiQEKOXLi4yQs+fTL/cb
	9T0pzUsYpB85N1A1q6vZ52m4LR3vKsrTQEloiHphu9dyVucX9TtOG2qtj/+8C65v5RNK
	64HvuVy45xhItogDnkzSj3bR//IvMzz1SNagnCvfVzE6U8Tsh4sfkEZ/3yLsVs32U/VU
	o9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lFFSA/L/WJzY+vy0xeLeC9q435IBciUVq4jX8ryUKkg=;
	b=YFlhZhprsxleNO0ym3+aFJVy6V6hYZDxOTyoJBzkCPl//HAUCLJk0HpR/UsAZXnaok
	V4QpShBjO1I96nvj4LtNNEf7UssWTHUq2Wd9zZWHT4/ZT8gP3OiYiE9Wbgur90jlvobP
	jsn3F52jyH0NCiWjqJdHoyjgCNpDurnpUr9osMaMpx/10bFGN37zFtzDQCGWqilgxFhI
	l4r0OZftLZVVav5870amapOw1Xvd82h+OdJ7nvwE+eO6TwpqSGXBn7hAXgYscl0YMDet
	Od+tJlrXK+6dUir7zYieJLdS/p9lmZKQSZb0BFgwNyQuewPsYxKcGnzUbvq+PLNUaXc/
	pxPA==
X-Gm-Message-State: ALKqPwf33/tJyYwM71YQhkTI1DcacaOuyXz6T9EGEyE1hicNmjFJHhgn
	FNDh9K6Nlg3WiKRqe50eEOaU9WFCbhpnsJo2GdE=
X-Google-Smtp-Source: ADUXVKLLdYpniaYddpChaUwDAkwnBZOb4cmtrGwygEygJO0Yu88ay6UpTSoQ8/qjga+C2r3jyzRxrZDXhYXrV4qR4Io=
X-Received: by 2002:a19:d9d5:: with SMTP id s82-v6mr89702lfi.18.1527207662807; 
	Thu, 24 May 2018 17:21:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3c12:0:0:0:0:0 with HTTP; Thu, 24 May 2018 17:20:32
	-0700 (PDT)
In-Reply-To: <CAKmqyKP-zowK6tSQkRTZOwbic1xg-7cGQiayha2BXHZ2v1UO+g@mail.gmail.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
	<53bbe673-b84c-e155-7edf-c497b90b7ad1@intel.com>
	<CADkTA4OEpSL+grTWxPKomoA0s2S8V6KuNfu3+kJUmy1zHCaTTg@mail.gmail.com>
	<CAKmqyKP-zowK6tSQkRTZOwbic1xg-7cGQiayha2BXHZ2v1UO+g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 May 2018 17:20:32 -0700
Message-ID: <CAKmqyKNe0f4c4FiKMiRc+TSjsd-f5v0rJL36Bvw7aUvrUwccVg@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 May 2018 00:21:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 4:30 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Thu, May 24, 2018 at 5:27 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>>
>> On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:
>>>
>>> On 05/03/2018 04:49 AM, Alistair Francis wrote:
>>> > +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES',
>>> > 'numa', 'features/numa/numa.scc', '', d)}"
>>>
>>> Isn't this enough to pull in the required configuration from
>>>
>>>
>>> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/numa/numa.cfg
>>>
>>> If numa.cfg is missing something in yocto-kernel-cache that should be
>>> applied to all machines, perhaps these configurations should be added
>>> there?
>>
>>
>> Correct.
>>
>> I wanted to run with this patch myself before sending feedback. In fact, I
>> think that the kernel-cache
>> numa config fragments are being used anyway. But since I'm traveling, I
>> haven't gotten to that yet.
>>
>> Alistair: if you drop your fragment, are you actually getting a failure
>> during the kernel meta data task ?
>
> From memory I didn't see a failure, but I didn't see the NUMA support
> in the kernel.
>
> I'll run a test now.

It looks like the fragment isn't required.

Do you want me to resend the patch with the config fragment removed or
is something for this already in the works?

Alistair

>
> Alistair
>
>>
>> I will resubmit my patches shortly that allow any kernel to leverage the
>> shared config frags, so
>> using the ones in the kernel cache definitely makes sense.
>>
>> Bruce
>>
>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>> its end"
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


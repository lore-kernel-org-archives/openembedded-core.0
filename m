Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C434C47096
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.7113.1649903423902030725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hu2W2+EI;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id s18so7534210ejr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97QltCHtMCXo8MKUnqMBj/hwUM13FTVFZImK0c5EzAM=;
        b=Hu2W2+EIQimcmNAKvHYrz7rIhC3Il2Hx7iB9bVSfmJ08u0gbubmNwcfQhLeH22NYLo
         sipTUkaZoI2HLlCsgrr6US9La8yo/ENoDpKr9NNQfwDKENpH9OPcBONzx86OdMOtdDBx
         fssPCqOlWbVyHShCHYSp3X8mc8a8/2ZzWKYEYMz093ARC3pZmAYxUxVytVEr81FNMHog
         jkmFIGCT18BmvK+WhADV3Cg9IxsI39fYGP73fuqLsJsRgMHh/c5eqmOu2s6ZZroa9EpZ
         YZEtGhsfOEqcZNqsX6wWthgNKZKV8xeYm3vibA6WE1U95xyKwu7Vp6mm29F0mFm323Dg
         PA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97QltCHtMCXo8MKUnqMBj/hwUM13FTVFZImK0c5EzAM=;
        b=4c8yeCzj+1youp41fGX8hrJrTioVvBW9lavHjEIWt9HCuSomhHj3y9VYqhmcrVO01e
         2HCMCP2+8eHXswLK92Ze+aolV9Ku+jOj1JpR5KgmJfCvHyERJ1fevcsyXx3OZY/u1oBK
         abyP2B4jbml7W4Zok1pYIWgWTgvl1XFMjfSen4+HJqdF+2PGLYQoqNQJiRFfgyMcrwV5
         fh7A4TCcYWDETvBa4MaGRHkm074Aw9WaggY0P3ePJnaa5z9C60e39kLxdcI2y0sHPrGb
         7LTpkoLjKSZUa5ybfCgzJNz3U5jDXHJywx5R3Fz3eBZ1K2Z2WZSwzlAC09+0GqLodgAm
         wYgQ==
X-Gm-Message-State: AOAM530oLU71vVqM29+oMDGe/Xc1p4jiujFgXHpmmobR5At8/Wdv82bq
	a7tALtg8o8fHjk6EM7GDKAPenukaLG0By5Lzj44=
X-Google-Smtp-Source: 
 ABdhPJwG1D+89Po2IxWU3rpc9zuHgYGxUvJkhcP39xrou6gkwyrMyz5fhTXnpVDzbbKWsxwJiK28WlleMhnDOiA3bPY=
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr489058ejc.435.1649903422252; Wed, 13
 Apr 2022 19:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
 <20220413171926.771b4b06@melee>
 <16E57F14B019C5B6.11417@lists.openembedded.org>
In-Reply-To: <16E57F14B019C5B6.11417@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Apr 2022 22:30:11 -0400
Message-ID: 
 <CADkTA4MCq=_J0tNre6JM4NPOAFYNEit4xA56B2P+UtBAW34+Rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] kernel: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164376

On Wed, Apr 13, 2022 at 11:42 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
>
>
> On Wed, Apr 13, 2022 at 11:19 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>>
>> Hello Bruce,
>>
>> Il giorno Tue, 12 Apr 2022 17:45:55 -0400
>> "Bruce Ashfield" <bruce.ashfield@gmail.com> ha scritto:
>>
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > Richard,
>> >
>> > Here's the collection of -stable, fixes and tweaks that I was talking
>> > about during the engineering sync on Tuesday.
>> >
>> > Feel free to take what you want, or just wait on them all until the
>> > release is over.
>> >
>> > It is worth taking the 5.18 -dev and lttng fixes IMHO, since they do
>> > make the release a bit more future proof. Likewise with Jon's -tiny
>> > changes.
>> >
>> > Cheers,
>> >
>> > Bruce
>> >
>> > The following changes since commit
>> > 632c83ab787211ef927a999f4ecde1d3ce40621d:
>> >
>> >   license_image.bbclass: close package.manifest file (2022-04-10
>> > 08:31:17 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   git://git.yoctoproject.org/poky-contrib zedd/kernel
>> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>> >
>> > Bruce Ashfield (8):
>> >   linux-yocto/5.15: arm: poky-tiny cleanup and fixes
>> >   linux-yocto/5.15: update to v5.15.33
>> >   linux-yocto/5.10: update to v5.10.110
>> >   linux-yocto/5.10: base: enable kernel crypto userspace API
>> >   linux-yocto/5.15: base: enable kernel crypto userspace API
>> >   linux-yocto/5.15: kasan: fix BUG: sleeping function called from
>> >     invalid context
>> >   lttng-modules: support kernel 5.18+
>> >   linux-yocto-dev: update to v5.18+
>>
>> Sending this series to the autobuilders triggered some errors and
>> warnings (see below). Can you check that?
>>
>
> unfortunately not. I'll wait out the release and re-submit these later.
>
> That being said, I've run similar tests to the errors found on the AB, and can't reproduce locally, so I have no way to debug.
>
> Cheers,
>
> Bruce
>
>
>>
>> 1. kernel not booting on qemuppc
>>
>>   >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>   >> Configuration device id QEMU version 1 machine id 1
>>   >> CPUs: 1
>>   >> Memory: 256M
>>   >> UUID: 00000000-0000-0000-0000-000000000000
>>   >> CPU type PowerPC,G4
>>   milliseconds isn't unique.
>>   >> [ppc] Kernel already loaded (0x01000000 + 0x01394760) (initrd
>>   >> 0x00000000 + 0x00000000) [ppc] Kernel command line: root=/dev/vda rw mem=256M
>>   >> ip=192.168.7.4::192.168.7.3:255.255.255.0::eth0:off:8.8.8.8 console=ttyS0 console=ttyS1 console=tty console=ttyS0 printk.time=1
>>   >> switching to new context:
>>

I was able to steal a bit of time and did a git bisect on this one. i
have a suspected commit:

commit c894ac44786cfed383a6c6b20c1bfb12eb96018a
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Jan 25 10:12:18 2022 +0100

    fbdev: Hot-unplug firmware fb devices on forced removal
    commit 27599aacbaefcbf2af7b06b0029459bbf682000d upstream.

Which seems to line up with the messages in the panic.

I reverted it, and I'm able to boot again. I'll carry that locally and
see what the full upstream fix is later .. since this is going to hit
us on future kernels as well.

>>
>>   ===== end: snippet =====
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5012/steps/12/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5013/steps/12/logs/stdio
>>
>> 2. X.org not starting on qemuarm
>>
>> [    14.037] (EE) No devices detected.
>> [    14.039] (EE) Fatal server error:
>> [    14.040] (EE) no screens found(EE)
>> [    14.041] (EE)
>> Please consult the The X.Org Foundation support
>>          at http://wiki.x.org
>>  for help.
>> [    14.042] (EE) Please also check the log file at
>> "/var/log/Xorg.0.log" for additional information.
>> [    14.046] (EE) Server terminated with error (1). Closing log file.
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5053/steps/12/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5054/steps/12/logs/stdio
>>


This was related to Jon Mason's config changes to qemuarm for -tiny,
he's got it working again, and a fix should be incoming.

>>
>> 3. ptest warning
>>
>> AssertionError: Failed ptests:
>> {'strace': ['landlock_create_ruleset-y.gen.test',
>>             'landlock_create_ruleset-y.gen']}
>>
>> This is landlock-related, thus perhaps caused by patch 2/8.
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3117/steps/12/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3369/steps/12/logs/stdio
>>

No great idea on this one yet. I can't easily run ptests with my
aging/ancient builder, so I'll see if I can come up with a simpler way
to test it next week.

Bruce


>>
>> Best regards.
>> --
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164336): https://lists.openembedded.org/g/openembedded-core/message/164336
> Mute This Topic: https://lists.openembedded.org/mt/90428400/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


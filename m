Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.694.1623086340453479157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 10:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WnMmORvB;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id k4so17468977qkd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 10:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3FH/Z3qD90oWPj0J+nWQeJcbt+OhDkWJ6dbqx4kltus=;
        b=WnMmORvBXPgpWlz7oNy9qHhqOGHS3ZcwCm31HIAO9sBycPEGLqsz2t8QBpBoF/FJ9B
         nfFWu3ykr92lVpFN5LZh/uJoYaodChMJ2Qmlbkp/+wYH0Hr7Xm9Zwuqxrcjg3sQNazTm
         kAXqZw0pnzwDsAsaTrnqsAS32JgPAH65n7O9iruY7oV3VFfMrTEa3VgIpl37xFKWwRxY
         jyBYd5C3rS8WhH4+aNCnFIycCHVeBBIEqg+PTq2Sr+GAk1ujXWgFbHC5igBGl7M5z/V6
         qNVyj3IWLgjuNwG+AfeE4QfsK5ycSYkeB6gR7FGcxvzxrDJLUClYnuQokdsrrZFQvFZ8
         7Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3FH/Z3qD90oWPj0J+nWQeJcbt+OhDkWJ6dbqx4kltus=;
        b=mYAY/nX0KifaR6syzKIiPiKBt4Hovo22de6USmPesG+/FLrQGw/wUEz0kvsTj2xWC3
         Gaf6BcWD597uYGeRJeQeeHMm8+OXSfyVN4qZCn6N33pcFMSY6MXP1wcCRyu9k+VZN1Yf
         D/GEYOPFio/QEIxdGnaIBZzqPfJeWmdbSaVBp0eaIjPjIr2VSX/uobGBwilL72jx2ZuC
         XEcOSh/20im6IjT9X3Cgk8VPcCC0a9EBGaJHJ1Z5VQh+cSqva89+8nRsR1KOd1DIPUfY
         c71KGMQyCRZ/da/dWJxlE6ZX/MY10lQrItIO/1P9wTPJXaklZqmBcgBe8ZBKhEZ66pL/
         BmgQ==
X-Gm-Message-State: AOAM531cj4U+Nfd9ISTSp+YF2/uf7KanKdBf3Sw19C/CmEMPKf/YidmE
	jRZXdr94Y9zoWjPb19N6wm2yV1KTMbmJRChNE9s=
X-Google-Smtp-Source: ABdhPJyWOnEOLS7AUVTGkhHusegAYI3FllqbJYgPT32/+cb4ujhhqKi58MVz5MxuEFPyRoKuxgbE4JZ6WEG4tVAao0Y=
X-Received: by 2002:a37:444a:: with SMTP id r71mr17403110qka.381.1623086339467;
 Mon, 07 Jun 2021 10:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
 <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
 <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
 <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com>
 <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com>
 <CAMKF1sobgTDj0Cf5TZ=DcO00tTGQb=q2yPiMuub57-PfAv058w@mail.gmail.com> <CADfgfob3EjTPSuxOXQ1EbR6j108OqcKi_oNibGE9xQ-=_AHxGQ@mail.gmail.com>
In-Reply-To: <CADfgfob3EjTPSuxOXQ1EbR6j108OqcKi_oNibGE9xQ-=_AHxGQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 7 Jun 2021 10:18:33 -0700
Message-ID: <CAMKF1spK+WC_J-pb-iYsnvHzVj4-sr8YKaz63yjCU98F+VurTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 9:41 AM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
>
>
> On Mon, Jun 7, 2021 at 8:10 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Mon, Jun 7, 2021 at 3:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>>
>>> On Mon, 7 Jun 2021 at 00:19, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> here is a small testcase to excercise utimensat_time64
>>>> https://raw.githubusercontent.com/xantares/test-seccomp-time64/master/test-time64.c
>>>>
>>>> gcc -m32 test-time64.c
>>>>
>>>> it will be good to check how the resulting binary behaves with centos
>>>> provided libc and sdk provided one.
>>>
>>>
>>> Yes, testing the issue without involving the sdk would be good, but I can't build it in the host environment, and don't have rights to install missing 32 bit support packages (not sure what that would be):
>>>
>>> /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such file or directory
>>>  # include <gnu/stubs-32.h>
>>
>>
>> Yeah it needs 32bit development libc and compiler installed
>
>
>
> I added the needed packages to the CentOS workers. The compiled binary prints "rc=0" on the three CentOS workers.

can we now try linking and running it against SDK built nativesdk-glibc ?

>
> Is reverting to an older kernel in order yet?
>
>>
>>
>>>
>>>            ^~~~~~~~~~~~~~~~
>>>
>>> Alex
>
>
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer

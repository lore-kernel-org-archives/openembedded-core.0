Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.12501.1611669917556492007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dTXN+EVF;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id f2so14473269ljp.11
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PAx3NFzTRgeZvyMvF47FMqhVih4WyZB1xpjNmxW/0Lc=;
        b=dTXN+EVFN1/DR1oSCQOuQQquApACxpats9J0a1RKWTFV6gj1OSRcS601DHJbn86CYN
         TD8KAwhi37DYI5ZlqsQUAfjlGDlSqVRIkBUX73ZDEgjvniHCUCeKjAEhujYiGm23Z7zi
         abb5b6ycAAIR3Z6MUIRYh4bMmVi3jymPhM95qhvMcjOEqHGsSRy4gg9IYAw7bIOTSvR5
         TnIoUVHxqVk9iwNL7S2TlbnB6Be/Ooxmcu9S3ET7EZUNM3v1tntvEA0TdWMbC6JQi6bC
         0biQStAjChNf6XDIIHnYA+p4NKcPFst628XUV2+3bx6USdAiD8H0CqsP9n/CBAdrrIZV
         OIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PAx3NFzTRgeZvyMvF47FMqhVih4WyZB1xpjNmxW/0Lc=;
        b=SvjJ2lwFaUc9Ivsb/+rPekFwVPJE/jLVV69PC6uU/HOyXU9k4ObUkkHqL1IsbHqiLN
         p19eP8eaUw/iHPbaxg2wD8gDjOBlTdiNzV+FtcKQ0vPCSWe/VwTItR9U7bPnCqwu7gzc
         RgQPuigxaAdmhznuadhodqfcwtq+USFbvub9r270FanWO7l6nCn5sA7aPRRQzKlpNX0a
         h1kYXTyOqTaecVHa9tZY0iwarhCsRGsr3BnXYyzMZuBKOgj3ULmSBOaSDbU0UziA+LRr
         o3nbYw7wll/Rh5MJWO13efECXKH97Vpup1qEWsLj7d9og/6XtZcHAHM0yWK7+GEPh06t
         mvYw==
X-Gm-Message-State: AOAM532ECww2Pnk10nxKbI3cXGnUppBPr83G70IeeOU4lR0ErHAeSkdL
	QjQMQeB04/8CFUxKLHOvC7TFHrtAQ/0JTCFxF7E=
X-Google-Smtp-Source: ABdhPJwb66nr+LsPzNkUQjAI2uPbBk/qCUqGbEpqyfNcba5b5sfr21zx/iCIxMbCGwid6rBsrkqjmRyYX1cyoELD5ww=
X-Received: by 2002:a2e:b4d3:: with SMTP id r19mr2985396ljm.419.1611669914961;
 Tue, 26 Jan 2021 06:05:14 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
 <CANNYZj9eoz-9xvEpCSD6mgMwETMn_R8xPEtYc1jVK0FSF3qpSQ@mail.gmail.com>
 <CAHtQpK7ZtJ9edRJeCyjvdH3eQXur4pqaSd1btpS1S-MC5KvNyQ@mail.gmail.com> <CANNYZj-DHZ6TwgJmtF6JwP==efpGL-BjGawyqs1tBn_qSgYDBQ@mail.gmail.com>
In-Reply-To: <CANNYZj-DHZ6TwgJmtF6JwP==efpGL-BjGawyqs1tBn_qSgYDBQ@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 Jan 2021 15:05:04 +0100
Message-ID: <CAHtQpK5OX=ZqU_D3U7ODu0LxKkNMo0oKM+jn-+PyCYaH-cjf-Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell]: gpsd recipe (3.19) build is broken
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 2:34 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Version upgrades which bring new features and changes are a tough sell for LTS branches.

This I understand, hence my message to Steve was to rather consider it. :)

I'll dig it further to find a suitable patch then, can't promise a
fast outcome though.

>
> Alex
>
> On Tue, 26 Jan 2021 at 14:10, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>>
>> Hello Alex,
>>
>> On Tue, Jan 26, 2021 at 1:48 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Can you rather identify a single commit that can be backported to fix the specific issue you see?
>>
>> This I did tried at the beginning (was considering to get a
>> low-hanging fruit), but it appears that it is not quite trivial -
>> there is a significant amount of commits in between 2 versions...
>>
>> If that would be a preferred option over version upgrade - I can try
>> to bisect it further, just need more time to identify it.
>>
>> >
>> > Alex
>> >
>> > On Tue, 26 Jan 2021 at 13:13, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>> >>
>> >> Hello Steve,
>> >>
>> >> gpsd recipe build breaks on the dunfell branch with following error messages:
>> >>
>> >> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
>> >> ./libgpsd.a(ppsthread.o): undefined reference to symbol
>> >> 'pthread_create@@GLIBC_2.17'
>> >> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
>> >> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
>> >> error adding symbols: DSO missing from command line
>> >>
>> >> This cannot be reproduced on the current master branch, where the
>> >> version of gpsd recipe has been bumped up from 3.19 to 3.20.
>> >>
>> >> Can you please consider to cherry-pick following commits from master
>> >> in order to upgrade the gspd version on dunfell branch:
>> >>
>> >> 98e61961c gpsd: add new init script
>> >> 04afc692a gpsd: mark CLEANBROKEN
>> >> 33a15c790 gpsd: fix build on aarch64
>> >> cecab9c4c gpsd: Upgrade 3.19 -> 3.20
>> >>
>> >> I've tried to cherry-pick them locally and they do apply clean. Also
>> >> the build of gpsd is successful after this upgrade.
>> >>
>> >> --
>> >> Regards,
>> >> Andrey.
>> >>
>> >> 
>> >>
>>
>>
>> --
>> Regards,
>> Andrey.



-- 
Regards,
Andrey.

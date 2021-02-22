Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.1511.1614021263563137452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 11:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W1xjVclE;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id v3so10088693qtw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 11:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Q1VzVbfBCSL1CAqeprfNKPI+hpeb7uT8110SdRDZt0=;
        b=W1xjVclEsBEEdGDZbdU1lNXxeA3kYP/76kS+HxjcU6kF0mH+IY3QLdjQH/M4gepGL5
         t8O0GLB8Vi4b+j3+nSUzlNV/3C//ryiP3W57k60p8/8cMRJluIpzH/tcFSoSmMO4Le7M
         CUYw61uK2l1ULX4Xz9CAENhqCqhQ5JXBGT2ZACyzuZ7JD0yt1pL9gKrlar53s3XEt0Yu
         CRR0nLjdMRnB85A78hwhjWvsPHEe9fOUCq1wGNhi4eP5TPgkm5pdJW2LT1dkKhPJ7gIC
         bkuzf3ZD9ZEstXyZupuV0JKmVC7m0NX+JKce6Rvb5f5iJzY8yEd/uhWuktX8WCQ/+T0z
         I9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Q1VzVbfBCSL1CAqeprfNKPI+hpeb7uT8110SdRDZt0=;
        b=Ql72SDAaRRdoUw/QTdZVqCYArUfwe+DUrBeNLloG+FneZQWbS/ICsrWb+LynVHL2E3
         HwgUk7EzdGrfhyEL8sXWQchDdh2R/rMOUcAt0c0+RF3/eDuVkp5QcRn2aUwhg5TTocZZ
         N+QrV0mNV6I3iq3i5FAq03pqL/OvtXI5J8TcGwU/v9LiidUlQSkvIqOyoq/LnshgQPux
         XHeEydJZZ0jTO6FMaI5c9OHagLySph31zP5FkWCoYZXeIfKYMF7cO5+0zxgY8oPeqBFj
         eScwpni4NQRUjzjGLGh2P/9GfYhQQHDi02vZ0oDoft5sTsbC0eoigxit60OogsEI+37s
         sh7Q==
X-Gm-Message-State: AOAM532N5lb/QTwHaHJjoLIRO9aF/8TE4523ItVB3Fp2YHLSe3rxnyEF
	ZYa2sS5Q0RZEimis5dkFjMv8Z14nxGOEnwmL2Zs=
X-Google-Smtp-Source: ABdhPJz/bBIAkye/FYqWBQHTJCF/qTCJ/2mGQnwFrfwXv1cemWAV34DDk/ZggmDNKilA3DZcbSWWlP5d3I1B1BGMDsY=
X-Received: by 2002:ac8:d4f:: with SMTP id r15mr5630090qti.289.1614021262639;
 Mon, 22 Feb 2021 11:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20210222154956.27267-1-andrej.valek@siemens.com>
 <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
 <CANNYZj_1RL9rSJxaaRTQf__mnzEr49Eze5gW44TBtJn7FEhN0Q@mail.gmail.com>
 <9ea4df35-c70e-e03e-7fea-e56960ef17c6@gmail.com> <CANNYZj9xb3q+b4Mqng_RQoR+NvstzwOXeHRfCMrKuyCyxzyNEQ@mail.gmail.com>
In-Reply-To: <CANNYZj9xb3q+b4Mqng_RQoR+NvstzwOXeHRfCMrKuyCyxzyNEQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 22 Feb 2021 11:13:56 -0800
Message-ID: <CAMKF1sr0cHysY1wjfmXTsKVQ-1nhzx3=avprqfMC+AVU1QWzYA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] busybox: search stable versions for AUH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Andrej Valek <andrej.valek@siemens.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 22, 2021 at 10:44 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Right here: https://busybox.net/
>
I see.
Gap between 1.32.0 and 1.32.1 release was about 6 months, I am not
sure if all distros are waiting for dot releases or not. I see that
upcoming fedora 34 ( due in April )
is already packaging busybox 1.33.0

> Alex
>
>
> On Mon, 22 Feb 2021 at 18:37, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 2/22/21 8:39 AM, Alexander Kanavin wrote:
>> > On Mon, 22 Feb 2021 at 17:02, Richard Purdie
>> > <richard.purdie@linuxfoundation.org
>> > <mailto:richard.purdie@linuxfoundation.org>> wrote:
>> >
>> >      > +UPSTREAM_CHECK_URI = "https://busybox.net/ <https://busybox.net/>"
>> >      > +UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\
>> >     \(stable\)"
>> >     I just realised/wondered whether:
>> >
>> >     inherit upstream-version-is-even
>> >
>> >     would work here?
>> >
>> >
>> > I don't think so - busybox seems to declare x.y.0 as unstable, and
>> > everything else as stable.
>> >
>>
>> is it documented somewhere that x.y.0 is unstable ?
>> https://git.busybox.net/busybox/commit/?id=a4c3a341394a1fb25be8c15d2ddfe3ec77cbb83c
>>
>> seems to indicate its a normal release.
>>
>> > Alex
>> >
>> >
>> > 
>> >

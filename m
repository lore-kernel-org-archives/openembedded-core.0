Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web11.1742.1588120269601316779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 17:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WQf0mveL;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id x136so210031vsx.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 17:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TauEddASoU/2PGbfEf/vmDVe8G7TrZDpFRTRBWSwvyQ=;
        b=WQf0mveLL7qVVyTY40qFfy7Xw7A46Lx8XYOKlucEK47VsY/6pz2Ky+P8gLuQG9kw23
         w7MMt1i85MaAyiVwsbuEJUBa2+6WRdOwR5S3jLvqYUVbfpmVB+i4KWIDkI1EHHtkG+yW
         AMj7m4YSx1qiLmJ6x89JQFUO06ydbXx+Nmhdl85L12Y8kr2Gqvwk7l3PDsYMKNKx+LlP
         nwl2Pmew+gtfQfK5m9dZ/CBdl/J5C5Yk7ZouhGHgVNA2bMixUuuGbsYzKgG9rMVaIc/a
         n68nXh93N0pBMWJhgRxAlSXx5WzvoomoeYyYzFPkI/d3TmxjEycQPp3KDFnslxrIUzES
         0gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TauEddASoU/2PGbfEf/vmDVe8G7TrZDpFRTRBWSwvyQ=;
        b=GQtsI/BsFeLnr/9gCjB+X6PUH8KEoYoXVMfWAwNVtrVQ5PyI8J3r96tod4IEQLN17S
         5ArJfmvkn02jt/dTlLhBkn7ikb+8RwpJ8x6Ea941LAZu4XoaSXb+QyDw7vvmCKa+XnHA
         DkXPYZkN5Q+YYwavuyALHbOy7YLwm/Je1hn2uXORajjMORBWHLwp5CwXM2x1KHSAG0ZM
         8n5i9KfZw1omlRF/ZhPUne/Zgp52Adon8f0WjCdHLOjLTie7djvzwoMUsjXx/eCmB9VY
         Zt6IOF8r5ztW97EOehnjjaUdxPeZ75pU2BbEEkPUP6oO3AjWZtYomj0xjEsH4UFtIAnA
         PisQ==
X-Gm-Message-State: AGi0PubM5P6QigKp1RwedS571kAQ8m1pl+t5Nw9Uk+SuS3B4cZGaYgoR
	JH2v6HiptWp9YL7lxWZg2MeJt5krbMyO0Z6ap84=
X-Google-Smtp-Source: APiQypJsrYlMexI+tCZVJYKCQHedVT5En1ql8ifVsjDNrJzmJBsYfr4oqjLSV12Ph2HONeR1uJ4JcmJPt8p5hEjorNY=
X-Received: by 2002:a67:342:: with SMTP id 63mr10243391vsd.11.1588120268469;
 Tue, 28 Apr 2020 17:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200315042947.3257882-1-raj.khem@gmail.com> <cc5e7bc5640347ac632c65f9f2ebf1f6a2693a0c.camel@linuxfoundation.org>
 <CAMKF1spW8XY4q2rbo8on6AiVjsrF+xmLCSgJ9-Yza31=18VWEg@mail.gmail.com>
 <3d626d46a2cf1cb10d0ae41444db96a65e65e201.camel@linuxfoundation.org> <CAMKF1sozrcG05rufCSBG0TPLhY6MJUy2dOL8Mh7DDUqSqfRzPA@mail.gmail.com>
In-Reply-To: <CAMKF1sozrcG05rufCSBG0TPLhY6MJUy2dOL8Mh7DDUqSqfRzPA@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 28 Apr 2020 17:30:59 -0700
Message-ID: <CAJ86T=V_ag5ksRkFo60by3qa4+RaZGrMWXSY+zycc0iCDPdtLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bison: Reset load average settings if specified in environment
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 15, 2020 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Mar 15, 2020 at 3:25 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> On Sun, 2020-03-15 at 15:23 -0700, Khem Raj wrote:
>> > On Sun, Mar 15, 2020 at 3:14 PM Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> > > On Sat, 2020-03-14 at 21:29 -0700, Khem Raj wrote:
>> > > > In some cases, we run into parallel build failures where
>> > > > BUILT_SOURCES
>> > > > is skipped, as a result required header files are not generated and
>> > > > the
>> > > > build fails with missing header errors like
>> > > >
>> > > > ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h:
>> > > > No such file or directory
>> > > >  #include "uniwidth.h"
>> > > >           ^~~~~~~~~~~~
>> > > > compilation terminated.
>> > > >
>> > > > BUILT_SOURCES should be built automatically with `make all` [1]
>> > > > therefore
>> > > > ensure that make is invoked with `all` target
>> > > >
>> > > > bison-native parallel build fails when -l<n> is passed globally from
>> > > > build environment, errors like below due to race starts to show up
>> > > >
>> > > > Therefore removes a previous load limit if set
>> > > >
>> > > > [1]
>> > > > https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Example.html#Built-Sources-Example
>> > >
>> > > I'm not sure I understand this. We've seen a failure on our ubuntu1604
>> > > performance tester which I think is the same bug as this. The
>> > > environment on that machine doesn't change, so how/where is this -l
>> > > option coming from?
>> >
>> > From custom distro global settings for EXTRA_OEMAKE
>> >
>> > > I suspect there is some issue we're not quite getting to still :(
>> > >
>> >  its well reproducible now with -j and -l together on our builders, From what
>> > I see in makefiles bison is doing right thing in using BUILT_SOURCES so
>> > I suspect it could be make acting in a certain way when those options
>> > are present.
>> >
>> > our custom settings use -l options globally in EXTRA_OEMAKE
>> > this is to let machines with certain configurations build when machines are
>> > shared, we don't want a given build to use all resources on box. Yes one
>> > could say why not do something else to limit the resources build uses but
>> > this is a global setting that works well
>> >
>> > This patch just ensures that any -l setting passed from environment is
>> > cleaned up and reset. So for general case it will be a noop.
>>
>> Ok, that explains your failure but not the one on our performance
>> testing worker :/.

I've heard reports of this still being an issue with latest OE 3.1
when -j is set high enough, without any -l options in EXTRA_OEMAKE (so
Khem's workaround to over-ride -l doesn't help).

Disabling PARALLEL_MAKE completely might be the best workaround for
now until we understand the real root cause.

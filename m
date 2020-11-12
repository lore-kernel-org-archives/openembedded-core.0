Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.7698.1605201440577439956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DyeKOC55;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id i19so8974714ejx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jCi/lmI7S0mFnwrLxLKLHT0C5Sdiv7TQUSJ1x3Cqlq8=;
        b=DyeKOC55oh5dGXOmtVXU3AS2ap0I52pk3QGyOUaxeSKEB9dQqk/+KL3PhvVEoQJuU8
         Z1T830KL5sVjm8/K8UtEDecbOcuBcE6WpizdZKpTsc7jcySIaCRMyVVSqCh8E+qlQrTk
         GGYbFvuX8TtVkuErH+4f/PCy+UhIaMfxXORpQjBdCfFbd9sj+iw/3OpLa/kbTchqmjJS
         7Vp//Lo4DfcYNNXHSN6Ilh0wVuhLEZ5rsAbf/JQ983bkRKgz8HBNc4ob/0MTED33Isrp
         g97TAQTbeMwm9NUXItVIa0lFGdQWLPNo2bOWFtJE7WJkQwf6wDidfv9GfNlQCF/5QfIr
         TI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jCi/lmI7S0mFnwrLxLKLHT0C5Sdiv7TQUSJ1x3Cqlq8=;
        b=A1WG0yN+UWa96Kdrj9YibiI+Pc6eYg+sj8VEeqo0dIOmm93yJ4iqPvTZOwSkeobvfk
         UxL3kVOhLfQVHghbX5aEST7QO5173Z9BcTzOP/L5TH1LHWzWRrOUaSfH/8inayj0XE5D
         RQkLQZsV3iTPxp2v1ML88/QhbpDkGY15pUbJLfJkF84Cg+zfWnf703f3jqYOTltwrfXo
         m1EkUq8ix9Jil6QeXXR9k2+0SrxZlP6oiGjlFevbpdSn2pBbIrSgYKx22C+ihBKVJdAM
         QVBpVt88+WRNdWdLowhd01P5q6vyvUo5N2kUDQ2fn51/K+wF8VW71a5thQEV56uFwFDB
         /GgA==
X-Gm-Message-State: AOAM531BC6rXWVOH3eNEKpKndJ4v7eq/T89REPqW+D3ISkypk9NNaag/
	OAyW5DaWtaBedjZnQIVJIXT4HLlaFKg6Nv0euXk=
X-Google-Smtp-Source: ABdhPJxqN0dkxKyer58ITQkUFk/2h5qmkUpslkWO0phWSdOds8mdOmC+03XuVdQJpxQ2Dc5M4qlGbVRIe+9wUKcV4GI=
X-Received: by 2002:a17:906:4742:: with SMTP id j2mr257657ejs.247.1605201438811;
 Thu, 12 Nov 2020 09:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20200921141544.3145189-1-yann@blade-group.com>
 <20200921141544.3145189-9-yann@blade-group.com> <1c41fc0d0f0928baeacb628812cafd66de745b75.camel@linuxfoundation.org>
 <CA+4=imb9n8r-taOxj68JagEVJkisUFk3vHVbKOru8Td24kLHdg@mail.gmail.com>
 <581392d58d402cf3b79f8bd36f8d5d5f7fa4c1bd.camel@linuxfoundation.org>
 <CADkTA4M4nAke3L=GPseCHGT=rmqVnKbNWGd8QEyzz_saeKt3pQ@mail.gmail.com> <CA+4=imbn07uhvLje-M_U1x4yPA57sTFPa3L0YLnhhfPV_skrqw@mail.gmail.com>
In-Reply-To: <CA+4=imbn07uhvLje-M_U1x4yPA57sTFPa3L0YLnhhfPV_skrqw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 12 Nov 2020 12:17:27 -0500
Message-ID: <CADkTA4PPRx2n7927fLsSriSqcDUECDybwTAaq5G6=9o=M+Dtrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] New systemtap.bb class, and systemtap-demo.bb to illustrate it.
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 12:02 PM Yann Dirson
<yann.dirson@blade-group.com> wrote:
>
>
>
> Le mar. 22 sept. 2020 =C3=A0 02:41, Bruce Ashfield <bruce.ashfield@gmail=
.com> a =C3=A9crit :
>>
>> On Mon, Sep 21, 2020 at 6:51 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Mon, 2020-09-21 at 23:23 +0200, Yann Dirson wrote:
>> > >
>> > >
>> > > Le lun. 21 sept. 2020 =C3=A0 21:46, Richard Purdie <
>> > > richard.purdie@linuxfoundation.org> a =C3=A9crit :
>> > > > On Mon, 2020-09-21 at 16:15 +0200, Yann Dirson wrote:
>> > > > > From: Yann Dirson <yann@blade-group.com>
>> > > > >
>> > > > > ---
>> > > > >  meta/classes/systemtap.bbclass                | 74
>> > > > +++++++++++++++++++
>> > > > >  .../systemtap/systemtap-demo_git.bb           | 71
>> > > > ++++++++++++++++++
>> > > > >  2 files changed, 145 insertions(+)
>> > > > >  create mode 100644 meta/classes/systemtap.bbclass
>> > > > >  create mode 100644 meta/recipes-kernel/systemtap/systemtap-
>> > > > demo_git.bb
>> > > >
>> > > > I'm afraid this patch is going to throw warnings all over the
>> > > > autobuilder, e.g.:
>> > > >
>> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds=
/2488
>> > > >
>> > > > (and there will be more).
>> > > >
>> > > > We are trying to ensure all warnings are solved so that any that =
do
>> > > > show are real issues and this patch would significantly distract
>> > > > from
>> > > > that.
>> > >
>> > > OK, we could default to built just the handful of probes that shoul=
d
>> > > always build, and give instructions for those willing to use the
>> > > current behaviour.
>> >
>> > I think that is going to be safer and we could grow into more example=
s
>> > if/as/when we van build them.
>>
>> Also, as the person that usually picks up systemtap breakage first
>> on our new kernel versions .. we need to make sure that the reworked
>> recipe and class pass the oe-selftest for stap.
>
>
> AFAICT, if we exclude this last patch, the only impact on tests is that =
those
> testing modules with crosstap (which I only learnt about when looking fo=
r those tests)
> and pulling the full systemtap package should be changed to pull systemt=
ap-runtime
> instead.
>
> Now adding tests for the modules built with systemtap.class is a differe=
nt thing.
>
>> It is doing on target compilation, so ideally, that test should be expa=
nded
>> to test bot the cross and on-target variants.
>
>
> The on-target compilation is already tested by meta/lib/oeqa/runtime/cas=
es/stap.py,
> and there are crosstap tests in meta/lib/oeqa/selftest/cases/runtime_tes=
t.py.

I'm aware of that ..... I'm the one that runs them against most new kernel=
s :D

Bruce

>
> I have started to look at adding a test for modules cross-built by syste=
mtap.bbclass,
> but as it takes ages to run those tests it seems it would make sense to =
move this last
> patch into a series of its own.
>
>
>>
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > >
>> > > > I'm also wary that we're now in feature freeze for release so
>> > > > perhaps
>> > > > these changes should wait until 3.3?
>> > >
>> > > OK, I can reroll a series with just the fixes.
>> >
>> > That would be great.
>> >
>> > > For the rest should I just wait for the gatesgarth branch to be
>> > > created and resubmit then ?
>> >
>> > Once we start taking new work on master, yes.
>> >
>> > Also, for a new recipe like this we need a maintainers entry, else we
>> > see:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/137=
7
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>> >=20
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

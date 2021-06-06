Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.28741.1623017953488748272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VovT3grN;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id t6so2038460qvp.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BymsLQO6q6osfgY9NV1zS8Y4OEFft0M7osNe3Q/wRao=;
        b=VovT3grN8GVVvmrWmWouDSl4rymT+OPoUtoPEF5yBgT6WhVh6tlTc77sKvuX9sJqSL
         Kgj8AUfg86SJmauSnhefynoIrp5khxNJY01fJndiIPBskAbeF4BOR/4FgepxDL7codZT
         ODqL9EqIqncFRmV7HKJOgQmfTRATihE4jLcEiw9ZVopN7Q+XuxPeOk2tULW+7tdGOEHV
         UXDxqzZeaixdTcEzSQ6WCVUlMHI5VGCUBJLFOlTmZqz4nZxridSlZHYPT6M/vuE2QnrK
         UzZ9SPXI6GP1CcADUwxM+6S/RYVQ663uX9fvGtJB+youqTiv8Jx1p4UQMl+63h9uvUI+
         xhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BymsLQO6q6osfgY9NV1zS8Y4OEFft0M7osNe3Q/wRao=;
        b=O1/SnGpl1LKJQS/EkM7KtZ6HZPbWlw15IbS8cggvuSKYaUR+d+kWdObv1yy1q4aIII
         pmE0d+b2HV6NAs3yU07EkNgYd7Dm4aeplJaK07ZMjHT8aRu1puRtTfmDnYz/aG4/FK3c
         CZM+OGnhFbrmTG2Rrb0+EQzh1Ao0IWnKlMm9PMUr0mpRCo0/aRbVSgRrVRmCyyG6ZjXP
         Wz/PhlaCFr2qmQ47D2DpdktPmA5uc0qbFnfPKCgP9AOkzWKxmGwxeN8SlhGWsAplQmGz
         Knli8dVJ8eqs+NW6KIUzq51kV3JLTMTpso1pKkrlLQoM6OoriSHgvBG5sMim3cOzFyhX
         nm3w==
X-Gm-Message-State: AOAM530Ndt1uxupN3ZHOeKE09Ur4Nl74KK9+d3Zu868XfgRnePLxydth
	Ji/Grd8WTCUmccxEw61BEVgL0MJxD1PlTs5jhks=
X-Google-Smtp-Source: ABdhPJxQUcka+QC1lWYKa1Z8qePr4XCa+nU81ekIoZBtLScpSXrQ3hMzpQ63GZBiqUsBdoitSGibI5n5IZiKhGl4ta0=
X-Received: by 2002:a0c:f089:: with SMTP id g9mr11617513qvk.50.1623017952524;
 Sun, 06 Jun 2021 15:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
 <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com> <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
In-Reply-To: <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 6 Jun 2021 15:18:46 -0700
Message-ID: <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 6, 2021 at 3:06 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sun, 6 Jun 2021 at 23:51, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> Good sleuthing.  Can you find out if libseccomp is in play ? if so
>> what version of libseccomp is being used by cmake if it is libseccomp
>> < 2.4.2 then time64 syscall support won't be there unless
>> its backported to the older version.
>
>
> From what i could tell cmake does not use libseccomp, but centos8 could have some kind of syscall filtering in place. It would be good to try with a few older centos8 kernels.
>

here is a small testcase to excercise utimensat_time64
https://raw.githubusercontent.com/xantares/test-seccomp-time64/master/test-time64.c

gcc -m32 test-time64.c

it will be good to check how the resulting binary behaves with centos
provided libc and sdk provided one.
> Alex

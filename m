Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.7413.1602145921941985425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 01:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=wr2a1UB8;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id p15so4820072ljj.8
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGRDnGWepLPqAGK6+eRkIgQnlChSNjrd7jMA68hw6+U=;
        b=wr2a1UB8VNXEbLJvOTE2oSMopKVzTiZVg8KKoWwBs/jkbOU7yTW57wULvy7u0gKkKh
         6veUmamrwCfxOaejn0xZOk5UKcYVcsv887u4nURmdavElyvfnLqYwJPEXRmpgfiumL3k
         VEel62TX4EXnPV/sXUjqQVuOdjAzSf+CRyTSoIfVesubRhA9nSWXqHJQ532NlPWdQyLZ
         p189s90LCK5LtvZcWPr6cNwtCuQqzExUhgrs9xVSx6YuVS3iqP+jFsZ9bT6vu6kq26mZ
         pkFg2h3UrmP5DMsvug2b7G5/g1ldzUVWyZMToPUnXG83zu8QO9dglwAjjqi+9ldDF6Go
         hkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGRDnGWepLPqAGK6+eRkIgQnlChSNjrd7jMA68hw6+U=;
        b=HbZ8vvEA9Cm3pReGLEqF4xVGJ1fDRqcQFEaRPU4tL3O8EFk1EF9fpW9s+iX8CYOYnT
         0AMfzGjP6c+yCQELKCXUdYs/l5RJKmVPwaaVGUOa1klm0Vs5kDEg1k/ntH1AY39z16Hm
         zRwrBizN4fvZMR3W8tzLmnBfMr4DW3sMGy3quI8bhRHTs70cbVGzG1sp8INTmtTmRoNy
         rGxEf8Yq1kvxOoGwWpedfFx/3bZDzVD/ZlTBViXPoTKCIiD+GOB0w/WaS/AVY65zUth9
         cp4xQoF5qBIGHUMK/KYSwNb7N7CHqSMx1LEuhh7U/cnME/BwAHKEFzdBDsbRK883fhh4
         Q7rA==
X-Gm-Message-State: AOAM531cVxETZLR1ThL0sMAISy8xFYFvDsB5ikttWZRxELlQN0efN02X
	uPWoxuUGUyJ4Er7OueEp36oFlriooxChJoPCD7n4tg==
X-Google-Smtp-Source: ABdhPJyhygkbi+chD4NkqpxUeRx14uwJoRlU/FVblKq14Zr6D0UynASg7iA28peZfZEptyld7TL7kPtxfZSok3CqUds=
X-Received: by 2002:a2e:83d7:: with SMTP id s23mr2893885ljh.340.1602145919717;
 Thu, 08 Oct 2020 01:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201006111444.3952584-1-ross.burton@arm.com> <20201006111444.3952584-2-ross.burton@arm.com>
 <CAMKF1spSQo7vi9qVN5TMHJ4QrcLj2sw4VJXMxcM0sSiFf9OvaQ@mail.gmail.com> <CAAnfSTv44odADoSgCQXgYRO-yiHXejRwwe47VrhWZiwj7wYL3A@mail.gmail.com>
In-Reply-To: <CAAnfSTv44odADoSgCQXgYRO-yiHXejRwwe47VrhWZiwj7wYL3A@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 8 Oct 2020 09:31:46 +0100
Message-ID: <CAAnfSTu5Oj7MuH526JzERoq4ktj5UyZdL1-Fc0NFLcx__MsOAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] boost: don't specify gcc version
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

From boost's log.do_compile:
notice: using rc compiler :: <toolset>gcc-10.2.0 :: as

On my host:
$ gcc --version
gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0

Ross

On Tue, 6 Oct 2020 at 20:45, Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 6 Oct 2020 at 17:14, Khem Raj <raj.khem@gmail.com> wrote:
> > does it probe the version from cross compiler now and not the host compiler ?
>
> I shall triple check :)
>
> Ross

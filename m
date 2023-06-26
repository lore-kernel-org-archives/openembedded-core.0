Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C41EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 07:10:32 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.2526.1687763427265906811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 00:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=d9UL1TL5;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-78333585d28so121253239f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687763426; x=1690355426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwP3V6o5tmSX/46zjC0Iu6hKWQXgmtkSZx9mERIECps=;
        b=d9UL1TL5orX3hVCyPT/xFdxEBu7RYJmt6gOrVRDeeIZXusKUtNZyxmm3cHOSPHepGH
         95N41g2+fPC1kRRyU7jpR+ucuE9j+hCMlCb9sxw1um3+aFqyGskbEcW6LjGZZKO/ZOuC
         nItg0fqSzobFF/XcvKDEozBf1AOAh7yANVytBwfGm0WktwuoWLR+Ia6oCmsKhdtRmLdX
         iwb7iplToPkZtwjEgB/OPSw/fjkHeUA3jyfBk/xpHdFngWH2Q6aullUKi+WkgTOEvzj4
         dc6eq/8KLP2gOXtv5LXOFnm32EoKcp6n/R38NnUBf335IbjHIbelelAjRenZ104IPREw
         SrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687763426; x=1690355426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwP3V6o5tmSX/46zjC0Iu6hKWQXgmtkSZx9mERIECps=;
        b=hr1LfvTIn6mvAv1pE9ufT5ZUZEwOu4YROGZpDcfhMOw1PTO1aFhOYN6PR7JvNjQSR6
         VVb4hAS9AqOQ0v4zQnH63eSi6FPcGE9/1IO8z9+kyk1eKiZBKgxKsBkaWrFe2nM987k+
         gjdUOUX7FCg9GH0+0togmbzDzodEq6sqxKNyT+4zOcJ60cGtgfaCRNQOL6RpSCCNOJJZ
         4D4+43Bmbnq8Iec6y6um/6ChX7a4raHLNDQt+JUZq5PfQlSuM7+9XjBc9fI9UF2umb9z
         BF1bRcjV2x/lNNzIM+SRsGOP4ned+j2UpS9OWru2KRbXmLtj5fkO0lpl3LDjasEPW9bc
         xNLA==
X-Gm-Message-State: AC+VfDyqpr+TU1hiW50qoV39m/oZRCV3C0qKG9g9pvd0MeOaGhjtGl/c
	OdR7IyP2We75UHYwW9S8STXePd0CXXy7Il/s0/w=
X-Google-Smtp-Source: ACHHUZ4X3ePDuxeaVhYlPdwLs0ycIoXkgV3sI6sCg033H/ll+zkYwNc+6hG2Oad7EppOo9i+/uwvNbRSlrPgNC8Yo5Q=
X-Received: by 2002:a6b:e51a:0:b0:783:6512:5099 with SMTP id
 y26-20020a6be51a000000b0078365125099mr294800ioc.5.1687763426177; Mon, 26 Jun
 2023 00:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230622232211.928913-1-bruce.ashfield@gmail.com>
 <20230622232211.928913-3-bruce.ashfield@gmail.com> <dbd74e45917a899a54fcf18e89ba759c46da8651.camel@intel.com>
 <ecb3ee101804ea84dbcde3caf0f23100e2fbbf5a.camel@intel.com>
In-Reply-To: <ecb3ee101804ea84dbcde3caf0f23100e2fbbf5a.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Jun 2023 03:10:14 -0400
Message-ID: <CADkTA4NKuAG0bqvC8s+pJPLEsaqJFU9s8OEGidmy7wQ2=s1TCw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 3/3] linux-yocto/5.4: update to v5.4.248
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 07:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183407

On Sun, Jun 25, 2023 at 9:34=E2=80=AFPM Anuj Mittal <anuj.mittal@intel.com>=
 wrote:
>
> On Mon, 2023-06-26 at 09:33 +0800, Mittal, Anuj wrote:
> > On Thu, 2023-06-22 at 19:22 -0400, Bruce Ashfield wrote:
> > > kernel/linux/linux-yocto-rt_5.4.bb
> > > index 8e0f7ae217..a98a64110a 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > @@ -11,13 +11,13 @@ python () {
> > >          raise bb.parse.SkipRecipe("Set
> > > PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > >  }
> > >
> > > -SRCREV_machine ?=3D "3ec10d880e38eb58af39c33094e455da59afd42b"
> > > -SRCREV_meta ?=3D "b09511ad6dbb6f38303add48d2da78906bab1380"
> > > +SRCREV_machine ?=3D "8472ed342e0ac3f529c10b474b12ef0e05995778"
> > > +SRCREV_meta ?=3D "5c912968f2cb938ad084d457dae99bf8eb16032d"
> >
> > This rt kernel update is giving errors:
> >
> > 09:17:01  | /build/poky/build/tmp/work-shared/intel-skylake-
> > 64/kernel-
> > source/kernel/time/tick-sched.c: In function
> > 'tick_do_update_jiffies64':
> > 09:17:01  | /build/poky/build/tmp/work-shared/intel-skylake-
> > 64/kernel-
> > source/kernel/time/tick-sched.c:90:15: error: 'tick_period'
> > undeclared
> > (first use in this function); did you mean 'task_prio'?
> > 09:17:01  |    90 |  if (delta >=3D tick_period) {
> > 09:17:01  |       |               ^~~~~~~~~~~
> > 09:17:01  |       |               task_prio
> >
>
> Sorry, not this one but the one that is latest in dunfell: v5.4.243. I
> have not tested this.

No problem. I'll send another patch on the top that will fix it, I've
seen this on other versions.

Bruce

>
> Thanks,
>
> Anuj
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183399): https://lists.openembedded.org/g/openembedde=
d-core/message/183399
> Mute This Topic: https://lists.openembedded.org/mt/99708610/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


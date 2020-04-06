Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.7299.1586164917178875028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BwSMBI0A;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id v7so2130913lfg.6
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIN9z7ue0YAHMYBd/rd4iT280IvuIaRFoq7uAZQF4d0=;
        b=BwSMBI0Au25pBKTRHtBZQ75QlEOsfyEQBDL+Y4i/FKeLoi2CF+jC3+Rj/dTA0n1wUx
         /+DtlWjYt4zrtMk+XWmSb3l8dg+VruhVXtePJA6kRk1KRImwQA03TUxMGQcZm/XrbBgu
         kl9fSIJlxh7zrCsJSHX0XpFPE1aMrFl8aav0rBf0Bb26tGW+9XbmeVUoTNxzI6zKGMyg
         /aKww6fSi2dfTVPPmHbBXXGEdTQW0qLpTJ8BuKXScQbbwSVTyx3WqQMGGutn3tYGpjRq
         Pb9/DrCsHpD74ESlWVZbPupX77P2MvQv7hNtW77ogvYFhCWK0ri/gYj2uzwJX5EhOKbW
         lKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIN9z7ue0YAHMYBd/rd4iT280IvuIaRFoq7uAZQF4d0=;
        b=aX+1HOLFlnCRsL6tzzWxdJpB4hsK8oZWB4OKSjTMnmLAzyNoYUSOHXG7rIzsy0TgU1
         KM/khsLJtCRuUaOGGu+0TG97ce5wfMwrgVGTea5dKEzHL2CsngztOa4GlTcNXTgsR6Ze
         A4MdXP2rgTMCEylNxTHkNVbOn8fl/fhLYcE8CLBI8RgRpgOqy8fuoTZe+N7bbdA4Deyy
         SsHVBAOaMRHj61ljkB3d5FWEIDGUXz/H1g3AroLdfPuHnPUQ/zfFveF0/ISqzQvizBxc
         xIO2KrvfSqvSEYr5Uqz50GdsV38/5VWiBYwY9D3lYbt5wTlz+O6RwJg8rN+0pTaOACYW
         PVog==
X-Gm-Message-State: AGi0PuaX4yqGo1CGp2eelzNvic1B0Ktbuc+/aFrJPANSAZSuUZAtbINg
	KB9b9RPhli5fJtKNpB7IHe0fh+WIXYYvafGaKww=
X-Google-Smtp-Source: APiQypJbJ3sdD3LN45lrGiN19Sere3tEaAT7f3O7AOD44aoUyID7BkWYh7W9ms7P7J5Rd3Nu+ceHyXlLf+z/daPSgFE=
X-Received: by 2002:ac2:545b:: with SMTP id d27mr12308032lfn.187.1586164915419;
 Mon, 06 Apr 2020 02:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
 <1602DB74B6717A3F.2403@lists.openembedded.org> <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
 <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
 <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com>
 <db5856cec86de82a4feddf1cf739ce7eb37c6932.camel@linuxfoundation.org>
 <CAPybu_1ULyzXSJzYAHGRh7FeM9i0PX7g0N-v=XqeFPKJ8k0hzg@mail.gmail.com>
 <0d818b09b16f9a1156643217599f6b774d1ebc17.camel@linuxfoundation.org> <16032F9D180FD5D7.1684@lists.openembedded.org>
In-Reply-To: <16032F9D180FD5D7.1684@lists.openembedded.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Mon, 6 Apr 2020 11:21:38 +0200
Message-ID: <CAPybu_3Jf7Q_T-Zwcm8wPJebAw7e6sTz4bi6s4burMu=xFWnLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, Apr 6, 2020 at 11:04 AM Ricardo Ribalda via
lists.openembedded.org
<ricardo.ribalda=gmail.com@lists.openembedded.org> wrote:
>
> Hi
>
> On Mon, Apr 6, 2020 at 11:00 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2020-04-05 at 17:44 +0200, Ricardo Ribalda Delgado wrote:
> > > Hi Richard
> > >
> > > Thanks for testing it out. Seems that I am either not very clever or
> > > I
> > > should not work on Sundays (or both), v1, and v2 where exactly the
> > > same. I am terribly sorry to spam you.
> > >
> > > I know it is abusing your patience, but can you try again. I would
> > > love to try it on my setup , but I cannot replicate the bug.
> > >
> > > As we speak I am running oe-selftest    --run-tests wic.Wic on
> > > poky/fedora-30...
> >
> > I did re-run it, it took a while since a pseudo change invalidates
> > sstate. It passed:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/838
> >
>
> Thanks a lot for testing it. I will prepare a new series including that patch.

I saw that you already queue it for master-next:

https://git.openembedded.org/openembedded-core/log/?h=master-next

So I will not resend the series ;)



I have send the Individual patch to pseudo, lets see if it is merged.

Thanks!


>
> > Cheers,
> >
> > Richard
> >
>
>
> --
> Ricardo Ribalda
> 



--
Ricardo Ribalda

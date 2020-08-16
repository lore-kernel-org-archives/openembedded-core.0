Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.33172.1597619693122199370
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 16:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pp56wWLQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id v1so5131081qvn.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 16:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fjokGIzhhVkZXbRQWQvj1vnXUiLXzk/3HtAn89Yt59A=;
        b=Pp56wWLQGjOUUOuO9SOIjb34wUd7cVNcP7zMJbg8Gwg3LSzGJezo4AOxC3IDenmqqL
         NlCAtVWbE253Ju7DaQMmA/DI3sbMFQTuP83ppkTEYSzuHjbhQItkOjYGPY+l7hhERzjD
         QabE5qIrXFbFPsTYTS39rAmDo8ZCLU1J/ddeSMHLA/ELMY6VTGHrxxgKsJFUggcEAdXB
         5I85Vfzjpo+veUdSD/p+kVYeNG36lt0RlfPHHOgTa2JdNYbObatteddk1IcOH/fOgxUJ
         e3il+W000X97pcSPyUGc6hfdYZlGRI8a9O7WUQyiz1/xpQNyvb4HuYDLxuGJj2mYRtXQ
         hFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjokGIzhhVkZXbRQWQvj1vnXUiLXzk/3HtAn89Yt59A=;
        b=SNUW+NeX7vgPZRw4TO7Hu55ZrvOwfecSxqK4ssEQBM5aqnsH3HPZvFJ2Yyp2GLIGEr
         ol2KA10CqOqCbFFKLMZJ7r/zWH+qce91gKMqtV5ujPmqZhreXk67QL2gNBGJTHjYj7z8
         ESgOIYus/lcesXEVaPdun9ugdrkaqXArIo/vUyc7P1qMZUmtXS7fhFzw4UsIO2tlncC+
         qWMUyIwRMMyxjhLx89+E5NoyzobjbLgjy9jcHSMIckuIgDaQVaku7vDKk/X9kaxxzTlj
         XHokLTJvCu2MTyx4fu+ta6AD86om6h2h+RGFeON96e04qpVa2HiEx4wssRKqSjg8PbhI
         hSdQ==
X-Gm-Message-State: AOAM5336IzIiqiAKN1E9YGq/sSEv+MtO6+6DGWe4+Ak50rDxl5KfOgPj
	bL34UG9ILGBCZhoKX1wufgWRTxp3uQzg4irKYMc=
X-Google-Smtp-Source: ABdhPJw19FEm1frG26+IwXt2o3wXWGFGMuPZ0Zs6UOnPfk3As3KUchQ0dEPZ/ibLn5b27Trjgbrt0hPCU0PkuVF75ww=
X-Received: by 2002:a0c:ff06:: with SMTP id w6mr12320507qvt.61.1597619692261;
 Sun, 16 Aug 2020 16:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org> <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
In-Reply-To: <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 16 Aug 2020 16:14:22 -0700
Message-ID: <CAMKF1spyxMwU7kjJPhxX3ujW6kZzyf37BifGvsvsmZM-iHzQUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Sun, Aug 16, 2020 at 3:55 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>
>
> On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
>> > Bruce,
>> >
>> > We need
>> > https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
>> > backported to 5.4 kernels for perf to build with -fno-common can you
>> > queue this in your kernel updates as soon as you can ?
>>
>> I think we have other active kernels which will also need it as even
>> with Khem's patch we still see failures:
>>
>
> I've taken care of linux-yocto now, I don't think there are any active use cases for those kernels that won't be covered.
>
> Cheers,
>
> Bruce
>
>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1267
>>
>> Cheers,
>>
>> Richard
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

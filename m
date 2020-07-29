Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.2312.1596065060251665635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 16:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jvb6JUYX;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id e5so4995781qth.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 16:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4BM9P76xdenUMOLNxSGcunW7ZMb5yCT0qzLUZYJYdg=;
        b=jvb6JUYX02bgkVtHkoP3wG8uVNoIFp5lD/h7vn+bKLqwQlyT+QNhqZVsiHHvs27gI0
         Pi5IS28BfJxQoSdsl/X1VPTIB2WGlhkA5EGn1G3tuJwWUpd9IoBzhbGypSbUAIlmtlJ/
         wQ31Aj9JmDJK7hVKryHXlj0LmYcrIk8X2s2Lbt6RKYohZ31UtiTiBa7RFgxMjHNEv9PZ
         XtFUHXlPOLLYKrbZvY00m/NHXpOXBv0+ZWkBilGac9KROoxgdPKvwC8hAmoSCA/AP/T6
         AMWlpSE0mf/vY8bwqPL/aTuFjjDCYxIwYwnKKsmtkWhUi7QlVsPgNimYirxJsIlhL+FC
         7XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4BM9P76xdenUMOLNxSGcunW7ZMb5yCT0qzLUZYJYdg=;
        b=U67MKmwCG5SbXhNQZylFGOzgKeiCWv+nLAsF52En3sN9tO6s9WzrNyR8r75vBqT5m8
         HcW+aE2Nd8O5aTS/Z2h3UJPvb2kxgOIPoiwRRXCTxHpnvQ9qtBxI65Fp9N91QMn95DwP
         zjEfWpGYnWu8JBlqfan5QQ6bjzCcZlomopCiUfEd2Y/q+d7Y7THu9tzcaXpr7yDLR607
         Sf9b5sggylwSVtmRRFzwSmJ5s6ZX8XdGMLxt3VStnBzeK7P7Tn5zP/JC/09xFLGePR1l
         90YxP/4guD6HQDNu2J7x7voPBfhgvslpPSC2KfgX5JaP6GmarXBWB+uTjAr0xM9iyYVr
         KOqQ==
X-Gm-Message-State: AOAM532RihZtEijWm8Ff76m4siYhZ/li8whfa/i33YCk+Zf45PxMKDbF
	BijdVZvMFBjwofXsne6BQ3EzUHg7u5e2abTQF/4=
X-Google-Smtp-Source: ABdhPJw1SetMG8MrWjHE+TUEpaDCeHbLSbgTXy6uc+sFjNNISZehL2zFoxRRVwHkYKINhmbaYR5fhLV+7sDkCjk3hVs=
X-Received: by 2002:ac8:faf:: with SMTP id b44mr365934qtk.190.1596065059382;
 Wed, 29 Jul 2020 16:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200729130916.38764-1-matthew.zeng@windriver.com>
 <d05d7357b7199a1e787d7f0510eaeacb46740a0a.camel@linuxfoundation.org>
 <87bljyqvzk.fsf@windriver.com> <e7a7ee265ac55cf179980f9deb5579b068e12299.camel@linuxfoundation.org>
In-Reply-To: <e7a7ee265ac55cf179980f9deb5579b068e12299.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 29 Jul 2020 16:23:52 -0700
Message-ID: <CAMKF1sqZuL_0GE7uOuJqQTNm9TEazXDAsUZmzSebaAZq0VLzFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] ltp: remove OOM tests from runtest/mm
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

on master-next I am also seeing

step1b: WARNING: ltp-20200515-r0 do_patch: QA Issue: Patch log
indicates that patches do not apply cleanly. [patch-fuzz]

I wonder if its related to this as well.

On Wed, Jul 29, 2020 at 6:43 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-07-29 at 09:41 -0400, Mingde (Matthew) Zeng wrote:
> > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> >
> > > On Wed, 2020-07-29 at 09:09 -0400, Matthew wrote:
> > > > Fixes [YOCTO #13802]
> > >
> > > Thanks, we can reference the bug but I don't think we can yet claim
> > > it
> > > fixes it.
> >
> > Sure, would something like the following work?
> >
> > Reference [YOCTO #13802]
>
> Simply "[YOCTO #13802]" is fine (I'll tweak the commit message as I
> merge).
>
> > > The missing log issue happened again:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/908
> > > so I think there are multiple issues at play here.
> >
> > Can you attach this build's log.do_testimage so I can have a further
> > look?
>
> Sorry, that build directory has been reused in this case :( Next time
> that happens I'll try and spot/grab it.
>
> > > Is there any way to have the logging logged to disk straight away
> > > rather than stuck internally in oeqa's logging buffers? That way we
> > > could see which tests had run before a hang?
> > >
> > > Also, could we make the scp failure non-fatal, maybe a warning so
> > > that
> > > when it fails we can look at the rest of the logs?
> >
> > I'll further investigate this idea.
>
> Thanks!
>
> Cheers,
>
> Richard
>
> 

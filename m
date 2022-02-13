Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6DBC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 17:58:53 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web08.24041.1644775132380347045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 09:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JsRLG6iW;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id e6so4423244vsa.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 09:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qWT0CzoeEH4hZasljlRq1GrL0e3sI9O/ywMaZkodk2g=;
        b=JsRLG6iWiODk1ljCob62Wl6YwGGAl/KlqEe9K8sihoffxSdh+QwTg8bY6egsK9gofG
         YQQQbV72XgZg3xfpUz4FrOv6/Bi3r8O++8QdachMrgRnhKhcRvzrAHUQ3E3bKUwzLyJw
         CbSDiLVqmDlfqpUIs4hQrdl0tYSwnbiOwKuigaoTqR/iS3AGA2wsL0pEBs24zU45fXtl
         NM/Tjbo4PdfXMugNmcmknhR1EbWnVcLH7plSw5G4Dk5JZqzr/3aQg6yrBGpLeBchE1zM
         oB8pKPJ8DSppo9Szby7pOUhWupoxz8Fmm+0jRHRhfydyVN3pphshmQ6VTgsYwXku2O5E
         8fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qWT0CzoeEH4hZasljlRq1GrL0e3sI9O/ywMaZkodk2g=;
        b=PiWhKQzwYUR6ECrVyhBnnAcCDkkYn8OZ4UoH7LQbPbbMJrptQ9Sn/uds6Rg6cMN5Pa
         Cp7lYLHLdY/7rLGyH1ggoBLHbCXdLcSTC3Idif3cyeKzd2eSKbXLxY9FI1cTl5UgX4pQ
         WLb+DHQZbTiPAAmAq4/ET1IyEcO6NNn3A/2fZldx/818Jev4TZMD3xPH8RezyhJLb+la
         aAlzJ4qUsojsoeFat7bWPt+gdGGPLEl41YbwsuM5n9KjLBFklkUd6mPTF+mwIBa2KIis
         Wc/aplR3A16AT4evoitIvBwVE3bF+V63T93A8BkYFk7aTVZ/ms3Hf73oESWe1fbe5KNp
         aygA==
X-Gm-Message-State: AOAM5327hMHCN4lhwfUGF7g0UrT6VucnDo9xCURC5WWzKIGtGw57A6bA
	T0bZxbpBmTItYvUlZVLEENxepRxSPpKelDe93J0=
X-Google-Smtp-Source: 
 ABdhPJwbBjnnOBbhXA7fecIm4nYu7ub9K1u16EJVBd3H4hA9LqXf8YJvDeyOFWgJ2ECVEDu9egkNsXXA5HvAiGB3I0Q=
X-Received: by 2002:a05:6102:c50:: with SMTP id
 y16mr2836680vss.45.1644775131497;
 Sun, 13 Feb 2022 09:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20220212104022.842655-1-alex@linutronix.de>
 <20220212104022.842655-3-alex@linutronix.de>
 <f6f5877ea514546fe35afacf51cee987b8895c78.camel@linuxfoundation.org>
In-Reply-To: 
 <f6f5877ea514546fe35afacf51cee987b8895c78.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 13 Feb 2022 18:58:39 +0100
Message-ID: 
 <CANNYZj_BB4KWaNATPbEuEEHOOD+EFK3zMAu048ahQuA-ue+aKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] weston-init: disable systemd watchdog
 option
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 17:58:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161689

On Sun, 13 Feb 2022 at 13:39, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> >  # Optional watchdog setup
> > -TimeoutStartSec=60
> > -WatchdogSec=20
> > +#TimeoutStartSec=60
> > +#WatchdogSec=20
> >
> >  # The user to run Weston as.
> >  User=weston
>
> Whilst that fixes the tests, should we be doing that for production systems?

No other systemd unit that we ship is using the watchdog feature. For
weston it was an accidental addition, due to import from elsewhere.

BTW, we didn't see the issue until now because it won't show up on kvm
qemu (qemux86/qemux86_64), but I ran this across a-full, and
ppc/mips/arm all failed due to their non-kvm test timings.

Alex


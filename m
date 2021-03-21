Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.1804.1616293068177146031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 19:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pqvQyeJ5;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ce10so15645833ejb.6
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 19:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANxcXsTqJd/sZ5P5nvU159oJ6QoJYWxHimZlE3BhNMQ=;
        b=pqvQyeJ537vFco/U0ZsXqI8JfFKdfE6pAtW7Lc1IdqvJJ6J7tJkABWx+B6CZuLFkCi
         t/yw36fEOpMGnM/TCftQD7OGDztZvmrr+mxmR4rdfgUSz7DupaGTKv2xrwNwQFMxckMo
         WrDX3ZVPO/w7R0AVLlE80Ne0iQEa/KvBwC5I4IXDLlGVmI24yavO86XqoFpKqKTMDwE4
         Z//9hfNkfft2vm2o3pvAX/uzj+d0ARYi/5YqYTTcgKpV7bjisXpTHgjBkW3/XEDDkqoH
         alRD15407i+ZieVL1LrakwEQmRxHy73uXEwNC7qNmPFQh21FY8fw5pPaozHCAwASk2pR
         jdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANxcXsTqJd/sZ5P5nvU159oJ6QoJYWxHimZlE3BhNMQ=;
        b=VF2JpoNo9YsjuTAB+xNU5B6T9zNn9agJ2j8h9kZMGcA/dAj+PCLOHeqQuNkMACqrxJ
         6m8x5ZpmrKrk5TdznBFNsIq5fJrQE7ARpo1eijKciCGhHoyPj8qrquLPrble6UK2SE+U
         W7T6TLlLMr0dsF1tqCQpZod6usqkxN367gronV5WmkZHuwtvXQvfw6AQUyxIKnPoD7n5
         rIU9uJpb8kJWC7OivngW/RAhte/FiroSj5/Eme3dvb9MNxjibChgNbpNvJ+y1HE60r3m
         pSSLscaY5LKUV1UDMVMYtbHJ7zJ8dFvzcVVNOyQnYnbJvi1rahecGjTdFWxBHxI6NOOa
         mwlg==
X-Gm-Message-State: AOAM530VjsRjExz8pR6IiIhgtUsBPseN9ZZ+2ed5hiYir3eEC0fHfzme
	VuSD3jqZg6gFEOfjCFSwzKeFg9g2kvJe8KXYyT0=
X-Google-Smtp-Source: ABdhPJzlWzlhHiOvdwkhma+GGzsXmHQSUqHEUl59SLTm04QJ2ULwzNEC+O1jC0x/hSvBjMbCCLzT5IYUjkjbTyRpRso=
X-Received: by 2002:a17:906:9bdb:: with SMTP id de27mr1143837ejc.459.1616293066539;
 Sat, 20 Mar 2021 19:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616180065.git.bruce.ashfield@gmail.com> <4b2e982aebea49636f7f6db4381c17d4c7eb2a63.camel@linuxfoundation.org>
In-Reply-To: <4b2e982aebea49636f7f6db4381c17d4c7eb2a63.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 20 Mar 2021 22:17:35 -0400
Message-ID: <CADkTA4N82FJ5h5W4MzRfrP6An84STjN0_i=LSx+c2SPt7ap3jA@mail.gmail.com>
Subject: Re: [PATCH 0/8] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 20, 2021 at 2:46 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Fri, 2021-03-19 at 14:58 -0400, bruce.ashfield@gmail.com wrote:
> > Here's my latest batch of bugfix and prep for release changes.
> >
> > We have one configuration fix, as well as a fix to the tools that was
> > hiding some warnings that we used to get.
> >
> >   ** There's a chance that this kern-tools change will pop out some
> >      warnings. I can fix the warnings easily, but if it does, I'd suggest
> >      just dropping it from the queue, since nothing depends on it.
> >   **
>
> There is a warning so I'll defer that piece for now:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/3227
>
> (maybe needs a yocto-bsp bump?)

This is unique to that BSP, so a bump wouldn't get it.

I'll pull together a fix for it, and send a bump to the BSPs to pick
it up (and resend the tools tweak at the same time).

>
> Do we know the cause of the beaglebone regression btw? We don't
> really know what to do with M3 due to that...

Unless Kevin @ WindRiver has ideas, I don't actually have a platform
available for any testing, so we need to hear from him.

Bruce

>
> Cheers,
>
> Richard
>



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

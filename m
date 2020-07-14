Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.22595.1594740986060190633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 08:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=emnWh9eD;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: mdeneen@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id e64so17727552iof.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nM8Djzv2N0qpJhdtoXxQOW5NX8Ut71r1c5xqrYzBJ8E=;
        b=emnWh9eDIv6IDOIJakCCVIL2eabTG/w5IUGv8ZiGCXkNsBERYnUXlNYIRCEpvlGLM4
         wQF95FRP04bYujeYMptE90El9/874pceid3BombOUrCLpiaASofVoQTU2GUFkOryYpcu
         UWH6Wujuj9AHyq7UqxTGa1jTqZpMTzFAwnqUvFiLdYgA9YRPOLVhNuihvxt0kDDuzYYf
         UXwI8Sn4p/pGvzxuAgrepxHnbH/6rRIlmnx9IZzMLocjNv94D5HD8VL70LOd/iadF5fI
         aTMa1E6sSGhG6qqEInYG4RgXezG9p9Mtno2hov3BHUnI8uHwr1DJXbQbGsYLaVi34A5c
         Phtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nM8Djzv2N0qpJhdtoXxQOW5NX8Ut71r1c5xqrYzBJ8E=;
        b=WjwKcM3FiYxe7lQLnSCBQeUV8A+mU3VZpcnvaZXy8JwigY8QKLIVi/sWjacayOs7x0
         bi9sV0KjNFYmwH/bOCNuCf3DYlNtq5pNRh5ieh568wb1KjTp2glp0qOD4hL9CAZ83vSu
         HCKWQAB4e5QItYEoQtAgOeFrRXUJSK2ZMFHkNHJjSst3i201uiNUj2Bx/j8Q/dYNOoON
         cPxycncgwzsbvWobW0Bq4+AzMBBqX9A89abqwzBMIWj0gIvLXFpmJdbS7mDXabW6T89/
         gRZGKjPvmeIU/sQNGyBcgFzJ6KP9lgAFVlZp1rsj/Eeod5IhXeyOVC+I56x/1iBJo+7m
         am/w==
X-Gm-Message-State: AOAM531SaeQCsI7vgCKBLlzln01UEIlq2Dumt/pSFtLTkHXZUi0euuds
	Vh9mpY+5zx7uMiLWXUAQlHHVVD1mFs1btZ89ZqK0o2lcOWU=
X-Google-Smtp-Source: ABdhPJzudSLV3hZHdJqahTxrwwV+5ME14nKktulxjnLxzXI9xDvNEfrnvlfYv5ClM+tHSG9YQiZjWbqEXEaYxewMxAw=
X-Received: by 2002:a05:6638:1014:: with SMTP id r20mr6496745jab.44.1594740985310;
 Tue, 14 Jul 2020 08:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6JJ88RJ0LJZb4=kOUZNtBBYZMXHbP3q40ECaRMZ4kLeaBwKA@mail.gmail.com>
 <20200714151434.vthcngsgjyzeafkq@qschulz>
In-Reply-To: <20200714151434.vthcngsgjyzeafkq@qschulz>
From: "Mark Deneen" <mdeneen@gmail.com>
Date: Tue, 14 Jul 2020 11:36:13 -0400
Message-ID: <CAP6JJ88eh3i5KFS4ViTfMvx43NXWqgmfCHJJoUtjVuu61RGfGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ppp: Add support for setting ifname in ppp options
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Quentin,

Thanks for the feedback, and I will resend this.  I started off with a
patch which contained the original authors, but that was lost in the
process of applying the patch, since it is a patch of a patch.  I was
attempting to avoid patch fuzzing, since it had previously been
applied to pppd 2.4.8.  Is a small amount of fuzz acceptable?

-M

On Tue, Jul 14, 2020 at 11:14 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Mark,
>
> On Tue, Jul 14, 2020 at 11:04:41AM -0400, Mark Deneen wrote:
> > pppd is patched in most Linux distributions to allow arbitrary naming
> > of ppp interfaces, allowing users to create consistent firewall rules
> > rather than having interfaces named "ppp0", "ppp1", etc.  Yocto is
> > missing this option.
> >
> > This patch, originally from SUSE, adds this option to pppd. It is not
> > included upstream because there are some pppd-supported platforms which
> > lack the ability to rename interfaces.
> >
> > Signed-off-by: Mark Deneen <mdeneen@gmail.com>
>
> Please follow guidelines from:
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> to know how to contribute in a way that is matching OE patch management.
>
> Your mail content should probably be the content of the commit log. Your
> mail should directly be the output of git format-patch (send it with
> git send-email), the patch shouldn't be attached to the mail but rather
> "be" the mail.
>
> On the content of the patch, it'd be nice to take the patch with the
> authors, commit title and log from the original place where you took it
> from.
>
> It probably is:
> https://sources.debian.org/patches/ppp/2.4.6-3.1/ppp-2.4.2-ifname.diff/
> ?
>
> No author, no commit log :/ Though, I could find
> https://sources.debian.org/patches/ppp/2.4.6-3.1/ppp-2.4.2-ifname.diff/
> which is slightly different and the changelog seems decent between
> Suse's and debian's patch.
>
> Thanks,
> Quentin

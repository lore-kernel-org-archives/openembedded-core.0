Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.4771.1608263666472676090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 19:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YxxW0MX0;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id g24so466602qtq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 19:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMQfbufHldN2SN3V/ArttRlVIY9IHlmTf5TOYQZMvus=;
        b=YxxW0MX0uAFAloPapUPWMgvSptY7DnKBqdOCoLlw+aXq+We+gSnoM4OvpKpheWXyfd
         nv3iI4no2n4CcD6fawXarvkc5riu7A5X2BHGUirbP5SQYVKXDFaw8KgwNvqpgnZDBNaz
         ryJCkY2bc9bLFjzluiAuJAQa6QKFAnjy70ivZl7pAemjjnOIM9EkyRGCJQmJrIT3VJx+
         ojljvms8OqZABeHbcxu6NxG+/ppfLqWNod+uvrOz7LElT4Zq6hleyn0EY8HmmBttBM8u
         hgUPdzaxw19OJs+0Ne09Xb5DeQRWpe9KOOsXHU4m1TuBWySbilGyEk6TuWC1GpwSdxKU
         yKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMQfbufHldN2SN3V/ArttRlVIY9IHlmTf5TOYQZMvus=;
        b=NZFLIGGFpWOYRiZHSvP4uX82GPqaTvKqo8Q4kfotdIRAuVFwrJPquNu/Oj44GhyNbJ
         yLes6xYZamNeEMO9EmJuhFbCKyMOws1RGyGUqvaIkCLXbnZcfaJ7/AT63M79DnD9wKAV
         qirM56lOrdII/8Ajcu4/A23EJLa0Rzv0i8zk/0TtvPoHWVYuglaLqkQ+NP5MLzNE0lKA
         PoLb8v9WO48pHe+Gh0WmVbNP+t6RjVLJxf8IZ5Uip84yoV4PwRwtnrt4ckl6G8BtR5KV
         0RuT+qfwRlYnpWBWZ25OIGP0eW648dZPtRlY4p4oVdT5h6TLp4iosWDRzSHA6TJtlFCO
         y5yw==
X-Gm-Message-State: AOAM530BxNjkN8r7KpuKWFGaEsAorpHurFTUGSxV1I2XnhzRn52zV5Nv
	LRQn/8stIQo5kvtNOzw2RuQr5dYBJ6iLh1FuTKc=
X-Google-Smtp-Source: ABdhPJws+pp+QlsxzJ5M3kOU3reFgs87HOyMKIOuTiEJQBVZYrjRFe0U0/yu6i2qXiqBU86Fdm//jvHrHVNAYTmCnFg=
X-Received: by 2002:ac8:729a:: with SMTP id v26mr2118903qto.53.1608263665622;
 Thu, 17 Dec 2020 19:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <CAJ86T=XXi5NtoFoQvTzuQe04gvBPizW6jjin2JkUovLCOti9MA@mail.gmail.com>
 <CAMKF1spNRZcLNFK3t-QQxHbV4UdOesJe6RAniYBezcJvc+yOLw@mail.gmail.com> <CAJ86T=U04Ny3=sS+oJ=PJ-HfE6de+q176+UMgEguS5qcJqBWKw@mail.gmail.com>
In-Reply-To: <CAJ86T=U04Ny3=sS+oJ=PJ-HfE6de+q176+UMgEguS5qcJqBWKw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 17 Dec 2020 19:53:59 -0800
Message-ID: <CAMKF1sqVk6wgp9KeZm58arYYH-4UfUmLffeC6mdU=03ekZo6Yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] initscripts: use quotes for shell variable comparision
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 4:02 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 3:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Dec 17, 2020 at 3:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> > >
> > > On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Helps to execute it with busybox shell
> > >
> > > How does it help? Adding quotes would help if $rootcheck is an empty
> > > string, but that's not specific to busybox.
> > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > > > index 02f0351fcb..a63e71b780 100755
> > > > --- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > > > +++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > > > @@ -74,7 +74,7 @@ test "$VERBOSE" != no && echo "Activating swap"
> > > >  #
> > > >  # Check the root filesystem.
> > > >  #
> > > > -if test -f /fastboot || test $rootcheck = no
> > > > +if test -f /fastboot || test "$rootcheck" = "no"
> > > >  then
> > > >    test $rootcheck = yes && echo "Fast boot, no filesystem check"
> > >
> > > Doesn't this instance need to be quoted too?
> >
> > yes infact there are more cleanup to follow, this series just fixed
> > default boot errors on reference images.
>
> Adding quotes around a variable should probably be done consistently,
> so maybe it makes sense to hold off on this one until you've finished
> the cleanup?

it doesn't matter, I would be creating per package patches.

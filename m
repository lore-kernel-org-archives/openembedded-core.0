Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.6502.1604578044096370450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 04:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=dXfk5L6f;
 spf=pass (domain: nathanrossi.com, ip: 209.85.128.68, mailfrom: nathan@nathanrossi.com)
Received: by mail-wm1-f68.google.com with SMTP id h22so1372141wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XfwIEBIYfZJeVvuVyl/zr+/9d9bbQnqQV5mtp+sQyEo=;
        b=dXfk5L6fibn4MteOZU4LmvC7hZwaZdVehNgDH8DXzEqpuUaNpwdmq0EWnPR884R081
         oeCKecLIGY0YWZ16WWV2P4vTF87stlcpXCcVPBTGPAJlsk4f+tGS5+5dY4BWnaDxhHck
         cvAIw+uiv7v3VxDos2LIRvC9HvX2OlXvmhoud6+QmKGcd883keMPVuIE+HsB9S9MauXs
         71NPfHN7CHbVgH+Qq4hCI28Xpht2GJ/eYc7fvOeGdkx4TrrNrnKeJmFIrn188ipsKgPO
         /1YkW3WaPIQpWvjYIm1DZkUxzxIpXHR0+AO/ohy5MopS63fO6Z22vh1rsJdCrzBZBHwk
         VOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XfwIEBIYfZJeVvuVyl/zr+/9d9bbQnqQV5mtp+sQyEo=;
        b=gAOHjt+q3OWVqkKL+xP5Wvtx3QH9IUXOXmz0/XnnRn/eNg/E65C6TSB9F6maxugL0w
         W7OH0+e1p/8L3gI7Ral7Sc3/CUzthlqfCtr7t1ZmulaXl0QKsk5heSvtutmFoP779Q58
         6oIKzPDsCWmFQ2eHRgtOBRrbxrcs1jEWvE777xdTSf5f/dotTGRSiXy2++UGAsAT+doE
         TLEk24lkyj3AsadB6cw6hmcdgqfl9zPSvsG+DEm9yhu+XQIublXmVgRN+r5H2BVongI3
         UNJ3oT5G8fTY4Y4Ks01cNb+jmzwZ6O3w5hehBOQmi/evv7g6DwOdcKwH7RxKdjTpAg+x
         SbYw==
X-Gm-Message-State: AOAM533FN284mMtLvWIAgWjZLl7B1oeHCdM08YbdSGo3P21V1DtaPomD
	apPqDmQ9sGZo9uKxKJmrE+aI8i5IW/5YY3uyIoSKww==
X-Google-Smtp-Source: ABdhPJydArPMUlO6CqmIiPz2HlWos1N+qO1orSR/q9nfpKOKik69HCdYhU5gJEa8R/lq7Oa7T6WAbbcBs8+56vGRK+M=
X-Received: by 2002:a1c:9804:: with SMTP id a4mr2130059wme.158.1604578042478;
 Thu, 05 Nov 2020 04:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20201105110247.417380-1-nathan@nathanrossi.com> <CAHtQpK5JHsZ7H-y521+Bfaf0L6kz9ixMm_b7hCsdHinoWAG1sQ@mail.gmail.com>
In-Reply-To: <CAHtQpK5JHsZ7H-y521+Bfaf0L6kz9ixMm_b7hCsdHinoWAG1sQ@mail.gmail.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Thu, 5 Nov 2020 22:07:10 +1000
Message-ID: <CA+aJhH1BAoM7A=JJcpRnTuGOOhc4Rx1H4UO9oCH1v0Etsr5J9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] vim: add nativesdk to BBCLASSEXTEND
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2020 at 21:16, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> On Thu, Nov 5, 2020 at 12:02 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > Enable nativesdk build support in order to be able to include vim in
> > nativesdk targets (e.g. buildtools-tarball/sdk). It is useful to be able
> > to provide an editor in a relocatable form for when hosts do not provide
> > an editor.
>
> Is there any reason why a preference is given to vim in favor of all
> other available editors? Why cannot a user install any editor of
> choice on the host system or inside a container?
>
> AFAIK, editor is not an integral part of the build system and is not
> considered a build tool, therefore does it really make sense to pull
> it into buildtools-tarball/sdk?
> Maybe I'm just missing a use case here...

So this change here is not about including it in buildtools itself.
This is just enabling nativesdk for vim such that it can be included
in a nativesdk target.

Just a couple of use cases for including vim in a nativesdk
"buildtools-tarball" like relocatable installer:
- xxd bundled with other microcontroller/etc. programming/debug tools
- vim (and/or other editors) shipped with an expanded
buildtools-tarball to avoid host dependencies on build machines that
have heavily restrictive policies

>
> > Additionally the vim recipe provides the xxd tool.
>
> This is a "hidden" dependency that would be pulled via this recipe...
> I'm not sure this is a good solution, especially when somebody would
> opt-out from vim package.

Not sure what you are referring to here. This comment in the commit
message is just to point out that this change is not just about the
vim editor, but also in order to be able to include the xxd tool (that
is part of the vim source) as a nativesdk package.

Regards,
Nathan

>
> >
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> > Changes in v2:
> > - Add detail to commit message
> > ---
> >  meta/recipes-support/vim/vim_8.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
> > index 709b6ddb55..7e4654e472 100644
> > --- a/meta/recipes-support/vim/vim_8.2.bb
> > +++ b/meta/recipes-support/vim/vim_8.2.bb
> > @@ -3,7 +3,7 @@ require vim.inc
> >  PROVIDES = "xxd"
> >
> >  PACKAGECONFIG_class-native = ""
> > -BBCLASSEXTEND = "native"
> > +BBCLASSEXTEND = "native nativesdk"
> >
> >  ALTERNATIVE_${PN}_append = " xxd"
> >  ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> > ---
> > 2.28.0
> >
> > 
> >
>
>
> --
> Regards,
> Andrey.

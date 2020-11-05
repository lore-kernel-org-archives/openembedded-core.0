Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.1546.1604539830311283102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 17:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=Ehi6VBmb;
 spf=pass (domain: nathanrossi.com, ip: 209.85.221.68, mailfrom: nathan@nathanrossi.com)
Received: by mail-wr1-f68.google.com with SMTP id n18so501267wrs.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 17:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VwtQ57PH9ah686nl0iMHKb+g27jnqf2Fb3Q/YLfESuI=;
        b=Ehi6VBmbM7c06G3IBUBHpoF+3xljDfTtTNcH6jkwFEu5b8O0SfFI8dgj2SSe19+797
         6UflfOkFEA8EmchHJYlF1jHUsabF3qeromswSbprUSF6xuiooLg+vybzXju6xCiklOsv
         Ls0QsjG5c57HkAX6jHhkFMe2Kal2gGzAeOIoxPw8F9lgp2mJOUqDc2LeZxGJpBSD0S6t
         xipcrwGX7m3+KnS8YlO6G631/4k4CXwkPdzNZVL+6h3JBeIzpmbP8rkA3XxJKSBW5dC7
         bVv0csgIJK29Ae8mSLVrZKgON0WxFUWI8TSi/G0zj84pTlWodkIhlW0iu8UORHBf+Llb
         KO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VwtQ57PH9ah686nl0iMHKb+g27jnqf2Fb3Q/YLfESuI=;
        b=TtGqSLUbGVI+Yv64omI8QajvUDf1vprlpDxhi02xX6bZDiwUlr6c6N493UBZNxFVfs
         pxNgLqkrGZaJaq8y6bs+S1nKTZOWNUUZVMTYlhpIwxtB45FNZXBRqq0yxcycZt6tWUlH
         TVouxXlyeh3BcMAR2fteo5+3q+xl5joSgtC42+r3ju2jQa0VRFtS88olPCvWN7we7aHp
         RMlcWI5EJHko+8FmeDdT5oGD7G5y8nAi72uvTC7l+yyAfRDsYrIzCueH2PmBer+/Bpc7
         ptEPl9PNgHmx9OJnAm16b1Cq5gUhOeGYOETyzP6KjbEzT+N0BinGxRWi7lihf8LACZo6
         ymBw==
X-Gm-Message-State: AOAM5330/+Y8fsdaUq1picAB36w6H4VChT8G2y1Zkg5qirm7KB4fY6Ep
	5dS8lvuMLuF4Z2ollF/VDs2ucyM6PDHXQThEoY9jrw==
X-Google-Smtp-Source: ABdhPJxhMFdZovZQU89FxtahrLzfag05aUc7/j4pkf8rfB+lsvkX3znT6Z8nm9HC10t6Zm1US3EKA41+ksgW7qylynI=
X-Received: by 2002:adf:fdcf:: with SMTP id i15mr882387wrs.16.1604539828819;
 Wed, 04 Nov 2020 17:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20201104131745.397780-1-nathan@nathanrossi.com> <574f594f-cdbf-0465-dc5e-5ca1033df19a@pengutronix.de>
In-Reply-To: <574f594f-cdbf-0465-dc5e-5ca1033df19a@pengutronix.de>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Thu, 5 Nov 2020 11:30:17 +1000
Message-ID: <CA+aJhH1BM+PmLEKPyQnUYLX8MLkh9gNFKa5oewsZY-bmpgxGfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: add nativesdk to BBCLASSEXTEND
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2020 at 23:32, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Nathan,
>
> On 11/4/20 2:17 PM, Nathan Rossi wrote:
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
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
>
> Apologies if this is self-evident, but why should nativesdk be added here?

It should be added so that vim can be included as part of a
buildtools-tarball/sdk. It is useful to be able to provide an editor
in a relatocable form, for when hosts do not provide an editor. It is
also useful for the xxd tool.

> A commit message explaining the why would be quite helpful.

Sorry, I've made quite a few of these mechanical add nativesdk patches
recently, and in the past. The reason for the change is almost always
for sdk/buildtools-tarball. I can add the above description if that
explanation is sufficient?

Regards,
Nathan

>
> >
> >  ALTERNATIVE_${PN}_append = " xxd"
> >  ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> > ---
> > 2.28.0
> >
> >
> >
> > 
> >
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

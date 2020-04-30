Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.777.1588205345741693962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 17:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D/XkHuHq;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id s10so4726266wrr.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 17:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=jKljFM5p4eqK5j79wjJ8uQCGJtCxWrJ+XIo05bhuBtY=;
        b=D/XkHuHqs2e83denZRozNgm0pEKkvUd8cg5VZMLNuGIXjZ8lgGUxbCFkqYllJPXb9d
         CcmsNALZl874VCcitg/Ga7hsHGoNXXkDuNQS+zwL+5qen0YSkKjmGwZeHg1qP9QDvuqH
         O877yKjvljis/Sm0Qy88rDu00b5aWyTLoeeONz3Yww2d5hY8amyjrdV/tiiYEnwY+MUC
         ku4v+/WgoEAe1gJS/fMjkmoorGlYQNST6eqqaxPWKm3my1dRuhI40bV+CPoYFHKA/M/B
         B+BVE/+JLWcnU7sO4qNcWJeo+zFVZmXaMamqIAMsHSGHfOtA2S8EXpv9smcltEvqoDZV
         YOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=jKljFM5p4eqK5j79wjJ8uQCGJtCxWrJ+XIo05bhuBtY=;
        b=gcZ3cQjETzbNCM9LU8nP4T+J7+tz/JT6YpFbxLvpdlcXIuXikPXm2rPachGdGOjdju
         RNwLG6p4LOslwqN9cHsOg9C1E8qad3JEhysvifdK7NXbBLdl++GW6Y9/QYx2aS0Zthwf
         z3k/VKhtGrHQDSPFCd6uaPgwIL9EMfkvRQvxBbICpQVqOesNlEyiehRK2D3aVDZ29MzQ
         SnYyXFLN3grKjjgz3ycXd3oQoMU2rQbm5SQ/Y7o6ck0W6d8+pKYDmP4nzUnv43xkNVAi
         dbQab4IR285PQmi1OEwPSY9x7WMgOMzu/61gTc2/AGBy7styIp2GtIWRJW6ox1HeMnp8
         9y2g==
X-Gm-Message-State: AGi0Pub0HS3q6YxzoyRNXTE2g0RRXV+wKBHbKtqJS0KPONHs7qImNTUZ
	fZeYZsaSWKIz6mdvGQ23VnDexpK5NwvQGlomk2gcxA==
X-Google-Smtp-Source: APiQypKYkyMM86VfCtiHlGmk7p4IbeCLiLRJC9v3OPszC3fNCYKcyRmZ4Ymc/v+R5MM74sbWML/ssasvSqzATzZwR6k=
X-Received: by 2002:adf:df04:: with SMTP id y4mr506014wrl.413.1588205343816;
 Wed, 29 Apr 2020 17:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588175775.git.steve@sakoman.com> <e989f74493fc7b551f8c8b8d6b28708234ed1d38.1588175775.git.steve@sakoman.com>
 <e22c9872c4a6e0b8d3f25ca7891b587e344114c2.camel@linuxfoundation.org>
In-Reply-To: <e22c9872c4a6e0b8d3f25ca7891b587e344114c2.camel@linuxfoundation.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 29 Apr 2020 14:08:52 -1000
Message-ID: <CAGDS+n=sYE3TGgUtAx1e8TWZusoAynHdOQH_2RoGU2eYXNezSA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 16/16] qemuboot.bbclass: don't redefine IMGDEPLOYDIR
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 29, 2020 at 12:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-04-29 at 06:11 -1000, Steve Sakoman wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This variable is already defined in image.bbclass and there's not
> > need
> > to redefine it here.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/qemuboot.bbclass | 1 -
> >  1 file changed, 1 deletion(-)
>
> I think this causes a baremetal regression, there is a fix in master.
> Whether we therefore want to take a cleanup into stable, not sure.

I haven't seen the baremetal issue, but I agree let's drop this patch
so we don't need to take the fix!

It's conveniently at the end of the series ;-)

Steve


> 

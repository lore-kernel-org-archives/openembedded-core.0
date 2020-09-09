Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.9399.1599641955580005830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=AjvZsSD3;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id c2so2459325ljj.12
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0R4kUJpbPPUiC/ByW9ibA9raWbp3sj0k6V4yASsE/dw=;
        b=AjvZsSD3yI0UVDasd+ewWb+M2uMicbsEJz9S8EYBgEjeHj2t3P5yG6XqHJJ2JwryJG
         oUJBpItbIOY5PLFdTbYn7G1hKBjec1odxf2OG3oSLQgoTATiWdmOdprJflbBOvQYTFTy
         QMMB+qMj9f/A9mQMIO8bYmdy+dFO0Sgq0SMWl0UocwHgxwjW/AoxKb8w7PBj2Wkr2upH
         xfvRprO2HjM9fktxHVZlOXxhhbImV01LNM+E0b9RVMpJL/Z+jt7GQOulsP1cG/qQ40L7
         6wCkaqt6FQbuM+doT5Xd/SDcthrY9iTHH/AqtiVd/rkvro86SHqXJlbBM2NWAQljzSKl
         P4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0R4kUJpbPPUiC/ByW9ibA9raWbp3sj0k6V4yASsE/dw=;
        b=ubKjYp5NVExZVqL/Pn8DZWqOYs7c6hoVrHwFYQ1/KwmgCCQ5S9j2mDJB2ozaylX2Pb
         vKUz1P3a30v3xAPNX54UOaDt0FgBgAf5tPpIijb5HE1wPZBtvZElcPpqFF5QC1ngoeTY
         cYngF8lJ5ZS7s4HVkG9plYhUPvpWPWDH4J5fnF9XypJnROY/CazOLopIqHy01Hj/yIGV
         icZepynY/voHr9XbmMKGHYMIUyC9C9luaXRbjZcvRJh7wMzNGTtKmkjWUt64w2JcHaD4
         pJ+Sn1ls3g7TngWQ2hhLbibCzn/3RcHB6Kw494igvaArQDpdcUIsfSAUm6wZXOQdTZRJ
         XeQg==
X-Gm-Message-State: AOAM533tPctDO4qNuhH+dBafAKfg0n/bni0aroE/pyU+yGLhV74XQ+XA
	8XeQ8oiubOP2p7SRhTJ3HqXEX/MmgohxIZxIA6mZ3w==
X-Google-Smtp-Source: ABdhPJwVwB/COaDUtQzqx6vIBX/RQ954sMvHIXyVhrAz233jp4XsmqQhtQo+equs0QUgP6/3ArKQxRvra1ytsTfK55A=
X-Received: by 2002:a2e:83d7:: with SMTP id s23mr1447584ljh.340.1599641953255;
 Wed, 09 Sep 2020 01:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200908164744.3791001-1-ross.burton@arm.com> <CAOSpxdbsWa4c9cb9gXHds9W0=mRC0DAhJE+KRw5NGeDicDYqag@mail.gmail.com>
In-Reply-To: <CAOSpxdbsWa4c9cb9gXHds9W0=mRC0DAhJE+KRw5NGeDicDYqag@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 9 Sep 2020 09:59:02 +0100
Message-ID: <CAAnfSTupJ3+ODNK-1kW3cdpLXp_d7mYsvXXKg6rDLMmRmTOh7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: whitelist CVE-2016-10642
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Absolutely.

Ross

On Tue, 8 Sep 2020 at 19:25, Steve Sakoman <steve@sakoman.com> wrote:
>
> Is this also suitable for dunfell?
>
> Steve
>
> On Tue, Sep 8, 2020 at 6:47 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > This CVE is specific to the npm package that can install cmake, so isn't
> > relevant to our cmake recipe.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-devtools/cmake/cmake.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> > index 1334977225..fa1b818ae4 100644
> > --- a/meta/recipes-devtools/cmake/cmake.inc
> > +++ b/meta/recipes-devtools/cmake/cmake.inc
> > @@ -25,3 +25,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
> >  SRC_URI[sha256sum] = "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e"
> >
> >  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> > +
> > +# This is specific to the npm package that installs cmake, so isn't
> > +# relevant to OpenEmbedded
> > +CVE_CHECK_WHITELIST += "CVE-2016-10642"
> > --
> > 2.28.0
> >
> > 

Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web08.25877.1605005231660536102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 02:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=vtXqL3OS;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id q19so12381561ljc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ooSOFMx9f5SZbtyQ1xBI/k4zVq+JAW3JyQvQ7GGDUyk=;
        b=vtXqL3OSelZ+a4IqShZkYmcUOtUqEV8BRhIqDWG38ynY9D6AOmoPt7dzDnXMPfz3xx
         cHVPZPe5oRfu3OKEjYsxCiafi+khbufF4wEQ8DdUz4m8CkEK7OsfGjBuCu19rj2PnZLQ
         EGhvzd1mDp/4oVWNiRk5IUfwgC4LbifGMnRINu8uVrtkOydKHmXgLm2CaFYpci47HLcb
         yMw1scAh3S/E5k5fYxXUPCb/wiAeNJe944IpRYGwlbb0UvH9gm3FTDYW6UR6xZqj96Wl
         2yFBjA4+zYkCon5N3HgivwMHoEDZP8BjJ2JbE09sGadUYa40Qz3Z+iJaht91WYniBYIR
         9D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ooSOFMx9f5SZbtyQ1xBI/k4zVq+JAW3JyQvQ7GGDUyk=;
        b=A28KWT++AqD8jQAt4WnoEj/nXKp8vJHYXod4r8I7SBQHbDlDK0lwtpZTTp1keaSf91
         ZTP7o5qR+6Rd4STdKYzgveEFIQdArXpzWFG2yVi5xQrkp/z8g+HGY5vaAaKiwh8MVg7M
         V+OO2f4VSn7ckWmq+mlDuCyvXBUmIDm8+tHNmrNl0QxSzEqrBodUrdZSzJOqdIgOKwKU
         4BynF71H8LBwoebP5QbqH7yQFAUsngaFxrDKet96oDSNJvWvp63Oe4hwjYeFHV1Y2Ibq
         HSPgL4YEz+FdmxJKbkpG13KXO8RXJsRFYEweAhryU8nUZHwoLPHKUb3Y6dxyLG2gvwEo
         bYPQ==
X-Gm-Message-State: AOAM530AA4QJeWDtbhSnQyHWBE2iayFr7WMs9EcKivpOLdB0PAUAuiLg
	t2bCT11xGw8hgeVhX45HMciFTgIw92qWp94/1g0ZEA==
X-Google-Smtp-Source: ABdhPJwNLLqP83y9I0XlTuJEX5s6yBuY3iC4xYU48cEB0cOKG55Iyj6R9y0tMLlBj7o3BVaabyUhEKTT+fXS+0RoGis=
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr1418203ljk.352.1605005229806;
 Tue, 10 Nov 2020 02:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20201110005956.2972007-1-raj.khem@gmail.com> <CAAnfSTtprq2pOLkiOH4q4JDJc-oYgWDNi0m3h9ur9ExmZqMfBw@mail.gmail.com>
In-Reply-To: <CAAnfSTtprq2pOLkiOH4q4JDJc-oYgWDNi0m3h9ur9ExmZqMfBw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 10 Nov 2020 10:46:58 +0000
Message-ID: <CAAnfSTt_gXUaXm-sqKz8+cEny0t4cxx0XTsVnoU4UOtLrxctSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libical: Fix build with icu-68
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Stand down, I decided to do it myself instead of waiting for you to wake up ;)


On Tue, 10 Nov 2020 at 09:26, Ross Burton <ross@burtonini.com> wrote:
>
> Can you resend this using the upstream fix:
>
> https://github.com/libical/libical/commit/a3308a23912bba2db654a8c456165c31888cc897
>
> Thanks,
> Ross
>
> On Tue, 10 Nov 2020 at 01:00, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > icu-68.1 removed TRUE and FALSE public macro definitions
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../0001-Fix-build-with-icu-68.1.patch        | 46 +++++++++++++++++++
> >  meta/recipes-support/libical/libical_3.0.8.bb |  1 +
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> >
> > diff --git a/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> > new file mode 100644
> > index 0000000000..8f3a6e1563
> > --- /dev/null
> > +++ b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> > @@ -0,0 +1,46 @@
> > +From 6fa716bb11d16a7b073f35a36651c6ef23a7fdac Mon Sep 17 00:00:00 2001
> > +From: Lars Wendler <polynomial-c@gentoo.org>
> > +Date: Fri, 30 Oct 2020 11:24:34 +0100
> > +Subject: [PATCH] Fix build with icu-68.1
> > +
> > +icu-68.1 removed public macro definitions for TRUE and FALSE
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
> > +---
> > + src/libical/icalrecur.c | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/libical/icalrecur.c b/src/libical/icalrecur.c
> > +index 7317845..bd1046f 100644
> > +--- a/src/libical/icalrecur.c
> > ++++ b/src/libical/icalrecur.c
> > +@@ -143,6 +143,7 @@
> > + #include <stdlib.h>
> > +
> > + #if defined(HAVE_LIBICU)
> > ++#include <stdbool.h>
> > + #include <unicode/ucal.h>
> > + #include <unicode/ustring.h>
> > + #define RSCALE_IS_SUPPORTED 1
> > +@@ -1018,7 +1019,7 @@ icalarray *icalrecurrencetype_rscale_supported_calendars(void)
> > +
> > +     calendars = icalarray_new(sizeof(const char **), 20);
> > +
> > +-    en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
> > ++    en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
> > +     while ((cal = uenum_next(en, NULL, &status))) {
> > +         cal = icalmemory_tmp_copy(cal);
> > +         icalarray_append(calendars, &cal);
> > +@@ -1411,7 +1412,7 @@ static int initialize_rscale(icalrecur_iterator *impl)
> > +         }
> > +
> > +         /* Check if specified calendar is supported */
> > +-        en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
> > ++        en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
> > +         while ((cal = uenum_next(en, NULL, &status))) {
> > +             if (!strcmp(cal, rule.rscale)) {
> > +                 is_hebrew = !strcmp(rule.rscale, "hebrew");
> > +--
> > +2.29.2
> > +
> > diff --git a/meta/recipes-support/libical/libical_3.0.8.bb b/meta/recipes-support/libical/libical_3.0.8.bb
> > index efb9433412..6230f09eca 100644
> > --- a/meta/recipes-support/libical/libical_3.0.8.bb
> > +++ b/meta/recipes-support/libical/libical_3.0.8.bb
> > @@ -11,6 +11,7 @@ SECTION = "libs"
> >  SRC_URI = " \
> >      https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
> >      file://0001-Use-our-hand-build-native-src-generator.patch \
> > +    file://0001-Fix-build-with-icu-68.1.patch \
> >  "
> >  SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
> >  SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
> > --
> > 2.29.2
> >
> >
> > 
> >

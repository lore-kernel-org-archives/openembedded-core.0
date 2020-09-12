Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web12.24964.1599941498630064157
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 13:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uex/8KAx;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id e2so2390436vsr.7
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9X08gQv8mkN+g/FkjiIfbN9MFhN4x8V1UUVwGGxi05c=;
        b=Uex/8KAx8HGz0Kvzp6rOkv0eFXCxr2DC09GdoXg1PaTAAAtcWekdBo2E+YzSFgtO5z
         zc+lwQg0MRrMW8w7OoGdWaRItBihEbIdulQ373Co/cHDsuTuDkC1k5XyYDnYKId4V+8E
         3D9PvkPSDJETD3gD+lNFAEVVfSMfcnujMqQ8DPmCyV8Vvwl0O6LBiDGX2OebinGcVPfL
         3MU+rrQcIStVEbkFWIdQYSiXbRJX1qONw2ckhobLaYNHsHVdHNjcpaktkWwucf+NtKqF
         nbQUqOX8mxx3Z7vmZioKP0Xeay0w6v2/gZph9ykltKwda8jXaIDkhv0ep6GZNhP8f9d0
         WpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9X08gQv8mkN+g/FkjiIfbN9MFhN4x8V1UUVwGGxi05c=;
        b=jjzIs0ccKAO56d7Q1U0wsj3eVxXPe/OPne3TdP6wH3wVmsUNM0ol3kFR2YezabduO6
         ZQI7xLoi9y725QUlwS2yCp04hDWQIdmaIW0ZzWeJ5GEbpBWmjYEDDGEQYPhdBelsI11G
         k8A4+XZ6ejYw4s7pWKHQcaohf0RUJ2hxpjTwHnDGHf2IH+LbhSJbw0ixAuOah0WRVWic
         2kTSqWSiW1fceWKOhBYMwrYtFFW7aX5NWbJ+i0v15wNUW0b+iPBcNuxucu29xzUT1fee
         diYhUaqLgA8y6OYISasXjpoZsI7Xje1t5wNRhC9smAyBa8voi8LeyU7A/yDrIBtsfTwi
         6/Jg==
X-Gm-Message-State: AOAM531builo0HO6CpBLd1eyi6GW6eJVETzJM3cfvmJM8xZWbnGeHZSR
	CxrvNleZxWCjISkvG8HqRugdxC+gApfalCXD07s=
X-Google-Smtp-Source: ABdhPJwsQ5Uhyttw6g3VRigEh0ZfdJI15hLQMhwbX6c+R71yR+ChDHeuL5iBgKf/o0YwnsKTYdJEEiun3u3LFTdsQ5g=
X-Received: by 2002:a67:dd85:: with SMTP id i5mr3854641vsk.30.1599941497628;
 Sat, 12 Sep 2020 13:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200912164811.978100-1-mgloff@emacinc.com> <84342cda07aa41fb6f03a1dda815c22e1609bd44.camel@linuxfoundation.org>
 <CALXw4G7G6MghUtVr+po2JQDKCvF5SZksd-_8NCjasGUuPSjRzw@mail.gmail.com>
In-Reply-To: <CALXw4G7G6MghUtVr+po2JQDKCvF5SZksd-_8NCjasGUuPSjRzw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sat, 12 Sep 2020 13:11:26 -0700
Message-ID: <CAJ86T=UnPaXyzXQNZ7j7nLYVSAMs-rhfkepksRZnzQh1qLAbRQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sysvinit: Remove ${B} assignment
To: Michael Gloff <mgloff@emacinc.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 12, 2020 at 12:46 PM Michael Gloff <mgloff@emacinc.com> wrote:
>
> On Sat, Sep 12, 2020 at 2:11 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Sat, 2020-09-12 at 11:48 -0500, Michael Gloff wrote:
>> > In order for the VERSION variable to be set, the
>> > top level Makefile should be used, which only
>> > builds the code in /src anyway.
>> >
>> > Signed-off-by: Michael Gloff <mgloff@emacinc.com>
>> > ---
>> >  meta/recipes-core/sysvinit/sysvinit_2.97.bb | 1 -
>> >  1 file changed, 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
>> > b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
>> > index 80ab9d70e7..98916f7f19 100644
>> > --- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
>> > +++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
>> > @@ -24,7 +24,6 @@ SRC_URI =
>> > "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
>> >  SRC_URI[sha256sum] =
>> > "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
>> >
>> >  S = "${WORKDIR}/sysvinit-${PV}"
>> > -B = "${S}/src"
>> >
>> >  inherit update-alternatives features_check
>> >  DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
>>
>> I don't understand what you're saying. Why do we need the VERSION
>> variable to be set? Does sysvinit not support a separate build
>> directory?
>>
>> Can you rewrite the commit message so that someone who hasn't looked at
>> the code can understand what the problem is we're fixing, why its a
>> problem and why this is the correct solution.
>>
>> Thanks!
>>
>> Richard
>
> This issue is seeing no version on boot up since the switch from 2.88:
> INIT: version  booting
> instead of:
> INIT: version 2.96 booting
> with this change.
>
> The VERSION variable that is used for all of the binaries of sysvinit is defined in the top level Makefile.
>
> VERSION=$(shell sed -rn '1s/.*[[:blank:]]\((.*)\)[[:blank:]].*/\1/p' doc/Changelog)
>
> I'm not sure about the separate build directory. Any tips?
> Thanks,

A separate build directory typically only applies for components which
build with autotools, cmake, etc. For components such as this one
which build with handwritten Makefiles the default is to build in the
source directory.

Anyway, the patch looks fine. Key point is that you want to run make
in the top level source directory rather than the "src" subdirectory
to ensure that variables set by the top level Makefile are correctly
defined.

> Michael
>
> 

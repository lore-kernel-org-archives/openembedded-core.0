Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.1790.1588284431032705590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mv4oEHYt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id o27so3936930wra.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=EjIIBzyVXQQJhwfEoMZbEP1ecW64J40mFMfilgfkr/s=;
        b=Mv4oEHYtJ6YNH2HxE1oDMdmnD2f6jHMKjCDGYOfiO+5DzNYA54XxU4eRAA8QECMnh2
         gqMaT1ZtzT1J9WtgvcFhnK8naFYHHO813Oyt8IXGf8mW4QUkhvKRMlGYqSGu1+gsbnab
         jfe8OrehJdsPpkcHhOjbfk+Xp5SVlsjcmiRsJVvTC8HUgp90lnqvjpHTBK09JVZ7sAQz
         42kX7MpN1wl2GYXmkqsuvSoP+stdR5uWEIFYAIvIvgmx4925N0djWk4JaUOo9XnGlDu9
         UBtNIb7pyOmvDjeZB3nrZIWoLCvPZGyFlTIgFaBdq+Fvw/s7O6ApshcoodiEgVU4DNBx
         IzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=EjIIBzyVXQQJhwfEoMZbEP1ecW64J40mFMfilgfkr/s=;
        b=RPriQKVTY0XpZHDRsxwAws95d4CcidUXflO3qcqEDcfJEZP4Hx0rb06Ugj9TY2O8EY
         IZZ5RruayMLS2vnT4JCvNtQ0UAsLTB8gzpQpTMD7o2tSkcEts+JNw+hWZb5woCvBjrfa
         CF+KQiPnoozKQIL6jpY0tzJNQWZtWgmGKPiRUJWKWHy+9PwRO6VznUuW+fUOMFYpyBhv
         J0Gc34Eu7FVIK6/QqYz/YW8A5nTjH3dCVxxMwdzBYM+hMsb5Cjl5bU9QD9Ra3kyOzE8w
         DvvGU0JahAd3SYMBShgcZbf03r8wUSGBncopgnpCDEWMnYnhGaqYG7R/CK+1lSPxYX2a
         EZFg==
X-Gm-Message-State: AGi0PuYgxKLx4MKcWtjf0oTJ2Z/6tktXNdYWKaDjXDDBWl1IWlWqMNG3
	bugyN7tLV9GOSPrJzkHVvKsJgH1W/QjpsxSEvDC36Q==
X-Google-Smtp-Source: APiQypJuZdT3lh2xq2A6x74uiWXJDeq2O+Ak3Ssr03QpjzOApJfFrjWW1bGMDNufa6NGVfYEAlRSVRdabzK2TjJDa4c=
X-Received: by 2002:adf:df04:: with SMTP id y4mr677600wrl.413.1588284429176;
 Thu, 30 Apr 2020 15:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588175775.git.steve@sakoman.com> <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
 <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com> <20200430194458.GU11927@denix.org>
In-Reply-To: <20200430194458.GU11927@denix.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 30 Apr 2020 12:06:57 -1000
Message-ID: <CAGDS+n=-NEWm=EdA15=ZkQ4Gu609FshvXNrudC+HFp65G2ugPg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/16] bzip2/pbzip2: Correct license information
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 30, 2020 at 9:45 AM Denys Dmytriyenko <denis@denix.org> wrote:

> And this is also incorrect - should be bzip2-1.0.6. There's a patch on the
> list for this...

Yes, that's why I'm going to omit this patch for now and pull in all
the related patches in one go in the next round.

Steve

> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
> > >
> > >  DEPENDS = "bzip2"
> > > --
> > > 2.17.1
> > >
> > >
>
> >
>
> 

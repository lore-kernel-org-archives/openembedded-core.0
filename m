Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web10.1449.1589578933309867713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 14:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kWweqzAE;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id b71so4022888ilg.8
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJlJWdmhi0TZYZiw8NPDEuoptRLq3AAKGkeFf7D/v+E=;
        b=kWweqzAEjblV5Ft55qHifABTS7zTDdGV4XBoEInrMU8eqQ79Ocia5bivlOJHBq638M
         nw0MKv2ZAALaQ8XCtDd8ZpEGEOR5/NAefvID0zdj4up3kktg4DBchlsjdfknvauG13uM
         1EFm2wlExfrbrbb+aYVPOM+HEF99/36N46bRRZAMQfrGf7IVsV+x1U0D6pixczwM1Yke
         n2TIrCvb1cST7lCD6oDvpDyhHQvyIglCt5ofINLU9PYbQrq8hTuKLHawJA38S8B4iAEF
         tsOi93TDrUYxMV1QeCKmb0uO58Z4BVXNXCr7hsaoSktVqbFzmlOemL0JAH/Hf6ejHYQq
         AVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJlJWdmhi0TZYZiw8NPDEuoptRLq3AAKGkeFf7D/v+E=;
        b=KxjGoSsqFQS0OQonhin3scmV0JaBtWHr3XBNc1phXY5Y5GU3pn9gUnnWQGUIGbFy0k
         J6Vj0+ovWwxpbnpMNM1paumIGcYt+WsqWHAQlG0iyUvhXEXMwv4uJQM4P72OAK+vnBAb
         CWa8aFrNj25GoTea0M03RNYAhArafkR3/6f3VXoDEt2tGbmQcDabpsmDhFrPqgVa9u/M
         NBY+KNCwf8yWvj88GBEbyYSit4E5/DpcO5Bb3yD1XruklmaNnnvJ/p1aYOTFEja6Np4y
         Uf0XXzElGyp6KSlJOsozQlAmYujLcn+I8r/MQ9PUzUcexEJ23P+1U+ZA9Y/RmCBLk+RT
         Pvpw==
X-Gm-Message-State: AOAM533jktHdZdYkRj4i5aZv/1U8sc+hfcSyE/9feLPbCNEZAN7EYsSU
	Cci8oreBTcvla1kh+1ro5Aa8ZNLKqAjCfaGBbsQ=
X-Google-Smtp-Source: ABdhPJzEfY1aiOFUiIjTLid1PUp4eC8EZL6gJTFMqxF9V0Az3TE6zXB8UTgI/VOKEErgyR+kgIYPKOMUqewc3Ap9+Eo=
X-Received: by 2002:a92:8752:: with SMTP id d18mr5692723ilm.224.1589578932848;
 Fri, 15 May 2020 14:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
 <20200430214203.26595-2-schnitzeltony@gmail.com> <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
 <160F50EDD3A6B1F2.685@lists.openembedded.org>
In-Reply-To: <160F50EDD3A6B1F2.685@lists.openembedded.org>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Fri, 15 May 2020 23:42:00 +0200
Message-ID: <CALbNGRQbA8Xo9ysqkc4cO=yY=ETVeKfQAuMXkOcJU3E-Ht-UJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 11:29 PM Andreas M?ller via
lists.openembedded.org
<schnitzeltony=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, May 15, 2020 at 10:30 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> >
> > This seems to be missing features_check inherit, so that REQUIRED_DISTRO_FEATURES doesn't prevent it failing in my builds.
> >
> > Will send patch shortly.
> Do I miss something? It was never applied
>
> Andreas
Ahh I did not find it due to Umlaut in my name - it was applied
indeed. Author is now Andreas M?ller now.

Andreas

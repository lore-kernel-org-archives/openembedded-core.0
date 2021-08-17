Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.40638.1629213244479751678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Xa95tqJJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.47, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f47.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso2165480wmg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wVV2BwLMyGXUvucm+ljz507B8zu7VCi3e1md3UkVa6E=;
        b=Xa95tqJJykl5UBIohmLwxPG+4L/lzBIO4NLLDGIr8z6cHUtbbSS+nnkBhjxUxjIpA5
         zXYqajW7Jt9yqkgfzjfxkrkTRg03InhUw35+C8C/SpeBUF4LWjCd8C9BcikvRTAMo07u
         t1fFILFM3eGPLf4aIRoabwKCJdMRW1uks1NHHE0yE1zUCxyXfRmIeBxxDaNn1GW1bw4b
         HpGqYJ4q6QSXIDEoEehfU6Z5v31wb8jWerVjtJH0U3hXiYSvIZdT+45v8VIS0ZyP3VYh
         LMWeSkooq7uG+jBcE339O7wRDR91+Rm+r+Ji2YISAKyEfz8hlrX93fTzSquGJMzMOrQs
         ypMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVV2BwLMyGXUvucm+ljz507B8zu7VCi3e1md3UkVa6E=;
        b=jwWsYVKzBjiiNuAPmMhJmE08WuTzTA5NFrhiNi8F1zEkyKYN5PDH6ryB7fexsUUfWY
         gOXna3zmATNs6EUi16a/xT0+FPoZTIVO1tWII/ZhiZfeqdhOI7PKMNkYSoIroNVdgbpg
         B7ue3eD8/asIBCJGn8kAeLl4cmE0HFYrg+F9KWkRsUx3qiY+5mKHwGqFiaFfPP2FG3/Y
         PgYhNWKdzoQGt/yWpmCVWEyXZOUTPRBYwNrQHgPGI4eL+/ozMXBJ+wVh21yRJbofA8I2
         caDc7LPVtpIuMW18EH920cqvoQ5siDByVEosyp0M0hWWXYUmo/uu5c+Cm9dFL+E2ybdL
         fWpA==
X-Gm-Message-State: AOAM533pxLWWBn6qSmIFR8OQP0a4Hr+dkYk8o8A9dLwU8zsrYArx5vkH
	KPoG9EzdkDw5QvXsq9whO+Bl9CaSJ1vs+1upqO1K+Q==
X-Google-Smtp-Source: ABdhPJznmjGpvh7uyK20edcS9EhOwP+Suseo/XfFqTxkGORf+Bva9XQZtN3GzyBUn45NBcIvklFJLsgZc+VjiAPPvFQ=
X-Received: by 2002:a05:600c:2f17:: with SMTP id r23mr3952836wmn.118.1629213241991;
 Tue, 17 Aug 2021 08:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <1628579261-7380-1-git-send-email-purushottam.choudhary@kpit.com>
 <CAOSpxdbihGhrEUqEd8+vgj5hvv-5wexzr2fN0zwpTMBuyp-5pg@mail.gmail.com>
 <CA+chaQdf7Yp77OWxYDcFSCfQ_Y=8xnjv3KVCgvNUfqeZ8sRaYw@mail.gmail.com> <CAMKF1spo8PvwkjYz+PB2UgmmuN=DkGJYiJ6z5Xk8sqjeLdEcnA@mail.gmail.com>
In-Reply-To: <CAMKF1spo8PvwkjYz+PB2UgmmuN=DkGJYiJ6z5Xk8sqjeLdEcnA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 17 Aug 2021 05:13:50 -1000
Message-ID: <CAOSpxdZsze14NaOYjBEN6yBkH5RbrZAu6PmzTUG8LO9G_B_dPQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] python3: Remove unused python3 recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Purushottam choudhary <purushottam.choudhary@kpit.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 5:09 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 17, 2021 at 8:00 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > On Tue, Aug 17, 2021 at 4:52 PM Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> On Mon, Aug 9, 2021 at 9:08 PM Purushottam choudhary
> >> <purushottam.choudhary@kpit.com> wrote:
> >> >
> >> > Currently in dunfell branch python3 version is 3.8.11.
> >> > so, python3_3.8.10.bb is not needed.
> >> > Hence, removed.
> >>
> >> I don't feel good about removing a recipe from a stable release.
> >> There may be people who are using 3.8.10 for whatever reason and
> >> removing the recipe would break their builds.
> >
> >
> > IMHO removing 3.8.10 is correct in this case, normally the upgrade to 3.8.11 from:
> > https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=1ba51ee2d52ee92bbdede9f2cd2f9ed9ff04ddb6
> > would remove the older version like the upgrade to 3.8.10 did couple days before:
> > https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=471d19fa70c4c2b43a039909c9538e2223996335
> >
> > 3.8.10 recipe existed in dunfell only for about 2,5 weeks (and probably only by accident it wasn't removed with 3.8.11 upgrade), if someone started to depend on this exact version for whatever reason, then something is wrong with him or her :).
> >
>
> right. 3.8.11 is a bugfix release so keeping 3.8.10 around will also
> mean CVEs we will carry with 3.8.10

OK, say goodbye to 3.8.10 :-)

Steve

Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.1925.1589580612400509473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 15:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HzdpX42A;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id w25so4307055iol.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G4S20gWS+5ci/FYX+sdlYOPK3BotW1Nej8ZTobrqfbA=;
        b=HzdpX42A8zkmoZ7jDKpVuFfd+GHXV3KEKRmsTUiTc5KVoVT9D3om7OJ4pzDbapylAv
         xJu2dAgDsrJVZzU5JegeB2xqYww3ppJD7UiBcItp4NSSTk1eSoB485t8WHY9ZSX4gkcE
         ZAZZHlT0BGgwTX+9SQlX+HR2HT+/Dtha3YSERoJwH3V1uvD1FvryGFb5+OKkjE+ol+oz
         QO3nJVu9/crzRzTnmiuTLCHqrI86/26D/FpcC91o0DME6jCywDFF6TtaWdl+KiIf5zRG
         9pQd9KkJfWwwYDQfab5UxXr8/OPcwdgS2/i1P2Mi1lJ6URiWS94gIaLNKqEIcly8eX4T
         0GEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G4S20gWS+5ci/FYX+sdlYOPK3BotW1Nej8ZTobrqfbA=;
        b=QQXfzbEPA71VnfHZPua0iPmzPEkquvjmvUrPWAkMuyGP2LXVw7ZlWCkIRtZR9pmake
         YwbjwoVbrtJ/181KNoUi6CLdCALTwIYuVIc4py/QuWV90ZJU22V/0+9wXYX7vkZY/1Nz
         ticGh4JRXcO+eOt9qisoPeSYfmcKFo6640/gmMFiWUcbihBDiId6VszTBc3rr5Da60F1
         ioySxnkercDn0Wf/hPCqpMo3WndS2v/nEiUtGmzKcQqmPQDlffdykhCvo8T7tvTPByWA
         nVUZknxdAB00DJACJimeJ0WqbhkpaZBaHrlI4cBTxZkNO/Oxp0Y/+/R9xBSwaPztJw3U
         jK2A==
X-Gm-Message-State: AOAM532A0JibM1nXghAgBUdM92ST+Twnf8PB8nTYUsPXbfxzmRsukRF8
	SsAU9MejJnV8zjWC7PMlf+B/iHCQ6iz8kD/Oyho=
X-Google-Smtp-Source: ABdhPJwCDhpXg7r/z2gxVuoxtJAm5C0eHoqU99HUtio4PLGN7qILDgcNAhdSVTiNnnvSc89aMcwzGMVnrSMCF+LVDD4=
X-Received: by 2002:a05:6602:2c8f:: with SMTP id i15mr2213513iow.45.1589580611860;
 Fri, 15 May 2020 15:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
 <20200430214203.26595-2-schnitzeltony@gmail.com> <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
 <160F50EDD3A6B1F2.685@lists.openembedded.org> <160F519E3DB5CDF9.29809@lists.openembedded.org>
 <CALbNGRSf9iwrBgGAqZ2GMPOX8hXoZu_JGQ7qt8Y5+M6N7n6ozg@mail.gmail.com> <20200515215933.GG11927@denix.org>
In-Reply-To: <20200515215933.GG11927@denix.org>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Sat, 16 May 2020 00:10:00 +0200
Message-ID: <CALbNGRQRwbEd0QhPEpCPRMWiDCwC8_Owi67opUkrXinRqC7D6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
To: Denys Dmytriyenko <denis@denix.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 11:59 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, May 15, 2020 at 11:52:23PM +0200, Andreas M?ller wrote:
> > On Fri, May 15, 2020 at 11:42 PM Andreas M?ller via
> > lists.openembedded.org
> > <schnitzeltony=gmail.com@lists.openembedded.org> wrote:
> > >
> > > On Fri, May 15, 2020 at 11:29 PM Andreas M?ller via
> > > lists.openembedded.org
> > > <schnitzeltony=gmail.com@lists.openembedded.org> wrote:
> > > >
> > > > On Fri, May 15, 2020 at 10:30 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > > > >
> > > > > This seems to be missing features_check inherit, so that REQUIRED_DISTRO_FEATURES doesn't prevent it failing in my builds.
> > > > >
> > > > > Will send patch shortly.
> > > > Do I miss something? It was never applied
> > > >
> > > > Andreas
> > > Ahh I did not find it due to Umlaut in my name - it was applied
> > > indeed. Author is now Andreas M?ller now.
> > >
> > > Andreas
> >
> > And to turn this completely off-topic: on each mail I send to the list
> > I get an email on extra thread with  'Andreas M?ller via
> > lists.openembedded.org' in it's title.
>
> https://en.wikipedia.org/wiki/DMARC
> https://wiki.list.org/DEV/DMARC

what do yo expect me to do

1. read gazillion of lines just to sen emails to a mailing list
2. change  my name
3. stop sending emails

Since it had worked for decades I prefer 3.

Andreas

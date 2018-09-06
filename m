Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id CBA986025F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 01:01:02 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id r69-v6so17375046oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=/uUECOBmwKySzGXhernIUGb92BQVlNcq147erTz4D7c=;
	b=qTkcLJfwZiAcdJPlr8PmxAPm20zhqG6sUhlNsgvT48tORy0K5DvY9EqoAfaHh7eUev
	/6ALx++JfcGn1tkqmit5DDiOj+QKaNJ2DdWo6WPSQ7hlXIDH5s55rt3vY1fmKboImN0z
	ICjxNmsLN/UfHKKKs8mX+xsL+kiS9IvLnOvS+HCgktzRV/0myk4rYrxLMFNNDgAm3Qg/
	vojPRKvxlJNvR/FK4h8BKvI/6d2Q1F8Ts30uoS1bYiqdUVknYJlct02V5GrssC5rb02O
	MTFXNwK8HmBb3PTAxUUftx+UZ/Tiu5VLU9BguS+wqO1GdBasnntY0VgwEY2+U46ZaL/S
	yq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=/uUECOBmwKySzGXhernIUGb92BQVlNcq147erTz4D7c=;
	b=ibTwrP7gOwZavGL1/hsyx37MF8D8REflbkvDGEYBHYjVGF/VzKIqS/w6k/o53S0Aar
	l7D7DOPG5urIEmjuTL72nqnQIWRtkMGMpynld15E5hbFlANx8Tl2dflShzfENmQ40TFe
	66eo6aOJKgXeFg0ko1dF5xe6sb/pnFAijcmQV4C+jkb1FG0GztOAGzKhDbOWGR8IcCTW
	sIZ8TN6J/qM0Ym4aa4DL1osos5wsT3xbx7+giPgGbH9SHZUTeDranWcv3V2cQleXQssF
	9jyc/fXVxFMGHtR3DC+rKtnGkkgPehyK4Hy/vKTQFz1Y7S/qwqy99e0CyT8tN+0ZyqdK
	pVyQ==
X-Gm-Message-State: APzg51Bn8nBwfRjYQ1Z+wYl8kGB9SLX8jn0Vhh1fRtKXiAKTZek/I3BI
	C9X0al0+1dBSlbzPARd7iNl10C1YuVn5Eg==
X-Google-Smtp-Source: ANB0VdbwsrL/F8Mgxt5DR4w0g6+lrbwPuuBM/7jBhcCrcvv70ycZEIyhGCdkb8ryR66D7hjyefSP8A==
X-Received: by 2002:aca:4886:: with SMTP id
	v128-v6mr309970oia.69.1536195663103; 
	Wed, 05 Sep 2018 18:01:03 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	l204-v6sm2020872oia.45.2018.09.05.18.01.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 18:01:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id k12-v6so17325871oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 18:01:00 -0700 (PDT)
X-Received: by 2002:aca:f045:: with SMTP id o66-v6mr384329oih.8.1536195659863; 
	Wed, 05 Sep 2018 18:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
	<CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
	<CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
	<CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
	<CAMKF1sq7UQMb7qGtEZhXiB5W09sTxYQdt1ZMq6cEUic6UcCd_g@mail.gmail.com>
	<CAP9ODKom3jT=M_X6wrz5WKRat3yRxtukm5Hrg3FnEtJUiis_vA@mail.gmail.com>
	<CAMKF1sp0rF18CtGd3NZigqtqAnrpot+kgNzd2zWQ1LQezzBVUw@mail.gmail.com>
In-Reply-To: <CAMKF1sp0rF18CtGd3NZigqtqAnrpot+kgNzd2zWQ1LQezzBVUw@mail.gmail.com>
Date: Wed, 5 Sep 2018 22:00:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpWTf6bg8E496Eb2FHd-_P+aFds4g+w+N1N5gF06iZZEA@mail.gmail.com>
Message-ID: <CAP9ODKpWTf6bg8E496Eb2FHd-_P+aFds4g+w+N1N5gF06iZZEA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 01:01:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 8:19 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Sep 5, 2018 at 3:38 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > On Wed, Sep 5, 2018 at 12:18 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, Sep 5, 2018 at 6:42 AM Otavio Salvador
> > > <otavio.salvador@ossystems.com.br> wrote:
> > > >
> > > >
> > > >
> > > > On Tue, Sep 4, 2018 at 8:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >>
> > > >> Here is one failiure that is seen in meta-oe with updates cmake
> > > >>
> > > >> http://errors.yoctoproject.org/Errors/Details/190510/
> > > >
> > > >
> > > > I am looking at it...
> > > >
> > > > Seems not related. I built poco using cmake bump and OE master.
> > > >
> > > > Seems related to the musl update on master-next.
> > > >
> > >
> > > here is glibc failure log
> > > http://errors.yoctoproject.org/Errors/Details/190886/
> >
> > I did build against master and master-next and couldn't reproduce it.
> > I saw you are using 'bec' distribution and I used 'oel' so it might be
> > changing the end result.
> >
>
> did you try poky ? we now build with security flags turned on. Soon
> to be propagated to nodistro in oe-core as well.
>
> BEC distro policies are same as poky with few additions
> see
>
> distro
> https://github.com/cbrake/meta-bec/blob/master/conf/distro/bec.conf
>
> local.conf
> https://github.com/cbrake/oe-build/blob/master/conf/local.conf

I did enable the security flags and I cannot reproduce it. I think you
will need to take a deeper look at it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


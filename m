Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.14975.1608659601437653479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 09:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RTyQ33p0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r3so15361886wrt.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FK+OMlJjE6nWgx1xzm65Gnale9HsX4e73H9dSbXhrfc=;
        b=RTyQ33p0ouq9/3MU+IDbiwERiPM3GLZNcY56Kc6QbmTP7SeBPA2jggT1FoQYok9U8R
         2cjaEuKzrXbAh97XYWDWPheFrTO5WTuYnOUKjniOxqsvrLHAYDP++elfaW7GIq5fJLnV
         NnDjnEi+BoJ14g1voyPGnxU/0GHPN18Crx1Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FK+OMlJjE6nWgx1xzm65Gnale9HsX4e73H9dSbXhrfc=;
        b=GixmRThY2FqFgOWhHsDJ2nB2R561CrJCGtK7INWCLxIpUFNjBC28K7cXg6/+7l8Lu6
         YxlzEaQNZ1SH2zsRTZH+7isqm1C764jKc0JwR+UooF2GPrwhCA4KLkWFZxhq6E7kLXbu
         5jRgYcRrGPjBRNiIbVmh0PNbar+OmMlTQjRdPnlZ/YxMclIQAyxe2TVVHKVoIs4M4Rit
         dWHOBzFMJFMkoPjN1J1N3+oFvhi1yXmPuVVq8ef2NyKZ/Q43XmrXTYHR1VWZ4IjSNwz/
         uhA1JLisPsi20fddD7trLxJL1Z55hsTIR4uj4cfxEHyy12Zl4HZO2QrwO5UFyGaKd7A+
         FFRQ==
X-Gm-Message-State: AOAM532y/EVuUgJFE99AKAvTetrdtZAGGXElgm6AgJeQtEpoQ5NcH5DU
	0d6UKdbiA75rRFRvA+uahVznuA==
X-Google-Smtp-Source: ABdhPJzGcdGHEfsie8Hzk+J3wIQtPzFtb5VvsivRgASAFzXUchsa7OSirmZ85KTGc3mZWtlB5t+KLw==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr25347690wrr.342.1608659599898;
        Tue, 22 Dec 2020 09:53:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.e.b.7.c.1.8.0.1.a.0.f.0.a.6.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.e.b.7.c.1.8.0.1.a.0.f.0.a.6.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b6a0:f0a1:81c:7be2])
        by smtp.gmail.com with ESMTPSA id u66sm28111152wmg.30.2020.12.22.09.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 09:53:19 -0800 (PST)
Message-ID: <f08d13fdf8d59a36dbb58335bf17519ed240c859.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, Erik =?ISO-8859-1?Q?Bot=F6?=
	 <erik.boto@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, Martin Jansa
 <martin.jansa@gmail.com>,  Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Dec 2020 17:53:17 +0000
In-Reply-To: <CAM9ZRVvOXxc1GsZu9BS2s44ipunQhz=cPvdDHy+s8nx-5UDAmg@mail.gmail.com>
References: <cover.1607007208.git.steve@sakoman.com>
	 <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
	 <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
	 <CALNvYWMznudnN+_6yCkxcwxhtv=8M=hRC1nNpQP6Ww7ZTedvPg@mail.gmail.com>
	 <45cc5593b9b9bfbdfde689a5f72a678a99eb5d2b.camel@linuxfoundation.org>
	 <CAM9ZRVvCueC0+9b+Tvwv2pHm+44OGwU18O5zDH2wBUgghW_gjg@mail.gmail.com>
	 <CALNvYWPbzRzC_B7FEUTZX7t5ts_Si+vqPaD8cy99JOsEF4+LUQ@mail.gmail.com>
	 <CAM9ZRVvOXxc1GsZu9BS2s44ipunQhz=cPvdDHy+s8nx-5UDAmg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-12-22 at 15:09 +0000, Paul Barker wrote:
> On Tue, 22 Dec 2020 at 14:57, Erik Botö <erik.boto@gmail.com> wrote:
> > 
> > On Tue, Dec 22, 2020 at 2:50 PM Paul Barker <pbarker@konsulko.com>
> > wrote:
> > > 
> > > 
> > > Looking at that bug (#14129) I wonder why "${WORKDIR}/build-wic"
> > > was
> > > added to PSEUDO_IGNORE_PATHS in
> > > https://git.openembedded.org/openembedded-core/commit/?id=ad8f5532ffaead9a5ad13e1034fe9e5e1b7979f4
> > > .
> > > Is anything likely to explode if we drop that addition?
> > 
> > Yes, if you try to build an image a second time it breaks and you
> > have
> > to "bitbake -c clean <image>" in order to build it successfully
> > again.
> > I don't recall the exact error at this time, but it was related to
> > the
> > partition files wic created under build-wic.
> 
> Ok. Sounds like we need to move the directory wic uses when copying
> the rootfs out of "${WORKDIR}/build-wic" so that it can be tracked by
> pseudo. The partition files should stay in the build-wic directory.

That sounds like a promising suggesting to me FWIW.

Cheers,

Richard


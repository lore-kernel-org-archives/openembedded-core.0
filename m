Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21130.1627916873443673089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 08:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UjrsB62K;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.49, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f49.google.com with SMTP id k4so11054357wrc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGSP5vs6qY75ysAF4lXlox0fgrl+h57/dk1o7wJxlvs=;
        b=UjrsB62Kegg8mi3SFXMIJx8XhSOmip559Gd2assJn+QTz7ybOX3+89iigNVE2ij0gw
         oes+VzWcn1+LBU0vmWAyDxT5TrwU2VP2UDJ51In01z7fqj/DwvZvFc78eWxwW5ePgt/Y
         sUZJc/t1152LQb42RMMut429V2mV7YB8dRneGItdj8vd0T3qLVAoLICWfS1M+T9Un0Ry
         4d16f+lhZ8uLlrjXZpSf90H8N3h+kYbInIY97nlF7/8f7VaxrBAyIqX5Llmqw2xGiZFm
         z4EyvagaSOsyd8feXpN41bmh6Yrx6kQgxOmsgsl0AVNbr7dMH/j6Oy47WxdRkO2/wkD1
         UxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGSP5vs6qY75ysAF4lXlox0fgrl+h57/dk1o7wJxlvs=;
        b=J+y8zLoTn/ZJ3yvXLqDZZ6c0bVHlCgsM3kDYefyyhc5m1yvFIqcWxkKRT7EPzilmPe
         jTAPX41fiTIZVYbpwEDmj9KekpskbBJDYrSsDp3gQRyC24TgF/TbbYBCg9QlFtilb/7o
         7KtsM5BycezH7Q6vLxKz4AAFwLUIgLGTKUqhazfTt7GaDi7TJUHLjSunUsoBVghjLQ7V
         AOuSrtBJuCZTNg6FHTFZgIOhuLS0pVpONXE+uxkU4YYGvb74cN1IMkcHzzWwwh7w/ZKg
         jFPN/nvVrf2aimUWCBp0t89bd0e4pJ/LCwzFAUvjV1fXS0vHqI54NGEfS1NvSfgK9jRa
         O9Qg==
X-Gm-Message-State: AOAM5338sr7xMxNaFAuKuYpHTAVyFvHHfZvyUxt6VcCuDrAG86eMvyZm
	tbHemLhJhYnEqamnKqpOtGJQZXSD17u2TkaYApbP1Q==
X-Google-Smtp-Source: ABdhPJyqpb3FTOVFw2BiL7bLXY4aEgfTOhNwugSaoRyuc6jzGAX8TJ4y8pzgp+2fNN5A+abe76u4s+4zUbsNtatwhmM=
X-Received: by 2002:adf:ee08:: with SMTP id y8mr17912002wrn.299.1627916871956;
 Mon, 02 Aug 2021 08:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
 <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
 <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
 <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org>
 <CAP71Wjz5-CQJ7nJzRU+Kij7itOLFeyxsyYkc=XGm=U5iWHqN7w@mail.gmail.com>
 <CAOSpxdaMyYkAnuM72SjwZYMegvRyPN3oAL+Qo1BjiFjC8R67Yg@mail.gmail.com> <7419111ad58a262461b858dd92771c075f7ae1bc.camel@linuxfoundation.org>
In-Reply-To: <7419111ad58a262461b858dd92771c075f7ae1bc.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 2 Aug 2021 05:07:41 -1000
Message-ID: <CAOSpxdY2evRkfm55sJro4HY7Gc29aN-sh9ByNLX2fkjM2=aWdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Anuj Mittal <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 5:04 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-08-02 at 04:57 -1000, Steve Sakoman wrote:
> > On Mon, Aug 2, 2021 at 12:35 AM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > These patches are now merged in master, and I believe they should be merged in
> > > dunfell and hardknott too. The 4 patches apply as-is in both branches. Let me
> > > know if you need anything from me!
> >
> > Done.  I assume I also need a version of the autobuilder-helper patch:
> >
> > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-
> > helper/commit/?id=fe72e222961d69dcd4d638e7e05b437a65e8f34c
> >
> > It seems that dunfell is checking a much more limited set of layers
> > (only meta-intel for check-layer-nightly)  Should I expand this list?
>
> There has been work to get some of them working, so yes, I think it would
> be good to test and see where we stand.

OK, will do.

Steve

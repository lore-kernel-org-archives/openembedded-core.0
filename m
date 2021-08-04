Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.10309.1628089865892799323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 08:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dIW5321W;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.41, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f41.google.com with SMTP id c16so2620388wrp.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wxkqz3+BJCfqYuqg5mRTEqqDaRfdifByUteaxWMcqUA=;
        b=dIW5321WNxaob5hbBOFS6PWzeD3LMtBsfnfYZHQbIcL0gRaQg701Z73jFYvBg62Qgp
         GZLBefAD5JnPmJlib2M44nckKQKgt6llaGOKea16H60xd3LcXTxrteIWjv1P9WnoGp1u
         i3kG3c5xrtLKuJ97SApegGvoA5iVDXk477QwOoB1LgLXHZCx1fUTtz/4N004dJw50v9X
         j+xwnc5G/H1mGjhDgxVNJN4VyQcP1tM1CKE6hjUJ+HigY1OvF8lewPDJ4VjvU1aWy0my
         0XxCFQqY1q1e6BKuLW3NMFHMYiQX8pM7Moi4oWVf7swTW0udl9PjSH8xwMeylKGQwFFd
         pTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wxkqz3+BJCfqYuqg5mRTEqqDaRfdifByUteaxWMcqUA=;
        b=gslRSHNFeRMkR/vDC2nN79AzAcAuBOYsFaZTI/vao5gshWdYTVYo4r9JB362nK/sMy
         gwOSzLNFBdKDpALsh0NUgC2vFGgZub5mSthhJZH92wVUqoSqBQ0biz8sdcFJHewuAUKC
         +VAFYZUS1wkyTkggqAS/sMLab2umckCHpSPbVXstJMbINVEuytDxjHTx38Trwi0SI0xw
         1I+vwKQWMJWoJTtbNYEyUOrD6rUwvwjIJzIi6z4UhkCT9CpiZi42Ipd8pIJYJmkBzdk9
         MtNGtMJTRr3B3ZVCRggTMBtEH3nC5X8u+ceNn3ZQZ3WIaC0fKFPWK7K6QMJwHKJIQPmt
         OiTA==
X-Gm-Message-State: AOAM533gTsjST/KuZuHkNlBrETbMbZqp/eCOq0nf19Hr7QoYtViV1Toz
	gN1Xxg2uiQSKe9HiLp/U+ZkNEC+PwHpa4YItDmKmNw==
X-Google-Smtp-Source: ABdhPJzwUxG04s0JBHqcKx2tEIsA9VgKN1kb4sg7LhEynYNUUcCMBJZ75ZZSZc54kRpAMVJnwG1H9DYMKvIyYqTmF+8=
X-Received: by 2002:adf:ee08:: with SMTP id y8mr28998845wrn.299.1628089864024;
 Wed, 04 Aug 2021 08:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
 <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
 <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
 <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org>
 <CAP71Wjz5-CQJ7nJzRU+Kij7itOLFeyxsyYkc=XGm=U5iWHqN7w@mail.gmail.com>
 <CAOSpxdaMyYkAnuM72SjwZYMegvRyPN3oAL+Qo1BjiFjC8R67Yg@mail.gmail.com>
 <7419111ad58a262461b858dd92771c075f7ae1bc.camel@linuxfoundation.org>
 <CAOSpxdY2evRkfm55sJro4HY7Gc29aN-sh9ByNLX2fkjM2=aWdg@mail.gmail.com> <20210804021429.GV1528@denix.org>
In-Reply-To: <20210804021429.GV1528@denix.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 4 Aug 2021 05:10:52 -1000
Message-ID: <CAOSpxdapQPPsP70kARWWLGLJ-Y=P5OtgugxeyZaiLM=NsEH7ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
To: Denys Dmytriyenko <denis@denix.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, Anuj Mittal <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 4:14 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Aug 02, 2021 at 05:07:41AM -1000, Steve Sakoman wrote:
> > On Mon, Aug 2, 2021 at 5:04 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2021-08-02 at 04:57 -1000, Steve Sakoman wrote:
> > > > On Mon, Aug 2, 2021 at 12:35 AM Nicolas Dechesne
> > > > <nicolas.dechesne@linaro.org> wrote:
> > > > >
> > > > > These patches are now merged in master, and I believe they should be merged in
> > > > > dunfell and hardknott too. The 4 patches apply as-is in both branches. Let me
> > > > > know if you need anything from me!
> > > >
> > > > Done.  I assume I also need a version of the autobuilder-helper patch:
> > > >
> > > > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-
> > > > helper/commit/?id=fe72e222961d69dcd4d638e7e05b437a65e8f34c
> > > >
> > > > It seems that dunfell is checking a much more limited set of layers
> > > > (only meta-intel for check-layer-nightly)  Should I expand this list?
> > >
> > > There has been work to get some of them working, so yes, I think it would
> > > be good to test and see where we stand.
> >
> > OK, will do.
>
> Steve,
>
> Would you be able to publish results of your testing on dunfell?
>
> I'm interested in some expanded compat checks in master, but they were blocked
> by known limitations in dunfell - was wondering if those got resolved yet.

I was able to successfully add meta-aws, meta-openembedded and
meta-virtualization to dunfell check-layer-nightly:

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/commit/?h=contrib/sakoman&id=f0108c3cdb8d50dfb877ff880fbc1a45e9abe899

The other layers currently in master (meta-agl, meta-arm and meta-ti)
failed with dunfell.

I'd be happy to add those to dunfell check-layer-nightly once they are fixed.

Steve

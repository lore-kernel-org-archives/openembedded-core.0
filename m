Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.27691.1612737472613309963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 14:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rbHWJFBV;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.49, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f49.google.com with SMTP id z6so15009479wrq.10
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 14:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzN4xhbsG1jeEPPQjqc8XJ0sMjwniM0a4ET1df+/4Ws=;
        b=rbHWJFBVYoCE2DjK0z5wbyWACbHo6g9xAfS6i3UlyRfNp5qfP6DqycXihjeS5r9YZE
         euDe+r5a9QOK5Xz04JsYc2nVed0OMjqhEDHrLl+JFXwgvFZGKrGBwHj9knABn8L+yLPy
         idf2FnXoV+B2lwoRrt2VSGJc5sZ4rj8viznwSkuuLenv+0TbsDgrTZDKuw5bwMGClWin
         RT/H09peSnVJpJHp09u5JPr29Uid5CwC+xXY5YvyS6lPgxV+eJ1IiWzYI+l6Nw4bZylp
         K3Mj5+4hXDLnDwHWOeJB8hw7V395C+xDt87MYYJ0iusznqPo7FhqVMNeZs8YZItng4PG
         kB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzN4xhbsG1jeEPPQjqc8XJ0sMjwniM0a4ET1df+/4Ws=;
        b=OFQ24p7Xb6D0R7fCm1fRLHn4Uu4NzOIXluOCHFzN15bR7MT5kY7X4jE1KShtCqBKja
         1VTFtMQTJl42LHmOGRlNccdzbyR21VOZKVjXgAVknaq5qb949joP+YLBTk7uPgWj0umL
         b4iGWRLVtvt6KwgGds4gX/elCLfK9vyRNfHGsuqUecigbJG5iICLnp2LkIOEm4UJLVSu
         g4mxKBAw1wuBZkjxXQdYF6T+kX059ahh47wX6+JVU9l14HDsSb3k6N9COA8OHdBfKKIU
         6br0B47Q1+jMiLqUF6ByIYKogmZI+hse3iNX/FVeTycinc+k9W3CWjLxVhAyk8c/cR7T
         /7BQ==
X-Gm-Message-State: AOAM5326DmcGbehO7nXzaW23k7vofAHs0FuYNUn5qZFWlTA5LYWZeO8Q
	+p7SUqUh4nv8AL6/sVntXWBNncOGkYgeeBt0BdcEvA==
X-Google-Smtp-Source: ABdhPJwmUEnL2Gv/RvnF/6SZ4VXVWOCT7qRCliHzySACOeEckA7SieN5zlf3kjievN52rCC+y7GNiIEjilJyQg5mGQ4=
X-Received: by 2002:a05:6000:1815:: with SMTP id m21mr16532113wrh.350.1612737471172;
 Sun, 07 Feb 2021 14:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20210207180401.2979D960302@nuc.router0800d9.com>
 <049ee90a7c772d3b4850d6c2d97160c0e8538273.camel@linuxfoundation.org> <CAOSpxdZNYUhBLNSZrOk5zavG8NwLJEPVdjRn3owNX+uxmXeSjg@mail.gmail.com>
In-Reply-To: <CAOSpxdZNYUhBLNSZrOk5zavG8NwLJEPVdjRn3owNX+uxmXeSjg@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 7 Feb 2021 12:37:39 -1000
Message-ID: <CAOSpxda_EgiMPvNGWT05i2fGj3eUgvFnjRucgB6s2px20GFUBA@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 07 Feb 2021 08:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 7, 2021 at 12:36 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Sun, Feb 7, 2021 at 12:29 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2021-02-07 at 08:04 -1000, Steve Sakoman wrote:
> > > Branch: master
> > >
> > > New this week:
> > > CVE-2018-12433: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> > > CVE-2018-12438: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
> >
> > > Removed this week:
> > > CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> > > CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
> >
> > I think I'm seeing a bug in the tool here. Note that 2018-12433 and
> > 2018-12438 are marked as applying to both openssl and libgcrypt so the
> > tool is bouncing between them...
>
> If you look at the CVE database entry you'll see that it calls out
> multiple packages, libgcrypt and openssl among them.  The patch this
> week whitelisted libgcrypt, so now it is picking up the openssl entry.

And of course that is what you said in your email :-)

Note to self: don't read and reply to emails on your phone while out and about!

Steve

> Perhaps our tooling filters out CVE's that hit on more than one
> package?  That would explain what we are seeing.
>
> Steve

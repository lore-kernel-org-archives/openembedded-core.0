Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.61.1631554005870249365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 10:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PEbN8KPP;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.51, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f51.google.com with SMTP id u15so9824995wru.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZH5litMKCtHEygaUA/JqSvSENfdmEOgGu51YlWYUPzU=;
        b=PEbN8KPP6aysmoVAe0OoMcGklnIcicNoDr8cxtDLaX3DpEv4Jc8KZ9BDW9jeoxI5yB
         gxBd+rGmyCLN3VOKDhrNfm+UZqaeWFBsdr+4gIJgzbulE9HS8hrYXtEhHvI1jWgbQAGw
         jqf+kw22HqyzSlFTL/J7CHues4QPKPEG3OcV9+WS37Hq1+/8gb0uITjw//VQL3xD/hcG
         4JLHIe5ePianTy7HEydYoG3QmOJalfk/uAKoSBX+tedQIu59T1NrWCdSG4rq4/nN3DVb
         08RstBFO3px7O14KDufxombQ+zcdqYbJN1uUYyg7uPhxKumt5jaA7vTVl5TMsso0CVTK
         4V7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZH5litMKCtHEygaUA/JqSvSENfdmEOgGu51YlWYUPzU=;
        b=NFn0L4BvwP4nG2C8vp9cIkb8DsOkO/9F53Dv0DWvtFGaRomtCVV/FWGv1+OSMBhgtp
         dv/oDNzqOEHAQuz5XpAJUW0SCssqHFLSZFdieIqos9tTZKnS0ku/UfWTXWtQXZhH3nen
         Ssc7EVlfYSa0gHZv3miTsjTLVFUsfosvwo66UCFeHI36NqxMjZGiNixSTtvNyWY39qQi
         YbRB1kBDhh8bJYZo+x/KiN5wJD8cozNRxg7zKzfPP3fFal1GFQljgk5QHpKG7i0DXeZ0
         YQGqpKQFJZitYV4Pp4CteGdhzBKaDO3sPmfD6B0xUQ6ztgd01kh7tnM0ecwQiqvfogRD
         ugJQ==
X-Gm-Message-State: AOAM530xy27Y/y4r46Ill5Coo3iUD3P6gOyK9ThgZ3JHRn7udsqtaq+W
	FqBaqV+JtQZSqASXe1JkKRscd5up428at+Gurp46jw==
X-Google-Smtp-Source: ABdhPJzuPkNsjKayptx2VMzxJNpornMrNhtY6EcEIRCE+orhSnlRcG+g3Dar1YZe9Q8EA3Xl6GMOYmpy0Z+GzE63CZE=
X-Received: by 2002:adf:e10c:: with SMTP id t12mr13912228wrz.36.1631554004222;
 Mon, 13 Sep 2021 10:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210912150121.8237296032A@nuc.router0800d9.com>
 <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org>
 <16A41EB09718E439.21276@lists.openembedded.org> <CAOSpxda2cHN3d0WDMLszq8QJD0-Qa37e0NU57Xu21EXR672oFg@mail.gmail.com>
 <5a6a112b92ba3921ba31bc648f37f9cff2687f49.camel@linuxfoundation.org>
In-Reply-To: <5a6a112b92ba3921ba31bc648f37f9cff2687f49.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 13 Sep 2021 07:26:32 -1000
Message-ID: <CAOSpxdbH9mEv0U8b641i7r+h1jpt--kNOT+PqKk3-e=FK4kw9Q@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org, Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 7:01 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-09-13 at 05:19 -1000, Steve Sakoman wrote:
> > On Sun, Sep 12, 2021 at 6:05 AM Steve Sakoman via
> > lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > >
> > >
> > > On Sun, Sep 12, 2021, 5:57 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Sun, 2021-09-12 at 05:01 -1000, Steve Sakoman wrote:
> > > > > Branch: hardknott
> > > > >
> > > > > New this week: 0 CVEs
> > > > >
> > > > > Removed this week: 2 CVEs
> > > > > CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
> > > > > CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
> > > >
> > > > I'm not sure I believe these numbers as tar CVEs which showed up for dunfell and
> > > > master don't show up here. Why? :/
> > >
> > >
> > > Don't know! Will investigate tomorrow.
> >
> > I re-ran the hardknott report this morning and it now includes the
> > missing tar cve's (as well as the libsolv, vim, and inetutils cve's we
> > saw in master/dunfell)
> >
> > No idea why these weren't in yesterday's report since they were
> > obviously in the upstream database and appeared in the master and
> > dunfell runs (and hardknott runs last)
> >
> > I've seen this kind of thing once or twice in the past and have never
> > been able to figure out what is going on since it is so intermittent.
>
> I'm not sure how we pull the database but is it possible that there are multiple
> upstream servers of that data and we pull from different instances which may not
> have all updated to the same data? Would there be any way to investigate/prove
> that?

Taking a quick look at the code in cve-update-db-native.bb I see that
database updates can fail with a warning message printed.  So it could
well be that the update failed for some reason, printed the warning,
and then used the old database for the scan. That would explain what
we are seeing.

Perhaps someone who knows the code better can comment (Ross? I see
you've mucked about in this section of the code!)

Unfortunately I didn't enable cron logging on the machine that does
the reports, but I will enable that now so that I can examine the cron
output if this happens in the future.

> I'm a little worried about the inconsistencies. I'm guessing your builds don't
> share a DL_DIR so they'd fetch different CVE databases?

Correct -- I use a separate DL_DIR for each branch.

Steve

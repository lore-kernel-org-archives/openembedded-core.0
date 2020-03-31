Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.4390.1585683939847724821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 12:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BVIhjMu/;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id h131so23064463iof.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pN+0IiKZYxpId2jg58RKuIEx5m6cOeDmPYBnRIwHUCA=;
        b=BVIhjMu/19AkjzgC7gkTyqzFF0MgISyIW9ReEB471C40xWrVoNErpCi+YGWQX5GpYE
         E2QvvahWNYIru5UKCycMm/y0DQHotq+CxuP3QljemfVqgCiOkvvlcwjoC6j7wYtzjtTN
         lQ0a8Xqdg8Qx4UyF8GBQVi1MJNqEi2UT8C/PowlE7GWS4Vxrp4gbepTFGlWhGgLSxjJY
         EKNnDXUMqi2EXOb20lE88UrVRXCC1D82LOOrGHtLlGfcovJG8yKb+ERlGR3oS02exHut
         LhERA2VxKMyjMMVqDCRCNL3qoqxTETwttt1zQBwfE8KoBr223wn3SZ7hf+BtgxosUKlk
         3tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pN+0IiKZYxpId2jg58RKuIEx5m6cOeDmPYBnRIwHUCA=;
        b=G2AG7L3rZIm2r5EpaysmoAhTsdoA9hgpqI/1c5u4NZjHfWGaLOop221RdL48dZmBwx
         s6pP51cDbe7HiCh8LvRoA3gNEZhYJkqYB2FRCIKZ1D3UP7EJh8Nc4TTgUmuTFFJ+KHjx
         Wb1fyjRZmLkIUjz0sQka1n+Rbk3tlr93t94kynFJh0+c705c0aY5m0BqojRLgQfDhFQG
         v2HsG2bW07Ht7B5BjkVqo6vi18uqNk/KglUza5XM7FE7X+gA5ABzBVNPNvQ0Pb579cTj
         neeN17sj80jH/nNs7F5vogF6Gasb3uJmvvo3SWO78oTyAFjj7zQHGnxQe/iXTfTmRutS
         nryw==
X-Gm-Message-State: ANhLgQ0YMpdGdkF+LfjQxci3e1+RY+sYcLX4aMksMpn0qtOgpTam1d8j
	AV2z3B1L88nEkcrOxRVDxWG1vDzLa9xzGd13P0E=
X-Google-Smtp-Source: ADFU+vsImLmo6bWYiL5+EHkDvSHePI/cCqVe/pupO5HQeXTBLZbqxa7xORgAd/j8tETJAMyLI9SCjw3spdIn6W5LpDg=
X-Received: by 2002:a02:1485:: with SMTP id 127mr17246039jag.122.1585683939178;
 Tue, 31 Mar 2020 12:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200327172520.62888-1-alex.kiernan@gmail.com>
 <20200327172520.62888-7-alex.kiernan@gmail.com> <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
 <160163452C4DFA3B.16021@lists.openembedded.org>
In-Reply-To: <160163452C4DFA3B.16021@lists.openembedded.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Tue, 31 Mar 2020 20:45:27 +0100
Message-ID: <CAO5Uq5TbsVpR9czdELSDZ3cKG+Ck6weGpXqqqgSoDefZ2+XAqA@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH v3 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 1:28 PM Alex Kiernan via
Lists.Openembedded.Org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> Hi Otavio
>
> On Sat, Mar 28, 2020 at 5:17 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > Hello Alex,
> >
> > On Fri, Mar 27, 2020 at 2:25 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > Add sysvinit PACKAGECONFIG which disables all sysvinit handling in
> > > systemd if it isn't present.
> > >
> > > Consolidate sysvinit handling so that when it's disabled we exclude all
> > > sysvinit features.
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >
> > This address the comments from Adrian and I'd like to mention that
> > /run/lock is not being created if sysvinit is removed from
> > PACKAGECONFIG.
> >
> > This patch is good to go as is, if possible Alex, take a look at the
> > /run/lock creation issue without sysvinit support.
> >
>
> Just got around to looking at this and I'm confused... you should have
> /usr/lib/tmpfiles.d/legacy.conf (which systemd delivers) which
> supplies that at runtime?
>

I'm looking at the wrong build... if you remove sysvinit, systemd
drops legacy.conf. What are you seeing that expects /run/lock?


-- 
Alex Kiernan

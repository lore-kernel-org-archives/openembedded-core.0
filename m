Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.9268.1599058373817875141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aECydNDk;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id h126so3145536ybg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+8iPRRijlIYEHB1bhf7rNHKp/nJzJ8yxpVR8e2fHP4=;
        b=aECydNDkS8G9hAkGH9WnHXAyEyRTUkgVR3WlQOjKYGPKt06Pnp0p69DK78KZBzXt3M
         koUn7k7HZf9RG6jMzlURH1s88jUgNfOJU1YHv46PVI/y0QGCGSkMfQdK+YcKIP6s3y2F
         x57AZREYGirBqpwGk//v08/B7U2f1ye64O2Rl2lxeRTXXA4sAF6hbBBip0r/LJvO20ak
         65Tind/aweNOaUJltyzaY8fZCQtkElj8y56fUbsXmN8AGanAPaP88FGkR24DNNzdvTAz
         1P2J0TDsWlHfwFrZPxQoXM4pUTOWbLRFdwuibODGI8P2RbwaqyOS96BmpO7HA5MkrcEB
         i80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+8iPRRijlIYEHB1bhf7rNHKp/nJzJ8yxpVR8e2fHP4=;
        b=baPKIyeSsnxYnlsjZPRrxpz1ZhQHn9zvYznvpSEiP0slV0BUimJ1yOZwvIQzTiEPkn
         vK8etkIonV6TEFRa7m1th3W/3fVV5oGULDWd3qwps5PHunfe1aW66HgK5jflDgXX78ew
         9vMCOOm4X51JobLGHi/CJcxrwtQejDiaTmfQJKN0d40Hie/jv1zDAArJdw9wU3fxFRNr
         +u3GkpbVqMR9BeTyULo1nGvVKBVM9pSmMReK1mWatnh8rq+fUv9MxD37KxFpusYziWo5
         QjrTTlqAh6BZoOgol5clQqumAHY2GKSYWCH0UmSh8XZ3eAwXb63HPE3Qh8tHdYFtLcGg
         J5Ng==
X-Gm-Message-State: AOAM5306V3yF4V44nC0aiQkrrPkVDFZwxI3xVVseV+ZcvKLyCvyOcDwu
	UmhMgbiMfV1oEEVg7B01LkLpuX3rUZ9iu0XWxwo=
X-Google-Smtp-Source: ABdhPJxjIsX6QxP2WBodgNb9Z47ljdaVLwLJQR/kqutHNdPbQdOLpUrDZEEsGhOZ9dLQoyq5BO2ehZbP4dnmDU8jwjg=
X-Received: by 2002:a25:4149:: with SMTP id o70mr10132903yba.290.1599058373022;
 Wed, 02 Sep 2020 07:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598810890.git.steve@sakoman.com> <19d9787f362e8ee4460964768ca9b5f093bd4f0f.camel@linuxfoundation.org>
 <CAOSpxdZ97Z3FwgE2G6Sd3gxbpnSBpi6U2Je_XNV7BfNJUg9Xwg@mail.gmail.com> <CACMJ4GbJSsU5hWnphDammJmirJk9+0DYyhYnyU43B7XMMt7gWg@mail.gmail.com>
In-Reply-To: <CACMJ4GbJSsU5hWnphDammJmirJk9+0DYyhYnyU43B7XMMt7gWg@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 2 Sep 2020 04:52:42 -1000
Message-ID: <CAGDS+nkOA2vKTSDoKv_aQx=bUXnMxODkRC7ESwMYGTALSnXz4Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/25] Patch review
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 1, 2020 at 5:28 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Tue, Sep 1, 2020 at 7:06 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Tue, Sep 1, 2020 at 1:07 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi Steve,
> > >
> > > On Sun, 2020-08-30 at 08:15 -1000, Steve Sakoman wrote:
> > > > Please review this next set of patches for dunfell and have comments
> > > > back by end of day Tuesday.
> > >
> > > A few of these (e.g. devtool, RPROVIDES, kernel fragments) are what I'd
> > > consider slightly riskier patches which only really just made master.
> > > I'm not sure if we want to give a little extra time for some of those
> > > in master before we backport?
> >
> > Certainly, I'll drop those patches from the pull request and let them
> > bake for another week.
>
> Steve: since you're looking at pulling in kernel fragment patches to
> dunfell, please could you add this patch to your next round:

Seems safe enough.  I'll add it to the patches I am testing this week
and if all goes well it will be included in the batch I send out for
review next week.

Steve


> commit af687c9137a3e8efe48afa6fd12866cf656ae913
> cml1: Move find_cfgs() helper to cml1.bbclass
>
> https://lists.openembedded.org/g/openembedded-core/message/140493
>
> It's needed in dunfell of oe-core to fix compatibility with
> post-dunfell meta-virtualization, where the Xen recipe now inherits
> cml1.bbclass to support config fragments. Without this patch applied,
> parsing of meta-virtualization fails since find_cfgs is missing; with
> it applied, the current master branch of meta-virtualization is
> compatible with dunfell of oe-core, which enables use of newer Xen
> versions with the stable dunfell core -- enabling this combination is
> useful and would be appreciated.
>
> thanks,
>
> Christopher
>
> >
> > Steve
> >
> 

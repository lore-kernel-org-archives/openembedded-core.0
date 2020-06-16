Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.354.1592337665334382551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 13:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dNMAftuf;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id x6so22022598wrm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 13:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LXduGlY7bM+cCbJHhu3V+wOaYZBAnBa7nu90UnQe4xE=;
        b=dNMAftufJGwr3pF8DE7LsshT455iMSG60ObbQOFosDZ0nys2UERWd2bqlvTK/UJ+yS
         kGpfZJ0QMl/VSLCM0MWmrcRKlrcj7okD+hz0AP2T8kY7sYkB4+3lVPZMIxqhKG03SpVM
         uMo3TG2pfCwbz6luk3hVWc4d0PIn7ntz8mkQZzUgQkpOx2lWigamI/G6GRGgUoVHynrx
         r5QEetGniv5081hIbCWwMq60CJCrLdNkUEwJh/4jH0nvLucXh664aiJT27SXfNLi4e5T
         ERSADK4cjWNkbLvQ72MTN0S0T1ZQo91zXU+kzTA0lmS2E9pZSJKeSwe27Fjr4jf/4eSm
         08Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LXduGlY7bM+cCbJHhu3V+wOaYZBAnBa7nu90UnQe4xE=;
        b=eZyUCPfZkGzlf3Pi1/UD/oIF/l8uXr79FnlgXDcKAee16gXm7FBR88/rcVyeqfqGfK
         L4ouTgGA4jvfsBh1yqGHK8a/a4k+MhwX6ss5BS+zco2GdwS1rqr0pYtXurD1ktXWWF8L
         8YHvHRvx5cdsBW7WMXzacB+p1u9Q7CrTY0SOPIBYZa6sPOPnCmJcUEmgMCaPbzBiHkxe
         OgG5m0hzKXb+4pulq6FQ3KDoNhFrAz4r2Cy044mFSnn2M4PN9Dpf8BL7SIB7tQ/uNP2s
         eBbu/QDsPXtNyEjb+peSPu24In5JGk/O9b4h63YMnYjlGZZH84oHHu9QDRPuPQRRQupH
         ABVw==
X-Gm-Message-State: AOAM532NMQdG+b6WW+fmSelM9AFlxGKpHn+K16tfkl6pVXd1F89OobnX
	LhUl7zB2eO12atJNU2Rz592WQQTV2pFtnNxQgTo=
X-Google-Smtp-Source: ABdhPJym6lokAsF0q7Y0rWnuFyXEzwOr/Q86IEa9HFlJKLeypVMdzOR+pQwShnJbGBu2Am/x+cXs1MDF371Wg5FK1gw=
X-Received: by 2002:adf:9e03:: with SMTP id u3mr4757228wre.413.1592337663735;
 Tue, 16 Jun 2020 13:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592249381.git.steve@sakoman.com> <8f71ed4ff9743433abc16f84a4c21ad506d18bd9.1592249381.git.steve@sakoman.com>
 <20200616195044.GI14969@localhost>
In-Reply-To: <20200616195044.GI14969@localhost>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 16 Jun 2020 10:00:50 -1000
Message-ID: <CAGDS+n=1KJ-3WYLCCYZ0q5WHUOTT=iHF4dUuX40W18Cj_GLu9A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 12/21] ca-certificates: upgrade 20190110 -> 20200601
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 16, 2020 at 9:50 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Please drop this patch:
> https://bugs.debian.org/962596

Thanks for catching this.  Will drop from the pull request.

Steve

> Adrian
> 

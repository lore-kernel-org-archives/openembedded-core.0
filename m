Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4513.1610643351009922488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eS3XHwXC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id o10so318747wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZKFDgUQuqAZO8vChGsDTfsZVUZd1/YPWN3lB38O92g=;
        b=eS3XHwXCSVpYuo7j/6MSUQRQI0TPp7etcCVpBz16IJjC6h2v9w2EN+yBo6ycaJhDvg
         QkQF+GEmuYj5O7OYlImPU3ySgFdEisPg5LiY3Cc+3T0Fzt+4MAT9p8kr8C9/+k+XY47y
         7VLWdv675aow+n7e+Xk/W3KzsaA2nTonyflgGO7RiuPNheRQE1zyMw26A5Ub2y6Uq3eC
         +b0Gmpu1oD7gQ81K8hryXf46eWuzS2lhees1AYhdZQ4IY/oI8WHMsd2D7nbWroYvpIbK
         x/zPj95kmSrsTcUrMJAvy5/NOD9R1KYktBXM8g/hCPeXA71O+CN8Gx4jeEnfiC6MiX0T
         ebQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZKFDgUQuqAZO8vChGsDTfsZVUZd1/YPWN3lB38O92g=;
        b=VxSf6Aoc9mK9fxAwbFgf6rBHDKOE5JaJsSwqZqFpZfHy0jbbWTLaxGfBhSd3Xj2mbY
         mteMuQaOJOicTKrGN6KbttlxboBNeEZlP/eZOJbhZqwQ5zfTAfFrmYOSqLhUYlTRtIJg
         8HlOM3Yz0Ftb7VU8I5e2AyYjuJDKIvGUKrXtoUs21tnrCky3ID6/UOT0PyFUfRwikkd0
         7OJWIgeZ8dS+maEs9ETXDHgOuBbX/VVMavIUJO+Qh5suPqytXjwSTkmS2Xs+eX2koE3j
         ibWLrsZXond9n6zGw9myckobYaxX62heUex0YDAR9BfTlKMkhrDswNyWn12Wwx+9bnF7
         YxfA==
X-Gm-Message-State: AOAM531D7dg8vC/bIPbuee8spZDMpA8rTKDG7n87JX+wcyZNBbuxUVQc
	a6GuZPj9BcJkh2o0r5AKGQwuOH3JEmv4wG4UrPo=
X-Google-Smtp-Source: ABdhPJz6G+HVj9A4+drBx4c/vhlC2+XGIy6Trvfy/0UCz6LuT+RYcu9o3iG44lU9Lv4ri4jvsraFDdAC9sqKHcPM3iU=
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr4888485wmk.31.1610643349526;
 Thu, 14 Jan 2021 08:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20210114161153.17719-1-JPEWhacker@gmail.com> <267dc42c-ac1f-8955-b67a-4f8a8867adee@gmail.com>
 <20210114165247.hge4fupuwayzk2hv@qschulz>
In-Reply-To: <20210114165247.hge4fupuwayzk2hv@qschulz>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 14 Jan 2021 10:55:38 -0600
Message-ID: <CAJdd5GZ4Enkhx6HQMaHwtbdgjKEq=CMWcLy1TSheBcumhc6GnQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] fetch2: git: Append the password to the username on git URI reassembling
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Dominik Schmidt <ds@technokrat.ch>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 14, 2021 at 10:52 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Joshua,
>
> On Thu, Jan 14, 2021 at 10:14:57AM -0600, Joshua Watt wrote:
> > Argh, sorry. This is not what we want.... I was supposed to make a different
> > change and forgot :(
> >
> > On 1/14/21 10:11 AM, Joshua Watt wrote:
> > > From: Dominik Schmidt <ds@technokrat.ch>
> > >
> > > This allows the users to specify SRC_URIs of the form
> > > git://user:password@host.tld/path/to/repo.git
> > >
> > > which allows pulling in private repositories.
> > >
> > > [YOCTO #14065]
> > >
>
> Don't forget Dominik's SoB too!

Ya.... I noticed he didn't provide one on his patch after I sent it...
anyway it doesn't matter because we aren't taking this patch and it
should be ignored

>
> Quentin
>
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

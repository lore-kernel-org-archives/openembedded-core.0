Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.553.1591715304608865033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 08:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qbehuTB+;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id s18so23157879ioe.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=lXM3F9VR2pKHbrYbSyPNRTM/iyx49kfhCcxiH/8j54Y=;
        b=qbehuTB+NN4HUyjUvk34c6xe0BPx9anybpFBnDkhhAJZiFmLwiCwQ7VVe3gDUbs5+k
         H8zZWBkl1Q9OL1xA4o7gZJjcTYSPLaihSnzmvoZvAxx2tw/rSpHxSJF1igVUCZZl0Owt
         kw1Htt3CqH9VCVqm4yEeTgx3veQlbgqje9x9wArPohhRey0gpnb+YinbvzsKMSzK+F5I
         0z4SxKjZPEiKgt6TseWHmYQRw/pGRjwd4heTIZmD0wnrANyNnJJjRAKOA2JV++TiehJb
         rkP5qmlBEeR8QP6qwcX6Pecwc+6Hazq929heUlaH2J2uRqBuPbJqkhXCvJ0CByIcKVVo
         vfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=lXM3F9VR2pKHbrYbSyPNRTM/iyx49kfhCcxiH/8j54Y=;
        b=QVCU8FfAL0olsaPP91O2Bxn+mmSCvQtkqpc0Yi3QkQM9BfPRDh13gJI5jKUqCsUtR5
         n9dp7WD/MbkHvf+Z8/YRSz1ClE0TrL6cu+D10GeqgQBd7QBZqpOtv2bR3a3fuA6XuHf5
         ynJFuXtVmpzhCeNf1djk4NPUSjOOWY+R2eomJx6BhUP1m1/PwZneMDnD5F0VvHmTUjqN
         qaQrccStQwdkwS2HnHGHWp+GAZBQn9GE+ciTjZeVW/RyY28DqqGw8ryUD2/6zywL+PVk
         /BYOUO1dyiqCbLUP6LUXbqsOaZbtGRbIdPS/FVD7eBRn81GCB8XMbTKG2Ho3SfRcsSMh
         yQ/g==
X-Gm-Message-State: AOAM531J4/tnsKz8N3efRjuiIeAVyZQo9WBffkcGZyqMk2s2qnJUKN4w
	i3VlmrSukWNdKYLx9KvUIu+ZljrBssrl84GPtXYwEJCL
X-Google-Smtp-Source: ABdhPJwNJvBaHqko6eiERyhlXreGkL+bF/OPH6EjAv39IBkIUBhIZ8zHr3iXyqyx2OSaBtJYkOHyatTA5G8BN/kr+qY=
X-Received: by 2002:a5d:914d:: with SMTP id y13mr27527814ioq.48.1591715303998;
 Tue, 09 Jun 2020 08:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
 <20191219221748.27079-2-alex.kiernan@gmail.com> <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
 <161110ADA6F0224D.21901@lists.openembedded.org>
In-Reply-To: <161110ADA6F0224D.21901@lists.openembedded.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Tue, 9 Jun 2020 16:08:12 +0100
Message-ID: <CAO5Uq5Q1VwSVeVA7gRkjKda1upvD1iAi=Zgj5e1GGFXEHtntrg@mail.gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 21, 2020 at 3:14 PM Alex Kiernan via
lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> Hi Ross
>
> On Thu, Jan 2, 2020 at 11:20 PM Ross Burton <ross.burton@intel.com> wrote:
> >
> > On 19/12/2019 22:17, Alex Kiernan wrote:
> > > Enable rootfs_check_host_user_contaminated by default
> >
> > Useful check!
> >
> > WARNING: Paths in the rootfs are owned by the same user or group as the
> > user running bitbake. See the logfile for the specific paths.
> >
> > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/.uuid
> >
> > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid
> >
> > (patch incoming)
> >
>
> Did you manage to get a patch for this out? I've had a couple of goes
> at reproducing it and failed, but I suspect I'm not including the
> right things. It would be good to get this check enabled early in the
> release cycle, if we can?
>

Ping?

--
Alex Kiernan

Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.1176.1593209846188863573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 15:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dlPEdXjg;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id e22so8048865edq.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8cOhCIFboVDZ6pE3Nuy9te+wVFJI4G+mIdjYOef+/ks=;
        b=dlPEdXjgj/ms3rO/MLB6NL2seEoV78fl0hMHsbvnd704Inh+1aJOFBBGVTmlgCtQ6o
         wvTAZfCeU1mUndqbk9SyZDXQyCFP31Z+lsbDLGC5op7qWAYeIvOuJK3YRRn94PseCbWm
         Gm+snTUbp4gRQG24sNu2m42HHg5ZHxgS30x+H+bhIeeclrYhn1HMLBsq69HwJ+8zoc+8
         6lhe0H8VYGVkj3lFdRPqQ1t7aGzsqQh8RU110Mfs/WsuogMUTxl6fHEqWx4fLhnE1106
         VOkIm6FD2zZg5OUjhaWXtOAv70k0wm0u3cX+JriRBY4RKgns2x6CXlvIU/S7vTjmC5X3
         3kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8cOhCIFboVDZ6pE3Nuy9te+wVFJI4G+mIdjYOef+/ks=;
        b=kYMMCS/ulLGIQTwrmtY/s6rVcwOPhio9d4LObXPnN/o8S/TBFS/5i5WG5A0AXzlTMn
         bHEzM7uAWCSW81gjtbTivtOj6qjm2MqYm8+5fe7KEDY31kjk5P+iwd6FSUAQhzPDK9xf
         UngjlRvkCwyacz2X2zg8NFG5GA5tjpQGQapNzNgRgM5R/yiCGYz2SnNPFCJy5plAcabY
         fPzqPAq1oCs4lbbIFt9t8L4flrVz0nJhjxWNub0/nTBTZ1PdSeY0Du+Xn7FZfIuqMX7v
         uuN7Vw6Xf6Twk3guV6X7J6AtIp4xmA9VDHMMQBnn1UygvkMIphSckUOXyP3LbHeMKIfO
         +tQw==
X-Gm-Message-State: AOAM533DrcK22nnJvxEO52+Svy6B/guXBB1OP1yqg4jvUF/bgoyFDeCa
	l4tF0TnHEPAaRGL+RPC9fOQW4LmwXxO6Sv7EFR9edA==
X-Google-Smtp-Source: ABdhPJw1YUxkeL4uGgePavjmaixkDvbi0Q8s2AfoUqVQot4QXL7PMBC1E7GBzsnCw3H2/6iBKPuN/uFxn42XAFiTt8I=
X-Received: by 2002:a50:bb48:: with SMTP id y66mr3157059ede.147.1593209844402;
 Fri, 26 Jun 2020 15:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
 <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
 <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com>
 <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com>
 <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
 <CAAnfSTtZOqXVz0==hgM0h3WP9igfuE1u2BU48iJWsh=rsFOwPQ@mail.gmail.com>
 <CAOSpxdZP-aN-rWgNDpW+7nS4g-1_j5wQJ_dgxACgNo6EvonF=Q@mail.gmail.com>
 <CANNYZj_ahPyrDVL0qoPakECCVQicdMNWm_Y3wi8oB4GJuSZwoA@mail.gmail.com>
 <161C2CF3A1F68DB5.16301@lists.openembedded.org> <CAOSpxdaNLcvvL=1g5n3Sod2HoD=Umg_sSHSiNizVL4ogyf1+ew@mail.gmail.com>
 <CANNYZj927by5Pic50F-fe0nJk+XLwH=q65NisFObeXczSCg9rQ@mail.gmail.com>
 <CAGDS+nmpht35NGDn3937ZrqQ4NsPfYnqo-eYiSba25yVd7HXiQ@mail.gmail.com> <f7f696a4bc9a039bd24668162d4ffd641dd85289.camel@linuxfoundation.org>
In-Reply-To: <f7f696a4bc9a039bd24668162d4ffd641dd85289.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 26 Jun 2020 12:17:12 -1000
Message-ID: <CAOSpxdbnUCVsCsvcEL1-8cw4+u7UOCjk7gm2TQvPfW916OsfkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 26, 2020 at 12:05 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-06-26 at 11:46 -1000, Steve Sakoman wrote:
> > On Fri, Jun 26, 2020 at 10:26 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > > Technically, there are. I am not qualified to comment on how
> > > destabilizing they could be:
> > > http://site.icu-project.org/download/67
> > >
> > > Perhaps it is possible to bisect the code to identify the fix that
> > > can be cherry picked:
> > > https://github.com/unicode-org/icu/releases/tag/release-67-1
> >
> > Agreed, too many changes to take for LTS.
> >
> > I think I'm just going to live with the occasional autobuilder
> > failure.  This seems like way more work that it is worth :-)
>
> I think its simpler. Look at the original implementation patch:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=72a56c2bd02d32382260d4f4fd14ab4c8d4cb8f4
>
> specifically this bit:
>
>             file://fix-install-manx.patch \
> -           file://0001-Fix-big-endian-build.patch \
> +           file://0001-Fix-big-endian-build.patch;apply=no \
>             file://0001-icu-Added-armeb-support.patch \
>
> I think the apply=no needs to be toggled depending on the PACKAGECONFIG?

I'll give this a try on Monday.  Thanks for pointing that out!

Steve

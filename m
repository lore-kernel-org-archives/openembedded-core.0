Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.2880.1603132051475898189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 11:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=p1fuZ57N;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id z5so434640ejw.7
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M70jHJSKVSZTyXhVlcyb5JSZYjEn0KzgISS3ml0y1eU=;
        b=p1fuZ57NgQVf7+W/xfO8oK00N5dXx2sH/urJLn/ALQInJc6YIRVGk6S2yH2VmyIj24
         xrQhd0qmqzEPHbAj2yKaIjZNn1lDRVvvjKGo8MDiLRXbNZIQ+0K+Fln7/lgJwWMHJDbj
         xiKdzs5QHwuZVIFkl+aPKPt0uHSFQeI8nR+ZDM7wQwDwQ8Abm5MhoaUGffARuHzzMxLp
         sPGx4gfoshT8c6/ZRqwPnAIcYoGWAHP3HdNfff/IPwFsIgtPuied2eY/SwdGoYlg7Rp3
         YA5xfpo4v2sw36Ktu8/DJHGOfSsAqAsXQih3UxmMx+ueVb0M+PNO4hLtChNwqJYde1Gf
         35yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M70jHJSKVSZTyXhVlcyb5JSZYjEn0KzgISS3ml0y1eU=;
        b=Xlr03viSP+7CbH5xFxiuMsGNceslHb1MENlAYv3l6K7W3lChuxCMBKOc72HnBsuKHe
         wiFClcMf0F9P5TYil/YAbo056rK9tz/lX/OqHZs/JrM73IcfQvp18GTKuYMjQEme0O0I
         DVCUijOcrBCgDry7Ilw1rADd+luPHA2P3BRRCozR4tBP/7C71WNq4Ji9o+gl3gX8P2V/
         TmQx4AH+tNaacVSVc/MqwJgspaBLxQmelsIhD60PVY7B7HLW4mn4oieOcvpO/ZZMBGrJ
         51HOjykh3+7q6/pqR0fkVpJR/PCUpfDRgR3SnlgiSM3d3xpzIMGV/Xj5KLcNC8IpacZv
         owrQ==
X-Gm-Message-State: AOAM533O6A8+CqGGLTZEtQN/rLWlAdGUurGB9es9jbxsgzqWwnEIY2Vy
	n2Am51FoFgVqQyUHvEAgHTXxy1M7Z0YB/MNTHBjvaQ==
X-Google-Smtp-Source: ABdhPJysQZcc7HogAK+4zfrRQwGLSX6URhaDvfHstt4oJWelbjEcjGFuhX73xC4BnJWVh78RlBoVfTudplE/G1oCC7Y=
X-Received: by 2002:a17:906:280a:: with SMTP id r10mr1211277ejc.58.1603132049629;
 Mon, 19 Oct 2020 11:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201018100004.8512E9601C6@nuc.router0800d9.com>
 <27f0873f9e4c50789588953a20d530c9965e1a35.camel@linuxfoundation.org> <CAOSpxdYO3dB_9PtC7pvmqNTa8ZUbGQU6YOfEFezM0mtCBjC7AQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYO3dB_9PtC7pvmqNTa8ZUbGQU6YOfEFezM0mtCBjC7AQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 19 Oct 2020 08:27:18 -1000
Message-ID: <CAOSpxdaCefKtbfRkhXf96KukVaT-hVv6JT_RNqaXVQr4eDQm1A@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 18 Oct 2020 12:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

ON Sun, Oct 18, 2020 at 8:12 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Sun, Oct 18, 2020 at 7:56 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2020-10-18 at 00:00 -1000, Steve Sakoman wrote:
> > > Branch: master
> > >
> > > New this week:
> > > CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> > > CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> > > CVE-2020-26116: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26116 *
> > > CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
> > >
> > > Removed this week:
> > > CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
> > > CVE-2019-20907: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20907 *
> > > CVE-2020-14346: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14346 *
> > > CVE-2020-14361: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14361 *
> > > CVE-2020-14362: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14362 *
> > > CVE-2020-14363: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14363 *
> > > CVE-2020-16092: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16092 *
> >
> > I'm a little puzzled about how dunfell improved significantly but
> > master didn't?
>
> I am too!  The master CVE check runs first, so I guess it is possible
> that the database updated between runs.  But that seems unlikely.
>
> I'll review the scripts, it seems more likely I have a bug.

I didn't see any obvious bugs, so I re-ran the report for master and
this time all of the qemu database changes I submitted were recognized
and we had a big decrease in master CVE count too.

So perhaps the database did actually update between the master and dunfell runs.

Another possibility -- I was using a common sstate for master and
dunfell.  Doesn't seem likely to cause this issue, but since we use
separate sstate on the autobuilder I'll do the same for the CVE
report.

Steve

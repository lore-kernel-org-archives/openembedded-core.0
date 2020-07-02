Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.5498.1593693460961324443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 05:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PDSr+0xj;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id x83so15974780oif.10
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 05:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wOzTJ2GnhOaOXe+zPSTg/gDnu1Wa8SCjYLMFNk+swrs=;
        b=PDSr+0xj9j1jdQpxwyLMm1B8/pFZL0gBymaMhDgtebmFZ6DwecVYAeDIaZc3fQOYxj
         wP+n1X3824GaH/Eet3YIjcvrtE5q2bPi/09RUaObYd08QwVDp1uqbLX/X7g7SPiFiPkd
         m1XTUsfv/Jjsznmc1jqD/+RbDGIAK/EH2lQ8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wOzTJ2GnhOaOXe+zPSTg/gDnu1Wa8SCjYLMFNk+swrs=;
        b=UHLJAk1jP6LhXDfOAgXrGJhSYOtVA61aNZXH/MqlVKM2BqJNSLVxZQRa423mje5cTE
         epXoUUat8s3l1KfU4hxOqtfJBA+I+gaGs5w7gtF2NENeX7k+ZOzTFOxdZvq+7fmqaD7q
         /Sn3Wr9muFGIqmLMpqIQR5SKGrt8KfiBKycz/Ib6gaxz4LwqRAbXDM/XyR+L84p4rfE6
         5svLqu7At0sDFpgakDD4SPiupC/JZro5dCDHdMXrFhao45AhcwauHse/VagLRy7TI8r2
         C535no2BxF/fDMStmyrSQ569adPZUkao2+CzSbpSfeGToSoJ6h0FTJ326uyjBpfY+l/S
         9FVQ==
X-Gm-Message-State: AOAM531a5TAxT4jawoIfs14XKu9mk05nMmdLVCAvvhWMcKwf2guiCIoy
	AX+BvaVjKroE5DSF0HgL8bLriGR5pBlFmFF/uxfKDw==
X-Google-Smtp-Source: ABdhPJxhsFWGeC9LwqdzUCCBI+/Pgz9M4uoZWPIz2ysddtmyEgwaw/1ZYlL0Y9j04yRKFiQVI7dsvNsaUNSBt8ogk5U=
X-Received: by 2002:aca:3043:: with SMTP id w64mr5167045oiw.27.1593693460247;
 Thu, 02 Jul 2020 05:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200701221129.99170-1-joe.slater@windriver.com> <d82f3dfbb84c30f39b46826cfb2240c786b8ad87.camel@linuxfoundation.org>
In-Reply-To: <d82f3dfbb84c30f39b46826cfb2240c786b8ad87.camel@linuxfoundation.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 2 Jul 2020 13:37:29 +0100
Message-ID: <CAM9ZRVv10T8z8L+7LXi48+dCPk9Z+C5pJFG2ho0JeCoE+yCVDw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] systemd-conf: unpack to $S
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Jul 2020 at 13:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-07-01 at 15:11 -0700, Joe Slater wrote:
> > systemd-conf copies some files to the target but they
> > are in WORKDIR and not visible to the archiver.  Unpack
> > them to S.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  .../systemd/systemd-conf_245.6.bb             | 20 +++++++++------
> > ----
> >  1 file changed, 10 insertions(+), 10 deletions(-)
>
> Whilst these patches are kind of ok but I can't help feeling the
> archiver really needs fixing...

Agreed.

Joe, how are you configuring the archiver here?

Also, are you not providing your layers along with the copies of the
upstream source code? If you're providing the layers then you
shouldn't need to worry about files like these being picked up by the
archiver.

Thanks,

-- 
Paul Barker
Konsulko Group

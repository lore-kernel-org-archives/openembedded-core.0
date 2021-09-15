Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.8029.1631715005136330854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 07:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Hk6AEcCS;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.45, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f45.google.com with SMTP id 140so2333085wma.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOsrnwRQEXUJIzJ6G+L+6GIEcxE1dX1HRu12uqz4CiM=;
        b=Hk6AEcCSikKiRy9tPf3qvROxihC4REbPb3xLeJYkxu5Fpl5lUq0fofrBbcbiafYOox
         snBGKFRTcG/eZfEFKY8nbWmizgIsiDug58HH1adtIjyRLhITK2/FFdxbwp+jBHN4cy08
         dNO4Ry04xRFcLYfpi1qFieOGVBLldsD//9/TWjW5dOteUwv3NLU9bcDBlRdMtteiYcFM
         vLV4KUqLv1OAgobxBcpNs/5slyoyjSKIFlZJBclSwNPjEfuuN8oqmtrb26dYxTVPQDm1
         JcvoCKS4N0k66bcGTeevwsym0k2M4Z92yz0rn0UH4Q6/EGWJMZG+LmM/A2mzZhBksKiS
         RglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOsrnwRQEXUJIzJ6G+L+6GIEcxE1dX1HRu12uqz4CiM=;
        b=OzvPXUqljvcBWiUIM5acV7pn1seMtPGCC9cBPzP1Fvbh6ka73P85DlluX8pSTDWmqQ
         O5quxhnX7OC6AFPNUhxaKG0VDlvrGgiqEK0r1Jkm3ewuMD9uGvqEcydSrDVfOVZ8J6f0
         cVdxhV1mp0QweFxNiQn6tSTCXNSYR7B46svRBVVQZo2JwOkHcRM0Kf9UcJEoYcY8DAaf
         pYsgVMkbrzf6sP4qJixT7LGBn6crW/YzOhY5n2rfLPLnRIROeq6BhY89r9WHyNEpccnQ
         BLrWJrRqbq0B7SUcSd+WNg/Le5i02iGsRNWh28CObd5TiXDcwh5jEuxSbZ2rH3PBGJgA
         KD+A==
X-Gm-Message-State: AOAM5325YAi/m4mKG1hq7/Gt7b6GWfONEzcs0a33kf2sQWXzUhPbNIRA
	oTGdrd09V5F3qNruV3xAV2NohidmDYAT89DQTlQ21A==
X-Google-Smtp-Source: ABdhPJyxn98C24HVFzEsN46jGjAIg5absfgPfriTgYp0WhfErWN0sGHxHxmQrC8oTOrZOeTSGX7ec7GKPJqIKl+JZwQ=
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr22487wmi.118.1631715003369;
 Wed, 15 Sep 2021 07:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210912150121.8237296032A@nuc.router0800d9.com>
 <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org>
 <16A41EB09718E439.21276@lists.openembedded.org> <CAOSpxda2cHN3d0WDMLszq8QJD0-Qa37e0NU57Xu21EXR672oFg@mail.gmail.com>
 <5a6a112b92ba3921ba31bc648f37f9cff2687f49.camel@linuxfoundation.org>
 <CAOSpxdbH9mEv0U8b641i7r+h1jpt--kNOT+PqKk3-e=FK4kw9Q@mail.gmail.com> <CAAnfSTvQ-=BVCWh2wH9V7eWrXbctsOEBubb2xhAP_A86QurtJA@mail.gmail.com>
In-Reply-To: <CAAnfSTvQ-=BVCWh2wH9V7eWrXbctsOEBubb2xhAP_A86QurtJA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 15 Sep 2021 04:09:51 -1000
Message-ID: <CAOSpxdau3=1XyHq2umgNwBffNdYR9wqmrJ=R0jLZBs6Z1won6A@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
To: Ross Burton <ross@burtonini.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 15, 2021 at 1:08 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Mon, 13 Sept 2021 at 18:26, Steve Sakoman <steve@sakoman.com> wrote:
>
> > Taking a quick look at the code in cve-update-db-native.bb I see that
> > database updates can fail with a warning message printed.  So it could
> > well be that the update failed for some reason, printed the warning,
> > and then used the old database for the scan. That would explain what
> > we are seeing.
> >
> > Perhaps someone who knows the code better can comment (Ross? I see
> > you've mucked about in this section of the code!)
> >
> > Unfortunately I didn't enable cron logging on the machine that does
> > the reports, but I will enable that now so that I can examine the cron
> > output if this happens in the future.
>
> That's indeed a good hypothesis, and having the log to hand would be
> useful.  If you don't delete the tmpdir after the event then the
> console logs will be available in there still.

You are my hero Ross :-)  I should have thought to look in tmpdir,
harknott was the last to run so the log was still there:

DEBUG: Executing python function do_fetch
DEBUG: Updating 2002
WARNING: Failed to fetch CVE data (Service Unavailable)
DEBUG: Python function do_fetch finished

So my hypothesis was indeed correct.

> A hunch is that if you have all three jobs running at once, they might
> be rejecting some of your connections.  Maybe stagger the runs by ten
> minutes?

 I stagger them by 30 minutes, so we should be good unless they are
really picky!

Steve

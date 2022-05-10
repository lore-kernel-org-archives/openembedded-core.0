Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3073C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 17:47:33 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.425.1652204845107182038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 10:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NkjpjyZa;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id k27so20911395edk.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0D1qtCDZsYcUDukxkWoRoPLSkcJwJxUHpv912KptbTM=;
        b=NkjpjyZawv84E5EOQKbriBCObTCKx4t4dSPkQxhImZKZuHSTOhTMTn/BHDBEDDCrlw
         wcjO7cWfbFgNzCcdoeBjjduTo426osTVPDqw6NEcrVZUf/bGgnPEJTlghtO5Xts7MeDl
         8/TZKcId5A9FmCksZk3SmmV6pMEUfnOpZFAZI1rvkBPrHLd5zeUHK3fFP0SqqetFoGOR
         v1skcGg7L7klkFPXLqn7atnYeD0o10eK86PSFoM8o1Uwin4PyTJpY9ms8IkoVvRTHGua
         NEqZ8EXwa3n2h/PQLV+ntqMHhN2ylWVW/ZdDylARAXL36UGhzfiyOktsWfaFj0AoJ63D
         OIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0D1qtCDZsYcUDukxkWoRoPLSkcJwJxUHpv912KptbTM=;
        b=nHpRoi+1C+N9bkNDPme4NPL9fthyPcJX+milA6hQoJEd8N6hVXIKw3AvzMPlM7C1hi
         HcrQFZcimspHJYZoowlNLxZ+Fyp0cV8yG0GnYk8ZU0VOtmXGxi6w0e9AqcaDCSDK9U30
         1JByr/wXBgsAHjRp9W07aqJjdB/hgcLhFe2DqEOoUT68DVAouJEin3TLnWP3WF0tcasx
         ZJY+p7hKcTckkFqWv1KJYEy2sYq1MVkWiWs5R+mKF8gMwk0Upsv3eJey+UjtV8V/2hJo
         uILpXflH//HBVk+LMrn7xDfHmjTVffacpifd2IR70VJZVeCphHpHxWpr6kteiV5CsGzU
         lBYg==
X-Gm-Message-State: AOAM532VvpRjxprrGZUzLpciLfdLuhk6R6MMJVh5ooFT5cTZwiU/fsOY
	S+BheE0iw3mWQUR6SWS/WQUMYWjF3WBQd5zGTPQDHg==
X-Google-Smtp-Source: 
 ABdhPJxVZ2pmkWpR1Fn6O5+5E8WO4XM2xemylyNT+Fmlkq8LB8MRnT6R4MxYU2hpB525pkpNAAtvVdvHss50E/Uj7V8=
X-Received: by 2002:a05:6402:f06:b0:427:c415:887 with SMTP id
 i6-20020a0564020f0600b00427c4150887mr24786380eda.8.1652204843344; Tue, 10 May
 2022 10:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220509062438.12448-1-badganchipv@gmail.com>
 <21438.1652195156118038664@lists.openembedded.org>
 <16EDCA98FD0B8E23.32235@lists.openembedded.org>
In-Reply-To: <16EDCA98FD0B8E23.32235@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 10 May 2022 07:47:11 -1000
Message-ID: 
 <CAOSpxdb4Xb9W4aaESeFWh5R3KkDicR+Lhe0MKPOmYFui=O21pA@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] libinput: Add fix for
 CVE-2022-1215
To: steve@sakoman.com
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 17:47:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165465

On Tue, May 10, 2022 at 6:16 AM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Tue, May 10, 2022 at 5:07 AM Ranjitsinh Rathod
> <ranjitsinhrathod1991@gmail.com> wrote:
>
> > It seems something is wrong with this patch and also in the patching to=
ol within Yocto as well.
> >
> > When I apply this patch, it is getting applied cleanly, without any war=
nings and/or patch-fuzz, which means the source code should reflect as per =
the patch.
> > But when I go to the source code on the path "build/tmp/work/<architect=
ure>/libinput/1.15.2-r0/libinput-1.15.2" and see the file "src/evdev.c", it=
 seems below two Hunk's are not getting reflected.
>
> Yikes!  This is quite concerning.
>
> I can confirm that these two hunks are not being applied.  I also
> checked the hunks before and after these two and those seem to be
> applied correctly.
>
> Looking at your CVE patch, it does seem that there is an extra newline
> before these two hunks.  I tried removing the newline, but the 2 hunks
> are still not applied.

My mistake above -- removing the extra newline in your patch does fix
the issue. I will correct your patch by removing the extra newline, no
need to resubmit.

Whether this is something that patching tools should catch is another matte=
r!

Steve


> I then tried deliberately malforming the first of the hunks to see if
> it was just being ignored for some reason.  However, as expected the
> patch process failed at the malformed hunk, so this part of the patch
> is definitely being parsed.
>
> Will keep looking into this, but would appreciate help from any
> experts in the patching process!
>
> Steve
>
> >
> > @@ -2469,7 +2478,7 @@ evdev_device_get_output(struct evdev_device *devi=
ce)
> >  const char *
> >  evdev_device_get_sysname(struct evdev_device *device)
> >  {
> > - return udev_device_get_sysname(device->udev_device);
> > + return device->sysname;
> >  }
> >
> >  const char *
> > @@ -3066,6 +3075,8 @@ evdev_device_destroy(struct evdev_device *device)
> >   if (device->base.group)
> >   libinput_device_group_unref(device->base.group);
> >
> > + free(device->log_prefix_name);
> > + free(device->sysname);
> >   free(device->output_name);
> >   filter_destroy(device->pointer.filter);
> >   libinput_timer_destroy(&device->scroll.timer);
> >
> > Can you please check this from your end too? If this is the case, there=
 is a serious issue where patching is failing silently which needs attentio=
n.
> >
> > As I have seen the patch in the testing branch "http://cgit.openembedde=
d.org/openembedded-core-contrib/commit/?h=3Dstable/dunfell-nut&id=3D6a31bfa=
ee4d715f31e69cea1eed05484d9d7a999" I considered to post this email as it se=
ems you also did not get any warnings/error during the patching and even co=
mpilation.
> >
> > Thanks,
> > Ranjitsinh Rathod
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165464): https://lists.openembedded.org/g/openembedde=
d-core/message/165464
> Mute This Topic: https://lists.openembedded.org/mt/90983830/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


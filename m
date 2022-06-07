Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9ECC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 19:26:46 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.1759.1654630004103302682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 12:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cBX6ZnbD;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v25so24283178eda.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KzWh+DnISZaGGpkjXVlGjO98Tpz3Y4Cfwn1hkgtTbWE=;
        b=cBX6ZnbDdng3CROD22k2sPKDcBG63v2ontuhf2KI9sWaSZs8c6ZrS/9R+NFgs1KqYk
         5BXqQd+a78geN14v0NLH7oQqohrJ4vqxtz341ETsWZvAe2kxwtbhF9U34o1Fpid/1zQ2
         eJp5h6L+UpOPS3rKUQqXFRqd4hJDkNrrBPn8zQz9vo3gPXEOLvhqZYqu7SbqS72cdATc
         dKQwNaLnVJtCp1uz8x958OeyJu9Fzwq2cYlM+r0wbAKzbdvuWdPPRakoUJxzXcEjV2qi
         vwdNxlPc7hLhATzkKiqday0BnxQdkmZ1sLvrsvLiirlHEU3TLd+9N91vbSzMjW8hWoYG
         GTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KzWh+DnISZaGGpkjXVlGjO98Tpz3Y4Cfwn1hkgtTbWE=;
        b=T2eYtfNTlK+HibZ6LCu+wrA/+x7ttqo34C8QypiKDeKm1HbKkeNcVRpGKJo/CSFL6b
         VJkc2lHXsS/vTrJ+F+hiE2XPjJ1AoUmfXrsud9UqX6eznqVFOKdVbfbf5QbN/46AcFhG
         865ayVZKVd+R57A/9VX3MugfpwsF4nCuW4ZZgKeVI4VFBpiMwN5SvIYWzUArRaqkMCs2
         7hI+5fa6yGMrk9xg1saMJqchAE7TfZLxil2Y/P7W7Du7GYEKDe5KjE9LTWly3pdi8hmS
         7jrBlFc8OeoDLWMbpk/CLCh5dt5lVn2c27kF+UI1AVi/MJ1qOWRSm/wJ+RYgTHHpWJ7h
         6GJA==
X-Gm-Message-State: AOAM531sPfiJ8mfKLWWCbJ2UW0KTGuXkebeMkklt2A9UIEcNf49pMgGp
	HRIz/giGiEcEG+FM9atUYkiYqmR5IfYrv4vXfaU=
X-Google-Smtp-Source: 
 ABdhPJzY6U3t9BG8fWT4Qv/pKC2kCR5/ubUCYLeoMi7Rjul+G4+DDCm+jl2l3EZc/uBfLcm5WLLY3KB8Msvv7rI2FX4=
X-Received: by 2002:a50:fc0d:0:b0:42d:c1ae:28bc with SMTP id
 i13-20020a50fc0d000000b0042dc1ae28bcmr35899181edr.24.1654630002330; Tue, 07
 Jun 2022 12:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpoDyNDPz2GqYmqtvJZX3L71h8Gnn9Ofsse3jKVfhaWrbw@mail.gmail.com>
 <CAOSpxdak7SL7ry7SyGmYYXFORc9pf+P4EaSxyaWbZkcmGad6Lg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdak7SL7ry7SyGmYYXFORc9pf+P4EaSxyaWbZkcmGad6Lg@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 7 Jun 2022 22:26:31 +0300
Message-ID: 
 <CALT56yPwYNnmYLORaZoZ0CZAyQTjhVW6BabqcChf104vRYrBZA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 0/2] linux-firmware: pull two patches
 from master
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 19:26:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166684

=D0=B2=D1=82, 7 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 19:59, Steve Sakoma=
n <steve@sakoman.com>:
>
> On Sun, Jun 5, 2022 at 8:47 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wr=
ote:
> >
> > On Mon, 30 May 2022 at 20:02, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > This pull request cherry picks two commits from master branch to spli=
t
> > > several packages that are usable on Qualcomm platforms. Allow using t=
hem
> > > directly rather than installing huge linux-firmware package.
> > >
> > > Dmitry Baryshkov (2):
> > >   linux-firmware: package new Qualcomm firmware
> > >   linux-firmware: split ath3k firmware
> > >
> > >  .../linux-firmware/linux-firmware_20220509.bb | 19 ++++++++++++++++-=
--
> > >  1 file changed, 16 insertions(+), 3 deletions(-)
> >
> > Gracious ping.
>
> Fear not, the patches are in the set currently being tested!
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dstable/kirkstone-nut

Ack, thanks a lot!

--=20
With best wishes
Dmitry


Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.11405.1619543354147927914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 10:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=A92KOCOn;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.176, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f176.google.com with SMTP id v20so5835748qkv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ooEpEwCZsA23m5QF3RdvHPVa+RYtbxKa7lMW7gKl/jg=;
        b=A92KOCOn9QgCWt4DDjZLHvuYRf5+j5LFrIrxB4QwV7hKFzpzK53/J7T38hdvANLcwJ
         Rhx0GS1QicOc3pfBfy8Umaic17+6bva7fCA7Z7EupBSBS7jbOGoOLCIdEeLMASiVA9Bn
         P6kOeHsJrE/XxzLgWshvDi4gJzLcesdzxRvGUOhWM2HeS8n6rXpq0X/THMZDJdjdQPkp
         BSmm17sxtr1/ctyyS5XU+CuSArSdgcU4L3hkGazVpHQ0y11oRAXfpSO2kq5JpMRvekPs
         m+kfeh6k6J9FSm05Y6J0+i3NNzNlHqrnW+Oi26xS3zL34E4UMWi7GE9aW1pWknNuIBxn
         TBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ooEpEwCZsA23m5QF3RdvHPVa+RYtbxKa7lMW7gKl/jg=;
        b=SVKB1RnVJ4RsKrnIgLpLTWwq/bzzHgTosP/xbg9UQ4Wtb8c2gcAQ5HCsmVoJA0zLmN
         Z/pFk3MNnMnXTDSyvGNs3tkvXcHt3oWXHVN1ILLe2k7G62MDVdCdnSfiJy+NG88/wO7a
         4/UWNSZLN5g6JgnmTLDLIPS+zZh7XN1MZC+SB3FEcfo7Y77/LtAC0GeIzKVhggatAsOY
         ZQJCAcLNBNVl2aYc4onmJZmTEBd31RwjXzfb8fIsK6nCKr/AeMZ0BbQ1ZrJKAEs24dVW
         xKiZmwSu4xfAg+3SdvkIQbgy8lYneMk4TD5OvrImOZEA6M3u1RAky6CQ2I6CMQhf1cWM
         Hk+g==
X-Gm-Message-State: AOAM530Nv6WBQYR52OeuoItFy37e/M8GA0/0MPDxXLp3Xv//jDVuFqwi
	CN1LY44cD8hZjs1bOlR8tBCEyIgOKIJFcq0m
X-Google-Smtp-Source: ABdhPJy7CzgTJz1I5VIexGs5BU5FMUf136sqWyWh8IUcEDBI8XYuNpRWBOVqQozhej9C7K7GqWnH/Q==
X-Received: by 2002:ae9:e886:: with SMTP id a128mr24168797qkg.20.1619543352908;
        Tue, 27 Apr 2021 10:09:12 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id l22sm311190qtp.23.2021.04.27.10.09.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 10:09:12 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id i12so29159258qke.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 10:09:12 -0700 (PDT)
X-Received: by 2002:a37:7646:: with SMTP id r67mr23707786qkc.78.1619543352200;
 Tue, 27 Apr 2021 10:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-6-alex.kanavin@gmail.com> <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
In-Reply-To: <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
Date: Tue, 27 Apr 2021 14:09:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqCevEQXOLn4xW0vQkrUOP3xgnQBLiRoG3d9rz3tY6znQ@mail.gmail.com>
Message-ID: <CAP9ODKqCevEQXOLn4xW0vQkrUOP3xgnQBLiRoG3d9rz3tY6znQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] default-distrovars.inc: add wayland/opengl to default distro features
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>, Kevin Hao <kexin.hao@windriver.com>, 
	Yocto discussion list <yocto@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 27 de abr. de 2021 =C3=A0s 13:10, Randy MacLeod
<randy.macleod@windriver.com> escreveu:
>
> Cross-posting to yocto since this is of general interest.
>
> On 2021-04-23 2:02 p.m., Alexander Kanavin wrote:
> > This puts them on equal terms with x11 distro feature
> > (which I think is due).
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   meta/conf/distro/include/default-distrovars.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/con=
f/distro/include/default-distrovars.inc
> > index 9fcc10f83a..384ee7fc98 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?=3D "0"
> >   LOCALE_UTF8_IS_DEFAULT ?=3D "1"
> >   LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D "0"
> >
> > -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext2 =
ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g=
 nfc x11 vfat"
> > +DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext2 =
ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g=
 nfc x11 vfat wayland opengl"
> >   DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
> >   IMAGE_FEATURES ?=3D ""
> >
> >
>
> We (Wind River) already drop the x11 DF from some of our distros and
> we'd likely do the same for wayland and opengl so while this seems
> like the wrong change for headless systems it is one we could deal with.

Adding wayland seems Ok but forcing the opengl support doesn't seems a
good default. Especially because we just also ensure software
rendering is also wrong (slow or not).

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

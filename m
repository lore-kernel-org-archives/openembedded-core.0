Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081E6C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:13:45 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.4774.1663834415633148983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMcjSt1h;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id p5so9964611ljc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=MClCEFLaD1B0ppjvoE4v/rdYRVi0hcL8rPwJMT3sty8=;
        b=VMcjSt1hQQ9HJ+8Knww4mwWMClSJs623063AzWMAVafK5UteOW6YPZqJkxvG99Ekc5
         tSqecdEdT82Y67eByD+/rPSk1SKmqE4VH3lI2UuhYolD5idAv5DNByt4VdHk2xfcv/lz
         i+TaZderh/9AWllIb2f8hWZExzvEB7yy3GqCutx+2dOkhBweMbhB2FO+pmJUd8hwVn6R
         2ianGYclfOBEv29nOAVCuprM3jkTMjYEAtalqEG9P092izUfifTDvO9ZT4/qOw5Kf4Pi
         YBVrF+xJm7GC9XPjdnivpBNfw02j6vPDbrRdsd22+aFprnx7a17WDC9enWfRaP4r1sXX
         zU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MClCEFLaD1B0ppjvoE4v/rdYRVi0hcL8rPwJMT3sty8=;
        b=5HYGg2umnIQpY6hQFDRqsN1CN9CHmY1b00sN60dyi3kTwCe29BexzkDxcse9cODDA9
         ormeRgdeXX6vectkCzkkBqZyY+HMz9T5JT0a+4tie6SL+rcZC7IEiPnldP/BbWFn8mE+
         lKlTEd1fuXu/WGVRWMh7ibmlQbGFC3eZcfd5f5KVbLqeffcSUEmAYQJMYt2lfCb4NvaU
         IFqEn2kCOB0aArWZdqfPihD+7DY+0vaOvn+TKzR9uGKyRo4evvwcXL9B4uWM5T1rJjk0
         eAjCzU/DN+YXhZsGnP53leGuOQl4RxqsCgXFCk+II9KKjr/EAbNdy+H8wzI5cSry8m3f
         IcbQ==
X-Gm-Message-State: ACrzQf3vAJYk0/0Uql5ZxumqGnVC7V5A183miLaqRc1wERE3s2U3Jki7
	6VQ7LkJo1epL0nuhexyyY+oz7yWM6s+ChbBHDWM=
X-Google-Smtp-Source: 
 AMsMyM7VDnXLI8eSB1WUta9MMaZH2WM4l3Wbwg21ghFqU8V3hzzsTL+YcAVMNzaPkPVYq2B/SNPT2cF2sb1O4vaXzr4=
X-Received: by 2002:a05:651c:104e:b0:26b:fceb:a526 with SMTP id
 x14-20020a05651c104e00b0026bfceba526mr611693ljm.109.1663834413582; Thu, 22
 Sep 2022 01:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220921075113.187693-1-f_l_k@t-online.de>
 <f24ebe6e876ed33b07719f339aadd5ef43c28c45.camel@linuxfoundation.org>
 <P7LKIR.3NI8GTU36ICA3@t-online.de>
In-Reply-To: <P7LKIR.3NI8GTU36ICA3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Sep 2022 10:13:23 +0200
Message-ID: 
 <CANNYZj8VRY3a05mzNpN7gWXPMePSYUrJmrA3J2tXCU_NYjOU=g@mail.gmail.com>
Subject: Re: [oe-core][PATCH] virglrenderer: upgrade 0.9.1 -> 0.10.3
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 08:13:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170964

I once again have to stress that 'devtool upgrade' rebases the patches
automatically. Please do use it, it works for the vast majority of
oe-core items.

Alex

On Wed, 21 Sept 2022 at 19:14, Markus Volk <f_l_k@t-online.de> wrote:
>
> I started with a clean master branch and encountered the patch fuzz warni=
ng on the first build. But to verify that the driver was working, I wanted =
to run my wayland image with 'runqemu'. That required a whole bunch of extr=
a files to be changed, and I ended up forgetting to fix the patch. Sorry
>
> But I can confirm that I was able to run the image with the runqemu scrip=
t. The driver should work.
>
> Am Mi, 21. Sep 2022 um 14:38:02 +0100 schrieb Richard Purdie <richard.pur=
die@linuxfoundation.org>:
>
> On Wed, 2022-09-21 at 09:51 +0200, Markus Volk wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../virglrenderer/virg=
lrenderer_0.10.3.bb | 33 +++++++++++++++++++ .../virglrenderer/virglrendere=
r_0.9.1.bb | 25 -------------- 2 files changed, 33 insertions(+), 25 deleti=
ons(-) create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer=
_0.10.3.bb delete mode 100644 meta/recipes-graphics/virglrenderer/virglrend=
erer_0.9.1.bb
>
> The patches weren't refreshed leading to fuzz warnings: https://autobuild=
er.yoctoproject.org/typhoon/#/builders/64/builds/5884/steps/11/logs/warning=
s https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5931/st=
eps/11/logs/warnings and many many more like it in that build. How was this=
 tested? :/ Cheers, Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170955): https://lists.openembedded.org/g/openembedde=
d-core/message/170955
> Mute This Topic: https://lists.openembedded.org/mt/93821898/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96FBECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 21:14:46 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.17703.1661894077987407670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AAXCm4I1;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id s15so7545492ljp.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=gMt8ZEfN6+ZCd664WPvYnUrD59HLJppAp/Zz3VCAweM=;
        b=AAXCm4I1K2qtfV5sGUvZ2S4I9FihcUEbY0c4lchibBhz5VunSfXSiL/0j0d25TJ1Pn
         OTh2Z21+QOmjbveKQRgMha43v4dBwY1PHTUdNcEFeGD+WQh3g1/KGry+pDlfBo7TPn22
         ejf+wOeaikGIwPV//zfA6I/9hRtOc1YC/aDxXsHWnkc4Nj0VspqFFhdX4xmgke4wFecU
         iVIdRtu3ZdssKl8hA6rvjuys+oCVWNJr1dnrCnFY+g0pDBl1473isnwVjTOBVhB/WU9V
         6SOrb/HSjP7Nx4dROoe6uNmUzJvv4OvGlq7AFKWxkbvRGuqU+kL/GpSzCUuvbGo8kN3O
         NTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=gMt8ZEfN6+ZCd664WPvYnUrD59HLJppAp/Zz3VCAweM=;
        b=T6AHZjwSaFztQTB8jE/IoSWNHKjg1Y0NNxqIqDArXhLJbpZVsS7gbqdc5in9prKn3l
         Shqxop8r/If4iSpap5e7eJZGor+xwmXmpHkQt1gx54eauUQJ4HKOhC7wYf0859CuQ7f8
         7QCXMTpr2/MZcTyZzuZc3XVfTwi0H6GRUMah5TQoYRcSbwrD3NlUI9ncvw4ORTwI/ptx
         /g3eYb/iM8ofqeKBJWuzMrYRxtsNw1Jz4MV3X3OqpqiWvE81wDc90YNSgwSvsRZ0MS1y
         MoSUVEWx0bAxQQizgyI5HO5jb3INxzafXDMfHc7eWERBGxuYxnxSGAIoqYitEtiBer5O
         L07A==
X-Gm-Message-State: ACgBeo1g7rcYDMIl4w718V/vKFt0SzSwcqh17nSAmB4/HTdUz/MTbFzJ
	gsmnHqUUPGWxT7IGiJh1yGPsMzi7Spkb/Cflluc=
X-Google-Smtp-Source: 
 AA6agR4gycSizLyRHHjearMTTBoslDPNRijfed5c/h6S/mcNMCo9vloPCH0/nCBHwFXR+k37sN7x+vYt1o2V+QrNUOk=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr7043565lja.68.1661894076213; Tue, 30 Aug
 2022 14:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <003301d8bc7f$c2feb310$48fc1930$@gmail.com>
 <CANNYZj-NE9s+b9Yny9+5q6MFGY3fT5RpWX76Sx6p-yFRGty1tw@mail.gmail.com>
 <1792b01731d2412c53740470ba7521b68c6a3973.camel@linuxfoundation.org>
In-Reply-To: 
 <1792b01731d2412c53740470ba7521b68c6a3973.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Aug 2022 23:14:23 +0200
Message-ID: 
 <CANNYZj-O4JyKXopORV+y4NA-9Cb9i6NKFrZbMRD3EA4-bXLPiA@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 30 August 2022 (WW35)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Stephen Jolley <sjolley.yp.pm@gmail.com>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 21:14:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170091

On Tue, 30 Aug 2022 at 22:40, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Thanks! We haven't quite found the exact trigger to reproduce it but it
> seems related to rebuilds somehow.

Yes, this usually happens when new patches from master get pulled in
and perl is rebuilding on top of a previous build. It then cleans its
own directory in a way that results in timestamps aligning just so,
that make gets lost in its own rules, and enters an infinite loop.
I've seen this locally several times, and have the 'wrong' tree saved,
but I also don't know how to trigger the arrival at the wrong tree
reliably.

I suspect this patch may be the solution:
https://github.com/arsv/perl-cross/commit/6a47e4fe17aca2ebb4760d8282dbad4422d4e655

Alex


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F61C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:58:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.15588.1634673538000827179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DQksZJ0z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso5128960wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gbaGFwQVoVO0tkIjqSkK+N1qoMTJxvEPccS/xom4ZjQ=;
        b=DQksZJ0zM4zZ9bBrBqTFj0L70APwmAu58Sz4l+yexLorxrdgo+hXm7qvp8Co8BuTGi
         28guN6iqZqpq0Ol5tOL5I5NrmqQzdCvKKRmfFR1D2Vff9uqs3btLSbt0rCbzqSiC8CoG
         El4IT8QB7MtJ12ETXKykmiYtP5/xLlohgEoWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gbaGFwQVoVO0tkIjqSkK+N1qoMTJxvEPccS/xom4ZjQ=;
        b=udjvWljmL0IRSvZdzRZ9FBlp5QOnM8jMlTqQC7ayjHPUxM3Eu5RZIj0QM8cEmD4ANo
         Y4ea91N4ktVLeAujSNLj2XxG4WLYAjQFIGdpixAmLvKBxjVDWWhvRO7WOZg+lDbjgola
         3XLp/3RXxVhzjJzp07tr7ejmiAedWZ3pynAb/MtTygP6FoygIw6xF2IQpSVDNtn/kQR6
         cxOILIw02MyfILmZ78XhirdR3Qr97HclvBUvjiPeFnF9mc+pB/r5q3e+73EIcJTsDbJ3
         Ij+gjrQjZj5HADFG/BdwwZ7tJwv5CWxKL4U8HDg0BCE/0vknfZ+Hs+kDL+e+pYQfhd8w
         sB5A==
X-Gm-Message-State: AOAM531BuORpTK+CAghi6eT+NeK9HAcFeCPoq64T7acpFD9dH7qJN8E1
	FXk8DAtVhO4mUfEMmvWEDqJR8g==
X-Google-Smtp-Source: 
 ABdhPJyWk357LWYWs3vYNayHhThZUpcNiTCr719se98uk4iX7SiKHN4czxT/RTYyARJBNUkKyc6s+g==
X-Received: by 2002:adf:f309:: with SMTP id i9mr47162127wro.256.1634673536419;
        Tue, 19 Oct 2021 12:58:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6cb:20f5:1d7e:af42?
 ([2001:8b0:aba:5f3c:a6cb:20f5:1d7e:af42])
        by smtp.gmail.com with ESMTPSA id m15sm62406wmq.0.2021.10.19.12.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:58:56 -0700 (PDT)
Message-ID: 
 <5903b2623057b6861cef3b84562acecddb0adb14.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/65] rustfmt: remove
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>, Randy MacLeod
 <randy.macleod@windriver.com>
Date: Tue, 19 Oct 2021 20:58:55 +0100
In-Reply-To: 
 <CANNYZj9Q=9hXRziLC6c3_EVRViDfFcTe3-27ifOOnpz94P7_-w@mail.gmail.com>
References: <20211019153419.3319802-1-alex@linutronix.de>
	 <20211019153419.3319802-2-alex@linutronix.de>
	 <6c4d94b7-22e4-bf35-4fc1-bf9c680262e6@gmail.com>
	 <CANNYZj8QiFX59VyR72TPZQPE2TLoy9tscTByQbFVjT75T5OqXg@mail.gmail.com>
	 <CAMKF1srRnFs5Qe8+bxLEUq6h3hrR50w5-1Ru6NzTya88qeTNXg@mail.gmail.com>
	 <CANNYZj_kzzBM7v96_fkivVgA4ksNBpk00hsCHPmkq4am1EpGXA@mail.gmail.com>
	 <CAMKF1soyXWyzFd-FJTPopYt3Sds=4=A6=tVLz+fKrC59VgYKxg@mail.gmail.com>
	 <CANNYZj9Q=9hXRziLC6c3_EVRViDfFcTe3-27ifOOnpz94P7_-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:58:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157244

On Tue, 2021-10-19 at 20:37 +0200, Alexander Kanavin wrote:
> On Tue, 19 Oct 2021 at 20:31, Khem Raj <raj.khem@gmail.com> wrote:
> > It would be wise to hear people who use rust and develop applications
> > using rust, meta-rust is being used
> > to develop field deployed products. Again I urge you to think with a
> > little bit of wider scope.
> > 
> 
> 
> Look, it's just an example of a recipe generated with cargo-bitbake. Where is
> this
> cargo-bitbake in core, so we can test that it works as it should? Until it's
> available, 
> there's no point in keeping the recipe.

Rust is a story that is more at the start than at the finish and as such I think
it is too premature to be removing this just yet. Having a rust recipe in core
generated by cargo-bitbake does have some value in its own right. I'd hope over
time we find the tool becomming a first class citizen in core but that will
likely take time.

I am curious about Randy's views on this.

Cheers,

Richard



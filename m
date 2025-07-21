Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C9AC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:50:53 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.41319.1753105848837610381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BsgjqKuN;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: hiagofranco@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c27166ab3so3216232a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753105848; x=1753710648; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyguBsPOyC5Zu0kZ+BPgOGutiqNvzNrqH3A5v898THg=;
        b=BsgjqKuN72sU2Y/VigfYAes29Bf8AwUosBeVmrtuqQmG1cIc9535rUUB06Suj1hIgD
         nAZN5nsD+x+bhrr9O70VQ/jSoOJaoQxYKeuCNnjhan/EYsIVbpiFvO8/a+KpRLbGNBwk
         fXQ5DOYZN5ZSKN6LKR4aXkSwGwlAxw+MSx1QMAw1yTV+lWK3gPFfl5bGKLF3/mP0Cfh/
         niGgIHoFeMYCvGbRHuNuQ9SIKl9JLzWFCiiwmaBIMfIjlsNGvm8V6jhG23Ki7IRsindM
         ECPVp/tH81ycx+cJ2PV2JjPTe4QM/wukrF2/cZf1jVF2Eb0Vrmrs135+W6BU3GEdfj8K
         b9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105848; x=1753710648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyguBsPOyC5Zu0kZ+BPgOGutiqNvzNrqH3A5v898THg=;
        b=C7a8y/gLDKGXnoaf6RIunkKlMnkLzWS8859hbv2YkRdBos9yhk6v210XhPrFxIubmd
         l0Af0LpJAJRSaTPR78o6Hu5Sz4TYDDiwhn+1oHaqpxZya9r7HFQjoJouoGUyb6qIma1P
         yH2iwwZCfQ5LULn0rLWpcaxfA+uV58a0cMdoDvP8hWuhxNjoJVhcH1v7N0iYotnT2ton
         +vsS5PWUSXYp4Nd3RuyUgVWBPiEaGhEtVXkhmHktklRKTyEW+kzqHxtaxMQHRJpWZD/X
         vYinTfcSIGBwbUdyajKmaR0ioybTRQuuwuBE1aNgntdZf5s7jm4hDlDXhS4e7aTkpZkf
         qzWg==
X-Gm-Message-State: AOJu0YzWmC85jyAUnLW5dH8NTAoFJlSip76ux5z1KOyBqMRHuUr4WTtD
	nJmbb0D9GszFBXYHaErnLMoJ9xpP9eyg4Tx/+SJ9RhQ9VGFT4JiCJNbJM73HCQ==
X-Gm-Gg: ASbGncvjjOyDvBIo//Fyl+d3eiPxAEUfW+qDKvx0xEO4dBaCLiqfFGqO9nPvj4iLdKk
	kHALCNquxBkclEGXChnFrwnG4s6B+tcHnUtaaSUUL3ocJBHUxX56KOsAY1jFJSEGRuUgnkuhdGz
	MS1h3BSTHKScZ43B3S6n0swi5gJMko4SgDmsRuW2yepmMvt1tGrtQfoarb25D0MT9aKHpQCDWlx
	LEVNyg3xkcgQCIUN8ZPo0loa0rj+5IxK6P90nf+uzYUm9HID7NIzKnLrcMxjMa9i18adxP3VW5u
	DQRnMj+LEPnDsN36EhaN9JiAX1kLp9BcKlxpxaeHWQojrfevYgU7p3d6ygZPCOlKPFSHB9VhbXy
	b6rRI4SZO6VJxNL5xNfA=
X-Google-Smtp-Source: AGHT+IGSopHO5Kkxn9mSLRvZScfhcnentLqulLoiQcA3wLlbpW9bQ7q+q0Oa8rI9mNM2hvuSjkucew==
X-Received: by 2002:a05:6830:2d88:b0:73e:a1ed:7716 with SMTP id 46e09a7af769-73ea1ed7d78mr3530960a34.0.1753105848027;
        Mon, 21 Jul 2025 06:50:48 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83b0dc97sm2855940a34.38.2025.07.21.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:50:47 -0700 (PDT)
Date: Mon, 21 Jul 2025 10:50:43 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org,
	Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add libblkid and libfdisk
 PACKAGECONFIG options
Message-ID: <20250721135043.m3k6ontoyto7a7qo@hiagonb>
References: <20250717211621.7122-1-hiagofranco@gmail.com>
 <20250717211621.7122-3-hiagofranco@gmail.com>
 <38fccadf-0b86-4937-94bb-042ec0b6ae39@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38fccadf-0b86-4937-94bb-042ec0b6ae39@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220698

Hi Quentin,

On Mon, Jul 21, 2025 at 11:32:55AM +0200, Quentin Schulz wrote:
> Hi Hiago,
> 
> On 7/17/25 11:16 PM, Hiago De Franco via lists.openembedded.org wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > Introduce new PACKAGECONFIG options in systemd for both libblkid and
> > libfdisk [1][2].
> > 
> > Set blkid as enabled by default because the bootctl command depends
> > on it to be built. For example, images like core-image-sato-sdk rely on
> > bootctl and have specific tests for it.
> > 
> > Previously this worked implicitly because the upstream Meson option
> > defaulted to auto, which enabled the dependency if libblkid was present.
> > Now, without explicitly enabling it via PACKAGECONFIG, the feature would
> > be disabled, which triggers testimage errors.
> > 
> 
> This seems important enough to be its own commit without the new fdisk
> PACKAGECONFIG so that it can be backported to stable release(s) if needed? I
> believe this is the result of commit 43abc59a275e ("meson: Use feature
> options") present in v255 (presnet in oe-core up to scarthgap apparently)?

I agree this does make sense, yes. I can send a v3 to separate fdisk and
blkid so we can later backport this to scarthgap. I will make a test
first and then send the patch later, if everything goes well.

> 
> Cheers,
> Quentin

Best regards,
Hiago.


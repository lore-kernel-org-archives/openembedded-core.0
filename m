Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FD3C79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 08:15:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2297.1788855353096527360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 01:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mYPu9Qel;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so60666675e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788855351; x=1789460151; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=99zAZ+DAB6FTjUjJep9nNAyywQyNadOJc26wDEXI+Bs=;
        b=mYPu9QelPtGj5wPQDbOYtD5xGt0og6pvHhY34ZAPlM3nVS/So+MeuTUv+CtmXro7Ex
         Ekz+6DvhomdCrzMmhr14Or0ljtWDj6Yujb84i+lkjz97RYXgXDuwsymlEQUJ7QT9bv5J
         is2SShIJnStARaTaK+F5Rr0PeE/Dx8Bxfju/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855351; x=1789460151;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99zAZ+DAB6FTjUjJep9nNAyywQyNadOJc26wDEXI+Bs=;
        b=OUethIp2CJy2POyqj1imBR1LYc58jRu7nLKt6F8RPqEWW2ACKWZkQMj3GUF0xHH/kj
         irlKVawey4ySfX9MfQl5L5ey4iACtbMnk6MhSH/uhFzymbaY9yhzfS7jtikOC3NeAA5+
         l+RXM+cuED/QXM1SXkKPOj/f6NVDVZbBh78D/jssuTnQZT7wY9n7wdl8NLh8QxLnDVk5
         yAxPb0p2GwsGqYyQN6+lwZzrkIAcJdwF5Qd/GQD8Xc+W4N+H3yRdt5NRkgr013uSUYQS
         mWkzC17IGi1J7dgdRZaz87lTW7T8/SlIyhHC4HwLHCZJ18e/BxeoO6rulAA1wekliHcd
         759g==
X-Gm-Message-State: AFuF++lDMmn/uCdl09Jqa53pIS0EPSf+E1wJZHzNAzHM9H5fMmj1TJDY
	QO5q0etQRlS+RfVWTFRg4TNTIh931GN2741X1z5h1GHEI3yws8WkMDhP7ecfBO1nomA=
X-Gm-Gg: AYBFou36txYuniUlFyGBNQW1WsD7yjy0oZw/GUks80GffLh1HXEfGXz2vlh3B1pr3bC
	1mmpSwaCcTTkltBUBM4YEHRF6RvpjeL5eC4saLTrzisidR4p6YXG64rh2qNYHwyZ3WUsS9KcbE1
	RF5luHzRNa5/ygJCbIR9Ml1KxzdkM/yAAM6PCgqB86w2mLHuBz4i1zhxtV0Lsyx7Q6oWQjlnfbx
	XTfK7asNbi4c1arX9d7tLbfwXv+hiKGDJFudTeMR4rHD4A/m5oSFxb4zAMkXZcySjBtUFaTJ+1F
	gbrcbAR4+0/AFHLWWn2b+gzMriUiB7ScPaTLVQIAQqERno7qEooPS6txAmVLPipIRI3pKyu/UAJ
	J7gTGtGHi6x6hrOFTlP3mHGuCtFCzhl1OEHoQJ5SZM5xPnMSkgiz0RY4NBy8RBrLKoqORINhP9V
	ymb2ewN5hY51I/bY7T6qXUxrdVOTH7Yl5liX00+anNj1C7HIXG8w0d7pB99M6KkrAdVO6BQWs8/
	0D5iwkDV9dUH/YyjdUMnuymjNc/dMU63cN6UGBdixCBpGrt
X-Received: by 2002:a05:600c:6211:b0:49c:fa21:1c88 with SMTP id 5b1f17b1804b1-49cfa211d8cmr214319065e9.29.1788855351198;
        Tue, 08 Sep 2026 01:15:51 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm32655396f8f.36.2026.09.08.01.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:15:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 10:15:49 +0200
Message-Id: <DL9SAQQDYUWN.DHAPJINZ988O@smile.fr>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: -stable updates
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 08:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245336

On Tue Sep 8, 2026 at 3:17 AM CEST, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi all,
>
> Since we are working through 7.2 integration, I wanted to get these
> stable updates out while the older (6.18 and less) are still under
> test (those -stable updates will follow).
>
> I did sneak a 6.18-rt update in, but it was trivial and tested
> independently.
>
> (yes, the yocto-bsps update is in this series, even though it
> is for the yocto-bsp repo)
>
> Cheers,
>
> Bruce
>
>
> openembedded-core (4):
>   linux-yocto/7.2: menuconfig,mconf-cfg: Fix broken menuconfig
>   linux-yocto/7.2: rt: update to v7.2-rt5
>   linux-yocto/6.18: rt: update to v6.18.37-rt6
>   linux-yocto/7.2: update to v7.2.4
>
> meta-yocto (1):
>   yocto-bsps: update to v7.2.4
>
>  openembedded-core:
>  meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 20 ++++++++++------=
----
>  meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 24 ++++++++++++----=
--------
>  6 files changed, 32 insertions(+), 32 deletions(-)
>
>  meta-yocto:
>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hello,

Is there a chance that a fix for #16414 "AB-INT: testsdk:
kernel-module-hello-world build fail"[0] hides somewhere in this
upgrade?

[0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16414

Thanks!
--=20
Yoann Congal
Smile ECS



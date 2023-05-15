Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0D7C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:41:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.84625.1684143686507653926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 02:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=uZ5CdNhp;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so11409239e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 02:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684143684; x=1686735684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aScXUdMoN5/I1kvalGmLx0E0ESuqgYzl1lr5t65dPcI=;
        b=uZ5CdNhpzFBiMqrM6Iu9BTrQdGOBzz/HG0hDKa/QZAv+x1rHjrnF/LLEqL9/hBO78r
         AWa5gGwkH0WIYElXRbHpbzl05qsnsVl0716Bcj3nNFTjLwoDaBMJTXQQY0eSZx/5uHCX
         Ec5FGHwOA5vHNwvXUoLp6mcBgbGMnP7SdtT8MShmFM1Mt0gev89Cd/yWYcCwoxUhzLNx
         No3XzxVrV/i1R9HU+EITdQ/7P44OP+BUBPzUSO6wpik+jicIthPlzZnrEkREMYv/atkA
         ugBygFkeysRwUc6LYuhSeJ6bHwbv+/vfIvjaXY5M6835DmtqI3zeuOPYln+vZBT5Txkg
         UsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143684; x=1686735684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aScXUdMoN5/I1kvalGmLx0E0ESuqgYzl1lr5t65dPcI=;
        b=l+bJmDYxVAkD40HiEZdOCP1eLFb4ItS7K+SGGpDAveY7epCMnQTMV74nPdUpZGobVL
         bKt/SFcR1WBFb7140w463rTKCj6734ax19RN3w5ltc9AKCXJKfs53fJlZyexKKor9oyM
         BckHJL9stIgR/LIC0noFf0vqQq9hHp95g19kGdJcLXS9/xr7clfy0eg36kzPdRf7574/
         x4Eiz54+zO41e7oh/dcEWnxaWg2RaSUrpY3TIHHFkwoTUNrI/SlL4OoNGiXuDD/zPGLs
         TJcE/x8I26r/Cqn2JcWzYe6ZxUcqNbM2KQGeIEmYWUW4XuCKj7EnjH0lLx7yF8HA9Wfn
         3Nzw==
X-Gm-Message-State: AC+VfDx7dzq+WOo9/MQidJKb145zxCSs/Q2iaUEqCqCi4ao5B+T+DjOP
	RVpVUCu7MX/WP4C3Z5CuU0NqjA==
X-Google-Smtp-Source: ACHHUZ4UK6HlDk6uY5rgwphq3LeqTI32ypwvqRTREPthWL63HfvEi4YYrtkvUc37NFg8hrGsaBK6eA==
X-Received: by 2002:ac2:558d:0:b0:4f0:4b:5390 with SMTP id v13-20020ac2558d000000b004f0004b5390mr5783835lfg.12.1684143684506;
        Mon, 15 May 2023 02:41:24 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id r27-20020ac24d1b000000b004eee27b293bsm2533241lfi.298.2023.05.15.02.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 02:41:24 -0700 (PDT)
Date: Mon, 15 May 2023 12:41:22 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Steve Sakoman <steve@sakoman.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 14 May 2023 01:00:01 AM HST
Message-ID: <ZGH+Qr8GISlsag1E@nuoska>
References: <20230514112915.DBC579603D3@nuc.router0800d9.com>
 <12aa7d8d-4207-46d1-e74e-58fb9942a701@bootlin.com>
 <CANNYZj8aKLbU9ixmYKtzZxQk3iOFe-i4KcXMNjgy6Z6Ye1upgQ@mail.gmail.com>
 <FC9CDB93-ACF4-4DD0-AF42-2B6F65D12908@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FC9CDB93-ACF4-4DD0-AF42-2B6F65D12908@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 09:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181238

Hi,

On Mon, May 15, 2023 at 09:33:39AM +0000, Ross Burton wrote:
> On 15 May 2023, at 09:41, Alexander Kanavin via lists.yoctoproject.org <alex.kanavin=gmail.com@lists.yoctoproject.org> wrote:
> > nano please :) I tend to agree, there is no reason to carry
> > specifically vim as 'an editor for quick config file hacks on the
> > target’.
> 
> Nano is GPL 3, there’s an argument that our default editor should be as permissive as possible.  I’m not sure what a suitable alternative would be, though.

busybox vi? Good enough for most embedded and admin use cases.

Cheers,

-Mikko


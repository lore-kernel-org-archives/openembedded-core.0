Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25CAC83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 06:24:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.42831.1693808641598736294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Sep 2023 23:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t/PKWbQS;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bce552508fso15470061fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Sep 2023 23:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693808640; x=1694413440; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dCPHEFI6YfKzveZtvLSzQG8PJO1I3qAqGa0o9CCc7e4=;
        b=t/PKWbQSdXGmPtiLRsoJhfP6aQDZrE+WKjv0QwH5vQecFQkqjZrdCzstHhfP/g74ow
         57RD5hOT+oKIcrnSs3/sU9xkrDT32TMfQPZOZRQC85LYTu3s0Owet1PEpOrw11hVnPdk
         da35UyrKRbnAQZkV6LkV1yKVsafMvRcxK341YxwCOyunoVEG2ZTLGXQQeyJqS8PJ9KaW
         7BR+Yan/D4hIhWCEc84IBLrZadjV5E9EEfW3a2mp26WCkixU9DD6B8FA9PdOedCYFL4H
         ir5spI4lcLzNpohQyh8tmlErVZR6ZnARnT2/fT/L2r9QEZFCZ8U89o1yU8faVxxxd0ij
         sdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693808640; x=1694413440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCPHEFI6YfKzveZtvLSzQG8PJO1I3qAqGa0o9CCc7e4=;
        b=BRFWiHZlZDKt4tygHfo7i0IjjaV3TLL5PU3JY3Jolm0hDa0IQx1G8s9ijfGObT91T6
         D5XJob7mr/WDN0MX0Gg9zwSmRq37ISQHSmN2I12VBYPrPIAGf/TcXi2dHCe0jY1AgC6n
         tj/du/M7b7Jaw4w69XuOJPJMb3Z1D3qgWaRZ7fqIKxnNNQleaVPH5q/bYOEhqowTlZUE
         j41QpYWiqBq4M5qGB/GcIJYH0liyO1g3Z3BZHr+1wOS0uPkF/9s1a8Vx/kElNiNZoDLz
         jPtF17Zd1W0/y4fPUkaDQoIbvq0PyYzvDcfcLGyE2apZlfyfgpF13fpHsuvY55hIhWyj
         AARg==
X-Gm-Message-State: AOJu0Yxz+UeZa7ZP+75DmeIqunfi0LHgSzSzh8z3OH1CgZiJqU93RURh
	sop8xBJiaNwXoGzP9opwA7qxfg==
X-Google-Smtp-Source: AGHT+IG1epMaD0H2zFBbFT08OIJaI8z3KpJ5xOI9867vwrDtxrZpNycSwmS4rmzL1e84Mq0iHv1TFg==
X-Received: by 2002:a2e:8012:0:b0:2bd:1908:4432 with SMTP id j18-20020a2e8012000000b002bd19084432mr6251321ljg.3.1693808639691;
        Sun, 03 Sep 2023 23:23:59 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id y18-20020a2e9d52000000b002bcb9956a69sm1881257ljj.41.2023.09.03.23.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 23:23:58 -0700 (PDT)
Date: Mon, 4 Sep 2023 09:23:56 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Michelle Lin <michelle.linto91@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel
 Images
Message-ID: <ZPV3/NtaBqS0e+2s@nuoska>
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901233231.1109712-1-michelle.linto91@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 06:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187160

Hi,

On Fri, Sep 01, 2023 at 11:32:31PM +0000, Michelle Lin wrote:
> Currently, there is not a class to support the building of unified kernel
> images. Adding a uki.bbclass to support the creation of UKIs. This class calls
> the systemd Ukify tool, which will combine the kernel/initrd/stub components to
> build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the keys/cert
> files are to be specified in a separate configuration file, and the path to the
> file is passed to the Ukify tool. UKIs are supported by UEFI and can improve
> security through predicted TPM PCR states, and reduce the build burden due to
> its single PE binary format.

Thanks, I'm interesting in using this. Could you add a oeqa selftest for this
class too? Something which builds a UKI image and then does something to verify it
is what's expected, maybe full boot with e.g. qemu is too hard to do?

Cheers,

-Mikko


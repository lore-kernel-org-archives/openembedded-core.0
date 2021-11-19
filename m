Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8224AC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 09:26:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6590.1637313959609929462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 01:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=fM73fYWG;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id b12so16992172wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bpN9o+pNSJpuX9TXEixSMOcITpfLoYiCBeds/j19Vc=;
        b=fM73fYWGQ1Eq1sTzCYyoTxm5VfRf2WiuZ/SuAAoV+UP9YxKIKBDfqdSFqCRBXR9cYf
         0brVo69jPM3AzTh6IfZXtLw82bAxs5imRZRBdI/SF8P6YTy0G4i9XbaLCG5/LtKhK6+O
         /oq/OTselIXS2uiI7VQgcDItlooAm3ylPfroU+DgDgBW9TTO828xrrYPjk7yDsc2bbxy
         m0fR/dTVxN4akZzwUcuh6RA0nZykp5x/sv0/CCpgQGQ3N+0eIdq7OU3ZLwfGLdadGc8B
         tYKVimBdXnlO92Go3KqwZqUuhFvAJGrmDHRn6WIXdhZXzZVWkrrTHnZXSQrvJvix5/1Z
         4Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bpN9o+pNSJpuX9TXEixSMOcITpfLoYiCBeds/j19Vc=;
        b=7jqmJhvncCy4z+VbMLp8Kyc8KabT2Y2sgcH5ydSbjkcXccs9kAe0DHdyAJKADVcc9q
         0MjatVmRRAgsLjM2D0NGUDBIM/eVXAYRUIckhTSgGZdUfb+GEV1Be+RpG/MhbpMssEsD
         KmEW6zW8msX68aUKEER6PLOaLiDfupqbPzxz6trUU3baSLHb4QuZSRG/LQaO7GvmyHOV
         pFssQzGtuJu7pR0SydXqpNNYuQ4dBxsHBHMng7qQtvvO4FyClzNsP1XgMJheWEdQ6Y37
         lJjn86WREnXdE0erYaZgf54mF4FBlCVwL5ooFIpp6o5j0leV+04QW8eumWpVaSxCpip9
         LwsA==
X-Gm-Message-State: AOAM531i+vjNUISxCR45sl6+J+shZru9AsOXl1egUedQalQbtAZQK7SJ
	lcFJaxLpzaGIk/mPxOm+MbZhUcs0V4781YE8MiyOoA==
X-Google-Smtp-Source: 
 ABdhPJziGVLCbu+4U965/heHkd0Ht4LknYAbDCzG2e81VJHIPdUf1/C6U/7af3VgDXOWO89iXVryS16mBhWuhBHuIlc=
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr5743067wrz.211.1637313957815;
 Fri, 19 Nov 2021 01:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117172308.204731-1-ross.burton@arm.com>
 <7132D4BE-2C9C-41D2-8FFC-9322D46A66BD@0leil.net>
In-Reply-To: <7132D4BE-2C9C-41D2-8FFC-9322D46A66BD@0leil.net>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 19 Nov 2021 09:25:47 +0000
Message-ID: 
 <CAAnfSTuCsijM=zk=saf5B98cnRu6Eq7rWY0shpOk2-ZvzVwzZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/lnr: remove
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 09:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158501

On Wed, 17 Nov 2021 at 18:24, Quentin Schulz <foss+yocto@0leil.net> wrote:
> We could have a simple wrapper instead which would be a simple shell script:
>
> #!/bin/sh
>
> ln --relative --symbolic $1 $2
>
> To not require a change in layers?
> Not sure it's that important considering that one could do a simple sed across all layers? Anyway just thought about that so shared it.

The point was requiring the change in layers so we're using standard
tools and not pointless scripts.  I sent patches for some larger
layers already so the fallout shouldn't be *too* bad.

Ross


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470DFC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 11:04:02 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.9948.1652267033229823269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yv+wCoR9;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id bu29so2976280lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pupw4vElh6M56vhZC688xOuNMxdeMDS3mGoN9fd11tw=;
        b=Yv+wCoR964imssY7L0BkQf4+skmzIRVvDvhEBiD1/zNkRsGhhRQN1fqk8jnlls520h
         ISTgzRN1geeKxmD/cJmToXkoEoGbMthXGteZrMpzvw6qHavbRlu66x5pt8Faf7cgAPAa
         g9cXueQKLfOreZb9lbcq0JJ97F+20qv+4QcXVqflQN/J2nxoTCx0jzVnGl5CCmgb+0Ei
         NqCcGvhkqBMjmLze+r+byXNdpLNO+dFhvFhcvkBES2XoomGKljXaTqdQtmcmcRQl0TKW
         78gRu3KP0ktge1EzrUSmHAuaX2YVfBsmjS8idQoKVcCyxFUnZ+0UIW0ddYIG1MRDB7YO
         qnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pupw4vElh6M56vhZC688xOuNMxdeMDS3mGoN9fd11tw=;
        b=fI52f9Qpu18R51fk7mYc0C1D5ie1OCErl5PwL93IBaftuTmUQfugMm+u8H72oc5uAV
         atV/IYVlV2VjoJrE4xTX6WOt+zN7ira87xMw1u+mN8MT0/OY+LH0R+gMI9K2x4feS67V
         mYZLwUEYGUhuJI38JtEugypAcs7qK3WsP/hkV7km8QlHsiY8kjgmIdWh6XXAKTtx/so7
         MMqDq6gjsItNgbSzRfvQH0+fQ16fircCNwTlldJjp++GY4BNx9bxwnqONW/GpWa57d67
         KaV7zMGeXELAfTT94KWnKCpdBEyA4Q6Tm9rkCkQ3TbAZFMfh4qpEDa/4G5U9ff6pDnyR
         Hxyw==
X-Gm-Message-State: AOAM531S0VPR9OydHo/isdlPIZ7L/ReQM6JIHMT0bAR1oN0ZgY8e5eUe
	pPHVuWX9yODz0OrndiFldvyfD38Q2ZesKghhAHtYMXTskV0=
X-Google-Smtp-Source: 
 ABdhPJwSpQkVUyALvsP+FdV7MNvAg3H6/tzLnBulv6ekWXvIMnbO1Ud6pWJJyd7ijRN4YUl/CO0HlwKdEfdzZ9K2URg=
X-Received: by 2002:a19:504a:0:b0:473:b6da:52ee with SMTP id
 z10-20020a19504a000000b00473b6da52eemr19104284lfj.665.1652267030369; Wed, 11
 May 2022 04:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <92f812a6-ab9b-71c-96c4-7f4ec307ddf@crashcourse.ca>
In-Reply-To: <92f812a6-ab9b-71c-96c4-7f4ec307ddf@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 May 2022 13:03:39 +0200
Message-ID: 
 <CANNYZj97C4Oy9fvkuTFSZM5hqJ4UU6xqdkQpGAKPpzVhNV0_Lg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] local.conf.sample: add comments for missing
 machines
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 11:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165495

I have to note that the project does not test these machines, and they
may not necessarily work. Advertising them in local.conf may result in
frustrating fails for people who are running bitbake for the very
first time.

Alex

On Wed, 11 May 2022 at 12:48, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
> Fill out the commented list of supported machines for completeness.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index c05691de58..f0b8952947 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -20,9 +20,13 @@
>  #
>  #MACHINE ?= "qemuarm"
>  #MACHINE ?= "qemuarm64"
> +#MACHINE ?= "qemuarmv5"
>  #MACHINE ?= "qemumips"
>  #MACHINE ?= "qemumips64"
>  #MACHINE ?= "qemuppc"
> +#MACHINE ?= "qemuppc64"
> +#MACHINE ?= "qemuriscv32"
> +#MACHINE ?= "qemuriscv64"
>  #MACHINE ?= "qemux86"
>  #MACHINE ?= "qemux86-64"
>  #
>
> --
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165494): https://lists.openembedded.org/g/openembedded-core/message/165494
> Mute This Topic: https://lists.openembedded.org/mt/91032627/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


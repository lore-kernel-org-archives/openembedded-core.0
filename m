Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C8BC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 21:41:09 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web08.1670.1644442868367537370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 13:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YJGaGKCB;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id g15so1995056uap.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YB4kq39ew2Do05RWjvwuXI9QQzNTjaZ0FI2KpfDUiRY=;
        b=YJGaGKCBZSdSwQDeVLSHtkZmfaw2kxcYzE5EvVIgQsuFXJ54oUwP7ZtdW92+t65EYF
         Lk9Osf6oMFdOFadajRGEGGWB3/PkjANRA3QUsYCmV6B3l5vVsqXwxh2QGF4dWCW1G9ht
         gPDIaJmUNV7zCk1t0BjLPtdDko08SxLm3TWfyvIsCwEq14CMhkxzYG4jexOotUJswQeG
         YppSv9O9sAyQ6XcxwH624SBBJT197izfBtQ62b0vrhepd89abnJPbU5NdRAIbYGxbCNF
         xJRbQCoRggBRI0JSNxa05geTAu5JSn7tRFUCleSRqg+Cv2Cu8n0EYsJh2NTVrzz81jxz
         IHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YB4kq39ew2Do05RWjvwuXI9QQzNTjaZ0FI2KpfDUiRY=;
        b=MGsbSjlBpQHiicyub+GFWOb8SlC0kMawxYQJMlddTjM3ewAphHgr8hP24cmhAHQfI0
         eaB6A88aGmzZmqJUcKodfxyC0Uz7dlNm/RwRYxnDgdyvICe6zVQ5bFl+ppQFDCtm0D8q
         AKzcRccGL9F+D+pgyMPwAT4J+zbcy4/592qtXppQItINqp1kSmNwBikgz/zkpf2K1d8g
         BoSFXzGmMq3C/7Ypf9Tm/ek4NmsqrAFrM4kEi7r6osAcI9iVd/8ruITLeDPTNyAmPjpH
         A63ZcrGDj3nyacNxx5uK6R9F5xMvse6LkUsPnxY+eD7eq+a7UefOIwY+k/edMXd+2n5y
         kP/Q==
X-Gm-Message-State: AOAM530G8oGVobi1rCuC6FTJghZNOWglVm2WMhPooJowI6+1reIz1yoo
	zFztKGob0oSbJkeBu39f0CMqNC9t63oKg9G9v+E=
X-Google-Smtp-Source: 
 ABdhPJyeuTGJgWtO3PCw+QaDuh4rl7TsngiUzJlPnSVVpIhLkLbWiXufAFw6e9demmE7WA79kE5UXhX8Gx6zTX6y9/4=
X-Received: by 2002:a9f:2c0a:: with SMTP id r10mr1517258uaj.89.1644442867561;
 Wed, 09 Feb 2022 13:41:07 -0800 (PST)
MIME-Version: 1.0
References: <16D23AFEBF6B32F3.17987@lists.openembedded.org>
In-Reply-To: <16D23AFEBF6B32F3.17987@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Feb 2022 22:40:56 +0100
Message-ID: 
 <CANNYZj-g6iZV84fPBG1A1QAXrz7csVNcR_oSMB0_5ffn7CbnEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wget.py: use a longer timeout in checkstatus()
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 21:41:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161591

Wrong list, resending.

Alex

On Wed, 9 Feb 2022 at 22:21, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> The addition of 30 second timeout is recent [1], and has
> proved not long enough with the AB server when mass-checking
> for sstate item availability, resulting in timeout errors with
> extensible SDKs[2].
>
> [1]
> https://git.yoctoproject.org/poky/commit/?id=2c46245f449d2716566ef668da0bf48f2109643a
> [2]
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4710/steps/16/logs/stdio
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  bitbake/lib/bb/fetch2/wget.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
> index 253cabce75..2a7592ae5f 100644
> --- a/bitbake/lib/bb/fetch2/wget.py
> +++ b/bitbake/lib/bb/fetch2/wget.py
> @@ -366,7 +366,7 @@ class Wget(FetchMethod):
>                  except (TypeError, ImportError, IOError, netrc.NetrcParseError):
>                      pass
>
> -                with opener.open(r, timeout=30) as response:
> +                with opener.open(r, timeout=300) as response:
>                      pass
>              except urllib.error.URLError as e:
>                  if try_again:
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161590): https://lists.openembedded.org/g/openembedded-core/message/161590
> Mute This Topic: https://lists.openembedded.org/mt/89032073/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


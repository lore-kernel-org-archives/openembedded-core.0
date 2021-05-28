Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9366.1622213671854305742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 07:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Jrp8e3yD;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.41, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f41.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so2553659wmh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 07:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EHEHPo7dEY/SjlCjCOXAn0IAobSIGUxF1r1KxL3Lua8=;
        b=Jrp8e3yDt1jBSwaahjx/Ny8TaEZZhyGRRtH/i9fZgsa3DoZZoTb5nquVSNEw1qKzzN
         W80wxnjDx3txWAEHz2CIlwZgu+0PfULtUGS5aW1Gz+CZVD0YIKoFuHvXEFOwqqlap/Fi
         uWyVHQBVwxDGypo2CfYDGj5NwtAX5E65rbFogb3rzcAlLVFiJLD/mZt65mrytXlmS3lG
         JkET5z1ASoj46rnduPXBkXYlbAkmP5Z0E3Y8csLHUfy6/CoONgbqOPrQhtcUwgewjY9U
         mvO7djPiZ2k+XYpXaCHi/PjY+XHU0EwAGCzOEvM6FYwFwa82yj0s0Q6sCVRJ2uH66+E0
         uzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EHEHPo7dEY/SjlCjCOXAn0IAobSIGUxF1r1KxL3Lua8=;
        b=WkFaWWNkhZtH9Ay3uBAilBqyuDXFQgnMyOs3tWwwPN+via70pIx9Rtyj6JO2ALGzm5
         gO+nUfiPWDe2yRd/GDtx6Pm2MeoLS0GNpsR/T82sdob/GGPJDpIFc/Ffq7AdNAu/Wm8M
         Disrlsp0WUDHX/lmpY+Q/wR6TDH5IcEz4UAcnsARj2zmk9vk5o0Yrl1ZsLmW8aQaducO
         rInEh2CbYBnTQIn++ZX3m3YZE/hHD4iBHTa9r5zXqLJ/6Kss9iadLdY1NnKgjqHk/tKE
         Hpf9OdWpXLFF9S+TS10KUNbPjPHAft6sqMQbchIktAiSIk92uP9QG00z/XsgrkNAYz4G
         PW9A==
X-Gm-Message-State: AOAM5305OQtWpJu3IOk+JRtWQ0pBCjwpOdvIECD4znZgf9zVyhESkcf1
	lcSNY54vWXlRKVQzeBX0SVNVQnDlH3Yv+C3P6uUhqg==
X-Google-Smtp-Source: ABdhPJxrVgsrIKD6sjoGO7G4Fbcbv+Pw8oeVyj7ZJlFNBrILM9wddJEoKLmwRXYCkHHpBIr+6jVGhqbcRkZvyBt9UhA=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr202325wmc.12.1622213670001;
 Fri, 28 May 2021 07:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <1621841817-21203-1-git-send-email-akash.hadke@kpit.com> <26236.1622189797465588364@lists.openembedded.org>
In-Reply-To: <26236.1622189797465588364@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 28 May 2021 04:54:19 -1000
Message-ID: <CAOSpxdafRBPQkTdieim+3MBNGyPZYsU2=0RkNiEcoUU+kVVF=Q@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] tiff: Add fix for CVE-2020-35521 and CVE-2020-35522
To: akash hadke <akash.hadke@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 27, 2021 at 10:16 PM akash hadke <akash.hadke@kpit.com> wrote:
>
> Any update on this?

I'm in the process of doing the 3.18 release (in QA at the moment),
but your patch is in queue for adding post 3.1.8 release.

You can always see my current testing queue at:
https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Steve

> 
>

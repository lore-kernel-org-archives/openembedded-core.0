Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.212.1587659775393376341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 09:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E06qTxWx;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id z2so7033037iol.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 09:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=EyestAggHfDQO5YJmqdcH8UFnJ5tcfhWRoQykR4gxbA=;
        b=E06qTxWx1EdWGZhQyJ5NB4qkizW8eEQlXDpwev1ogEaMlic+hPR0tTEM/qLPpExXcv
         ILNdghUwlMkjHWSXim/Z++mnZIfnm00//CT+CUGDUvOtZC5bFUikTqKvGRjA3KqbUAc+
         G9CrxbasfhYKZAdjXF1tmJuYszpe44ZDZX/hpuuQFPJax+bfZokPDQiE+KpQtlCNEB0k
         eh1wrdTml3fRvzmwaVVmHIW/iRhszNrSoDLZjDkNp1ajb2A4I24jAzn6l/PpixDdPGqj
         0IujqNV28NTh5ZSgJYHPD1eg1ykRFEMg4vZcAqy5SjdRCJ+KfBi2HWN4gM4rGpeJKqQI
         /vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=EyestAggHfDQO5YJmqdcH8UFnJ5tcfhWRoQykR4gxbA=;
        b=aX4saT6woJxIEFLK02uyZmWlf2d2NVtlwzpvr8o/SZ7jvZ83OaGFqjS2CBvKUCd59X
         HKMI+fwkTyqtYWAth/xMuFzkd85ezUkn9OIikgMSsSBfOg0OW08GOgt4b0cA7L9GTbyd
         ksl6Oc37V9MH6p2n/gSjpmkoRgIZdBPsz0PsEWs/7BHOp9Xu6u1E0BtivcNyxdNjcxaq
         vtJoHgq1oxQOiK/tlFJxMhP2iJEYXKrUdHH0aqGe1WC03rOb1wrQ0blcvOvgwVgc+n62
         FS23Nen7MeCMNCoeFJKMSRqZZIalWa6HsTEphkkYz1MDxBAZNLdr8HZJSdMmJncgFCKf
         8pIg==
X-Gm-Message-State: AGi0PubPfUvVcK+VNE1gincaJJOKMto8fp7HVjW8rqnI2onsZK2eR7RN
	RxDoyZUKdSv7Hd/e+136rcVG45TlrMdaeIL5hGnCzQ==
X-Google-Smtp-Source: APiQypLrt09fthUNZdoDSgfC4h4xy/Oc967i2eK5A+UQlpXzCCvx3ot/ntOMlxRmXB4d1EU3Bed2KYzlYNs1jPPh9E4=
X-Received: by 2002:a02:ce8b:: with SMTP id y11mr4056874jaq.125.1587659774409;
 Thu, 23 Apr 2020 09:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200415223036.12754-1-schnitzeltony@gmail.com>
In-Reply-To: <20200415223036.12754-1-schnitzeltony@gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Thu, 23 Apr 2020 18:36:03 +0200
Message-ID: <CALbNGRTCkBdzsUSuxgejrF73xJiH=zrzuYQ=u3CmZgGxppRVAw@mail.gmail.com>
Subject: Re: [PATCH] meson.bbclass: avoid unexpected operating-system names
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 12:30 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> For example 'linux-gnueabi' is not what meson consumers expect: See canon=
ical
> table of OS names for Meson (thanks Ross). Surprisingly this did not pop =
up
> earlier but wrong system-name can break building as described in [1]
>
> [1] https://lists.openembedded.org/g/openembedded-core/topic/meson_host_m=
achine_system/73023862

Ping

* at least I consider it important: The issue fixed can cause
undetected misconfigurations
* yes meson can do better but this is not in the scope of this patch

Andreas

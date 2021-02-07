Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.25814.1612729897836518368
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 12:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rrum4kJr;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id l11so6104439qvt.1
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 12:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9arxn/JnXVKrJoKAHg33aWSECJBgAD49nRCsT5nDIcI=;
        b=Rrum4kJrw6RVDiY0vBV7G83mC92U0+3nW0rD9v377RVoK0KEEwQDRC7Y8nmZK9AJ97
         T9ntp4oWIj88wRUstp7IpcpeX6BXZ6oNPppSLFe56fCyWGT8pv46986gDkrKMDhEo7qT
         t0OoKVypYw7Vd52HVOj9c3jMZFknf4sJOKeUbcoyyY21eaJOTvBPe0Kbzs4Z3Qf4TXJl
         sVGApXYTBnvMyW7i33tOfUaNOG+96hRfM5J1DrGoDBZl8EGcA1toWjVzzZ8ePsgAfNQr
         5WyNuuBucQ+A4y4YqMDcC7aBaHOuFygzPMxVmVKPL4sJmx4WZ4LNayvY6DX7066eb38y
         DLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9arxn/JnXVKrJoKAHg33aWSECJBgAD49nRCsT5nDIcI=;
        b=dDGlXTsEvJnKbwLN+jUUqryVURH78DRE4LHSQr4Jky2iBfKwMjlHJRfTj3pbZGcJ21
         W4PhMwepxpCxrD2BwMSH6McA7yWN6tuH9Rh7CJN7F4Qm2CyiNF14W/zu5RxB0GCOiuzY
         1Eg4jGkHli6yrIJKb8V9kPpr3jhVeDo/8TkrNcAUDWIoIVJnly54q8778BonWOYr6HwU
         QbyLcfw9OL5Du4E21Gliwd/8XPqPnbnrE3Mj+mtlq7f5XUGcu9tKnsxCw7SQUETyLvG3
         BTFcUshP1SSXmTCkItnxjQ8cSkJqSXqFqUSEyvG/l2VZVf+2va6xVpMmUpgvH2n6bB4h
         nXpg==
X-Gm-Message-State: AOAM531xC3INpaG56hNKmc+adFK4UJpfPdXNTwVSCrPSBt3vc2dLNfr0
	wtmOTlf9iyijKJlqLFB4cFQ4wNCoJsYAP15mpE4=
X-Google-Smtp-Source: ABdhPJyPsii0ZcHWq1AiAYzhsG9Kh07iCOlDhCGWkm+4Ft/HEptCihYjjhCCXLi/h89lSMK+k8w6MAN9YLRYyDiI/L8=
X-Received: by 2002:a0c:b92f:: with SMTP id u47mr10669761qvf.8.1612729896895;
 Sun, 07 Feb 2021 12:31:36 -0800 (PST)
MIME-Version: 1.0
References: <CANPvuRnNWyXvUkwZwPNhGPPDwxUqOMH-f8bKAdC8p1MvHiP1iQ@mail.gmail.com>
In-Reply-To: <CANPvuRnNWyXvUkwZwPNhGPPDwxUqOMH-f8bKAdC8p1MvHiP1iQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 7 Feb 2021 12:31:10 -0800
Message-ID: <CAMKF1srbCE7dbLz_5cLnV4d3mwZzfPgm3Apa1c=qD7Ow881tvA@mail.gmail.com>
Subject: Re: [OE-core] OE-Core and bitbake patchwork apparently is dead
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah patchwork in general has been having inconsistent uptime for past
few months. We perhaps should either fix it and do the needed or just
retire it.

On Sun, Feb 7, 2021 at 10:25 AM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
> Hi all,
>
> Patchwork Bitbake Task Executor: last update on 2020-10-28
> https://patches.openembedded.org/project/bitbake/series/?ordering=3D-las=
t_updated
>
> Patchwork OpenEmbedded Core Layer: last update on 2020-12-18
> https://patches.openembedded.org/project/oe-core/series/?ordering=3D-las=
t_updated
>
> Patchwork Meta OpenEmbedded Layers: last update on 2021-02-04
> https://patches.openembedded.org/project/oe/series/?ordering=3D-last_upd=
ated
>
> Patchwork Yocto Project Layers: last update on 2021-02-05
> https://patches.openembedded.org/project/yocto/series/?ordering=3D-last_=
updated
>
> Patchwork Yocto Documentation: last update on 2021-02-05
> https://patches.openembedded.org/project/docs/series/?ordering=3D-last_u=
pdated
>
> Something is wrong with OE-core and bitbake patchwork.
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>

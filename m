Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.20637.1607632885717620944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 12:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hyEeJ0yi;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id n142so6285736qkn.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 12:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/OW6xNAth6MFSUPkq6nfc3elMea6fm4Zggy57MVh/Wc=;
        b=hyEeJ0yiwwl2nnerRjvgDa0Zh+OAf89QlBvqNsJieSUmDArCePIw6IIICUOmCRKa9s
         Gw5Ns0TLDdgtyR7U2cGKBiSpz5HFjzx8xOq5cZxUwGcqpCxSTMdbrALmxbULSEc0hTvN
         93dCtDYwcYevitcYNtBzgxoFSMSPJclkZl6rYW2pDfuomvkdEqktlZSqmb4G4DlwWoQ8
         M+fj+yWJRgRi4DrPaP/3+ax0hFJ7qLPv7aVT3okZCzQ06GZg+O5qCjJpZ8MnleWg6Qwx
         2CsS+ImVnme9l0VB00BlH84kX+rwvn7JvIijNX2yPvWC/z6ca1GtI4n2Wfi1FEKrYCwh
         uzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/OW6xNAth6MFSUPkq6nfc3elMea6fm4Zggy57MVh/Wc=;
        b=gnStu2WA80/1IH4wF//vtRurS29jQNdG/9MuXP27rIbQ8rAfT39mAkMTDSYxAhRFfp
         iB709BPrIyKnuLDeU207yTjd1nbYZY1EIkxomTvjWK4wVKcAQ4i6+GTNyHa/mXzqDEab
         lP2X+Gtn124VzBmxcZvCSwhKswlkiF822PW0QqB796mNXa7Ob0qRUocmpNXgGHDLr9rq
         sFaqE9uv8+jGCzvSduVj5rL4F3X24CDBxElFYPJZY2XC0qtgYUMLqLYp+AnRzMToRmSc
         DBXt7VUpTy6P4zQ/CaFIvLw3MHlt5f7cW5d0vDKeSvgnYBmE6qYe4vJOxWDk2A1wc04X
         X9kA==
X-Gm-Message-State: AOAM531kASUFGDMTEJ9t/eH3iryN7AgIwS80urVkr3qPU2ImXhZlRXal
	dmAd91xwi+pvq+ZTNeJ9CFnBwQMu6m0Ngyiq+IM=
X-Google-Smtp-Source: ABdhPJxfXJW4yFTCZmnCqEsmwVcJud+Mi8ObEWRL2asKc2+5s75x4EAG9XJPckHKm7paRnZTH98dKHqTLMtaRQvc3Ic=
X-Received: by 2002:a37:b182:: with SMTP id a124mr11678456qkf.9.1607632884875;
 Thu, 10 Dec 2020 12:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <4b5b304d-9cff-4a61-16b9-6dd8fba58626@gmail.com> <22ce46324e27aacc8cddee2c3f716adae091fbfb.camel@microsoft.com>
In-Reply-To: <22ce46324e27aacc8cddee2c3f716adae091fbfb.camel@microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 10 Dec 2020 12:40:58 -0800
Message-ID: <CAMKF1sq05u5zXapFPL15RH7rk4JiDEw90-2oSg2cKqLTmtyrUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] systemd: update 246 -> 247
To: Luca Boccassi <Luca.Boccassi@microsoft.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 10:05 AM Luca Boccassi
<Luca.Boccassi@microsoft.com> wrote:
>
> On Thu, 2020-12-10 at 09:08 -0800, Khem Raj wrote:
> >
> > On 12/10/20 4:53 AM, Luca Bocassi wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >
> > > Update systemd to v247.1.
> > > Add rule for new oomd dbus conf and for new pam.d
> > > conf directory in /usr/lib.
> > > Drop selinux-hook-handling-to-enumerate-nexthop.patch,
> > > merged upstream.
> > > Backport 0001-meson-set-cxx-variable-before-using-it.patch
> > > from v247-stable to fix builds without C++.
> > > Refresh musl patches.
> > >
> >
> > perhaps we need to update systemd-conf and systemd-boot recipes as well here
>
> systemd-boot is updated to use the new meson patch. systemd-conf didn't
> need it, at least for me? Does it fail to build for you?

no they dont but I thought they should be reflecting systemd version I
would think
>
> --
> Kind regards,
> Luca Boccassi

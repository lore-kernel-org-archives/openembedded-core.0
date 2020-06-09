Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.7230.1591709600828201975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 06:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=TarJo1yL;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id n24so25035981lji.10
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QEy2jx6yOrxxG/Zr3XTfSEmPX4os9bdegknB9tlwkM0=;
        b=TarJo1yLT5vp6GQa6SWPOr8eD+BpRaY8omH3Z8CqsLzxR4zIVG3nrGLJfRsatfc9vh
         wLFRMgAQEjJZl/i+q/Gm5DmMWtWFceDkId32MvvJpDS0shFyBKhpGaexmDNjERS2D9M8
         ZRKYkW/svjPZ5SySpUiiBzQhMybDYxH/QeG77g5unAK8Tc7R4xLO7M0BewU9aK3e/9Tz
         nU1zdbh02+v3kJIsNYqIT50QDWP3MM6GPol1jtSDXELcW2FsoyhVCieHs3n/MugM0iYe
         CfFcufxy69JXJ1At22/lZlwPWrj67gy/1IfP47KczF7mhQB2hwAnN+RL/BuygmBWqdM6
         HpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QEy2jx6yOrxxG/Zr3XTfSEmPX4os9bdegknB9tlwkM0=;
        b=ekXzMJfD1KYkrat60p+2tH2mWKEPh04ZFNfaVJZD0kAIK8EEfRvz+y5B/0uz6PD9Tx
         amZENVRAoDD34OqSohJf1MXs6N95nJ3RhplmIrkpKNTeDUrWbUwLu9/yvr+1i00dbc1l
         8+YnLx0MCHTZ3HdxrPOF1JKIChxKb4XFPIFYfpQNJRvbz4x2A7ibVXlHXKmgAjBPi/jP
         L4w083NCtV+IiWmSxhOub39PmnuTaZO2o64U8/zEjWOBPnI2gGRtU2KKrXWY9vZwCwst
         JXcNc/Vlxv14sWCPedyVe+1rvL8mKzhCK/6i19lU46FgBIXF25cJftdYdzYHb3LN4OY0
         hRRg==
X-Gm-Message-State: AOAM531lMihLQ8Jf166yj5cB2Sp9yskl/2Qrxaa4gpUZr4wUvUbxjGT9
	2AL8aEnv7G14U+1ZCsxfAQTZ6ilL0WlMd2HZrrrJ2A==
X-Google-Smtp-Source: ABdhPJxv+cHD0EV9LxLVQvt8TUsnkfrNN4Za5TI2VGEr1VVJoL2V3vn/xL2lwzJm87xtohwkg5G+eviuXjYH8W1/wHI=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr1670277ljj.340.1591709598836;
 Tue, 09 Jun 2020 06:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
 <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com> <CAMKF1spsARiB5ibBVZ2AF5sLGw9cAakGos-yqbfn=NG6B+nw9A@mail.gmail.com>
 <2cf81259a8f75130bc7dfbb473ab92017d054ae4.camel@pengutronix.de>
In-Reply-To: <2cf81259a8f75130bc7dfbb473ab92017d054ae4.camel@pengutronix.de>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 9 Jun 2020 14:33:07 +0100
Message-ID: <CAAnfSTsshwC-aOTMR=6rx-04QaoVDJh3L6Turr1MsBwH2sbCFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
To: "Enrico J?rns" <ejo@pengutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	"Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, jlu@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2020 at 21:15, Enrico J?rns <ejo@pengutronix.de> wrote:

> What is the now suggested way of placing these kind of binaries? Simply in DEPLOY_DIR_IMAGES as the above-mentioned commit does (silently)?
> Or is there maybe still some motivation to keep DEPLOY_DIR_TOOLS?

FWIW, meta-arm is also using DEPLOY_DIR_TOOLS and to fix builds with
master is now manually using DEPLOY_DIR/tools because having a
separate directory does help introduce some structure.

Basically, I'd actually like to see this reverted.

Ross

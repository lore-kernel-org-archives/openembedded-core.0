Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.8336.1591712480675721879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XPM8c/85;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l17so3016504wmj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=285s+Gu9q7t1Tk9UW2XW9ALxLPKxByT63JqE59sHtws=;
        b=XPM8c/85+X6EOIeXsFLVY8S7sDcSFIuuJOeB2ZAP0QVdf8Ep59UdyA8C/jNj+QFZys
         ow0aGPUzoYBieU6TtgWzpopjNj45RT9UNZ1gGKZ6lPLsAu+RI71/6EgSZgtFn8p4vwCE
         ogH8nHwWAu4EDMem5Os8D9Nq43XIeFqC2UGgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=285s+Gu9q7t1Tk9UW2XW9ALxLPKxByT63JqE59sHtws=;
        b=arORgIT/Qmh482Gj/4Tp9aq4hpoEE0i3mS4y2UOkp6XA3Q8i9M7rOrSjyphaOaQV/q
         jcZbVXzyN6pkFkEzFU7oRsmmFrs+FzIwL7NHtSUVbuvfJopT4lGc86UlImtWPZEKZ/Lp
         0+y7NOFtcbxK2C196aRACDKv8R/Gwvkb553eYm/EL/e1q+yGStLWCjjrXy5CHrucDECA
         uB/YUIAvikJdfQ7DuOD0WnRiZpzaSL9GYFcelWwQ8/3XDBM3yRFsNc15EGHtRwFAOu85
         nEFyfn6Zms7ocdUu/aotT17u0Hg23ISpIIaK91Tw8ZivfgMDCD+oVVYIxRW0eHeTmKfg
         BI1w==
X-Gm-Message-State: AOAM531DJY8a6LT9WM++Sw8daXHP5vDPDW6G/zd7QpGgf1tcRMnqFRuT
	OGUv15jx9Z0ZnCe1vYEwbEE+xg==
X-Google-Smtp-Source: ABdhPJwynSzPE6++KB1mxsM43fc//Vjs2C6prDS7gEF3ntt1woAyn4UBiDTM7Zs1SH/3/Jrs0l3etA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr4236358wma.101.1591712479076;
        Tue, 09 Jun 2020 07:21:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c6sm3632033wro.92.2020.06.09.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 07:21:16 -0700 (PDT)
Message-ID: <d8a4e2fc32bfec3e84d3e2ca6036e2ff74c755ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Enrico J?rns <ejo@pengutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
 <openembedded-core@lists.openembedded.org>,  jlu@pengutronix.de
Date: Tue, 09 Jun 2020 15:21:12 +0100
In-Reply-To: <CAAnfSTsshwC-aOTMR=6rx-04QaoVDJh3L6Turr1MsBwH2sbCFA@mail.gmail.com>
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
	 <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com>
	 <CAMKF1spsARiB5ibBVZ2AF5sLGw9cAakGos-yqbfn=NG6B+nw9A@mail.gmail.com>
	 <2cf81259a8f75130bc7dfbb473ab92017d054ae4.camel@pengutronix.de>
	 <CAAnfSTsshwC-aOTMR=6rx-04QaoVDJh3L6Turr1MsBwH2sbCFA@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-09 at 14:33 +0100, Ross Burton wrote:
> On Mon, 8 Jun 2020 at 21:15, Enrico J?rns <ejo@pengutronix.de> wrote:
> 
> > What is the now suggested way of placing these kind of binaries?
> > Simply in DEPLOY_DIR_IMAGES as the above-mentioned commit does
> > (silently)?
> > Or is there maybe still some motivation to keep DEPLOY_DIR_TOOLS?
> 
> FWIW, meta-arm is also using DEPLOY_DIR_TOOLS and to fix builds with
> master is now manually using DEPLOY_DIR/tools because having a
> separate directory does help introduce some structure.
> 
> Basically, I'd actually like to see this reverted.

I'm tempted to agree. It was only merged on the basis that it was
unused which isn't true.

Cheers,

Richard


Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.44886.1597675546428252290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 07:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YYn2Fq6T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id g8so13445592wmk.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7EdS3r4NnF/5O++ooc/1/ogQ39f1JhsbuUmRvxnhoa0=;
        b=YYn2Fq6TmcPcyaCwxYhzsOi1XDDu/HC3klioFjHyeTVLPf9P8W/Jfq+dccTpDmVHyn
         LDYLPULH07bVJAMrSYpvgBJYl2376ajbPA22Bd281kIR5uVnhklVeTqRE0OcScMQj3Ue
         29oUoObmDy+vsC/bAIUot0KxmsOSlehLTdPC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7EdS3r4NnF/5O++ooc/1/ogQ39f1JhsbuUmRvxnhoa0=;
        b=gc+HK1x9GVRE3HFBibK0NPMrwYdgS/lpbG7gVu+JIS7L7Y7N54jK+whBs2OYU8X+Is
         sQiaM77sI1R0TwP+Q3zZORJ9aKaaB2V0e3TP4orT04/0rwRcBadek/DF7RpqgdKB7Zsf
         yTyHhE6ycE7NDDoxQCg33TMleAimDRiycvQ/w4+7M0itxhy63ishIBRa8Be4hCqZl8l1
         WHWOU94BNVqFm+dcVD3We3DvN3rY1YyxO1YBCTsAEnOxMAB2Ev6lcRR6yH5eq3WOtOka
         OEszyGT+qFVnaj0UXkN/fP91JqQ9JgbfseOHXID32qa6pm7gExbyP5aL5+b7AZW88QD4
         kJ7w==
X-Gm-Message-State: AOAM533xvQtJQdILGAVap1JNH6V36o0cKF3Lf/7sPhNUXRgEqlOkqX+P
	5PNy8s1wMV1raxHb2k2ESFkz4g==
X-Google-Smtp-Source: ABdhPJyEeHWV8MvpeeEKCovkNkjiAnjqNaAhwmjihJGwoj1p8upfVuvff5GgmXAxFjO2Wk7lVgFWZA==
X-Received: by 2002:a1c:26c4:: with SMTP id m187mr14609617wmm.90.1597675544890;
        Mon, 17 Aug 2020 07:45:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b942:d7a3:7f1f:3e7])
        by smtp.gmail.com with ESMTPSA id p8sm31768164wrq.9.2020.08.17.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 07:45:44 -0700 (PDT)
Message-ID: <43615d8d4b831bcd0f86bcd815c8bf395d5bfcd8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Aug 2020 15:45:43 +0100
In-Reply-To: <CADkTA4PFf_PsFLg4nbZ9csO0zvE_pfh_h-LgRwn1RJJmS-5kQw@mail.gmail.com>
References: <20200804082019.76320-1-jacob.kroon@gmail.com>
	 <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
	 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
	 <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
	 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
	 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
	 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
	 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
	 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
	 <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
	 <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
	 <CADkTA4PFf_PsFLg4nbZ9csO0zvE_pfh_h-LgRwn1RJJmS-5kQw@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-17 at 10:15 -0400, Bruce Ashfield wrote:
> 
> 
> On Mon, Aug 17, 2020 at 8:27 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
> > > 
> > > 
> > > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > > > > Bruce,
> > > > > 
> > > > > We need 
> > > > > 
> > > > 
> > https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > > > > backported to 5.4 kernels for perf to build with -fno-common
> > can
> > > > you
> > > > > queue this in your kernel updates as soon as you can ?
> > > > 
> > > > I think we have other active kernels which will also need it as
> > > > even
> > > > with Khem's patch we still see failures:
> > > > 
> > > 
> > > I've taken care of linux-yocto now, I don't think there are any
> > > active use cases for those kernels that won't be covered.
> > 
> > I bumped the meta-yocto BSPs with a quickly hacked up patch but we
> > still see:
> > 
> 
> I have local bumps for the yocto-bsps as well, let me try a perf
> build against beaglebone to see if I can see anything.
> 
> If I build master-next, will I get all the required gcc patches to
> trigger the issue ?

You need:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=c79101ffff8a9cc70daefe737e16b773190bb6ca

without its revert (which is also in -next atm).

Cheers,

Richard


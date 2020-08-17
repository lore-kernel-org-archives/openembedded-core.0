Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.41769.1597667256299735293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 05:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S/CxZEsA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 184so13737189wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Y8VQN02Ml+N1lwR78HcjPMzd4QPaiArxIbiQWQtEtqc=;
        b=S/CxZEsAUk0rlmuisT3WHvsds46GE4z+UFiFK+mfDmu0VGNsBxOzATHlTlbXGDR8Vy
         Ob1xIfaSwf9lY7v1mKV6mlH7jHYgl64Svf6LiDtmONygnE6xwoE9Pyn1Ni3LW9AJX262
         KadPuo4YzfgYNr36spqyV0Pdp5n/zlMgctO60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y8VQN02Ml+N1lwR78HcjPMzd4QPaiArxIbiQWQtEtqc=;
        b=SwNCefrmiWSA1UeZSRvoNSjFVbvnJxd7iqgTS1TPX+ExgqDpdU34moFZ3hJ58bcmHk
         iUxlzUL4wS0ZOig+C3eUz45WVMnMyUsbwSr6s8fcBGt7l1T8eMnibNblihKf6G6HIkQH
         B1bgL9EhvQqXRnqHW42yZVRoH3VycOknk0BykroDWB3+PZwBmfnGUTRvZhwYaxGC8f5y
         0QUesE/GflELGtNJIc4QsC4Nm/q5Z5QJQXqFSkIOpRrrVYh4I8nhxJsM1xaGf5VIBacG
         uBW1If2ffpcy0mBA6/DorxArTKtCMSQzvZLIzHMLiTPg/eu9G1r5O2hzcTcdf6UMpS7N
         VEsg==
X-Gm-Message-State: AOAM532D43C4qhDAD2zNIhmNsfPPXiaevN//wX5hjgnvHnsl14qrrgG3
	jMreJ8RkPxUVLzwxc3WeShe6vQ==
X-Google-Smtp-Source: ABdhPJysyJN4ApS4kyCvmqTMPwiZdBFIxOvF6gECKPhKowgNEfTRpz0W/bBh8tyaYJg31WypNFeQLA==
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr14824519wma.187.1597667254849;
        Mon, 17 Aug 2020 05:27:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b942:d7a3:7f1f:3e7])
        by smtp.gmail.com with ESMTPSA id 32sm31766584wrn.86.2020.08.17.05.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 05:27:34 -0700 (PDT)
Message-ID: <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Aug 2020 13:27:31 +0100
In-Reply-To: <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
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
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
> 
> 
> On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > > Bruce,
> > > 
> > > We need 
> > > 
> > https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > > backported to 5.4 kernels for perf to build with -fno-common can
> > you
> > > queue this in your kernel updates as soon as you can ?
> > 
> > I think we have other active kernels which will also need it as
> > even
> > with Khem's patch we still see failures:
> > 
> 
> I've taken care of linux-yocto now, I don't think there are any
> active use cases for those kernels that won't be covered.

I bumped the meta-yocto BSPs with a quickly hacked up patch but we
still see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339

so I think there may be another patch we need somewhere...

(which matches what we saw with Khem's _append which also failed).

There is still some piece of this we're missing, maybe on non-IA.

Cheers,

Richard


Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.19772.1608438851498307462
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 20:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V9dHJo2i;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id v5so4513333qtv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 20:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8O3Jlr/iNNNDj9/W/L/X0bWw5AEEW53HtqFWR8THDCM=;
        b=V9dHJo2ilh0e3aWSS4LyzRjMaqA6gNKpfuPBIrllHsSE7pvKz6zg1XOhIoeq14QQLK
         qFqK4w5ELAytso85F4TMNWujzUa9BTzFtQFukVTx6AS+EqZRB1EAf18n0mk/2OYQF7/Y
         L1aVohPiRD41knzLbch84K4T3JqEM7ImXJjNqrB1He2etMQhQAuncGheaoXmjw3TU8Uy
         ASGO7TdE+CR+rpDRCC8kZoq3B+n/TEzfovF7xaZsDphF7zG7ZxkscFaHlvCrFxH40851
         BCX801U2yqzePA2IYkTG92BH3MgzD664es9ii12fRd78igVFuaY0nOXv8Ly1E1Km3xNI
         Uj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8O3Jlr/iNNNDj9/W/L/X0bWw5AEEW53HtqFWR8THDCM=;
        b=lbfgZXfXQml0xZNedRDtj8bUjI+2k/PYjVmVr2EGUWuWXkgi5py5yabRHHL7URJdi7
         OIZdPjVR0ZPczjGH1gYQQOm9CqpFDN40GJM9b02lPzgtkcA4rfxN4iyD6VCRVQz5e4yf
         WNs/TmfyNXbU7z+2eTCjKbSfQAN6tF9AwihAGOsZWXOWzvndFMZF9jVMVOz+9/TaFCnV
         hfraOcbsGwIgs9c87VPTE5eSxURTvuP179gXMpCzWdde5F7YFDB8ZoURWLONxk4PvhHd
         7zZ/PKRK+gTKCkFWH9NRiRbNQq45Y5czDBb0HKRL3VeX670ncHhoJ+rcO5dRVaAHy2RW
         2/bA==
X-Gm-Message-State: AOAM531v9qv9pr8pPd1jWHHZ0esd9IKUtn0Qtdi2JRd3GFKtFx8UoV1Y
	NNSxlam+d36JR49FckrVUcnNI61VPImPJccEbpw=
X-Google-Smtp-Source: ABdhPJzdmZpsixxP9lVmXaw0KJZYnnYAqCQpZs6Tjb2oPPn8hZzNYqisP9hNoNc480xAxyqYt6OBtCTJ0prmbTEalXg=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr11421985qtb.80.1608438850593;
 Sat, 19 Dec 2020 20:34:10 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
 <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
 <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
In-Reply-To: <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 19 Dec 2020 20:33:44 -0800
Message-ID: <CAMKF1spYdcB9j9Evh2Bg81fciXeYvDu88GWat6hZRcz+H0G7=A@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>, Shachar Menashe <shachar@vdoo.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 9:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-12-19 at 18:53 +0100, Konrad Weihmann wrote:
> > On 19.12.20 18:36, Richard Purdie wrote:
> > >   PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> > > +PACKAGECONFIG[no-tls1] = "no-tls1"
> > > +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
> > >
> > >   B = "${WORKDIR}/build"
> > >   do_configure[cleandirs] = "${B}"
> > > @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
> > >   CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> > >   CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> > >
> > > +# Disable deprecated crypto algorithms
> > > +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> > > +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> > > +
> >  From my perspective this breaks backward compatibility, so I would
> > rather have them all that as optional PACKAGECONFIG fields (which also
> > does make it easier for ppl, still relying on one of those algorithms,
> > for whatever reason, to re-enable them) - with the current approach all
> > one could do is to override it with a bbappend - and tbh letting ppl
> > have bbappends for this recipe, doesn't sound like the best idea in the
> > long run to "enforce" any kind of "security" or "hardening"
>
> Having it as a variable does mean you could customise the variable and
> doesn't mean it has to be done with a bbappend, it can be set from a
> distro config too.
>
> I'm not sure turning each one into a packageconfig is going to be more
> helpful compared to this in practise...

I agree, its good as it is, we are able to append/remove options from
it via config or recipe metadata in custom layers if needed.

>
> Cheers,
>
> Richard
>
>
> 
>

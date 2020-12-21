Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web08.4038.1608592114660958295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 15:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H200CmZT;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id r24so6094929vsg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 15:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c2keKRB6v+ruy68n09vSnSt/j66+PK4CEKCPzMdeKt8=;
        b=H200CmZTxXcz2vYVBrfuvwfXvkNeLAx2nS4n7HffCd8Jln9XMcGSywtUrrnPZqYo10
         hQXDBpScZBz+atZPhB3pAJbIajjaQQkOpuGgv3S6GML4fMhzztyd32cklX/EqWErdDm5
         WDLvhNpNveuqK/dg5OiYphq8/2NEC0zBfFMi8R1CYnebWCfD3RJKxIcsPzdKzpi/SO6Y
         wspXVeLg/ay9vZVLsdbTEeb3xRiOGn4snAA8jL9tcmNfDRIMF644NDBsrPhmpbdZ+009
         E304vDmJ9mjkTZo0n3IoQ7LcPF7LXKjki8UZVejBplLmDDEGH4NPVVpL0zdjGC0H4Nnb
         YsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2keKRB6v+ruy68n09vSnSt/j66+PK4CEKCPzMdeKt8=;
        b=m/8VWS/OEv89kaEZmOZjmSILXwy15BJaQqsH5l/wbH5ffhbLPH3Ljr+7WJIw7HPZLI
         WH3aJaoX3fjX6xKuGs1xvEvghj+e1WJy+dmik+74RMsbHGZ9bE93SAEkL4Db+rwejAXx
         o90vKBl0htNelZQu5IZnENMf8GNK/WUCH4ezMPfaGkdO6xETU37kP5juoAMlIj15GiC5
         NP98R1a3HOn0B0ACf1sLJ4VMIkMb3yeVVczccBV1WezvlLdjVmaewYHxChoVkYvrV+UA
         53fE0d1VzsCaIYijrCCXDB7DFsemLNq2veVfphQdIs7QnJEWixarS+GWsqnFktoVI3RU
         u2XQ==
X-Gm-Message-State: AOAM531xK7w7wte85vkN24rA8qrTo7Zru3OpcbKf9ktpJLCfrAWlrIK2
	Rhncrx55GvsGvHo0iIf8LA2pXoHoDPIQW+XWLI4=
X-Google-Smtp-Source: ABdhPJy1LwIUQinL6pQtC3TEj7MmME/w4RncRUhPhFYBsugovD8ln8vfE62i0dssijrCwdDHdWdVE80i0JD0oWF6yR0=
X-Received: by 2002:a67:fb46:: with SMTP id e6mr14224835vsr.0.1608592113687;
 Mon, 21 Dec 2020 15:08:33 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
 <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
 <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
 <DBBPR09MB47482872A1EB65B9A9502107A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
 <be687b25420f499597616b317de9e8e6d6eb8bb0.camel@linuxfoundation.org>
In-Reply-To: <be687b25420f499597616b317de9e8e6d6eb8bb0.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 21 Dec 2020 15:08:22 -0800
Message-ID: <CAJ86T=XiQZhoTyEZq5FiwJbE4gyMuAfiuaETmD-5pVCR+QAvsQ@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>, Shachar Menashe <shachar@vdoo.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 4:08 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-12-19 at 19:04 +0100, Konrad Weihmann wrote:
> >
> > On 19.12.20 18:58, Richard Purdie wrote:
> > > On Sat, 2020-12-19 at 18:53 +0100, Konrad Weihmann wrote:
> > > > On 19.12.20 18:36, Richard Purdie wrote:
> > > > >    PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> > > > > +PACKAGECONFIG[no-tls1] = "no-tls1"
> > > > > +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
> > > > >
> > > > >    B = "${WORKDIR}/build"
> > > > >    do_configure[cleandirs] = "${B}"
> > > > > @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
> > > > >    CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> > > > >    CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> > > > >
> > > > > +# Disable deprecated crypto algorithms
> > > > > +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> > > > > +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> > > > > +
> > > >   From my perspective this breaks backward compatibility, so I would
> > > > rather have them all that as optional PACKAGECONFIG fields (which also
> > > > does make it easier for ppl, still relying on one of those algorithms,
> > > > for whatever reason, to re-enable them) - with the current approach all
> > > > one could do is to override it with a bbappend - and tbh letting ppl
> > > > have bbappends for this recipe, doesn't sound like the best idea in the
> > > > long run to "enforce" any kind of "security" or "hardening"
> > >
> > > Having it as a variable does mean you could customise the variable and
> > > doesn't mean it has to be done with a bbappend, it can be set from a
> > > distro config too.
> > >
> > > I'm not sure turning each one into a packageconfig is going to be more
> > > helpful compared to this in practise...
> >
> > I'm not sure I follow, as this is a "hard" assign - if it would (in
> > theory) a ??= assignment, yes then it would be fine. Still that leaves
> > us with a not commonly known variable, while PACKAGECONFIG is more
> > widely accepted in 3rd party layers/distros from my experience.
>
> You could do various things to this from a distro config, e.g.:
>
> DEPRECATED_CRYPTO_FLAGS_pn-openssl = "xxx"
>
> or
>
> DEPRECATED_CRYPTO_FLAGS_pn-openssl_<distrooverride> = "xxx"
>
> DEPRECATED_CRYPTO_FLAGS_pn-openssl_append = " extra-disable"
>
> DEPRECATED_CRYPTO_FLAGS_pn-openssl_remove = "add-me-back"
>
> so I'd say that its not a particularly "hard" assignment?
>
> We could make it a ??= but I'm not sure it would change much practcial
> use as it would almost always be with an override of some sort?
>
> Whilst PACKAGECONFIG is more well known,the variable name here may
> actually improve readability...

Does it? It just looks like an extension of a definition of
PACKAGECONFIG but with the logic all reversed (e.g. instead of adding
FOO to PACKAGECONFIG to enable support for something we now have to
add no-FOO to the new custom variable to disable something). Inverting
the logic of all the options makes it closer to the semantics expected
by the openssl configure scripts, but makes it further from the
semantics expected by someone using OE to configure a package (who is
presumably used to the "add FOO to PACKAGECONFIG to enable something"
convention).

Converting all these options to individual PACKAGECONFIG options but
not adding them to the default value PACKAGECONFIG seems like the
better approach. Users who need to enable a particular algorithm can
then add it to PACKAGECONFIG in the usual way.

In general, disabling old or unused algorithms by default is a good
change though.

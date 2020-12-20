Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.17558.1608422927817915436
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 16:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FnFqjfmr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id y17so6962123wrr.10
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 16:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lu+GPEjBrFzcntIvqN2MvrwSRBJeM89qqxS4pPjQdlw=;
        b=FnFqjfmrhNfim5VfIf4fpeJ1BE9lzACqAIcE0fBAcgsVRUGgS8uzpIGer6HBFaoLsk
         5rr4H+jhvCKdYbDWi8lvhJ02jgudbIxlpZ1LHBzPk9nyQ1PyjFBLLpktzd2vn0PSYyNE
         D/1IXe5T+s/cevtbtjLkaDPoxXcTFULR7GCXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lu+GPEjBrFzcntIvqN2MvrwSRBJeM89qqxS4pPjQdlw=;
        b=rLTWPeY/njrys/FsO09JZtZHYfM7dkV6UE9+W3qWDYDiAG+vI+xA5vQsP97aTMEbC9
         6+JyQ4/UGXLZckt3SpAgmETYxONVbgCQZly7VfaZEpPfqn6e7m7WPcu1zV/tepZDE4OS
         avHYenVObQQYGm2JH/pi3ElPYnFGLJtEzeoWFRJG5bmE6UURxldtq9d2FeyfCXgoopQT
         7iI9iCEANgvZGgfLDyjBc6LDfyZdv7xgwgNn5GQAxW6qP5DN0Jd+3+FgIL9KMOH+hqYy
         Gn9Eil7RrE7oKQt/EPAjd0PRclma9OE2RauVSNTXU+EtWln2xkefEt6RkVBftKhCiTPf
         Og2w==
X-Gm-Message-State: AOAM533FxNfie1BAjTKFQFkCj9br087mwfPA/Xh74xGRY0i1ksG/tuOk
	4RGw4UoiXHK08Sw9xlnzI5vR6Q==
X-Google-Smtp-Source: ABdhPJzHU7G0uhqKDBZ/xykuj1L7c7rHo5JlfI2bdNaED713YEZHT1Saiaw+tueVuNiGh2a+x70/IA==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr11496248wrv.92.1608422926290;
        Sat, 19 Dec 2020 16:08:46 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id r15sm19524140wrq.1.2020.12.19.16.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 16:08:45 -0800 (PST)
Message-ID: <be687b25420f499597616b317de9e8e6d6eb8bb0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Shachar Menashe
 <shachar@vdoo.com>,  openembedded-core
 <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Dec 2020 00:08:44 +0000
In-Reply-To: <DBBPR09MB47482872A1EB65B9A9502107A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
References: 
	<AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
	 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
	 <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
	 <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
	 <DBBPR09MB47482872A1EB65B9A9502107A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 19:04 +0100, Konrad Weihmann wrote:
> 
> On 19.12.20 18:58, Richard Purdie wrote:
> > On Sat, 2020-12-19 at 18:53 +0100, Konrad Weihmann wrote:
> > > On 19.12.20 18:36, Richard Purdie wrote:
> > > >    PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> > > > +PACKAGECONFIG[no-tls1] = "no-tls1"
> > > > +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
> > > >    
> > > >    B = "${WORKDIR}/build"
> > > >    do_configure[cleandirs] = "${B}"
> > > > @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
> > > >    CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> > > >    CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> > > >    
> > > > +# Disable deprecated crypto algorithms
> > > > +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> > > > +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> > > > +
> > >   From my perspective this breaks backward compatibility, so I would
> > > rather have them all that as optional PACKAGECONFIG fields (which also
> > > does make it easier for ppl, still relying on one of those algorithms,
> > > for whatever reason, to re-enable them) - with the current approach all
> > > one could do is to override it with a bbappend - and tbh letting ppl
> > > have bbappends for this recipe, doesn't sound like the best idea in the
> > > long run to "enforce" any kind of "security" or "hardening"
> > 
> > Having it as a variable does mean you could customise the variable and
> > doesn't mean it has to be done with a bbappend, it can be set from a
> > distro config too.
> > 
> > I'm not sure turning each one into a packageconfig is going to be more
> > helpful compared to this in practise...
> 
> I'm not sure I follow, as this is a "hard" assign - if it would (in 
> theory) a ??= assignment, yes then it would be fine. Still that leaves 
> us with a not commonly known variable, while PACKAGECONFIG is more 
> widely accepted in 3rd party layers/distros from my experience.

You could do various things to this from a distro config, e.g.:

DEPRECATED_CRYPTO_FLAGS_pn-openssl = "xxx"

or

DEPRECATED_CRYPTO_FLAGS_pn-openssl_<distrooverride> = "xxx"

DEPRECATED_CRYPTO_FLAGS_pn-openssl_append = " extra-disable"

DEPRECATED_CRYPTO_FLAGS_pn-openssl_remove = "add-me-back"

so I'd say that its not a particularly "hard" assignment?

We could make it a ??= but I'm not sure it would change much practcial
use as it would almost always be with an override of some sort?

Whilst PACKAGECONFIG is more well known,the variable name here may
actually improve readability...

Cheers,

Richard





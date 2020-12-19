Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.12379.1608400737671347311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B5DVZQ1K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id e25so6616524wme.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dvUwU04rc3t/KTFaO01ZWv8g1gWV5jEDubrwoyvxOxs=;
        b=B5DVZQ1KPrqQW4eSOLJbhUmDCpbFtlVbrUh7jGps7LVyV8CWFRNLJPgkl/59u651mu
         NRWE4DXtAoWMyQatIc/i/SPVHWHG9jUPJeRBvy4grN0vEk39AWNmUvYn9JgSha0DC/X9
         3x4RI7laoJxtuPR60Ov4AXe34DIA2oO+BaeSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dvUwU04rc3t/KTFaO01ZWv8g1gWV5jEDubrwoyvxOxs=;
        b=CeU21p8V28OjfGe+maclspAKoC0OMHcdLLRB1tICSQdo73soNjI7ioryuzlJAncupn
         EQ9yan630/iuvw3FhtabmNWaWQll0Ts49s9cSxALA5t2LsypAiAFOPhx8pDkmOgOJ62B
         JFMK5phLccxosAhXe0cK1g/zlW1B7dmcM/QQgHYxA9xi8/Qidbv+hEtiqaPzKHQLQj4S
         M8ygzr8VhCAhsb5K4xnNGF0EC/mKxGHoWObatZ1LUW+hJXabVjFbfWX/gvewOkVNcL6J
         lfJW6xZrbQvIS53dy84C9eArqhcRM9iSRtTZDtXaZSI9aNL4djJBMEBN+nPwHzrnQj+9
         NHKg==
X-Gm-Message-State: AOAM530v3DZYKLZ5lAuM7YUfAlFc632q3mm9ffjlmrD8xXVutcNnOj+q
	Km+Bw/KHKX7TL85lorava+PdIw==
X-Google-Smtp-Source: ABdhPJy1nPyzbRLCaUXd0Vm0rjm2fL+0IlaBHi1Uy6yUIO3vjY0QI/TQZ1pw3RSm5um6rQMnYjaEqg==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr8869701wma.141.1608400736147;
        Sat, 19 Dec 2020 09:58:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id u66sm16439114wmg.30.2020.12.19.09.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 09:58:55 -0800 (PST)
Message-ID: <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Shachar Menashe
 <shachar@vdoo.com>,  openembedded-core
 <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Dec 2020 17:58:54 +0000
In-Reply-To: <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
References: 
	<AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
	 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
	 <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 18:53 +0100, Konrad Weihmann wrote:
> On 19.12.20 18:36, Richard Purdie wrote:
> >   PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> > +PACKAGECONFIG[no-tls1] = "no-tls1"
> > +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
> >   
> >   B = "${WORKDIR}/build"
> >   do_configure[cleandirs] = "${B}"
> > @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
> >   CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> >   CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> >   
> > +# Disable deprecated crypto algorithms
> > +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> > +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> > +
>  From my perspective this breaks backward compatibility, so I would 
> rather have them all that as optional PACKAGECONFIG fields (which also 
> does make it easier for ppl, still relying on one of those algorithms, 
> for whatever reason, to re-enable them) - with the current approach all 
> one could do is to override it with a bbappend - and tbh letting ppl 
> have bbappends for this recipe, doesn't sound like the best idea in the 
> long run to "enforce" any kind of "security" or "hardening"

Having it as a variable does mean you could customise the variable and
doesn't mean it has to be done with a bbappend, it can be set from a
distro config too.

I'm not sure turning each one into a packageconfig is going to be more
helpful compared to this in practise...

Cheers,

Richard


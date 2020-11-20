Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web09.848.1605894210697282404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZzoyguVa;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id v143so9683680qkb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E7Hw0pIFIwOp1rOB+ZV8oxMu4WHDP7RZhn04uwVp8QA=;
        b=ZzoyguVaV5wx87NoWFihjj2IfAC6V21KWrdBYjp5gQaowjux7fDehzw7MgbajCFIx0
         z9+/iRJ1mUMfdIJAWLE15bdjoAoUVyOJO93MDNDajr8FOmpiFXj2L001i9i1mvLLgspi
         ILHLPxmifiCaJ+jVpzJ2Fm1jOU17XVrklXh4XonqO7Cc3ohk1t7vJqnk6WrVSzoHbsYU
         GHnVSNccIxLzUYf+skC5wpDMHIWmoqj5yPXbBgrJol9E81jqy5UrwN8LnUksFg6D9X3o
         YVQNTQKZcjoKM3gW+xwwvS6A/2udTI/TcD0sA72hO2FB1WCvpwAP3zQRrBOZz4MUUlTH
         w+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E7Hw0pIFIwOp1rOB+ZV8oxMu4WHDP7RZhn04uwVp8QA=;
        b=cGHs4R2E0SoPOKz8iwh61aRX3c/JH+FeS1Vx+Yign+JWED2lONX9qvFipecnlaA0iO
         veKG3DSH/vCIzOI9PZINRHbqomjR80s94HszsLoGxBYMiihkBIC087LlYDbJNMrAkUmn
         8i60/x0l9teXxe8CkH+V8LTg0H/NstSSAYESu3rolcPZXGES9qQ2CvM4aWfLOvpQRKhM
         O9/ndL/YHlGI6UX15KSfBwMRo8MU123bltXSXaNp/VX0HheQduT7Jmm1CpHcOeyUke2f
         WlojUqEpP2+x/S3BU/SnGT/aOwyscxNURQNl4kJ5xuK3J98thkommzQtTJEj3BFFURFJ
         BSyw==
X-Gm-Message-State: AOAM531DshNSbKAWXjOCCtFx+dvq4tzy0H2OV4ExCdSenGPkFcoO1jCx
	Q5+FwNkg+Gv+GI90giw13QoEqF/247VmFGMlXlM=
X-Google-Smtp-Source: ABdhPJykgl4Zg7G9BzTO4C1JXle12Lv2QKk7HEsQmqqJOw1PW/C+L3oqeCdUhLKYJikIqfCUthsHae309YdbQTADM0E=
X-Received: by 2002:a37:58c1:: with SMTP id m184mr3805409qkb.9.1605894209795;
 Fri, 20 Nov 2020 09:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20201120172950.1619754-1-raj.khem@gmail.com> <20201120172950.1619754-6-raj.khem@gmail.com>
 <8db9491c541ccc1da36f53d971b04f0ed2277888.camel@linuxfoundation.org>
In-Reply-To: <8db9491c541ccc1da36f53d971b04f0ed2277888.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 20 Nov 2020 09:43:03 -0800
Message-ID: <CAMKF1so2O-NbHfw2-O86Dcmv6ALgJ5hmqosnzXmgi-0AbgOFkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 6/8] python3-pytest: Add recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 9:35 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-11-20 at 09:29 -0800, Khem Raj wrote:
> > +RDEPENDS_${PN}_append_class-target = " \
> > +    ${PYTHON_PN}-attrs \
> > +    ${PYTHON_PN}-debugger \
> > +    ${PYTHON_PN}-doctest \
> > +    ${PYTHON_PN}-iniconfig \
> > +    ${PYTHON_PN}-json \
> > +    ${PYTHON_PN}-pluggy \
> > +    ${PYTHON_PN}-py \
> > +    ${PYTHON_PN}-setuptools \
> > +    ${PYTHON_PN}-six \
> > +    ${PYTHON_PN}-atomicwrites \
> > +    ${PYTHON_PN}-importlib-metadata \
> > +    ${PYTHON_PN}-pathlib2 \
> > +    ${PYTHON_PN}-wcwidth \
> > +    ${PYTHON_PN}-more-itertools \
> > +    ${PYTHON_PN}-packaging \
> > +"
>
> Do these exist in OE-Core? I think there are a lot of dependencies
> pytest pulls in? I don't think this precludes the move but I'm not sure
> the patchset is complete.
>

hmm not all. I wonder if it makes sense to move these recipes as well
to support pytest in core otherwise
I guess I will just move the numpy dependencies onto PN-ptest in numpy
recipe and live with that or packageconfig it out.

> Cheers,
>
> Richard
>

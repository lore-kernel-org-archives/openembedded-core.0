Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.10855.1606833063660987863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 06:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=eR98VMBf;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id y18so1361554qki.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M7vsqvlSO1TTX5q2+B5urz40d83QyB1DtQ4rTKF8tcU=;
        b=eR98VMBf80JoE6u8bk66nr4TeEdJzNXFx90bwxzZVhX6loq3FeCJ3X6CjfPaLoa8tg
         x/xzBwTWR0zIS0PvFDBWmPmiEb1N27D08i/R6euIqvaxPpf14/NJ8tZhBE84kOQjPLr0
         8QWTs46T4fkNKMqafbR2C+cR5QRGzA6QrRI4GXL3K+KF1H03sMt2a2X0/mp4tkGMwuU0
         15LpAjnhpXPbTAec0AVbC+UPDo/S8XdYANeiylQxdfat6OBMV7R/ZWw97x2X6xRNX62K
         LXBJZgI13fjMup24FAouZeTF1Q95VgynQ/g6j7EWHI0pPIaf36u5LvmXEKmsRPTmgqjO
         bPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M7vsqvlSO1TTX5q2+B5urz40d83QyB1DtQ4rTKF8tcU=;
        b=pzF8yZ8OILrCCNmnfh7I5ny2fJTNHs1i/PtPvEfSVDumOnTIUjAu6qcJ5leSzU75Ep
         mwpOgjmAhORf+3RKN/m3r7lK+KcwZZH2GTzS+zxdIhjz8Gq+knCeWMdZVZMgdJgsAY5I
         XHNb47tORAPkSwiEpRLBhipMIL2eNrvuhNzlg3phdwMkCoAOZ8n9vUuFcZQGsTxTYzRv
         /Y8EO7nTqzxvXqRXTeioDsCdekbQD3MrthN8b4RBCav8MKwd++m0pQpoMLBhK1eNkIPn
         SIw5kzI9NBChUIlqGw3YV5PfdVWYBwk3curzfYrUtWWDq8RwlV1RpfXJoSnWrvn6c123
         2p0w==
X-Gm-Message-State: AOAM532C9f3J5IWWz2kJ1nKH8PUVwG0dyd54c0vT+ygnGlWl34VwGpgd
	IwKzT4RFpsM8evtqwX41bDN3GXe2p7NLaedP
X-Google-Smtp-Source: ABdhPJzUQcQqc4VJvRvOiKmUVHjXceQlY/BY+fOYiacx7PpOGFGU0x0pg/85SjirfE0EVepERl+Itw==
X-Received: by 2002:a37:a58e:: with SMTP id o136mr3136248qke.290.1606833061155;
        Tue, 01 Dec 2020 06:31:01 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id c4sm2158904qtn.39.2020.12.01.06.31.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 06:31:00 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f54.google.com with SMTP id x13so860387qvk.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 06:31:00 -0800 (PST)
X-Received: by 2002:a0c:fb4a:: with SMTP id b10mr3394896qvq.1.1606833059743;
 Tue, 01 Dec 2020 06:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20201201034326.11447-1-okaya@kernel.org> <2d6b4cd69ed05454b7936f0a3a1c320db1c56558.camel@linuxfoundation.org>
 <CAP9ODKokNQw_HmiX6MC2wbB47tapHXC-9Za5tKzkbbtYsFHr6A@mail.gmail.com> <0976a2df7109d102b71033dc444ba9414670d4aa.camel@linuxfoundation.org>
In-Reply-To: <0976a2df7109d102b71033dc444ba9414670d4aa.camel@linuxfoundation.org>
Date: Tue, 1 Dec 2020 11:30:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoT12CUNKJnqT_edYu3-Ei-zganQzskRx47OLrJWwXcEQ@mail.gmail.com>
Message-ID: <CAP9ODKoT12CUNKJnqT_edYu3-Ei-zganQzskRx47OLrJWwXcEQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] procps: split into binary subpackages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Sinan Kaya <okaya@kernel.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 1 de dez. de 2020 =C3=A0s 11:15, Richard Purdie
<richard.purdie@linuxfoundation.org> escreveu:
> On Tue, 2020-12-01 at 08:29 -0300, Otavio Salvador wrote:
> > Hello Richard,
> >
> > Em ter., 1 de dez. de 2020 =C3=A0s 07:37, Richard Purdie
> > <richard.purdie@linuxfoundation.org> escreveu:
> > > On Tue, 2020-12-01 at 03:43 +0000, Sinan Kaya wrote:
> > ...
> > > I am starting to get a little worried about the direction these
> > > patches
> > > are heading in. How much of the system are we going to split into
> > > individual package per binaries?
> >
> > I am wondering why this is a concern for you? If we keep the old
> > package rdepends on the new ones I see no problem in allowing this
> > granular packaging.
>
> Taking this to a conclusion its heading towards, most recipes
> generating more than one binary would end up with this splitting code.
> I don't like having large blocks of python in each recipe and heading
> that way means we should probably change approach somehow.
>
> My worry is that simpler recipes are easier to maintain, test and
> upgrade.

Maybe Sinan could try to rework this and move the python code to a
class reducing code duplication?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

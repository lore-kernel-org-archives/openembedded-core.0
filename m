Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web08.11301.1606835234141978870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MStQ/yL9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id r3so3133080wrt.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 07:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lBEvMzzu4m2dsm9qyyjelimRtoTmqcG1Vs4+KWFonSA=;
        b=MStQ/yL90+sACLm8+5y/Cstg3+/ATlMntHRPe6oNdMnoInkbsTrkVmiXDNT9Q/kI9f
         nFtDoV1Vd8UlNsRyA8HCHhtoPUO4MKXJMGIKgW+NEGCUNNIz7aBbTwDxHoujjKjIB/Tr
         3Qk2gWhlAxieml36BU+J+FmpxWcBEr1NanDok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lBEvMzzu4m2dsm9qyyjelimRtoTmqcG1Vs4+KWFonSA=;
        b=SiOCNCGhzyoeUdMUMGC40X+Lu5vhLRSWSX9/QTuuWnM9eUlZyWvobQg0rapP9Jv4iM
         6OQUw2GIsESwieP97rrYIAjUo9v4u7QIngvNNdPFb7u8xszzRxaxtF/BbeWRUnjuFDdB
         zYGQS18x35KfMg2JYLQLX2it7F2Rq68qENxDOVGh7iaMJLksbNciiYCPcStNdZmSHeB3
         K03zmJOIgGNv1t6/MXlOSnGJNoAGDIEBERaQZez3E3XnCShiHcplO29cs8gvLb3p0u9i
         w+6CZWRG7LhHWfMjJEDmuu5iElIqY0xHcWw/ix6TLDEnRDTT+7PbfAj/JRaS5hjL+dL/
         NWuQ==
X-Gm-Message-State: AOAM533dZvYP7rk4cFFmTLIhlv+KoCBu+cNhtIE5Xp0znZ6ElCFEPL2P
	G5UNYbGt+VzNPfCvlJtpP4JooA==
X-Google-Smtp-Source: ABdhPJwXGqJr4pXHHPb8TVEtsy0D4YJbuGgmG1cChxpORMFnccWgdg3V+LVemDmU3MITzEyH9/RbWg==
X-Received: by 2002:adf:fc8c:: with SMTP id g12mr4397419wrr.355.1606835232582;
        Tue, 01 Dec 2020 07:07:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id f3sm3327669wrx.10.2020.12.01.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 07:07:11 -0800 (PST)
Message-ID: <5b161d2cc31540dc73c42df6068e0ef7f69574f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] procps: split into binary subpackages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <okaya@kernel.org>, Otavio Salvador
	 <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Dec 2020 15:07:11 +0000
In-Reply-To: <63d2d693-dece-0c94-87f9-7965cbb56686@kernel.org>
References: <20201201034326.11447-1-okaya@kernel.org>
	 <2d6b4cd69ed05454b7936f0a3a1c320db1c56558.camel@linuxfoundation.org>
	 <CAP9ODKokNQw_HmiX6MC2wbB47tapHXC-9Za5tKzkbbtYsFHr6A@mail.gmail.com>
	 <0976a2df7109d102b71033dc444ba9414670d4aa.camel@linuxfoundation.org>
	 <CAP9ODKoT12CUNKJnqT_edYu3-Ei-zganQzskRx47OLrJWwXcEQ@mail.gmail.com>
	 <63d2d693-dece-0c94-87f9-7965cbb56686@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-12-01 at 09:39 -0500, Sinan Kaya wrote:
> On 12/1/2020 9:30 AM, Otavio Salvador wrote:
> > > > > I am starting to get a little worried about the direction these
> > > > > patches
> > > > > are heading in. How much of the system are we going to split into
> > > > > individual package per binaries?
> > > > I am wondering why this is a concern for you? If we keep the old
> > > > package rdepends on the new ones I see no problem in allowing this
> > > > granular packaging.
> > > Taking this to a conclusion its heading towards, most recipes
> > > generating more than one binary would end up with this splitting code.
> > > I don't like having large blocks of python in each recipe and heading
> > > that way means we should probably change approach somehow.
> > > 
> > > My worry is that simpler recipes are easier to maintain, test and
> > > upgrade.
> > Maybe Sinan could try to rework this and move the python code to a
> > class reducing code duplication?
> 
> The problem I'm trying to solve is I only need ps file out of this
> entire package. Everything else in this package is useless for me. I'm
> sure no-one wants dead code in their system especially if they are size
> constrained.
> 
> Ideal solution would be to have --with/without-foo support upstream
> that we can configure with PACKAGECONFIG.
> 
> I'm happy to look at other options if there is an alternative.

The question is how many other packages are you going to need just one
thing out of?

You might want ps, someone else might want something different. We've
had this problem a lot with util-linux and e2fsprogs so we split those
in the end as the patches were getting painful.

If this is a widespread issue we might want to have a generic class,
kind of like lib_package but for splitting the binaries into individual
packages.

I just need an idea of how big this problem is going to be as I don't
want to iterate over half the recipes in oe-core over the next 9
months! :)

Cheers,

Richard




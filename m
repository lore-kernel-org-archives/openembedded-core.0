Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.48570.1590493057223869297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 04:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=APzuUBWv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id n5so2891904wmd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wx8tpQRuAF/Rt966ew7DbN9URhhcFCwqfyMpzlh8CWg=;
        b=APzuUBWvfTywQyUGVBfMVkdHLCcbpbHoRZnWgZvd4TPSRirEJCbxkrsthFyxtIjxHu
         Z42lzoy1htSFT4+0+kCZhi+iDnwtwhLywgNf0ymdmZh5SiBNLlgXq9CQBQufQ5Of+ard
         0vweoULSH/nwbsC61aIVW1dPFcS7MRn/HWawE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wx8tpQRuAF/Rt966ew7DbN9URhhcFCwqfyMpzlh8CWg=;
        b=AQn2wYrEf28evJ+ifCtEUXDUWZjhvTE8fhoyEaGqbvYCnTrLJXaIYaps6Yxy587/vk
         dEgJXFXZaWNOT2SfOC7Rf1M7UovuaDAcj7o/JWOsWmF8DhdrNWfUjaJuu//4UAsjBUl1
         ItWAuwc7vZ25ABL+TA3U0hhejELBawoNBvqEKGbMNxe1FRXTNllaw9UkIMse927vd1fi
         B1cpRSLusLmdiDUHMjhmj1bGxe8Zt/L466D48RIF0UPVN51SbRPaBiSlqcM5ySebV0Fz
         ndTG43EAsEghNwKYeUwti9qlw4ZKIdI1gKKEl1P2s5goc4rAeXK88QWqAtM/MGwitjYS
         8Uwg==
X-Gm-Message-State: AOAM530Wk9fgcFznzYI8WG8/j9TojrqLVCbkBNjAaQ0u7jyhbq9QNb3K
	DydwAzx229cMyYy+sab5MIh1Bg==
X-Google-Smtp-Source: ABdhPJwbAaJhNiu8YyjWMdMYKkskM8Y3QxpFHrm6iT0HiK5sy/OtMcWKS1gZraBa/H4hBUTGDN5WqA==
X-Received: by 2002:a1c:7f44:: with SMTP id a65mr1054038wmd.53.1590493055292;
        Tue, 26 May 2020 04:37:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e5sm13774143wrw.19.2020.05.26.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 04:37:34 -0700 (PDT)
Message-ID: <5ce01ee5048a9f5c0e11889cd6a9ecb150420f2f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Date: Tue, 26 May 2020 12:37:33 +0100
In-Reply-To: <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
	 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
	 <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
	 <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-26 at 13:20 +0200, Matthias Schoepfer wrote:
> Hi Richard,
> 
> On 5/26/20 10:19 AM, Richard Purdie wrote:
> > On Tue, 2020-05-26 at 10:12 +0200, Matthias Schoepfer via
> > lists.openembedded.org wrote:
> > > From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> > > 
> > > With the exception of dumpsexp.c, which is GPLv3, all other parts
> > > of libgcrypt are GPLv2+ & LGPLv2.1+, BSD or MIT or other "permissive"
> > > licenses.
> > > 
> > > If libgcrypt-lic is not set to "GPLv2+ & LGPLv2.1+", image creation
> > > will
> > > fail with settings like
> > > 
> > > INCOMPATIBLE_LICENSE = "GPLv3 LGPLv3 GPLv3+ LGPLv3+ GPL-3.0 LGPL-3.0
> > > AGPL-3.0"
> > > COPY_LIC_MANIFEST = "1"
> > > COPY_LIC_DIRS = "1"
> > > LICENSE_CREATE_PACKAGE = "1"
> > > 
> > > Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> > > ---
> > >   meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> > > b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> > > index 4e0eb0a169..fd40cdcf83 100644
> > > --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> > > +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> > > @@ -7,6 +7,7 @@ SECTION = "libs"
> > >   LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
> > >   LICENSE_${PN} = "LGPLv2.1+"
> > >   LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
> > > +LICENSE_${PN}-lic = "GPLv2+ & LGPLv2.1+"
> > >   LICENSE_dumpsexp-dev = "GPLv3+"
> > 
> > I don't like this approach at all. Its obviously inconvenient if your
> > image uses only the non-GPLv3 pieces but this doesn't change the fact
> > that the main package license does include GLPv3 and ${PN}-lic is right
> > to include it. You're breaking the metadata to fit your use case for
> > convenience.
> > 
> > If you're excluding GPLv3 things from packaging, you could then (and
> > only then) justifiably adjust ${PN}-lic to a different license so the
> > code should be doing that, not changing the underlying metadata to suit
> > you.
> 
> The question here seems to be, is the GPLv3 License itself GPLv3 
> licensed. I followed the approach Khem Raj gave me on the yocto mailing 
> list. I do not like the approach either, but lack a better solution. In 
> this very specific package, only one .c file is licensed GPLv3, even the 
> COPYING file claims, everything is GPLv2 and LGPLv2.1+.
> 
> dumpsexp, the only GPLv3 file, is not even in the package by default. 
> The line
> LICENSE_${PN} = "LGPLv2.1+"
> pretty much tells the tale here.
> 
> Also, LICENSE file states, that there are other licenses also involved, 
> BSD 3 Clause, Public Domain and OCB license...

I think we need to be really clear about what the license of ${PN}-lic
means.

That leads to a really good question, which license is the license text
itself under?

I've asked this on our licensing list to see if anyone knows.

Cheers,

Richard






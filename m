Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.28340.1612741065947341984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 15:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SVtzLej/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id j21so9096006wmj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 15:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=w1N668rOP25i4aiDKYlSeCd7BaI3/arNnBfDlUsTYJw=;
        b=SVtzLej/wSfjcizr27AmZooqsKa50/e14S3uXM17AuhMXhb3wATn6Yj84TAs2d/6iA
         8sG8fUqVm7gJc2qjYUjhPY5XErm+Ejhg06OPhxLqmws3aaQA2S4q8wyHrdXzTf/hHKg1
         xw8VV4LziHO6OphiVw7yJnsmfU070kJcQpQNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w1N668rOP25i4aiDKYlSeCd7BaI3/arNnBfDlUsTYJw=;
        b=j1xcbnuoT8VGriXQ+LiAvJcdmQu+jvFurIDWsH7AGiM2/ASdRynUxmZQGTfcq2yqtk
         ZJOZNcL5jJtDj8BugRBeZnfl2B3OJIM0MPZsNT3Oql5dOuRpW4BiYbrJ+hijN+nCY93U
         K0L4QNuHbGsOMB6O2ztWVsDvOd/KamUg9QG9LS/iGScdcA9g2OUQwpDCaibkuxKI2nWh
         cOQ+YcEdiwguTQagOWx6uX15bYdUy14iWg6UtJl3wTPQKTPVj92Sv+O+LiixNjH1R/es
         5D/iewo1ggo35GL6EPJqjHdgHuhAtLcO1Ct7PmwKv32tVnYwaKDIWR0zawMljhrfKARo
         DEEg==
X-Gm-Message-State: AOAM532OJpcGk23c2LdBNlfedj3SMjQa3fjkg7Lv5VBOAkyF0PnxRsP1
	WgvXIJBJWpl8oFQzcezdpOCdow==
X-Google-Smtp-Source: ABdhPJwYAgtf/Zc/Iqw2fopF393HXUfDTgrWvz8P5y8yH6I5OvkHDTgN+nIvmJeMJPF14kZ/qwfr0g==
X-Received: by 2002:a1c:9845:: with SMTP id a66mr12029825wme.121.1612741064339;
        Sun, 07 Feb 2021 15:37:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff1a:4654:ede1:462c? ([2001:8b0:aba:5f3c:ff1a:4654:ede1:462c])
        by smtp.gmail.com with ESMTPSA id t2sm11127251wru.53.2021.02.07.15.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 15:37:43 -0800 (PST)
Message-ID: <c4eb364acb17db6e7e38a233e539ff0a003a6cb1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] shaderc: add option to skip building the examples
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sun, 07 Feb 2021 23:37:43 +0000
In-Reply-To: <CANPvuRkS1xGjy3TL3-dtLkoVS9LBPYoQKUW2wXaGAkGVzzHVeg@mail.gmail.com>
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
	 <20210207180504.1552900-2-quaresma.jose@gmail.com>
	 <f772741f2969f3b3e3ea117fb35c8a39a9a14756.camel@linuxfoundation.org>
	 <CANPvuRntP03A8U696D+JoBVtvK=Kp-Dj08Eae5=Sx=CuqpTP4g@mail.gmail.com>
	 <5bd02696955631f07d754eb6a009a8f6f38ce27c.camel@linuxfoundation.org>
	 <CANPvuRkS1xGjy3TL3-dtLkoVS9LBPYoQKUW2wXaGAkGVzzHVeg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-07 at 23:13 +0000, Jose Quaresma wrote:
> 
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> domingo, 7/02/2021 à(s) 23:00:
> > On Sun, 2021-02-07 at 22:56 +0000, Jose Quaresma wrote:
> > > Hi Richard,
> > > 
> > > I need some help to analyze the log of the compilation.
> > > where can i find it? is it possible?
> > > 
> > > The compilation log mentioned on
> > > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1835
> > > are
> > > /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-
> > > linux/shaderc-native/2020.4-r0/temp/log.do_compile.199121
> > > 
> > > On my side it build fine on x86_64 so I don't understand the
> > problem!
> > 
> > That log is included here:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/3034/steps/11/logs/stdio
> > 
> > or here is another:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3056/steps/11/logs/stdio
> > 
> > 
> 
> I have seen the log of the bitbake but what I liked to access was the
> log of the compilation in the WORKDIR of the shaderc.Is it possible ?

That logfile is printed onto stdout so the log in that file is what you
see printed on the console in the above logs.

Did you click the magnifying glass on the top right and then search for
"error:"? You should find the compile output there.

Cheers,

Richard






Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.20996.1590178345287993411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 13:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=CuZzahv6;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.194, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f194.google.com with SMTP id i68so9319549qtb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 13:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=S+HR17XqR5xPODe//EjPbSOkVOUysAASp/1JHCoiv1o=;
        b=CuZzahv6UFGfJioqTXmHisnNMDySRRjLvSxBa4DofgKOajeC0PCQQWzDpIzMRT/9wo
         LcOfH9iO7Zq5JrEFXqcI1fstmy5YxM5Cd3YGXJ/elpaiU4OG/1xuAbjWKnM2gg8GPNn1
         wqmMRfrFuGBibeDL0JDhK7VsQnPUmtaANaoKHVXfrF1XsI/SLhbjjxq9kxpv5zhYjlqI
         hIG+VLlvV54SuvKW6m8tp+NbGySt3hS+bdpUAHyP0dRjDDmif1zHUfW4KSvJJ3uH78sa
         1cKldxYKezaEBMxN8WSDOJP7EDWehf1tn6zYgxhVvqih507iNDkKzdDh6ChFXWuhsMXk
         G0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=S+HR17XqR5xPODe//EjPbSOkVOUysAASp/1JHCoiv1o=;
        b=jyk9P+3LkDI/CXOG9BpH8fnbGipxq/Xe60ORdDcHJ2qovuiSVvCBvRMq1SMFTnorAU
         JvctZeviyhVZs7pp7n7oYYw6MGQaQiR7asQdrK5l3BUm0tJ/M2Pmh6CsIABaR0oqm06F
         ejLgrTWC69bEvKZz+TxutQd4t42EUJvtsd9HuUWJDNjrQqm0WUiSmJ11EqRF8/ZQcWBj
         HeFxOqrTC9fWzQ0tnhEhE1NYrrAHyLw0FRdlznX7nE2av6VN/m76kr+DrpbxnP+0X7Bd
         EezJLCkyu432g2KCIvTT3BMC5OiyRS2JabPi+RuTdeOQJGYO1xwKJQw2yBTjyF7EGGTr
         rdzQ==
X-Gm-Message-State: AOAM533W80qHzfecgjq764ZaLBbQhKNIkobW+FS4seyetKYdtmyq2Wbo
	l5oejXGjniwC2YbvXwClMcFkRMcZwE7fMA==
X-Google-Smtp-Source: ABdhPJyvVaktPESBe3AvRnOIMu7Wrh6hWI/NLKLYQDtLjoP7OP0eN1NMg45+Pv0dXdRWr7tUp6XK4w==
X-Received: by 2002:ac8:36e1:: with SMTP id b30mr18591702qtc.242.1590178344136;
        Fri, 22 May 2020 13:12:24 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id s201sm3197153qka.8.2020.05.22.13.12.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 13:12:23 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f171.google.com with SMTP id v4so9327297qte.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 13:12:23 -0700 (PDT)
X-Received: by 2002:ac8:7354:: with SMTP id q20mr8558303qtp.249.1590178342787;
 Fri, 22 May 2020 13:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200522022237.3568393-1-otavio@ossystems.com.br> <cec06eb1-084c-84e6-01f2-eae056f9e47b@gmail.com>
In-Reply-To: <cec06eb1-084c-84e6-01f2-eae056f9e47b@gmail.com>
Date: Fri, 22 May 2020 17:12:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKot+_zOv83z=jeP6A+bLLSj3XfGji3z9bsn1=R63P1pdg@mail.gmail.com>
Message-ID: <CAP9ODKot+_zOv83z=jeP6A+bLLSj3XfGji3z9bsn1=R63P1pdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] go-mod.bbclass: Add class for `go mod` support
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2020 at 2:23 PM Khem Raj <raj.khem@gmail.com> wrote:
...
> > +# Copyright 2020 (C) O.S. Systems Software LTDA.
> > +
>
> Do you also want to add license on top along with copyrights ?

It is same as OE-Core, if desired, I can make it explicit.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

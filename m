Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.22214.1590182979225948637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 14:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=JJGCBKAb;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.54, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f54.google.com with SMTP id v15so5422510qvr.8
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=842cDc/uTtbI4fLtfAqASI5syNdydbjJ8nKyA+tOZUs=;
        b=JJGCBKAbOZRoNHq4wa5n1L/wFKVcLVxCi/Aj1ej/fqP+JALP3GSIvdGIo++8caLtF+
         v8xh0VxHM6Pf+j0eoYmuHNfwB+TOW3pNkeli5ji1yGW3+EwE3jPl/8WS/mda44cdg63r
         wO2YJgSZHQxqfChau0zZXF4Hq046BkV28/IeI5ouvUAr6bGlqYI76NJDU9bSxuCS0R/Z
         oU5a+IoAGWmKCGOtkgxhRgikm/8FT+0YwXwqmhqiMQNKp1nrU/pF/5WA4m69tnu4VCxt
         OblRbNANhzaCTuwYPcTOcLq9oy8saR9iZI/6PS9dKanIRCIoMCUbkWmYqbpZ7o46mL+1
         2spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=842cDc/uTtbI4fLtfAqASI5syNdydbjJ8nKyA+tOZUs=;
        b=cn0t2k272chFqs6n+D9AszB54bPOWAn4TI6t9PyutEBm6t3ZApZf0YRnTqwCIA6MyM
         PbMR1At7zDbNyFdhzF/VgBZXv/V3MaqL2G1AH8wrwTG8ImAZWOmEcIHRJL2gJYv2i8RX
         6XaTv2NRmlSVUlsz1ZrSBNilDo/+kaafwMQ6LlRxsDPWoqeoEken9tRJspgJ9fqsX0x1
         HksvuGR4HpPw7Wu782tpwALgKhfA/GxyAdumYIxP3fBxcFkpg7xNW+f0IPaQaFb+ltQG
         K9J/4tcCM+aTL82hn+adqdR6ckfedf1PKi17zudjdgjIWNyNuj21/1hjIcT3oaUMf9B0
         PyjQ==
X-Gm-Message-State: AOAM531FL3nHwYmly6pctG/+aGL6T6tBsAiC/JTypEp9BZuyJzENfe+g
	NiW1C5mc6j2O+am3R3twpH4PECAtr2nVew==
X-Google-Smtp-Source: ABdhPJzhIiPtazFxfJH/6o1SgdX4VKZupxNv5kxViC0KxK6z0oNrs0l6JLoOr7cViYsu98zBSp3YsA==
X-Received: by 2002:ad4:408b:: with SMTP id l11mr5854839qvp.156.1590182978100;
        Fri, 22 May 2020 14:29:38 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id k57sm9114751qta.20.2020.05.22.14.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 14:29:37 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f173.google.com with SMTP id n22so9426702qtv.12
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 14:29:37 -0700 (PDT)
X-Received: by 2002:ac8:2f3c:: with SMTP id j57mr17448281qta.296.1590182977058;
 Fri, 22 May 2020 14:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <Lixb.1590180524317566740.JvZm@lists.openembedded.org>
In-Reply-To: <Lixb.1590180524317566740.JvZm@lists.openembedded.org>
Date: Fri, 22 May 2020 18:29:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqnn7y=Mr+CTsnPyp2of3h=-r_3Rh5oeVeD_SPu7FQT5g@mail.gmail.com>
Message-ID: <CAP9ODKqnn7y=Mr+CTsnPyp2of3h=-r_3Rh5oeVeD_SPu7FQT5g@mail.gmail.com>
Subject: Re: [OE-core] gtest and gmock not added to SDK
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2020 at 5:48 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The gtest and gmock packages provided by googletest are not added to the SDK by default. I assume it is because the googletest main package is empty?
>
> I added an RDEPENDS_${PN} from the dependent package to fix it. Is there a better solution?

You can change the packages to have their `-dev` to rdepends on
`gtest/gmock-dev` for example.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

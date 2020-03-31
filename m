Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.1162.1585673098595884318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 09:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=kyEo1CU8;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.193, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f193.google.com with SMTP id l25so23748887qki.7
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=7ROsMPUVBJz471NL98cItHtft8oQngvhpNBawM8l+ug=;
        b=kyEo1CU8Os44GB57QyMjDsTA6+SojtWblMoQOFOgfXW/Q1FZSEC5CWbdcfpcHwfrQL
         CniiP6iKWyfghP30NSEVDeZhY47jFb4RjqhqRITcSgQrwRYjVkgvwzkfEUUvajJoL8lX
         gf3QluMu466+CUsmu9dKSweYIQnUHNdetYkgnn6//ctoo8kfxby3RB23QKL20OwieUEi
         220ShZMs6vgNo+USiR98Vdzn/2WOAM5Mr/Zxf+HaimgczNwH8jnMk2AibThYOoHKDgzG
         OF3nfpFrSCm/Yi8m0auiX55UIQWocBZoZIov6MW+Rb2rCXzzxHJDaIUQzkPD/OqsDQe+
         chJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=7ROsMPUVBJz471NL98cItHtft8oQngvhpNBawM8l+ug=;
        b=f1Ch9OL8sI+I1Ycwa2qu1DnwdOwQ4bJmYJYzlGVfCJA1LEYAJ5RMYKde+Uopbq8G2r
         QIFDxmO0WlQiS6dY4Ddr9iQ0stxJrOgmwGe9uScODcp3XjWqc6E/LrDhIFUD+rk/X8n9
         VGoKVuYIFROvwXUBqQjYTluK/swaxHaoNRqo8gctlZ+FOj9jgLxsSvNoMxF/BJrWomV8
         5diB7VagfE7W2U0F6fxTQtKkz+E22Y7MQpVwq4nlw24/Siftkc9aJf6WHeiSzdNsaFhh
         vFc+SsAOOHtTPn0lpqkfSIZT3e0SIdFI7UnYNXBqyY6l83hKuJEF6USDtRAOXurRmeeI
         EILA==
X-Gm-Message-State: ANhLgQ0mPtVPNGweSeK4D1rKduC84wZ3Dw8mrnsir/vR1MhGBujHeWty
	9BlF9cRJuK4M+9VglUTkz6VwLI+K5UDIWA==
X-Google-Smtp-Source: ADFU+vtEXH3R73UL+YCbr/QN5QXPKRKuIzLonDB/Nam9OXtyNSgsRZWlVNUVfwATm+CmaH9ExF+vHQ==
X-Received: by 2002:a37:b702:: with SMTP id h2mr5960992qkf.491.1585673097441;
        Tue, 31 Mar 2020 09:44:57 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id o186sm12972900qke.39.2020.03.31.09.44.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:44:56 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f171.google.com with SMTP id u4so23668183qkj.13
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 09:44:56 -0700 (PDT)
X-Received: by 2002:a37:b1c6:: with SMTP id a189mr5170056qkf.26.1585673096183;
 Tue, 31 Mar 2020 09:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200331151645.1030603-1-otavio@ossystems.com.br> <04006361-dc62-45a3-3cff-7f00004180e0@denx.de>
In-Reply-To: <04006361-dc62-45a3-3cff-7f00004180e0@denx.de>
Date: Tue, 31 Mar 2020 13:44:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqVEmRYzj6OOcXMjeZq-LwZgAQmSOiJ5v67NRueFBOGKQ@mail.gmail.com>
Message-ID: <CAP9ODKqVEmRYzj6OOcXMjeZq-LwZgAQmSOiJ5v67NRueFBOGKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: Restore valid default environment for running system
To: Stefano Babic <sbabic@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

Hello Stefano,

On Tue, Mar 31, 2020 at 12:32 PM Stefano Babic <sbabic@denx.de> wrote:
> On 31.03.20 17:16, Otavio Salvador wrote:
...
> > - u-boot-initial-env on deploy
> > - fw_env.config on deploy
>
> Why do we need both of them in deploy ? For making system functional, we
> just need that both files are in /etc, that is ${PN}-env must be
> installed (and then you set RRECOMMENDS). But why in deploy ? Am I
> missing something ?

This is used externally, as well as the u-boot binary. In our case, we
use this to add them to the UpdateHub package so we can upgrade the
U-Boot environment during the update process. Something similar can be
done using swupdate.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

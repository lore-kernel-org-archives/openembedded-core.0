Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.2250.1626983355720353602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LSJ4Sv+J;
 spf=pass (domain: konsulko.com, ip: 209.85.219.47, mailfrom: trini@konsulko.com)
Received: by mail-qv1-f47.google.com with SMTP id w6so289889qvh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZfTgDP93Ll3XPNFKxxJcOiYTDwbRGxUvAii/WLiPPQU=;
        b=LSJ4Sv+Jt/M5i8XZmsYTXy+14JUf9QQLrWhZwrYaqV7nk76z9zeyAOffvXDNX/qQqj
         qG1NZWgJFuLzfKjBb7eIYQv6XfDugIIz9oKzvKmEm7/vp8H7IjudSIej7tr24Y4qbUmF
         R0kXz/7X6bZybbLR9OWNKqBMVA4tXnsjZg9ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZfTgDP93Ll3XPNFKxxJcOiYTDwbRGxUvAii/WLiPPQU=;
        b=YdSEqVkbh/hIuK5ieZvQRiLl9Ev5l/pbuJSUB1WESjvvG4WUc6N8FmWUKcxLcKd89o
         z1gpmzeuw9Xm5kqkOWQDocAif5Ima3pOmVF7cirGEZnqooXBRPGh/IXPd/dzwJ0CYxZQ
         D+s2PYJVimtpoMTtOGXNUqVyT9bNoiPGEEyTrVguGI0yT1AVfdogbbKX6Uz2i22ha8YB
         J572K9zqSVPzHGgMRzMfbogBAuhqOrq1Ko2kUd66gXzLI/0JuCD/m8f9B7G9vdZK+x1y
         rMgQc/7lJJhDu1w0F0KhEC41o7uVbqrhPrrJai9sgBXHOoa//vaAUAk0TBtCFMuFdrDc
         lBQQ==
X-Gm-Message-State: AOAM531KoOsMit3DURKmpVti8nrQQhz+6Y6frkY/28LjLCXjuDEeofCF
	zHqJZZCaaC63GbZ2y3Sq+/iB3g==
X-Google-Smtp-Source: ABdhPJxODY6A+RKjzmJ7cqx9NuFVlKjETFgDRCCGJTJSur48NOEpuKg+/Cc1UKsjwn71Qy0LGDpo4A==
X-Received: by 2002:a05:6214:d08:: with SMTP id 8mr1460277qvh.32.1626983354896;
        Thu, 22 Jul 2021 12:49:14 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-5560-078f-fb66-41c1.res6.spectrum.com. [2603:6081:7b01:cbda:5560:78f:fb66:41c1])
        by smtp.gmail.com with ESMTPSA id x14sm10505082qtv.17.2021.07.22.12.49.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 12:49:14 -0700 (PDT)
Date: Thu, 22 Jul 2021 15:49:12 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
Message-ID: <20210722194912.GH9379@bill-the-cat>
References: <20210704210740.581650-1-raj.khem@gmail.com>
 <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
 <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2021 at 12:34:47PM -0700, Khem Raj wrote:

> ping^2
> 
> Is there any issue with this patch ? If so please let me know

Note that qemu-ppce500_defconfig would be a good target to use for ppc
for U-Boot, but not ppc64 and wouldn't cover the mac99 machine type OE
uses anyhow.

-- 
Tom

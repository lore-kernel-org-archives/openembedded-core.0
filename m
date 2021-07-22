Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.1493.1626979860486068407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 11:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TiEEE+ft;
 spf=pass (domain: konsulko.com, ip: 209.85.160.170, mailfrom: trini@konsulko.com)
Received: by mail-qt1-f170.google.com with SMTP id a12so67225qtb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=CqxqWMtOSXVhy/mxaBwEkKJBGpqz1wcq2TkwFfsqI3U=;
        b=TiEEE+ftccbTrcguHqKXdfoeHYJ/AvJKRbL087MySf9j3j2TZT1p1bWmmpFRsX4gBO
         9kkETyAK+wBNAntoLbX00f6RAz6VxvzBXiwx8bsDUWF5dU3Nqi4Bildg8sI876b39Vjb
         aAFt2OVvy1oG159J/3GEio+mubt5u3l5eAgFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CqxqWMtOSXVhy/mxaBwEkKJBGpqz1wcq2TkwFfsqI3U=;
        b=N8tPbLPWv9U3I+3CchQMxWZibpmm3yZbsP3Hre73ACkGWGqX2S4U8niLxIw95JOvjJ
         PxAXaH9UnJ0/AfFJgnQZfN14R4+R5miYiJfspTnCftWgSGKyCE/iv4crJcBnMZzrGzl2
         QaBVOMjCXdnelznnavahOAXcVGX4V4vBU829s1yeeINieJMjO1ZBstftVjr8JT6DvqEj
         diMmm2SaNvK8pD+Wqa3zWb0UQVGSPyH5j9LQJKIv3ksEzTs/ooqSnvi7sLyjsBS8bRWy
         0VL6bZUmoUC1lbbKDSzUQIwkLXhus177prftIF1iEWBedeN0ymTAvuX20s17lw65/GYz
         izKQ==
X-Gm-Message-State: AOAM532EU7kMbqjoOSUpSvDDmbexR9ZvQ++9/KF/H6ThIJ6YZjcCre/P
	2CUPWxYSaDHiSkR/H81kkwxjSw==
X-Google-Smtp-Source: ABdhPJz6w8+mVzZd9hUjsvoaco9rUIwurSIyEBsqqPS4K6SZbvg0Hwl9RJ1SyFdWtj80ScGeGAeFyA==
X-Received: by 2002:ac8:764e:: with SMTP id i14mr945337qtr.247.1626979859618;
        Thu, 22 Jul 2021 11:50:59 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-5560-078f-fb66-41c1.res6.spectrum.com. [2603:6081:7b01:cbda:5560:78f:fb66:41c1])
        by smtp.gmail.com with ESMTPSA id 8sm10187312qtb.94.2021.07.22.11.50.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 11:50:59 -0700 (PDT)
Date: Thu, 22 Jul 2021 14:50:57 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot_2021.07: incompatible with qemumips and qemumips64
Message-ID: <20210722185057.GE9379@bill-the-cat>
References: <20210722094903.27281-1-kai.kang@windriver.com>
 <4a2223e5f3429811786cd2f3dc41ee7e7134af2b.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <4a2223e5f3429811786cd2f3dc41ee7e7134af2b.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 22, 2021 at 01:46:57PM +0100, Richard Purdie wrote:
> On Thu, 2021-07-22 at 17:49 +0800, kai wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> > 
> > u-boot 2021.07 is not compatible with qemumips and qemumips64:
> > 
> > > *** Can't find default configuration "arch/../configs/qemu_mips64_defconfig"!
> > 
> > The supports have been removed by upstream:
> > 
> > https://source.denx.de/u-boot/u-boot/-/commit/5308a71
> > 
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot_2021.07.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> Reading the link above, shouldn't we change the UBOOT_MACHINE definition
> for qemumips/qemumips64 to point at malta instead?

Yes please.  That's what U-Boot tests in qemu.

-- 
Tom

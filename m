Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.17257.1604248051093331546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 08:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gAx2o5aS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id n15so11840284wrq.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 08:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mndnb4B7hAum0mllEOOwQ6TS+pRHNlQ+/gGpuzBXll4=;
        b=gAx2o5aShHTuwJxpifQRrQ9YYvLHIqgJov05iYrlQVcVngfR/hamDFjPxpLoW6GEba
         Aqli28NA0y6vUaqDMwGlHUafOMrftFf/17q15vnMl0NxfOoouavPg/cP2OdyvG+KwMk8
         xGwkay2Q+/HS+EpHQI8i9E+MWlorN41yk2dF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mndnb4B7hAum0mllEOOwQ6TS+pRHNlQ+/gGpuzBXll4=;
        b=i+PXR2h4CjdCn5o/VY35sxmhJm+HQloZva/XGH0n1iQiwGE4PARZ+P/o/Tk/E0vj0x
         EWyvw7tEVOb0ArBwMDaiLVjX3EQNsMjmv+irFa6LxGAVOiBSFPpdezmS0uZ4XI8l0jX3
         uV5Y8q/X6ouIJ2vDwUfky0NQysDoCLGblUGTzgajzuQ2Nqt+mneykPRTI1MatYk3etuY
         UGBEu8iZPgKkDNz9pEK+WffM82XviamMbJPirXQR6GMUwcTinDZaJLJcVBzRLV6N8QdI
         hKL2sG6wxkpGiF+JQGV5jyN/2/hbpBzC57HRsVr8jW8eslQ3q0Jfdr46zA6AfJbUm7dw
         GFNQ==
X-Gm-Message-State: AOAM532OMHwTw8mThKC3AuxN9sf6++7eKmWBxGF+cboXvl6BlyHwGREf
	oGdBo4SalYRY8gwl2o5LHozLog==
X-Google-Smtp-Source: ABdhPJzAN9ERDm1e0EQdTSVVlSvg4r+X29NePT1n5y7KZTllcVt8NRsqzkTMWRshGEgVTbNLt3BNvw==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr16042531wrs.115.1604248049417;
        Sun, 01 Nov 2020 08:27:29 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id v67sm12359439wma.17.2020.11.01.08.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 08:27:28 -0800 (PST)
Message-ID: <aeddcee4aa83407919f961b70949b2b8b298f972.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] dosfstools: add mkfs.vfat to ALTERNATIVE
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Salveti <ricardo@foundries.io>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 01 Nov 2020 16:27:26 +0000
In-Reply-To: <20201031003917.21190-1-ricardo@foundries.io>
References: <20201031003917.21190-1-ricardo@foundries.io>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-30 at 21:39 -0300, Ricardo Salveti wrote:
> The mkfs.vfat tool can also be provided by busybox via the
> CONFIG_MKFS_VFAT
> configuration (not enabled by default in OE but can be enabled on
> systems avoiding components based on GPLv3).
> 
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

This seems to throw a lot of warnings:

WARNING: dosfstools-4.1-r0 do_package: dosfstools: alternative target (/sbin/mkfs.vfat or /sbin/mkfs.vfat.dosfstools) does not exist, skipping...
WARNING: dosfstools-4.1-r0 do_package: dosfstools: NOT adding alternative provide /sbin/mkfs.vfat: /sbin/mkfs.vfat.dosfstools does not exist
WARNING: dosfstools-4.1-r0 do_package: dosfstools: alt_link == alt_target: /sbin/mkfs.vfat == /sbin/mkfs.vfat

(see the builds in https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1531)

Cheers,

Richard


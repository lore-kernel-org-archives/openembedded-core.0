Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8EEC43217
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:26:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.8798.1636626367532865551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OTnHWk1m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d24so9027724wra.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=dtjGOOMyrSmNGw8dOj3dukxcAYbXb04jg35SNr6Eoj0=;
        b=OTnHWk1mYYdt9JrfxvoxSu6Eb9glC4mEzb0LHIeU/sNtuHXBttuCglbOfus2yZXFg3
         Ms1WKfyvjFuyhRlbE3P1lnuQmXrwRZtQ/YYkUNAXLEDXRkosjba1z2YdlRJh7GA5EexN
         LEPkzJcGr2Cdn065yjCJSL/O6zsOiDDFoa3hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dtjGOOMyrSmNGw8dOj3dukxcAYbXb04jg35SNr6Eoj0=;
        b=i8dovLsP407BGY6W+xS/X6JRk02Ibg7bGFKafwcBZ2TQEHJrPSF6D3MHEW2Sg69JVA
         oW61eaiVQVnVenSCrVpO/C7icXB6zVTg3RlWhUgGQMpfoxqtp55R9Ga0lkA603NkqP+X
         l7yX4SOboIYtSLWLG0kwHhYNfHBe15fdwxqiWFqib7BF/xzRdhMqF23aKOF4r8Qy69Wb
         kmo8NdUcMBSRjxTskmPTPAiiGK9mLjefzc70C2tiVraaujxsb1sbLlHBuhkDY6POBR0Z
         mi51XB9q6ey2jjHMnSjmvltIx2P0H7m64+2fW2sYi2E2YMeq3MdL+lbPtt8hdjZxl8xP
         eekg==
X-Gm-Message-State: AOAM530BD5KwEPRZWxkKTV1v4Zcvj45sEDLmGsN2/Mhbzip1rzDys0su
	3KGRuVKm2Zgw8VwQkhHi8yL21g==
X-Google-Smtp-Source: 
 ABdhPJwm8nfFWD4EDAXHye3l/v2j0wQzRur+k43WZQwn0uSHocjKdmuV/+iwhTrul0Z9KkhIbaBgog==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr7712948wrp.162.1636626365677;
        Thu, 11 Nov 2021 02:26:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc?
 ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 f18sm2516292wre.7.2021.11.11.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 02:26:05 -0800 (PST)
Message-ID: 
 <347c90729b87142d015d2839ac4e7df7f3598d9f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/24] xserver-xorg: update 1.20.13 -> 21.1.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Eric Anholt
	 <eric@anholt.duckdns.org>, =?ISO-8859-1?Q?An=EDbal_Lim=F3n?=
	 <anibal.limon@linaro.org>, Khem Raj <raj.khem@gmail.com>, Ross Burton
	 <ross.burton@intel.com>
Date: Thu, 11 Nov 2021 10:26:03 +0000
In-Reply-To: <20211110193937.2606747-4-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
	 <20211110193937.2606747-4-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 10:26:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158159

On Wed, 2021-11-10 at 20:39 +0100, Alexander Kanavin wrote:
> libxcvt is a new dependency (thanks Oleksandr!).
> 
> Include ${libdir}/xorg/modules/input/*.so into the main
> package (if for someone separate packaging matters, please
> investigate what they do).
> 
> Remove options no longer present upstream.
> 
> Remove patches available upstream; drop a chunk as well.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../xorg-xserver/xserver-xorg.inc             |  7 +--
>  ...-duplicate-definitions-of-IOPortBase.patch | 24 ++-------
>  ...probing-a-non-PCI-platform-device-on.patch | 34 -------------
>  ...t-xtest-Initialize-array-with-braces.patch | 36 -------------
>  .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------
>  .../xserver-xorg/sdksyms-no-build-path.patch  | 50 -------------------
>  ...xorg_1.20.13.bb => xserver-xorg_21.1.1.bb} |  6 +--
>  7 files changed, 7 insertions(+), 184 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_21.1.1.bb} (77%)
> 

I think there is some dependency issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4349

but I'm wondering why this only showed up on this rebuild and not previously
too...

Cheers,

Richard



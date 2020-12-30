Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6729.1609337120509268265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 06:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OnWwTvTK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id k10so5051609wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 06:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mANUY4Hxli+szg3EWIGziIAUQUqzPDt0V740PyWTYIA=;
        b=OnWwTvTKpIMJMTZ11O9hUy/jwMtbOrS7MDl45pE+JYRc/waqjP0uNc2OwyApSMJ3uU
         CDep1y7TXR5ye9hJH02Bdnb7AA0bFaFZyuoOhLVUNb+R9pDhWRbRdkFewS8VHQxUg1Iy
         iro61QEF5FJz9Hlagi0VeAh0aSDYj0ELg3OrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mANUY4Hxli+szg3EWIGziIAUQUqzPDt0V740PyWTYIA=;
        b=KiFKzZ5t/x0S+vj2I/X8sZuJNl0dAe5NFY2qLvgN6kKCGGlls/YdaAJBU+QHgApKRh
         kBwKWShpY+2VPKMeeGfTT6oTMU/y+S0bV+8VLpDoPeb08Aeos5rKgPp8Lj5nCjdth2xg
         sqU0wZB5m60sGthi0v/rabIUji6lG5p4wv1cRb3yJR335FB1vahNZM/NPaINZhVtus3V
         n04BZ3s12iDVKvlVMup8l3u8f/Jn6je5iRmmz3gJmElVAVmmGCBAl1gmSgtztl8tG6Rt
         nUhbCP8dc9KOfR0Mxk5CN6VYAw1VrUx0bxvEqXXEwaq9+4Ae1d5kW8EXhdDQsUGUUQgn
         BeAA==
X-Gm-Message-State: AOAM533MmqtAa+Vm90Z8+JVbYH1G43GzhNwbsiz3vZQjeO3FISgr2NyX
	OGUh4wumEJ+TQd1Evq6g477bvVBZ6277+A==
X-Google-Smtp-Source: ABdhPJx1qHbe8GFpJdhvAq7tN6pxGoikrmaGAI/sL9StgjyTcEqnFl0CKuJ85qhz3Y02XGLtP/0/Fg==
X-Received: by 2002:a1c:220b:: with SMTP id i11mr7931454wmi.8.1609337119145;
        Wed, 30 Dec 2020 06:05:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.1.0.d.e.9.1.1.f.8.6.d.b.d.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3ddb:d68f:119e:d01f])
        by smtp.gmail.com with ESMTPSA id o124sm7844353wmb.5.2020.12.30.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 06:05:18 -0800 (PST)
Message-ID: <0caca27102d49a9897438734f3f0d955ecf17656.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/2] meson: fixup nativesdk sysroot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy Li <ayaka@soulik.info>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2020 14:05:16 +0000
In-Reply-To: <20201229035550.226617-1-ayaka@soulik.info>
References: <20201229035550.226617-1-ayaka@soulik.info>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-12-29 at 11:55 +0800, Randy Li wrote:
> I still saw the request for this patch from Gstreamer users
> sometimes. I have verified this version would work fine.
> 
> Only the exported SDK would need this patch.

Thanks for the patches, is there something we should add to the
automated tests (e.g. in meta/lib/oeqa/sdk/cases) to test this?

Cheers,

Richard


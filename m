Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.5795.1602333623318001131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 05:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U3Pmagtc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id e17so13004447wru.12
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=O6CZAvGirxcUOGZseGOtIka5khZ44Yol4bcJYjzKmSg=;
        b=U3PmagtcTiT3zMXiVqLxi0aglUTso+LI5XRVxWstdIiRY6f7xGhin76dUH6dLqLY1t
         G9nRTz5HVkmiKMPXwTVxbyRX9RRa3tkdBYq5862mIjXS5N9JmBE3CvtOWbflW3Ics+yf
         i4PIg5CuWCe11MtDHpQ/dzCkV8313qomZJ53o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=O6CZAvGirxcUOGZseGOtIka5khZ44Yol4bcJYjzKmSg=;
        b=CxP3S4/4HRGizR0KCBYEBBag+bEKki54+rbGghxO/I475rYcECDF8olpyj5+Dpa9c6
         2wou2eoTdmC5UIeKNUPe5iILfubvLT6/ngzK6t0QBTUeoy5ReJzERkJrAak18W8jbh2W
         DhOPbeVdCMQB/sUbZIWeRZHvQVgOhXE5Y+WVGtR9Fu43WyzAinTp8NTBaJVan1YqaEaX
         tjNx6OZ8Rn3mgl7u3YU2kXyQ0L856kLjdT7+FcPwkWk0g9ArX93TgbJKmOkC6dMfACTB
         ZhrsPqAQDC8xlqK/t7lkIRvdfMJXgiX0ha3815PJ3bPuV5Gt3skdNVlTSCL3VI5jKIGs
         kPlA==
X-Gm-Message-State: AOAM532sEOq5tV7aOLweC4og0om63Ky2rBw/05z3BHtGA8L+cX6Leq9Y
	p4nSzeeps80nL5npiMOsw1X2Zw==
X-Google-Smtp-Source: ABdhPJwKohkv2XKXHTCUPF550TeQxIqjTKtHLQJeL1bk9CqEq70+xC1ySWrGGpSNdyOszoXGOhPF8Q==
X-Received: by 2002:adf:818b:: with SMTP id 11mr19435675wra.74.1602333621636;
        Sat, 10 Oct 2020 05:40:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id s11sm11657250wrm.56.2020.10.10.05.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 05:40:21 -0700 (PDT)
Message-ID: <d53db65c06b96aa6d8e1ac1edb7f912da78293d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH v3] Update license file to match current SPDX names
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 10 Oct 2020 13:40:18 +0100
In-Reply-To: <20201010122339.9594-1-idadelm@gmail.com>
References: <20201010122339.9594-1-idadelm@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-10-10 at 13:23 +0100, Meh Mbeh Ida Delphine wrote:
> Updated mappings of license fields of meta/conf/licenses.conf to
> match latest SPDX naming.
> Added missing mappings.
> 
> Fixes: [YOCTO #13320]
> 
> Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
> ---
> 
> Changes in V3:
>  * Added missing mappings to meta/conf/licenses.conf
> 
> Changes in V2:
>  * Corrected the email subject line.
> 
>  meta/conf/licenses.conf | 55 ++++++++++++++++++++++++++++-----------
> --
>  1 file changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index 5b309eb385..b45a9d283e 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -10,33 +10,44 @@
>  # Any mapping to MPL/LGPL/GPL should be fixed
>  
>  # AGPL variations
> -SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
> -SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
> -SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
> +SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
> +SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
> +SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
> +SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
>  
>  # GPL variations
> -SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
> -SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
> -SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
> -SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
> -SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
> -SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
> -SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
> -SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
> -SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
> +SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
> +SPDXLICENSEMAP[GPLv1] = "GPL-1.0-only"
> +SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0-only"
> +SPDXLICENSEMAP[GPL-1.0] = "GPL-2.0-only"
> +SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
> +SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
> +SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
> +SPDXLICENSEMAP[GPL-2.0] = "GPL-2.0-only"
> +SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
> +SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
> +SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
> +SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
>  
>  #LGPL variations
> -SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
> -SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
> -SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
> -SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
> -SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
> +SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
> +SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
> +SPDXLICENSEMAP[LGPL-2.0] = "LGPL-2.0-only"
> +SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
> +SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
> +SPDXLICENSEMAP[LGPL-2.1] = "LGPL-2.1-only"
> +SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
> +SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"

The above is all good, thanks.

>  #MPL variations
>  SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
>  SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
> +SPDXLICENSEMAP[MPL-1.0] = "MPL-1.0"
>  SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
> +SPDXLICENSEMAP[MPL-1.1] = "MPL-1.1"
>  SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
> +SPDXLICENSEMAP[MPL-2.0] = "MPL-2.0"
> +

However we don't need to add ones where the two values are the same.

Cheers,

Richard


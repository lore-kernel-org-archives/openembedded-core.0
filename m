Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.8514.1613662089212675393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 07:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GNDo0lC3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id g6so3394295wrs.11
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 07:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gKpJXYUgXPfArzx0kL92t6rxE081hKTjO17SF1SS7jg=;
        b=GNDo0lC3UI/paMT8Yu3+ExGipay9cLy5ytXNo464S1tOmc5lr3CK5DICoWiGzRupvU
         tb/Z5hyQDaYzxAIQSsX4x0NxX879q6Raoj/PMEXVY+pxNheJfuEJXsHy1y0L0p/S+vxa
         kRYVNYH3cb7mAAHeeXtAsr79nfsOeiZOjtUkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gKpJXYUgXPfArzx0kL92t6rxE081hKTjO17SF1SS7jg=;
        b=mUp6R22MUn8VXrPL3APXB/rjrjLSzZ8kgdXWwPZ28EVCuKa8zPEU8BBgIxcD10WbPJ
         kSiMAfvdxuUaU7i0E4Cf5SEEXoqUbh33inF5BKCRH5+XBA8PAtVuIkZwtb3QEnIXhQwO
         LyG/sEgGlapnuRVcPaG1xAvc/OUoyL+O1tZv1ogpwdbjvRLgWHKVRjLS70i/EiwiCOY6
         YatukKO/y+EVxgwM6mjoquAOrSJ+PN0ZOwU8fk5x81xJIPcPrFK8wJdGXaaeTPBlzIOO
         +Q2Y2A/EvKzNjCCk5+ciBMn1W0C34c3tbcWzY+g83216bQxP54v3V52w2IkDkfU31uy6
         0bzA==
X-Gm-Message-State: AOAM530QYrtNOA54SstF/Tkm8JCgjCYTt23rN4v4oblGxfigo9Szxm3O
	W5FAE/wzyNrN5HQZ0f8qq4CCgw==
X-Google-Smtp-Source: ABdhPJxp1fUcQQ33J47oNMZq1Cjex4Kvqr17hAZJ+NBNmLk1KXgm0Z0r7FyGOtztavG8qHi01HnjwA==
X-Received: by 2002:a05:6000:152:: with SMTP id r18mr4809092wrx.226.1613662087716;
        Thu, 18 Feb 2021 07:28:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7504:d16b:192:2652? ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id o13sm8561157wmh.2.2021.02.18.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:28:07 -0800 (PST)
Message-ID: <f967ae722339469ec722bc7a54063566a129e120.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/12] wpebackend-fdo: upgrade 1.8.0 -> 1.9.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Feb 2021 15:28:04 +0000
In-Reply-To: <1664DD06273F9671.21419@lists.openembedded.org>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
	 <20210218042418.281245-6-anuj.mittal@intel.com>
	 <1664DD06273F9671.21419@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-18 at 14:13 +0000, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2021-02-18 at 12:24 +0800, Anuj Mittal wrote:
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >  .../webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.9.1.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.9.1.bb} (85%)
> > 
> > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
> > similarity index 85%
> > rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
> > rename to meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
> > index 69d6098d36..4547efc57d 100644
> > --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
> > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.9.1.bb
> > @@ -13,5 +13,5 @@ inherit meson features_check
> >  REQUIRED_DISTRO_FEATURES = "opengl"
> >  
> > 
> > 
> > 
> >  SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> > -SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
> > +SRC_URI[sha256sum] = "a1dc4e506413719a0d84757797b645fa76590e6c8db23d2403d990dc2e196a64"
> 
> I suspect this may be causing a musl failure:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3086
> 
> but I haven't bisected to confirm it.

Happens on non-musl builds too, confirmed as this patch and removed from master-next.

Cheers,

Richard


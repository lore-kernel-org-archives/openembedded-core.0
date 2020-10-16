Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.12769.1602845725912961393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AWmq94wB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t9so2195814wrq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=voRZN9gLn2MOJ6gyv2LvpeS2/uQlX0prLU/2/Oc/vxc=;
        b=AWmq94wBz0o8LT8Jiik5fTKK3UWz+dFVXSYm7EfaApdjQkgVVj9aS6rTS4qSbMU2dQ
         3R2+OibCaGSuVHtGAH86RfhjzhJ6I2v8HANZWumejHBrSfLdPN1bUReP4HR7BzXDtN2H
         U3ZQBsuRX56wwecvHsvKKIej/tZhGWm6mVRQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=voRZN9gLn2MOJ6gyv2LvpeS2/uQlX0prLU/2/Oc/vxc=;
        b=n+Gt/gLy+UJg/5gzaMfDSYrf8KAc0mULsmKFG/adkW06XZHL2s2KxbKDY6zOV4IJl+
         zjpWAQQPvubV1zgJ3OcTc4w1bjAp7alLdtdr+2rT/AfmAqPE9iySdYqSdqmJsrjyc3B2
         tgvvGK1Hyvk09cQuico85n3L4U+SxMd60LygIxOaBTohedICDM0+stzHr/YhzW+IrwI7
         5Td+6uTjyg+Nk5PpyCSkrw5cMu5PqsM6YJkb8SnttKO5MA9WWcf4k2LRRGTopOvhyiEl
         xC7Ze8J48o2jI7R5ftFDxAbSSQhBAUiQqKp44ZLeHSGC8A25SF2hwnsm8qWE0DWCvoF1
         ltlg==
X-Gm-Message-State: AOAM531w2exUDLdXrlGeJgApfAzsWi3ltWKsX0777bVp4aOgfWNKzpSo
	1fOJ30HoWMOEGZiV+z5RnreAOw==
X-Google-Smtp-Source: ABdhPJz5HR4gNHfFfg/4RWZyPeI0Or2ro7X6D+uihZ+RVQA0FjQIoIbkxykTk+WJcjhN+ftQBKnR2w==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr3187892wrr.131.1602845724480;
        Fri, 16 Oct 2020 03:55:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id d4sm3024104wrp.47.2020.10.16.03.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 03:55:24 -0700 (PDT)
Message-ID: <4721672db9f150456b07f95af172f65a56445a23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH v4] Update license file to match current SPDX names
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2020 11:55:22 +0100
In-Reply-To: <CALbNGRSw_-9XwrsXWt462MeccFKiFCzmVYT4ESLBcitkpFC4Eg@mail.gmail.com>
References: <20201015200842.18834-1-idadelm@gmail.com>
	 <c17959f4b0ac63d56b7b8d2c76d69af8025ae677.camel@linuxfoundation.org>
	 <CALbNGRSw_-9XwrsXWt462MeccFKiFCzmVYT4ESLBcitkpFC4Eg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-10-16 at 12:54 +0200, Andreas Müller wrote:
> On Fri, Oct 16, 2020 at 10:42 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2020-10-15 at 21:08 +0100, Meh Mbeh Ida Delphine wrote:
> > > Updated mappings of license fields of meta/conf/licenses.conf to
> > > match latest SPDX naming.
> > > Added missing mappings.
> > > Renamed license files that were added in license mappings eg from
> > > GPL-2.0 to GPL-2.0-only.
> Is this intended to go into gatesgarth? As we see from the follow-up
> fixes: This is an incompatible change at feature freeze time.
> Asking this because up to this point I was happy that all my layers
> are working fine on dunfell and master(gatesgarth).

No, I will hold it until after release at this point, its too late to
take a more invasive change like this.

Cheers,

Richard


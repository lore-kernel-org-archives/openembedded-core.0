Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.6500.1610016022436409957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 02:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OvPYye3R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id y17so5112851wrr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=whl3JpmX533i7iB6ztf8zGAmx+/iqGJ6MlPwcnyz3B4=;
        b=OvPYye3RmIzg+9BVI/6pa5vz4ED+lpdm6VRL/Iwq5jAIisZFlhxflvqnsZr2geJNkv
         AcQd009Afrm7sl9T+8KnB5pWuXI2VSZWXlrDVd8RxdZpVgyZRAJUnSRDkYHMTh6KRwH/
         eL+SxMh6f1eQUQo8gNYLvptMy8Da5TpdNBF1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=whl3JpmX533i7iB6ztf8zGAmx+/iqGJ6MlPwcnyz3B4=;
        b=b8eBMICCZ9DunWOyzTH3IpNaEl/8iCmaew9D2HrUq9G42qCwow30yWyzcVQCbblefO
         +OuK0AyyNgtj+E2hVQal+gySZEDWue/NtPWzireUVAZonotkIp31hQRL5oNVGs6ffq3g
         usxIQ+HstI5Z9qO6osxa+YGOpqA2aEMhFiTbxT/PXg5fVEqa5vYDdm2QPLydn/EAoJN0
         0uPc322a4dMV6Zb4kMSUHkqGF7EjkUDaulgmvGMo6U0FKJI1eyia7JWFXGaJ8akut8/C
         gy+F4vDLSMoTNmL1lbotoTfrozBawG969I+y6c7XDRqdMgAYFIwQF7MYOKpOFYH+zrXu
         4KXA==
X-Gm-Message-State: AOAM530jvWUmep8X5L5zf5gwcAcJF/hyqGO4KTtnVqCfDMozeI80Fb5O
	RTh2s36FAx85SA6oA4p47DtsTg==
X-Google-Smtp-Source: ABdhPJzKP65VVU7InWFi06x+dDcwe474C1Ub42qhjIkpcx1qfPk9dsmwN2kP95rG9EEhWfkij6TYsQ==
X-Received: by 2002:a5d:6502:: with SMTP id x2mr8506432wru.254.1610016020880;
        Thu, 07 Jan 2021 02:40:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f082:51:8822:ee14? ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id e15sm7549214wrx.86.2021.01.07.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 02:40:20 -0800 (PST)
Message-ID: <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2021 10:40:19 +0000
In-Reply-To: <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
	 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
	 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
	 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-07 at 10:44 +0800, Robert Yang wrote:
> Hi RP,
> 
> On 1/6/21 9:56 PM, Richard Purdie wrote:
> > On Wed, 2021-01-06 at 04:09 -0800, Robert Yang wrote:
> > > Add it to buildtools-tarball so that there will be a unify version of ccache,
> > > which can help avoid various compile errors.
> > > 
> > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > ---
> > >   meta/recipes-core/meta/buildtools-tarball.bb | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> > > index 9da81d55235..2ffdd7c7253 100644
> > > --- a/meta/recipes-core/meta/buildtools-tarball.bb
> > > +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> > > @@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?= "\
> > >       nativesdk-rpcsvc-proto \
> > >       nativesdk-patch \
> > >       nativesdk-mtools \
> > > +    nativesdk-ccache \
> > >       "
> > 
> > My view is we should not start to ship ccache with buildtools by
> > default. Its something that the user can install if they want/need it
> 
> 
> The problem is that user installed ccache may not work with our recipes, for
> example, we found the following recipes failed to build with ccache on different
> hosts:
> 
> cdrtools-native
> fribidi
> rocksdb
> 
> 
> So have a fixed version of ccache can make sure the recipes work well, it also 
> helps us to reproduce the errors easily when user reported a bug.

I really do not want ccache in buildtools. If this is such a problem,
we need to work out how to resolve the circular dependency issues so
ccache-native can work again.

Cheers,

Richard




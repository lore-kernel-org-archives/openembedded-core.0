Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.479.1598303306590966187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 14:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VPDT8oMw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k20so187290wmi.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XXmwx8kJb5CrZXfZnqueRfueOEy4wP3LfCFvZc59XAI=;
        b=VPDT8oMwVrbWWsh52t20ZEjojYyVn+slnK+MMtnAFNG8pUEKEeNLuSDrnVFK8TqSF+
         BenVrBkodPb9O+RJGAfKNrlMcCzvLRmUzUwfmwata40yQTbW3on99sxwhFstz56LxO9w
         g0Z+Zo1DBJCn2bXg0CbFO+MTmFbFbJ5iO68JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XXmwx8kJb5CrZXfZnqueRfueOEy4wP3LfCFvZc59XAI=;
        b=kOO9g2EHRLYDe4jW23I58+jY/V9oeEX0uhS8aw0CLfhw5AJtQ8QabrN332+Y6g9gHj
         BPooJirJs8e/oTDmRUpeJaYkNP/Xhj/vuEpgXdEuE/QTnIQh3NQc603OaBn71nmeBuDI
         0b3PqVi+wA585O0hVTdNOMrLCuTVKvsj/rVhINJzbbiWfDN9FWhCxI8MlPGUHkg1MbDv
         ntiebkU/tcuE/tfapnXm/JRMPseLPX5tPSdSjkoOU5MEZBaHAOjieYYH0/ZX4BBahrN9
         XwaPWPVieqeBe3pkmAYOJCZHdlzKXty+PySUMxwHM2GfBQdz82cpuO0dDZLSyvfcxPQz
         Dbvw==
X-Gm-Message-State: AOAM5308KpRRnT0XO1nBHXOVIam8GyKCI2MSuEOhnA9ZqmIWJOQiL1lD
	6rIhlXomIu69F3kbPa96Glehvw==
X-Google-Smtp-Source: ABdhPJx8EbKzt9gYvU2XuH+iG3Bq2pjTjySSi2PxD6Cn7hJPYBdyCBciWzhQMUeCitjOMCwGQKclvQ==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr1020639wmk.176.1598303304839;
        Mon, 24 Aug 2020 14:08:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id u6sm1376015wmc.12.2020.08.24.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 14:08:24 -0700 (PDT)
Message-ID: <f058d2bf3e7d880aed5682d958e8afc0b90f752d.camel@linuxfoundation.org>
Subject: Re: [OE-core] cleansstate
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Tom King
 <ka6sox@gmail.com>
Cc: Joe Slater <joe.slater@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2020 22:08:22 +0100
In-Reply-To: <fb0fa58a-cf84-9a5f-5b5e-489bd154b257@prevas.dk>
References: 
	<BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
	 <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
	 <CAHQecY4KmaTb6W_r88fRaqTVCsGDmiQMqk5pZvckAraHBLu+_A@mail.gmail.com>
	 <4e07ca8b282abc62ede7969bc7c7dd6bd34014fb.camel@linuxfoundation.org>
	 <fb0fa58a-cf84-9a5f-5b5e-489bd154b257@prevas.dk>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-24 at 23:05 +0200, Rasmus Villemoes wrote:
> On 22/08/2020 09.27, Richard Purdie via lists.openembedded.org wrote:
> > On Fri, 2020-08-21 at 17:32 -0700, Tom King wrote:
> > > What would be a use case for cleanstate?
> > 
> > I never really wanted to add it at all. There is/was some case for
> > wanting to remove sstate objects and ensure something really does
> > rebuild from source. When sstate was new and had more issues,
> > people
> > really wanted it and I was pushed into having it exist.
> > 
> > I understand why people want it although it should never really
> > need to
> > be used.
> 
> Well, except when you discover that your sstate is effectively
> corrupted/polluted by objects that happen to have the same hashes as
> those computed from current recipes, but the build artifacts
> would/should be different. Such as when using a file://foo/* glob
> pattern in SRC_URI.

Where such issues are reported, we do try and fix them. I hadn't quite
connected that the globbing issue was actually breaking sstate hashes,
that is more worrying :(

> 
> Richard, I'm still hoping you'd respond in the
> https://lists.openembedded.org/g/openembedded-core/topic/75235594
> thread. As I see it, half-way supporting glob patterns in file://
> URIs is a giant footgun.

My leaning is to remove them. You can just do file://foo and I think
that actually works?

The globs are horrible for a lot of different reasons.

Cheers,

Richard


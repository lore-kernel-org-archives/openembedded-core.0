Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.10065.1612363272756338061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S4r5m9rw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id j11so4951500wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=oVKZwnrUlZysJsK4cjvzGun3gU+Hw9InzDeNbsRqmOo=;
        b=S4r5m9rwj6niLsbrIDdJKECLg+jtw/GoRtNqW0P4ZmRss4cA3QNAYyTjZjzK9Bq3oe
         6ZAQQ/2tU+5NMl9UgBRWQcpQbz1Piz+6Tssq+/HFX3t6De3CqdltvUqEYrspXWr2wXF/
         siF7QtLJcAzHQGFS6705Zq2OUnuV2UYJN/H1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oVKZwnrUlZysJsK4cjvzGun3gU+Hw9InzDeNbsRqmOo=;
        b=Hv8Ekqfp7hcal2W/qOf6D3nzLvj5o29AAWSYav7sCGvSIC9kcNhi2BVD6Bkxc15As9
         TxiGyP89C6RPDgPi+V/OLsx60MfbGqCnYV4S6/msgowiPbs+bsfxht9OuesJOolHcjiW
         CteuS4fMdmHTRIy+zdw1GPgJ/mtEAvF830CdqLT5fvHrlr6XufqXQkV0THuX7sA1D1/P
         I5qeayi2CKy2CSEb1+7m/jdmwBmYEbzHjTBj2pZXrc4eWHsHXM6el2vdJ0Md9AuEa9kc
         kGqGoumP5kn4P25TEeTaqfxPbdArswaOIffPfn3kjepp3F0/XaGVJtqo+96JmBlL5pmC
         rTlw==
X-Gm-Message-State: AOAM530plwXedQ3jijufZ6bhdfyOcGxncfdxD9sNVDwXrBynZlOnarAb
	WSoNbz+arlnKgtiSO/S+X/dt7g==
X-Google-Smtp-Source: ABdhPJwn9+ZtCHP2jq6aGaXXD2ROFaxoTpqyd2pZeGVAFbH9t/50yKSjUj/7sTzAqETNXQO+S6NAyw==
X-Received: by 2002:a05:600c:1986:: with SMTP id t6mr3135731wmq.92.1612363271400;
        Wed, 03 Feb 2021 06:41:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a910:113:8225:ce6d? ([2001:8b0:aba:5f3c:a910:113:8225:ce6d])
        by smtp.gmail.com with ESMTPSA id l2sm2942305wmq.17.2021.02.03.06.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:41:10 -0800 (PST)
Message-ID: <f95a85e6a8b7782c753a8ee684cc0b2a24007239.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "Qi.Chen@windriver.com"
	 <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "JPEW.hacker@gmail.com" <JPEW.hacker@gmail.com>
Date: Wed, 03 Feb 2021 14:41:09 +0000
In-Reply-To: <166014C846A3C62E.24362@lists.openembedded.org>
References: <20210120050318.10376-1-Qi.Chen@windriver.com>
	 <165F4E547FA339C3.13584@lists.openembedded.org>
	 <165F4F23A9F2744A.13584@lists.openembedded.org>
	 <260643e582bbeee2748e08e1fd7ebee4adbef888.camel@linuxfoundation.org>
	 <39f0c1745d9a3d31c7256f7851267b49e7f7c3d5.camel@intel.com>
	 <166014C846A3C62E.24362@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-02-03 at 00:18 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2021-02-02 at 02:57 +0000, Mittal, Anuj wrote:
> > I see the same failure locally even when using the autobuilder
> > configuration so it's probably not related to multilib.
> > 
> > I guess it's happening because procps was split up recently to have the
> > lib installed in a separate package and that didn't result in a rebuild
> > of igt-gpu-tools?
> 
> It seems related to this. It doesn't seem to happen on a clean build
> but in my older TMPDIRs, shlibs2/procps.list seems to be persisting for
> some reason and is making the package RDEPEND on procps instead of
> procps-libs. I've run out of time today to dig further though...

I found the problem, its an issue in do_packagedata when TMPDIR isn't
clean. I've sent a patch. I'm going to drop this RDEPENDS patch in
favour of that.

Cheers,

Richard


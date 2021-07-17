Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.9190.1626559746718106978
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jul 2021 15:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T5ydGXr4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f8-20020a1c1f080000b029022d4c6cfc37so9035236wmf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jul 2021 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8Pc5xm5XadW+TVH7hRLOvkbvlH/vvyjcxkvHRWIwXko=;
        b=T5ydGXr4qhfA1Xy34N4mKKfB0h7n1IG1NBtlo0q2ecwWJrioMVpJqbpxCftmlF4lx3
         fMj/rJfbH3xCYZ+ps5JefHRDN1/deGxUUl+BqSAJkSwH/Pn5CNy7hLwFaOtCr1LE1nDp
         ICaD/3j+bw/ayHVZTnp44XIO74GQnJRNNpGS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8Pc5xm5XadW+TVH7hRLOvkbvlH/vvyjcxkvHRWIwXko=;
        b=N9kyUTYadc9353G4sVmQ0HHp/qf4waFCh7GnwlZiquDwZTGMVd0a1EKuVtOOHKVWa3
         6gXY2jDJmNv8ht0WXvXp532ZcIwc1L8KlQfd8kTZdQSl6aJrDT51wiEsRR0Ljg53CwtV
         pRqdnAiEhXbm8E4X039NFS0fSu7c3iuzIEtQKF/+VBvjKdbO+As2whzSXXKpoTtMlrJM
         Y8utGoAQVqVa1nHrKRkNiJDZBmNWJId3ueXzxzhy8MAuKdfiS41gDx6Ct46muFmX/MM/
         vNmUw+A9qMzhcXPcWqMAEHS9b+u9tSpjCj+KW8sQLts5MzLjavUDOHpjBhN0tZh19QM1
         hA9A==
X-Gm-Message-State: AOAM532HBVB/3i/+wxHCTL3iJ/Mdfmb+x/k5Ap/qBi4MMi9+DC/aLVaD
	M20iUtWtLLfaD6QVsWlBix/WrA==
X-Google-Smtp-Source: ABdhPJxYXq0BDmJqJ2iE4oMwjzJQtZp8NTNADq1I69RgsOmXzzQL7m3yWbo2vfzJR3lUhPTNtxYicQ==
X-Received: by 2002:a05:600c:354e:: with SMTP id i14mr18213570wmq.96.1626559744853;
        Sat, 17 Jul 2021 15:09:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d93:ece2:557d:4915? ([2001:8b0:aba:5f3c:1d93:ece2:557d:4915])
        by smtp.gmail.com with ESMTPSA id f13sm15941770wrt.86.2021.07.17.15.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 15:09:04 -0700 (PDT)
Message-ID: <806891b9d9bfc29f2602871f586d0ccef253fba8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] libseccomp: Update to main branch
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Jul 2021 23:09:03 +0100
In-Reply-To: <fa50037d-6482-8aeb-b710-d2c8a532ff80@gmail.com>
References: <20210714021322.1245535-1-raj.khem@gmail.com>
	 <fa50037d-6482-8aeb-b710-d2c8a532ff80@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-07-17 at 14:30 -0700, Armin Kuster wrote:
> 
> On 7/13/21 7:13 PM, Khem Raj wrote:
> > Get RV32 imlementation
> 
> The subject is miss leading. You are replacing the upstream url with
> your github version to make riscv easier. Is this the preferred method
> of supporting new Architectures?

Please don't do this :(

We need to reference the main upstream repo, not a fork of for some 
specific feature work.

Cheers,

Richard


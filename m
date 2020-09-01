Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.10595.1598958193747538932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 04:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L0V247/4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id l9so719698wme.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XGp+bxcBloklrcCzwIbEOYvs4W5AJ0OYg0IQSIkdb0c=;
        b=L0V247/40/PVwSM8M33y5+rMSvPjG36EtPjahSTJ7u1XANE/c7J6fNILU5BPjAb06B
         0quEwzqda94Hx94nrVz+RbWy8fY9+gtMM8UEEjA6R/CHjcx79elhbCEYUCiLIki2z5TS
         +bM1tWTtCrL4tx0ATbMT0si2meLQ87kDTDAOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XGp+bxcBloklrcCzwIbEOYvs4W5AJ0OYg0IQSIkdb0c=;
        b=BtL01g2WB9RzSPybvgQ64GZwLdi9yPDHOupqwktkl/k0Mlwr9nQgQrOV/cDjd4tzL3
         5jszilTkitb6PauCKojBP6YcUFAeF6aTzvFkG2YdHO+SSkj0JvFEqc826M+lx0tOm7gd
         oJworwkQk8YRZAhZdVlM06qripy/k6rSSyAa4KN0Wy/kvbZpvzntEpj1l1QtMifqpk02
         GKf2F3YEZXicigAmZ0LcDYMOc69nU8ttuwHJpecIZOk8uGkYh2uMxsdDmzd/LrtjFFRN
         NxOpmSzXMy9sMMO8QyoNFxg3sUQCPFLeTWsJBe3H8GrAnd7od2eJG5Aqic9IsHdcBgtv
         5M+w==
X-Gm-Message-State: AOAM530ZsUnuVHZ798w9jOfnINeyyyrmyq2gF24GqNWcSEyq5dVDymNf
	RA3CxJKKnL2Nq/kfaM36ILvvcQ==
X-Google-Smtp-Source: ABdhPJwkRytGr4oV1pKi6vBaMLkEZDBrPKd0+FEUtmMPT+IDUy7WvZbxVPZ6beQaq9J3mMzajap4sg==
X-Received: by 2002:a1c:a911:: with SMTP id s17mr1227805wme.77.1598958191884;
        Tue, 01 Sep 2020 04:03:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id z9sm1354401wma.4.2020.09.01.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 04:03:11 -0700 (PDT)
Message-ID: <614eeadbbd90d974e107229599784f7e7bf4a622.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] oeqa: sdk: Capture stderr output
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2020 12:03:09 +0100
In-Reply-To: <20200831215353.8783-1-JPEWhacker@gmail.com>
References: <20200831215353.8783-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-31 at 16:53 -0500, Joshua Watt wrote:
> Redirect stderr to stdout when running subcommands while doing the
> SDK
> tests. The tests will show stdout when CalledProcessError is raised,
> but any output to stderr was lost.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oeqa/sdk/case.py                  | 2 +-
>  meta/lib/oeqa/sdk/cases/assimp.py          | 2 +-
>  meta/lib/oeqa/sdk/cases/buildcpio.py       | 2 +-
>  meta/lib/oeqa/sdk/cases/buildepoxy.py      | 2 +-
>  meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 +-
>  meta/lib/oeqa/sdk/cases/buildlzip.py       | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Thanks, I ran into this the other day and have a note left on my
desktop to remind me to try and figure out what was happening!

Cheers,

Richard


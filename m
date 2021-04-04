Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.40653.1617530719254052598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 03:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TNehg1w3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id f12so2475674wro.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Apr 2021 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=w6k7AhRI8c7RwEFOk4u8F4I0Kl7cGW4/65sppZOC8yU=;
        b=TNehg1w3cqEdx7TzWashZzkXNQ8QJLjsic7Ydw8ioFEf4X2uw5qoTxW3GENJZug/6v
         WMnEEnva9GV/CJZvK+fQfam+1Gtwkk68M5nWvrpz2FJ+BuhMBln50YBisNdK7Yvfhbqy
         bGedtZWCgOxsIeMP3XggqC0im+u5d+2aR7c2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w6k7AhRI8c7RwEFOk4u8F4I0Kl7cGW4/65sppZOC8yU=;
        b=SlgjJdg9rxg+0LOjInKHj2Kn35i4mvumYuqo4KMg+ztfUBKpB0YzqlosAT1JcrMqj7
         9jaQNMyXVn+HS+T8gs/fmXBdDYfmGVPB8r2m3shIfVRGisXlQ5I3daSwAyMOxzL6GdCr
         pl8ZP575jZk0CyCZQ+/MKtxATyuUK7J/oSWd5a9ZySf6eKkjXn1jXKPr/S9OTZyZicpY
         3YYoLRQoYJCAgQ9GBbAnP+jcnLOBt2Bo+BYgl5urP70nq/Ssi9tm1gEktmtwa9HO8jbH
         +Or1icmyxG4CGDrggpQbgEhWke/uEfXgwtP6YQTrKKrCptPwwZ8cDZ2tzRUcPCe0GAuI
         VtEA==
X-Gm-Message-State: AOAM533etpqg8g6goDmhIggnPFzE5nPSBskTxBmZSQylAOx0rMJbv8Zm
	Y4Aoooisuog9HS2RApuk622mBA==
X-Google-Smtp-Source: ABdhPJyj/z0LzmSkrsFNP3KuCbIMqJcTW+WWx5A+MWyRQ4/gVLkXmVebp2pZqE1wQmsHpHsGxnASTQ==
X-Received: by 2002:adf:f883:: with SMTP id u3mr2136698wrp.405.1617530717737;
        Sun, 04 Apr 2021 03:05:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2fe:6425:3825:be06? ([2001:8b0:aba:5f3c:2fe:6425:3825:be06])
        by smtp.gmail.com with ESMTPSA id u8sm23710215wrr.42.2021.04.04.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 03:05:17 -0700 (PDT)
Message-ID: <278df56a6cff5cd90a092c1caa416078ca5b432d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] python3-setuptools-rust: Add release 0.11.6
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Leon Anavi <leon.anavi@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 04 Apr 2021 11:05:16 +0100
In-Reply-To: <20210402114521.3888-1-leon.anavi@konsulko.com>
References: <20210402114521.3888-1-leon.anavi@konsulko.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-02 at 14:45 +0300, Leon Anavi wrote:
> Add setuptools-rust release 0.11.6:
> 
> - Respect CARGO_BUILD_TARGET environment variable if set.
> - Add setuptools_rust.__version__ and require setuptools >= 46.1.
> 
> This recipe is required as a dependency of Python packages relying
> on Rust, for example newer versions of python3-cryptography from
> layer meta-python.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/python3-setuptools-rust_0.11.6.bb  | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-setuptools-rust_0.11.6.bb

If this is targeting OE-Core (hard to tell from the subject line 
including meta-oe), it has no maintainers entry. I'm also a little 
surprised there is no rust dependency. Adding rust is something
we deferred to the next development cycle.

Cheers,

Richard


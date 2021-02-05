Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.94.1612568176879562209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 15:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YLjZJB5f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id m1so7212750wml.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 15:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=TFcl/Rgx3paiCI7yvW10lLItYfMYASB0zOeRNCf6S+0=;
        b=YLjZJB5f+vMFFe8arSotTSgUkEUDGRfQ1M6ck1btkaOSmpOM5f6Jwsd9QPY0mU2vz8
         tOUkq5cNJu6p4jHqMsTaDLvrN9N8k8GijJBgpJFVI8G62LW07F0EO7u04KRQxVEbTyz0
         UnykYZ1hFu0+Fbpn2vtoGFa3eEPKpnao2DrLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TFcl/Rgx3paiCI7yvW10lLItYfMYASB0zOeRNCf6S+0=;
        b=O2ieYlYW3xVbdPuq5B+wIBYW7Xn+jRLEPPvDtWLqcaeY5bqjOol0HgrHwAgi4cUI8a
         q4BFWQo+2r0lvJDoqfUbn84Truh6IKUIRRsHgOMbBm/VrX9bcRLtDxTitdXS6iHUxXF1
         LHasyALASsQBKwXhOPDzbXA1v7gyn+8OrdtTIde/x7b8f9tH87p3wDkWyQgQ1DbqJD2M
         sGktajDvlzJs13jNVyz7BUUBEXkN9x6v6zkwPgkJABK+yzShmUNnBNTcUpOnRxB9uchq
         MhKDXrDeE1nIW5bOeqfqBw58JxisBs88HFiF5k9pRCemPwMU/fhKYWkpiL9njiuMVf0T
         RdAg==
X-Gm-Message-State: AOAM533BuuQM1FygN1/b95LR5+AxgEgfayIk50DcaxSSfNvCDbs21tz/
	/mbe+CWVLB9fzI2LipiXW88I3A==
X-Google-Smtp-Source: ABdhPJzg6SGCdG1sj8Sg6Mc1grT8FX30qpLeRMw2SmYLE3thVnRTQIlXkQXozK5eKw//YYwgH8j+bQ==
X-Received: by 2002:a05:600c:4ecb:: with SMTP id g11mr5258186wmq.71.1612568175289;
        Fri, 05 Feb 2021 15:36:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:be75:a088:9c76:71df? ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id b13sm13375451wrt.31.2021.02.05.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 15:36:14 -0800 (PST)
Message-ID: <a73d2a0f348c0a377aa2a6aafd1af2616134d9ee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [gatesgarth][PATCH 00/25] pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 05 Feb 2021 23:36:13 +0000
In-Reply-To: <cover.1612488696.git.anuj.mittal@intel.com>
References: <cover.1612488696.git.anuj.mittal@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-05 at 09:33 +0800, Anuj Mittal wrote:
> Richard Purdie (3):
>   gobject-introspection: Fix variable override order
>   pseudo: Update to include passwd and file renaming fixes
>   image_types: Ensure tar archives are reproducible

I merged this apart from the image_types one from me above since there
is a fix for it in master which probably needs to go with it. Could you
include the fix along with it in the next pull request please?

Thanks,

Richard


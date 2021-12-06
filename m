Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AF6C433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:59:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.51676.1638799158063739626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 05:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MCRw/KoK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u1so22549175wru.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 05:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=m1PXsH71QVQfpzgyTmJJyuxcjew5gNZ30fHtEsc87ig=;
        b=MCRw/KoKrJDFhVes0pFV7ifbnvb8x295dzKSZA3d5VtGfv5wNb2DARbgi/YNENV/EW
         oufUrOWJmofCI1UW9J3Nd+Y2vdIdqYu01eQjZkLE+Nd/jBdZ3UYkHW114/x1vHAlPyh2
         dukcuL8IMEdHrEXv1U+OE8HJsfyKymYNDR4qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=m1PXsH71QVQfpzgyTmJJyuxcjew5gNZ30fHtEsc87ig=;
        b=KVHr7IU15dOGXbQmdP4OXW+lrcAIDvIvxipDvkDziMF/5Dl+YOhd4V/idhCdhwxh9X
         IaGc8yTyEpyIRVU+1+n+OrV5DijiOSIiDcWjnopU/675IuFmTKBzNhKg3elnKh8dOVH1
         NG2hGWtdczsTs/Qd1tRvAuFCECUFXBZ8H4w2b3C/4cAexs+BwC7bIV7n4pp20c2glXCw
         jHBXVMSsjeC8HAYDzW8iFdQi78nOcBW1IxdtxeXYoAHyKI9DUrB3tcHaAHqiHpVC8rgP
         S6dWp3s0Z05ZWoJZth1ekj4ZtyySxRTSbCKUQSTnhhF6HkzsBMi9epESoUmI2m07Pj07
         7IYw==
X-Gm-Message-State: AOAM532ZqMfS4UiRK4gk759TN2yfsK9pL0k8JSp4RsAF7/j4+XK6RXhC
	Vz8m/UFQDSkAwDNlYJ/l5GzRWQ==
X-Google-Smtp-Source: 
 ABdhPJwxIn3R6fh4JqIKw5UK+ymSTH+2jo9waUBdUn8/gEtBnopj+WXmD4QUvJF2bkjEQqcodv2rEw==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr43704984wrr.53.1638799156462;
        Mon, 06 Dec 2021 05:59:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50e7:dab5:2141:24aa?
 ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 n13sm11690650wrt.44.2021.12.06.05.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 05:59:16 -0800 (PST)
Message-ID: 
 <f0d640e1911f8e9577ef7ee5ffef426b084861f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] minicom: Upgrade 2.7.1 -> 2.8
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Dec 2021 13:59:15 +0000
In-Reply-To: 
 <CANNYZj8r-3BvcYnaiBbTGzBJ_iAPg6Sn83Dt4N4NLUh+vP-=yQ@mail.gmail.com>
References: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj8r-3BvcYnaiBbTGzBJ_iAPg6Sn83Dt4N4NLUh+vP-=yQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 13:59:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159229

On Mon, 2021-12-06 at 14:43 +0100, Alexander Kanavin wrote:
> Since AUH didn't pick this up, can you run 'devtool latest-version minicom'
> with this update, as it probably would report something that needs fixing via
> regexp?

That shows:

WARNING: latest_versionstring: package minicom_2.8.orig.tar.bz2 don't match pattern

Cheers,

Richard



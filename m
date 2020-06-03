Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.11592.1591183162295694657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 04:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C29ye3UL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x14so1947571wrp.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 04:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rt5gMRsttHSIgc5iMLN6GszfRn/b+jllmIr4leGsCTQ=;
        b=C29ye3UL/rVNEHBtWNJkqYYenfPMXLfazK56ozAJPY/ggpI5adi39c2BRcfquGiAdH
         ADJqMhGsZcoCmD/MuEQtuMU/H1nOAOCtlCvO6kXA2h9PZmB8wzVwEF9hB0eLGtglZkHq
         322bKV+9GGoE1FxTxwimOsdlCTjPHlOZmB8uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rt5gMRsttHSIgc5iMLN6GszfRn/b+jllmIr4leGsCTQ=;
        b=MuMpJ/c3DiZhtrS6Bysm8cKmdNZISLPngaEQQ+kF8gClEfAnkZFUWEWD0rjtQFxtOQ
         gn/2sRHHxjeLyDrLhWr3ILzXyVg98MeGwbVOs/Zu+fefb+W9b7tGi386ooPXTA46O5U5
         QoREMKnX9Q5g+gjcoBATL+h0d4NY+kzMqu7+zI66uZ4gQlAqU6bmpxMQvm29fcLPCyPX
         SXntet12wvwyHujmCxsz7t6BlXNO/2GhkXPH+ksS2q+MPJnvnP8EKgHLZYIVbvG6pywo
         TRaYieMQJRTzBBNlwyFxDZNd1JNb8LGaPdtYxk+MMGVHGUQtfiRLlwLuUX6LkAFktXM7
         qyEA==
X-Gm-Message-State: AOAM530R+D0qCeNromsLTkR+DcJSK2D5BBuFdT+/ZzVmRHJitrVNVpm5
	VQfPYYPEE5d0Z9n3yfvoFemVvA==
X-Google-Smtp-Source: ABdhPJyMiXXctRQbps8U4fIYhKb1Dhr6MVzWYoyP4rCjoIOEQMhwecedJUCPpidTKVAILv2CWn5kyg==
X-Received: by 2002:adf:8b55:: with SMTP id v21mr32090453wra.187.1591183160832;
        Wed, 03 Jun 2020 04:19:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id f128sm2567938wme.1.2020.06.03.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 04:19:20 -0700 (PDT)
Message-ID: <275c7726e04b7da93cc068ad2ae6ce594b242ab5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ruby: properly append PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jun 2020 12:19:19 +0100
In-Reply-To: <AM7PR05MB68817744EB44DC11D7870292A8880@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
	 <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
	 <7deef78bc70f79f48cc8d9da5c0e18bcb305cfbb.camel@linuxfoundation.org>
	 <AM7PR05MB68817744EB44DC11D7870292A8880@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-03 at 13:03 +0200, Konrad Weihmann wrote:
> Well I see a valid point in keeping them separated.
> PACKAGECONFIG is just a static list of things, while the other
> setting 
> is based on DISTRO_FEATURES. If we merge them, we kind force any 
> override from local or distro.conf to copy the DISTRO_FEATURES block 
> into their code or remove the DISTRO_FEATURES check - none of the 
> options is a good one IMHO.
> With that in mind I personally would like to keep them separate and
> just 
> fix the append.

There are two sides to that, its also near impossible for the user to
configure this option other than changing DISTRO_FEATURES if we use
append, we can't win.

Cheers,

Richard


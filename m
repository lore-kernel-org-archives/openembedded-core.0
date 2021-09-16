Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.8023.1631779385491878069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 01:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f9r3Do55;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id y132so4124316wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=nRqH6VRR7b99ui5I9K6L+gw37BUXTqvsGJLZJ20HWAs=;
        b=f9r3Do55KHLl50hGH1p1ea4WVbzxTDIg0/3PKc6lWKsZmneeHx/BPZStMkXIx/L0HI
         OUmcM0IohO9xlwlLwg3SMQd9C/6/riUZUw89ZolJ8y5ZzeTOcrbATlGtOOqIYl97YMQC
         eyz8P+Nj0JMr6kgMLqEXhubg0tr/ckTOKoSKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nRqH6VRR7b99ui5I9K6L+gw37BUXTqvsGJLZJ20HWAs=;
        b=YmMWaquS5GihCTOAEuR83EIy8qJO5fsb0ezG9r8YVUIZt4ruRfoDagtoutW1E8clr4
         Dpn66txk3ruyTi9hRdw4PZqCFfQWeqq5M3G0QnqCDEosRUjXaxa2HpaOP78Knm9rZ5fW
         rB7N9udZTmZCQHnjRKBTnEVJ6zgsxoPQEJz4pPlfVFyJI2ACm7xtkdk1qKKCFiZXC2BP
         7ZXCtq1Qw32r+5pj+RTJD1i812Sk/KtN5uTD2ayNfNBeRI4v1c6pDYUXdaw0i9lJDqbn
         RSg3WIBOQD9sSEsDtEV3Vpdt7IDissSqzn58wfK5uzvFGp6tBTkSdWoFahgF4kWxIuhS
         gRDg==
X-Gm-Message-State: AOAM533WoLgXkEgzujQm8t5iZK9LjNG/jFbhEnK8E3SFcAXXGIB72mOZ
	IaIpmbukqnDIWurKnD6l3lqlXg==
X-Google-Smtp-Source: ABdhPJy5uxSe5GaPimGJ7x7fdXGwFsE7GIkOorkC0YkxU8kk8tI35n4m+F9nXx8t7Q3WFyKexcqWUA==
X-Received: by 2002:a05:600c:3656:: with SMTP id y22mr8696174wmq.58.1631779383637;
        Thu, 16 Sep 2021 01:03:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c? ([2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c])
        by smtp.gmail.com with ESMTPSA id g131sm2238563wme.22.2021.09.16.01.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 01:03:03 -0700 (PDT)
Message-ID: <556d590b620342703897becbeda6ebfa4d20aef3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH] wayland-protocols: upgrade 1.22 -> 1.23
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, Denys Dmytriyenko
 <denis@denix.org>,  openembedded-core@lists.openembedded.org
Date: Thu, 16 Sep 2021 09:03:02 +0100
In-Reply-To: <137620f2-df0b-58fc-6d47-89075626c844@gmail.com>
References: <1631754397-46490-1-git-send-email-denis@denix.org>
	 <137620f2-df0b-58fc-6d47-89075626c844@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-09-15 at 19:31 -0700, Armin Kuster wrote:
> So we wait until that branch is created in 5 months before we can apply
> it ?  Is this like post dating a check?

Alexandre and I are using "kirkstone-next" as a place to queue things for the
next release so this does make sense.

Cheers,

Richard


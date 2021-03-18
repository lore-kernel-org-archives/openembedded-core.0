Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.1706.1616103317740809203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 14:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XKg9wwYH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id x13so7055546wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 14:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NsZTHP9kWBq2tBGoiI0ghsy3Gs1oSukedtHOe/l8I34=;
        b=XKg9wwYH9qBAHfk2P4VPp/GG+7nezXCZDqfHCr3L1XPfO44Rl+wy4drYJE05zZGhYw
         x0WCC10WYfrYquSPgKPWroqUW1Jj1S5Uf203ZXd3Hbootfujl2mO3fBneKNJ7ldvYCUN
         lEPqDT2m/l/imwXqqRioEOEU3bOS7xzHsZJNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NsZTHP9kWBq2tBGoiI0ghsy3Gs1oSukedtHOe/l8I34=;
        b=BX+KzM7fDOpgWAJI2nyWZJgEJtulOhu5Ail7AxraOnoijbQd/AHT7M3MQFFdiDW0t2
         qoGJh1JkcT2cUKHSHj74IU+OprScHKLwWfUO+yB8D7wIeNzVaAmipLC4Es+pwA/YkdrD
         LXCpzTKK2vqCIg/psFvuCYTaiw0sugj9kxCbbSMITWdg57ol2D33aaymJ0OJWucRlfxB
         6hprKq762cV2Q5LZU1tpvnymCxsziWYRsBvPUMZWdOYtrR4+Ti9XRdrZY+mJU1SFWZ/I
         0ykn/sysRhJWGio7ImiApVo6SdwXWTyS0hAmsyXeffoR3BEIrZBXswXYRohFoV3voAmF
         sLxA==
X-Gm-Message-State: AOAM532TP0w23ZJdyemYrWCdYllbqVOhk47J3fOu9fZT0Dt09BLGKxtH
	iOXplRKqqh1wTkwgj0Tj1+7C2w==
X-Google-Smtp-Source: ABdhPJw7CvheHLBue8z6kX/V08F/sGuHnryYFdyldzNIpN69ybnL+7KxkgVFe+OE8rUT7lUXGKMpgw==
X-Received: by 2002:adf:8341:: with SMTP id 59mr1224121wrd.130.1616103316198;
        Thu, 18 Mar 2021 14:35:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:8e52:d330:3893? ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id x8sm4288579wru.46.2021.03.18.14.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 14:35:15 -0700 (PDT)
Message-ID: <68064030f43d8c490dad012568af8c5662085aa4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Mar 2021 21:35:15 +0000
In-Reply-To: <OSBPR01MB18452F81CFCC79059919C38ADC699@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
	 <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
	 <OSBPR01MB18452F81CFCC79059919C38ADC699@OSBPR01MB1845.jpnprd01.prod.outlook.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-18 at 06:27 +0000, wangmy@fujitsu.com wrote:
> > Doesn't that mean we should clarify "BSD" in the LICENSE field then?
> 
> I use spdx-tool to find out the following licenses. Do I need to clarify them all:
> 
> BSD
> BSD-2-Clause
> BSD-3-Clause
> BSD-4-Clause
> SSH-OpenSSH
> Beerware
> MIT
> MIT-style
> ISC

I found it hard to answer this without knowing what had changed. I went and
looked at the difference between the license file in 8.4p1 and 8.5p1 and the
difference is an algorithm was removed in 8.5 and the associated license section
was dropped. This doesn't change the license situation so LICENSE is unchanged.

We probably do separately need to update LICENSE so show that BSD-2-Clause, 
BSD-3-Clause and BSD-4-Clause are all present.

Cheers,

Richard








Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.5397.1593693058124844585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 05:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bU42piuT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id f139so27742297wmf.5
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 05:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EC1Hu4IuVNWd8Wn26Bwmrnx+uFwJB7G9dMFBg2sr6hw=;
        b=bU42piuTLeZ1U0Qeg5bPZnay1Mt5pq45dELvB0y0kSYQ3nDdmWco8PS7ckP+G2A8Qe
         v2HIicLgs21wIqM9glfI1AHnyWqW5LeKtTTKNvDcp4j1/CdJxz7dWOFb0ugIQ8Lx0C1X
         NnJlP4KQ21nGCAFwF2WesIi0UUPk/iv/8cNaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EC1Hu4IuVNWd8Wn26Bwmrnx+uFwJB7G9dMFBg2sr6hw=;
        b=ScnpbSjmuQgLAfRtUVwA1kdSZCXQEhKuERPcezLSBNhKkKbW71SEmTKusb+o/S35mT
         f8BWxqiuafG6FnP6d6P4EwZPQMmexz2b4IhDogVWV8BWqaOu+pmUpe5E+mEnxBUogIJ4
         7hOIYW1E6LV5VvF84UJlPJQkfVoIZWVI/iiX3BXpT+Y3/tUZYi1klr094aZRX+Ly4LLR
         IBwPimj1/UEFNQRW08Anz1kSoS6r/LTnjTDl65jfhLZb8vWtrlzlYxthKf1/GSFvjHW6
         U79EtS8BytgMeUaYEulidzkE1cpHw/neJh7gbYEBF3PCo5vD4lTwCkXcGDY6+VqLlGkG
         +gOg==
X-Gm-Message-State: AOAM531cbyp1xvyGWZY5Uip+DRUSqiu4cW0hhYVCEeB0JpXIeowX+0IJ
	pZcF31L2bkcjucA+hV2o9RMm2w==
X-Google-Smtp-Source: ABdhPJxpiad+muMukQ3F0P95gD3Ho1FKTa4LJDLiMwOQ4yZrSZKK06QMivPm68kSuH+vZExwKo0zeQ==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr34262835wmb.168.1593693056621;
        Thu, 02 Jul 2020 05:30:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 30sm11499534wrm.74.2020.07.02.05.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 05:30:55 -0700 (PDT)
Message-ID: <d82f3dfbb84c30f39b46826cfb2240c786b8ad87.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] systemd-conf: unpack to $S
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Thu, 02 Jul 2020 13:30:54 +0100
In-Reply-To: <20200701221129.99170-1-joe.slater@windriver.com>
References: <20200701221129.99170-1-joe.slater@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 15:11 -0700, Joe Slater wrote:
> systemd-conf copies some files to the target but they
> are in WORKDIR and not visible to the archiver.  Unpack
> them to S.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../systemd/systemd-conf_245.6.bb             | 20 +++++++++------
> ----
>  1 file changed, 10 insertions(+), 10 deletions(-)

Whilst these patches are kind of ok but I can't help feeling the
archiver really needs fixing...

Cheers,

Richard


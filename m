Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.5503.1615983765447747896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 05:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VpmyipTv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so1176926wmj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=utu1zcaaUbFXat0Zech7jTkOo8cwU+kZuNQUVbAKLLo=;
        b=VpmyipTv7ubajXQkLZpq6fYhiF58gQBcFLAI2I+49s9OiwZH6u5a+otfAqYOcQuHxr
         BmsSQqCkIlEmyHRuBdlltrLvHUYlh+Oz51L6boXKUpDBAI2ATPOo1Ftd5Fb54iReILHQ
         hLu59nnPcl96PHcxNl6xdGbeRWbdzWEX8jYZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=utu1zcaaUbFXat0Zech7jTkOo8cwU+kZuNQUVbAKLLo=;
        b=KVmOb+lV3L/8d/bGLMKwud6l8TaCZ6QRsYxFmalPlRO1QdUB3jy/v5rX0Z63P182d0
         sJYxvwWs19Xsp9d2fuibw2xUfzM2IZO1aGDjuz+KmVjJcjCXUfinGmN2b2roseSI5S0v
         1bnLI2uY3KgwH5yCJdzndV7qGBADxsT52wSs92BGonM0rGMI5tDAFPksYUF5xcO1CcFE
         9SkHV3n2b9mhfCs0mwFtL+uSFgEKoTAxI1pA5z7FR2n1ToNuEPPBVjkbvfEaVc1bZU/I
         mi6jzmNDnhPFJhCqSL51QUEvFcdjrWEOl7Zt4DCof84qCp58TrFS9Ye8STP6/YYcyA2m
         xMjg==
X-Gm-Message-State: AOAM532T45xsLzVbY/ZuLn/Nu2GHcpXDvXJJ+6wkI7rzLimCb7yI3rtN
	lvrRxE/bSl6QyKWEgqDMGuzNng==
X-Google-Smtp-Source: ABdhPJzL7SuwSAwhq8Pcgu9JQ0GmLkSD1xTm/24GfhjdECVnpyvehn6NQaUHAm9xpth0bFDttiVBew==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr3492531wmj.100.1615983763813;
        Wed, 17 Mar 2021 05:22:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c2b9:2be9:3f07:3c55? ([2001:8b0:aba:5f3c:c2b9:2be9:3f07:3c55])
        by smtp.gmail.com with ESMTPSA id x8sm25363910wru.46.2021.03.17.05.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:43 -0700 (PDT)
Message-ID: <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Mar 2021 12:22:41 +0000
In-Reply-To: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-03-17 at 16:39 +0800, Wang Mingyu wrote:
> 0f90440ca70abab947acbd77795e9f130967956c.patch
> removed since it is included in 8.5p1
> 
> License Updated : 
> 2-clause BSD license and 4-clause BSD license added

Doesn't that mean we should clarify "BSD" in the LICENSE field then?

Cheers,

Richard


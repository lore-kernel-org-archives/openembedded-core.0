Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.1393.1616102324435943861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 14:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DSSq67GG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso4198310wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cyKbJxUFzSk245ZdpxtTfTGHOKYqhi4u3bVGqrO3K/c=;
        b=DSSq67GGXmR8XbExx2TulnI8gAP5zvaYfE332xa+Xi72aPKvQet1+1skvePTOm0c+4
         BqwZAhK5EJwFFZH9+hrzDrglRQscJHAiJj20tQGybvnZ6c/d9wBZLyt7KYwky9rt42CA
         wqAST3nv5tS+JMzY1pr4gqabs7CG395w9zXPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cyKbJxUFzSk245ZdpxtTfTGHOKYqhi4u3bVGqrO3K/c=;
        b=O3O/A/e6s6Faee4lk3WEtfW4Uq2JJ8jrE6Sm/SQa/yEbFiNJSHXFbCTouPIdTumOme
         +MLqiEGnMejmwkfyDtGMgV7QyxhIslGje1w8APCT/2CQFaZV14mc5I+RPoxs28gagq4I
         zDUm1ZAJ+ZeQ/9Gk5izYn+qF5j8mPXV1ifWbbZ1ZrLBJFrzpluyRQhmKPewY2nvJyyqk
         ktE/jAcXRs+Rx8OmaUy76SVV+1iobmeX1Q7hG3e0pZJ5msPT5pwf5RettWoBpa5VDddb
         hCMCgXgSjayheouwY2nYr4xpxyLvGrnBjPeglGjn21Dx6w75Py5wZ9KPW+IircLuTtfr
         NtAg==
X-Gm-Message-State: AOAM531qNAHt63BTYIjyGu3nNRPbx1aZ+I1yuLtc2TgxgsUVAwtEMlEf
	6ngxMnQ4TJhXgKzKmNjreektOQ==
X-Google-Smtp-Source: ABdhPJz28e3cWsIBTNCVGrUHLEstsgsujOLVut1kcXGqDDpJFzGJMQCS7yhe7QpJIE3tMB/qEQvkXA==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr903831wmk.89.1616102322808;
        Thu, 18 Mar 2021 14:18:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:8e52:d330:3893? ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id f2sm4517251wrq.34.2021.03.18.14.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 14:18:42 -0700 (PDT)
Message-ID: <0a5900e6a9abd4e49a92c0150950077ce60afa37.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: support both KERNEL_DEVICETREE/EXTERNAL_KERNEL_DEVICETREE
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, openembedded-core@lists.openembedded.org
Cc: max.krummenacher@toradex.com, sergio.prado@toradex.com
Date: Thu, 18 Mar 2021 21:18:41 +0000
In-Reply-To: <20210318124758.26407-1-liu.ming50@gmail.com>
References: <20210318124758.26407-1-liu.ming50@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-18 at 13:47 +0100, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> There are user cases that a developer wants to add both in-tree and
> out-of-tree devicetrees to fitimage, and this is quite normal, for
> instance, a developer might need the devicetrees from kernel source
> meanwhile maintaining his/her own devicetree overlays to be applied
> on top of them.
> 
> To support that, we now allow KERNEL_DEVICETREE and
> EXTERNAL_KERNEL_DEVICETREE to be both set in configuration files, and
> the devicetrees in EXTERNAL_KERNEL_DEVICETREE have higher priority to
> override the same names in KERNEL_DEVICETREE.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Can we please get some tests added for these code paths?

Until we do people are going to continue breaking each other's 
use cases :(

Cheers,

Richard


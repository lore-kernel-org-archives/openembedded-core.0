Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C6DC6377E
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.11082.1649539062492214908
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 14:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I8Os9Y/N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id i20so4602690wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 14:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VjvcjqaqcaScDP5i5hyCUHDTqSQySNjFGyKtZZnHvn4=;
        b=I8Os9Y/NBEqgWbi2QloL7ES4vlCLTESzWpi78DUQi0NQGngQQJBtfALLQW/4SrxIVC
         r/248ercWLXWNSm/VSxi5HrkffCT2wrEnS6/gQInNy0WgFOhfV7fWZHAauRkoJEFwgpb
         9YebCEME0ypgnGzOrvztZwESFF2nmXd7Maan4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VjvcjqaqcaScDP5i5hyCUHDTqSQySNjFGyKtZZnHvn4=;
        b=0huR1WSy6Qlfsz/JD2dXMu3Bt6Znv8s3spPT2XUug5Ep2tf5kAO4hLzvlHSWJ0FUlO
         4eVvvDvURduE+ruJ33DEE8Pvbw0xpFNm/z6tEGpJTqQGY2+vX3EKS38cJgCxevkLS+rP
         hRfHi7wkBQzg202spFeswFRn1/a5I5DR08jQBQeXFjvZ+R6bdLSVpG2rV4zGp/vmbWFz
         WRKIJrVXvklDz9ts7ItwDGs5Ua6Ejf+rvrR16p7U08NLDPKmPuhQ9bAnYxj8g5qFPQ+g
         dH0+yRjnxMzPY/AIsw1v6wL6rnl9o/RIr2qdZNGoNwvHEh3OKD4wY86CainYXBL+dEFZ
         Bzuw==
X-Gm-Message-State: AOAM533Uqi5ajkOHcZid6CoRCqBiOzPs65cZTEkgxWXXhTIjj8lEUeqo
	Vv7D4E9SMS1kfTdxk+DFRaL2xQ==
X-Google-Smtp-Source: 
 ABdhPJxk7zjwdVpJq6DvxW2pRlEIv1h7J3+Cr4gutphVe1C+WCHEBO4p6VLPHMy2XpVGLRPB5M5zGA==
X-Received: by 2002:adf:e789:0:b0:205:8e6e:caa7 with SMTP id
 n9-20020adfe789000000b002058e6ecaa7mr20146164wrm.576.1649539060808;
        Sat, 09 Apr 2022 14:17:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9df4:c2a5:c308:84e?
 ([2001:8b0:aba:5f3c:9df4:c2a5:c308:84e])
        by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b0038eb51fbb2bsm1998304wmb.45.2022.04.09.14.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 14:17:40 -0700 (PDT)
Message-ID: 
 <b653122835d4cfdb414bac3d8e36b16a8c6f55de.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/6] poky-tiny clean-ups and qemuarm fixes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Sat, 09 Apr 2022 22:17:36 +0100
In-Reply-To: <20220408192521.1608764-1-jdmason@kudzu.us>
References: <20220408192521.1608764-1-jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164193

On Fri, 2022-04-08 at 15:25 -0400, Jon Mason wrote:
> Changes in v2:
> * Addressed Khem's comments
> * Rebased to the latest version
> * Added distro description for poky-tiny, as this makes it more obvious
>   which distro is being booted when there are multiple
> 
> The yocto-kernel-cache changes were sent, accepted, and should be
> uploaded shortly.

Still breaks on the autobuilder unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3923
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5035

:(

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4846FC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 12:56:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9749.1651237017175180736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fnFEap5I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id d5so10689926wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LLWWEDlOgYZpN9+xby0ImN5jscWq1aFSUUgrotmQ0rI=;
        b=fnFEap5IFq0aGiyR2vHfc9KxKSqY5ad/ORou+GSyRGHrYnZOju80BGnhTPDIFlUzln
         AErn9VH/fXMnzqHGVtLI8aHajc4zsSUIh1xvIf3224Fz9BrkHgeK8tUiqsN4x3+mc2pT
         E5o9Hc0W0Ikardo1jAIYUF658vSa4YH93e+S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LLWWEDlOgYZpN9+xby0ImN5jscWq1aFSUUgrotmQ0rI=;
        b=cgqezWN6kKmOzKK/KdsrvXZ8PQGfc5CJOf4TUvbTaV5yKNM7/EEdVEMfjKvN+SF43x
         6Dk9rtDIgnZxEjQUzsmgiugPbGv8OWzIzKV5Jk2QgTqG+ZmMasbfxMP20E8eNERYv/nk
         /KTMln9nbQ1dNpDuYgaeZCCDYileilpyTj1sTSHRaEEjHx6t0fQzSZTk3+PB7yMnBzJ5
         Xj1hhrAitQPTwydMNs6nIiGgq0kD5VMNSQjTZTBbAy9euOKxGJzgdeAnX/JoDGYMucBj
         Y8ZCeWthBTnYFpQESeH4dkteu0KFValq3kNP9faHq5tKdpLtuKEHr48UH/ETXWprxl/u
         u6SA==
X-Gm-Message-State: AOAM531fk8h3bq+Jq7fgmlc6FYCVpm0q5prxELl6uC8J/uy5zWSmJPjc
	t1i0TBEtXOm/xwUN8ge0CpD1qA==
X-Google-Smtp-Source: 
 ABdhPJwMdCbjAE3e6TWeDGQAnmqukHD4wIrzy+h1vj8ou30S9xUPhUa5h4qN8Ozzt85+Imtvv7/CEg==
X-Received: by 2002:a05:6000:1ac9:b0:20a:f62e:8ff7 with SMTP id
 i9-20020a0560001ac900b0020af62e8ff7mr6950838wry.424.1651237015480;
        Fri, 29 Apr 2022 05:56:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:480b:fc7a:f316:cb3a?
 ([2001:8b0:aba:5f3c:480b:fc7a:f316:cb3a])
        by smtp.gmail.com with ESMTPSA id
 n1-20020a1ca401000000b0039419509eb8sm2599575wme.47.2022.04.29.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 05:56:54 -0700 (PDT)
Message-ID: 
 <06250637d4cdd75a322e53dbe4a983c2488a2e3d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] [qa-build-notification] QA notification for
 completed autobuilder build (yocto-3.1.16.rc1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>,
	"qa-build-notification@lists.yoctoproject.org"
	 <qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Apr 2022 13:56:54 +0100
In-Reply-To: 
 <DM5PR1101MB2348A19B6BC4935A96FE48A4BBFC9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
	<0101018065844051-3f135aa2-6cb1-485c-aa27-2c921567884b-000000@us-west-2.amazonses.com>
	 <3c965c4de0252fed6b817deec761713addc6fb5d.camel@linuxfoundation.org>
	 <DM5PR1101MB2348A19B6BC4935A96FE48A4BBFC9@DM5PR1101MB2348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 12:56:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165012

On Fri, 2022-04-29 at 05:32 +0000, Teoh, Jay Shen wrote:
> Hi All,
> 
> This is the full report for yocto-3.1.16.rc1:  
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> 
> ======= Summary ========
> No high milestone defects.
> 
> No new issue found.

Thanks!

The TSC did discuss the perf issue earlier in the week and were good to release
if there were no other issues found, we should therefore be good to release.

Cheers,

Richard



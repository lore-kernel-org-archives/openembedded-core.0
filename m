Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.27429.1612736747437843498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 14:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PdyQ1ArM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id m13so14995815wro.12
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 14:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jIob4fheTc7atzp1htFuM5hZ9ZmBYd09cV/QxSHl9tU=;
        b=PdyQ1ArMhW8/HCFP84EU+WDR/YE1Y7Xu0Zil92UKImYbO4WZk7q8XbjxvdJL3udJu0
         IMPZ4ihu4NnH4U0FUAqlUpADMb3q5jABvWXqbrAVAjVsPpnmZ13MinMDX9K86et1ufB0
         ERqiy33wgf+rFGEejIi0cHljGo7J7TJSihnoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jIob4fheTc7atzp1htFuM5hZ9ZmBYd09cV/QxSHl9tU=;
        b=W+ctpAXVC4NhSYIz4gyyCuYqVx5DfFkB2p/vrp605Au6Q6uStm0FHbZpL/oc7ygtH0
         mYcKHfP+zdquy1dTzXZzyI3iYxWzVqkUm9nYkuFRqTb1djDMTJ7lZUz3c74oUYD0v6iW
         forSEGBt/yC94/CAgUADMYUb/el/3/+gwidPxToyhjkw0GwBcQhNfTXwY5NDoDkzSCdU
         lErksoUORxHxjNyDc7qexRwN9cL/ilg8CKlwIfEwLdw6ErS3yhtpF6cpwpzXsaboWb6p
         quQVOdSKjAF41VQdt5+4IxW8JvZ/p2xRMxZxU7bgqCkhMLuX8M0W28Yz3dCUgM2pWNUi
         ItDw==
X-Gm-Message-State: AOAM532qcZ1Z6ZX1S3VNx+SRG5nNolVdy7QxdyL35HxfJDeDwt/M3djl
	hBTkc2BBx6TqhgnDkB+QD5wxLg==
X-Google-Smtp-Source: ABdhPJwrq9YQb109lopx2Mypl29w7cyXVEd4EHmsDmZZLzvcF+KFPZjPSWG6I3DEfKis8gMSYYYmZw==
X-Received: by 2002:adf:a501:: with SMTP id i1mr3705119wrb.149.1612736745720;
        Sun, 07 Feb 2021 14:25:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff1a:4654:ede1:462c? ([2001:8b0:aba:5f3c:ff1a:4654:ede1:462c])
        by smtp.gmail.com with ESMTPSA id t17sm6222897wmi.20.2021.02.07.14.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 14:25:45 -0800 (PST)
Message-ID: <f772741f2969f3b3e3ea117fb35c8a39a9a14756.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] shaderc: add option to skip building the examples
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 07 Feb 2021 22:25:43 +0000
In-Reply-To: <20210207180504.1552900-2-quaresma.jose@gmail.com>
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
	 <20210207180504.1552900-2-quaresma.jose@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-07 at 18:05 +0000, Jose Quaresma wrote:
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...dd-option-to-skip-build-the-examples.patch | 45 +++++++++++++++++++
>  ...lding-external-dependencies-in-thir.patch} | 32 +++++--------
>  .../shaderc/shaderc_2020.4.bb                 |  6 ++-
>  3 files changed, 61 insertions(+), 22 deletions(-)
>  create mode 100644 meta/recipes-graphics/shaderc/files/0001-cmake-add-option-to-skip-build-the-examples.patch
>  rename meta/recipes-graphics/shaderc/files/{0001-cmake-de-vendor-libs-and-disable-git-versioning.patch => 0002-cmake-disable-building-external-dependencies-in-thir.patch} (55%)

There is still something odd going on with the shaderc changes
unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1835

Cheers,

Richard


Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.1184.1622760962846304919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 15:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ifUaUJEY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q5so7415126wrm.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RGwvkA5OHatBqDFWXKvh8yWhThV/mVD6RNMNeqplcXM=;
        b=ifUaUJEYFUQ1oawL9NV3MdO/PaarEt4Ts0uPGhpetvzz1H2+t0DS4PzFbkZn/vBLGE
         RmhzLSBqDJcfOzwn37pxPGsjBFRs3OqQu6Fb9sJ1iFAs5xWPB/U7IM3LAZMoyXJxqQyc
         ytbN0G20HFRIn9QifaukUKm7EOWXruI3xT52k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RGwvkA5OHatBqDFWXKvh8yWhThV/mVD6RNMNeqplcXM=;
        b=At/ptiSar+KqR9GDCrUEOgMhwKlREQhHJjdVWcpwipSQbFbpzc2buUzYE6o6LaSg7N
         DidgsKAj76la7K+aOHxqQp+uYXIwWSOFlD6z+0JCxNwdlNquBAGJV71FWSCcIbFE8g9f
         uArWT0b0pHXQqEDkB3ZR9DLRumN0yunAQlJvY3tw4MRbi5l0MiV+aHob/jsz/0xVc8uD
         gan7nzBsal1JMBBvJpy8Z+teRz8fRqZepfM1KRq541Yi0drCQrQPv+8k3jCFn/xKAm+X
         hCEdIdIEyoITkhHjm9RK+NvBOpm+eTrdTIPFyePAGpQN1wdQkZIoDpe6pbUZZGJbgVDQ
         eyWA==
X-Gm-Message-State: AOAM532tb15J1s0ghOicD0D9kJpgyBHzLTzy8EaEpdGMAPqMEbMq7J9g
	ICGMcctFwtkXOmXPPP54l1xfKw==
X-Google-Smtp-Source: ABdhPJzoUot1ZKl45v2xdlOMcVMkYzuOjj3+Rj+5w7X3f0D78J9WWXPala4C5tetAMsKGpSAmYPU2A==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr679575wrt.5.1622760961114;
        Thu, 03 Jun 2021 15:56:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1fce:265d:903f:2948? ([2001:8b0:aba:5f3c:1fce:265d:903f:2948])
        by smtp.gmail.com with ESMTPSA id u18sm3980968wmj.15.2021.06.03.15.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:56:00 -0700 (PDT)
Message-ID: <cd040f679896a21e487de2e40c3faef52c70898b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] elfutils: upgrade 0.183 -> 0.185
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zangrc <zangrc.fnst@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Jun 2021 23:55:59 +0100
In-Reply-To: <1622525045-17496-1-git-send-email-zangrc.fnst@fujitsu.com>
References: <1622525045-17496-1-git-send-email-zangrc.fnst@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-01 at 13:24 +0800, zangrc wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> 0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> Removed since this is included in 0.185.
> 
> Refresh the following patch:
> 0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> 0015-config-eu.am-do-not-use-Werror.patch
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{elfutils_0.183.bb => elfutils_0.185.bb}  |  5 +-
>  ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 -----------
>  ...infod-client.c-correct-string-format.patch | 56 +++++++------------
>  .../0015-config-eu.am-do-not-use-Werror.patch | 23 ++++----
>  4 files changed, 34 insertions(+), 83 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.183.bb => elfutils_0.185.bb} (97%)
>  delete mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

Fails testing on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2209

Cheers,

Richard


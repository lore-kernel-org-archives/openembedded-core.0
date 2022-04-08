Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32047C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.3057.1649401412574875328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 00:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MOdFcWvN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso6974284wma.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yMvtOBrnXusNM2DkLvf/sY4sjVqtcvXdrIP3ZwsO9l4=;
        b=MOdFcWvNDlFGnudYlzsY1x1sWjRFEedIz7d0KbjE5Xh5DdxzLxoN6FNRsPHiiV71V4
         ZnTXCCJ/rVb52WwPzFIHVMkEEmWJCmGqkjRZ0ERUcmPDyKhLfzrHyg1S7QtqFsfM13HT
         1j6fsFQPVEBHC+7PHLQ4sXwmt2L/p+jARLE6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yMvtOBrnXusNM2DkLvf/sY4sjVqtcvXdrIP3ZwsO9l4=;
        b=pnYq5Gta/IAuDf1GtgCpdXZ9RwzcizVEtRmtk7/goQDje4ilqE8CXt6yKvO+ITGaOf
         xnN+mOpFT41Mu52fjuWnk5FPiaB7rZCHnRkXQR8kxEAoJVv42b+2bVczRT5XHEAI64Qk
         Ne/JT7FSmsZfoa89ZGM/0i6Yi3a4bST9YVAwS6zUyc5IUKXP0k2fHiTYJHk3JkPDXMwu
         CjI3UnVUtk2TY3GciaynwYcxZgItOrgBz5qJQcjj30wUK2gkFVKu5+M2Tnx0GH1Cvt+u
         ZodMnR+UWwCkYmnMCOJ8eh2ngaVs/fP1okPjaSGN5ztR+2+6k2ChQIP4uupZ/1cX62yh
         illw==
X-Gm-Message-State: AOAM531kr91v51DW8ibPvLO0raBO51TSRMVznb2JFFaRzjRJUAx248i3
	/ziH5USD1HmGPiU5xQOG6vUjzw==
X-Google-Smtp-Source: 
 ABdhPJznwpRnTWPsHsrEdi/v2VIJ1f1qsq+AzbpnHPw2SA1Tw1+Vh/vliv3ojZWow+JlmZldI24D5A==
X-Received: by 2002:a05:600c:3505:b0:38c:a3a8:8479 with SMTP id
 h5-20020a05600c350500b0038ca3a88479mr15849087wmq.4.1649401410849;
        Fri, 08 Apr 2022 00:03:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7523:62f1:cfc1:cb4e?
 ([2001:8b0:aba:5f3c:7523:62f1:cfc1:cb4e])
        by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e6c62f527sm13271199wmp.14.2022.04.08.00.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 00:03:30 -0700 (PDT)
Message-ID: 
 <c29a79f917c3f91a2661192102eb25868138c12a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/17] llvm: update 13.0.1 -> 14.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 08 Apr 2022 08:03:21 +0100
In-Reply-To: <20220407170029.3500874-2-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
	 <20220407170029.3500874-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164153

On Thu, 2022-04-07 at 19:00 +0200, Alexander Kanavin wrote:
> llvm-config no longer links with libLLVM, so there is no need
> to install it in -native (and it isn't built in the first place).
> This also significantly speeds up llvm-native build.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 2 +-
>  meta/recipes-devtools/llvm/llvm_git.bb      | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

There is something not quite right with one of the llvm changes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5022
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/5043/steps/32/logs/stdio

Cheers,

Richard





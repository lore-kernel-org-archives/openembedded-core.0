Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A9EC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:40:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.22744.1647420019742851823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f4iUyRKX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so2774025wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=F2aUIz6f/MOAfIDK8tgdEzLsTJDZiicg4m0iW4Q8b5s=;
        b=f4iUyRKXNhZLLaSq9KmOGHEWbtLvUxQg4uFOvrpRHmzEKvsT4JHa1iKSsa1YMnC3aV
         z6sxq0qpgaQ3r/pqs9+qx8tDtF9XOIelRktvq9SOPStWpf8SkT1eHwW8l4gY9AejCQS0
         OEDA4Sej1SVP2nhsNm0x0AbEkc8F1v3AJPG40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=F2aUIz6f/MOAfIDK8tgdEzLsTJDZiicg4m0iW4Q8b5s=;
        b=LCzi/T6Yg7rOUTMJKtAZYFaczjSloKtyF2DFWLy3qFvUFzmIV0h2BEPEBKUKQZYn0S
         ft930jcilHTA0FYMBt6wB9YxkXcWCs/DHik4IjKVZAJExIxiidmZY2b+xgyFREwLP4mC
         8RcN8q1p1GkhNG85chUS46yF4yWwaroxxgbj03W4AxWC8bbR/kK4OcOJT06DZ/eaF++a
         G0FvI7N43vnMnyJeZ4G6DeZx04fy1pHaiyS0ij3umCcWhVUWeZzActdD9nhoq2uAFuRs
         UK2Ygl48JR6I3d8qSQMxpUkycEs9aBpeMvif0jn/6pkk76UctW1IWMSkw/gM5OvjO8P3
         71QA==
X-Gm-Message-State: AOAM533nCN1aWAKQd5Rn6Ui/urgOECzQlN2DM4zNeOaT7GDr5OyOxSj8
	A48D21Q6jTiV5ZOAFzzo39toTw==
X-Google-Smtp-Source: 
 ABdhPJyP+PXVlddNYKsDEXl/r2wt1HaaStlyqVvUWhv3k22crCtjY/zqPoBWpmCLw4v6UrjCVu34Rg==
X-Received: by 2002:a05:600c:a0e:b0:389:a375:980c with SMTP id
 z14-20020a05600c0a0e00b00389a375980cmr6437747wmp.70.1647420018104;
        Wed, 16 Mar 2022 01:40:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bc44:1420:18a9:e343?
 ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm1138758wry.112.2022.03.16.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 01:40:17 -0700 (PDT)
Message-ID: 
 <c05597a89123e374a0ba791cf6e05aa83ebb4fd1.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] expect: modify fixline1 script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>,
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Wed, 16 Mar 2022 08:40:13 +0000
In-Reply-To: <20220315224537.5956-1-joe.slater@windriver.com>
References: <20220315224537.5956-1-joe.slater@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 08:40:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163326

On Tue, 2022-03-15 at 15:45 -0700, Joe Slater wrote:
> fixline1 needs to be processed by fixline1, but we
> short-circuit that.  Enter the multi-line shebang which
> I am a bit queasy about, but expect loves it.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../expect/0001-fixline1-fix-line-1.patch     | 31 +++++++++++++++++++
>  meta/recipes-devtools/expect/expect_5.45.4.bb |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
> 
> diff --git a/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch b/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
> new file mode 100644
> index 0000000000..d6f5d7ff0e
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
> @@ -0,0 +1,31 @@
> +From eef7c44c10de32ba399ab162cb5799fafdce3fa5 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Tue, 15 Mar 2022 22:00:04 +0000
> +Subject: [PATCH] fixline1: fix line 1
> +
> +Ironically, fixline1 needs its first line modified by
> +fixline1.  We do that, manually.
> +
> +Upstream-Status: Pending
> +

This probably doesn't stand much chance of making it upstream so Pending should
probably be "Inappropriate [OE specific cross build setup]"?

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80835C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 22:34:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.4038.1636497251106642903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 14:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LKdq+qk3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d5so583594wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 14:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rQodl89jEohB7aoEql0Mw6vfMN9joVyS7PnjxrXDaE4=;
        b=LKdq+qk3t4h8mM4JqeSg/B6YsP7bivV2R/3Rkv7pgkXdcOox37xKLFvYwV6edudsMM
         u08mDdFwREzNAvKHWuZgyyFTGwoj2eA1feSbCGjnnKpCfnLG25VIIj5GlsVPz0l26P3N
         iiEswk5ePFjoKR1FPhDlSk8YgHDAmjZiXlupQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rQodl89jEohB7aoEql0Mw6vfMN9joVyS7PnjxrXDaE4=;
        b=vNlV//+6JfQxtf0aLQlLxU06snaL5UexYBL6WfgbyLm7+m9Cp4mj++StAK/bJO52Pl
         cQN6cUZgUIIcIDbDNwqgcH1bPtYUmxmebAiY+VG2t+4sQflSyCGfSxxeCwIRWoMySP6v
         TvGW6C3NDdQdBE8EfDhzgxqBTaEYwUj5hdpRg3WNVtz+HRQ0Yc/OtDyFq97TCzTfmN48
         CsqGKfZ9HS0SfC+KuB5f5kJz4misdMqCt4fB5lolSfroSt5MjTwK26alQPDydByXayUx
         GfCTq0vTcRvHRCoJgYPPd/vmFXoOfgMhlx9Z8obeJ0d+AikmIckfPvmZPJaYbg3JwfuF
         3vgA==
X-Gm-Message-State: AOAM531+1xL+z/k/ebiOCi68VIj5DCo/AVGwgSZwGeLSXk/utLu5qfZC
	eRzEp/WOPLeCMnUVS/upsCSreQ==
X-Google-Smtp-Source: 
 ABdhPJxBvBvCyYLQ6S8RV5uW1hn+Qr1Jopkkukd7T+1N+Sf9ydkWcxWpigWBJwFdqFkbHGrZrd+txw==
X-Received: by 2002:adf:9147:: with SMTP id
 j65mr13447381wrj.163.1636497249405;
        Tue, 09 Nov 2021 14:34:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac1:e64:a6c2:6c7d?
 ([2001:8b0:aba:5f3c:ac1:e64:a6c2:6c7d])
        by smtp.gmail.com with ESMTPSA id
 x13sm21646326wrr.47.2021.11.09.14.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 14:34:09 -0800 (PST)
Message-ID: 
 <cc10a96860a1612bc93080649251e52e12b5f30a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kexec-tools: upgrade 2.0.22 -> 2.0.23
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 09 Nov 2021 22:34:08 +0000
In-Reply-To: <1636470210-60936-1-git-send-email-wangmy@fujitsu.com>
References: <1636470210-60936-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 22:34:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158059

On Tue, 2021-11-09 at 23:03 +0800, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../kexec/{kexec-tools_2.0.22.bb => kexec-tools_2.0.23.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/kexec/{kexec-tools_2.0.22.bb => kexec-tools_2.0.23.bb} (97%)
> 
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
> similarity index 97%
> rename from meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
> rename to meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
> index 95ff5e6ef8..906e5fcd26 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
> @@ -22,7 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>             file://0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch \
>             "
>  
> -SRC_URI[sha256sum] = "40623d4321be2865ef9ea2cd6ec998d31dcf93d0f74353cbd3aa06d8821e3e41"
> +SRC_URI[sha256sum] = "c7dcc59f5b66004d9d91264324e20e0387ea263dbb449708fbf84a4e5ff7decc"
>  
>  inherit autotools update-rc.d systemd
>  

Fails to build on ppc:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4295
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2335

Cheers,

Richard





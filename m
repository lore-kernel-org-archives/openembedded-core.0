Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B611AC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 13:45:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.11391.1639057541406153222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 05:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TLVotrTg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id a9so9766729wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 05:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NJROqq89azv1IDttCDckP4kHDrBNZGOfZwHTCxh5dZA=;
        b=TLVotrTgN/AjwDfYMUqV8wC3ykhTJ/Njwu37b1nbru3gOxOwGFP5Uzf1DuD+uN9X3k
         JA0EHnV9G5o4PyF4xCHntCafZrddozscEoS2R0Cx3hUuiEHY3Fs8yjvn/1lAeUxZz/1l
         /pdy45AanMuA5yCZdAILCUdKhmNDD4RLBwmJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NJROqq89azv1IDttCDckP4kHDrBNZGOfZwHTCxh5dZA=;
        b=thccb5eNfuSb7uTlItR+kl/RkMrZn0HLikBYpdf3P95uEWvbmZC4bWlZGSg0L/LS2w
         xTSHyoM7SPR97/AFhGVfvmbVm8T0bH5ca1HRtY6IvJg4jrseHo6jmhB2fzArn/6c0ukd
         pacqUItEDqaKgOLJMb8EmEQibgZcQ9HiSm+eO88D81JodOrvJ2DuEpMPGZlN3U272Go6
         EV6CD47b3i/CawjhpvZslr65/20uHVSn+C/7KriEfgERr8ii5A+B3WN5s2ear1oekxXM
         j9ZTgbRgQ2PNFHS8CA8ewIf10psI99059nlH2d8TQEhzYziexYvf6jvMpS8K/R0FOy1J
         lY5w==
X-Gm-Message-State: AOAM53350BdCe0kORk68zXez51tltd7xazh+muyOEqkxgwTZMaWz8Z82
	/fcJO6JkQhFuyGPH0YAOQ6Nz+w==
X-Google-Smtp-Source: 
 ABdhPJyOsl8y9sW800oPlpSogkpPmCO8uKWzpCddQB48AXIKvN206yznLgR9jhzJ9UfJOsRN438o3Q==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr6565393wry.407.1639057539668;
        Thu, 09 Dec 2021 05:45:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb2b:2e37:1385:897e?
 ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id
 l7sm7176683wry.86.2021.12.09.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 05:45:39 -0800 (PST)
Message-ID: 
 <2b5536624c6324dd6f73dd6fa3d53e05c33eb64f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/29] serf: mark patches as inappropriate for
 upstream submission
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Ross Burton <ross@burtonini.com>
Date: Thu, 09 Dec 2021 13:45:37 +0000
In-Reply-To: <20211208215947.1979470-5-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
	 <20211208215947.1979470-5-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 13:45:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159448

On Wed, 2021-12-08 at 22:59 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch   | 3 ++-
>  ...p.creating.directories.without.sandbox-install.prefix.patch | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> index e6172ef5aa..5b8fb70639 100644
> --- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> +++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> @@ -6,7 +6,8 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
>  Upstream removed it in
>  https://github.com/openssl/openssl/pull/16004
>  
> -Upstream-Status: Pending
> +Upstream is defunct: last release in 2015, last commit in 2019.
> +Upstream-Status: Inappropriate [no upstream]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>  ---
>   buckets/ssl_buckets.c | 3 +--
> diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> index 91640d6044..cf00dbf5ac 100644
> --- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> +++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> @@ -31,7 +31,8 @@ ERROR: scons install execution failed.
>    and the installed paths (including the paths inside libserf*.pc)
>    look correct
>  
> -Upstream-Status: Pending
> +Upstream is defunct: last release in 2015, last commit in 2019
> +Upstream-Status: Inappropriate [no upstream]
>  
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  

I'm still not convinced this is the right thing to do. I appreciate what the
docs say but I also think we may need to evolve.

Let's imagine we do have an "Inactive-Upstream" status for a minute and this
patch changes to:

Upstream-Status: Inactive-Upstream [last release 2015, last commit 2019]

If you now happen to be changing the recipe due to a new release, this is going
to trigger some kind of thought/action by seeing that status in that we might
now be able to upstream the patches. If it just says "Inappropriate", it won't
trigger the response we'd like.

We're also going to eventually end up with a whole pile of "Inappropriate"
patches, it may be useful to keep an open mind on whether any subdivision of
those would be helpful.

Does this make sense to anyone else?

Cheers,

Richard











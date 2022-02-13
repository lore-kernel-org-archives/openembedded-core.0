Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EAFC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 21:43:49 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.26898.1644788627755046323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 13:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HJJtS8LD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id e3so24035718wra.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 13:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UMzdt273d3+1HbMzsxKI/97vpsfaHtgMr3qzS/9MJjM=;
        b=HJJtS8LDXav+rFBnO4MxOBwWob8GfEDB5wylJLt3/BwrCdrIQfLBZzWaFB1LL981Dp
         ANwoNqpWy/TM06TnMRCvC+EFIiCXWimOWGGt0qHwMNQ4lFV5KunEdi56dcrG73spR4Gs
         XQdWyH/muLeBEP+fpNw54eEjFK0glPd4rLxio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UMzdt273d3+1HbMzsxKI/97vpsfaHtgMr3qzS/9MJjM=;
        b=U5QOC//tPBE0wen4t3jnk13NVMQxG8hiC/YlF268oREO7TEnHLohLMj1K/hZxcFDq8
         e31qNmuwdAJN5ZKCOmktwcpWeGj9PhEqMaBl5ARw050Q0CnhiK1FEoKdYVidk9GlwjQF
         FxiXX9v0E9KtfYR9rIIzFC9MBQAg0WnQO8ZKzLZtl94ep4H5CnTZZNHTo+ly4yjvqxt6
         E526JRu/jTz1RFA4qqPLSMBesntzpygitX97gyaUSJs1LoPLB2e5ZK8MZ4FIT266Tv2E
         fVDtK5JL2gvwz+tF+tJUxFTG4xETWZp+abao6+zvkoMl+ZkH+sxCwDd3JCUDWiAlmqVm
         xPAw==
X-Gm-Message-State: AOAM5322n6WeDJ+yjTlLYPmOwpfXAMixVJQllq7d1FBkd/R7KRP2We5J
	qIRmp/khevETCe6IOhPMrk8yug==
X-Google-Smtp-Source: 
 ABdhPJxqzX1eXd6sRPKPKDO06aQrEtbvne57Y8KrIW5IpPNJHgn3nCuS8Vlapbj46fexQSPusDd35w==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr8721034wrt.394.1644788626211;
        Sun, 13 Feb 2022 13:43:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:385:df26:3e57:9893?
 ([2001:8b0:aba:5f3c:385:df26:3e57:9893])
        by smtp.gmail.com with ESMTPSA id
 az13sm6277760wrb.39.2022.02.13.13.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 13:43:45 -0800 (PST)
Message-ID: 
 <587c1931ebdcc8db37e4cef079130e5c64be6471.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add COMMON_LICENSE_DIR to
 BB_HASHEXCLUDE_COMMON
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 13 Feb 2022 21:43:42 +0000
In-Reply-To: <20220213203454.28551-1-pkj@axis.com>
References: <20220213203454.28551-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 21:43:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161692

On Sun, 2022-02-13 at 21:34 +0100, Peter Kjellerstedt wrote:
> Differences in COMMON_LICENSE_DIR should not affect the task hashes.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fba99e8f0c..47c8cb39f9 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -922,7 +922,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
>      BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
>      SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
>      SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
> -    OMP_NUM_THREADS BB_CURRENTTASK"
> +    OMP_NUM_THREADS BB_CURRENTTASK COMMON_LICENSE_DIR"
>  BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
>      SSTATE_DIR SOURCE_DATE_EPOCH"
>  BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \

I think this has been discussed before and I'm very uneasy at the idea. Some
users would expect that if they add "their" version of a license in a layer with
higher priority, they'd expect the hashes to change.

Where is this causing an issue?

The whole idea of the "common" licenses probably needs revisiting anyway too :/

Cheers,

Richard



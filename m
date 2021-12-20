Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D496C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 11:19:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.4070.1639999147009122793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 03:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=euYmpeSs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so6409824wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 03:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8a5tJJrcg1rOlT0ylZEyZoKPEoH9LIcBF2h8JYZOi7s=;
        b=euYmpeSsyKA1XBuncHBf4sNFGQsB676M4XeCF/ZWEDDq+caqV2XXUu4oqwdKEtGH00
         3PT6dLX+e1SgwFInnCiFXCtTgNeovkh2/Sf78Djp4xB1JxEgo9BMBmWApK7MR7JM2ghb
         tOw7bbQCvbpbuwl+kt+PtLHudA+5zWXbpESow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8a5tJJrcg1rOlT0ylZEyZoKPEoH9LIcBF2h8JYZOi7s=;
        b=Z4ego9NYmIL7VL+lmNKr34vxxp0MDxHd/g3Ns593XpkzErwWPoVjP0UM5CMCWsbDfG
         MUbcysjrVVIt+92Stiz5s/CEEwDDNWgGOpSbrpQ6nODjYQsMKz/qPru6ffl6xQN3LlSz
         zHjzp/GLUKmFgI5OlZ32DeZDXjA9yFVvtk5RweNG9cugpiEXlPtqn5ReFs/KpidwBNUR
         OGs2xi9McFYn+fV3ElbVKRzBqJ63xjstH0AlwXH99OpQh9oW6T6RLs5Vssx182Z4t/GV
         TmQACLe3DKV1bZkSD/RErLRSccmdmnoJDaHWuMbGECBRtOqVKQIbdPq24FPs75WhQAbl
         EEBA==
X-Gm-Message-State: AOAM5306D2fji8hix15bZDT9a3FSyPKBwCfz2jAbSuha4V8qc6eIBvQe
	S3ABj6KX94WBC+OxJnS/oxN/mQ==
X-Google-Smtp-Source: 
 ABdhPJxlUzSG/UnRcFC8Dv8Cno2NRzv6mvNztWy7W2BFJk2DOAWAsNXnA3hHKGFHnNHi0/NhL7aQCA==
X-Received: by 2002:a7b:cf0a:: with SMTP id l10mr13425652wmg.36.1639999145275;
        Mon, 20 Dec 2021 03:19:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2f2b:ae5:15d4:240b?
 ([2001:8b0:aba:5f3c:2f2b:ae5:15d4:240b])
        by smtp.gmail.com with ESMTPSA id
 p11sm4365274wru.99.2021.12.20.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:19:05 -0800 (PST)
Message-ID: 
 <6026fc4ae9458353f58e0a4e881a0958c22e4369.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: upgrade to 3.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Dec 2021 11:19:04 +0000
In-Reply-To: <20211215111146.3065947-1-ross.burton@arm.com>
References: <20211215111146.3065947-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 11:19:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159863

On Wed, 2021-12-15 at 11:11 +0000, Ross Burton wrote:
> Major changes in 3.0.1:
> 
>   * Fixed invalid handling of X509_verify_cert() internal errors in libssl
>     ([CVE-2021-4044])
>   * Allow fetching an operation from the provider that owns an unexportable key
>     as a fallback if that is still allowed by the property query.
> 
> Drop patches which were backported.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch | 108 ------------------
>  .../openssl/openssl/armv8-32bit.patch         |  29 -----
>  .../{openssl_3.0.0.bb => openssl_3.0.1.bb}    |   4 +-
>  3 files changed, 1 insertion(+), 140 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/armv8-32bit.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.0.bb => openssl_3.0.1.bb} (97%)

Causes ptest regressions:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2659/steps/12/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2932/steps/12/logs/stdio

(both openssl and python3)

Cheers,

Richard



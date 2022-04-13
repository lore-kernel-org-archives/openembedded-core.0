Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51BCC3E8A8
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.4703.1649846077501130682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 03:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GIiiGAi2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id k22so1981392wrd.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Bj3213TRvu/+Cj0+4jKwITeAMsRkwlbMQc5z8tO0zJM=;
        b=GIiiGAi2VY7R0Z6V9uvNzDE/sBZj6PWJ0pCV9E8dGnpkpM3NoYWb0SUXvrJIgGCy1Z
         CGEib4YwVd9bLbjc3OxxJdpt4RF+Q+mOQHpQbUCmxNhD/YfpVbZAVsnZZeTUXKIdgB2E
         Crax1XiE3CmlxFbqh4x36/urbEQWnT8T8cD2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Bj3213TRvu/+Cj0+4jKwITeAMsRkwlbMQc5z8tO0zJM=;
        b=HfwchLVFkXn6YOtg+gKSLwR06VSRZLWlRtibLFVclzM8MGmHmI2Fp+zR4G6DqGxTX8
         5KdUZ2tkeYRKHryAKVC/KOD3W8lbZth3Jq3TMmKe/g6Z6gwkgguoGx+uA09w7/Ooybcq
         eX8RSnK2Y9xpFk6WxlSTrHSr+DUtTK8+GDeZ/oSVRPMIhaLqM3Md8E8EBjmuloriUkpR
         ZTzP6lhZZ2DNG+UwrKgPNIYYdPnuA/cZu2e6MWuqgkQUhWwUPY2BHez+rinrXCrt9r/l
         c6ChaYDhteE6E5EEevlYnMwIjHkaU/kHUDhfdAi8469JDRph6nU89aZPw5+1CPqky+n5
         oz/A==
X-Gm-Message-State: AOAM531Dntg0nwSBlpGVSHBz6FaETbs17yJB1zq5zoBPzjzaRniTtTBm
	1SqYkGl6eCQuLStedcdApb30t+kss8s5ww==
X-Google-Smtp-Source: 
 ABdhPJzlAgCqsRhzK/dvVnTb8aWX3Zgt6AAm9H+thrJY1GfO9XOoqAINUQJ436I7YI1ocSxWuiX8SA==
X-Received: by 2002:a5d:5987:0:b0:204:1f21:6a29 with SMTP id
 n7-20020a5d5987000000b002041f216a29mr32846712wri.716.1649846076011;
        Wed, 13 Apr 2022 03:34:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d?
 ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b0038ec526a0e3sm2519658wms.9.2022.04.13.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 03:34:34 -0700 (PDT)
Message-ID: 
 <8d17cc7d9f13ca534b3f56cb299a1e26da042e18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] "bitbake-prserv-tool: Added quotes to
 variables to prevent splitting and gobbling"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2022 11:34:31 +0100
In-Reply-To: <20220413093544.5587-1-abongwabonalais@gmail.com>
References: <20220413093544.5587-1-abongwabonalais@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164317

On Wed, 2022-04-13 at 10:35 +0100, Abongwa Amahnui Bonalais wrote:
> Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> ---
>  scripts/bitbake-prserv-tool | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

I want to suggest a little bit of caution with the direction these changes are
going.

Showing the user a clear error if that have spaces in a build path is a good
thing. Making oe-init-build-env handle that correctly is therefore desirable so
we can get the proper error from bitbake. This is likely the entry point most
users would find (toaster is another)

Since we don't support spaces in build paths and we're unlikely to do so given
that autotools can't, I'm not sure we want to go through too many of our scripts
doing this kind of change though. Most users would use the prserv tool as an
initial introduction to the project.

We did already see potential problems being introduced in the toaster changes on
the bitbake list and I do worry about potential regressions.

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAEDC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:41:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.10466.1637170860528315557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fQFwHtn6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id t30so6176627wra.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u2zjoF3+Dvwn2sWuQ7td19tGxW1UrNZpmCbj/IG+uL0=;
        b=fQFwHtn6EsgADWXuf6aYztmZ0xqdbsCXEkLaE2jN+JxciZOn4e2bVmP31lAIsiIck6
         /MfafAmCCVZ79ik3g6tWssdKVULWIk50JpF6u3jwQeepTAOFdQUPTU+hrCqxg321oMoF
         hs/Gn+thC+ubYfTjCEei2/cHfV/mtKFGlzz4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u2zjoF3+Dvwn2sWuQ7td19tGxW1UrNZpmCbj/IG+uL0=;
        b=yYlpShR8Pq3zi1TvApIlI3/nocGw9hAuqhlYvr+p5XffD995XdVeS3zct/S9I/WBDl
         NbP0ji6Ac6hffgZacMy4NCoDG65NWp5tY0+7Aq6fFLIGZsK+sO4L3TES7U3pQ2HqdJEm
         sV3smTk7lJC+Vu7rG5E8KGfpqL0jf7O/mk4wspYWmWAXTy70TKKYD8XLDMReURQ0Wgyz
         sTJjUTtoM8oRp6CROPV5LgxNPvnQZNOCuzhSTN9cjdTjyo6Cia1KKVde5dwMdZdT8inA
         spulz/VgctyH/FyJWAN2j3J6Z7PlYpEed1yazcfEi06ykL04ni9jO+BD2PR9dZtWOuco
         iagw==
X-Gm-Message-State: AOAM530KvEslwtVfGgCctzwSv3M3+MQCW/W20ygMc+Zzipp/2Ym36cJr
	SfKvasQ9UDFyvGFheh2XL7lFYfOQIN72XQ==
X-Google-Smtp-Source: 
 ABdhPJyPLqYVkjoF2BrbeFjfPKVVgcm9b5leLhgDGMivXVcmAP+V/5QSzjwiKElrA76zdEzW7yqaIQ==
X-Received: by 2002:adf:df0d:: with SMTP id
 y13mr22573197wrl.176.1637170858916;
        Wed, 17 Nov 2021 09:40:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:41f4:5ebc:325d:efc3?
 ([2001:8b0:aba:5f3c:41f4:5ebc:325d:efc3])
        by smtp.gmail.com with ESMTPSA id
 m22sm405003wmq.38.2021.11.17.09.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:40:58 -0800 (PST)
Message-ID: 
 <24a38d0e0d0dddc136c3840cecd18c88236d9b20.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/8] volatile-binds: add nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 17:40:57 +0000
In-Reply-To: <20211117123201.111905-6-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211117123201.111905-6-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:41:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158440

On Wed, 2021-11-17 at 12:31 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-core/volatile-binds/volatile-binds.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
> index 66e28f4fc9..0f27353031 100644
> --- a/meta/recipes-core/volatile-binds/volatile-binds.bb
> +++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
> @@ -84,3 +84,5 @@ do_install[dirs] = "${WORKDIR}"
>  do_install_append_class-nativesdk () {
>      rm -rf ${D}/var
>  }
> +
> +BBCLASSEXTEND = "nativesdk"

Is there any useful component left in volatile-binds in the SDK case? I don't
think we should be extending this as the recipe makes no sense. Rather nativesdk
variants probably shouldn't be depending upon it?

Cheers,

Richard



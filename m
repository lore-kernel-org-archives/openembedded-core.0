Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.155.1616625982985394305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 15:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=by5u4O65;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id v4so348211wrp.13
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nIlz/Sec1yusWOCZ4SQJFvhgL47u2O3R1+15JGxtcRk=;
        b=by5u4O650ndHfi1XE6jBgMaXb1cyrh/TEWqH7HvlCMhpbAtmOMlAa5Kv5VI7o2PVOI
         LtxazXlbkT+IbElk9tXMBw9rmeEMYKAiZYn5rXiL/QjmM3PC2ckGPXvrRFIl0o5XQrGX
         B6ZCbbKw4XckXlc5UGZCLEqOm6erk1BHZpiAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nIlz/Sec1yusWOCZ4SQJFvhgL47u2O3R1+15JGxtcRk=;
        b=Db3beD6fTmmis2SPIdAy4oPnLhJ25+ts8Ooq4kCm+0TcLQzJJIB5fV/cQb2oXWUama
         8nivME2hFMLF5+wl9wc4CG+HszKDnXpLutwqpbuKfkEe6rNGcem8L+rYnMcgKLlSJt7+
         ZU0S91hZtGuuqy9O/oK2PT73Jw2gaRvE0vtcS2/TDYwVg3M4eRv5JN1P9yz54F2dAYAq
         /1mo7W6gfN+NUw8FWb2wTP4p5nASdwXx/WIFHk3icPablxpC9Jw3sa7G3PWez53SkZP2
         Q1LGkm5Zi9BxRgm5B5VZTIr4zRpwUGn6sbc7xJbRcLvwDl6pUykYp1UtIiIpZy15R80w
         rxBA==
X-Gm-Message-State: AOAM530ItlzkTg9SdbMRmCKeSZylg1efKWLrCsmwzM5AKxP3EnfrOdb9
	mtERSI2SLjJv6qIePa1RHc/OiQ==
X-Google-Smtp-Source: ABdhPJwv5lxKX1Edg8RRVQIecY5HW4vMA0zkfgs+5UzrXVO0NmL2eiMhYp+TfnloCW69fVlvgaq57w==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr5652125wrv.329.1616625981301;
        Wed, 24 Mar 2021 15:46:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id h21sm3838638wmp.10.2021.03.24.15.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 15:46:21 -0700 (PDT)
Message-ID: <17537f6de5412295e31f8130acb0aec0e4fdebf7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux-uuid: include /usr/lib/debug in FILES_util-linux-libuuid-dbg
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: scott.branden@broadcom.com
Date: Wed, 24 Mar 2021 22:46:20 +0000
In-Reply-To: <20210324170722.566059-1-luca.boccassi@gmail.com>
References: <20210324170722.566059-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 17:07 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Apparently some users have /usr/lib/debug instead of /usr/lib/.debug
> so add it to the FILES matching.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> index 65e4d23b7e..1ff37a4dcb 100644
> --- a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> @@ -11,7 +11,7 @@ PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-staticd
>  FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
>  FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
>  FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.a"
> -FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
> +FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug ${libdir}/debug"

Is there a reason the recipe is called "util-linux-uuid" yet it wants 
to be "util-linux-libuuid"? I suspect if we can rename it, some of
this juggling goes away. 

Ideally recipes shouldn't be needing to override the defaults for 
PACKAGES and FILES. I just tried a test build with a lot of this stripped
away and its seeing issues with the -dev package but even adding an
RPROVIDES for that would be better than all the above overrides...

Cheers,

Richard



Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.8145.1609941385480454760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 05:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EjXFCtNk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id t16so2530933wra.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 05:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=R+GtCfcMmYt32F9B6OYsrFOqHFdlZ0DCEH2anZuOTKo=;
        b=EjXFCtNkcb0qfzOO1SDXD1P+Aa4/dlcG9D0aUDOiDIB2tcGqibjeCiSCdOK50AVezS
         8N7VVgd2d73mzB29ZPvn+zEq6WYo39/T8xOnCM9ZxZJE+3t7kqtPXenz7MpZseeURy3G
         jlYguPVX8dyY4SgshqoJl8yM4UM3mketMz3Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R+GtCfcMmYt32F9B6OYsrFOqHFdlZ0DCEH2anZuOTKo=;
        b=fimItRTGS6iO1f4apyKdGt9w4AoVyy824Aujus7be8BqmgOTogFduWAAZL75P8C8+X
         etLHm+wm1VyOYshveVC1Tmw4AZVo6EED5onflazxbcNOXsrrhGQ/0+aLhTLcjVnsy34h
         R3GUoLWBYqUGYifrgFni1AYNyM95I9oUEyjum3b+s05MkmBxtEyKYX/sQO8NIOeTe7I3
         grAX9QNm6MsnFHO3hHJcjVEVioE0tetCZHrV9aU/mNUOWy0JY4ds8F0HMNfZ3A8lQGjK
         GqnNvVRylnbEL2DOd9GyS6x0cdeTmghfGfv/r3ecM0J0evrVEHUqXUZa+9ZBOXOMDhqq
         YvVw==
X-Gm-Message-State: AOAM530/AwR32JoMG2xuvustQ2iURU7Nasc5BgcxgNv4QmFhTIkjLghG
	62XcF1TRSSvIMpQOG6kfHeqkvw==
X-Google-Smtp-Source: ABdhPJwzMYc/QrrA45tsJ2P+/OhLfcqXmM/iF8DouxUlxOyq5kHOWXzl6vMtCWSe2Jls0ei+hlDWiw==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr4384881wrj.325.1609941383746;
        Wed, 06 Jan 2021 05:56:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f056:12a7:edca:60f8? ([2001:8b0:aba:5f3c:f056:12a7:edca:60f8])
        by smtp.gmail.com with ESMTPSA id w8sm3142695wrl.91.2021.01.06.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:56:23 -0800 (PST)
Message-ID: <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 06 Jan 2021 13:56:22 +0000
In-Reply-To: <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
	 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-06 at 04:09 -0800, Robert Yang wrote:
> Add it to buildtools-tarball so that there will be a unify version of ccache,
> which can help avoid various compile errors.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 9da81d55235..2ffdd7c7253 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>      nativesdk-rpcsvc-proto \
>      nativesdk-patch \
>      nativesdk-mtools \
> +    nativesdk-ccache \
>      "

My view is we should not start to ship ccache with buildtools by
default. Its something that the user can install if they want/need it
but its not essential, required or helps much in standard builds (which
would reuse from sstate if built previously).

Cheers,

Richard


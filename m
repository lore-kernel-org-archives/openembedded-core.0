Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.95.1629562592272857593
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 09:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SpGViVd+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id f5so18746668wrm.13
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=l0Jbe6dHylTUZGmH4yTuGMJR3oxoEd2cE/oC11eP7vg=;
        b=SpGViVd+sPpaghQfzmyE8cTWEu66Wro+E3YwNZ3L1Q+SUPVNd33XyGTjWyZtJ9JDXT
         cvTb8mDg7IejIi0taTPCFU+myv7i1KAjieQX7cwWUM3ZjeUvZHqsBkiXuPISuvXdC519
         lOaHzshq5vEPgCqeu5bhumNp/jqf7drSe/S8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=l0Jbe6dHylTUZGmH4yTuGMJR3oxoEd2cE/oC11eP7vg=;
        b=MORJngJDzBitPF0ehD8o4d5hOH8uomvUT2egPnceYcQdwT92KkwrtJ2YXKcUjxCQFJ
         Xt0npMVlTCW9SUWt8dFSoYpG0uYdmqssricCFOL2uiQTeqLqonlR4BjS7sRobmPyYvzR
         x7YiMWFQfrY8++kq6ZuGzwEsf9DkxlarHcN4mbdthdUqR0r4x9ZrFusIYQlSEKWgmEK4
         vXCLy+usYsmOOFRV/r7E64YSAYgtS+LCqlCIqWgY7tYULIRoulZRvgJA/v8WpNCIzveQ
         sRMqt8/0SAEfU7SKL9kmJ0VEixe3VlcVf096HKNxQHOTdhGLP1uwGqn6kNeBm6erjpA3
         EwOw==
X-Gm-Message-State: AOAM531Qj+o7YBBXINNzz8uuqwo+pp9+R1+DbR/G1/5MZSIPFKCjKm8I
	4kJk84Ae/9Kl1KmXNXFN3vQq2ugkJzdg8Q==
X-Google-Smtp-Source: ABdhPJxAPX4PRraXnUw4C2sx6/cvA576lqrOgu98LuJ9wlPXdC/cDDqO1rcH3RzC4ge0Aml+fGg4mQ==
X-Received: by 2002:adf:e788:: with SMTP id n8mr4599856wrm.214.1629562590643;
        Sat, 21 Aug 2021 09:16:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:789f:44c2:e113:215? ([2001:8b0:aba:5f3c:789f:44c2:e113:215])
        by smtp.gmail.com with ESMTPSA id d4sm9916313wrc.34.2021.08.21.09.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 09:16:30 -0700 (PDT)
Message-ID: <cc50d1bb5964e56cf3c1737cd892d3df36cb4574.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] rng-tools: Upgrade to 6.14
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 21 Aug 2021 17:16:27 +0100
In-Reply-To: <20210820080412.23461-1-mingli.yu@windriver.com>
References: <169CF3472372B2C5.3513@lists.openembedded.org>
	 <20210820080412.23461-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-20 at 16:04 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb} (97%)
> 
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.13.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
> similarity index 97%
> rename from meta/recipes-support/rng-tools/rng-tools_6.13.bb
> rename to meta/recipes-support/rng-tools/rng-tools_6.14.bb
> index 84dbc76855..ff6c5e98d7 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.13.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
> @@ -14,7 +14,7 @@ SRC_URI = "\
>      file://default \
>      file://rngd.service \
>  "
> -SRCREV = "d8dac0e8bede73e42b3d59f3b48c662ad0032e8c"
> +SRCREV = "c16176d3800b91f4d016b66733b384493b06f294"
>  
>  S = "${WORKDIR}/git"
>  

Doesn't work on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/3851
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3862

Cheers,

Richard


Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.1524.1598397578374768351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 16:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jl71Mj2C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id s20so2724wmj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 16:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iVqAChOWwbUPRPd1UujB0sXVBX4P1FOjcXxskzVm5HI=;
        b=Jl71Mj2CK4KWAJo7+dW+nj2kTmAMLchqc8qNJRphJ4waCHLhKOdRW+nhUrU2PlJXaK
         TSl8/jLO1+1HNqhEp7WfGpYPf5HtCeBszAYKtMGqcY9mOPKUaC216GT99HHN/xwrDETP
         PPYGrMbKrggy0vDe4ogFtImVafZ48mgWpv6bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iVqAChOWwbUPRPd1UujB0sXVBX4P1FOjcXxskzVm5HI=;
        b=EwFpmZYn9/l6GmlHX/LNbaN9t98nkK/m71R4YjINJKNjpZ2a6cpGy8ZfagQOahpFVE
         QETCf/A3SyBJC7/frEsBqtPjEddwT/sDfcEDOyDd+Jj8eXPo8cnXWVBMdM+sCf9qSSW5
         mxWV23nmo5iblC2k7L2aFPH/mx/5EULer3GgXktLp+yjn5AxTO7tpPHV6ZdCNTCwn7B0
         5SnUfkBNN8Fe/4nZ3RW0qDCT+T+OrtkEK5frsxiaz1r/eyFUVOoLSRuJRkwrhezw/DAF
         dmpPvdhYHPTM8yaVVfnnkSkuTxI/kRIqUPkWgFgDtjicLdSO1zDUH1t8JceEcT3myMFW
         1tnQ==
X-Gm-Message-State: AOAM530m9f5tlY8IlblRBImRz5APt6CSvT6y/AFIGLNfDYsVPq5fqCV4
	GCQRyXKIJf+cln0TQTcuZINCpz0XvbLIdzHa
X-Google-Smtp-Source: ABdhPJyVKhwmG62R/MzxQA6pAPIwqsyFLVQAGZJJpJwmKnIizdG1x7IRzkXOOJCbo4P7EjBwOmN8eQ==
X-Received: by 2002:a05:600c:230e:: with SMTP id 14mr4004052wmo.142.1598397576309;
        Tue, 25 Aug 2020 16:19:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id j11sm791684wrq.69.2020.08.25.16.19.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 16:19:35 -0700 (PDT)
Message-ID: <7c1e1ad4adecd1e2faf0c4a9e96f1e25b3f65a6e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] local.conf.sample: Document memory resident bitbake
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2020 00:19:34 +0100
In-Reply-To: <162EA2592F13CDD9.27554@lists.openembedded.org>
References: <162EA2592F13CDD9.27554@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-25 at 23:10 +0100, Richard Purdie via lists.openembedded.org wrote:
> Add an example of how to enable this to local.conf.sample
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  {meta => metay}/conf/local.conf.sample | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  rename {meta => metay}/conf/local.conf.sample (96%)
> 
> diff --git a/meta/conf/local.conf.sample b/metay/conf/local.conf.sample
> similarity index 96%
> rename from meta/conf/local.conf.sample
> rename to metay/conf/local.conf.sample
> index 783d2c4c16d..efb3100d9bd 100644
> --- a/meta/conf/local.conf.sample
> +++ b/metay/conf/local.conf.sample
> @@ -226,6 +226,16 @@ PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
>  #BB_HASHSERVE = "auto"
>  #BB_SIGNATURE_HANDLER = "OEEquivHash"
>  
> +#
> +# Memory Resident Bitbake
> +#
> +# Bitbake's server component can stay in memory after the UI for the current command
> +# has completed. This means subsequent commands can run faster since there is no need
> +# for bitbake to reload cache files and so on. Number is in seconds, after which the
> +# server will shut down.
> +#
> +BB_SERVER_TIMEOUT = "60"

This is meant to have this commented, I've fixed the patches queued.

Cheers,

Richard


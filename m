Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.532.1614289647389929173
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WD4b9+ba;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id b18so201618wrn.6
        for <Openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bmopQyUFevH3l/LWQo7AeX1zLNPIApyjsZQZNH2gBAU=;
        b=WD4b9+baOJpadI8ldxDZRuyYcB1rbkkAY6pVcZxnIpIuZntmIro8eeG52mBNv6XvGp
         pjipO9uSj2ypq8yzE8Hp93tAFTzkV3FlcKS++5HmTU9UZ6FO3BtqrXY6bPmIZpPZRPny
         DIna7juQ2DHMETWcqEY7Sqzaj+od/mrGW0zTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bmopQyUFevH3l/LWQo7AeX1zLNPIApyjsZQZNH2gBAU=;
        b=H2LQbNDEERzv5rinC3W8ZSBzxAQKufdOr/sFF/ud8EC4AMyGvllQPklLCOHV6tLRQ6
         xVwkyJhkhLb2AAvnnQPMg9693YTqninao186SUTvIcNSPbRqfRcFPbeA14wyrjTQCObo
         J19FRNGLuZmWbU3wuAr1EctnX8zP+o3Ti/h05Y7RarYsjlURaPBomUv5fUyXNg/eULTX
         6PCYwv0HQwTf3TlL3VP6bzmpVmYmLSPWRezQWv7ui/evNrsTdjIjfIBZ7AJ++ScV94Xz
         //4iFGS6pTTTW7prEvtVVsihu2XjSxqUyZ8J/517FXd5eICdzludBYL994WBiYiTsC57
         i/6w==
X-Gm-Message-State: AOAM531kqOoXaWCQvxb3W+WGLUeVc7gQs+5PqjxNGbTzELh8zkkO2TP2
	QMFSsi3nBV8MR00nlI2qty0N7g==
X-Google-Smtp-Source: ABdhPJwOW8Rja2Ce390kADM6Um5jxz8Q5W8AbzqIFU4XusvgtrLwhxYYymy+LQD6NdEXYc4pdAMijQ==
X-Received: by 2002:a5d:430a:: with SMTP id h10mr40430wrq.162.1614289645945;
        Thu, 25 Feb 2021 13:47:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id y10sm2027086wrl.19.2021.02.25.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:47:25 -0800 (PST)
Message-ID: <785033d6a9db81dbc5e4241451d103c5e226f8b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] systemd-container: sort RRECOMMENDS alphabetically
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vivien Didelot <vivien.didelot@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2021 21:47:24 +0000
In-Reply-To: <20210225213848.2744615-1-vdidelot@pbsc.com>
References: <20210225213848.2744615-1-vdidelot@pbsc.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-25 at 16:38 -0500, Vivien Didelot wrote:
> Sort packages in RRECOMMENDS_${PN}-container alphabetically to avoid
> subjective sorting and ease future additions.
> 
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> ---
>  meta/recipes-core/systemd/systemd_244.5.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
> index 70700820d7..aaed047e63 100644
> --- a/meta/recipes-core/systemd/systemd_244.5.bb
> +++ b/meta/recipes-core/systemd/systemd_244.5.bb
> @@ -447,9 +447,9 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
>                          "
>  
> 
> 
> 
>  RRECOMMENDS_${PN}-container += "\
> -                         ${PN}-journal-upload \
> -                         ${PN}-journal-remote \
>                           ${PN}-journal-gatewayd \
> +                         ${PN}-journal-remote \
> +                         ${PN}-journal-upload \
>                          "
>  
> 

These look like ok changes to me but they're against an older version of
systemd, we currently have 247.3 in master. Would you be able to send
against that version please?

Cheers,

Richard


